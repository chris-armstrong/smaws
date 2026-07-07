open Types
open Service_metadata
open Query_deserializers
open Query_serializers

module AddSourceIdentifierToSubscription = struct
  let error_to_string = function
    | `SourceNotFoundFault _ -> "com.amazonaws.docdb#SourceNotFoundFault"
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.docdb#SubscriptionNotFoundFault"
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.docdb#DBInstanceNotFoundFault"
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.docdb#DBSnapshotNotFoundFault"
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
    | "DBSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotNotFoundFault s
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
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.docdb#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.docdb#InvalidDBInstanceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.docdb#ResourceNotFoundFault"
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

module CopyDBClusterParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupAlreadyExistsFault _ ->
        "com.amazonaws.docdb#DBParameterGroupAlreadyExistsFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.docdb#DBParameterGroupNotFoundFault"
    | `DBParameterGroupQuotaExceededFault _ ->
        "com.amazonaws.docdb#DBParameterGroupQuotaExceededFault"
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
        "com.amazonaws.docdb#DBClusterSnapshotAlreadyExistsFault"
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.docdb#DBClusterSnapshotNotFoundFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.docdb#InvalidDBClusterSnapshotStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.docdb#InvalidDBClusterStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.docdb#KMSKeyNotAccessibleFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.docdb#SnapshotQuotaExceededFault"
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

module CreateDBCluster = struct
  let error_to_string = function
    | `DBClusterAlreadyExistsFault _ -> "com.amazonaws.docdb#DBClusterAlreadyExistsFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
    | `DBClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.docdb#DBClusterParameterGroupNotFoundFault"
    | `DBClusterQuotaExceededFault _ -> "com.amazonaws.docdb#DBClusterQuotaExceededFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.docdb#DBInstanceNotFoundFault"
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.docdb#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.docdb#DBSubnetGroupNotFoundFault"
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.docdb#GlobalClusterNotFoundFault"
    | `InsufficientStorageClusterCapacityFault _ ->
        "com.amazonaws.docdb#InsufficientStorageClusterCapacityFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.docdb#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.docdb#InvalidDBInstanceStateFault"
    | `InvalidDBSubnetGroupStateFault _ -> "com.amazonaws.docdb#InvalidDBSubnetGroupStateFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.docdb#InvalidGlobalClusterStateFault"
    | `InvalidSubnet _ -> "com.amazonaws.docdb#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.docdb#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.docdb#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupported _ -> "com.amazonaws.docdb#NetworkTypeNotSupported"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.docdb#StorageQuotaExceededFault"
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
    | "GlobalClusterNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_cluster_not_found_fault_of_xml
        with
        | Ok s -> `GlobalClusterNotFoundFault s
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
    | "StorageQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_quota_exceeded_fault_of_xml
        with
        | Ok s -> `StorageQuotaExceededFault s
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

module CreateDBClusterParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupAlreadyExistsFault _ ->
        "com.amazonaws.docdb#DBParameterGroupAlreadyExistsFault"
    | `DBParameterGroupQuotaExceededFault _ ->
        "com.amazonaws.docdb#DBParameterGroupQuotaExceededFault"
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
    | `DBClusterSnapshotAlreadyExistsFault _ ->
        "com.amazonaws.docdb#DBClusterSnapshotAlreadyExistsFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.docdb#InvalidDBClusterSnapshotStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.docdb#InvalidDBClusterStateFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.docdb#SnapshotQuotaExceededFault"
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
    | `AuthorizationNotFoundFault _ -> "com.amazonaws.docdb#AuthorizationNotFoundFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
    | `DBInstanceAlreadyExistsFault _ -> "com.amazonaws.docdb#DBInstanceAlreadyExistsFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.docdb#DBParameterGroupNotFoundFault"
    | `DBSecurityGroupNotFoundFault _ -> "com.amazonaws.docdb#DBSecurityGroupNotFoundFault"
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.docdb#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.docdb#DBSubnetGroupNotFoundFault"
    | `InstanceQuotaExceededFault _ -> "com.amazonaws.docdb#InstanceQuotaExceededFault"
    | `InsufficientDBInstanceCapacityFault _ ->
        "com.amazonaws.docdb#InsufficientDBInstanceCapacityFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.docdb#InvalidDBClusterStateFault"
    | `InvalidSubnet _ -> "com.amazonaws.docdb#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.docdb#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.docdb#KMSKeyNotAccessibleFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.docdb#StorageQuotaExceededFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.docdb#StorageTypeNotSupportedFault"
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

