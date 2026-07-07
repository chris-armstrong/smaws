open Types
open Service_metadata
open Query_deserializers
open Query_serializers

module AddRoleToDBCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBClusterRoleAlreadyExistsFault _ -> "com.amazonaws.rds#DBClusterRoleAlreadyExistsFault"
    | `DBClusterRoleQuotaExceededFault _ -> "com.amazonaws.rds#DBClusterRoleQuotaExceededFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterRoleAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_role_already_exists_fault_of_xml
        with
        | Ok s -> `DBClusterRoleAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterRoleQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_role_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBClusterRoleQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : add_role_to_db_cluster_message) =
    let fields = add_role_to_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AddRoleToDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : add_role_to_db_cluster_message) =
    let fields = add_role_to_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AddRoleToDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module AddRoleToDBInstance = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBInstanceRoleAlreadyExistsFault _ -> "com.amazonaws.rds#DBInstanceRoleAlreadyExistsFault"
    | `DBInstanceRoleQuotaExceededFault _ -> "com.amazonaws.rds#DBInstanceRoleQuotaExceededFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceRoleAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_role_already_exists_fault_of_xml
        with
        | Ok s -> `DBInstanceRoleAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceRoleQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_role_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBInstanceRoleQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : add_role_to_db_instance_message) =
    let fields = add_role_to_db_instance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AddRoleToDBInstance"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : add_role_to_db_instance_message) =
    let fields = add_role_to_db_instance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AddRoleToDBInstance"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module AddSourceIdentifierToSubscription = struct
  let error_to_string = function
    | `SourceNotFoundFault _ -> "com.amazonaws.rds#SourceNotFoundFault"
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.rds#SubscriptionNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "SourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:source_not_found_fault_of_xml
        with
        | Ok s -> `SourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubscriptionNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subscription_not_found_fault_of_xml
        with
        | Ok s -> `SubscriptionNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : add_source_identifier_to_subscription_message) =
    let fields = add_source_identifier_to_subscription_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AddSourceIdentifierToSubscription"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:add_source_identifier_to_subscription_result_of_xml ~error_deserializer

  let request_with_metadata context (request : add_source_identifier_to_subscription_message) =
    let fields = add_source_identifier_to_subscription_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AddSourceIdentifierToSubscription"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:add_source_identifier_to_subscription_result_of_xml ~error_deserializer
end

module AddTagsToResource = struct
  let error_to_string = function
    | `BlueGreenDeploymentNotFoundFault _ -> "com.amazonaws.rds#BlueGreenDeploymentNotFoundFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBProxyEndpointNotFoundFault _ -> "com.amazonaws.rds#DBProxyEndpointNotFoundFault"
    | `DBProxyNotFoundFault _ -> "com.amazonaws.rds#DBProxyNotFoundFault"
    | `DBProxyTargetGroupNotFoundFault _ -> "com.amazonaws.rds#DBProxyTargetGroupNotFoundFault"
    | `DBShardGroupNotFoundFault _ -> "com.amazonaws.rds#DBShardGroupNotFoundFault"
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBSnapshotNotFoundFault"
    | `DBSnapshotTenantDatabaseNotFoundFault _ ->
        "com.amazonaws.rds#DBSnapshotTenantDatabaseNotFoundFault"
    | `IntegrationNotFoundFault _ -> "com.amazonaws.rds#IntegrationNotFoundFault"
    | `InvalidDBClusterEndpointStateFault _ ->
        "com.amazonaws.rds#InvalidDBClusterEndpointStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `TenantDatabaseNotFoundFault _ -> "com.amazonaws.rds#TenantDatabaseNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BlueGreenDeploymentNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:blue_green_deployment_not_found_fault_of_xml
        with
        | Ok s -> `BlueGreenDeploymentNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyEndpointNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_endpoint_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyEndpointNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyTargetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_target_group_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyTargetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBShardGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_shard_group_not_found_fault_of_xml
        with
        | Ok s -> `DBShardGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSnapshotTenantDatabaseNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_tenant_database_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotTenantDatabaseNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IntegrationNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_not_found_fault_of_xml
        with
        | Ok s -> `IntegrationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterEndpointStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_endpoint_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterEndpointStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TenantDatabaseNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tenant_database_not_found_fault_of_xml
        with
        | Ok s -> `TenantDatabaseNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : add_tags_to_resource_message) =
    let fields = add_tags_to_resource_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AddTagsToResource"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : add_tags_to_resource_message) =
    let fields = add_tags_to_resource_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AddTagsToResource"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module ApplyPendingMaintenanceAction = struct
  let error_to_string = function
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.rds#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_fault_of_xml
        with
        | Ok s -> `ResourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : apply_pending_maintenance_action_message) =
    let fields = apply_pending_maintenance_action_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ApplyPendingMaintenanceAction"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:apply_pending_maintenance_action_result_of_xml ~error_deserializer

  let request_with_metadata context (request : apply_pending_maintenance_action_message) =
    let fields = apply_pending_maintenance_action_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ApplyPendingMaintenanceAction"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:apply_pending_maintenance_action_result_of_xml ~error_deserializer
end

module AuthorizeDBSecurityGroupIngress = struct
  let error_to_string = function
    | `AuthorizationAlreadyExistsFault _ -> "com.amazonaws.rds#AuthorizationAlreadyExistsFault"
    | `AuthorizationQuotaExceededFault _ -> "com.amazonaws.rds#AuthorizationQuotaExceededFault"
    | `DBSecurityGroupNotFoundFault _ -> "com.amazonaws.rds#DBSecurityGroupNotFoundFault"
    | `InvalidDBSecurityGroupStateFault _ -> "com.amazonaws.rds#InvalidDBSecurityGroupStateFault"
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
    | "AuthorizationQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_quota_exceeded_fault_of_xml
        with
        | Ok s -> `AuthorizationQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_security_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : authorize_db_security_group_ingress_message) =
    let fields = authorize_db_security_group_ingress_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AuthorizeDBSecurityGroupIngress"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:authorize_db_security_group_ingress_result_of_xml ~error_deserializer

  let request_with_metadata context (request : authorize_db_security_group_ingress_message) =
    let fields = authorize_db_security_group_ingress_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AuthorizeDBSecurityGroupIngress"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:authorize_db_security_group_ingress_result_of_xml ~error_deserializer
end

module BacktrackDBCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : backtrack_db_cluster_message) =
    let fields = backtrack_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"BacktrackDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_backtrack_of_xml ~error_deserializer

  let request_with_metadata context (request : backtrack_db_cluster_message) =
    let fields = backtrack_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"BacktrackDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_backtrack_of_xml ~error_deserializer
end

module CancelExportTask = struct
  let error_to_string = function
    | `ExportTaskNotFoundFault _ -> "com.amazonaws.rds#ExportTaskNotFoundFault"
    | `InvalidExportTaskStateFault _ -> "com.amazonaws.rds#InvalidExportTaskStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ExportTaskNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:export_task_not_found_fault_of_xml
        with
        | Ok s -> `ExportTaskNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidExportTaskStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_export_task_state_fault_of_xml
        with
        | Ok s -> `InvalidExportTaskStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : cancel_export_task_message) =
    let fields = cancel_export_task_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CancelExportTask"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:export_task_of_xml ~error_deserializer

  let request_with_metadata context (request : cancel_export_task_message) =
    let fields = cancel_export_task_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CancelExportTask"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:export_task_of_xml ~error_deserializer
end

module CopyDBClusterParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupAlreadyExistsFault _ ->
        "com.amazonaws.rds#DBParameterGroupAlreadyExistsFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | `DBParameterGroupQuotaExceededFault _ ->
        "com.amazonaws.rds#DBParameterGroupQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBParameterGroupAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_already_exists_fault_of_xml
        with
        | Ok s -> `DBParameterGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBParameterGroupQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBParameterGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : copy_db_cluster_parameter_group_message) =
    let fields = copy_db_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CopyDBClusterParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:copy_db_cluster_parameter_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : copy_db_cluster_parameter_group_message) =
    let fields = copy_db_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CopyDBClusterParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:copy_db_cluster_parameter_group_result_of_xml ~error_deserializer
end

module CopyDBClusterSnapshot = struct
  let error_to_string = function
    | `DBClusterSnapshotAlreadyExistsFault _ ->
        "com.amazonaws.rds#DBClusterSnapshotAlreadyExistsFault"
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBClusterSnapshotNotFoundFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.rds#InvalidDBClusterSnapshotStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.rds#SnapshotQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterSnapshotAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `DBClusterSnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterSnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterSnapshotStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `SnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : copy_db_cluster_snapshot_message) =
    let fields = copy_db_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CopyDBClusterSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:copy_db_cluster_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : copy_db_cluster_snapshot_message) =
    let fields = copy_db_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CopyDBClusterSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:copy_db_cluster_snapshot_result_of_xml ~error_deserializer
end

module CopyDBParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupAlreadyExistsFault _ ->
        "com.amazonaws.rds#DBParameterGroupAlreadyExistsFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | `DBParameterGroupQuotaExceededFault _ ->
        "com.amazonaws.rds#DBParameterGroupQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBParameterGroupAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_already_exists_fault_of_xml
        with
        | Ok s -> `DBParameterGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBParameterGroupQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBParameterGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : copy_db_parameter_group_message) =
    let fields = copy_db_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CopyDBParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:copy_db_parameter_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : copy_db_parameter_group_message) =
    let fields = copy_db_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CopyDBParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:copy_db_parameter_group_result_of_xml ~error_deserializer
end

module CopyDBSnapshot = struct
  let error_to_string = function
    | `CustomAvailabilityZoneNotFoundFault _ ->
        "com.amazonaws.rds#CustomAvailabilityZoneNotFoundFault"
    | `DBSnapshotAlreadyExistsFault _ -> "com.amazonaws.rds#DBSnapshotAlreadyExistsFault"
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBSnapshotNotFoundFault"
    | `InvalidDBSnapshotStateFault _ -> "com.amazonaws.rds#InvalidDBSnapshotStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.rds#SnapshotQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CustomAvailabilityZoneNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_availability_zone_not_found_fault_of_xml
        with
        | Ok s -> `CustomAvailabilityZoneNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSnapshotAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `DBSnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSnapshotState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `SnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : copy_db_snapshot_message) =
    let fields = copy_db_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CopyDBSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:copy_db_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : copy_db_snapshot_message) =
    let fields = copy_db_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CopyDBSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:copy_db_snapshot_result_of_xml ~error_deserializer
end

module CopyOptionGroup = struct
  let error_to_string = function
    | `OptionGroupAlreadyExistsFault _ -> "com.amazonaws.rds#OptionGroupAlreadyExistsFault"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.rds#OptionGroupNotFoundFault"
    | `OptionGroupQuotaExceededFault _ -> "com.amazonaws.rds#OptionGroupQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "OptionGroupAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_already_exists_fault_of_xml
        with
        | Ok s -> `OptionGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OptionGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_not_found_fault_of_xml
        with
        | Ok s -> `OptionGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OptionGroupQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `OptionGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : copy_option_group_message) =
    let fields = copy_option_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CopyOptionGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:copy_option_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : copy_option_group_message) =
    let fields = copy_option_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CopyOptionGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:copy_option_group_result_of_xml ~error_deserializer
end

module CreateBlueGreenDeployment = struct
  let error_to_string = function
    | `BlueGreenDeploymentAlreadyExistsFault _ ->
        "com.amazonaws.rds#BlueGreenDeploymentAlreadyExistsFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.rds#DBClusterParameterGroupNotFoundFault"
    | `DBClusterQuotaExceededFault _ -> "com.amazonaws.rds#DBClusterQuotaExceededFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | `InstanceQuotaExceededFault _ -> "com.amazonaws.rds#InstanceQuotaExceededFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `SourceClusterNotSupportedFault _ -> "com.amazonaws.rds#SourceClusterNotSupportedFault"
    | `SourceDatabaseNotSupportedFault _ -> "com.amazonaws.rds#SourceDatabaseNotSupportedFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.rds#StorageQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BlueGreenDeploymentAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:blue_green_deployment_already_exists_fault_of_xml
        with
        | Ok s -> `BlueGreenDeploymentAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBClusterQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InstanceQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:instance_quota_exceeded_fault_of_xml
        with
        | Ok s -> `InstanceQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SourceClusterNotSupportedFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:source_cluster_not_supported_fault_of_xml
        with
        | Ok s -> `SourceClusterNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SourceDatabaseNotSupportedFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:source_database_not_supported_fault_of_xml
        with
        | Ok s -> `SourceDatabaseNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_quota_exceeded_fault_of_xml
        with
        | Ok s -> `StorageQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_blue_green_deployment_request) =
    let fields = create_blue_green_deployment_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateBlueGreenDeployment"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_blue_green_deployment_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_blue_green_deployment_request) =
    let fields = create_blue_green_deployment_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateBlueGreenDeployment"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_blue_green_deployment_response_of_xml ~error_deserializer
end

module CreateCustomDBEngineVersion = struct
  let error_to_string = function
    | `CreateCustomDBEngineVersionFault _ -> "com.amazonaws.rds#CreateCustomDBEngineVersionFault"
    | `CustomDBEngineVersionAlreadyExistsFault _ ->
        "com.amazonaws.rds#CustomDBEngineVersionAlreadyExistsFault"
    | `CustomDBEngineVersionNotFoundFault _ ->
        "com.amazonaws.rds#CustomDBEngineVersionNotFoundFault"
    | `CustomDBEngineVersionQuotaExceededFault _ ->
        "com.amazonaws.rds#CustomDBEngineVersionQuotaExceededFault"
    | `Ec2ImagePropertiesNotSupportedFault _ ->
        "com.amazonaws.rds#Ec2ImagePropertiesNotSupportedFault"
    | `InvalidCustomDBEngineVersionStateFault _ ->
        "com.amazonaws.rds#InvalidCustomDBEngineVersionStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CreateCustomDBEngineVersionFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:create_custom_db_engine_version_fault_of_xml
        with
        | Ok s -> `CreateCustomDBEngineVersionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CustomDBEngineVersionAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_db_engine_version_already_exists_fault_of_xml
        with
        | Ok s -> `CustomDBEngineVersionAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CustomDBEngineVersionNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_db_engine_version_not_found_fault_of_xml
        with
        | Ok s -> `CustomDBEngineVersionNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CustomDBEngineVersionQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_db_engine_version_quota_exceeded_fault_of_xml
        with
        | Ok s -> `CustomDBEngineVersionQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "Ec2ImagePropertiesNotSupportedFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:ec2_image_properties_not_supported_fault_of_xml
        with
        | Ok s -> `Ec2ImagePropertiesNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCustomDBEngineVersionStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_custom_db_engine_version_state_fault_of_xml
        with
        | Ok s -> `InvalidCustomDBEngineVersionStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_custom_db_engine_version_message) =
    let fields = create_custom_db_engine_version_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateCustomDBEngineVersion"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_engine_version_of_xml ~error_deserializer

  let request_with_metadata context (request : create_custom_db_engine_version_message) =
    let fields = create_custom_db_engine_version_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateCustomDBEngineVersion"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_engine_version_of_xml ~error_deserializer
end

module CreateDBCluster = struct
  let error_to_string = function
    | `DBClusterAlreadyExistsFault _ -> "com.amazonaws.rds#DBClusterAlreadyExistsFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.rds#DBClusterParameterGroupNotFoundFault"
    | `DBClusterQuotaExceededFault _ -> "com.amazonaws.rds#DBClusterQuotaExceededFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.rds#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.rds#DBSubnetGroupNotFoundFault"
    | `DomainNotFoundFault _ -> "com.amazonaws.rds#DomainNotFoundFault"
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.rds#GlobalClusterNotFoundFault"
    | `InsufficientDBInstanceCapacityFault _ ->
        "com.amazonaws.rds#InsufficientDBInstanceCapacityFault"
    | `InsufficientStorageClusterCapacityFault _ ->
        "com.amazonaws.rds#InsufficientStorageClusterCapacityFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `InvalidDBSubnetGroupFault _ -> "com.amazonaws.rds#InvalidDBSubnetGroupFault"
    | `InvalidDBSubnetGroupStateFault _ -> "com.amazonaws.rds#InvalidDBSubnetGroupStateFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.rds#InvalidGlobalClusterStateFault"
    | `InvalidSubnet _ -> "com.amazonaws.rds#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.rds#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupported _ -> "com.amazonaws.rds#NetworkTypeNotSupported"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.rds#OptionGroupNotFoundFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.rds#StorageQuotaExceededFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.rds#StorageTypeNotSupportedFault"
    | `VpcEncryptionControlViolationException _ ->
        "com.amazonaws.rds#VpcEncryptionControlViolationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_already_exists_fault_of_xml
        with
        | Ok s -> `DBClusterAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBClusterQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupDoesNotCoverEnoughAZs" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_does_not_cover_enough_a_zs_of_xml
        with
        | Ok s -> `DBSubnetGroupDoesNotCoverEnoughAZs s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DomainNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:domain_not_found_fault_of_xml
        with
        | Ok s -> `DomainNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "GlobalClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_cluster_not_found_fault_of_xml
        with
        | Ok s -> `GlobalClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientDBInstanceCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_db_instance_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientDBInstanceCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientStorageClusterCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_storage_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientStorageClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSubnetGroupFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_subnet_group_fault_of_xml
        with
        | Ok s -> `InvalidDBSubnetGroupFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSubnetGroupStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_subnet_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSubnetGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NetworkTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:network_type_not_supported_of_xml
        with
        | Ok s -> `NetworkTypeNotSupported s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OptionGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_not_found_fault_of_xml
        with
        | Ok s -> `OptionGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_quota_exceeded_fault_of_xml
        with
        | Ok s -> `StorageQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_type_not_supported_fault_of_xml
        with
        | Ok s -> `StorageTypeNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "VpcEncryptionControlViolationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:vpc_encryption_control_violation_exception_of_xml
        with
        | Ok s -> `VpcEncryptionControlViolationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_db_cluster_message) =
    let fields = create_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_db_cluster_message) =
    let fields = create_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_cluster_result_of_xml ~error_deserializer
end

module CreateDBClusterEndpoint = struct
  let error_to_string = function
    | `DBClusterEndpointAlreadyExistsFault _ ->
        "com.amazonaws.rds#DBClusterEndpointAlreadyExistsFault"
    | `DBClusterEndpointQuotaExceededFault _ ->
        "com.amazonaws.rds#DBClusterEndpointQuotaExceededFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterEndpointAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_endpoint_already_exists_fault_of_xml
        with
        | Ok s -> `DBClusterEndpointAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterEndpointQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_endpoint_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBClusterEndpointQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_db_cluster_endpoint_message) =
    let fields = create_db_cluster_endpoint_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateDBClusterEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_endpoint_of_xml ~error_deserializer

  let request_with_metadata context (request : create_db_cluster_endpoint_message) =
    let fields = create_db_cluster_endpoint_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateDBClusterEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_endpoint_of_xml ~error_deserializer
