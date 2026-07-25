open Types
open Service_metadata
open Query_deserializers
open Query_serializers

module ApplyPendingMaintenanceAction = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.neptune#ResourceNotFoundFault"
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
        "com.amazonaws.neptune#DBParameterGroupAlreadyExistsFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.neptune#DBParameterGroupNotFoundFault"
    | `DBParameterGroupQuotaExceededFault _ ->
        "com.amazonaws.neptune#DBParameterGroupQuotaExceededFault"
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
        "com.amazonaws.neptune#DBClusterSnapshotAlreadyExistsFault"
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.neptune#DBClusterSnapshotNotFoundFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.neptune#InvalidDBClusterSnapshotStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.neptune#KMSKeyNotAccessibleFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.neptune#SnapshotQuotaExceededFault"
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
        "com.amazonaws.neptune#DBParameterGroupAlreadyExistsFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.neptune#DBParameterGroupNotFoundFault"
    | `DBParameterGroupQuotaExceededFault _ ->
        "com.amazonaws.neptune#DBParameterGroupQuotaExceededFault"
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

module CreateDBCluster = struct
  let error_to_string = function
    | `DBClusterAlreadyExistsFault _ -> "com.amazonaws.neptune#DBClusterAlreadyExistsFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `DBClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.neptune#DBClusterParameterGroupNotFoundFault"
    | `DBClusterQuotaExceededFault _ -> "com.amazonaws.neptune#DBClusterQuotaExceededFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.neptune#DBInstanceNotFoundFault"
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.neptune#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.neptune#DBSubnetGroupNotFoundFault"
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.neptune#GlobalClusterNotFoundFault"
    | `InsufficientStorageClusterCapacityFault _ ->
        "com.amazonaws.neptune#InsufficientStorageClusterCapacityFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.neptune#InvalidDBInstanceStateFault"
    | `InvalidDBSubnetGroupStateFault _ -> "com.amazonaws.neptune#InvalidDBSubnetGroupStateFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.neptune#InvalidGlobalClusterStateFault"
    | `InvalidSubnet _ -> "com.amazonaws.neptune#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.neptune#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.neptune#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupportedFault _ -> "com.amazonaws.neptune#NetworkTypeNotSupportedFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.neptune#StorageQuotaExceededFault"
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
            ~structParser:network_type_not_supported_fault_of_xml
        with
        | Ok s -> `NetworkTypeNotSupportedFault s
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

module CreateDBClusterEndpoint = struct
  let error_to_string = function
    | `DBClusterEndpointAlreadyExistsFault _ ->
        "com.amazonaws.neptune#DBClusterEndpointAlreadyExistsFault"
    | `DBClusterEndpointQuotaExceededFault _ ->
        "com.amazonaws.neptune#DBClusterEndpointQuotaExceededFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.neptune#DBInstanceNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.neptune#InvalidDBInstanceStateFault"
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
      ~output_deserializer:create_db_cluster_endpoint_output_of_xml ~error_deserializer

  let request_with_metadata context (request : create_db_cluster_endpoint_message) =
    let fields = create_db_cluster_endpoint_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateDBClusterEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:create_db_cluster_endpoint_output_of_xml ~error_deserializer
end

module CreateDBClusterParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupAlreadyExistsFault _ ->
        "com.amazonaws.neptune#DBParameterGroupAlreadyExistsFault"
    | `DBParameterGroupQuotaExceededFault _ ->
        "com.amazonaws.neptune#DBParameterGroupQuotaExceededFault"
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `DBClusterSnapshotAlreadyExistsFault _ ->
        "com.amazonaws.neptune#DBClusterSnapshotAlreadyExistsFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.neptune#InvalidDBClusterSnapshotStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.neptune#SnapshotQuotaExceededFault"
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
    | `AuthorizationNotFoundFault _ -> "com.amazonaws.neptune#AuthorizationNotFoundFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `DBInstanceAlreadyExistsFault _ -> "com.amazonaws.neptune#DBInstanceAlreadyExistsFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.neptune#DBParameterGroupNotFoundFault"
    | `DBSecurityGroupNotFoundFault _ -> "com.amazonaws.neptune#DBSecurityGroupNotFoundFault"
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.neptune#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.neptune#DBSubnetGroupNotFoundFault"
    | `DomainNotFoundFault _ -> "com.amazonaws.neptune#DomainNotFoundFault"
    | `InstanceQuotaExceededFault _ -> "com.amazonaws.neptune#InstanceQuotaExceededFault"
    | `InsufficientDBInstanceCapacityFault _ ->
        "com.amazonaws.neptune#InsufficientDBInstanceCapacityFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
    | `InvalidSubnet _ -> "com.amazonaws.neptune#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.neptune#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.neptune#KMSKeyNotAccessibleFault"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.neptune#OptionGroupNotFoundFault"
    | `ProvisionedIopsNotAvailableInAZFault _ ->
        "com.amazonaws.neptune#ProvisionedIopsNotAvailableInAZFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.neptune#StorageQuotaExceededFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.neptune#StorageTypeNotSupportedFault"
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

module CreateDBParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupAlreadyExistsFault _ ->
        "com.amazonaws.neptune#DBParameterGroupAlreadyExistsFault"
    | `DBParameterGroupQuotaExceededFault _ ->
        "com.amazonaws.neptune#DBParameterGroupQuotaExceededFault"
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

module CreateDBSubnetGroup = struct
  let error_to_string = function
    | `DBSubnetGroupAlreadyExistsFault _ -> "com.amazonaws.neptune#DBSubnetGroupAlreadyExistsFault"
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.neptune#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupQuotaExceededFault _ -> "com.amazonaws.neptune#DBSubnetGroupQuotaExceededFault"
    | `DBSubnetQuotaExceededFault _ -> "com.amazonaws.neptune#DBSubnetQuotaExceededFault"
    | `InvalidSubnet _ -> "com.amazonaws.neptune#InvalidSubnet"
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
        "com.amazonaws.neptune#EventSubscriptionQuotaExceededFault"
    | `SNSInvalidTopicFault _ -> "com.amazonaws.neptune#SNSInvalidTopicFault"
    | `SNSNoAuthorizationFault _ -> "com.amazonaws.neptune#SNSNoAuthorizationFault"
    | `SNSTopicArnNotFoundFault _ -> "com.amazonaws.neptune#SNSTopicArnNotFoundFault"
    | `SourceNotFoundFault _ -> "com.amazonaws.neptune#SourceNotFoundFault"
    | `SubscriptionAlreadyExistFault _ -> "com.amazonaws.neptune#SubscriptionAlreadyExistFault"
    | `SubscriptionCategoryNotFoundFault _ ->
        "com.amazonaws.neptune#SubscriptionCategoryNotFoundFault"
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `GlobalClusterAlreadyExistsFault _ -> "com.amazonaws.neptune#GlobalClusterAlreadyExistsFault"
    | `GlobalClusterQuotaExceededFault _ -> "com.amazonaws.neptune#GlobalClusterQuotaExceededFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `DBClusterSnapshotAlreadyExistsFault _ ->
        "com.amazonaws.neptune#DBClusterSnapshotAlreadyExistsFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.neptune#InvalidDBClusterSnapshotStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.neptune#SnapshotQuotaExceededFault"
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

module DeleteDBClusterEndpoint = struct
  let error_to_string = function
    | `DBClusterEndpointNotFoundFault _ -> "com.amazonaws.neptune#DBClusterEndpointNotFoundFault"
    | `InvalidDBClusterEndpointStateFault _ ->
        "com.amazonaws.neptune#InvalidDBClusterEndpointStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
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
      ~output_deserializer:delete_db_cluster_endpoint_output_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_db_cluster_endpoint_message) =
    let fields = delete_db_cluster_endpoint_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDBClusterEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:delete_db_cluster_endpoint_output_of_xml ~error_deserializer