module CreateDBSubnetGroup = struct
  let error_to_string = function
    | `DBSubnetGroupAlreadyExistsFault _ -> "com.amazonaws.docdb#DBSubnetGroupAlreadyExistsFault"
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.docdb#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupQuotaExceededFault _ -> "com.amazonaws.docdb#DBSubnetGroupQuotaExceededFault"
    | `DBSubnetQuotaExceededFault _ -> "com.amazonaws.docdb#DBSubnetQuotaExceededFault"
    | `InvalidSubnet _ -> "com.amazonaws.docdb#InvalidSubnet"
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
        "com.amazonaws.docdb#EventSubscriptionQuotaExceededFault"
    | `SNSInvalidTopicFault _ -> "com.amazonaws.docdb#SNSInvalidTopicFault"
    | `SNSNoAuthorizationFault _ -> "com.amazonaws.docdb#SNSNoAuthorizationFault"
    | `SNSTopicArnNotFoundFault _ -> "com.amazonaws.docdb#SNSTopicArnNotFoundFault"
    | `SourceNotFoundFault _ -> "com.amazonaws.docdb#SourceNotFoundFault"
    | `SubscriptionAlreadyExistFault _ -> "com.amazonaws.docdb#SubscriptionAlreadyExistFault"
    | `SubscriptionCategoryNotFoundFault _ ->
        "com.amazonaws.docdb#SubscriptionCategoryNotFoundFault"
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
    | `GlobalClusterAlreadyExistsFault _ -> "com.amazonaws.docdb#GlobalClusterAlreadyExistsFault"
    | `GlobalClusterQuotaExceededFault _ -> "com.amazonaws.docdb#GlobalClusterQuotaExceededFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.docdb#InvalidDBClusterStateFault"
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

module DeleteDBCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
    | `DBClusterSnapshotAlreadyExistsFault _ ->
        "com.amazonaws.docdb#DBClusterSnapshotAlreadyExistsFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.docdb#InvalidDBClusterSnapshotStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.docdb#InvalidDBClusterStateFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.docdb#SnapshotQuotaExceededFault"
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

module DeleteDBClusterParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.docdb#DBParameterGroupNotFoundFault"
    | `InvalidDBParameterGroupStateFault _ ->
        "com.amazonaws.docdb#InvalidDBParameterGroupStateFault"
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
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.docdb#DBClusterSnapshotNotFoundFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.docdb#InvalidDBClusterSnapshotStateFault"
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
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.docdb#DBInstanceNotFoundFault"
    | `DBSnapshotAlreadyExistsFault _ -> "com.amazonaws.docdb#DBSnapshotAlreadyExistsFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.docdb#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.docdb#InvalidDBInstanceStateFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.docdb#SnapshotQuotaExceededFault"
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

module DeleteDBSubnetGroup = struct
  let error_to_string = function
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.docdb#DBSubnetGroupNotFoundFault"
    | `InvalidDBSubnetGroupStateFault _ -> "com.amazonaws.docdb#InvalidDBSubnetGroupStateFault"
    | `InvalidDBSubnetStateFault _ -> "com.amazonaws.docdb#InvalidDBSubnetStateFault"
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
        "com.amazonaws.docdb#InvalidEventSubscriptionStateFault"
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.docdb#SubscriptionNotFoundFault"
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
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.docdb#GlobalClusterNotFoundFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.docdb#InvalidGlobalClusterStateFault"
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

module DescribeCertificates = struct
  let error_to_string = function
    | `CertificateNotFoundFault _ -> "com.amazonaws.docdb#CertificateNotFoundFault"
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

module DescribeDBClusterParameterGroups = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.docdb#DBParameterGroupNotFoundFault"
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
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.docdb#DBParameterGroupNotFoundFault"
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
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.docdb#DBClusterSnapshotNotFoundFault"
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
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.docdb#DBClusterSnapshotNotFoundFault"
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
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

module DescribeDBInstances = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.docdb#DBInstanceNotFoundFault"
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

module DescribeDBSubnetGroups = struct
  let error_to_string = function
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.docdb#DBSubnetGroupNotFoundFault"
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
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.docdb#SubscriptionNotFoundFault"
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

module DescribeGlobalClusters = struct
  let error_to_string = function
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.docdb#GlobalClusterNotFoundFault"
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
    | `ResourceNotFoundFault _ -> "com.amazonaws.docdb#ResourceNotFoundFault"
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

module FailoverDBCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.docdb#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.docdb#InvalidDBInstanceStateFault"
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.docdb#GlobalClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.docdb#InvalidDBClusterStateFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.docdb#InvalidGlobalClusterStateFault"
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.docdb#DBInstanceNotFoundFault"
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.docdb#DBSnapshotNotFoundFault"
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
    | "DBSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotNotFoundFault s
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

module ModifyDBCluster = struct
  let error_to_string = function
    | `DBClusterAlreadyExistsFault _ -> "com.amazonaws.docdb#DBClusterAlreadyExistsFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
    | `DBClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.docdb#DBClusterParameterGroupNotFoundFault"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.docdb#DBSubnetGroupNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.docdb#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.docdb#InvalidDBInstanceStateFault"
    | `InvalidDBSecurityGroupStateFault _ -> "com.amazonaws.docdb#InvalidDBSecurityGroupStateFault"
    | `InvalidDBSubnetGroupStateFault _ -> "com.amazonaws.docdb#InvalidDBSubnetGroupStateFault"
    | `InvalidSubnet _ -> "com.amazonaws.docdb#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.docdb#InvalidVPCNetworkStateFault"
    | `NetworkTypeNotSupported _ -> "com.amazonaws.docdb#NetworkTypeNotSupported"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.docdb#StorageQuotaExceededFault"
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
    | "DBSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotFoundFault s
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

module ModifyDBClusterParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.docdb#DBParameterGroupNotFoundFault"
    | `InvalidDBParameterGroupStateFault _ ->
        "com.amazonaws.docdb#InvalidDBParameterGroupStateFault"
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
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.docdb#DBClusterSnapshotNotFoundFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.docdb#InvalidDBClusterSnapshotStateFault"
    | `SharedSnapshotQuotaExceededFault _ -> "com.amazonaws.docdb#SharedSnapshotQuotaExceededFault"
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
    | `AuthorizationNotFoundFault _ -> "com.amazonaws.docdb#AuthorizationNotFoundFault"
    | `CertificateNotFoundFault _ -> "com.amazonaws.docdb#CertificateNotFoundFault"
    | `DBInstanceAlreadyExistsFault _ -> "com.amazonaws.docdb#DBInstanceAlreadyExistsFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.docdb#DBInstanceNotFoundFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.docdb#DBParameterGroupNotFoundFault"
    | `DBSecurityGroupNotFoundFault _ -> "com.amazonaws.docdb#DBSecurityGroupNotFoundFault"
    | `DBUpgradeDependencyFailureFault _ -> "com.amazonaws.docdb#DBUpgradeDependencyFailureFault"
    | `InsufficientDBInstanceCapacityFault _ ->
        "com.amazonaws.docdb#InsufficientDBInstanceCapacityFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.docdb#InvalidDBInstanceStateFault"
    | `InvalidDBSecurityGroupStateFault _ -> "com.amazonaws.docdb#InvalidDBSecurityGroupStateFault"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.docdb#InvalidVPCNetworkStateFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.docdb#StorageQuotaExceededFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.docdb#StorageTypeNotSupportedFault"
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

module ModifyDBSubnetGroup = struct
  let error_to_string = function
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.docdb#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.docdb#DBSubnetGroupNotFoundFault"
    | `DBSubnetQuotaExceededFault _ -> "com.amazonaws.docdb#DBSubnetQuotaExceededFault"
    | `InvalidSubnet _ -> "com.amazonaws.docdb#InvalidSubnet"
    | `SubnetAlreadyInUse _ -> "com.amazonaws.docdb#SubnetAlreadyInUse"
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
        "com.amazonaws.docdb#EventSubscriptionQuotaExceededFault"
    | `SNSInvalidTopicFault _ -> "com.amazonaws.docdb#SNSInvalidTopicFault"
    | `SNSNoAuthorizationFault _ -> "com.amazonaws.docdb#SNSNoAuthorizationFault"
    | `SNSTopicArnNotFoundFault _ -> "com.amazonaws.docdb#SNSTopicArnNotFoundFault"
    | `SubscriptionCategoryNotFoundFault _ ->
        "com.amazonaws.docdb#SubscriptionCategoryNotFoundFault"
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.docdb#SubscriptionNotFoundFault"
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
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.docdb#GlobalClusterNotFoundFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.docdb#InvalidGlobalClusterStateFault"
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