end

module CreateDBClusterParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupAlreadyExistsFault _ ->
        "com.amazonaws.rds#DBParameterGroupAlreadyExistsFault"
    | `DBParameterGroupQuotaExceededFault _ ->
        "com.amazonaws.rds#DBParameterGroupQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBParameterGroupAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_already_exists_fault_of_xml
        with
        | Ok s -> `DBParameterGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBParameterGroupQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBParameterGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_db_cluster_parameter_group_message) =
    let fields = create_db_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateDBClusterParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_cluster_parameter_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_db_cluster_parameter_group_message) =
    let fields = create_db_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateDBClusterParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_cluster_parameter_group_result_of_xml ~error_deserializer
end

module CreateDBClusterSnapshot = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBClusterSnapshotAlreadyExistsFault _ ->
        "com.amazonaws.rds#DBClusterSnapshotAlreadyExistsFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.rds#InvalidDBClusterSnapshotStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.rds#SnapshotQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterSnapshotAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `DBClusterSnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterSnapshotStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `SnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_db_cluster_snapshot_message) =
    let fields = create_db_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateDBClusterSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_cluster_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_db_cluster_snapshot_message) =
    let fields = create_db_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateDBClusterSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_cluster_snapshot_result_of_xml ~error_deserializer
end

module CreateDBInstance = struct
  let error_to_string = function
    | `AuthorizationNotFoundFault _ -> "com.amazonaws.rds#AuthorizationNotFoundFault"
    | `BackupPolicyNotFoundFault _ -> "com.amazonaws.rds#BackupPolicyNotFoundFault"
    | `CertificateNotFoundFault _ -> "com.amazonaws.rds#CertificateNotFoundFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBInstanceAlreadyExistsFault _ -> "com.amazonaws.rds#DBInstanceAlreadyExistsFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | `DBSecurityGroupNotFoundFault _ -> "com.amazonaws.rds#DBSecurityGroupNotFoundFault"
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.rds#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.rds#DBSubnetGroupNotFoundFault"
    | `DomainNotFoundFault _ -> "com.amazonaws.rds#DomainNotFoundFault"
    | `InstanceQuotaExceededFault _ -> "com.amazonaws.rds#InstanceQuotaExceededFault"
    | `InsufficientDBInstanceCapacityFault _ ->
        "com.amazonaws.rds#InsufficientDBInstanceCapacityFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidSubnet _ -> "com.amazonaws.rds#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.rds#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupported _ -> "com.amazonaws.rds#NetworkTypeNotSupported"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.rds#OptionGroupNotFoundFault"
    | `ProvisionedIopsNotAvailableInAZFault _ ->
        "com.amazonaws.rds#ProvisionedIopsNotAvailableInAZFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.rds#StorageQuotaExceededFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.rds#StorageTypeNotSupportedFault"
    | `TenantDatabaseQuotaExceededFault _ -> "com.amazonaws.rds#TenantDatabaseQuotaExceededFault"
    | `VpcEncryptionControlViolationException _ ->
        "com.amazonaws.rds#VpcEncryptionControlViolationException"
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
    | "BackupPolicyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:backup_policy_not_found_fault_of_xml
        with
        | Ok s -> `BackupPolicyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CertificateNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:certificate_not_found_fault_of_xml
        with
        | Ok s -> `CertificateNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_already_exists_fault_of_xml
        with
        | Ok s -> `DBInstanceAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_security_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupDoesNotCoverEnoughAZs" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_does_not_cover_enough_a_zs_of_xml
        with
        | Ok s -> `DBSubnetGroupDoesNotCoverEnoughAZs s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DomainNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:domain_not_found_fault_of_xml
        with
        | Ok s -> `DomainNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InstanceQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:instance_quota_exceeded_fault_of_xml
        with
        | Ok s -> `InstanceQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientDBInstanceCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_db_instance_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientDBInstanceCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NetworkTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:network_type_not_supported_of_xml
        with
        | Ok s -> `NetworkTypeNotSupported s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OptionGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_not_found_fault_of_xml
        with
        | Ok s -> `OptionGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ProvisionedIopsNotAvailableInAZFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:provisioned_iops_not_available_in_az_fault_of_xml
        with
        | Ok s -> `ProvisionedIopsNotAvailableInAZFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_quota_exceeded_fault_of_xml
        with
        | Ok s -> `StorageQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_type_not_supported_fault_of_xml
        with
        | Ok s -> `StorageTypeNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TenantDatabaseQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tenant_database_quota_exceeded_fault_of_xml
        with
        | Ok s -> `TenantDatabaseQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "VpcEncryptionControlViolationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:vpc_encryption_control_violation_exception_of_xml
        with
        | Ok s -> `VpcEncryptionControlViolationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_db_instance_message) =
    let fields = create_db_instance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateDBInstance"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_instance_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_db_instance_message) =
    let fields = create_db_instance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateDBInstance"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_instance_result_of_xml ~error_deserializer
end

module CreateDBInstanceReadReplica = struct
  let error_to_string = function
    | `CertificateNotFoundFault _ -> "com.amazonaws.rds#CertificateNotFoundFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBInstanceAlreadyExistsFault _ -> "com.amazonaws.rds#DBInstanceAlreadyExistsFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | `DBSecurityGroupNotFoundFault _ -> "com.amazonaws.rds#DBSecurityGroupNotFoundFault"
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.rds#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupNotAllowedFault _ -> "com.amazonaws.rds#DBSubnetGroupNotAllowedFault"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.rds#DBSubnetGroupNotFoundFault"
    | `DomainNotFoundFault _ -> "com.amazonaws.rds#DomainNotFoundFault"
    | `InstanceQuotaExceededFault _ -> "com.amazonaws.rds#InstanceQuotaExceededFault"
    | `InsufficientDBInstanceCapacityFault _ ->
        "com.amazonaws.rds#InsufficientDBInstanceCapacityFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `InvalidDBSubnetGroupFault _ -> "com.amazonaws.rds#InvalidDBSubnetGroupFault"
    | `InvalidSubnet _ -> "com.amazonaws.rds#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.rds#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupported _ -> "com.amazonaws.rds#NetworkTypeNotSupported"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.rds#OptionGroupNotFoundFault"
    | `ProvisionedIopsNotAvailableInAZFault _ ->
        "com.amazonaws.rds#ProvisionedIopsNotAvailableInAZFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.rds#StorageQuotaExceededFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.rds#StorageTypeNotSupportedFault"
    | `TenantDatabaseQuotaExceededFault _ -> "com.amazonaws.rds#TenantDatabaseQuotaExceededFault"
    | `VpcEncryptionControlViolationException _ ->
        "com.amazonaws.rds#VpcEncryptionControlViolationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CertificateNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:certificate_not_found_fault_of_xml
        with
        | Ok s -> `CertificateNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_already_exists_fault_of_xml
        with
        | Ok s -> `DBInstanceAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_security_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupDoesNotCoverEnoughAZs" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_does_not_cover_enough_a_zs_of_xml
        with
        | Ok s -> `DBSubnetGroupDoesNotCoverEnoughAZs s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupNotAllowedFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_allowed_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotAllowedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DomainNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:domain_not_found_fault_of_xml
        with
        | Ok s -> `DomainNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InstanceQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:instance_quota_exceeded_fault_of_xml
        with
        | Ok s -> `InstanceQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientDBInstanceCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_db_instance_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientDBInstanceCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSubnetGroupFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_subnet_group_fault_of_xml
        with
        | Ok s -> `InvalidDBSubnetGroupFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NetworkTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:network_type_not_supported_of_xml
        with
        | Ok s -> `NetworkTypeNotSupported s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OptionGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_not_found_fault_of_xml
        with
        | Ok s -> `OptionGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ProvisionedIopsNotAvailableInAZFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:provisioned_iops_not_available_in_az_fault_of_xml
        with
        | Ok s -> `ProvisionedIopsNotAvailableInAZFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_quota_exceeded_fault_of_xml
        with
        | Ok s -> `StorageQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_type_not_supported_fault_of_xml
        with
        | Ok s -> `StorageTypeNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TenantDatabaseQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tenant_database_quota_exceeded_fault_of_xml
        with
        | Ok s -> `TenantDatabaseQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "VpcEncryptionControlViolationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:vpc_encryption_control_violation_exception_of_xml
        with
        | Ok s -> `VpcEncryptionControlViolationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_db_instance_read_replica_message) =
    let fields = create_db_instance_read_replica_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateDBInstanceReadReplica"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_instance_read_replica_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_db_instance_read_replica_message) =
    let fields = create_db_instance_read_replica_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateDBInstanceReadReplica"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_instance_read_replica_result_of_xml ~error_deserializer
end

module CreateDBParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupAlreadyExistsFault _ ->
        "com.amazonaws.rds#DBParameterGroupAlreadyExistsFault"
    | `DBParameterGroupQuotaExceededFault _ ->
        "com.amazonaws.rds#DBParameterGroupQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBParameterGroupAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_already_exists_fault_of_xml
        with
        | Ok s -> `DBParameterGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBParameterGroupQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBParameterGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_db_parameter_group_message) =
    let fields = create_db_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateDBParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_parameter_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_db_parameter_group_message) =
    let fields = create_db_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateDBParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_parameter_group_result_of_xml ~error_deserializer
end

module CreateDBProxy = struct
  let error_to_string = function
    | `DBProxyAlreadyExistsFault _ -> "com.amazonaws.rds#DBProxyAlreadyExistsFault"
    | `DBProxyQuotaExceededFault _ -> "com.amazonaws.rds#DBProxyQuotaExceededFault"
    | `InvalidSubnet _ -> "com.amazonaws.rds#InvalidSubnet"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBProxyAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_already_exists_fault_of_xml
        with
        | Ok s -> `DBProxyAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBProxyQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_db_proxy_request) =
    let fields = create_db_proxy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateDBProxy"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_proxy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_db_proxy_request) =
    let fields = create_db_proxy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateDBProxy"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_proxy_response_of_xml ~error_deserializer
end

module CreateDBProxyEndpoint = struct
  let error_to_string = function
    | `DBProxyEndpointAlreadyExistsFault _ -> "com.amazonaws.rds#DBProxyEndpointAlreadyExistsFault"
    | `DBProxyEndpointQuotaExceededFault _ -> "com.amazonaws.rds#DBProxyEndpointQuotaExceededFault"
    | `DBProxyNotFoundFault _ -> "com.amazonaws.rds#DBProxyNotFoundFault"
    | `InvalidDBProxyStateFault _ -> "com.amazonaws.rds#InvalidDBProxyStateFault"
    | `InvalidSubnet _ -> "com.amazonaws.rds#InvalidSubnet"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBProxyEndpointAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_endpoint_already_exists_fault_of_xml
        with
        | Ok s -> `DBProxyEndpointAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyEndpointQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_endpoint_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBProxyEndpointQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBProxyStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_proxy_state_fault_of_xml
        with
        | Ok s -> `InvalidDBProxyStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_db_proxy_endpoint_request) =
    let fields = create_db_proxy_endpoint_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateDBProxyEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_proxy_endpoint_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_db_proxy_endpoint_request) =
    let fields = create_db_proxy_endpoint_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateDBProxyEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_proxy_endpoint_response_of_xml ~error_deserializer
end

module CreateDBSecurityGroup = struct
  let error_to_string = function
    | `DBSecurityGroupAlreadyExistsFault _ -> "com.amazonaws.rds#DBSecurityGroupAlreadyExistsFault"
    | `DBSecurityGroupNotSupportedFault _ -> "com.amazonaws.rds#DBSecurityGroupNotSupportedFault"
    | `DBSecurityGroupQuotaExceededFault _ -> "com.amazonaws.rds#DBSecurityGroupQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBSecurityGroupAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_security_group_already_exists_fault_of_xml
        with
        | Ok s -> `DBSecurityGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSecurityGroupNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_security_group_not_supported_fault_of_xml
        with
        | Ok s -> `DBSecurityGroupNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "QuotaExceeded.DBSecurityGroup" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_security_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBSecurityGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_db_security_group_message) =
    let fields = create_db_security_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateDBSecurityGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_security_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_db_security_group_message) =
    let fields = create_db_security_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateDBSecurityGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_security_group_result_of_xml ~error_deserializer
end

module CreateDBShardGroup = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBShardGroupAlreadyExistsFault _ -> "com.amazonaws.rds#DBShardGroupAlreadyExistsFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.rds#InvalidVPCNetworkStateFault"
    | `MaxDBShardGroupLimitReached _ -> "com.amazonaws.rds#MaxDBShardGroupLimitReached"
    | `NetworkTypeNotSupported _ -> "com.amazonaws.rds#NetworkTypeNotSupported"
    | `UnsupportedDBEngineVersionFault _ -> "com.amazonaws.rds#UnsupportedDBEngineVersionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBShardGroupAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_shard_group_already_exists_fault_of_xml
        with
        | Ok s -> `DBShardGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MaxDBShardGroupLimitReached" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:max_db_shard_group_limit_reached_of_xml
        with
        | Ok s -> `MaxDBShardGroupLimitReached s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NetworkTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:network_type_not_supported_of_xml
        with
        | Ok s -> `NetworkTypeNotSupported s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedDBEngineVersion" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_db_engine_version_fault_of_xml
        with
        | Ok s -> `UnsupportedDBEngineVersionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_db_shard_group_message) =
    let fields = create_db_shard_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateDBShardGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_shard_group_of_xml ~error_deserializer

  let request_with_metadata context (request : create_db_shard_group_message) =
    let fields = create_db_shard_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateDBShardGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_shard_group_of_xml ~error_deserializer
end

module CreateDBSnapshot = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBSnapshotAlreadyExistsFault _ -> "com.amazonaws.rds#DBSnapshotAlreadyExistsFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.rds#SnapshotQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSnapshotAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `DBSnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `SnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_db_snapshot_message) =
    let fields = create_db_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateDBSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_db_snapshot_message) =
    let fields = create_db_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateDBSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_snapshot_result_of_xml ~error_deserializer
end

module CreateDBSubnetGroup = struct
  let error_to_string = function
    | `DBSubnetGroupAlreadyExistsFault _ -> "com.amazonaws.rds#DBSubnetGroupAlreadyExistsFault"
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.rds#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupQuotaExceededFault _ -> "com.amazonaws.rds#DBSubnetGroupQuotaExceededFault"
    | `DBSubnetQuotaExceededFault _ -> "com.amazonaws.rds#DBSubnetQuotaExceededFault"
    | `InvalidSubnet _ -> "com.amazonaws.rds#InvalidSubnet"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBSubnetGroupAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_already_exists_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupDoesNotCoverEnoughAZs" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_does_not_cover_enough_a_zs_of_xml
        with
        | Ok s -> `DBSubnetGroupDoesNotCoverEnoughAZs s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBSubnetQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_db_subnet_group_message) =
    let fields = create_db_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateDBSubnetGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_subnet_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_db_subnet_group_message) =
    let fields = create_db_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateDBSubnetGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_subnet_group_result_of_xml ~error_deserializer
end

module CreateEventSubscription = struct
  let error_to_string = function
    | `EventSubscriptionQuotaExceededFault _ ->
        "com.amazonaws.rds#EventSubscriptionQuotaExceededFault"
    | `SNSInvalidTopicFault _ -> "com.amazonaws.rds#SNSInvalidTopicFault"
    | `SNSNoAuthorizationFault _ -> "com.amazonaws.rds#SNSNoAuthorizationFault"
    | `SNSTopicArnNotFoundFault _ -> "com.amazonaws.rds#SNSTopicArnNotFoundFault"
    | `SourceNotFoundFault _ -> "com.amazonaws.rds#SourceNotFoundFault"
    | `SubscriptionAlreadyExistFault _ -> "com.amazonaws.rds#SubscriptionAlreadyExistFault"
    | `SubscriptionCategoryNotFoundFault _ -> "com.amazonaws.rds#SubscriptionCategoryNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "EventSubscriptionQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:event_subscription_quota_exceeded_fault_of_xml
        with
        | Ok s -> `EventSubscriptionQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SNSInvalidTopic" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:sns_invalid_topic_fault_of_xml
        with
        | Ok s -> `SNSInvalidTopicFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SNSNoAuthorization" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:sns_no_authorization_fault_of_xml
        with
        | Ok s -> `SNSNoAuthorizationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SNSTopicArnNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:sns_topic_arn_not_found_fault_of_xml
        with
        | Ok s -> `SNSTopicArnNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:source_not_found_fault_of_xml
        with
        | Ok s -> `SourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubscriptionAlreadyExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subscription_already_exist_fault_of_xml
        with
        | Ok s -> `SubscriptionAlreadyExistFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubscriptionCategoryNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subscription_category_not_found_fault_of_xml
        with
        | Ok s -> `SubscriptionCategoryNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_event_subscription_message) =
    let fields = create_event_subscription_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateEventSubscription"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_event_subscription_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_event_subscription_message) =
    let fields = create_event_subscription_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateEventSubscription"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_event_subscription_result_of_xml ~error_deserializer
end

module CreateGlobalCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `GlobalClusterAlreadyExistsFault _ -> "com.amazonaws.rds#GlobalClusterAlreadyExistsFault"
    | `GlobalClusterQuotaExceededFault _ -> "com.amazonaws.rds#GlobalClusterQuotaExceededFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBShardGroupStateFault _ -> "com.amazonaws.rds#InvalidDBShardGroupStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.rds#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "GlobalClusterAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_cluster_already_exists_fault_of_xml
        with
        | Ok s -> `GlobalClusterAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "GlobalClusterQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_cluster_quota_exceeded_fault_of_xml
        with
        | Ok s -> `GlobalClusterQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBShardGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_shard_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBShardGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_fault_of_xml
        with
        | Ok s -> `ResourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_global_cluster_message) =
    let fields = create_global_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateGlobalCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_global_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_global_cluster_message) =
    let fields = create_global_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateGlobalCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_global_cluster_result_of_xml ~error_deserializer
end

module CreateIntegration = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `IntegrationAlreadyExistsFault _ -> "com.amazonaws.rds#IntegrationAlreadyExistsFault"
    | `IntegrationConflictOperationFault _ -> "com.amazonaws.rds#IntegrationConflictOperationFault"
    | `IntegrationQuotaExceededFault _ -> "com.amazonaws.rds#IntegrationQuotaExceededFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IntegrationAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_already_exists_fault_of_xml
        with
        | Ok s -> `IntegrationAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IntegrationConflictOperationFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_conflict_operation_fault_of_xml
        with
        | Ok s -> `IntegrationConflictOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IntegrationQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_quota_exceeded_fault_of_xml
        with
        | Ok s -> `IntegrationQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_integration_message) =
    let fields = create_integration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateIntegration"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:integration_of_xml ~error_deserializer

  let request_with_metadata context (request : create_integration_message) =
    let fields = create_integration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateIntegration"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:integration_of_xml ~error_deserializer
end

module CreateOptionGroup = struct
  let error_to_string = function
    | `OptionGroupAlreadyExistsFault _ -> "com.amazonaws.rds#OptionGroupAlreadyExistsFault"
    | `OptionGroupQuotaExceededFault _ -> "com.amazonaws.rds#OptionGroupQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "OptionGroupAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_already_exists_fault_of_xml
        with
        | Ok s -> `OptionGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OptionGroupQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `OptionGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_option_group_message) =
    let fields = create_option_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateOptionGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_option_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_option_group_message) =
    let fields = create_option_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateOptionGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_option_group_result_of_xml ~error_deserializer
end

module CreateTenantDatabase = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `TenantDatabaseAlreadyExistsFault _ -> "com.amazonaws.rds#TenantDatabaseAlreadyExistsFault"
    | `TenantDatabaseQuotaExceededFault _ -> "com.amazonaws.rds#TenantDatabaseQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TenantDatabaseAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tenant_database_already_exists_fault_of_xml
        with
        | Ok s -> `TenantDatabaseAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TenantDatabaseQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tenant_database_quota_exceeded_fault_of_xml
        with
        | Ok s -> `TenantDatabaseQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_tenant_database_message) =
    let fields = create_tenant_database_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateTenantDatabase"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_tenant_database_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_tenant_database_message) =
    let fields = create_tenant_database_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateTenantDatabase"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_tenant_database_result_of_xml ~error_deserializer
end

module DeleteBlueGreenDeployment = struct
  let error_to_string = function
    | `BlueGreenDeploymentNotFoundFault _ -> "com.amazonaws.rds#BlueGreenDeploymentNotFoundFault"
    | `InvalidBlueGreenDeploymentStateFault _ ->
        "com.amazonaws.rds#InvalidBlueGreenDeploymentStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BlueGreenDeploymentNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:blue_green_deployment_not_found_fault_of_xml
        with
        | Ok s -> `BlueGreenDeploymentNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidBlueGreenDeploymentStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_blue_green_deployment_state_fault_of_xml
        with
        | Ok s -> `InvalidBlueGreenDeploymentStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_blue_green_deployment_request) =
    let fields = delete_blue_green_deployment_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteBlueGreenDeployment"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_blue_green_deployment_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_blue_green_deployment_request) =
    let fields = delete_blue_green_deployment_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteBlueGreenDeployment"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_blue_green_deployment_response_of_xml ~error_deserializer
end

module DeleteCustomDBEngineVersion = struct
  let error_to_string = function
    | `CustomDBEngineVersionNotFoundFault _ ->
        "com.amazonaws.rds#CustomDBEngineVersionNotFoundFault"
    | `InvalidCustomDBEngineVersionStateFault _ ->
        "com.amazonaws.rds#InvalidCustomDBEngineVersionStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CustomDBEngineVersionNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_db_engine_version_not_found_fault_of_xml
        with
        | Ok s -> `CustomDBEngineVersionNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCustomDBEngineVersionStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_custom_db_engine_version_state_fault_of_xml
        with
        | Ok s -> `InvalidCustomDBEngineVersionStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_custom_db_engine_version_message) =
    let fields = delete_custom_db_engine_version_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteCustomDBEngineVersion"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_engine_version_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_custom_db_engine_version_message) =
    let fields = delete_custom_db_engine_version_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteCustomDBEngineVersion"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_engine_version_of_xml ~error_deserializer
end

module DeleteDBCluster = struct
  let error_to_string = function
    | `DBClusterAutomatedBackupQuotaExceededFault _ ->
        "com.amazonaws.rds#DBClusterAutomatedBackupQuotaExceededFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBClusterSnapshotAlreadyExistsFault _ ->
        "com.amazonaws.rds#DBClusterSnapshotAlreadyExistsFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.rds#InvalidDBClusterSnapshotStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.rds#InvalidGlobalClusterStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.rds#SnapshotQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterAutomatedBackupQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_automated_backup_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBClusterAutomatedBackupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterSnapshotAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `DBClusterSnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterSnapshotStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `SnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_db_cluster_message) =
    let fields = delete_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_db_cluster_message) =
    let fields = delete_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_cluster_result_of_xml ~error_deserializer
end

module DeleteDBClusterAutomatedBackup = struct
  let error_to_string = function
    | `DBClusterAutomatedBackupNotFoundFault _ ->
        "com.amazonaws.rds#DBClusterAutomatedBackupNotFoundFault"
    | `InvalidDBClusterAutomatedBackupStateFault _ ->
        "com.amazonaws.rds#InvalidDBClusterAutomatedBackupStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterAutomatedBackupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_automated_backup_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterAutomatedBackupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterAutomatedBackupStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_automated_backup_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterAutomatedBackupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_db_cluster_automated_backup_message) =
    let fields = delete_db_cluster_automated_backup_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteDBClusterAutomatedBackup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_cluster_automated_backup_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_db_cluster_automated_backup_message) =
    let fields = delete_db_cluster_automated_backup_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDBClusterAutomatedBackup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_cluster_automated_backup_result_of_xml ~error_deserializer
end

module DeleteDBClusterEndpoint = struct
  let error_to_string = function
    | `DBClusterEndpointNotFoundFault _ -> "com.amazonaws.rds#DBClusterEndpointNotFoundFault"
    | `InvalidDBClusterEndpointStateFault _ ->
        "com.amazonaws.rds#InvalidDBClusterEndpointStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterEndpointNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_endpoint_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterEndpointNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterEndpointStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_endpoint_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterEndpointStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_db_cluster_endpoint_message) =
    let fields = delete_db_cluster_endpoint_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteDBClusterEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_endpoint_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_db_cluster_endpoint_message) =
    let fields = delete_db_cluster_endpoint_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDBClusterEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_endpoint_of_xml ~error_deserializer
end

module DeleteDBClusterParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | `InvalidDBParameterGroupStateFault _ -> "com.amazonaws.rds#InvalidDBParameterGroupStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBParameterGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_parameter_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBParameterGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_db_cluster_parameter_group_message) =
    let fields = delete_db_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteDBClusterParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_db_cluster_parameter_group_message) =
    let fields = delete_db_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDBClusterParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteDBClusterSnapshot = struct
  let error_to_string = function
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBClusterSnapshotNotFoundFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.rds#InvalidDBClusterSnapshotStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterSnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterSnapshotStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_db_cluster_snapshot_message) =
    let fields = delete_db_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteDBClusterSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_cluster_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_db_cluster_snapshot_message) =
    let fields = delete_db_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDBClusterSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_cluster_snapshot_result_of_xml ~error_deserializer
end

module DeleteDBInstance = struct
  let error_to_string = function
    | `DBInstanceAutomatedBackupQuotaExceededFault _ ->
        "com.amazonaws.rds#DBInstanceAutomatedBackupQuotaExceededFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBSnapshotAlreadyExistsFault _ -> "com.amazonaws.rds#DBSnapshotAlreadyExistsFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.rds#SnapshotQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceAutomatedBackupQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_automated_backup_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBInstanceAutomatedBackupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSnapshotAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `DBSnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `SnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_db_instance_message) =
    let fields = delete_db_instance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteDBInstance"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_instance_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_db_instance_message) =
    let fields = delete_db_instance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDBInstance"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_instance_result_of_xml ~error_deserializer
end

module DeleteDBInstanceAutomatedBackup = struct
  let error_to_string = function
    | `DBInstanceAutomatedBackupNotFoundFault _ ->
        "com.amazonaws.rds#DBInstanceAutomatedBackupNotFoundFault"
    | `InvalidDBInstanceAutomatedBackupStateFault _ ->
        "com.amazonaws.rds#InvalidDBInstanceAutomatedBackupStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceAutomatedBackupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_automated_backup_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceAutomatedBackupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceAutomatedBackupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_automated_backup_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceAutomatedBackupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_db_instance_automated_backup_message) =
    let fields = delete_db_instance_automated_backup_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteDBInstanceAutomatedBackup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_instance_automated_backup_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_db_instance_automated_backup_message) =
    let fields = delete_db_instance_automated_backup_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDBInstanceAutomatedBackup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_instance_automated_backup_result_of_xml ~error_deserializer
end

module DeleteDBParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | `InvalidDBParameterGroupStateFault _ -> "com.amazonaws.rds#InvalidDBParameterGroupStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBParameterGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_parameter_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBParameterGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_db_parameter_group_message) =
    let fields = delete_db_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteDBParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_db_parameter_group_message) =
    let fields = delete_db_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDBParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteDBProxy = struct
  let error_to_string = function
    | `DBProxyNotFoundFault _ -> "com.amazonaws.rds#DBProxyNotFoundFault"
    | `InvalidDBProxyStateFault _ -> "com.amazonaws.rds#InvalidDBProxyStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBProxyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBProxyStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_proxy_state_fault_of_xml
        with
        | Ok s -> `InvalidDBProxyStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_db_proxy_request) =
    let fields = delete_db_proxy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteDBProxy"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_proxy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_db_proxy_request) =
    let fields = delete_db_proxy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDBProxy"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_proxy_response_of_xml ~error_deserializer
end

module DeleteDBProxyEndpoint = struct
  let error_to_string = function
    | `DBProxyEndpointNotFoundFault _ -> "com.amazonaws.rds#DBProxyEndpointNotFoundFault"
    | `InvalidDBProxyEndpointStateFault _ -> "com.amazonaws.rds#InvalidDBProxyEndpointStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBProxyEndpointNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_endpoint_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyEndpointNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBProxyEndpointStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_proxy_endpoint_state_fault_of_xml
        with
        | Ok s -> `InvalidDBProxyEndpointStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_db_proxy_endpoint_request) =
    let fields = delete_db_proxy_endpoint_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteDBProxyEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_proxy_endpoint_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_db_proxy_endpoint_request) =
    let fields = delete_db_proxy_endpoint_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDBProxyEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_proxy_endpoint_response_of_xml ~error_deserializer
end

module DeleteDBSecurityGroup = struct
  let error_to_string = function
    | `DBSecurityGroupNotFoundFault _ -> "com.amazonaws.rds#DBSecurityGroupNotFoundFault"
    | `InvalidDBSecurityGroupStateFault _ -> "com.amazonaws.rds#InvalidDBSecurityGroupStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_security_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_db_security_group_message) =
    let fields = delete_db_security_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteDBSecurityGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_db_security_group_message) =
    let fields = delete_db_security_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDBSecurityGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteDBShardGroup = struct
  let error_to_string = function
    | `DBShardGroupNotFoundFault _ -> "com.amazonaws.rds#DBShardGroupNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBShardGroupStateFault _ -> "com.amazonaws.rds#InvalidDBShardGroupStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBShardGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_shard_group_not_found_fault_of_xml
        with
        | Ok s -> `DBShardGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBShardGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_shard_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBShardGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_db_shard_group_message) =
    let fields = delete_db_shard_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteDBShardGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_shard_group_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_db_shard_group_message) =
    let fields = delete_db_shard_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDBShardGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_shard_group_of_xml ~error_deserializer
end

module DeleteDBSnapshot = struct
  let error_to_string = function
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBSnapshotNotFoundFault"
    | `InvalidDBSnapshotStateFault _ -> "com.amazonaws.rds#InvalidDBSnapshotStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSnapshotState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_db_snapshot_message) =
    let fields = delete_db_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteDBSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_db_snapshot_message) =
    let fields = delete_db_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDBSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_snapshot_result_of_xml ~error_deserializer
end

module DeleteDBSubnetGroup = struct
  let error_to_string = function
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.rds#DBSubnetGroupNotFoundFault"
    | `InvalidDBSubnetGroupStateFault _ -> "com.amazonaws.rds#InvalidDBSubnetGroupStateFault"
    | `InvalidDBSubnetStateFault _ -> "com.amazonaws.rds#InvalidDBSubnetStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSubnetGroupStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_subnet_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSubnetGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSubnetStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_subnet_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSubnetStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_db_subnet_group_message) =
    let fields = delete_db_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteDBSubnetGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_db_subnet_group_message) =
    let fields = delete_db_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDBSubnetGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteEventSubscription = struct
  let error_to_string = function
    | `InvalidEventSubscriptionStateFault _ ->
        "com.amazonaws.rds#InvalidEventSubscriptionStateFault"
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.rds#SubscriptionNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidEventSubscriptionState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_event_subscription_state_fault_of_xml
        with
        | Ok s -> `InvalidEventSubscriptionStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubscriptionNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subscription_not_found_fault_of_xml
        with
        | Ok s -> `SubscriptionNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_event_subscription_message) =
    let fields = delete_event_subscription_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteEventSubscription"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_event_subscription_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_event_subscription_message) =
    let fields = delete_event_subscription_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteEventSubscription"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_event_subscription_result_of_xml ~error_deserializer
end

module DeleteGlobalCluster = struct
  let error_to_string = function
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.rds#GlobalClusterNotFoundFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.rds#InvalidGlobalClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "GlobalClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_cluster_not_found_fault_of_xml
        with
        | Ok s -> `GlobalClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_global_cluster_message) =
    let fields = delete_global_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteGlobalCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_global_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_global_cluster_message) =
    let fields = delete_global_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteGlobalCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_global_cluster_result_of_xml ~error_deserializer
end

module DeleteIntegration = struct
  let error_to_string = function
    | `IntegrationConflictOperationFault _ -> "com.amazonaws.rds#IntegrationConflictOperationFault"
    | `IntegrationNotFoundFault _ -> "com.amazonaws.rds#IntegrationNotFoundFault"
    | `InvalidIntegrationStateFault _ -> "com.amazonaws.rds#InvalidIntegrationStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "IntegrationConflictOperationFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_conflict_operation_fault_of_xml
        with
        | Ok s -> `IntegrationConflictOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IntegrationNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_not_found_fault_of_xml
        with
        | Ok s -> `IntegrationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidIntegrationStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_integration_state_fault_of_xml
        with
        | Ok s -> `InvalidIntegrationStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_integration_message) =
    let fields = delete_integration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteIntegration"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:integration_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_integration_message) =
    let fields = delete_integration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteIntegration"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:integration_of_xml ~error_deserializer
end

module DeleteOptionGroup = struct
  let error_to_string = function
    | `InvalidOptionGroupStateFault _ -> "com.amazonaws.rds#InvalidOptionGroupStateFault"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.rds#OptionGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidOptionGroupStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_option_group_state_fault_of_xml
        with
        | Ok s -> `InvalidOptionGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OptionGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_not_found_fault_of_xml
        with
        | Ok s -> `OptionGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_option_group_message) =
    let fields = delete_option_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteOptionGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_option_group_message) =
    let fields = delete_option_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteOptionGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteTenantDatabase = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBSnapshotAlreadyExistsFault _ -> "com.amazonaws.rds#DBSnapshotAlreadyExistsFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `TenantDatabaseNotFoundFault _ -> "com.amazonaws.rds#TenantDatabaseNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSnapshotAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `DBSnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TenantDatabaseNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tenant_database_not_found_fault_of_xml
        with
        | Ok s -> `TenantDatabaseNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_tenant_database_message) =
    let fields = delete_tenant_database_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteTenantDatabase"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_tenant_database_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_tenant_database_message) =
    let fields = delete_tenant_database_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteTenantDatabase"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_tenant_database_result_of_xml ~error_deserializer
end

module DeregisterDBProxyTargets = struct
  let error_to_string = function
    | `DBProxyNotFoundFault _ -> "com.amazonaws.rds#DBProxyNotFoundFault"
    | `DBProxyTargetGroupNotFoundFault _ -> "com.amazonaws.rds#DBProxyTargetGroupNotFoundFault"
    | `DBProxyTargetNotFoundFault _ -> "com.amazonaws.rds#DBProxyTargetNotFoundFault"
    | `InvalidDBProxyStateFault _ -> "com.amazonaws.rds#InvalidDBProxyStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBProxyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyTargetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_target_group_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyTargetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyTargetNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_target_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyTargetNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBProxyStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_proxy_state_fault_of_xml
        with
        | Ok s -> `InvalidDBProxyStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : deregister_db_proxy_targets_request) =
    let fields = deregister_db_proxy_targets_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeregisterDBProxyTargets"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:deregister_db_proxy_targets_response_of_xml ~error_deserializer

  let request_with_metadata context (request : deregister_db_proxy_targets_request) =
    let fields = deregister_db_proxy_targets_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeregisterDBProxyTargets"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:deregister_db_proxy_targets_response_of_xml ~error_deserializer