end

module DeleteDBClusterParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.neptune#DBParameterGroupNotFoundFault"
    | `InvalidDBParameterGroupStateFault _ ->
        "com.amazonaws.neptune#InvalidDBParameterGroupStateFault"
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
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.neptune#DBClusterSnapshotNotFoundFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.neptune#InvalidDBClusterSnapshotStateFault"
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
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.neptune#DBInstanceNotFoundFault"
    | `DBSnapshotAlreadyExistsFault _ -> "com.amazonaws.neptune#DBSnapshotAlreadyExistsFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.neptune#InvalidDBInstanceStateFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.neptune#SnapshotQuotaExceededFault"
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

module DeleteDBParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.neptune#DBParameterGroupNotFoundFault"
    | `InvalidDBParameterGroupStateFault _ ->
        "com.amazonaws.neptune#InvalidDBParameterGroupStateFault"
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

module DeleteDBSubnetGroup = struct
  let error_to_string = function
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.neptune#DBSubnetGroupNotFoundFault"
    | `InvalidDBSubnetGroupStateFault _ -> "com.amazonaws.neptune#InvalidDBSubnetGroupStateFault"
    | `InvalidDBSubnetStateFault _ -> "com.amazonaws.neptune#InvalidDBSubnetStateFault"
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
        "com.amazonaws.neptune#InvalidEventSubscriptionStateFault"
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.neptune#SubscriptionNotFoundFault"
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
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.neptune#GlobalClusterNotFoundFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.neptune#InvalidGlobalClusterStateFault"
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

module DescribeDBClusterEndpoints = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
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
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.neptune#DBParameterGroupNotFoundFault"
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
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.neptune#DBParameterGroupNotFoundFault"
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

module DescribeDBClusters = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
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

module DescribeDBClusterSnapshotAttributes = struct
  let error_to_string = function
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.neptune#DBClusterSnapshotNotFoundFault"
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
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.neptune#DBClusterSnapshotNotFoundFault"
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
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.neptune#DBInstanceNotFoundFault"
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

module DescribeDBParameterGroups = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.neptune#DBParameterGroupNotFoundFault"
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
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.neptune#DBParameterGroupNotFoundFault"
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

module DescribeDBSubnetGroups = struct
  let error_to_string = function
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.neptune#DBSubnetGroupNotFoundFault"
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

module DescribeEventSubscriptions = struct
  let error_to_string = function
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.neptune#SubscriptionNotFoundFault"
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

module DescribeGlobalClusters = struct
  let error_to_string = function
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.neptune#GlobalClusterNotFoundFault"
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
    | `ResourceNotFoundFault _ -> "com.amazonaws.neptune#ResourceNotFoundFault"
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

module DescribeValidDBInstanceModifications = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.neptune#DBInstanceNotFoundFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.neptune#InvalidDBInstanceStateFault"
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

module FailoverDBCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.neptune#InvalidDBInstanceStateFault"
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.neptune#GlobalClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.neptune#InvalidGlobalClusterStateFault"
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.neptune#DBInstanceNotFoundFault"
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.neptune#DBSnapshotNotFoundFault"
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
    | `DBClusterAlreadyExistsFault _ -> "com.amazonaws.neptune#DBClusterAlreadyExistsFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `DBClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.neptune#DBClusterParameterGroupNotFoundFault"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.neptune#DBSubnetGroupNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.neptune#InvalidDBInstanceStateFault"
    | `InvalidDBSecurityGroupStateFault _ ->
        "com.amazonaws.neptune#InvalidDBSecurityGroupStateFault"
    | `InvalidDBSubnetGroupStateFault _ -> "com.amazonaws.neptune#InvalidDBSubnetGroupStateFault"
    | `InvalidSubnet _ -> "com.amazonaws.neptune#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.neptune#InvalidVPCNetworkStateFault"
    | `NetworkTypeNotSupportedFault _ -> "com.amazonaws.neptune#NetworkTypeNotSupportedFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.neptune#StorageQuotaExceededFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.neptune#StorageTypeNotSupportedFault"
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
            ~structParser:network_type_not_supported_fault_of_xml
        with
        | Ok s -> `NetworkTypeNotSupportedFault s
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
    | `DBClusterEndpointNotFoundFault _ -> "com.amazonaws.neptune#DBClusterEndpointNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.neptune#DBInstanceNotFoundFault"
    | `InvalidDBClusterEndpointStateFault _ ->
        "com.amazonaws.neptune#InvalidDBClusterEndpointStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.neptune#InvalidDBInstanceStateFault"
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
      ~output_deserializer:modify_db_cluster_endpoint_output_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_db_cluster_endpoint_message) =
    let fields = modify_db_cluster_endpoint_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyDBClusterEndpoint"
      ~xmlNamespace:"http://rds.amazonaws.com/doc/2014-10-31/" ~service ~context ~fields
      ~output_deserializer:modify_db_cluster_endpoint_output_of_xml ~error_deserializer
end

module ModifyDBClusterParameterGroup = struct
  let error_to_string = function
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.neptune#DBParameterGroupNotFoundFault"
    | `InvalidDBParameterGroupStateFault _ ->
        "com.amazonaws.neptune#InvalidDBParameterGroupStateFault"
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
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.neptune#DBClusterSnapshotNotFoundFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.neptune#InvalidDBClusterSnapshotStateFault"
    | `SharedSnapshotQuotaExceededFault _ ->
        "com.amazonaws.neptune#SharedSnapshotQuotaExceededFault"
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
    | `AuthorizationNotFoundFault _ -> "com.amazonaws.neptune#AuthorizationNotFoundFault"
    | `CertificateNotFoundFault _ -> "com.amazonaws.neptune#CertificateNotFoundFault"
    | `DBInstanceAlreadyExistsFault _ -> "com.amazonaws.neptune#DBInstanceAlreadyExistsFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.neptune#DBInstanceNotFoundFault"
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.neptune#DBParameterGroupNotFoundFault"
    | `DBSecurityGroupNotFoundFault _ -> "com.amazonaws.neptune#DBSecurityGroupNotFoundFault"
    | `DBUpgradeDependencyFailureFault _ -> "com.amazonaws.neptune#DBUpgradeDependencyFailureFault"
    | `DomainNotFoundFault _ -> "com.amazonaws.neptune#DomainNotFoundFault"
    | `InsufficientDBInstanceCapacityFault _ ->
        "com.amazonaws.neptune#InsufficientDBInstanceCapacityFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.neptune#InvalidDBInstanceStateFault"
    | `InvalidDBSecurityGroupStateFault _ ->
        "com.amazonaws.neptune#InvalidDBSecurityGroupStateFault"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.neptune#InvalidVPCNetworkStateFault"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.neptune#OptionGroupNotFoundFault"
    | `ProvisionedIopsNotAvailableInAZFault _ ->
        "com.amazonaws.neptune#ProvisionedIopsNotAvailableInAZFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.neptune#StorageQuotaExceededFault"
    | `StorageTypeNotSupportedFault _ -> "com.amazonaws.neptune#StorageTypeNotSupportedFault"
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
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.neptune#DBParameterGroupNotFoundFault"
    | `InvalidDBParameterGroupStateFault _ ->
        "com.amazonaws.neptune#InvalidDBParameterGroupStateFault"
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