module RebootDBInstance = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.docdb#DBInstanceNotFoundFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.docdb#InvalidDBInstanceStateFault"
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

module RemoveFromGlobalCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.docdb#GlobalClusterNotFoundFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.docdb#InvalidGlobalClusterStateFault"
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

module RemoveSourceIdentifierFromSubscription = struct
  let error_to_string = function
    | `SourceNotFoundFault _ -> "com.amazonaws.docdb#SourceNotFoundFault"
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.docdb#SubscriptionNotFoundFault"
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.docdb#DBInstanceNotFoundFault"
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.docdb#DBSnapshotNotFoundFault"
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
    | "DBSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `DBSnapshotNotFoundFault s
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
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.docdb#DBParameterGroupNotFoundFault"
    | `InvalidDBParameterGroupStateFault _ ->
        "com.amazonaws.docdb#InvalidDBParameterGroupStateFault"
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

module RestoreDBClusterFromSnapshot = struct
  let error_to_string = function
    | `DBClusterAlreadyExistsFault _ -> "com.amazonaws.docdb#DBClusterAlreadyExistsFault"
    | `DBClusterQuotaExceededFault _ -> "com.amazonaws.docdb#DBClusterQuotaExceededFault"
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.docdb#DBClusterSnapshotNotFoundFault"
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.docdb#DBSnapshotNotFoundFault"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.docdb#DBSubnetGroupNotFoundFault"
    | `InsufficientDBClusterCapacityFault _ ->
        "com.amazonaws.docdb#InsufficientDBClusterCapacityFault"
    | `InsufficientStorageClusterCapacityFault _ ->
        "com.amazonaws.docdb#InsufficientStorageClusterCapacityFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.docdb#InvalidDBClusterSnapshotStateFault"
    | `InvalidDBSnapshotStateFault _ -> "com.amazonaws.docdb#InvalidDBSnapshotStateFault"
    | `InvalidRestoreFault _ -> "com.amazonaws.docdb#InvalidRestoreFault"
    | `InvalidSubnet _ -> "com.amazonaws.docdb#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.docdb#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.docdb#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupported _ -> "com.amazonaws.docdb#NetworkTypeNotSupported"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.docdb#StorageQuotaExceededFault"
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
    | "DBSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:db_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `DBSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientDBClusterCapacityFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_db_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientDBClusterCapacityFault s
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
    | "StorageQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_quota_exceeded_fault_of_xml
        with
        | Ok s -> `StorageQuotaExceededFault s
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
    | `DBClusterAlreadyExistsFault _ -> "com.amazonaws.docdb#DBClusterAlreadyExistsFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
    | `DBClusterQuotaExceededFault _ -> "com.amazonaws.docdb#DBClusterQuotaExceededFault"
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.docdb#DBClusterSnapshotNotFoundFault"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.docdb#DBSubnetGroupNotFoundFault"
    | `InsufficientDBClusterCapacityFault _ ->
        "com.amazonaws.docdb#InsufficientDBClusterCapacityFault"
    | `InsufficientStorageClusterCapacityFault _ ->
        "com.amazonaws.docdb#InsufficientStorageClusterCapacityFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.docdb#InvalidDBClusterSnapshotStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.docdb#InvalidDBClusterStateFault"
    | `InvalidDBSnapshotStateFault _ -> "com.amazonaws.docdb#InvalidDBSnapshotStateFault"
    | `InvalidRestoreFault _ -> "com.amazonaws.docdb#InvalidRestoreFault"
    | `InvalidSubnet _ -> "com.amazonaws.docdb#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.docdb#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.docdb#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupported _ -> "com.amazonaws.docdb#NetworkTypeNotSupported"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.docdb#StorageQuotaExceededFault"
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
    | "InsufficientDBClusterCapacityFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_db_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientDBClusterCapacityFault s
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
    | "StorageQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:storage_quota_exceeded_fault_of_xml
        with
        | Ok s -> `StorageQuotaExceededFault s
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

module StartDBCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.docdb#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.docdb#InvalidDBInstanceStateFault"
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

module StopDBCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.docdb#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.docdb#InvalidDBInstanceStateFault"
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

module SwitchoverGlobalCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.docdb#DBClusterNotFoundFault"
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.docdb#GlobalClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.docdb#InvalidDBClusterStateFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.docdb#InvalidGlobalClusterStateFault"
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