end

module DescribeAccountAttributes = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_account_attributes_message) =
    let fields = describe_account_attributes_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAccountAttributes"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:account_attributes_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_account_attributes_message) =
    let fields = describe_account_attributes_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAccountAttributes"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:account_attributes_message_of_xml ~error_deserializer
end

module DescribeBlueGreenDeployments = struct
  let error_to_string = function
    | `BlueGreenDeploymentNotFoundFault _ -> "com.amazonaws.rds#BlueGreenDeploymentNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BlueGreenDeploymentNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:blue_green_deployment_not_found_fault_of_xml
        with
        | Ok s -> `BlueGreenDeploymentNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_blue_green_deployments_request) =
    let fields = describe_blue_green_deployments_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeBlueGreenDeployments"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_blue_green_deployments_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_blue_green_deployments_request) =
    let fields = describe_blue_green_deployments_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeBlueGreenDeployments"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_blue_green_deployments_response_of_xml ~error_deserializer
end

module DescribeCertificates = struct
  let error_to_string = function
    | `CertificateNotFoundFault _ -> "com.amazonaws.rds#CertificateNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CertificateNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:certificate_not_found_fault_of_xml
        with
        | Ok s -> `CertificateNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_certificates_message) =
    let fields = describe_certificates_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeCertificates"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:certificate_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_certificates_message) =
    let fields = describe_certificates_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeCertificates"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:certificate_message_of_xml ~error_deserializer
end

module DescribeDBClusterAutomatedBackups = struct
  let error_to_string = function
    | `DBClusterAutomatedBackupNotFoundFault _ ->
        "com.amazonaws.rds#DBClusterAutomatedBackupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterAutomatedBackupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_automated_backup_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterAutomatedBackupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_cluster_automated_backups_message) =
    let fields = describe_db_cluster_automated_backups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBClusterAutomatedBackups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_automated_backup_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_cluster_automated_backups_message) =
    let fields = describe_db_cluster_automated_backups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBClusterAutomatedBackups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_automated_backup_message_of_xml ~error_deserializer
end

module DescribeDBClusterBacktracks = struct
  let error_to_string = function
    | `DBClusterBacktrackNotFoundFault _ -> "com.amazonaws.rds#DBClusterBacktrackNotFoundFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterBacktrackNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_backtrack_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterBacktrackNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_cluster_backtracks_message) =
    let fields = describe_db_cluster_backtracks_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBClusterBacktracks"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_backtrack_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_cluster_backtracks_message) =
    let fields = describe_db_cluster_backtracks_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBClusterBacktracks"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_backtrack_message_of_xml ~error_deserializer
end

module DescribeDBClusterEndpoints = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_cluster_endpoints_message) =
    let fields = describe_db_cluster_endpoints_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBClusterEndpoints"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_endpoint_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_cluster_endpoints_message) =
    let fields = describe_db_cluster_endpoints_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBClusterEndpoints"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_endpoint_message_of_xml ~error_deserializer
end

module DescribeDBClusterParameterGroups = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_cluster_parameter_groups_message) =
    let fields = describe_db_cluster_parameter_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBClusterParameterGroups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_parameter_groups_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_cluster_parameter_groups_message) =
    let fields = describe_db_cluster_parameter_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBClusterParameterGroups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_parameter_groups_message_of_xml ~error_deserializer
end

module DescribeDBClusterParameters = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_cluster_parameters_message) =
    let fields = describe_db_cluster_parameters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBClusterParameters"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_parameter_group_details_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_cluster_parameters_message) =
    let fields = describe_db_cluster_parameters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBClusterParameters"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_parameter_group_details_of_xml ~error_deserializer
end

module DescribeDBClusterSnapshotAttributes = struct
  let error_to_string = function
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBClusterSnapshotNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterSnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_cluster_snapshot_attributes_message) =
    let fields = describe_db_cluster_snapshot_attributes_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBClusterSnapshotAttributes"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_cluster_snapshot_attributes_result_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_cluster_snapshot_attributes_message) =
    let fields = describe_db_cluster_snapshot_attributes_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBClusterSnapshotAttributes"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_cluster_snapshot_attributes_result_of_xml ~error_deserializer
end

module DescribeDBClusterSnapshots = struct
  let error_to_string = function
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBClusterSnapshotNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterSnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_cluster_snapshots_message) =
    let fields = describe_db_cluster_snapshots_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBClusterSnapshots"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_snapshot_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_cluster_snapshots_message) =
    let fields = describe_db_cluster_snapshots_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBClusterSnapshots"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_snapshot_message_of_xml ~error_deserializer
end

module DescribeDBClusters = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_clusters_message) =
    let fields = describe_db_clusters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBClusters"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_clusters_message) =
    let fields = describe_db_clusters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBClusters"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_message_of_xml ~error_deserializer
end

module DescribeDBEngineVersions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_engine_versions_message) =
    let fields = describe_db_engine_versions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBEngineVersions"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_engine_version_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_engine_versions_message) =
    let fields = describe_db_engine_versions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBEngineVersions"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_engine_version_message_of_xml ~error_deserializer
end

module DescribeDBInstanceAutomatedBackups = struct
  let error_to_string = function
    | `DBInstanceAutomatedBackupNotFoundFault _ ->
        "com.amazonaws.rds#DBInstanceAutomatedBackupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceAutomatedBackupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_automated_backup_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceAutomatedBackupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_instance_automated_backups_message) =
    let fields = describe_db_instance_automated_backups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBInstanceAutomatedBackups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_instance_automated_backup_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_instance_automated_backups_message) =
    let fields = describe_db_instance_automated_backups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBInstanceAutomatedBackups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_instance_automated_backup_message_of_xml ~error_deserializer
end

module DescribeDBInstances = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_instances_message) =
    let fields = describe_db_instances_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBInstances"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_instance_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_instances_message) =
    let fields = describe_db_instances_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBInstances"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_instance_message_of_xml ~error_deserializer
end

module DescribeDBLogFiles = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBInstanceNotReadyFault _ -> "com.amazonaws.rds#DBInstanceNotReadyFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotReady" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_ready_fault_of_xml
        with
        | Ok s -> `DBInstanceNotReadyFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_log_files_message) =
    let fields = describe_db_log_files_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBLogFiles"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_log_files_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_log_files_message) =
    let fields = describe_db_log_files_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBLogFiles"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_log_files_response_of_xml ~error_deserializer
end

module DescribeDBMajorEngineVersions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_major_engine_versions_request) =
    let fields = describe_db_major_engine_versions_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBMajorEngineVersions"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_major_engine_versions_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_major_engine_versions_request) =
    let fields = describe_db_major_engine_versions_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBMajorEngineVersions"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_major_engine_versions_response_of_xml ~error_deserializer
end

module DescribeDBParameterGroups = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_parameter_groups_message) =
    let fields = describe_db_parameter_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBParameterGroups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_parameter_groups_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_parameter_groups_message) =
    let fields = describe_db_parameter_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBParameterGroups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_parameter_groups_message_of_xml ~error_deserializer
end

module DescribeDBParameters = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_parameters_message) =
    let fields = describe_db_parameters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBParameters"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_parameter_group_details_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_parameters_message) =
    let fields = describe_db_parameters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBParameters"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_parameter_group_details_of_xml ~error_deserializer
end

module DescribeDBProxies = struct
  let error_to_string = function
    | `DBProxyNotFoundFault _ -> "com.amazonaws.rds#DBProxyNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBProxyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_proxies_request) =
    let fields = describe_db_proxies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBProxies"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_proxies_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_proxies_request) =
    let fields = describe_db_proxies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBProxies"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_proxies_response_of_xml ~error_deserializer
end

module DescribeDBProxyEndpoints = struct
  let error_to_string = function
    | `DBProxyEndpointNotFoundFault _ -> "com.amazonaws.rds#DBProxyEndpointNotFoundFault"
    | `DBProxyNotFoundFault _ -> "com.amazonaws.rds#DBProxyNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBProxyEndpointNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_endpoint_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyEndpointNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_proxy_endpoints_request) =
    let fields = describe_db_proxy_endpoints_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBProxyEndpoints"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_proxy_endpoints_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_proxy_endpoints_request) =
    let fields = describe_db_proxy_endpoints_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBProxyEndpoints"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_proxy_endpoints_response_of_xml ~error_deserializer
end

module DescribeDBProxyTargetGroups = struct
  let error_to_string = function
    | `DBProxyNotFoundFault _ -> "com.amazonaws.rds#DBProxyNotFoundFault"
    | `DBProxyTargetGroupNotFoundFault _ -> "com.amazonaws.rds#DBProxyTargetGroupNotFoundFault"
    | `InvalidDBProxyStateFault _ -> "com.amazonaws.rds#InvalidDBProxyStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBProxyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyTargetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_target_group_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyTargetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBProxyStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_proxy_state_fault_of_xml
        with
        | Ok s -> `InvalidDBProxyStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_proxy_target_groups_request) =
    let fields = describe_db_proxy_target_groups_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBProxyTargetGroups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_proxy_target_groups_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_proxy_target_groups_request) =
    let fields = describe_db_proxy_target_groups_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBProxyTargetGroups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_proxy_target_groups_response_of_xml ~error_deserializer
end

module DescribeDBProxyTargets = struct
  let error_to_string = function
    | `DBProxyNotFoundFault _ -> "com.amazonaws.rds#DBProxyNotFoundFault"
    | `DBProxyTargetGroupNotFoundFault _ -> "com.amazonaws.rds#DBProxyTargetGroupNotFoundFault"
    | `DBProxyTargetNotFoundFault _ -> "com.amazonaws.rds#DBProxyTargetNotFoundFault"
    | `InvalidDBProxyStateFault _ -> "com.amazonaws.rds#InvalidDBProxyStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBProxyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyTargetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_target_group_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyTargetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyTargetNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_target_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyTargetNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBProxyStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_proxy_state_fault_of_xml
        with
        | Ok s -> `InvalidDBProxyStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_proxy_targets_request) =
    let fields = describe_db_proxy_targets_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBProxyTargets"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_proxy_targets_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_proxy_targets_request) =
    let fields = describe_db_proxy_targets_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBProxyTargets"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_proxy_targets_response_of_xml ~error_deserializer
end

module DescribeDBRecommendations = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_recommendations_message) =
    let fields = describe_db_recommendations_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBRecommendations"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_recommendations_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_recommendations_message) =
    let fields = describe_db_recommendations_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBRecommendations"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_recommendations_message_of_xml ~error_deserializer
end

module DescribeDBSecurityGroups = struct
  let error_to_string = function
    | `DBSecurityGroupNotFoundFault _ -> "com.amazonaws.rds#DBSecurityGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_security_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_security_groups_message) =
    let fields = describe_db_security_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBSecurityGroups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_security_group_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_security_groups_message) =
    let fields = describe_db_security_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBSecurityGroups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_security_group_message_of_xml ~error_deserializer
end

module DescribeDBShardGroups = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBShardGroupNotFoundFault _ -> "com.amazonaws.rds#DBShardGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBShardGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_shard_group_not_found_fault_of_xml
        with
        | Ok s -> `DBShardGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_shard_groups_message) =
    let fields = describe_db_shard_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBShardGroups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_shard_groups_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_shard_groups_message) =
    let fields = describe_db_shard_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBShardGroups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_shard_groups_response_of_xml ~error_deserializer
end

module DescribeDBSnapshotAttributes = struct
  let error_to_string = function
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBSnapshotNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_snapshot_attributes_message) =
    let fields = describe_db_snapshot_attributes_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBSnapshotAttributes"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_snapshot_attributes_result_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_snapshot_attributes_message) =
    let fields = describe_db_snapshot_attributes_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBSnapshotAttributes"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_db_snapshot_attributes_result_of_xml ~error_deserializer
end

module DescribeDBSnapshotTenantDatabases = struct
  let error_to_string = function
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBSnapshotNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_snapshot_tenant_databases_message) =
    let fields = describe_db_snapshot_tenant_databases_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBSnapshotTenantDatabases"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_snapshot_tenant_databases_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_snapshot_tenant_databases_message) =
    let fields = describe_db_snapshot_tenant_databases_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBSnapshotTenantDatabases"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_snapshot_tenant_databases_message_of_xml ~error_deserializer
end

module DescribeDBSnapshots = struct
  let error_to_string = function
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBSnapshotNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_snapshots_message) =
    let fields = describe_db_snapshots_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBSnapshots"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_snapshot_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_snapshots_message) =
    let fields = describe_db_snapshots_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBSnapshots"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_snapshot_message_of_xml ~error_deserializer
end

module DescribeDBSubnetGroups = struct
  let error_to_string = function
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.rds#DBSubnetGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_db_subnet_groups_message) =
    let fields = describe_db_subnet_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDBSubnetGroups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_subnet_group_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_db_subnet_groups_message) =
    let fields = describe_db_subnet_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDBSubnetGroups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_subnet_group_message_of_xml ~error_deserializer
end

module DescribeEngineDefaultClusterParameters = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_engine_default_cluster_parameters_message) =
    let fields = describe_engine_default_cluster_parameters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEngineDefaultClusterParameters"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_engine_default_cluster_parameters_result_of_xml
      ~error_deserializer

  let request_with_metadata context (request : describe_engine_default_cluster_parameters_message) =
    let fields = describe_engine_default_cluster_parameters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"DescribeEngineDefaultClusterParameters"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_engine_default_cluster_parameters_result_of_xml
      ~error_deserializer
end

module DescribeEngineDefaultParameters = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_engine_default_parameters_message) =
    let fields = describe_engine_default_parameters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEngineDefaultParameters"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_engine_default_parameters_result_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_engine_default_parameters_message) =
    let fields = describe_engine_default_parameters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEngineDefaultParameters"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_engine_default_parameters_result_of_xml ~error_deserializer
end

module DescribeEventCategories = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_event_categories_message) =
    let fields = describe_event_categories_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEventCategories"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:event_categories_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_event_categories_message) =
    let fields = describe_event_categories_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEventCategories"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:event_categories_message_of_xml ~error_deserializer
end

module DescribeEventSubscriptions = struct
  let error_to_string = function
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.rds#SubscriptionNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "SubscriptionNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subscription_not_found_fault_of_xml
        with
        | Ok s -> `SubscriptionNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_event_subscriptions_message) =
    let fields = describe_event_subscriptions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEventSubscriptions"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:event_subscriptions_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_event_subscriptions_message) =
    let fields = describe_event_subscriptions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEventSubscriptions"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:event_subscriptions_message_of_xml ~error_deserializer
end

module DescribeEvents = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_events_message) =
    let fields = describe_events_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEvents"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:events_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_events_message) =
    let fields = describe_events_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEvents"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:events_message_of_xml ~error_deserializer
end

module DescribeExportTasks = struct
  let error_to_string = function
    | `ExportTaskNotFoundFault _ -> "com.amazonaws.rds#ExportTaskNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ExportTaskNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:export_task_not_found_fault_of_xml
        with
        | Ok s -> `ExportTaskNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_export_tasks_message) =
    let fields = describe_export_tasks_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeExportTasks"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:export_tasks_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_export_tasks_message) =
    let fields = describe_export_tasks_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeExportTasks"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:export_tasks_message_of_xml ~error_deserializer
end

module DescribeGlobalClusters = struct
  let error_to_string = function
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.rds#GlobalClusterNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "GlobalClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_cluster_not_found_fault_of_xml
        with
        | Ok s -> `GlobalClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_global_clusters_message) =
    let fields = describe_global_clusters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeGlobalClusters"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:global_clusters_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_global_clusters_message) =
    let fields = describe_global_clusters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeGlobalClusters"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:global_clusters_message_of_xml ~error_deserializer
end

module DescribeIntegrations = struct
  let error_to_string = function
    | `IntegrationNotFoundFault _ -> "com.amazonaws.rds#IntegrationNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "IntegrationNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_not_found_fault_of_xml
        with
        | Ok s -> `IntegrationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_integrations_message) =
    let fields = describe_integrations_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeIntegrations"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_integrations_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_integrations_message) =
    let fields = describe_integrations_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeIntegrations"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_integrations_response_of_xml ~error_deserializer
end

module DescribeOptionGroupOptions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_option_group_options_message) =
    let fields = describe_option_group_options_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeOptionGroupOptions"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:option_group_options_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_option_group_options_message) =
    let fields = describe_option_group_options_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeOptionGroupOptions"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:option_group_options_message_of_xml ~error_deserializer
end

module DescribeOptionGroups = struct
  let error_to_string = function
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.rds#OptionGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "OptionGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_not_found_fault_of_xml
        with
        | Ok s -> `OptionGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_option_groups_message) =
    let fields = describe_option_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeOptionGroups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:option_groups_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_option_groups_message) =
    let fields = describe_option_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeOptionGroups"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:option_groups_of_xml ~error_deserializer
end

module DescribeOrderableDBInstanceOptions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_orderable_db_instance_options_message) =
    let fields = describe_orderable_db_instance_options_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeOrderableDBInstanceOptions"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:orderable_db_instance_options_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_orderable_db_instance_options_message) =
    let fields = describe_orderable_db_instance_options_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeOrderableDBInstanceOptions"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:orderable_db_instance_options_message_of_xml ~error_deserializer
end

module DescribePendingMaintenanceActions = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.rds#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_fault_of_xml
        with
        | Ok s -> `ResourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_pending_maintenance_actions_message) =
    let fields = describe_pending_maintenance_actions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribePendingMaintenanceActions"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:pending_maintenance_actions_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_pending_maintenance_actions_message) =
    let fields = describe_pending_maintenance_actions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribePendingMaintenanceActions"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:pending_maintenance_actions_message_of_xml ~error_deserializer
end