module ModifyDBSubnetGroup = struct
  let error_to_string = function
    | `DBSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.neptune#DBSubnetGroupDoesNotCoverEnoughAZs"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.neptune#DBSubnetGroupNotFoundFault"
    | `DBSubnetQuotaExceededFault _ -> "com.amazonaws.neptune#DBSubnetQuotaExceededFault"
    | `InvalidSubnet _ -> "com.amazonaws.neptune#InvalidSubnet"
    | `SubnetAlreadyInUse _ -> "com.amazonaws.neptune#SubnetAlreadyInUse"
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
        "com.amazonaws.neptune#EventSubscriptionQuotaExceededFault"
    | `SNSInvalidTopicFault _ -> "com.amazonaws.neptune#SNSInvalidTopicFault"
    | `SNSNoAuthorizationFault _ -> "com.amazonaws.neptune#SNSNoAuthorizationFault"
    | `SNSTopicArnNotFoundFault _ -> "com.amazonaws.neptune#SNSTopicArnNotFoundFault"
    | `SubscriptionCategoryNotFoundFault _ ->
        "com.amazonaws.neptune#SubscriptionCategoryNotFoundFault"
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.neptune#SubscriptionNotFoundFault"
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
    | `GlobalClusterAlreadyExistsFault _ -> "com.amazonaws.neptune#GlobalClusterAlreadyExistsFault"
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.neptune#GlobalClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.neptune#InvalidDBInstanceStateFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.neptune#InvalidGlobalClusterStateFault"
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

module PromoteReadReplicaDBCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
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

module RebootDBInstance = struct
  let error_to_string = function
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.neptune#DBInstanceNotFoundFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.neptune#InvalidDBInstanceStateFault"
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.neptune#GlobalClusterNotFoundFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.neptune#InvalidGlobalClusterStateFault"
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

module RemoveRoleFromDBCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `DBClusterRoleNotFoundFault _ -> "com.amazonaws.neptune#DBClusterRoleNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
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

module RemoveSourceIdentifierFromSubscription = struct
  let error_to_string = function
    | `SourceNotFoundFault _ -> "com.amazonaws.neptune#SourceNotFoundFault"
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.neptune#SubscriptionNotFoundFault"
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.neptune#DBInstanceNotFoundFault"
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.neptune#DBSnapshotNotFoundFault"
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
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.neptune#DBParameterGroupNotFoundFault"
    | `InvalidDBParameterGroupStateFault _ ->
        "com.amazonaws.neptune#InvalidDBParameterGroupStateFault"
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
    | `DBParameterGroupNotFoundFault _ -> "com.amazonaws.neptune#DBParameterGroupNotFoundFault"
    | `InvalidDBParameterGroupStateFault _ ->
        "com.amazonaws.neptune#InvalidDBParameterGroupStateFault"
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