module DescribeReservedDBInstances = struct
  let error_to_string = function
    | `ReservedDBInstanceNotFoundFault _ -> "com.amazonaws.rds#ReservedDBInstanceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ReservedDBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_db_instance_not_found_fault_of_xml
        with
        | Ok s -> `ReservedDBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_reserved_db_instances_message) =
    let fields = describe_reserved_db_instances_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeReservedDBInstances"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:reserved_db_instance_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_reserved_db_instances_message) =
    let fields = describe_reserved_db_instances_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeReservedDBInstances"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:reserved_db_instance_message_of_xml ~error_deserializer
end

module DescribeReservedDBInstancesOfferings = struct
  let error_to_string = function
    | `ReservedDBInstancesOfferingNotFoundFault _ ->
        "com.amazonaws.rds#ReservedDBInstancesOfferingNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ReservedDBInstancesOfferingNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_db_instances_offering_not_found_fault_of_xml
        with
        | Ok s -> `ReservedDBInstancesOfferingNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_reserved_db_instances_offerings_message) =
    let fields = describe_reserved_db_instances_offerings_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeReservedDBInstancesOfferings"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:reserved_db_instances_offering_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_reserved_db_instances_offerings_message) =
    let fields = describe_reserved_db_instances_offerings_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"DescribeReservedDBInstancesOfferings"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:reserved_db_instances_offering_message_of_xml ~error_deserializer
end

module DescribeServerlessV2PlatformVersions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_serverless_v2_platform_versions_message) =
    let fields = describe_serverless_v2_platform_versions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeServerlessV2PlatformVersions"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:serverless_v2_platform_versions_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_serverless_v2_platform_versions_message) =
    let fields = describe_serverless_v2_platform_versions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"DescribeServerlessV2PlatformVersions"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:serverless_v2_platform_versions_message_of_xml ~error_deserializer
end

module DescribeSourceRegions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_source_regions_message) =
    let fields = describe_source_regions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeSourceRegions"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:source_region_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_source_regions_message) =
    let fields = describe_source_regions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeSourceRegions"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:source_region_message_of_xml ~error_deserializer
end

module DescribeTenantDatabases = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_tenant_databases_message) =
    let fields = describe_tenant_databases_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeTenantDatabases"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:tenant_databases_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_tenant_databases_message) =
    let fields = describe_tenant_databases_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeTenantDatabases"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:tenant_databases_message_of_xml ~error_deserializer
end

module DescribeValidDBInstanceModifications = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_valid_db_instance_modifications_message) =
    let fields = describe_valid_db_instance_modifications_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeValidDBInstanceModifications"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_valid_db_instance_modifications_result_of_xml
      ~error_deserializer

  let request_with_metadata context (request : describe_valid_db_instance_modifications_message) =
    let fields = describe_valid_db_instance_modifications_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"DescribeValidDBInstanceModifications"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:describe_valid_db_instance_modifications_result_of_xml
      ~error_deserializer
end

module DisableHttpEndpoint = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ -> "com.amazonaws.rds#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.rds#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidResourceStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_resource_state_fault_of_xml
        with
        | Ok s -> `InvalidResourceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_fault_of_xml
        with
        | Ok s -> `ResourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : disable_http_endpoint_request) =
    let fields = disable_http_endpoint_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DisableHttpEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:disable_http_endpoint_response_of_xml ~error_deserializer

  let request_with_metadata context (request : disable_http_endpoint_request) =
    let fields = disable_http_endpoint_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DisableHttpEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:disable_http_endpoint_response_of_xml ~error_deserializer
end

module DownloadDBLogFilePortion = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBInstanceNotReadyFault _ -> "com.amazonaws.rds#DBInstanceNotReadyFault"
    | `DBLogFileNotFoundFault _ -> "com.amazonaws.rds#DBLogFileNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotReady" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_ready_fault_of_xml
        with
        | Ok s -> `DBInstanceNotReadyFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBLogFileNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_log_file_not_found_fault_of_xml
        with
        | Ok s -> `DBLogFileNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : download_db_log_file_portion_message) =
    let fields = download_db_log_file_portion_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DownloadDBLogFilePortion"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:download_db_log_file_portion_details_of_xml ~error_deserializer

  let request_with_metadata context (request : download_db_log_file_portion_message) =
    let fields = download_db_log_file_portion_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DownloadDBLogFilePortion"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:download_db_log_file_portion_details_of_xml ~error_deserializer
end

module EnableHttpEndpoint = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ -> "com.amazonaws.rds#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.rds#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidResourceStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_resource_state_fault_of_xml
        with
        | Ok s -> `InvalidResourceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_fault_of_xml
        with
        | Ok s -> `ResourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : enable_http_endpoint_request) =
    let fields = enable_http_endpoint_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"EnableHttpEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:enable_http_endpoint_response_of_xml ~error_deserializer

  let request_with_metadata context (request : enable_http_endpoint_request) =
    let fields = enable_http_endpoint_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"EnableHttpEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:enable_http_endpoint_response_of_xml ~error_deserializer
end

module FailoverDBCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : failover_db_cluster_message) =
    let fields = failover_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"FailoverDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:failover_db_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : failover_db_cluster_message) =
    let fields = failover_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"FailoverDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:failover_db_cluster_result_of_xml ~error_deserializer
end

module FailoverGlobalCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.rds#GlobalClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.rds#InvalidGlobalClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "GlobalClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_cluster_not_found_fault_of_xml
        with
        | Ok s -> `GlobalClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : failover_global_cluster_message) =
    let fields = failover_global_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"FailoverGlobalCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:failover_global_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : failover_global_cluster_message) =
    let fields = failover_global_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"FailoverGlobalCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:failover_global_cluster_result_of_xml ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `BlueGreenDeploymentNotFoundFault _ -> "com.amazonaws.rds#BlueGreenDeploymentNotFoundFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBProxyEndpointNotFoundFault _ -> "com.amazonaws.rds#DBProxyEndpointNotFoundFault"
    | `DBProxyNotFoundFault _ -> "com.amazonaws.rds#DBProxyNotFoundFault"
    | `DBProxyTargetGroupNotFoundFault _ -> "com.amazonaws.rds#DBProxyTargetGroupNotFoundFault"
    | `DBShardGroupNotFoundFault _ -> "com.amazonaws.rds#DBShardGroupNotFoundFault"
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBSnapshotNotFoundFault"
    | `DBSnapshotTenantDatabaseNotFoundFault _ ->
        "com.amazonaws.rds#DBSnapshotTenantDatabaseNotFoundFault"
    | `IntegrationNotFoundFault _ -> "com.amazonaws.rds#IntegrationNotFoundFault"
    | `TenantDatabaseNotFoundFault _ -> "com.amazonaws.rds#TenantDatabaseNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BlueGreenDeploymentNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:blue_green_deployment_not_found_fault_of_xml
        with
        | Ok s -> `BlueGreenDeploymentNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyEndpointNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_endpoint_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyEndpointNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyTargetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_target_group_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyTargetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBShardGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_shard_group_not_found_fault_of_xml
        with
        | Ok s -> `DBShardGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSnapshotTenantDatabaseNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_tenant_database_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotTenantDatabaseNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IntegrationNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_not_found_fault_of_xml
        with
        | Ok s -> `IntegrationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TenantDatabaseNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tenant_database_not_found_fault_of_xml
        with
        | Ok s -> `TenantDatabaseNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_tags_for_resource_message) =
    let fields = list_tags_for_resource_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListTagsForResource"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:tag_list_message_of_xml ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_message) =
    let fields = list_tags_for_resource_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListTagsForResource"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:tag_list_message_of_xml ~error_deserializer
end

module ModifyActivityStream = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.rds#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_fault_of_xml
        with
        | Ok s -> `ResourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_activity_stream_request) =
    let fields = modify_activity_stream_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyActivityStream"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_activity_stream_response_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_activity_stream_request) =
    let fields = modify_activity_stream_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyActivityStream"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_activity_stream_response_of_xml ~error_deserializer
end

module ModifyCertificates = struct
  let error_to_string = function
    | `CertificateNotFoundFault _ -> "com.amazonaws.rds#CertificateNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CertificateNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:certificate_not_found_fault_of_xml
        with
        | Ok s -> `CertificateNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_certificates_message) =
    let fields = modify_certificates_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyCertificates"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_certificates_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_certificates_message) =
    let fields = modify_certificates_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyCertificates"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_certificates_result_of_xml ~error_deserializer
end

module ModifyCurrentDBClusterCapacity = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `InvalidDBClusterCapacityFault _ -> "com.amazonaws.rds#InvalidDBClusterCapacityFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterCapacityFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_current_db_cluster_capacity_message) =
    let fields = modify_current_db_cluster_capacity_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyCurrentDBClusterCapacity"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_capacity_info_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_current_db_cluster_capacity_message) =
    let fields = modify_current_db_cluster_capacity_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyCurrentDBClusterCapacity"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_capacity_info_of_xml ~error_deserializer
end

module ModifyCustomDBEngineVersion = struct
  let error_to_string = function
    | `CustomDBEngineVersionNotFoundFault _ ->
        "com.amazonaws.rds#CustomDBEngineVersionNotFoundFault"
    | `InvalidCustomDBEngineVersionStateFault _ ->
        "com.amazonaws.rds#InvalidCustomDBEngineVersionStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CustomDBEngineVersionNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_db_engine_version_not_found_fault_of_xml
        with
        | Ok s -> `CustomDBEngineVersionNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCustomDBEngineVersionStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_custom_db_engine_version_state_fault_of_xml
        with
        | Ok s -> `InvalidCustomDBEngineVersionStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_custom_db_engine_version_message) =
    let fields = modify_custom_db_engine_version_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyCustomDBEngineVersion"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_engine_version_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_custom_db_engine_version_message) =
    let fields = modify_custom_db_engine_version_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyCustomDBEngineVersion"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_engine_version_of_xml ~error_deserializer
end

module ModifyDBCluster = struct
  let error_to_string = function
    | `DBClusterAlreadyExistsFault _ -> "com.amazonaws.rds#DBClusterAlreadyExistsFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.rds#DBClusterParameterGroupNotFoundFault"
    | `DBInstanceAlreadyExistsFault _ -> "com.amazonaws.rds#DBInstanceAlreadyExistsFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.rds#DBSubnetGroupNotFoundFault"
    | `DomainNotFoundFault _ -> "com.amazonaws.rds#DomainNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `InvalidDBSecurityGroupStateFault _ -> "com.amazonaws.rds#InvalidDBSecurityGroupStateFault"
    | `InvalidDBSubnetGroupStateFault _ -> "com.amazonaws.rds#InvalidDBSubnetGroupStateFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.rds#InvalidGlobalClusterStateFault"
    | `InvalidSubnet _ -> "com.amazonaws.rds#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.rds#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupported _ -> "com.amazonaws.rds#NetworkTypeNotSupported"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.rds#OptionGroupNotFoundFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.rds#StorageQuotaExceededFault"
    | `StorageTypeNotAvailableFault _ -> "com.amazonaws.rds#StorageTypeNotAvailableFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.rds#StorageTypeNotSupportedFault"
    | `VpcEncryptionControlViolationException _ ->
        "com.amazonaws.rds#VpcEncryptionControlViolationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_already_exists_fault_of_xml
        with
        | Ok s -> `DBClusterAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_already_exists_fault_of_xml
        with
        | Ok s -> `DBInstanceAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DomainNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:domain_not_found_fault_of_xml
        with
        | Ok s -> `DomainNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSubnetGroupStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_subnet_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSubnetGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NetworkTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:network_type_not_supported_of_xml
        with
        | Ok s -> `NetworkTypeNotSupported s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OptionGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_not_found_fault_of_xml
        with
        | Ok s -> `OptionGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_quota_exceeded_fault_of_xml
        with
        | Ok s -> `StorageQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageTypeNotAvailableFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_type_not_available_fault_of_xml
        with
        | Ok s -> `StorageTypeNotAvailableFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_type_not_supported_fault_of_xml
        with
        | Ok s -> `StorageTypeNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "VpcEncryptionControlViolationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:vpc_encryption_control_violation_exception_of_xml
        with
        | Ok s -> `VpcEncryptionControlViolationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_db_cluster_message) =
    let fields = modify_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_db_cluster_message) =
    let fields = modify_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_cluster_result_of_xml ~error_deserializer
end

module ModifyDBClusterEndpoint = struct
  let error_to_string = function
    | `DBClusterEndpointNotFoundFault _ -> "com.amazonaws.rds#DBClusterEndpointNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `InvalidDBClusterEndpointStateFault _ ->
        "com.amazonaws.rds#InvalidDBClusterEndpointStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterEndpointNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_endpoint_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterEndpointNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterEndpointStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_endpoint_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterEndpointStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_db_cluster_endpoint_message) =
    let fields = modify_db_cluster_endpoint_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyDBClusterEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_endpoint_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_db_cluster_endpoint_message) =
    let fields = modify_db_cluster_endpoint_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyDBClusterEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_endpoint_of_xml ~error_deserializer
end

module ModifyDBClusterParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | `InvalidDBParameterGroupStateFault _ -> "com.amazonaws.rds#InvalidDBParameterGroupStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBParameterGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_parameter_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBParameterGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_db_cluster_parameter_group_message) =
    let fields = modify_db_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyDBClusterParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_parameter_group_name_message_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_db_cluster_parameter_group_message) =
    let fields = modify_db_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyDBClusterParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_parameter_group_name_message_of_xml ~error_deserializer
end

module ModifyDBClusterSnapshotAttribute = struct
  let error_to_string = function
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBClusterSnapshotNotFoundFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.rds#InvalidDBClusterSnapshotStateFault"
    | `SharedSnapshotQuotaExceededFault _ -> "com.amazonaws.rds#SharedSnapshotQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterSnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterSnapshotStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SharedSnapshotQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:shared_snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `SharedSnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_db_cluster_snapshot_attribute_message) =
    let fields = modify_db_cluster_snapshot_attribute_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyDBClusterSnapshotAttribute"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_cluster_snapshot_attribute_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_db_cluster_snapshot_attribute_message) =
    let fields = modify_db_cluster_snapshot_attribute_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyDBClusterSnapshotAttribute"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_cluster_snapshot_attribute_result_of_xml ~error_deserializer
end

module ModifyDBInstance = struct
  let error_to_string = function
    | `AuthorizationNotFoundFault _ -> "com.amazonaws.rds#AuthorizationNotFoundFault"
    | `BackupPolicyNotFoundFault _ -> "com.amazonaws.rds#BackupPolicyNotFoundFault"
    | `CertificateNotFoundFault _ -> "com.amazonaws.rds#CertificateNotFoundFault"
    | `DBInstanceAlreadyExistsFault _ -> "com.amazonaws.rds#DBInstanceAlreadyExistsFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | `DBSecurityGroupNotFoundFault _ -> "com.amazonaws.rds#DBSecurityGroupNotFoundFault"
    | `DBUpgradeDependencyFailureFault _ -> "com.amazonaws.rds#DBUpgradeDependencyFailureFault"
    | `DomainNotFoundFault _ -> "com.amazonaws.rds#DomainNotFoundFault"
    | `InsufficientDBInstanceCapacityFault _ ->
        "com.amazonaws.rds#InsufficientDBInstanceCapacityFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `InvalidDBSecurityGroupStateFault _ -> "com.amazonaws.rds#InvalidDBSecurityGroupStateFault"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.rds#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupported _ -> "com.amazonaws.rds#NetworkTypeNotSupported"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.rds#OptionGroupNotFoundFault"
    | `ProvisionedIopsNotAvailableInAZFault _ ->
        "com.amazonaws.rds#ProvisionedIopsNotAvailableInAZFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.rds#StorageQuotaExceededFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.rds#StorageTypeNotSupportedFault"
    | `TenantDatabaseQuotaExceededFault _ -> "com.amazonaws.rds#TenantDatabaseQuotaExceededFault"
    | `VpcEncryptionControlViolationException _ ->
        "com.amazonaws.rds#VpcEncryptionControlViolationException"
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
    | "BackupPolicyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:backup_policy_not_found_fault_of_xml
        with
        | Ok s -> `BackupPolicyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CertificateNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:certificate_not_found_fault_of_xml
        with
        | Ok s -> `CertificateNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_already_exists_fault_of_xml
        with
        | Ok s -> `DBInstanceAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_security_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBUpgradeDependencyFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_upgrade_dependency_failure_fault_of_xml
        with
        | Ok s -> `DBUpgradeDependencyFailureFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DomainNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:domain_not_found_fault_of_xml
        with
        | Ok s -> `DomainNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientDBInstanceCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_db_instance_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientDBInstanceCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NetworkTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:network_type_not_supported_of_xml
        with
        | Ok s -> `NetworkTypeNotSupported s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OptionGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_not_found_fault_of_xml
        with
        | Ok s -> `OptionGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ProvisionedIopsNotAvailableInAZFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:provisioned_iops_not_available_in_az_fault_of_xml
        with
        | Ok s -> `ProvisionedIopsNotAvailableInAZFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_quota_exceeded_fault_of_xml
        with
        | Ok s -> `StorageQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_type_not_supported_fault_of_xml
        with
        | Ok s -> `StorageTypeNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TenantDatabaseQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tenant_database_quota_exceeded_fault_of_xml
        with
        | Ok s -> `TenantDatabaseQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "VpcEncryptionControlViolationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:vpc_encryption_control_violation_exception_of_xml
        with
        | Ok s -> `VpcEncryptionControlViolationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_db_instance_message) =
    let fields = modify_db_instance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyDBInstance"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_instance_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_db_instance_message) =
    let fields = modify_db_instance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyDBInstance"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_instance_result_of_xml ~error_deserializer
end

module ModifyDBParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | `InvalidDBParameterGroupStateFault _ -> "com.amazonaws.rds#InvalidDBParameterGroupStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBParameterGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_parameter_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBParameterGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_db_parameter_group_message) =
    let fields = modify_db_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyDBParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_parameter_group_name_message_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_db_parameter_group_message) =
    let fields = modify_db_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyDBParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_parameter_group_name_message_of_xml ~error_deserializer
end

module ModifyDBProxy = struct
  let error_to_string = function
    | `DBProxyAlreadyExistsFault _ -> "com.amazonaws.rds#DBProxyAlreadyExistsFault"
    | `DBProxyNotFoundFault _ -> "com.amazonaws.rds#DBProxyNotFoundFault"
    | `InvalidDBProxyStateFault _ -> "com.amazonaws.rds#InvalidDBProxyStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBProxyAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_already_exists_fault_of_xml
        with
        | Ok s -> `DBProxyAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBProxyStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_proxy_state_fault_of_xml
        with
        | Ok s -> `InvalidDBProxyStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_db_proxy_request) =
    let fields = modify_db_proxy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyDBProxy"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_proxy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_db_proxy_request) =
    let fields = modify_db_proxy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyDBProxy"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_proxy_response_of_xml ~error_deserializer
end

module ModifyDBProxyEndpoint = struct
  let error_to_string = function
    | `DBProxyEndpointAlreadyExistsFault _ -> "com.amazonaws.rds#DBProxyEndpointAlreadyExistsFault"
    | `DBProxyEndpointNotFoundFault _ -> "com.amazonaws.rds#DBProxyEndpointNotFoundFault"
    | `InvalidDBProxyEndpointStateFault _ -> "com.amazonaws.rds#InvalidDBProxyEndpointStateFault"
    | `InvalidDBProxyStateFault _ -> "com.amazonaws.rds#InvalidDBProxyStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBProxyEndpointAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_endpoint_already_exists_fault_of_xml
        with
        | Ok s -> `DBProxyEndpointAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyEndpointNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_endpoint_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyEndpointNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBProxyEndpointStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_proxy_endpoint_state_fault_of_xml
        with
        | Ok s -> `InvalidDBProxyEndpointStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBProxyStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_proxy_state_fault_of_xml
        with
        | Ok s -> `InvalidDBProxyStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_db_proxy_endpoint_request) =
    let fields = modify_db_proxy_endpoint_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyDBProxyEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_proxy_endpoint_response_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_db_proxy_endpoint_request) =
    let fields = modify_db_proxy_endpoint_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyDBProxyEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_proxy_endpoint_response_of_xml ~error_deserializer
end

module ModifyDBProxyTargetGroup = struct
  let error_to_string = function
    | `DBProxyNotFoundFault _ -> "com.amazonaws.rds#DBProxyNotFoundFault"
    | `DBProxyTargetGroupNotFoundFault _ -> "com.amazonaws.rds#DBProxyTargetGroupNotFoundFault"
    | `InvalidDBProxyStateFault _ -> "com.amazonaws.rds#InvalidDBProxyStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBProxyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyTargetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_target_group_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyTargetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBProxyStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_proxy_state_fault_of_xml
        with
        | Ok s -> `InvalidDBProxyStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_db_proxy_target_group_request) =
    let fields = modify_db_proxy_target_group_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyDBProxyTargetGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_proxy_target_group_response_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_db_proxy_target_group_request) =
    let fields = modify_db_proxy_target_group_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyDBProxyTargetGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_proxy_target_group_response_of_xml ~error_deserializer
end

module ModifyDBRecommendation = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_db_recommendation_message) =
    let fields = modify_db_recommendation_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyDBRecommendation"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_recommendation_message_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_db_recommendation_message) =
    let fields = modify_db_recommendation_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyDBRecommendation"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_recommendation_message_of_xml ~error_deserializer
end

module ModifyDBShardGroup = struct
  let error_to_string = function
    | `DBShardGroupAlreadyExistsFault _ -> "com.amazonaws.rds#DBShardGroupAlreadyExistsFault"
    | `DBShardGroupNotFoundFault _ -> "com.amazonaws.rds#DBShardGroupNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBShardGroupAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_shard_group_already_exists_fault_of_xml
        with
        | Ok s -> `DBShardGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBShardGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_shard_group_not_found_fault_of_xml
        with
        | Ok s -> `DBShardGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_db_shard_group_message) =
    let fields = modify_db_shard_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyDBShardGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_shard_group_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_db_shard_group_message) =
    let fields = modify_db_shard_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyDBShardGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_shard_group_of_xml ~error_deserializer
end

module ModifyDBSnapshot = struct
  let error_to_string = function
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBSnapshotNotFoundFault"
    | `InvalidDBSnapshotStateFault _ -> "com.amazonaws.rds#InvalidDBSnapshotStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSnapshotState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_db_snapshot_message) =
    let fields = modify_db_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyDBSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_db_snapshot_message) =
    let fields = modify_db_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyDBSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_snapshot_result_of_xml ~error_deserializer
end

module ModifyDBSnapshotAttribute = struct
  let error_to_string = function
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBSnapshotNotFoundFault"
    | `InvalidDBSnapshotStateFault _ -> "com.amazonaws.rds#InvalidDBSnapshotStateFault"
    | `SharedSnapshotQuotaExceededFault _ -> "com.amazonaws.rds#SharedSnapshotQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSnapshotState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SharedSnapshotQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:shared_snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `SharedSnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_db_snapshot_attribute_message) =
    let fields = modify_db_snapshot_attribute_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyDBSnapshotAttribute"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_snapshot_attribute_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_db_snapshot_attribute_message) =
    let fields = modify_db_snapshot_attribute_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyDBSnapshotAttribute"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_snapshot_attribute_result_of_xml ~error_deserializer
end

module ModifyDBSubnetGroup = struct
  let error_to_string = function
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.rds#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.rds#DBSubnetGroupNotFoundFault"
    | `DBSubnetQuotaExceededFault _ -> "com.amazonaws.rds#DBSubnetQuotaExceededFault"
    | `InvalidDBSubnetGroupStateFault _ -> "com.amazonaws.rds#InvalidDBSubnetGroupStateFault"
    | `InvalidSubnet _ -> "com.amazonaws.rds#InvalidSubnet"
    | `SubnetAlreadyInUse _ -> "com.amazonaws.rds#SubnetAlreadyInUse"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBSubnetGroupDoesNotCoverEnoughAZs" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_does_not_cover_enough_a_zs_of_xml
        with
        | Ok s -> `DBSubnetGroupDoesNotCoverEnoughAZs s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBSubnetQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSubnetGroupStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_subnet_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSubnetGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubnetAlreadyInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subnet_already_in_use_of_xml
        with
        | Ok s -> `SubnetAlreadyInUse s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_db_subnet_group_message) =
    let fields = modify_db_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyDBSubnetGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_subnet_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_db_subnet_group_message) =
    let fields = modify_db_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyDBSubnetGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_subnet_group_result_of_xml ~error_deserializer
end

module ModifyEventSubscription = struct
  let error_to_string = function
    | `EventSubscriptionQuotaExceededFault _ ->
        "com.amazonaws.rds#EventSubscriptionQuotaExceededFault"
    | `SNSInvalidTopicFault _ -> "com.amazonaws.rds#SNSInvalidTopicFault"
    | `SNSNoAuthorizationFault _ -> "com.amazonaws.rds#SNSNoAuthorizationFault"
    | `SNSTopicArnNotFoundFault _ -> "com.amazonaws.rds#SNSTopicArnNotFoundFault"
    | `SubscriptionCategoryNotFoundFault _ -> "com.amazonaws.rds#SubscriptionCategoryNotFoundFault"
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.rds#SubscriptionNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "EventSubscriptionQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:event_subscription_quota_exceeded_fault_of_xml
        with
        | Ok s -> `EventSubscriptionQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SNSInvalidTopic" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:sns_invalid_topic_fault_of_xml
        with
        | Ok s -> `SNSInvalidTopicFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SNSNoAuthorization" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:sns_no_authorization_fault_of_xml
        with
        | Ok s -> `SNSNoAuthorizationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SNSTopicArnNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:sns_topic_arn_not_found_fault_of_xml
        with
        | Ok s -> `SNSTopicArnNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubscriptionCategoryNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subscription_category_not_found_fault_of_xml
        with
        | Ok s -> `SubscriptionCategoryNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubscriptionNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subscription_not_found_fault_of_xml
        with
        | Ok s -> `SubscriptionNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_event_subscription_message) =
    let fields = modify_event_subscription_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyEventSubscription"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_event_subscription_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_event_subscription_message) =
    let fields = modify_event_subscription_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyEventSubscription"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_event_subscription_result_of_xml ~error_deserializer
end

module ModifyGlobalCluster = struct
  let error_to_string = function
    | `GlobalClusterAlreadyExistsFault _ -> "com.amazonaws.rds#GlobalClusterAlreadyExistsFault"
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.rds#GlobalClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.rds#InvalidGlobalClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "GlobalClusterAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_cluster_already_exists_fault_of_xml
        with
        | Ok s -> `GlobalClusterAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "GlobalClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_cluster_not_found_fault_of_xml
        with
        | Ok s -> `GlobalClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_global_cluster_message) =
    let fields = modify_global_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyGlobalCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_global_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_global_cluster_message) =
    let fields = modify_global_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyGlobalCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_global_cluster_result_of_xml ~error_deserializer
end

module ModifyIntegration = struct
  let error_to_string = function
    | `IntegrationConflictOperationFault _ -> "com.amazonaws.rds#IntegrationConflictOperationFault"
    | `IntegrationNotFoundFault _ -> "com.amazonaws.rds#IntegrationNotFoundFault"
    | `InvalidIntegrationStateFault _ -> "com.amazonaws.rds#InvalidIntegrationStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "IntegrationConflictOperationFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_conflict_operation_fault_of_xml
        with
        | Ok s -> `IntegrationConflictOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IntegrationNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_not_found_fault_of_xml
        with
        | Ok s -> `IntegrationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidIntegrationStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_integration_state_fault_of_xml
        with
        | Ok s -> `InvalidIntegrationStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_integration_message) =
    let fields = modify_integration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyIntegration"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:integration_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_integration_message) =
    let fields = modify_integration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyIntegration"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:integration_of_xml ~error_deserializer
end

module ModifyOptionGroup = struct
  let error_to_string = function
    | `InvalidOptionGroupStateFault _ -> "com.amazonaws.rds#InvalidOptionGroupStateFault"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.rds#OptionGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidOptionGroupStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_option_group_state_fault_of_xml
        with
        | Ok s -> `InvalidOptionGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OptionGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_not_found_fault_of_xml
        with
        | Ok s -> `OptionGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_option_group_message) =
    let fields = modify_option_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyOptionGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_option_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_option_group_message) =
    let fields = modify_option_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyOptionGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_option_group_result_of_xml ~error_deserializer
end

module ModifyTenantDatabase = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `TenantDatabaseAlreadyExistsFault _ -> "com.amazonaws.rds#TenantDatabaseAlreadyExistsFault"
    | `TenantDatabaseNotFoundFault _ -> "com.amazonaws.rds#TenantDatabaseNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TenantDatabaseAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tenant_database_already_exists_fault_of_xml
        with
        | Ok s -> `TenantDatabaseAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TenantDatabaseNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tenant_database_not_found_fault_of_xml
        with
        | Ok s -> `TenantDatabaseNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_tenant_database_message) =
    let fields = modify_tenant_database_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyTenantDatabase"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_tenant_database_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_tenant_database_message) =
    let fields = modify_tenant_database_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyTenantDatabase"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_tenant_database_result_of_xml ~error_deserializer
end

module PromoteReadReplica = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : promote_read_replica_message) =
    let fields = promote_read_replica_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PromoteReadReplica"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:promote_read_replica_result_of_xml ~error_deserializer

  let request_with_metadata context (request : promote_read_replica_message) =
    let fields = promote_read_replica_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PromoteReadReplica"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:promote_read_replica_result_of_xml ~error_deserializer
end

module PromoteReadReplicaDBCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : promote_read_replica_db_cluster_message) =
    let fields = promote_read_replica_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PromoteReadReplicaDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:promote_read_replica_db_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : promote_read_replica_db_cluster_message) =
    let fields = promote_read_replica_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PromoteReadReplicaDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:promote_read_replica_db_cluster_result_of_xml ~error_deserializer
end

module PurchaseReservedDBInstancesOffering = struct
  let error_to_string = function
    | `ReservedDBInstanceAlreadyExistsFault _ ->
        "com.amazonaws.rds#ReservedDBInstanceAlreadyExistsFault"
    | `ReservedDBInstanceQuotaExceededFault _ ->
        "com.amazonaws.rds#ReservedDBInstanceQuotaExceededFault"
    | `ReservedDBInstancesOfferingNotFoundFault _ ->
        "com.amazonaws.rds#ReservedDBInstancesOfferingNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ReservedDBInstanceAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_db_instance_already_exists_fault_of_xml
        with
        | Ok s -> `ReservedDBInstanceAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedDBInstanceQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_db_instance_quota_exceeded_fault_of_xml
        with
        | Ok s -> `ReservedDBInstanceQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedDBInstancesOfferingNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_db_instances_offering_not_found_fault_of_xml
        with
        | Ok s -> `ReservedDBInstancesOfferingNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : purchase_reserved_db_instances_offering_message) =
    let fields = purchase_reserved_db_instances_offering_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PurchaseReservedDBInstancesOffering"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:purchase_reserved_db_instances_offering_result_of_xml ~error_deserializer

  let request_with_metadata context (request : purchase_reserved_db_instances_offering_message) =
    let fields = purchase_reserved_db_instances_offering_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PurchaseReservedDBInstancesOffering"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:purchase_reserved_db_instances_offering_result_of_xml ~error_deserializer
end

module RebootDBCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : reboot_db_cluster_message) =
    let fields = reboot_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RebootDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:reboot_db_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : reboot_db_cluster_message) =
    let fields = reboot_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RebootDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:reboot_db_cluster_result_of_xml ~error_deserializer
end

module RebootDBInstance = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : reboot_db_instance_message) =
    let fields = reboot_db_instance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RebootDBInstance"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:reboot_db_instance_result_of_xml ~error_deserializer

  let request_with_metadata context (request : reboot_db_instance_message) =
    let fields = reboot_db_instance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RebootDBInstance"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:reboot_db_instance_result_of_xml ~error_deserializer
end

module RebootDBShardGroup = struct
  let error_to_string = function
    | `DBShardGroupNotFoundFault _ -> "com.amazonaws.rds#DBShardGroupNotFoundFault"
    | `InvalidDBShardGroupStateFault _ -> "com.amazonaws.rds#InvalidDBShardGroupStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBShardGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_shard_group_not_found_fault_of_xml
        with
        | Ok s -> `DBShardGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBShardGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_shard_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBShardGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : reboot_db_shard_group_message) =
    let fields = reboot_db_shard_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RebootDBShardGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_shard_group_of_xml ~error_deserializer

  let request_with_metadata context (request : reboot_db_shard_group_message) =
    let fields = reboot_db_shard_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RebootDBShardGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_shard_group_of_xml ~error_deserializer
end

module RegisterDBProxyTargets = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBProxyNotFoundFault _ -> "com.amazonaws.rds#DBProxyNotFoundFault"
    | `DBProxyTargetAlreadyRegisteredFault _ ->
        "com.amazonaws.rds#DBProxyTargetAlreadyRegisteredFault"
    | `DBProxyTargetGroupNotFoundFault _ -> "com.amazonaws.rds#DBProxyTargetGroupNotFoundFault"
    | `InsufficientAvailableIPsInSubnetFault _ ->
        "com.amazonaws.rds#InsufficientAvailableIPsInSubnetFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `InvalidDBProxyStateFault _ -> "com.amazonaws.rds#InvalidDBProxyStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyTargetAlreadyRegisteredFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_target_already_registered_fault_of_xml
        with
        | Ok s -> `DBProxyTargetAlreadyRegisteredFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyTargetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_target_group_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyTargetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientAvailableIPsInSubnetFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_available_i_ps_in_subnet_fault_of_xml
        with
        | Ok s -> `InsufficientAvailableIPsInSubnetFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBProxyStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_proxy_state_fault_of_xml
        with
        | Ok s -> `InvalidDBProxyStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : register_db_proxy_targets_request) =
    let fields = register_db_proxy_targets_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RegisterDBProxyTargets"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:register_db_proxy_targets_response_of_xml ~error_deserializer

  let request_with_metadata context (request : register_db_proxy_targets_request) =
    let fields = register_db_proxy_targets_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RegisterDBProxyTargets"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:register_db_proxy_targets_response_of_xml ~error_deserializer
end

module RemoveFromGlobalCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.rds#GlobalClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.rds#InvalidGlobalClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "GlobalClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_cluster_not_found_fault_of_xml
        with
        | Ok s -> `GlobalClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : remove_from_global_cluster_message) =
    let fields = remove_from_global_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RemoveFromGlobalCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:remove_from_global_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : remove_from_global_cluster_message) =
    let fields = remove_from_global_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RemoveFromGlobalCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:remove_from_global_cluster_result_of_xml ~error_deserializer
end

module RemoveRoleFromDBCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBClusterRoleNotFoundFault _ -> "com.amazonaws.rds#DBClusterRoleNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterRoleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_role_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : remove_role_from_db_cluster_message) =
    let fields = remove_role_from_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RemoveRoleFromDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : remove_role_from_db_cluster_message) =
    let fields = remove_role_from_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RemoveRoleFromDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module RemoveRoleFromDBInstance = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBInstanceRoleNotFoundFault _ -> "com.amazonaws.rds#DBInstanceRoleNotFoundFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceRoleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_role_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : remove_role_from_db_instance_message) =
    let fields = remove_role_from_db_instance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RemoveRoleFromDBInstance"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : remove_role_from_db_instance_message) =
    let fields = remove_role_from_db_instance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RemoveRoleFromDBInstance"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module RemoveSourceIdentifierFromSubscription = struct
  let error_to_string = function
    | `SourceNotFoundFault _ -> "com.amazonaws.rds#SourceNotFoundFault"
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.rds#SubscriptionNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "SourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:source_not_found_fault_of_xml
        with
        | Ok s -> `SourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubscriptionNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subscription_not_found_fault_of_xml
        with
        | Ok s -> `SubscriptionNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : remove_source_identifier_from_subscription_message) =
    let fields = remove_source_identifier_from_subscription_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RemoveSourceIdentifierFromSubscription"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:remove_source_identifier_from_subscription_result_of_xml
      ~error_deserializer

  let request_with_metadata context (request : remove_source_identifier_from_subscription_message) =
    let fields = remove_source_identifier_from_subscription_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"RemoveSourceIdentifierFromSubscription"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:remove_source_identifier_from_subscription_result_of_xml
      ~error_deserializer
end

module RemoveTagsFromResource = struct
  let error_to_string = function
    | `BlueGreenDeploymentNotFoundFault _ -> "com.amazonaws.rds#BlueGreenDeploymentNotFoundFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBProxyEndpointNotFoundFault _ -> "com.amazonaws.rds#DBProxyEndpointNotFoundFault"
    | `DBProxyNotFoundFault _ -> "com.amazonaws.rds#DBProxyNotFoundFault"
    | `DBProxyTargetGroupNotFoundFault _ -> "com.amazonaws.rds#DBProxyTargetGroupNotFoundFault"
    | `DBShardGroupNotFoundFault _ -> "com.amazonaws.rds#DBShardGroupNotFoundFault"
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBSnapshotNotFoundFault"
    | `DBSnapshotTenantDatabaseNotFoundFault _ ->
        "com.amazonaws.rds#DBSnapshotTenantDatabaseNotFoundFault"
    | `IntegrationNotFoundFault _ -> "com.amazonaws.rds#IntegrationNotFoundFault"
    | `InvalidDBClusterEndpointStateFault _ ->
        "com.amazonaws.rds#InvalidDBClusterEndpointStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `TenantDatabaseNotFoundFault _ -> "com.amazonaws.rds#TenantDatabaseNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BlueGreenDeploymentNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:blue_green_deployment_not_found_fault_of_xml
        with
        | Ok s -> `BlueGreenDeploymentNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyEndpointNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_endpoint_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyEndpointNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBProxyTargetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_proxy_target_group_not_found_fault_of_xml
        with
        | Ok s -> `DBProxyTargetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBShardGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_shard_group_not_found_fault_of_xml
        with
        | Ok s -> `DBShardGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSnapshotTenantDatabaseNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_tenant_database_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotTenantDatabaseNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IntegrationNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_not_found_fault_of_xml
        with
        | Ok s -> `IntegrationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterEndpointStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_endpoint_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterEndpointStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TenantDatabaseNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tenant_database_not_found_fault_of_xml
        with
        | Ok s -> `TenantDatabaseNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : remove_tags_from_resource_message) =
    let fields = remove_tags_from_resource_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RemoveTagsFromResource"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : remove_tags_from_resource_message) =
    let fields = remove_tags_from_resource_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RemoveTagsFromResource"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module ResetDBClusterParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | `InvalidDBParameterGroupStateFault _ -> "com.amazonaws.rds#InvalidDBParameterGroupStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBParameterGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_parameter_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBParameterGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : reset_db_cluster_parameter_group_message) =
    let fields = reset_db_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ResetDBClusterParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_parameter_group_name_message_of_xml ~error_deserializer

  let request_with_metadata context (request : reset_db_cluster_parameter_group_message) =
    let fields = reset_db_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ResetDBClusterParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_cluster_parameter_group_name_message_of_xml ~error_deserializer
end

module ResetDBParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | `InvalidDBParameterGroupStateFault _ -> "com.amazonaws.rds#InvalidDBParameterGroupStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBParameterGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_parameter_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBParameterGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : reset_db_parameter_group_message) =
    let fields = reset_db_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ResetDBParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_parameter_group_name_message_of_xml ~error_deserializer

  let request_with_metadata context (request : reset_db_parameter_group_message) =
    let fields = reset_db_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ResetDBParameterGroup"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:db_parameter_group_name_message_of_xml ~error_deserializer
end

module RestoreDBClusterFromS3 = struct
  let error_to_string = function
    | `DBClusterAlreadyExistsFault _ -> "com.amazonaws.rds#DBClusterAlreadyExistsFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.rds#DBClusterParameterGroupNotFoundFault"
    | `DBClusterQuotaExceededFault _ -> "com.amazonaws.rds#DBClusterQuotaExceededFault"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.rds#DBSubnetGroupNotFoundFault"
    | `DomainNotFoundFault _ -> "com.amazonaws.rds#DomainNotFoundFault"
    | `InsufficientStorageClusterCapacityFault _ ->
        "com.amazonaws.rds#InsufficientStorageClusterCapacityFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBSubnetGroupStateFault _ -> "com.amazonaws.rds#InvalidDBSubnetGroupStateFault"
    | `InvalidS3BucketFault _ -> "com.amazonaws.rds#InvalidS3BucketFault"
    | `InvalidSubnet _ -> "com.amazonaws.rds#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.rds#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupported _ -> "com.amazonaws.rds#NetworkTypeNotSupported"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.rds#StorageQuotaExceededFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.rds#StorageTypeNotSupportedFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_already_exists_fault_of_xml
        with
        | Ok s -> `DBClusterAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBClusterQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DomainNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:domain_not_found_fault_of_xml
        with
        | Ok s -> `DomainNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientStorageClusterCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_storage_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientStorageClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSubnetGroupStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_subnet_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSubnetGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidS3BucketFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_s3_bucket_fault_of_xml
        with
        | Ok s -> `InvalidS3BucketFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NetworkTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:network_type_not_supported_of_xml
        with
        | Ok s -> `NetworkTypeNotSupported s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_quota_exceeded_fault_of_xml
        with
        | Ok s -> `StorageQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_type_not_supported_fault_of_xml
        with
        | Ok s -> `StorageTypeNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : restore_db_cluster_from_s3_message) =
    let fields = restore_db_cluster_from_s3_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RestoreDBClusterFromS3"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:restore_db_cluster_from_s3_result_of_xml ~error_deserializer

  let request_with_metadata context (request : restore_db_cluster_from_s3_message) =
    let fields = restore_db_cluster_from_s3_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RestoreDBClusterFromS3"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:restore_db_cluster_from_s3_result_of_xml ~error_deserializer
end

module RestoreDBClusterFromSnapshot = struct
  let error_to_string = function
    | `DBClusterAlreadyExistsFault _ -> "com.amazonaws.rds#DBClusterAlreadyExistsFault"
    | `DBClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.rds#DBClusterParameterGroupNotFoundFault"
    | `DBClusterQuotaExceededFault _ -> "com.amazonaws.rds#DBClusterQuotaExceededFault"
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBClusterSnapshotNotFoundFault"
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBSnapshotNotFoundFault"
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.rds#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.rds#DBSubnetGroupNotFoundFault"
    | `DomainNotFoundFault _ -> "com.amazonaws.rds#DomainNotFoundFault"
    | `InsufficientDBClusterCapacityFault _ ->
        "com.amazonaws.rds#InsufficientDBClusterCapacityFault"
    | `InsufficientDBInstanceCapacityFault _ ->
        "com.amazonaws.rds#InsufficientDBInstanceCapacityFault"
    | `InsufficientStorageClusterCapacityFault _ ->
        "com.amazonaws.rds#InsufficientStorageClusterCapacityFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.rds#InvalidDBClusterSnapshotStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `InvalidDBSnapshotStateFault _ -> "com.amazonaws.rds#InvalidDBSnapshotStateFault"
    | `InvalidRestoreFault _ -> "com.amazonaws.rds#InvalidRestoreFault"
    | `InvalidSubnet _ -> "com.amazonaws.rds#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.rds#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupported _ -> "com.amazonaws.rds#NetworkTypeNotSupported"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.rds#OptionGroupNotFoundFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.rds#StorageQuotaExceededFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.rds#StorageTypeNotSupportedFault"
    | `VpcEncryptionControlViolationException _ ->
        "com.amazonaws.rds#VpcEncryptionControlViolationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_already_exists_fault_of_xml
        with
        | Ok s -> `DBClusterAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBClusterQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterSnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupDoesNotCoverEnoughAZs" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_does_not_cover_enough_a_zs_of_xml
        with
        | Ok s -> `DBSubnetGroupDoesNotCoverEnoughAZs s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DomainNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:domain_not_found_fault_of_xml
        with
        | Ok s -> `DomainNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientDBClusterCapacityFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_db_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientDBClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientDBInstanceCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_db_instance_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientDBInstanceCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientStorageClusterCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_storage_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientStorageClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterSnapshotStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSnapshotState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRestoreFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_restore_fault_of_xml
        with
        | Ok s -> `InvalidRestoreFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NetworkTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:network_type_not_supported_of_xml
        with
        | Ok s -> `NetworkTypeNotSupported s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OptionGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_not_found_fault_of_xml
        with
        | Ok s -> `OptionGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_quota_exceeded_fault_of_xml
        with
        | Ok s -> `StorageQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_type_not_supported_fault_of_xml
        with
        | Ok s -> `StorageTypeNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "VpcEncryptionControlViolationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:vpc_encryption_control_violation_exception_of_xml
        with
        | Ok s -> `VpcEncryptionControlViolationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : restore_db_cluster_from_snapshot_message) =
    let fields = restore_db_cluster_from_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RestoreDBClusterFromSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:restore_db_cluster_from_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : restore_db_cluster_from_snapshot_message) =
    let fields = restore_db_cluster_from_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RestoreDBClusterFromSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:restore_db_cluster_from_snapshot_result_of_xml ~error_deserializer
end

module RestoreDBClusterToPointInTime = struct
  let error_to_string = function
    | `DBClusterAlreadyExistsFault _ -> "com.amazonaws.rds#DBClusterAlreadyExistsFault"
    | `DBClusterAutomatedBackupNotFoundFault _ ->
        "com.amazonaws.rds#DBClusterAutomatedBackupNotFoundFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.rds#DBClusterParameterGroupNotFoundFault"
    | `DBClusterQuotaExceededFault _ -> "com.amazonaws.rds#DBClusterQuotaExceededFault"
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBClusterSnapshotNotFoundFault"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.rds#DBSubnetGroupNotFoundFault"
    | `DomainNotFoundFault _ -> "com.amazonaws.rds#DomainNotFoundFault"
    | `InsufficientDBClusterCapacityFault _ ->
        "com.amazonaws.rds#InsufficientDBClusterCapacityFault"
    | `InsufficientDBInstanceCapacityFault _ ->
        "com.amazonaws.rds#InsufficientDBInstanceCapacityFault"
    | `InsufficientStorageClusterCapacityFault _ ->
        "com.amazonaws.rds#InsufficientStorageClusterCapacityFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.rds#InvalidDBClusterSnapshotStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBSnapshotStateFault _ -> "com.amazonaws.rds#InvalidDBSnapshotStateFault"
    | `InvalidRestoreFault _ -> "com.amazonaws.rds#InvalidRestoreFault"
    | `InvalidSubnet _ -> "com.amazonaws.rds#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.rds#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupported _ -> "com.amazonaws.rds#NetworkTypeNotSupported"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.rds#OptionGroupNotFoundFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.rds#StorageQuotaExceededFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.rds#StorageTypeNotSupportedFault"
    | `VpcEncryptionControlViolationException _ ->
        "com.amazonaws.rds#VpcEncryptionControlViolationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_already_exists_fault_of_xml
        with
        | Ok s -> `DBClusterAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterAutomatedBackupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_automated_backup_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterAutomatedBackupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBClusterQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterSnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DomainNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:domain_not_found_fault_of_xml
        with
        | Ok s -> `DomainNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientDBClusterCapacityFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_db_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientDBClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientDBInstanceCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_db_instance_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientDBInstanceCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientStorageClusterCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_storage_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientStorageClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterSnapshotStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSnapshotState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRestoreFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_restore_fault_of_xml
        with
        | Ok s -> `InvalidRestoreFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NetworkTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:network_type_not_supported_of_xml
        with
        | Ok s -> `NetworkTypeNotSupported s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OptionGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_not_found_fault_of_xml
        with
        | Ok s -> `OptionGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_quota_exceeded_fault_of_xml
        with
        | Ok s -> `StorageQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_type_not_supported_fault_of_xml
        with
        | Ok s -> `StorageTypeNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "VpcEncryptionControlViolationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:vpc_encryption_control_violation_exception_of_xml
        with
        | Ok s -> `VpcEncryptionControlViolationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : restore_db_cluster_to_point_in_time_message) =
    let fields = restore_db_cluster_to_point_in_time_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RestoreDBClusterToPointInTime"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:restore_db_cluster_to_point_in_time_result_of_xml ~error_deserializer

  let request_with_metadata context (request : restore_db_cluster_to_point_in_time_message) =
    let fields = restore_db_cluster_to_point_in_time_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RestoreDBClusterToPointInTime"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:restore_db_cluster_to_point_in_time_result_of_xml ~error_deserializer
end

module RestoreDBInstanceFromDBSnapshot = struct
  let error_to_string = function
    | `AuthorizationNotFoundFault _ -> "com.amazonaws.rds#AuthorizationNotFoundFault"
    | `BackupPolicyNotFoundFault _ -> "com.amazonaws.rds#BackupPolicyNotFoundFault"
    | `CertificateNotFoundFault _ -> "com.amazonaws.rds#CertificateNotFoundFault"
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBClusterSnapshotNotFoundFault"
    | `DBInstanceAlreadyExistsFault _ -> "com.amazonaws.rds#DBInstanceAlreadyExistsFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | `DBSecurityGroupNotFoundFault _ -> "com.amazonaws.rds#DBSecurityGroupNotFoundFault"
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBSnapshotNotFoundFault"
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.rds#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.rds#DBSubnetGroupNotFoundFault"
    | `DomainNotFoundFault _ -> "com.amazonaws.rds#DomainNotFoundFault"
    | `InstanceQuotaExceededFault _ -> "com.amazonaws.rds#InstanceQuotaExceededFault"
    | `InsufficientDBInstanceCapacityFault _ ->
        "com.amazonaws.rds#InsufficientDBInstanceCapacityFault"
    | `InvalidDBSnapshotStateFault _ -> "com.amazonaws.rds#InvalidDBSnapshotStateFault"
    | `InvalidRestoreFault _ -> "com.amazonaws.rds#InvalidRestoreFault"
    | `InvalidSubnet _ -> "com.amazonaws.rds#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.rds#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupported _ -> "com.amazonaws.rds#NetworkTypeNotSupported"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.rds#OptionGroupNotFoundFault"
    | `ProvisionedIopsNotAvailableInAZFault _ ->
        "com.amazonaws.rds#ProvisionedIopsNotAvailableInAZFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.rds#StorageQuotaExceededFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.rds#StorageTypeNotSupportedFault"
    | `TenantDatabaseQuotaExceededFault _ -> "com.amazonaws.rds#TenantDatabaseQuotaExceededFault"
    | `VpcEncryptionControlViolationException _ ->
        "com.amazonaws.rds#VpcEncryptionControlViolationException"
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
    | "BackupPolicyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:backup_policy_not_found_fault_of_xml
        with
        | Ok s -> `BackupPolicyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CertificateNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:certificate_not_found_fault_of_xml
        with
        | Ok s -> `CertificateNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterSnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_already_exists_fault_of_xml
        with
        | Ok s -> `DBInstanceAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_security_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupDoesNotCoverEnoughAZs" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_does_not_cover_enough_a_zs_of_xml
        with
        | Ok s -> `DBSubnetGroupDoesNotCoverEnoughAZs s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DomainNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:domain_not_found_fault_of_xml
        with
        | Ok s -> `DomainNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InstanceQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:instance_quota_exceeded_fault_of_xml
        with
        | Ok s -> `InstanceQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientDBInstanceCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_db_instance_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientDBInstanceCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSnapshotState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRestoreFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_restore_fault_of_xml
        with
        | Ok s -> `InvalidRestoreFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NetworkTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:network_type_not_supported_of_xml
        with
        | Ok s -> `NetworkTypeNotSupported s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OptionGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_not_found_fault_of_xml
        with
        | Ok s -> `OptionGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ProvisionedIopsNotAvailableInAZFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:provisioned_iops_not_available_in_az_fault_of_xml
        with
        | Ok s -> `ProvisionedIopsNotAvailableInAZFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_quota_exceeded_fault_of_xml
        with
        | Ok s -> `StorageQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_type_not_supported_fault_of_xml
        with
        | Ok s -> `StorageTypeNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TenantDatabaseQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tenant_database_quota_exceeded_fault_of_xml
        with
        | Ok s -> `TenantDatabaseQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "VpcEncryptionControlViolationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:vpc_encryption_control_violation_exception_of_xml
        with
        | Ok s -> `VpcEncryptionControlViolationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : restore_db_instance_from_db_snapshot_message) =
    let fields = restore_db_instance_from_db_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RestoreDBInstanceFromDBSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:restore_db_instance_from_db_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : restore_db_instance_from_db_snapshot_message) =
    let fields = restore_db_instance_from_db_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RestoreDBInstanceFromDBSnapshot"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:restore_db_instance_from_db_snapshot_result_of_xml ~error_deserializer
end

module RestoreDBInstanceFromS3 = struct
  let error_to_string = function
    | `AuthorizationNotFoundFault _ -> "com.amazonaws.rds#AuthorizationNotFoundFault"
    | `BackupPolicyNotFoundFault _ -> "com.amazonaws.rds#BackupPolicyNotFoundFault"
    | `CertificateNotFoundFault _ -> "com.amazonaws.rds#CertificateNotFoundFault"
    | `DBInstanceAlreadyExistsFault _ -> "com.amazonaws.rds#DBInstanceAlreadyExistsFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | `DBSecurityGroupNotFoundFault _ -> "com.amazonaws.rds#DBSecurityGroupNotFoundFault"
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.rds#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.rds#DBSubnetGroupNotFoundFault"
    | `InstanceQuotaExceededFault _ -> "com.amazonaws.rds#InstanceQuotaExceededFault"
    | `InsufficientDBInstanceCapacityFault _ ->
        "com.amazonaws.rds#InsufficientDBInstanceCapacityFault"
    | `InvalidS3BucketFault _ -> "com.amazonaws.rds#InvalidS3BucketFault"
    | `InvalidSubnet _ -> "com.amazonaws.rds#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.rds#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupported _ -> "com.amazonaws.rds#NetworkTypeNotSupported"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.rds#OptionGroupNotFoundFault"
    | `ProvisionedIopsNotAvailableInAZFault _ ->
        "com.amazonaws.rds#ProvisionedIopsNotAvailableInAZFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.rds#StorageQuotaExceededFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.rds#StorageTypeNotSupportedFault"
    | `VpcEncryptionControlViolationException _ ->
        "com.amazonaws.rds#VpcEncryptionControlViolationException"
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
    | "BackupPolicyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:backup_policy_not_found_fault_of_xml
        with
        | Ok s -> `BackupPolicyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CertificateNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:certificate_not_found_fault_of_xml
        with
        | Ok s -> `CertificateNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_already_exists_fault_of_xml
        with
        | Ok s -> `DBInstanceAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_security_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupDoesNotCoverEnoughAZs" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_does_not_cover_enough_a_zs_of_xml
        with
        | Ok s -> `DBSubnetGroupDoesNotCoverEnoughAZs s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InstanceQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:instance_quota_exceeded_fault_of_xml
        with
        | Ok s -> `InstanceQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientDBInstanceCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_db_instance_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientDBInstanceCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidS3BucketFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_s3_bucket_fault_of_xml
        with
        | Ok s -> `InvalidS3BucketFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NetworkTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:network_type_not_supported_of_xml
        with
        | Ok s -> `NetworkTypeNotSupported s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OptionGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_not_found_fault_of_xml
        with
        | Ok s -> `OptionGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ProvisionedIopsNotAvailableInAZFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:provisioned_iops_not_available_in_az_fault_of_xml
        with
        | Ok s -> `ProvisionedIopsNotAvailableInAZFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_quota_exceeded_fault_of_xml
        with
        | Ok s -> `StorageQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_type_not_supported_fault_of_xml
        with
        | Ok s -> `StorageTypeNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "VpcEncryptionControlViolationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:vpc_encryption_control_violation_exception_of_xml
        with
        | Ok s -> `VpcEncryptionControlViolationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : restore_db_instance_from_s3_message) =
    let fields = restore_db_instance_from_s3_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RestoreDBInstanceFromS3"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:restore_db_instance_from_s3_result_of_xml ~error_deserializer

  let request_with_metadata context (request : restore_db_instance_from_s3_message) =
    let fields = restore_db_instance_from_s3_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RestoreDBInstanceFromS3"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:restore_db_instance_from_s3_result_of_xml ~error_deserializer