module RestoreDBClusterFromSnapshot = struct
  let error_to_string = function
    | `DBClusterAlreadyExistsFault _ -> "com.amazonaws.neptune#DBClusterAlreadyExistsFault"
    | `DBClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.neptune#DBClusterParameterGroupNotFoundFault"
    | `DBClusterQuotaExceededFault _ -> "com.amazonaws.neptune#DBClusterQuotaExceededFault"
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.neptune#DBClusterSnapshotNotFoundFault"
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.neptune#DBSnapshotNotFoundFault"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.neptune#DBSubnetGroupNotFoundFault"
    | `InsufficientDBClusterCapacityFault _ ->
        "com.amazonaws.neptune#InsufficientDBClusterCapacityFault"
    | `InsufficientStorageClusterCapacityFault _ ->
        "com.amazonaws.neptune#InsufficientStorageClusterCapacityFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.neptune#InvalidDBClusterSnapshotStateFault"
    | `InvalidDBSnapshotStateFault _ -> "com.amazonaws.neptune#InvalidDBSnapshotStateFault"
    | `InvalidRestoreFault _ -> "com.amazonaws.neptune#InvalidRestoreFault"
    | `InvalidSubnet _ -> "com.amazonaws.neptune#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.neptune#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.neptune#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupportedFault _ -> "com.amazonaws.neptune#NetworkTypeNotSupportedFault"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.neptune#OptionGroupNotFoundFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.neptune#StorageQuotaExceededFault"
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
            ~structParser:network_type_not_supported_fault_of_xml
        with
        | Ok s -> `NetworkTypeNotSupportedFault s
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
    | `DBClusterAlreadyExistsFault _ -> "com.amazonaws.neptune#DBClusterAlreadyExistsFault"
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `DBClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.neptune#DBClusterParameterGroupNotFoundFault"
    | `DBClusterQuotaExceededFault _ -> "com.amazonaws.neptune#DBClusterQuotaExceededFault"
    | `DBClusterSnapshotNotFoundFault _ -> "com.amazonaws.neptune#DBClusterSnapshotNotFoundFault"
    | `DBSubnetGroupNotFoundFault _ -> "com.amazonaws.neptune#DBSubnetGroupNotFoundFault"
    | `InsufficientDBClusterCapacityFault _ ->
        "com.amazonaws.neptune#InsufficientDBClusterCapacityFault"
    | `InsufficientStorageClusterCapacityFault _ ->
        "com.amazonaws.neptune#InsufficientStorageClusterCapacityFault"
    | `InvalidDBClusterSnapshotStateFault _ ->
        "com.amazonaws.neptune#InvalidDBClusterSnapshotStateFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
    | `InvalidDBSnapshotStateFault _ -> "com.amazonaws.neptune#InvalidDBSnapshotStateFault"
    | `InvalidRestoreFault _ -> "com.amazonaws.neptune#InvalidRestoreFault"
    | `InvalidSubnet _ -> "com.amazonaws.neptune#InvalidSubnet"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.neptune#InvalidVPCNetworkStateFault"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.neptune#KMSKeyNotAccessibleFault"
    | `NetworkTypeNotSupportedFault _ -> "com.amazonaws.neptune#NetworkTypeNotSupportedFault"
    | `OptionGroupNotFoundFault _ -> "com.amazonaws.neptune#OptionGroupNotFoundFault"
    | `StorageQuotaExceededFault _ -> "com.amazonaws.neptune#StorageQuotaExceededFault"
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
            ~structParser:network_type_not_supported_fault_of_xml
        with
        | Ok s -> `NetworkTypeNotSupportedFault s
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.neptune#InvalidDBInstanceStateFault"
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
    | `InvalidDBInstanceStateFault _ -> "com.amazonaws.neptune#InvalidDBInstanceStateFault"
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
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `GlobalClusterNotFoundFault _ -> "com.amazonaws.neptune#GlobalClusterNotFoundFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
    | `InvalidGlobalClusterStateFault _ -> "com.amazonaws.neptune#InvalidGlobalClusterStateFault"
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

module AddTagsToResource = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `DBInstanceNotFoundFault _ -> "com.amazonaws.neptune#DBInstanceNotFoundFault"
    | `DBSnapshotNotFoundFault _ -> "com.amazonaws.neptune#DBSnapshotNotFoundFault"
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

module AddSourceIdentifierToSubscription = struct
  let error_to_string = function
    | `SourceNotFoundFault _ -> "com.amazonaws.neptune#SourceNotFoundFault"
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.neptune#SubscriptionNotFoundFault"
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

module AddRoleToDBCluster = struct
  let error_to_string = function
    | `DBClusterNotFoundFault _ -> "com.amazonaws.neptune#DBClusterNotFoundFault"
    | `DBClusterRoleAlreadyExistsFault _ -> "com.amazonaws.neptune#DBClusterRoleAlreadyExistsFault"
    | `DBClusterRoleQuotaExceededFault _ -> "com.amazonaws.neptune#DBClusterRoleQuotaExceededFault"
    | `InvalidDBClusterStateFault _ -> "com.amazonaws.neptune#InvalidDBClusterStateFault"
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