end

module RestoreDBInstanceToPointInTime = struct
  let error_to_string = function
    | `AuthorizationNotFoundFault _ -> "com.amazonaws.rds#AuthorizationNotFoundFault"
    | `BackupPolicyNotFoundFault _ -> "com.amazonaws.rds#BackupPolicyNotFoundFault"
    | `CertificateNotFoundFault _ -> "com.amazonaws.rds#CertificateNotFoundFault"
    | `DBInstanceAlreadyExistsFault _ -> "com.amazonaws.rds#DBInstanceAlreadyExistsFault"
    | `DBInstanceAutomatedBackupNotFoundFault _ ->
        "com.amazonaws.rds#DBInstanceAutomatedBackupNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.rds#DBParameterGroupNotFoundFault"
    | `DBSecurityGroupNotFoundFault _ -> "com.amazonaws.rds#DBSecurityGroupNotFoundFault"
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.rds#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.rds#DBSubnetGroupNotFoundFault"
    | `DomainNotFoundFault _ -> "com.amazonaws.rds#DomainNotFoundFault"
    | `InstanceQuotaExceededFault _ -> "com.amazonaws.rds#InstanceQuotaExceededFault"
    | `InsufficientDBInstanceCapacityFault _ ->
        "com.amazonaws.rds#InsufficientDBInstanceCapacityFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `InvalidRestoreFault _ -> "com.amazonaws.rds#InvalidRestoreFault"
    | `InvalidSubnet _ -> "com.amazonaws.rds#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.rds#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupported _ -> "com.amazonaws.rds#NetworkTypeNotSupported"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.rds#OptionGroupNotFoundFault"
    | `PointInTimeRestoreNotEnabledFault _ -> "com.amazonaws.rds#PointInTimeRestoreNotEnabledFault"
    | `ProvisionedIopsNotAvailableInAZFault _ ->
        "com.amazonaws.rds#ProvisionedIopsNotAvailableInAZFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.rds#StorageQuotaExceededFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.rds#StorageTypeNotSupportedFault"
    | `TenantDatabaseQuotaExceededFault _ -> "com.amazonaws.rds#TenantDatabaseQuotaExceededFault"
    | `VpcEncryptionControlViolationException _ ->
        "com.amazonaws.rds#VpcEncryptionControlViolationException"
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
    | "BackupPolicyNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:backup_policy_not_found_fault_of_xml
        with
        | Ok s -> `BackupPolicyNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CertificateNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:certificate_not_found_fault_of_xml
        with
        | Ok s -> `CertificateNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_already_exists_fault_of_xml
        with
        | Ok s -> `DBInstanceAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceAutomatedBackupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_automated_backup_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceAutomatedBackupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `DBParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_security_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupDoesNotCoverEnoughAZs" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_does_not_cover_enough_a_zs_of_xml
        with
        | Ok s -> `DBSubnetGroupDoesNotCoverEnoughAZs s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DomainNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:domain_not_found_fault_of_xml
        with
        | Ok s -> `DomainNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InstanceQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:instance_quota_exceeded_fault_of_xml
        with
        | Ok s -> `InstanceQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientDBInstanceCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_db_instance_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientDBInstanceCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRestoreFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_restore_fault_of_xml
        with
        | Ok s -> `InvalidRestoreFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NetworkTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:network_type_not_supported_of_xml
        with
        | Ok s -> `NetworkTypeNotSupported s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OptionGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:option_group_not_found_fault_of_xml
        with
        | Ok s -> `OptionGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PointInTimeRestoreNotEnabled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:point_in_time_restore_not_enabled_fault_of_xml
        with
        | Ok s -> `PointInTimeRestoreNotEnabledFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ProvisionedIopsNotAvailableInAZFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:provisioned_iops_not_available_in_az_fault_of_xml
        with
        | Ok s -> `ProvisionedIopsNotAvailableInAZFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_quota_exceeded_fault_of_xml
        with
        | Ok s -> `StorageQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_type_not_supported_fault_of_xml
        with
        | Ok s -> `StorageTypeNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TenantDatabaseQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tenant_database_quota_exceeded_fault_of_xml
        with
        | Ok s -> `TenantDatabaseQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "VpcEncryptionControlViolationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:vpc_encryption_control_violation_exception_of_xml
        with
        | Ok s -> `VpcEncryptionControlViolationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : restore_db_instance_to_point_in_time_message) =
    let fields = restore_db_instance_to_point_in_time_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RestoreDBInstanceToPointInTime"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:restore_db_instance_to_point_in_time_result_of_xml ~error_deserializer

  let request_with_metadata context (request : restore_db_instance_to_point_in_time_message) =
    let fields = restore_db_instance_to_point_in_time_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RestoreDBInstanceToPointInTime"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:restore_db_instance_to_point_in_time_result_of_xml ~error_deserializer
end

module RevokeDBSecurityGroupIngress = struct
  let error_to_string = function
    | `AuthorizationNotFoundFault _ -> "com.amazonaws.rds#AuthorizationNotFoundFault"
    | `DBSecurityGroupNotFoundFault _ -> "com.amazonaws.rds#DBSecurityGroupNotFoundFault"
    | `InvalidDBSecurityGroupStateFault _ -> "com.amazonaws.rds#InvalidDBSecurityGroupStateFault"
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
    | "DBSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_security_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : revoke_db_security_group_ingress_message) =
    let fields = revoke_db_security_group_ingress_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RevokeDBSecurityGroupIngress"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:revoke_db_security_group_ingress_result_of_xml ~error_deserializer

  let request_with_metadata context (request : revoke_db_security_group_ingress_message) =
    let fields = revoke_db_security_group_ingress_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RevokeDBSecurityGroupIngress"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:revoke_db_security_group_ingress_result_of_xml ~error_deserializer
end

module StartActivityStream = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.rds#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_fault_of_xml
        with
        | Ok s -> `ResourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : start_activity_stream_request) =
    let fields = start_activity_stream_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StartActivityStream"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:start_activity_stream_response_of_xml ~error_deserializer

  let request_with_metadata context (request : start_activity_stream_request) =
    let fields = start_activity_stream_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"StartActivityStream"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:start_activity_stream_response_of_xml ~error_deserializer
end

module StartDBCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `InvalidDBShardGroupStateFault _ -> "com.amazonaws.rds#InvalidDBShardGroupStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `VpcEncryptionControlViolationException _ ->
        "com.amazonaws.rds#VpcEncryptionControlViolationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBShardGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_shard_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBShardGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "VpcEncryptionControlViolationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:vpc_encryption_control_violation_exception_of_xml
        with
        | Ok s -> `VpcEncryptionControlViolationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : start_db_cluster_message) =
    let fields = start_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StartDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:start_db_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : start_db_cluster_message) =
    let fields = start_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"StartDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:start_db_cluster_result_of_xml ~error_deserializer
end

module StartDBInstance = struct
  let error_to_string = function
    | `AuthorizationNotFoundFault _ -> "com.amazonaws.rds#AuthorizationNotFoundFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.rds#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.rds#DBSubnetGroupNotFoundFault"
    | `InsufficientDBInstanceCapacityFault _ ->
        "com.amazonaws.rds#InsufficientDBInstanceCapacityFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `InvalidSubnet _ -> "com.amazonaws.rds#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.rds#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `VpcEncryptionControlViolationException _ ->
        "com.amazonaws.rds#VpcEncryptionControlViolationException"
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
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupDoesNotCoverEnoughAZs" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_does_not_cover_enough_a_zs_of_xml
        with
        | Ok s -> `DBSubnetGroupDoesNotCoverEnoughAZs s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientDBInstanceCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_db_instance_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientDBInstanceCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "VpcEncryptionControlViolationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:vpc_encryption_control_violation_exception_of_xml
        with
        | Ok s -> `VpcEncryptionControlViolationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : start_db_instance_message) =
    let fields = start_db_instance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StartDBInstance"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:start_db_instance_result_of_xml ~error_deserializer

  let request_with_metadata context (request : start_db_instance_message) =
    let fields = start_db_instance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"StartDBInstance"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:start_db_instance_result_of_xml ~error_deserializer
end

module StartDBInstanceAutomatedBackupsReplication = struct
  let error_to_string = function
    | `DBInstanceAutomatedBackupQuotaExceededFault _ ->
        "com.amazonaws.rds#DBInstanceAutomatedBackupQuotaExceededFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `InvalidDBInstanceAutomatedBackupStateFault _ ->
        "com.amazonaws.rds#InvalidDBInstanceAutomatedBackupStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.rds#StorageTypeNotSupportedFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceAutomatedBackupQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_automated_backup_quota_exceeded_fault_of_xml
        with
        | Ok s -> `DBInstanceAutomatedBackupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceAutomatedBackupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_automated_backup_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceAutomatedBackupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StorageTypeNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_type_not_supported_fault_of_xml
        with
        | Ok s -> `StorageTypeNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : start_db_instance_automated_backups_replication_message) =
    let fields = start_db_instance_automated_backups_replication_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StartDBInstanceAutomatedBackupsReplication"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:start_db_instance_automated_backups_replication_result_of_xml
      ~error_deserializer

  let request_with_metadata context
      (request : start_db_instance_automated_backups_replication_message) =
    let fields = start_db_instance_automated_backups_replication_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"StartDBInstanceAutomatedBackupsReplication"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:start_db_instance_automated_backups_replication_result_of_xml
      ~error_deserializer
end

module StartExportTask = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBClusterSnapshotNotFoundFault"
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.rds#DBSnapshotNotFoundFault"
    | `ExportTaskAlreadyExistsFault _ -> "com.amazonaws.rds#ExportTaskAlreadyExistsFault"
    | `IamRoleMissingPermissionsFault _ -> "com.amazonaws.rds#IamRoleMissingPermissionsFault"
    | `IamRoleNotFoundFault _ -> "com.amazonaws.rds#IamRoleNotFoundFault"
    | `InvalidExportOnlyFault _ -> "com.amazonaws.rds#InvalidExportOnlyFault"
    | `InvalidExportSourceStateFault _ -> "com.amazonaws.rds#InvalidExportSourceStateFault"
    | `InvalidS3BucketFault _ -> "com.amazonaws.rds#InvalidS3BucketFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.rds#KMSKeyNotAccessibleFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBClusterSnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ExportTaskAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:export_task_already_exists_fault_of_xml
        with
        | Ok s -> `ExportTaskAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IamRoleMissingPermissions" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:iam_role_missing_permissions_fault_of_xml
        with
        | Ok s -> `IamRoleMissingPermissionsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IamRoleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:iam_role_not_found_fault_of_xml
        with
        | Ok s -> `IamRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidExportOnly" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_export_only_fault_of_xml
        with
        | Ok s -> `InvalidExportOnlyFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidExportSourceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_export_source_state_fault_of_xml
        with
        | Ok s -> `InvalidExportSourceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidS3BucketFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_s3_bucket_fault_of_xml
        with
        | Ok s -> `InvalidS3BucketFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSKeyNotAccessibleFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_accessible_fault_of_xml
        with
        | Ok s -> `KMSKeyNotAccessibleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : start_export_task_message) =
    let fields = start_export_task_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StartExportTask"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:export_task_of_xml ~error_deserializer

  let request_with_metadata context (request : start_export_task_message) =
    let fields = start_export_task_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"StartExportTask"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:export_task_of_xml ~error_deserializer
end

module StopActivityStream = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.rds#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_fault_of_xml
        with
        | Ok s -> `ResourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : stop_activity_stream_request) =
    let fields = stop_activity_stream_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StopActivityStream"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:stop_activity_stream_response_of_xml ~error_deserializer

  let request_with_metadata context (request : stop_activity_stream_request) =
    let fields = stop_activity_stream_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"StopActivityStream"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:stop_activity_stream_response_of_xml ~error_deserializer
end

module StopDBCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `InvalidDBShardGroupStateFault _ -> "com.amazonaws.rds#InvalidDBShardGroupStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBShardGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_shard_group_state_fault_of_xml
        with
        | Ok s -> `InvalidDBShardGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : stop_db_cluster_message) =
    let fields = stop_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StopDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:stop_db_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : stop_db_cluster_message) =
    let fields = stop_db_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"StopDBCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:stop_db_cluster_result_of_xml ~error_deserializer
end

module StopDBInstance = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `DBSnapshotAlreadyExistsFault _ -> "com.amazonaws.rds#DBSnapshotAlreadyExistsFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.rds#SnapshotQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DBSnapshotAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `DBSnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `SnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : stop_db_instance_message) =
    let fields = stop_db_instance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StopDBInstance"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:stop_db_instance_result_of_xml ~error_deserializer

  let request_with_metadata context (request : stop_db_instance_message) =
    let fields = stop_db_instance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"StopDBInstance"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:stop_db_instance_result_of_xml ~error_deserializer
end

module StopDBInstanceAutomatedBackupsReplication = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : stop_db_instance_automated_backups_replication_message) =
    let fields = stop_db_instance_automated_backups_replication_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StopDBInstanceAutomatedBackupsReplication"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:stop_db_instance_automated_backups_replication_result_of_xml
      ~error_deserializer

  let request_with_metadata context
      (request : stop_db_instance_automated_backups_replication_message) =
    let fields = stop_db_instance_automated_backups_replication_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"StopDBInstanceAutomatedBackupsReplication"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:stop_db_instance_automated_backups_replication_result_of_xml
      ~error_deserializer
end

module SwitchoverBlueGreenDeployment = struct
  let error_to_string = function
    | `BlueGreenDeploymentNotFoundFault _ -> "com.amazonaws.rds#BlueGreenDeploymentNotFoundFault"
    | `InvalidBlueGreenDeploymentStateFault _ ->
        "com.amazonaws.rds#InvalidBlueGreenDeploymentStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BlueGreenDeploymentNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:blue_green_deployment_not_found_fault_of_xml
        with
        | Ok s -> `BlueGreenDeploymentNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidBlueGreenDeploymentStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_blue_green_deployment_state_fault_of_xml
        with
        | Ok s -> `InvalidBlueGreenDeploymentStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : switchover_blue_green_deployment_request) =
    let fields = switchover_blue_green_deployment_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SwitchoverBlueGreenDeployment"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:switchover_blue_green_deployment_response_of_xml ~error_deserializer

  let request_with_metadata context (request : switchover_blue_green_deployment_request) =
    let fields = switchover_blue_green_deployment_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SwitchoverBlueGreenDeployment"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:switchover_blue_green_deployment_response_of_xml ~error_deserializer
end

module SwitchoverGlobalCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.rds#DBClusterNotFoundFault"
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.rds#GlobalClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.rds#InvalidDBClusterStateFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.rds#InvalidGlobalClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_cluster_not_found_fault_of_xml
        with
        | Ok s -> `DBClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "GlobalClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_cluster_not_found_fault_of_xml
        with
        | Ok s -> `GlobalClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidDBClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalClusterStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : switchover_global_cluster_message) =
    let fields = switchover_global_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SwitchoverGlobalCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:switchover_global_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : switchover_global_cluster_message) =
    let fields = switchover_global_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SwitchoverGlobalCluster"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:switchover_global_cluster_result_of_xml ~error_deserializer
end

module SwitchoverReadReplica = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.rds#DBInstanceNotFoundFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.rds#InvalidDBInstanceStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DBInstanceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_instance_not_found_fault_of_xml
        with
        | Ok s -> `DBInstanceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDBInstanceState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_db_instance_state_fault_of_xml
        with
        | Ok s -> `InvalidDBInstanceStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : switchover_read_replica_message) =
    let fields = switchover_read_replica_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SwitchoverReadReplica"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:switchover_read_replica_result_of_xml ~error_deserializer

  let request_with_metadata context (request : switchover_read_replica_message) =
    let fields = switchover_read_replica_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SwitchoverReadReplica"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:switchover_read_replica_result_of_xml ~error_deserializer
end
