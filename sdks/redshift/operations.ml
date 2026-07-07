open Types
open Service_metadata
open Query_deserializers
open Query_serializers

module AcceptReservedNodeExchange = struct
  let error_to_string = function
    | `DependentServiceUnavailableFault _ ->
        "com.amazonaws.redshift#DependentServiceUnavailableFault"
    | `InvalidReservedNodeStateFault _ -> "com.amazonaws.redshift#InvalidReservedNodeStateFault"
    | `ReservedNodeAlreadyExistsFault _ -> "com.amazonaws.redshift#ReservedNodeAlreadyExistsFault"
    | `ReservedNodeAlreadyMigratedFault _ ->
        "com.amazonaws.redshift#ReservedNodeAlreadyMigratedFault"
    | `ReservedNodeNotFoundFault _ -> "com.amazonaws.redshift#ReservedNodeNotFoundFault"
    | `ReservedNodeOfferingNotFoundFault _ ->
        "com.amazonaws.redshift#ReservedNodeOfferingNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DependentServiceUnavailableFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_unavailable_fault_of_xml
        with
        | Ok s -> `DependentServiceUnavailableFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReservedNodeState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_reserved_node_state_fault_of_xml
        with
        | Ok s -> `InvalidReservedNodeStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_already_exists_fault_of_xml
        with
        | Ok s -> `ReservedNodeAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeAlreadyMigrated" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_already_migrated_fault_of_xml
        with
        | Ok s -> `ReservedNodeAlreadyMigratedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_not_found_fault_of_xml
        with
        | Ok s -> `ReservedNodeNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeOfferingNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_offering_not_found_fault_of_xml
        with
        | Ok s -> `ReservedNodeOfferingNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : accept_reserved_node_exchange_input_message) =
    let fields = accept_reserved_node_exchange_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AcceptReservedNodeExchange"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:accept_reserved_node_exchange_output_message_of_xml ~error_deserializer

  let request_with_metadata context (request : accept_reserved_node_exchange_input_message) =
    let fields = accept_reserved_node_exchange_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AcceptReservedNodeExchange"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:accept_reserved_node_exchange_output_message_of_xml ~error_deserializer
end

module AddPartner = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `PartnerNotFoundFault _ -> "com.amazonaws.redshift#PartnerNotFoundFault"
    | `UnauthorizedPartnerIntegrationFault _ ->
        "com.amazonaws.redshift#UnauthorizedPartnerIntegrationFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PartnerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:partner_not_found_fault_of_xml
        with
        | Ok s -> `PartnerNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedPartnerIntegration" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_partner_integration_fault_of_xml
        with
        | Ok s -> `UnauthorizedPartnerIntegrationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : partner_integration_input_message) =
    let fields = partner_integration_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AddPartner"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:partner_integration_output_message_of_xml ~error_deserializer

  let request_with_metadata context (request : partner_integration_input_message) =
    let fields = partner_integration_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AddPartner"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:partner_integration_output_message_of_xml ~error_deserializer
end

module AssociateDataShareConsumer = struct
  let error_to_string = function
    | `InvalidDataShareFault _ -> "com.amazonaws.redshift#InvalidDataShareFault"
    | `InvalidNamespaceFault _ -> "com.amazonaws.redshift#InvalidNamespaceFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidDataShareFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_data_share_fault_of_xml
        with
        | Ok s -> `InvalidDataShareFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidNamespaceFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_namespace_fault_of_xml
        with
        | Ok s -> `InvalidNamespaceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : associate_data_share_consumer_message) =
    let fields = associate_data_share_consumer_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AssociateDataShareConsumer"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:data_share_of_xml ~error_deserializer

  let request_with_metadata context (request : associate_data_share_consumer_message) =
    let fields = associate_data_share_consumer_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AssociateDataShareConsumer"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:data_share_of_xml ~error_deserializer
end

module AuthorizeClusterSecurityGroupIngress = struct
  let error_to_string = function
    | `AuthorizationAlreadyExistsFault _ -> "com.amazonaws.redshift#AuthorizationAlreadyExistsFault"
    | `AuthorizationQuotaExceededFault _ -> "com.amazonaws.redshift#AuthorizationQuotaExceededFault"
    | `ClusterSecurityGroupNotFoundFault _ ->
        "com.amazonaws.redshift#ClusterSecurityGroupNotFoundFault"
    | `InvalidClusterSecurityGroupStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSecurityGroupStateFault"
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
    | "ClusterSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_security_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : authorize_cluster_security_group_ingress_message) =
    let fields = authorize_cluster_security_group_ingress_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AuthorizeClusterSecurityGroupIngress"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:authorize_cluster_security_group_ingress_result_of_xml
      ~error_deserializer

  let request_with_metadata context (request : authorize_cluster_security_group_ingress_message) =
    let fields = authorize_cluster_security_group_ingress_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"AuthorizeClusterSecurityGroupIngress"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:authorize_cluster_security_group_ingress_result_of_xml
      ~error_deserializer
end

module AuthorizeDataShare = struct
  let error_to_string = function
    | `InvalidDataShareFault _ -> "com.amazonaws.redshift#InvalidDataShareFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidDataShareFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_data_share_fault_of_xml
        with
        | Ok s -> `InvalidDataShareFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : authorize_data_share_message) =
    let fields = authorize_data_share_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AuthorizeDataShare"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:data_share_of_xml ~error_deserializer

  let request_with_metadata context (request : authorize_data_share_message) =
    let fields = authorize_data_share_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AuthorizeDataShare"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:data_share_of_xml ~error_deserializer
end

module AuthorizeEndpointAccess = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `EndpointAuthorizationAlreadyExistsFault _ ->
        "com.amazonaws.redshift#EndpointAuthorizationAlreadyExistsFault"
    | `EndpointAuthorizationsPerClusterLimitExceededFault _ ->
        "com.amazonaws.redshift#EndpointAuthorizationsPerClusterLimitExceededFault"
    | `InvalidAuthorizationStateFault _ -> "com.amazonaws.redshift#InvalidAuthorizationStateFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EndpointAuthorizationAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:endpoint_authorization_already_exists_fault_of_xml
        with
        | Ok s -> `EndpointAuthorizationAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EndpointAuthorizationsPerClusterLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:endpoint_authorizations_per_cluster_limit_exceeded_fault_of_xml
        with
        | Ok s -> `EndpointAuthorizationsPerClusterLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidAuthorizationState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_authorization_state_fault_of_xml
        with
        | Ok s -> `InvalidAuthorizationStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : authorize_endpoint_access_message) =
    let fields = authorize_endpoint_access_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AuthorizeEndpointAccess"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:endpoint_authorization_of_xml ~error_deserializer

  let request_with_metadata context (request : authorize_endpoint_access_message) =
    let fields = authorize_endpoint_access_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AuthorizeEndpointAccess"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:endpoint_authorization_of_xml ~error_deserializer
end

module AuthorizeSnapshotAccess = struct
  let error_to_string = function
    | `AuthorizationAlreadyExistsFault _ -> "com.amazonaws.redshift#AuthorizationAlreadyExistsFault"
    | `AuthorizationQuotaExceededFault _ -> "com.amazonaws.redshift#AuthorizationQuotaExceededFault"
    | `ClusterSnapshotNotFoundFault _ -> "com.amazonaws.redshift#ClusterSnapshotNotFoundFault"
    | `DependentServiceRequestThrottlingFault _ ->
        "com.amazonaws.redshift#DependentServiceRequestThrottlingFault"
    | `InvalidClusterSnapshotStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSnapshotStateFault"
    | `LimitExceededFault _ -> "com.amazonaws.redshift#LimitExceededFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
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
    | "ClusterSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceRequestThrottlingFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_request_throttling_fault_of_xml
        with
        | Ok s -> `DependentServiceRequestThrottlingFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSnapshotState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : authorize_snapshot_access_message) =
    let fields = authorize_snapshot_access_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AuthorizeSnapshotAccess"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:authorize_snapshot_access_result_of_xml ~error_deserializer

  let request_with_metadata context (request : authorize_snapshot_access_message) =
    let fields = authorize_snapshot_access_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AuthorizeSnapshotAccess"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:authorize_snapshot_access_result_of_xml ~error_deserializer
end

module BatchDeleteClusterSnapshots = struct
  let error_to_string = function
    | `BatchDeleteRequestSizeExceededFault _ ->
        "com.amazonaws.redshift#BatchDeleteRequestSizeExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BatchDeleteRequestSizeExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:batch_delete_request_size_exceeded_fault_of_xml
        with
        | Ok s -> `BatchDeleteRequestSizeExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : batch_delete_cluster_snapshots_request) =
    let fields = batch_delete_cluster_snapshots_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"BatchDeleteClusterSnapshots"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:batch_delete_cluster_snapshots_result_of_xml ~error_deserializer

  let request_with_metadata context (request : batch_delete_cluster_snapshots_request) =
    let fields = batch_delete_cluster_snapshots_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"BatchDeleteClusterSnapshots"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:batch_delete_cluster_snapshots_result_of_xml ~error_deserializer
end

module BatchModifyClusterSnapshots = struct
  let error_to_string = function
    | `BatchModifyClusterSnapshotsLimitExceededFault _ ->
        "com.amazonaws.redshift#BatchModifyClusterSnapshotsLimitExceededFault"
    | `InvalidRetentionPeriodFault _ -> "com.amazonaws.redshift#InvalidRetentionPeriodFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BatchModifyClusterSnapshotsLimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:batch_modify_cluster_snapshots_limit_exceeded_fault_of_xml
        with
        | Ok s -> `BatchModifyClusterSnapshotsLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRetentionPeriodFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_retention_period_fault_of_xml
        with
        | Ok s -> `InvalidRetentionPeriodFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : batch_modify_cluster_snapshots_message) =
    let fields = batch_modify_cluster_snapshots_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"BatchModifyClusterSnapshots"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:batch_modify_cluster_snapshots_output_message_of_xml ~error_deserializer

  let request_with_metadata context (request : batch_modify_cluster_snapshots_message) =
    let fields = batch_modify_cluster_snapshots_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"BatchModifyClusterSnapshots"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:batch_modify_cluster_snapshots_output_message_of_xml ~error_deserializer
end

module CancelResize = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `ResizeNotFoundFault _ -> "com.amazonaws.redshift#ResizeNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResizeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resize_not_found_fault_of_xml
        with
        | Ok s -> `ResizeNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : cancel_resize_message) =
    let fields = cancel_resize_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CancelResize"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:resize_progress_message_of_xml ~error_deserializer

  let request_with_metadata context (request : cancel_resize_message) =
    let fields = cancel_resize_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CancelResize"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:resize_progress_message_of_xml ~error_deserializer
end

module CopyClusterSnapshot = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `ClusterSnapshotAlreadyExistsFault _ ->
        "com.amazonaws.redshift#ClusterSnapshotAlreadyExistsFault"
    | `ClusterSnapshotNotFoundFault _ -> "com.amazonaws.redshift#ClusterSnapshotNotFoundFault"
    | `ClusterSnapshotQuotaExceededFault _ ->
        "com.amazonaws.redshift#ClusterSnapshotQuotaExceededFault"
    | `InvalidClusterSnapshotStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSnapshotStateFault"
    | `InvalidRetentionPeriodFault _ -> "com.amazonaws.redshift#InvalidRetentionPeriodFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSnapshotAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `ClusterSnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSnapshotQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `ClusterSnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSnapshotState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRetentionPeriodFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_retention_period_fault_of_xml
        with
        | Ok s -> `InvalidRetentionPeriodFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : copy_cluster_snapshot_message) =
    let fields = copy_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CopyClusterSnapshot"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:copy_cluster_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : copy_cluster_snapshot_message) =
    let fields = copy_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CopyClusterSnapshot"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:copy_cluster_snapshot_result_of_xml ~error_deserializer
end

module CreateAuthenticationProfile = struct
  let error_to_string = function
    | `AuthenticationProfileAlreadyExistsFault _ ->
        "com.amazonaws.redshift#AuthenticationProfileAlreadyExistsFault"
    | `AuthenticationProfileQuotaExceededFault _ ->
        "com.amazonaws.redshift#AuthenticationProfileQuotaExceededFault"
    | `InvalidAuthenticationProfileRequestFault _ ->
        "com.amazonaws.redshift#InvalidAuthenticationProfileRequestFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthenticationProfileAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authentication_profile_already_exists_fault_of_xml
        with
        | Ok s -> `AuthenticationProfileAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "AuthenticationProfileQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authentication_profile_quota_exceeded_fault_of_xml
        with
        | Ok s -> `AuthenticationProfileQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidAuthenticationProfileRequestFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_authentication_profile_request_fault_of_xml
        with
        | Ok s -> `InvalidAuthenticationProfileRequestFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_authentication_profile_message) =
    let fields = create_authentication_profile_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateAuthenticationProfile"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_authentication_profile_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_authentication_profile_message) =
    let fields = create_authentication_profile_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateAuthenticationProfile"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_authentication_profile_result_of_xml ~error_deserializer
end

module CreateCluster = struct
  let error_to_string = function
    | `ClusterAlreadyExistsFault _ -> "com.amazonaws.redshift#ClusterAlreadyExistsFault"
    | `ClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.redshift#ClusterParameterGroupNotFoundFault"
    | `ClusterQuotaExceededFault _ -> "com.amazonaws.redshift#ClusterQuotaExceededFault"
    | `ClusterSecurityGroupNotFoundFault _ ->
        "com.amazonaws.redshift#ClusterSecurityGroupNotFoundFault"
    | `ClusterSubnetGroupNotFoundFault _ -> "com.amazonaws.redshift#ClusterSubnetGroupNotFoundFault"
    | `DependentServiceAccessDeniedFault _ ->
        "com.amazonaws.redshift#DependentServiceAccessDeniedFault"
    | `DependentServiceRequestThrottlingFault _ ->
        "com.amazonaws.redshift#DependentServiceRequestThrottlingFault"
    | `DependentServiceUnavailableFault _ ->
        "com.amazonaws.redshift#DependentServiceUnavailableFault"
    | `HsmClientCertificateNotFoundFault _ ->
        "com.amazonaws.redshift#HsmClientCertificateNotFoundFault"
    | `HsmConfigurationNotFoundFault _ -> "com.amazonaws.redshift#HsmConfigurationNotFoundFault"
    | `InsufficientClusterCapacityFault _ ->
        "com.amazonaws.redshift#InsufficientClusterCapacityFault"
    | `InvalidClusterSubnetGroupStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSubnetGroupStateFault"
    | `InvalidClusterTrackFault _ -> "com.amazonaws.redshift#InvalidClusterTrackFault"
    | `InvalidElasticIpFault _ -> "com.amazonaws.redshift#InvalidElasticIpFault"
    | `InvalidRetentionPeriodFault _ -> "com.amazonaws.redshift#InvalidRetentionPeriodFault"
    | `InvalidSubnet _ -> "com.amazonaws.redshift#InvalidSubnet"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.redshift#InvalidVPCNetworkStateFault"
    | `Ipv6CidrBlockNotFoundFault _ -> "com.amazonaws.redshift#Ipv6CidrBlockNotFoundFault"
    | `LimitExceededFault _ -> "com.amazonaws.redshift#LimitExceededFault"
    | `NumberOfNodesPerClusterLimitExceededFault _ ->
        "com.amazonaws.redshift#NumberOfNodesPerClusterLimitExceededFault"
    | `NumberOfNodesQuotaExceededFault _ -> "com.amazonaws.redshift#NumberOfNodesQuotaExceededFault"
    | `RedshiftIdcApplicationNotExistsFault _ ->
        "com.amazonaws.redshift#RedshiftIdcApplicationNotExistsFault"
    | `SnapshotScheduleNotFoundFault _ -> "com.amazonaws.redshift#SnapshotScheduleNotFoundFault"
    | `TagLimitExceededFault _ -> "com.amazonaws.redshift#TagLimitExceededFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_already_exists_fault_of_xml
        with
        | Ok s -> `ClusterAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_quota_exceeded_fault_of_xml
        with
        | Ok s -> `ClusterQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_security_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceAccessDenied" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_access_denied_fault_of_xml
        with
        | Ok s -> `DependentServiceAccessDeniedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceRequestThrottlingFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_request_throttling_fault_of_xml
        with
        | Ok s -> `DependentServiceRequestThrottlingFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceUnavailableFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_unavailable_fault_of_xml
        with
        | Ok s -> `DependentServiceUnavailableFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "HsmClientCertificateNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:hsm_client_certificate_not_found_fault_of_xml
        with
        | Ok s -> `HsmClientCertificateNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "HsmConfigurationNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:hsm_configuration_not_found_fault_of_xml
        with
        | Ok s -> `HsmConfigurationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientClusterCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSubnetGroupStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_subnet_group_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSubnetGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterTrack" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_track_fault_of_xml
        with
        | Ok s -> `InvalidClusterTrackFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidElasticIpFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_elastic_ip_fault_of_xml
        with
        | Ok s -> `InvalidElasticIpFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRetentionPeriodFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_retention_period_fault_of_xml
        with
        | Ok s -> `InvalidRetentionPeriodFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "Ipv6CidrBlockNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:ipv6_cidr_block_not_found_fault_of_xml
        with
        | Ok s -> `Ipv6CidrBlockNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NumberOfNodesPerClusterLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:number_of_nodes_per_cluster_limit_exceeded_fault_of_xml
        with
        | Ok s -> `NumberOfNodesPerClusterLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NumberOfNodesQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:number_of_nodes_quota_exceeded_fault_of_xml
        with
        | Ok s -> `NumberOfNodesQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RedshiftIdcApplicationNotExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:redshift_idc_application_not_exists_fault_of_xml
        with
        | Ok s -> `RedshiftIdcApplicationNotExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotScheduleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_schedule_not_found_fault_of_xml
        with
        | Ok s -> `SnapshotScheduleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_fault_of_xml
        with
        | Ok s -> `TagLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_cluster_message) =
    let fields = create_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateCluster"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_cluster_message) =
    let fields = create_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateCluster"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_cluster_result_of_xml ~error_deserializer
end

module CreateClusterParameterGroup = struct
  let error_to_string = function
    | `ClusterParameterGroupAlreadyExistsFault _ ->
        "com.amazonaws.redshift#ClusterParameterGroupAlreadyExistsFault"
    | `ClusterParameterGroupQuotaExceededFault _ ->
        "com.amazonaws.redshift#ClusterParameterGroupQuotaExceededFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `TagLimitExceededFault _ -> "com.amazonaws.redshift#TagLimitExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterParameterGroupAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_parameter_group_already_exists_fault_of_xml
        with
        | Ok s -> `ClusterParameterGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterParameterGroupQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_parameter_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `ClusterParameterGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_fault_of_xml
        with
        | Ok s -> `TagLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_cluster_parameter_group_message) =
    let fields = create_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateClusterParameterGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_cluster_parameter_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_cluster_parameter_group_message) =
    let fields = create_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateClusterParameterGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_cluster_parameter_group_result_of_xml ~error_deserializer
end

module CreateClusterSecurityGroup = struct
  let error_to_string = function
    | `ClusterSecurityGroupAlreadyExistsFault _ ->
        "com.amazonaws.redshift#ClusterSecurityGroupAlreadyExistsFault"
    | `ClusterSecurityGroupQuotaExceededFault _ ->
        "com.amazonaws.redshift#ClusterSecurityGroupQuotaExceededFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `TagLimitExceededFault _ -> "com.amazonaws.redshift#TagLimitExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterSecurityGroupAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_security_group_already_exists_fault_of_xml
        with
        | Ok s -> `ClusterSecurityGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "QuotaExceeded.ClusterSecurityGroup" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_security_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `ClusterSecurityGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_fault_of_xml
        with
        | Ok s -> `TagLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_cluster_security_group_message) =
    let fields = create_cluster_security_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateClusterSecurityGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_cluster_security_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_cluster_security_group_message) =
    let fields = create_cluster_security_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateClusterSecurityGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_cluster_security_group_result_of_xml ~error_deserializer
end

module CreateClusterSnapshot = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `ClusterSnapshotAlreadyExistsFault _ ->
        "com.amazonaws.redshift#ClusterSnapshotAlreadyExistsFault"
    | `ClusterSnapshotQuotaExceededFault _ ->
        "com.amazonaws.redshift#ClusterSnapshotQuotaExceededFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `InvalidRetentionPeriodFault _ -> "com.amazonaws.redshift#InvalidRetentionPeriodFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `TagLimitExceededFault _ -> "com.amazonaws.redshift#TagLimitExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSnapshotAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `ClusterSnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSnapshotQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `ClusterSnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRetentionPeriodFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_retention_period_fault_of_xml
        with
        | Ok s -> `InvalidRetentionPeriodFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_fault_of_xml
        with
        | Ok s -> `TagLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_cluster_snapshot_message) =
    let fields = create_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateClusterSnapshot"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_cluster_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_cluster_snapshot_message) =
    let fields = create_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateClusterSnapshot"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_cluster_snapshot_result_of_xml ~error_deserializer
end

module CreateClusterSubnetGroup = struct
  let error_to_string = function
    | `ClusterSubnetGroupAlreadyExistsFault _ ->
        "com.amazonaws.redshift#ClusterSubnetGroupAlreadyExistsFault"
    | `ClusterSubnetGroupQuotaExceededFault _ ->
        "com.amazonaws.redshift#ClusterSubnetGroupQuotaExceededFault"
    | `ClusterSubnetQuotaExceededFault _ -> "com.amazonaws.redshift#ClusterSubnetQuotaExceededFault"
    | `DependentServiceRequestThrottlingFault _ ->
        "com.amazonaws.redshift#DependentServiceRequestThrottlingFault"
    | `InvalidSubnet _ -> "com.amazonaws.redshift#InvalidSubnet"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `TagLimitExceededFault _ -> "com.amazonaws.redshift#TagLimitExceededFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterSubnetGroupAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_subnet_group_already_exists_fault_of_xml
        with
        | Ok s -> `ClusterSubnetGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSubnetGroupQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_subnet_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `ClusterSubnetGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSubnetQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_subnet_quota_exceeded_fault_of_xml
        with
        | Ok s -> `ClusterSubnetQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceRequestThrottlingFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_request_throttling_fault_of_xml
        with
        | Ok s -> `DependentServiceRequestThrottlingFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_fault_of_xml
        with
        | Ok s -> `TagLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_cluster_subnet_group_message) =
    let fields = create_cluster_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateClusterSubnetGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_cluster_subnet_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_cluster_subnet_group_message) =
    let fields = create_cluster_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateClusterSubnetGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_cluster_subnet_group_result_of_xml ~error_deserializer
end

module CreateCustomDomainAssociation = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `CustomCnameAssociationFault _ -> "com.amazonaws.redshift#CustomCnameAssociationFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CustomCnameAssociationFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_cname_association_fault_of_xml
        with
        | Ok s -> `CustomCnameAssociationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_custom_domain_association_message) =
    let fields = create_custom_domain_association_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateCustomDomainAssociation"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_custom_domain_association_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_custom_domain_association_message) =
    let fields = create_custom_domain_association_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateCustomDomainAssociation"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_custom_domain_association_result_of_xml ~error_deserializer
end

module CreateEndpointAccess = struct
  let error_to_string = function
    | `AccessToClusterDeniedFault _ -> "com.amazonaws.redshift#AccessToClusterDeniedFault"
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `ClusterSubnetGroupNotFoundFault _ -> "com.amazonaws.redshift#ClusterSubnetGroupNotFoundFault"
    | `EndpointAlreadyExistsFault _ -> "com.amazonaws.redshift#EndpointAlreadyExistsFault"
    | `EndpointsPerAuthorizationLimitExceededFault _ ->
        "com.amazonaws.redshift#EndpointsPerAuthorizationLimitExceededFault"
    | `EndpointsPerClusterLimitExceededFault _ ->
        "com.amazonaws.redshift#EndpointsPerClusterLimitExceededFault"
    | `InvalidClusterSecurityGroupStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSecurityGroupStateFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AccessToClusterDenied" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_to_cluster_denied_fault_of_xml
        with
        | Ok s -> `AccessToClusterDeniedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EndpointAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:endpoint_already_exists_fault_of_xml
        with
        | Ok s -> `EndpointAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EndpointsPerAuthorizationLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:endpoints_per_authorization_limit_exceeded_fault_of_xml
        with
        | Ok s -> `EndpointsPerAuthorizationLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EndpointsPerClusterLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:endpoints_per_cluster_limit_exceeded_fault_of_xml
        with
        | Ok s -> `EndpointsPerClusterLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_endpoint_access_message) =
    let fields = create_endpoint_access_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateEndpointAccess"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:endpoint_access_of_xml ~error_deserializer

  let request_with_metadata context (request : create_endpoint_access_message) =
    let fields = create_endpoint_access_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateEndpointAccess"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:endpoint_access_of_xml ~error_deserializer
end

module CreateEventSubscription = struct
  let error_to_string = function
    | `EventSubscriptionQuotaExceededFault _ ->
        "com.amazonaws.redshift#EventSubscriptionQuotaExceededFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `SNSInvalidTopicFault _ -> "com.amazonaws.redshift#SNSInvalidTopicFault"
    | `SNSNoAuthorizationFault _ -> "com.amazonaws.redshift#SNSNoAuthorizationFault"
    | `SNSTopicArnNotFoundFault _ -> "com.amazonaws.redshift#SNSTopicArnNotFoundFault"
    | `SourceNotFoundFault _ -> "com.amazonaws.redshift#SourceNotFoundFault"
    | `SubscriptionAlreadyExistFault _ -> "com.amazonaws.redshift#SubscriptionAlreadyExistFault"
    | `SubscriptionCategoryNotFoundFault _ ->
        "com.amazonaws.redshift#SubscriptionCategoryNotFoundFault"
    | `SubscriptionEventIdNotFoundFault _ ->
        "com.amazonaws.redshift#SubscriptionEventIdNotFoundFault"
    | `SubscriptionSeverityNotFoundFault _ ->
        "com.amazonaws.redshift#SubscriptionSeverityNotFoundFault"
    | `TagLimitExceededFault _ -> "com.amazonaws.redshift#TagLimitExceededFault"
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
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
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
    | "SubscriptionEventIdNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subscription_event_id_not_found_fault_of_xml
        with
        | Ok s -> `SubscriptionEventIdNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubscriptionSeverityNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subscription_severity_not_found_fault_of_xml
        with
        | Ok s -> `SubscriptionSeverityNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_fault_of_xml
        with
        | Ok s -> `TagLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_event_subscription_message) =
    let fields = create_event_subscription_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateEventSubscription"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_event_subscription_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_event_subscription_message) =
    let fields = create_event_subscription_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateEventSubscription"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_event_subscription_result_of_xml ~error_deserializer
end

module CreateHsmClientCertificate = struct
  let error_to_string = function
    | `HsmClientCertificateAlreadyExistsFault _ ->
        "com.amazonaws.redshift#HsmClientCertificateAlreadyExistsFault"
    | `HsmClientCertificateQuotaExceededFault _ ->
        "com.amazonaws.redshift#HsmClientCertificateQuotaExceededFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `TagLimitExceededFault _ -> "com.amazonaws.redshift#TagLimitExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "HsmClientCertificateAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:hsm_client_certificate_already_exists_fault_of_xml
        with
        | Ok s -> `HsmClientCertificateAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "HsmClientCertificateQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:hsm_client_certificate_quota_exceeded_fault_of_xml
        with
        | Ok s -> `HsmClientCertificateQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_fault_of_xml
        with
        | Ok s -> `TagLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_hsm_client_certificate_message) =
    let fields = create_hsm_client_certificate_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateHsmClientCertificate"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_hsm_client_certificate_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_hsm_client_certificate_message) =
    let fields = create_hsm_client_certificate_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateHsmClientCertificate"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_hsm_client_certificate_result_of_xml ~error_deserializer
end

module CreateHsmConfiguration = struct
  let error_to_string = function
    | `HsmConfigurationAlreadyExistsFault _ ->
        "com.amazonaws.redshift#HsmConfigurationAlreadyExistsFault"
    | `HsmConfigurationQuotaExceededFault _ ->
        "com.amazonaws.redshift#HsmConfigurationQuotaExceededFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `TagLimitExceededFault _ -> "com.amazonaws.redshift#TagLimitExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "HsmConfigurationAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:hsm_configuration_already_exists_fault_of_xml
        with
        | Ok s -> `HsmConfigurationAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "HsmConfigurationQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:hsm_configuration_quota_exceeded_fault_of_xml
        with
        | Ok s -> `HsmConfigurationQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_fault_of_xml
        with
        | Ok s -> `TagLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_hsm_configuration_message) =
    let fields = create_hsm_configuration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateHsmConfiguration"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_hsm_configuration_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_hsm_configuration_message) =
    let fields = create_hsm_configuration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateHsmConfiguration"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_hsm_configuration_result_of_xml ~error_deserializer
end

module CreateIntegration = struct
  let error_to_string = function
    | `IntegrationAlreadyExistsFault _ -> "com.amazonaws.redshift#IntegrationAlreadyExistsFault"
    | `IntegrationConflictOperationFault _ ->
        "com.amazonaws.redshift#IntegrationConflictOperationFault"
    | `IntegrationQuotaExceededFault _ -> "com.amazonaws.redshift#IntegrationQuotaExceededFault"
    | `IntegrationSourceNotFoundFault _ -> "com.amazonaws.redshift#IntegrationSourceNotFoundFault"
    | `IntegrationTargetNotFoundFault _ -> "com.amazonaws.redshift#IntegrationTargetNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `TagLimitExceededFault _ -> "com.amazonaws.redshift#TagLimitExceededFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
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
    | "IntegrationSourceNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_source_not_found_fault_of_xml
        with
        | Ok s -> `IntegrationSourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IntegrationTargetNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_target_not_found_fault_of_xml
        with
        | Ok s -> `IntegrationTargetNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_fault_of_xml
        with
        | Ok s -> `TagLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_integration_message) =
    let fields = create_integration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateIntegration"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:integration_of_xml ~error_deserializer

  let request_with_metadata context (request : create_integration_message) =
    let fields = create_integration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateIntegration"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:integration_of_xml ~error_deserializer
end

module CreateRedshiftIdcApplication = struct
  let error_to_string = function
    | `DependentServiceAccessDeniedFault _ ->
        "com.amazonaws.redshift#DependentServiceAccessDeniedFault"
    | `DependentServiceUnavailableFault _ ->
        "com.amazonaws.redshift#DependentServiceUnavailableFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `RedshiftIdcApplicationAlreadyExistsFault _ ->
        "com.amazonaws.redshift#RedshiftIdcApplicationAlreadyExistsFault"
    | `RedshiftIdcApplicationQuotaExceededFault _ ->
        "com.amazonaws.redshift#RedshiftIdcApplicationQuotaExceededFault"
    | `TagLimitExceededFault _ -> "com.amazonaws.redshift#TagLimitExceededFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DependentServiceAccessDenied" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_access_denied_fault_of_xml
        with
        | Ok s -> `DependentServiceAccessDeniedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceUnavailableFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_unavailable_fault_of_xml
        with
        | Ok s -> `DependentServiceUnavailableFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RedshiftIdcApplicationAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:redshift_idc_application_already_exists_fault_of_xml
        with
        | Ok s -> `RedshiftIdcApplicationAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RedshiftIdcApplicationQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:redshift_idc_application_quota_exceeded_fault_of_xml
        with
        | Ok s -> `RedshiftIdcApplicationQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_fault_of_xml
        with
        | Ok s -> `TagLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_redshift_idc_application_message) =
    let fields = create_redshift_idc_application_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateRedshiftIdcApplication"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_redshift_idc_application_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_redshift_idc_application_message) =
    let fields = create_redshift_idc_application_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateRedshiftIdcApplication"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_redshift_idc_application_result_of_xml ~error_deserializer
end

module CreateScheduledAction = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidScheduledActionFault _ -> "com.amazonaws.redshift#InvalidScheduledActionFault"
    | `InvalidScheduleFault _ -> "com.amazonaws.redshift#InvalidScheduleFault"
    | `ScheduledActionAlreadyExistsFault _ ->
        "com.amazonaws.redshift#ScheduledActionAlreadyExistsFault"
    | `ScheduledActionQuotaExceededFault _ ->
        "com.amazonaws.redshift#ScheduledActionQuotaExceededFault"
    | `ScheduledActionTypeUnsupportedFault _ ->
        "com.amazonaws.redshift#ScheduledActionTypeUnsupportedFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidScheduledAction" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_scheduled_action_fault_of_xml
        with
        | Ok s -> `InvalidScheduledActionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSchedule" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_schedule_fault_of_xml
        with
        | Ok s -> `InvalidScheduleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ScheduledActionAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:scheduled_action_already_exists_fault_of_xml
        with
        | Ok s -> `ScheduledActionAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ScheduledActionQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:scheduled_action_quota_exceeded_fault_of_xml
        with
        | Ok s -> `ScheduledActionQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ScheduledActionTypeUnsupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:scheduled_action_type_unsupported_fault_of_xml
        with
        | Ok s -> `ScheduledActionTypeUnsupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_scheduled_action_message) =
    let fields = create_scheduled_action_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateScheduledAction"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:scheduled_action_of_xml ~error_deserializer

  let request_with_metadata context (request : create_scheduled_action_message) =
    let fields = create_scheduled_action_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateScheduledAction"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:scheduled_action_of_xml ~error_deserializer
end

module CreateSnapshotCopyGrant = struct
  let error_to_string = function
    | `DependentServiceRequestThrottlingFault _ ->
        "com.amazonaws.redshift#DependentServiceRequestThrottlingFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `LimitExceededFault _ -> "com.amazonaws.redshift#LimitExceededFault"
    | `SnapshotCopyGrantAlreadyExistsFault _ ->
        "com.amazonaws.redshift#SnapshotCopyGrantAlreadyExistsFault"
    | `SnapshotCopyGrantQuotaExceededFault _ ->
        "com.amazonaws.redshift#SnapshotCopyGrantQuotaExceededFault"
    | `TagLimitExceededFault _ -> "com.amazonaws.redshift#TagLimitExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DependentServiceRequestThrottlingFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_request_throttling_fault_of_xml
        with
        | Ok s -> `DependentServiceRequestThrottlingFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotCopyGrantAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_copy_grant_already_exists_fault_of_xml
        with
        | Ok s -> `SnapshotCopyGrantAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotCopyGrantQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_copy_grant_quota_exceeded_fault_of_xml
        with
        | Ok s -> `SnapshotCopyGrantQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_fault_of_xml
        with
        | Ok s -> `TagLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_snapshot_copy_grant_message) =
    let fields = create_snapshot_copy_grant_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateSnapshotCopyGrant"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_snapshot_copy_grant_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_snapshot_copy_grant_message) =
    let fields = create_snapshot_copy_grant_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateSnapshotCopyGrant"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:create_snapshot_copy_grant_result_of_xml ~error_deserializer
end

module CreateSnapshotSchedule = struct
  let error_to_string = function
    | `InvalidScheduleFault _ -> "com.amazonaws.redshift#InvalidScheduleFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `ScheduleDefinitionTypeUnsupportedFault _ ->
        "com.amazonaws.redshift#ScheduleDefinitionTypeUnsupportedFault"
    | `SnapshotScheduleAlreadyExistsFault _ ->
        "com.amazonaws.redshift#SnapshotScheduleAlreadyExistsFault"
    | `SnapshotScheduleQuotaExceededFault _ ->
        "com.amazonaws.redshift#SnapshotScheduleQuotaExceededFault"
    | `TagLimitExceededFault _ -> "com.amazonaws.redshift#TagLimitExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidSchedule" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_schedule_fault_of_xml
        with
        | Ok s -> `InvalidScheduleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ScheduleDefinitionTypeUnsupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:schedule_definition_type_unsupported_fault_of_xml
        with
        | Ok s -> `ScheduleDefinitionTypeUnsupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotScheduleAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_schedule_already_exists_fault_of_xml
        with
        | Ok s -> `SnapshotScheduleAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotScheduleQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_schedule_quota_exceeded_fault_of_xml
        with
        | Ok s -> `SnapshotScheduleQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_fault_of_xml
        with
        | Ok s -> `TagLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_snapshot_schedule_message) =
    let fields = create_snapshot_schedule_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateSnapshotSchedule"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:snapshot_schedule_of_xml ~error_deserializer

  let request_with_metadata context (request : create_snapshot_schedule_message) =
    let fields = create_snapshot_schedule_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateSnapshotSchedule"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:snapshot_schedule_of_xml ~error_deserializer
end

module CreateTags = struct
  let error_to_string = function
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.redshift#ResourceNotFoundFault"
    | `TagLimitExceededFault _ -> "com.amazonaws.redshift#TagLimitExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_fault_of_xml
        with
        | Ok s -> `ResourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_fault_of_xml
        with
        | Ok s -> `TagLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_tags_message) =
    let fields = create_tags_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateTags"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : create_tags_message) =
    let fields = create_tags_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateTags"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module CreateUsageLimit = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `InvalidUsageLimitFault _ -> "com.amazonaws.redshift#InvalidUsageLimitFault"
    | `LimitExceededFault _ -> "com.amazonaws.redshift#LimitExceededFault"
    | `TagLimitExceededFault _ -> "com.amazonaws.redshift#TagLimitExceededFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | `UsageLimitAlreadyExistsFault _ -> "com.amazonaws.redshift#UsageLimitAlreadyExistsFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidUsageLimit" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_usage_limit_fault_of_xml
        with
        | Ok s -> `InvalidUsageLimitFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_fault_of_xml
        with
        | Ok s -> `TagLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UsageLimitAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:usage_limit_already_exists_fault_of_xml
        with
        | Ok s -> `UsageLimitAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_usage_limit_message) =
    let fields = create_usage_limit_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateUsageLimit"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:usage_limit_of_xml ~error_deserializer

  let request_with_metadata context (request : create_usage_limit_message) =
    let fields = create_usage_limit_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateUsageLimit"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:usage_limit_of_xml ~error_deserializer
end

module DeauthorizeDataShare = struct
  let error_to_string = function
    | `InvalidDataShareFault _ -> "com.amazonaws.redshift#InvalidDataShareFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidDataShareFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_data_share_fault_of_xml
        with
        | Ok s -> `InvalidDataShareFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : deauthorize_data_share_message) =
    let fields = deauthorize_data_share_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeauthorizeDataShare"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:data_share_of_xml ~error_deserializer

  let request_with_metadata context (request : deauthorize_data_share_message) =
    let fields = deauthorize_data_share_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeauthorizeDataShare"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:data_share_of_xml ~error_deserializer
end

module DeleteAuthenticationProfile = struct
  let error_to_string = function
    | `AuthenticationProfileNotFoundFault _ ->
        "com.amazonaws.redshift#AuthenticationProfileNotFoundFault"
    | `InvalidAuthenticationProfileRequestFault _ ->
        "com.amazonaws.redshift#InvalidAuthenticationProfileRequestFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthenticationProfileNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authentication_profile_not_found_fault_of_xml
        with
        | Ok s -> `AuthenticationProfileNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidAuthenticationProfileRequestFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_authentication_profile_request_fault_of_xml
        with
        | Ok s -> `InvalidAuthenticationProfileRequestFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_authentication_profile_message) =
    let fields = delete_authentication_profile_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteAuthenticationProfile"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_authentication_profile_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_authentication_profile_message) =
    let fields = delete_authentication_profile_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteAuthenticationProfile"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_authentication_profile_result_of_xml ~error_deserializer
end

module DeleteCluster = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `ClusterSnapshotAlreadyExistsFault _ ->
        "com.amazonaws.redshift#ClusterSnapshotAlreadyExistsFault"
    | `ClusterSnapshotQuotaExceededFault _ ->
        "com.amazonaws.redshift#ClusterSnapshotQuotaExceededFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `InvalidRetentionPeriodFault _ -> "com.amazonaws.redshift#InvalidRetentionPeriodFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSnapshotAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `ClusterSnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSnapshotQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `ClusterSnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRetentionPeriodFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_retention_period_fault_of_xml
        with
        | Ok s -> `InvalidRetentionPeriodFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_cluster_message) =
    let fields = delete_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteCluster"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_cluster_message) =
    let fields = delete_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteCluster"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_cluster_result_of_xml ~error_deserializer
end

module DeleteClusterParameterGroup = struct
  let error_to_string = function
    | `ClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.redshift#ClusterParameterGroupNotFoundFault"
    | `InvalidClusterParameterGroupStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterParameterGroupStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterParameterGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_parameter_group_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterParameterGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_cluster_parameter_group_message) =
    let fields = delete_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteClusterParameterGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_cluster_parameter_group_message) =
    let fields = delete_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteClusterParameterGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteClusterSecurityGroup = struct
  let error_to_string = function
    | `ClusterSecurityGroupNotFoundFault _ ->
        "com.amazonaws.redshift#ClusterSecurityGroupNotFoundFault"
    | `InvalidClusterSecurityGroupStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSecurityGroupStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_security_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_cluster_security_group_message) =
    let fields = delete_cluster_security_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteClusterSecurityGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_cluster_security_group_message) =
    let fields = delete_cluster_security_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteClusterSecurityGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteClusterSnapshot = struct
  let error_to_string = function
    | `ClusterSnapshotNotFoundFault _ -> "com.amazonaws.redshift#ClusterSnapshotNotFoundFault"
    | `InvalidClusterSnapshotStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSnapshotStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSnapshotState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_cluster_snapshot_message) =
    let fields = delete_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteClusterSnapshot"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_cluster_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_cluster_snapshot_message) =
    let fields = delete_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteClusterSnapshot"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_cluster_snapshot_result_of_xml ~error_deserializer
end

module DeleteClusterSubnetGroup = struct
  let error_to_string = function
    | `ClusterSubnetGroupNotFoundFault _ -> "com.amazonaws.redshift#ClusterSubnetGroupNotFoundFault"
    | `InvalidClusterSubnetGroupStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSubnetGroupStateFault"
    | `InvalidClusterSubnetStateFault _ -> "com.amazonaws.redshift#InvalidClusterSubnetStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSubnetGroupStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_subnet_group_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSubnetGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSubnetStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_subnet_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSubnetStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_cluster_subnet_group_message) =
    let fields = delete_cluster_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteClusterSubnetGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_cluster_subnet_group_message) =
    let fields = delete_cluster_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteClusterSubnetGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteCustomDomainAssociation = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `CustomCnameAssociationFault _ -> "com.amazonaws.redshift#CustomCnameAssociationFault"
    | `CustomDomainAssociationNotFoundFault _ ->
        "com.amazonaws.redshift#CustomDomainAssociationNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CustomCnameAssociationFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_cname_association_fault_of_xml
        with
        | Ok s -> `CustomCnameAssociationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CustomDomainAssociationNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_domain_association_not_found_fault_of_xml
        with
        | Ok s -> `CustomDomainAssociationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_custom_domain_association_message) =
    let fields = delete_custom_domain_association_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteCustomDomainAssociation"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_custom_domain_association_message) =
    let fields = delete_custom_domain_association_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteCustomDomainAssociation"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteEndpointAccess = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `EndpointNotFoundFault _ -> "com.amazonaws.redshift#EndpointNotFoundFault"
    | `InvalidClusterSecurityGroupStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSecurityGroupStateFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `InvalidEndpointStateFault _ -> "com.amazonaws.redshift#InvalidEndpointStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EndpointNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:endpoint_not_found_fault_of_xml
        with
        | Ok s -> `EndpointNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidEndpointState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_endpoint_state_fault_of_xml
        with
        | Ok s -> `InvalidEndpointStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_endpoint_access_message) =
    let fields = delete_endpoint_access_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteEndpointAccess"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:endpoint_access_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_endpoint_access_message) =
    let fields = delete_endpoint_access_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteEndpointAccess"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:endpoint_access_of_xml ~error_deserializer
end

module DeleteEventSubscription = struct
  let error_to_string = function
    | `InvalidSubscriptionStateFault _ -> "com.amazonaws.redshift#InvalidSubscriptionStateFault"
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.redshift#SubscriptionNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidSubscriptionStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subscription_state_fault_of_xml
        with
        | Ok s -> `InvalidSubscriptionStateFault s
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
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_event_subscription_message) =
    let fields = delete_event_subscription_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteEventSubscription"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteHsmClientCertificate = struct
  let error_to_string = function
    | `HsmClientCertificateNotFoundFault _ ->
        "com.amazonaws.redshift#HsmClientCertificateNotFoundFault"
    | `InvalidHsmClientCertificateStateFault _ ->
        "com.amazonaws.redshift#InvalidHsmClientCertificateStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "HsmClientCertificateNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:hsm_client_certificate_not_found_fault_of_xml
        with
        | Ok s -> `HsmClientCertificateNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidHsmClientCertificateStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_hsm_client_certificate_state_fault_of_xml
        with
        | Ok s -> `InvalidHsmClientCertificateStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_hsm_client_certificate_message) =
    let fields = delete_hsm_client_certificate_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteHsmClientCertificate"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_hsm_client_certificate_message) =
    let fields = delete_hsm_client_certificate_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteHsmClientCertificate"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteHsmConfiguration = struct
  let error_to_string = function
    | `HsmConfigurationNotFoundFault _ -> "com.amazonaws.redshift#HsmConfigurationNotFoundFault"
    | `InvalidHsmConfigurationStateFault _ ->
        "com.amazonaws.redshift#InvalidHsmConfigurationStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "HsmConfigurationNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:hsm_configuration_not_found_fault_of_xml
        with
        | Ok s -> `HsmConfigurationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidHsmConfigurationStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_hsm_configuration_state_fault_of_xml
        with
        | Ok s -> `InvalidHsmConfigurationStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_hsm_configuration_message) =
    let fields = delete_hsm_configuration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteHsmConfiguration"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_hsm_configuration_message) =
    let fields = delete_hsm_configuration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteHsmConfiguration"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteIntegration = struct
  let error_to_string = function
    | `IntegrationConflictOperationFault _ ->
        "com.amazonaws.redshift#IntegrationConflictOperationFault"
    | `IntegrationConflictStateFault _ -> "com.amazonaws.redshift#IntegrationConflictStateFault"
    | `IntegrationNotFoundFault _ -> "com.amazonaws.redshift#IntegrationNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
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
    | "IntegrationConflictStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_conflict_state_fault_of_xml
        with
        | Ok s -> `IntegrationConflictStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IntegrationNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_not_found_fault_of_xml
        with
        | Ok s -> `IntegrationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_integration_message) =
    let fields = delete_integration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteIntegration"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:integration_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_integration_message) =
    let fields = delete_integration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteIntegration"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:integration_of_xml ~error_deserializer
end

module DeletePartner = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `PartnerNotFoundFault _ -> "com.amazonaws.redshift#PartnerNotFoundFault"
    | `UnauthorizedPartnerIntegrationFault _ ->
        "com.amazonaws.redshift#UnauthorizedPartnerIntegrationFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PartnerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:partner_not_found_fault_of_xml
        with
        | Ok s -> `PartnerNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedPartnerIntegration" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_partner_integration_fault_of_xml
        with
        | Ok s -> `UnauthorizedPartnerIntegrationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : partner_integration_input_message) =
    let fields = partner_integration_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeletePartner"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:partner_integration_output_message_of_xml ~error_deserializer

  let request_with_metadata context (request : partner_integration_input_message) =
    let fields = partner_integration_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeletePartner"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:partner_integration_output_message_of_xml ~error_deserializer
end

module DeleteRedshiftIdcApplication = struct
  let error_to_string = function
    | `DependentServiceAccessDeniedFault _ ->
        "com.amazonaws.redshift#DependentServiceAccessDeniedFault"
    | `DependentServiceUnavailableFault _ ->
        "com.amazonaws.redshift#DependentServiceUnavailableFault"
    | `RedshiftIdcApplicationNotExistsFault _ ->
        "com.amazonaws.redshift#RedshiftIdcApplicationNotExistsFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DependentServiceAccessDenied" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_access_denied_fault_of_xml
        with
        | Ok s -> `DependentServiceAccessDeniedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceUnavailableFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_unavailable_fault_of_xml
        with
        | Ok s -> `DependentServiceUnavailableFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RedshiftIdcApplicationNotExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:redshift_idc_application_not_exists_fault_of_xml
        with
        | Ok s -> `RedshiftIdcApplicationNotExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_redshift_idc_application_message) =
    let fields = delete_redshift_idc_application_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteRedshiftIdcApplication"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_redshift_idc_application_message) =
    let fields = delete_redshift_idc_application_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteRedshiftIdcApplication"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteResourcePolicy = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.redshift#ResourceNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
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
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_resource_policy_message) =
    let fields = delete_resource_policy_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteResourcePolicy"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_resource_policy_message) =
    let fields = delete_resource_policy_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteResourcePolicy"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteScheduledAction = struct
  let error_to_string = function
    | `ScheduledActionNotFoundFault _ -> "com.amazonaws.redshift#ScheduledActionNotFoundFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ScheduledActionNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:scheduled_action_not_found_fault_of_xml
        with
        | Ok s -> `ScheduledActionNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_scheduled_action_message) =
    let fields = delete_scheduled_action_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteScheduledAction"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_scheduled_action_message) =
    let fields = delete_scheduled_action_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteScheduledAction"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteSnapshotCopyGrant = struct
  let error_to_string = function
    | `InvalidSnapshotCopyGrantStateFault _ ->
        "com.amazonaws.redshift#InvalidSnapshotCopyGrantStateFault"
    | `SnapshotCopyGrantNotFoundFault _ -> "com.amazonaws.redshift#SnapshotCopyGrantNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidSnapshotCopyGrantStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_snapshot_copy_grant_state_fault_of_xml
        with
        | Ok s -> `InvalidSnapshotCopyGrantStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotCopyGrantNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_copy_grant_not_found_fault_of_xml
        with
        | Ok s -> `SnapshotCopyGrantNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_snapshot_copy_grant_message) =
    let fields = delete_snapshot_copy_grant_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteSnapshotCopyGrant"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_snapshot_copy_grant_message) =
    let fields = delete_snapshot_copy_grant_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteSnapshotCopyGrant"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteSnapshotSchedule = struct
  let error_to_string = function
    | `InvalidClusterSnapshotScheduleStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSnapshotScheduleStateFault"
    | `SnapshotScheduleNotFoundFault _ -> "com.amazonaws.redshift#SnapshotScheduleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidClusterSnapshotScheduleState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_snapshot_schedule_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSnapshotScheduleStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotScheduleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_schedule_not_found_fault_of_xml
        with
        | Ok s -> `SnapshotScheduleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_snapshot_schedule_message) =
    let fields = delete_snapshot_schedule_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteSnapshotSchedule"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_snapshot_schedule_message) =
    let fields = delete_snapshot_schedule_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteSnapshotSchedule"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteTags = struct
  let error_to_string = function
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.redshift#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_fault_of_xml
        with
        | Ok s -> `ResourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_tags_message) =
    let fields = delete_tags_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteTags"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_tags_message) =
    let fields = delete_tags_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteTags"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteUsageLimit = struct
  let error_to_string = function
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | `UsageLimitNotFoundFault _ -> "com.amazonaws.redshift#UsageLimitNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UsageLimitNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:usage_limit_not_found_fault_of_xml
        with
        | Ok s -> `UsageLimitNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_usage_limit_message) =
    let fields = delete_usage_limit_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteUsageLimit"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_usage_limit_message) =
    let fields = delete_usage_limit_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteUsageLimit"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeregisterNamespace = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `InvalidNamespaceFault _ -> "com.amazonaws.redshift#InvalidNamespaceFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidNamespaceFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_namespace_fault_of_xml
        with
        | Ok s -> `InvalidNamespaceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : deregister_namespace_input_message) =
    let fields = deregister_namespace_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeregisterNamespace"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:deregister_namespace_output_message_of_xml ~error_deserializer

  let request_with_metadata context (request : deregister_namespace_input_message) =
    let fields = deregister_namespace_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeregisterNamespace"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:deregister_namespace_output_message_of_xml ~error_deserializer
end

module DescribeAccountAttributes = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_account_attributes_message) =
    let fields = describe_account_attributes_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAccountAttributes"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:account_attribute_list_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_account_attributes_message) =
    let fields = describe_account_attributes_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAccountAttributes"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:account_attribute_list_of_xml ~error_deserializer
end

module DescribeAuthenticationProfiles = struct
  let error_to_string = function
    | `AuthenticationProfileNotFoundFault _ ->
        "com.amazonaws.redshift#AuthenticationProfileNotFoundFault"
    | `InvalidAuthenticationProfileRequestFault _ ->
        "com.amazonaws.redshift#InvalidAuthenticationProfileRequestFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthenticationProfileNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authentication_profile_not_found_fault_of_xml
        with
        | Ok s -> `AuthenticationProfileNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidAuthenticationProfileRequestFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_authentication_profile_request_fault_of_xml
        with
        | Ok s -> `InvalidAuthenticationProfileRequestFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_authentication_profiles_message) =
    let fields = describe_authentication_profiles_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAuthenticationProfiles"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_authentication_profiles_result_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_authentication_profiles_message) =
    let fields = describe_authentication_profiles_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAuthenticationProfiles"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_authentication_profiles_result_of_xml ~error_deserializer
end

module DescribeClusterDbRevisions = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_cluster_db_revisions_message) =
    let fields = describe_cluster_db_revisions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeClusterDbRevisions"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_db_revisions_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_cluster_db_revisions_message) =
    let fields = describe_cluster_db_revisions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeClusterDbRevisions"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_db_revisions_message_of_xml ~error_deserializer
end

module DescribeClusterParameterGroups = struct
  let error_to_string = function
    | `ClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.redshift#ClusterParameterGroupNotFoundFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_cluster_parameter_groups_message) =
    let fields = describe_cluster_parameter_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeClusterParameterGroups"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_parameter_groups_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_cluster_parameter_groups_message) =
    let fields = describe_cluster_parameter_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeClusterParameterGroups"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_parameter_groups_message_of_xml ~error_deserializer
end

module DescribeClusterParameters = struct
  let error_to_string = function
    | `ClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.redshift#ClusterParameterGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_cluster_parameters_message) =
    let fields = describe_cluster_parameters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeClusterParameters"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_parameter_group_details_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_cluster_parameters_message) =
    let fields = describe_cluster_parameters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeClusterParameters"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_parameter_group_details_of_xml ~error_deserializer
end

module DescribeClusters = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_clusters_message) =
    let fields = describe_clusters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeClusters"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:clusters_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_clusters_message) =
    let fields = describe_clusters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeClusters"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:clusters_message_of_xml ~error_deserializer
end

module DescribeClusterSecurityGroups = struct
  let error_to_string = function
    | `ClusterSecurityGroupNotFoundFault _ ->
        "com.amazonaws.redshift#ClusterSecurityGroupNotFoundFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_security_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_cluster_security_groups_message) =
    let fields = describe_cluster_security_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeClusterSecurityGroups"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_security_group_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_cluster_security_groups_message) =
    let fields = describe_cluster_security_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeClusterSecurityGroups"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_security_group_message_of_xml ~error_deserializer
end

module DescribeClusterSnapshots = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `ClusterSnapshotNotFoundFault _ -> "com.amazonaws.redshift#ClusterSnapshotNotFoundFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_cluster_snapshots_message) =
    let fields = describe_cluster_snapshots_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeClusterSnapshots"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:snapshot_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_cluster_snapshots_message) =
    let fields = describe_cluster_snapshots_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeClusterSnapshots"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:snapshot_message_of_xml ~error_deserializer
end

module DescribeClusterSubnetGroups = struct
  let error_to_string = function
    | `ClusterSubnetGroupNotFoundFault _ -> "com.amazonaws.redshift#ClusterSubnetGroupNotFoundFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_cluster_subnet_groups_message) =
    let fields = describe_cluster_subnet_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeClusterSubnetGroups"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_subnet_group_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_cluster_subnet_groups_message) =
    let fields = describe_cluster_subnet_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeClusterSubnetGroups"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_subnet_group_message_of_xml ~error_deserializer
end

module DescribeClusterTracks = struct
  let error_to_string = function
    | `InvalidClusterTrackFault _ -> "com.amazonaws.redshift#InvalidClusterTrackFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidClusterTrack" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_track_fault_of_xml
        with
        | Ok s -> `InvalidClusterTrackFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_cluster_tracks_message) =
    let fields = describe_cluster_tracks_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeClusterTracks"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:track_list_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_cluster_tracks_message) =
    let fields = describe_cluster_tracks_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeClusterTracks"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:track_list_message_of_xml ~error_deserializer
end

module DescribeClusterVersions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_cluster_versions_message) =
    let fields = describe_cluster_versions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeClusterVersions"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_versions_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_cluster_versions_message) =
    let fields = describe_cluster_versions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeClusterVersions"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_versions_message_of_xml ~error_deserializer
end

module DescribeCustomDomainAssociations = struct
  let error_to_string = function
    | `CustomDomainAssociationNotFoundFault _ ->
        "com.amazonaws.redshift#CustomDomainAssociationNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CustomDomainAssociationNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_domain_association_not_found_fault_of_xml
        with
        | Ok s -> `CustomDomainAssociationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_custom_domain_associations_message) =
    let fields = describe_custom_domain_associations_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeCustomDomainAssociations"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:custom_domain_associations_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_custom_domain_associations_message) =
    let fields = describe_custom_domain_associations_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeCustomDomainAssociations"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:custom_domain_associations_message_of_xml ~error_deserializer
end

module DescribeDataShares = struct
  let error_to_string = function
    | `InvalidDataShareFault _ -> "com.amazonaws.redshift#InvalidDataShareFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidDataShareFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_data_share_fault_of_xml
        with
        | Ok s -> `InvalidDataShareFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_data_shares_message) =
    let fields = describe_data_shares_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDataShares"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_data_shares_result_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_data_shares_message) =
    let fields = describe_data_shares_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDataShares"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_data_shares_result_of_xml ~error_deserializer
end

module DescribeDataSharesForConsumer = struct
  let error_to_string = function
    | `InvalidNamespaceFault _ -> "com.amazonaws.redshift#InvalidNamespaceFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNamespaceFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_namespace_fault_of_xml
        with
        | Ok s -> `InvalidNamespaceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_data_shares_for_consumer_message) =
    let fields = describe_data_shares_for_consumer_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDataSharesForConsumer"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_data_shares_for_consumer_result_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_data_shares_for_consumer_message) =
    let fields = describe_data_shares_for_consumer_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDataSharesForConsumer"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_data_shares_for_consumer_result_of_xml ~error_deserializer
end

module DescribeDataSharesForProducer = struct
  let error_to_string = function
    | `InvalidNamespaceFault _ -> "com.amazonaws.redshift#InvalidNamespaceFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNamespaceFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_namespace_fault_of_xml
        with
        | Ok s -> `InvalidNamespaceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_data_shares_for_producer_message) =
    let fields = describe_data_shares_for_producer_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDataSharesForProducer"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_data_shares_for_producer_result_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_data_shares_for_producer_message) =
    let fields = describe_data_shares_for_producer_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDataSharesForProducer"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_data_shares_for_producer_result_of_xml ~error_deserializer
end

module DescribeDefaultClusterParameters = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_default_cluster_parameters_message) =
    let fields = describe_default_cluster_parameters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeDefaultClusterParameters"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_default_cluster_parameters_result_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_default_cluster_parameters_message) =
    let fields = describe_default_cluster_parameters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeDefaultClusterParameters"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_default_cluster_parameters_result_of_xml ~error_deserializer
end

module DescribeEndpointAccess = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `EndpointNotFoundFault _ -> "com.amazonaws.redshift#EndpointNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EndpointNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:endpoint_not_found_fault_of_xml
        with
        | Ok s -> `EndpointNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_endpoint_access_message) =
    let fields = describe_endpoint_access_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEndpointAccess"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:endpoint_access_list_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_endpoint_access_message) =
    let fields = describe_endpoint_access_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEndpointAccess"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:endpoint_access_list_of_xml ~error_deserializer
end

module DescribeEndpointAuthorization = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_endpoint_authorization_message) =
    let fields = describe_endpoint_authorization_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEndpointAuthorization"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:endpoint_authorization_list_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_endpoint_authorization_message) =
    let fields = describe_endpoint_authorization_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEndpointAuthorization"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:endpoint_authorization_list_of_xml ~error_deserializer
end

module DescribeEventCategories = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_event_categories_message) =
    let fields = describe_event_categories_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEventCategories"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:event_categories_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_event_categories_message) =
    let fields = describe_event_categories_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEventCategories"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:event_categories_message_of_xml ~error_deserializer
end

module DescribeEvents = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_events_message) =
    let fields = describe_events_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEvents"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:events_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_events_message) =
    let fields = describe_events_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEvents"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:events_message_of_xml ~error_deserializer
end

module DescribeEventSubscriptions = struct
  let error_to_string = function
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.redshift#SubscriptionNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
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
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:event_subscriptions_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_event_subscriptions_message) =
    let fields = describe_event_subscriptions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEventSubscriptions"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:event_subscriptions_message_of_xml ~error_deserializer
end

module DescribeHsmClientCertificates = struct
  let error_to_string = function
    | `HsmClientCertificateNotFoundFault _ ->
        "com.amazonaws.redshift#HsmClientCertificateNotFoundFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "HsmClientCertificateNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:hsm_client_certificate_not_found_fault_of_xml
        with
        | Ok s -> `HsmClientCertificateNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_hsm_client_certificates_message) =
    let fields = describe_hsm_client_certificates_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeHsmClientCertificates"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:hsm_client_certificate_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_hsm_client_certificates_message) =
    let fields = describe_hsm_client_certificates_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeHsmClientCertificates"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:hsm_client_certificate_message_of_xml ~error_deserializer
end

module DescribeHsmConfigurations = struct
  let error_to_string = function
    | `HsmConfigurationNotFoundFault _ -> "com.amazonaws.redshift#HsmConfigurationNotFoundFault"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "HsmConfigurationNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:hsm_configuration_not_found_fault_of_xml
        with
        | Ok s -> `HsmConfigurationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_hsm_configurations_message) =
    let fields = describe_hsm_configurations_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeHsmConfigurations"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:hsm_configuration_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_hsm_configurations_message) =
    let fields = describe_hsm_configurations_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeHsmConfigurations"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:hsm_configuration_message_of_xml ~error_deserializer
end

module DescribeInboundIntegrations = struct
  let error_to_string = function
    | `IntegrationNotFoundFault _ -> "com.amazonaws.redshift#IntegrationNotFoundFault"
    | `InvalidNamespaceFault _ -> "com.amazonaws.redshift#InvalidNamespaceFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
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
    | "InvalidNamespaceFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_namespace_fault_of_xml
        with
        | Ok s -> `InvalidNamespaceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_inbound_integrations_message) =
    let fields = describe_inbound_integrations_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeInboundIntegrations"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:inbound_integrations_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_inbound_integrations_message) =
    let fields = describe_inbound_integrations_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeInboundIntegrations"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:inbound_integrations_message_of_xml ~error_deserializer
end

module DescribeIntegrations = struct
  let error_to_string = function
    | `IntegrationNotFoundFault _ -> "com.amazonaws.redshift#IntegrationNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
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
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_integrations_message) =
    let fields = describe_integrations_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeIntegrations"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:integrations_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_integrations_message) =
    let fields = describe_integrations_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeIntegrations"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:integrations_message_of_xml ~error_deserializer
end

module DescribeLoggingStatus = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_logging_status_message) =
    let fields = describe_logging_status_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeLoggingStatus"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:logging_status_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_logging_status_message) =
    let fields = describe_logging_status_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeLoggingStatus"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:logging_status_of_xml ~error_deserializer
end

module DescribeNodeConfigurationOptions = struct
  let error_to_string = function
    | `AccessToSnapshotDeniedFault _ -> "com.amazonaws.redshift#AccessToSnapshotDeniedFault"
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `ClusterSnapshotNotFoundFault _ -> "com.amazonaws.redshift#ClusterSnapshotNotFoundFault"
    | `InvalidClusterSnapshotStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSnapshotStateFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AccessToSnapshotDenied" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_to_snapshot_denied_fault_of_xml
        with
        | Ok s -> `AccessToSnapshotDeniedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSnapshotState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_node_configuration_options_message) =
    let fields = describe_node_configuration_options_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeNodeConfigurationOptions"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:node_configuration_options_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_node_configuration_options_message) =
    let fields = describe_node_configuration_options_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeNodeConfigurationOptions"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:node_configuration_options_message_of_xml ~error_deserializer
end

module DescribeOrderableClusterOptions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_orderable_cluster_options_message) =
    let fields = describe_orderable_cluster_options_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeOrderableClusterOptions"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:orderable_cluster_options_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_orderable_cluster_options_message) =
    let fields = describe_orderable_cluster_options_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeOrderableClusterOptions"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:orderable_cluster_options_message_of_xml ~error_deserializer
end

module DescribePartners = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `UnauthorizedPartnerIntegrationFault _ ->
        "com.amazonaws.redshift#UnauthorizedPartnerIntegrationFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedPartnerIntegration" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_partner_integration_fault_of_xml
        with
        | Ok s -> `UnauthorizedPartnerIntegrationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_partners_input_message) =
    let fields = describe_partners_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribePartners"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_partners_output_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_partners_input_message) =
    let fields = describe_partners_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribePartners"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_partners_output_message_of_xml ~error_deserializer
end

module DescribeRedshiftIdcApplications = struct
  let error_to_string = function
    | `DependentServiceAccessDeniedFault _ ->
        "com.amazonaws.redshift#DependentServiceAccessDeniedFault"
    | `DependentServiceUnavailableFault _ ->
        "com.amazonaws.redshift#DependentServiceUnavailableFault"
    | `RedshiftIdcApplicationNotExistsFault _ ->
        "com.amazonaws.redshift#RedshiftIdcApplicationNotExistsFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DependentServiceAccessDenied" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_access_denied_fault_of_xml
        with
        | Ok s -> `DependentServiceAccessDeniedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceUnavailableFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_unavailable_fault_of_xml
        with
        | Ok s -> `DependentServiceUnavailableFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RedshiftIdcApplicationNotExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:redshift_idc_application_not_exists_fault_of_xml
        with
        | Ok s -> `RedshiftIdcApplicationNotExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_redshift_idc_applications_message) =
    let fields = describe_redshift_idc_applications_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeRedshiftIdcApplications"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_redshift_idc_applications_result_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_redshift_idc_applications_message) =
    let fields = describe_redshift_idc_applications_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeRedshiftIdcApplications"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_redshift_idc_applications_result_of_xml ~error_deserializer
end

module DescribeReservedNodeExchangeStatus = struct
  let error_to_string = function
    | `ReservedNodeExchangeNotFoundFault _ ->
        "com.amazonaws.redshift#ReservedNodeExchangeNotFoundFault"
    | `ReservedNodeNotFoundFault _ -> "com.amazonaws.redshift#ReservedNodeNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ReservedNodeExchangeNotFond" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_exchange_not_found_fault_of_xml
        with
        | Ok s -> `ReservedNodeExchangeNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_not_found_fault_of_xml
        with
        | Ok s -> `ReservedNodeNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_reserved_node_exchange_status_input_message) =
    let fields = describe_reserved_node_exchange_status_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeReservedNodeExchangeStatus"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_reserved_node_exchange_status_output_message_of_xml
      ~error_deserializer

  let request_with_metadata context (request : describe_reserved_node_exchange_status_input_message)
      =
    let fields = describe_reserved_node_exchange_status_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeReservedNodeExchangeStatus"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_reserved_node_exchange_status_output_message_of_xml
      ~error_deserializer
end

module DescribeReservedNodeOfferings = struct
  let error_to_string = function
    | `DependentServiceUnavailableFault _ ->
        "com.amazonaws.redshift#DependentServiceUnavailableFault"
    | `ReservedNodeOfferingNotFoundFault _ ->
        "com.amazonaws.redshift#ReservedNodeOfferingNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DependentServiceUnavailableFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_unavailable_fault_of_xml
        with
        | Ok s -> `DependentServiceUnavailableFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeOfferingNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_offering_not_found_fault_of_xml
        with
        | Ok s -> `ReservedNodeOfferingNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_reserved_node_offerings_message) =
    let fields = describe_reserved_node_offerings_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeReservedNodeOfferings"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:reserved_node_offerings_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_reserved_node_offerings_message) =
    let fields = describe_reserved_node_offerings_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeReservedNodeOfferings"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:reserved_node_offerings_message_of_xml ~error_deserializer
end

module DescribeReservedNodes = struct
  let error_to_string = function
    | `DependentServiceUnavailableFault _ ->
        "com.amazonaws.redshift#DependentServiceUnavailableFault"
    | `ReservedNodeNotFoundFault _ -> "com.amazonaws.redshift#ReservedNodeNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DependentServiceUnavailableFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_unavailable_fault_of_xml
        with
        | Ok s -> `DependentServiceUnavailableFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_not_found_fault_of_xml
        with
        | Ok s -> `ReservedNodeNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_reserved_nodes_message) =
    let fields = describe_reserved_nodes_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeReservedNodes"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:reserved_nodes_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_reserved_nodes_message) =
    let fields = describe_reserved_nodes_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeReservedNodes"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:reserved_nodes_message_of_xml ~error_deserializer
end

module DescribeResize = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `ResizeNotFoundFault _ -> "com.amazonaws.redshift#ResizeNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResizeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resize_not_found_fault_of_xml
        with
        | Ok s -> `ResizeNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_resize_message) =
    let fields = describe_resize_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeResize"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:resize_progress_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_resize_message) =
    let fields = describe_resize_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeResize"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:resize_progress_message_of_xml ~error_deserializer
end

module DescribeScheduledActions = struct
  let error_to_string = function
    | `ScheduledActionNotFoundFault _ -> "com.amazonaws.redshift#ScheduledActionNotFoundFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ScheduledActionNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:scheduled_action_not_found_fault_of_xml
        with
        | Ok s -> `ScheduledActionNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_scheduled_actions_message) =
    let fields = describe_scheduled_actions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeScheduledActions"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:scheduled_actions_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_scheduled_actions_message) =
    let fields = describe_scheduled_actions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeScheduledActions"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:scheduled_actions_message_of_xml ~error_deserializer
end

module DescribeSnapshotCopyGrants = struct
  let error_to_string = function
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `SnapshotCopyGrantNotFoundFault _ -> "com.amazonaws.redshift#SnapshotCopyGrantNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotCopyGrantNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_copy_grant_not_found_fault_of_xml
        with
        | Ok s -> `SnapshotCopyGrantNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_snapshot_copy_grants_message) =
    let fields = describe_snapshot_copy_grants_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeSnapshotCopyGrants"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:snapshot_copy_grant_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_snapshot_copy_grants_message) =
    let fields = describe_snapshot_copy_grants_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeSnapshotCopyGrants"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:snapshot_copy_grant_message_of_xml ~error_deserializer
end

module DescribeSnapshotSchedules = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_snapshot_schedules_message) =
    let fields = describe_snapshot_schedules_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeSnapshotSchedules"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_snapshot_schedules_output_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_snapshot_schedules_message) =
    let fields = describe_snapshot_schedules_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeSnapshotSchedules"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_snapshot_schedules_output_message_of_xml ~error_deserializer
end

module DescribeStorage = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeStorage"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:customer_storage_message_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeStorage"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:customer_storage_message_of_xml ~error_deserializer
end

module DescribeTableRestoreStatus = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `TableRestoreNotFoundFault _ -> "com.amazonaws.redshift#TableRestoreNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TableRestoreNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:table_restore_not_found_fault_of_xml
        with
        | Ok s -> `TableRestoreNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_table_restore_status_message) =
    let fields = describe_table_restore_status_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeTableRestoreStatus"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:table_restore_status_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_table_restore_status_message) =
    let fields = describe_table_restore_status_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeTableRestoreStatus"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:table_restore_status_message_of_xml ~error_deserializer
end

module DescribeTags = struct
  let error_to_string = function
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.redshift#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_fault_of_xml
        with
        | Ok s -> `ResourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_tags_message) =
    let fields = describe_tags_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeTags"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:tagged_resource_list_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_tags_message) =
    let fields = describe_tags_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeTags"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:tagged_resource_list_message_of_xml ~error_deserializer
end

module DescribeUsageLimits = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_usage_limits_message) =
    let fields = describe_usage_limits_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeUsageLimits"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:usage_limit_list_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_usage_limits_message) =
    let fields = describe_usage_limits_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeUsageLimits"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:usage_limit_list_of_xml ~error_deserializer
end

module DisableLogging = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : disable_logging_message) =
    let fields = disable_logging_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DisableLogging"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:logging_status_of_xml ~error_deserializer

  let request_with_metadata context (request : disable_logging_message) =
    let fields = disable_logging_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DisableLogging"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:logging_status_of_xml ~error_deserializer
end

module DisableSnapshotCopy = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `SnapshotCopyAlreadyDisabledFault _ ->
        "com.amazonaws.redshift#SnapshotCopyAlreadyDisabledFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotCopyAlreadyDisabledFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_copy_already_disabled_fault_of_xml
        with
        | Ok s -> `SnapshotCopyAlreadyDisabledFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : disable_snapshot_copy_message) =
    let fields = disable_snapshot_copy_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DisableSnapshotCopy"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:disable_snapshot_copy_result_of_xml ~error_deserializer

  let request_with_metadata context (request : disable_snapshot_copy_message) =
    let fields = disable_snapshot_copy_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DisableSnapshotCopy"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:disable_snapshot_copy_result_of_xml ~error_deserializer
end

module DisassociateDataShareConsumer = struct
  let error_to_string = function
    | `InvalidDataShareFault _ -> "com.amazonaws.redshift#InvalidDataShareFault"
    | `InvalidNamespaceFault _ -> "com.amazonaws.redshift#InvalidNamespaceFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidDataShareFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_data_share_fault_of_xml
        with
        | Ok s -> `InvalidDataShareFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidNamespaceFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_namespace_fault_of_xml
        with
        | Ok s -> `InvalidNamespaceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : disassociate_data_share_consumer_message) =
    let fields = disassociate_data_share_consumer_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DisassociateDataShareConsumer"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:data_share_of_xml ~error_deserializer

  let request_with_metadata context (request : disassociate_data_share_consumer_message) =
    let fields = disassociate_data_share_consumer_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DisassociateDataShareConsumer"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:data_share_of_xml ~error_deserializer
end

module EnableLogging = struct
  let error_to_string = function
    | `BucketNotFoundFault _ -> "com.amazonaws.redshift#BucketNotFoundFault"
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InsufficientS3BucketPolicyFault _ -> "com.amazonaws.redshift#InsufficientS3BucketPolicyFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `InvalidS3BucketNameFault _ -> "com.amazonaws.redshift#InvalidS3BucketNameFault"
    | `InvalidS3KeyPrefixFault _ -> "com.amazonaws.redshift#InvalidS3KeyPrefixFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "BucketNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:bucket_not_found_fault_of_xml
        with
        | Ok s -> `BucketNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientS3BucketPolicyFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_s3_bucket_policy_fault_of_xml
        with
        | Ok s -> `InsufficientS3BucketPolicyFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidS3BucketNameFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_s3_bucket_name_fault_of_xml
        with
        | Ok s -> `InvalidS3BucketNameFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidS3KeyPrefixFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_s3_key_prefix_fault_of_xml
        with
        | Ok s -> `InvalidS3KeyPrefixFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : enable_logging_message) =
    let fields = enable_logging_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"EnableLogging"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:logging_status_of_xml ~error_deserializer

  let request_with_metadata context (request : enable_logging_message) =
    let fields = enable_logging_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"EnableLogging"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:logging_status_of_xml ~error_deserializer
end

module EnableSnapshotCopy = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `CopyToRegionDisabledFault _ -> "com.amazonaws.redshift#CopyToRegionDisabledFault"
    | `DependentServiceRequestThrottlingFault _ ->
        "com.amazonaws.redshift#DependentServiceRequestThrottlingFault"
    | `IncompatibleOrderableOptions _ -> "com.amazonaws.redshift#IncompatibleOrderableOptions"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `InvalidRetentionPeriodFault _ -> "com.amazonaws.redshift#InvalidRetentionPeriodFault"
    | `LimitExceededFault _ -> "com.amazonaws.redshift#LimitExceededFault"
    | `SnapshotCopyAlreadyEnabledFault _ -> "com.amazonaws.redshift#SnapshotCopyAlreadyEnabledFault"
    | `SnapshotCopyGrantNotFoundFault _ -> "com.amazonaws.redshift#SnapshotCopyGrantNotFoundFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | `UnknownSnapshotCopyRegionFault _ -> "com.amazonaws.redshift#UnknownSnapshotCopyRegionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CopyToRegionDisabledFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:copy_to_region_disabled_fault_of_xml
        with
        | Ok s -> `CopyToRegionDisabledFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceRequestThrottlingFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_request_throttling_fault_of_xml
        with
        | Ok s -> `DependentServiceRequestThrottlingFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IncompatibleOrderableOptions" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:incompatible_orderable_options_of_xml
        with
        | Ok s -> `IncompatibleOrderableOptions s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRetentionPeriodFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_retention_period_fault_of_xml
        with
        | Ok s -> `InvalidRetentionPeriodFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotCopyAlreadyEnabledFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_copy_already_enabled_fault_of_xml
        with
        | Ok s -> `SnapshotCopyAlreadyEnabledFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotCopyGrantNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_copy_grant_not_found_fault_of_xml
        with
        | Ok s -> `SnapshotCopyGrantNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnknownSnapshotCopyRegionFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unknown_snapshot_copy_region_fault_of_xml
        with
        | Ok s -> `UnknownSnapshotCopyRegionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : enable_snapshot_copy_message) =
    let fields = enable_snapshot_copy_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"EnableSnapshotCopy"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:enable_snapshot_copy_result_of_xml ~error_deserializer

  let request_with_metadata context (request : enable_snapshot_copy_message) =
    let fields = enable_snapshot_copy_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"EnableSnapshotCopy"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:enable_snapshot_copy_result_of_xml ~error_deserializer
end

module FailoverPrimaryCompute = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : failover_primary_compute_input_message) =
    let fields = failover_primary_compute_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"FailoverPrimaryCompute"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:failover_primary_compute_result_of_xml ~error_deserializer

  let request_with_metadata context (request : failover_primary_compute_input_message) =
    let fields = failover_primary_compute_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"FailoverPrimaryCompute"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:failover_primary_compute_result_of_xml ~error_deserializer
end

module GetClusterCredentials = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_cluster_credentials_message) =
    let fields = get_cluster_credentials_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetClusterCredentials"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_credentials_of_xml ~error_deserializer

  let request_with_metadata context (request : get_cluster_credentials_message) =
    let fields = get_cluster_credentials_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetClusterCredentials"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_credentials_of_xml ~error_deserializer
end

module GetClusterCredentialsWithIAM = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_cluster_credentials_with_iam_message) =
    let fields = get_cluster_credentials_with_iam_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetClusterCredentialsWithIAM"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_extended_credentials_of_xml ~error_deserializer

  let request_with_metadata context (request : get_cluster_credentials_with_iam_message) =
    let fields = get_cluster_credentials_with_iam_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetClusterCredentialsWithIAM"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_extended_credentials_of_xml ~error_deserializer
end

module GetIdentityCenterAuthToken = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `RedshiftInvalidParameterFault _ -> "com.amazonaws.redshift#RedshiftInvalidParameterFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RedshiftInvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:redshift_invalid_parameter_fault_of_xml
        with
        | Ok s -> `RedshiftInvalidParameterFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_identity_center_auth_token_request) =
    let fields = get_identity_center_auth_token_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetIdentityCenterAuthToken"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:get_identity_center_auth_token_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_identity_center_auth_token_request) =
    let fields = get_identity_center_auth_token_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetIdentityCenterAuthToken"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:get_identity_center_auth_token_response_of_xml ~error_deserializer
end

module GetReservedNodeExchangeConfigurationOptions = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `ClusterSnapshotNotFoundFault _ -> "com.amazonaws.redshift#ClusterSnapshotNotFoundFault"
    | `DependentServiceUnavailableFault _ ->
        "com.amazonaws.redshift#DependentServiceUnavailableFault"
    | `InvalidReservedNodeStateFault _ -> "com.amazonaws.redshift#InvalidReservedNodeStateFault"
    | `ReservedNodeAlreadyMigratedFault _ ->
        "com.amazonaws.redshift#ReservedNodeAlreadyMigratedFault"
    | `ReservedNodeNotFoundFault _ -> "com.amazonaws.redshift#ReservedNodeNotFoundFault"
    | `ReservedNodeOfferingNotFoundFault _ ->
        "com.amazonaws.redshift#ReservedNodeOfferingNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceUnavailableFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_unavailable_fault_of_xml
        with
        | Ok s -> `DependentServiceUnavailableFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReservedNodeState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_reserved_node_state_fault_of_xml
        with
        | Ok s -> `InvalidReservedNodeStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeAlreadyMigrated" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_already_migrated_fault_of_xml
        with
        | Ok s -> `ReservedNodeAlreadyMigratedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_not_found_fault_of_xml
        with
        | Ok s -> `ReservedNodeNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeOfferingNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_offering_not_found_fault_of_xml
        with
        | Ok s -> `ReservedNodeOfferingNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_reserved_node_exchange_configuration_options_input_message) =
    let fields =
      get_reserved_node_exchange_configuration_options_input_message_to_query [] request
    in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetReservedNodeExchangeConfigurationOptions"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:get_reserved_node_exchange_configuration_options_output_message_of_xml
      ~error_deserializer

  let request_with_metadata context
      (request : get_reserved_node_exchange_configuration_options_input_message) =
    let fields =
      get_reserved_node_exchange_configuration_options_input_message_to_query [] request
    in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"GetReservedNodeExchangeConfigurationOptions"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:get_reserved_node_exchange_configuration_options_output_message_of_xml
      ~error_deserializer
end

module GetReservedNodeExchangeOfferings = struct
  let error_to_string = function
    | `DependentServiceUnavailableFault _ ->
        "com.amazonaws.redshift#DependentServiceUnavailableFault"
    | `InvalidReservedNodeStateFault _ -> "com.amazonaws.redshift#InvalidReservedNodeStateFault"
    | `ReservedNodeAlreadyMigratedFault _ ->
        "com.amazonaws.redshift#ReservedNodeAlreadyMigratedFault"
    | `ReservedNodeNotFoundFault _ -> "com.amazonaws.redshift#ReservedNodeNotFoundFault"
    | `ReservedNodeOfferingNotFoundFault _ ->
        "com.amazonaws.redshift#ReservedNodeOfferingNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DependentServiceUnavailableFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_unavailable_fault_of_xml
        with
        | Ok s -> `DependentServiceUnavailableFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReservedNodeState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_reserved_node_state_fault_of_xml
        with
        | Ok s -> `InvalidReservedNodeStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeAlreadyMigrated" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_already_migrated_fault_of_xml
        with
        | Ok s -> `ReservedNodeAlreadyMigratedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_not_found_fault_of_xml
        with
        | Ok s -> `ReservedNodeNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeOfferingNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_offering_not_found_fault_of_xml
        with
        | Ok s -> `ReservedNodeOfferingNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_reserved_node_exchange_offerings_input_message) =
    let fields = get_reserved_node_exchange_offerings_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetReservedNodeExchangeOfferings"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:get_reserved_node_exchange_offerings_output_message_of_xml
      ~error_deserializer

  let request_with_metadata context (request : get_reserved_node_exchange_offerings_input_message) =
    let fields = get_reserved_node_exchange_offerings_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetReservedNodeExchangeOfferings"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:get_reserved_node_exchange_offerings_output_message_of_xml
      ~error_deserializer
end

module GetResourcePolicy = struct
  let error_to_string = function
    | `InvalidPolicyFault _ -> "com.amazonaws.redshift#InvalidPolicyFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.redshift#ResourceNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidPolicyFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_policy_fault_of_xml
        with
        | Ok s -> `InvalidPolicyFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_fault_of_xml
        with
        | Ok s -> `ResourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_resource_policy_message) =
    let fields = get_resource_policy_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetResourcePolicy"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:get_resource_policy_result_of_xml ~error_deserializer

  let request_with_metadata context (request : get_resource_policy_message) =
    let fields = get_resource_policy_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetResourcePolicy"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:get_resource_policy_result_of_xml ~error_deserializer
end

module ListRecommendations = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_recommendations_message) =
    let fields = list_recommendations_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListRecommendations"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:list_recommendations_result_of_xml ~error_deserializer

  let request_with_metadata context (request : list_recommendations_message) =
    let fields = list_recommendations_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListRecommendations"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:list_recommendations_result_of_xml ~error_deserializer
end

module ModifyAquaConfiguration = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_aqua_input_message) =
    let fields = modify_aqua_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyAquaConfiguration"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_aqua_output_message_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_aqua_input_message) =
    let fields = modify_aqua_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyAquaConfiguration"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_aqua_output_message_of_xml ~error_deserializer
end

module ModifyAuthenticationProfile = struct
  let error_to_string = function
    | `AuthenticationProfileNotFoundFault _ ->
        "com.amazonaws.redshift#AuthenticationProfileNotFoundFault"
    | `AuthenticationProfileQuotaExceededFault _ ->
        "com.amazonaws.redshift#AuthenticationProfileQuotaExceededFault"
    | `InvalidAuthenticationProfileRequestFault _ ->
        "com.amazonaws.redshift#InvalidAuthenticationProfileRequestFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthenticationProfileNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authentication_profile_not_found_fault_of_xml
        with
        | Ok s -> `AuthenticationProfileNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "AuthenticationProfileQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authentication_profile_quota_exceeded_fault_of_xml
        with
        | Ok s -> `AuthenticationProfileQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidAuthenticationProfileRequestFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_authentication_profile_request_fault_of_xml
        with
        | Ok s -> `InvalidAuthenticationProfileRequestFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_authentication_profile_message) =
    let fields = modify_authentication_profile_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyAuthenticationProfile"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_authentication_profile_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_authentication_profile_message) =
    let fields = modify_authentication_profile_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyAuthenticationProfile"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_authentication_profile_result_of_xml ~error_deserializer
end

module ModifyCluster = struct
  let error_to_string = function
    | `ClusterAlreadyExistsFault _ -> "com.amazonaws.redshift#ClusterAlreadyExistsFault"
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `ClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.redshift#ClusterParameterGroupNotFoundFault"
    | `ClusterSecurityGroupNotFoundFault _ ->
        "com.amazonaws.redshift#ClusterSecurityGroupNotFoundFault"
    | `CustomCnameAssociationFault _ -> "com.amazonaws.redshift#CustomCnameAssociationFault"
    | `DependentServiceRequestThrottlingFault _ ->
        "com.amazonaws.redshift#DependentServiceRequestThrottlingFault"
    | `HsmClientCertificateNotFoundFault _ ->
        "com.amazonaws.redshift#HsmClientCertificateNotFoundFault"
    | `HsmConfigurationNotFoundFault _ -> "com.amazonaws.redshift#HsmConfigurationNotFoundFault"
    | `InsufficientClusterCapacityFault _ ->
        "com.amazonaws.redshift#InsufficientClusterCapacityFault"
    | `InvalidClusterSecurityGroupStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSecurityGroupStateFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `InvalidClusterTrackFault _ -> "com.amazonaws.redshift#InvalidClusterTrackFault"
    | `InvalidElasticIpFault _ -> "com.amazonaws.redshift#InvalidElasticIpFault"
    | `InvalidRetentionPeriodFault _ -> "com.amazonaws.redshift#InvalidRetentionPeriodFault"
    | `Ipv6CidrBlockNotFoundFault _ -> "com.amazonaws.redshift#Ipv6CidrBlockNotFoundFault"
    | `LimitExceededFault _ -> "com.amazonaws.redshift#LimitExceededFault"
    | `NumberOfNodesPerClusterLimitExceededFault _ ->
        "com.amazonaws.redshift#NumberOfNodesPerClusterLimitExceededFault"
    | `NumberOfNodesQuotaExceededFault _ -> "com.amazonaws.redshift#NumberOfNodesQuotaExceededFault"
    | `TableLimitExceededFault _ -> "com.amazonaws.redshift#TableLimitExceededFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | `UnsupportedOptionFault _ -> "com.amazonaws.redshift#UnsupportedOptionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_already_exists_fault_of_xml
        with
        | Ok s -> `ClusterAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_security_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CustomCnameAssociationFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_cname_association_fault_of_xml
        with
        | Ok s -> `CustomCnameAssociationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceRequestThrottlingFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_request_throttling_fault_of_xml
        with
        | Ok s -> `DependentServiceRequestThrottlingFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "HsmClientCertificateNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:hsm_client_certificate_not_found_fault_of_xml
        with
        | Ok s -> `HsmClientCertificateNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "HsmConfigurationNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:hsm_configuration_not_found_fault_of_xml
        with
        | Ok s -> `HsmConfigurationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientClusterCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterTrack" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_track_fault_of_xml
        with
        | Ok s -> `InvalidClusterTrackFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidElasticIpFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_elastic_ip_fault_of_xml
        with
        | Ok s -> `InvalidElasticIpFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRetentionPeriodFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_retention_period_fault_of_xml
        with
        | Ok s -> `InvalidRetentionPeriodFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "Ipv6CidrBlockNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:ipv6_cidr_block_not_found_fault_of_xml
        with
        | Ok s -> `Ipv6CidrBlockNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NumberOfNodesPerClusterLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:number_of_nodes_per_cluster_limit_exceeded_fault_of_xml
        with
        | Ok s -> `NumberOfNodesPerClusterLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NumberOfNodesQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:number_of_nodes_quota_exceeded_fault_of_xml
        with
        | Ok s -> `NumberOfNodesQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TableLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:table_limit_exceeded_fault_of_xml
        with
        | Ok s -> `TableLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOptionFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_option_fault_of_xml
        with
        | Ok s -> `UnsupportedOptionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_cluster_message) =
    let fields = modify_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyCluster"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_cluster_message) =
    let fields = modify_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyCluster"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_cluster_result_of_xml ~error_deserializer
end

module ModifyClusterDbRevision = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `ClusterOnLatestRevisionFault _ -> "com.amazonaws.redshift#ClusterOnLatestRevisionFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterOnLatestRevision" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_on_latest_revision_fault_of_xml
        with
        | Ok s -> `ClusterOnLatestRevisionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_cluster_db_revision_message) =
    let fields = modify_cluster_db_revision_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyClusterDbRevision"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_cluster_db_revision_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_cluster_db_revision_message) =
    let fields = modify_cluster_db_revision_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyClusterDbRevision"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_cluster_db_revision_result_of_xml ~error_deserializer
end

module ModifyClusterIamRoles = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_cluster_iam_roles_message) =
    let fields = modify_cluster_iam_roles_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyClusterIamRoles"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_cluster_iam_roles_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_cluster_iam_roles_message) =
    let fields = modify_cluster_iam_roles_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyClusterIamRoles"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_cluster_iam_roles_result_of_xml ~error_deserializer
end

module ModifyClusterMaintenance = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_cluster_maintenance_message) =
    let fields = modify_cluster_maintenance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyClusterMaintenance"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_cluster_maintenance_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_cluster_maintenance_message) =
    let fields = modify_cluster_maintenance_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyClusterMaintenance"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_cluster_maintenance_result_of_xml ~error_deserializer
end

module ModifyClusterParameterGroup = struct
  let error_to_string = function
    | `ClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.redshift#ClusterParameterGroupNotFoundFault"
    | `InvalidClusterParameterGroupStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterParameterGroupStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterParameterGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_parameter_group_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterParameterGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_cluster_parameter_group_message) =
    let fields = modify_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyClusterParameterGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_parameter_group_name_message_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_cluster_parameter_group_message) =
    let fields = modify_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyClusterParameterGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_parameter_group_name_message_of_xml ~error_deserializer
end

module ModifyClusterSnapshot = struct
  let error_to_string = function
    | `ClusterSnapshotNotFoundFault _ -> "com.amazonaws.redshift#ClusterSnapshotNotFoundFault"
    | `InvalidClusterSnapshotStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSnapshotStateFault"
    | `InvalidRetentionPeriodFault _ -> "com.amazonaws.redshift#InvalidRetentionPeriodFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSnapshotState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRetentionPeriodFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_retention_period_fault_of_xml
        with
        | Ok s -> `InvalidRetentionPeriodFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_cluster_snapshot_message) =
    let fields = modify_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyClusterSnapshot"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_cluster_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_cluster_snapshot_message) =
    let fields = modify_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyClusterSnapshot"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_cluster_snapshot_result_of_xml ~error_deserializer
end

module ModifyClusterSnapshotSchedule = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidClusterSnapshotScheduleStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSnapshotScheduleStateFault"
    | `SnapshotScheduleNotFoundFault _ -> "com.amazonaws.redshift#SnapshotScheduleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSnapshotScheduleState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_snapshot_schedule_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSnapshotScheduleStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotScheduleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_schedule_not_found_fault_of_xml
        with
        | Ok s -> `SnapshotScheduleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_cluster_snapshot_schedule_message) =
    let fields = modify_cluster_snapshot_schedule_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyClusterSnapshotSchedule"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : modify_cluster_snapshot_schedule_message) =
    let fields = modify_cluster_snapshot_schedule_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyClusterSnapshotSchedule"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module ModifyClusterSubnetGroup = struct
  let error_to_string = function
    | `ClusterSubnetGroupNotFoundFault _ -> "com.amazonaws.redshift#ClusterSubnetGroupNotFoundFault"
    | `ClusterSubnetQuotaExceededFault _ -> "com.amazonaws.redshift#ClusterSubnetQuotaExceededFault"
    | `DependentServiceRequestThrottlingFault _ ->
        "com.amazonaws.redshift#DependentServiceRequestThrottlingFault"
    | `InvalidSubnet _ -> "com.amazonaws.redshift#InvalidSubnet"
    | `SubnetAlreadyInUse _ -> "com.amazonaws.redshift#SubnetAlreadyInUse"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSubnetQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_subnet_quota_exceeded_fault_of_xml
        with
        | Ok s -> `ClusterSubnetQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceRequestThrottlingFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_request_throttling_fault_of_xml
        with
        | Ok s -> `DependentServiceRequestThrottlingFault s
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
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_cluster_subnet_group_message) =
    let fields = modify_cluster_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyClusterSubnetGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_cluster_subnet_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_cluster_subnet_group_message) =
    let fields = modify_cluster_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyClusterSubnetGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_cluster_subnet_group_result_of_xml ~error_deserializer
end

module ModifyCustomDomainAssociation = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `CustomCnameAssociationFault _ -> "com.amazonaws.redshift#CustomCnameAssociationFault"
    | `CustomDomainAssociationNotFoundFault _ ->
        "com.amazonaws.redshift#CustomDomainAssociationNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CustomCnameAssociationFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_cname_association_fault_of_xml
        with
        | Ok s -> `CustomCnameAssociationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CustomDomainAssociationNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_domain_association_not_found_fault_of_xml
        with
        | Ok s -> `CustomDomainAssociationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_custom_domain_association_message) =
    let fields = modify_custom_domain_association_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyCustomDomainAssociation"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_custom_domain_association_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_custom_domain_association_message) =
    let fields = modify_custom_domain_association_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyCustomDomainAssociation"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_custom_domain_association_result_of_xml ~error_deserializer
end

module ModifyEndpointAccess = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `EndpointNotFoundFault _ -> "com.amazonaws.redshift#EndpointNotFoundFault"
    | `InvalidClusterSecurityGroupStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSecurityGroupStateFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `InvalidEndpointStateFault _ -> "com.amazonaws.redshift#InvalidEndpointStateFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EndpointNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:endpoint_not_found_fault_of_xml
        with
        | Ok s -> `EndpointNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidEndpointState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_endpoint_state_fault_of_xml
        with
        | Ok s -> `InvalidEndpointStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_endpoint_access_message) =
    let fields = modify_endpoint_access_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyEndpointAccess"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:endpoint_access_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_endpoint_access_message) =
    let fields = modify_endpoint_access_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyEndpointAccess"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:endpoint_access_of_xml ~error_deserializer
end

module ModifyEventSubscription = struct
  let error_to_string = function
    | `InvalidSubscriptionStateFault _ -> "com.amazonaws.redshift#InvalidSubscriptionStateFault"
    | `SNSInvalidTopicFault _ -> "com.amazonaws.redshift#SNSInvalidTopicFault"
    | `SNSNoAuthorizationFault _ -> "com.amazonaws.redshift#SNSNoAuthorizationFault"
    | `SNSTopicArnNotFoundFault _ -> "com.amazonaws.redshift#SNSTopicArnNotFoundFault"
    | `SourceNotFoundFault _ -> "com.amazonaws.redshift#SourceNotFoundFault"
    | `SubscriptionCategoryNotFoundFault _ ->
        "com.amazonaws.redshift#SubscriptionCategoryNotFoundFault"
    | `SubscriptionEventIdNotFoundFault _ ->
        "com.amazonaws.redshift#SubscriptionEventIdNotFoundFault"
    | `SubscriptionNotFoundFault _ -> "com.amazonaws.redshift#SubscriptionNotFoundFault"
    | `SubscriptionSeverityNotFoundFault _ ->
        "com.amazonaws.redshift#SubscriptionSeverityNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidSubscriptionStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subscription_state_fault_of_xml
        with
        | Ok s -> `InvalidSubscriptionStateFault s
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
    | "SubscriptionCategoryNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subscription_category_not_found_fault_of_xml
        with
        | Ok s -> `SubscriptionCategoryNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubscriptionEventIdNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subscription_event_id_not_found_fault_of_xml
        with
        | Ok s -> `SubscriptionEventIdNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubscriptionNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subscription_not_found_fault_of_xml
        with
        | Ok s -> `SubscriptionNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubscriptionSeverityNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subscription_severity_not_found_fault_of_xml
        with
        | Ok s -> `SubscriptionSeverityNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_event_subscription_message) =
    let fields = modify_event_subscription_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyEventSubscription"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_event_subscription_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_event_subscription_message) =
    let fields = modify_event_subscription_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyEventSubscription"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_event_subscription_result_of_xml ~error_deserializer
end

module ModifyIntegration = struct
  let error_to_string = function
    | `IntegrationAlreadyExistsFault _ -> "com.amazonaws.redshift#IntegrationAlreadyExistsFault"
    | `IntegrationConflictOperationFault _ ->
        "com.amazonaws.redshift#IntegrationConflictOperationFault"
    | `IntegrationConflictStateFault _ -> "com.amazonaws.redshift#IntegrationConflictStateFault"
    | `IntegrationNotFoundFault _ -> "com.amazonaws.redshift#IntegrationNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
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
    | "IntegrationConflictStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_conflict_state_fault_of_xml
        with
        | Ok s -> `IntegrationConflictStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IntegrationNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:integration_not_found_fault_of_xml
        with
        | Ok s -> `IntegrationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_integration_message) =
    let fields = modify_integration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyIntegration"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:integration_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_integration_message) =
    let fields = modify_integration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyIntegration"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:integration_of_xml ~error_deserializer
end

module ModifyLakehouseConfiguration = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `DependentServiceAccessDeniedFault _ ->
        "com.amazonaws.redshift#DependentServiceAccessDeniedFault"
    | `DependentServiceUnavailableFault _ ->
        "com.amazonaws.redshift#DependentServiceUnavailableFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `RedshiftIdcApplicationNotExistsFault _ ->
        "com.amazonaws.redshift#RedshiftIdcApplicationNotExistsFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceAccessDenied" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_access_denied_fault_of_xml
        with
        | Ok s -> `DependentServiceAccessDeniedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceUnavailableFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_unavailable_fault_of_xml
        with
        | Ok s -> `DependentServiceUnavailableFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RedshiftIdcApplicationNotExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:redshift_idc_application_not_exists_fault_of_xml
        with
        | Ok s -> `RedshiftIdcApplicationNotExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_lakehouse_configuration_message) =
    let fields = modify_lakehouse_configuration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyLakehouseConfiguration"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:lakehouse_configuration_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_lakehouse_configuration_message) =
    let fields = modify_lakehouse_configuration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyLakehouseConfiguration"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:lakehouse_configuration_of_xml ~error_deserializer
end

module ModifyRedshiftIdcApplication = struct
  let error_to_string = function
    | `DependentServiceAccessDeniedFault _ ->
        "com.amazonaws.redshift#DependentServiceAccessDeniedFault"
    | `DependentServiceUnavailableFault _ ->
        "com.amazonaws.redshift#DependentServiceUnavailableFault"
    | `RedshiftIdcApplicationNotExistsFault _ ->
        "com.amazonaws.redshift#RedshiftIdcApplicationNotExistsFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DependentServiceAccessDenied" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_access_denied_fault_of_xml
        with
        | Ok s -> `DependentServiceAccessDeniedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceUnavailableFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_unavailable_fault_of_xml
        with
        | Ok s -> `DependentServiceUnavailableFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RedshiftIdcApplicationNotExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:redshift_idc_application_not_exists_fault_of_xml
        with
        | Ok s -> `RedshiftIdcApplicationNotExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_redshift_idc_application_message) =
    let fields = modify_redshift_idc_application_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyRedshiftIdcApplication"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_redshift_idc_application_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_redshift_idc_application_message) =
    let fields = modify_redshift_idc_application_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyRedshiftIdcApplication"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_redshift_idc_application_result_of_xml ~error_deserializer
end

module ModifyScheduledAction = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidScheduledActionFault _ -> "com.amazonaws.redshift#InvalidScheduledActionFault"
    | `InvalidScheduleFault _ -> "com.amazonaws.redshift#InvalidScheduleFault"
    | `ScheduledActionNotFoundFault _ -> "com.amazonaws.redshift#ScheduledActionNotFoundFault"
    | `ScheduledActionTypeUnsupportedFault _ ->
        "com.amazonaws.redshift#ScheduledActionTypeUnsupportedFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidScheduledAction" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_scheduled_action_fault_of_xml
        with
        | Ok s -> `InvalidScheduledActionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSchedule" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_schedule_fault_of_xml
        with
        | Ok s -> `InvalidScheduleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ScheduledActionNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:scheduled_action_not_found_fault_of_xml
        with
        | Ok s -> `ScheduledActionNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ScheduledActionTypeUnsupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:scheduled_action_type_unsupported_fault_of_xml
        with
        | Ok s -> `ScheduledActionTypeUnsupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_scheduled_action_message) =
    let fields = modify_scheduled_action_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyScheduledAction"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:scheduled_action_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_scheduled_action_message) =
    let fields = modify_scheduled_action_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyScheduledAction"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:scheduled_action_of_xml ~error_deserializer
end

module ModifySnapshotCopyRetentionPeriod = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `InvalidRetentionPeriodFault _ -> "com.amazonaws.redshift#InvalidRetentionPeriodFault"
    | `SnapshotCopyDisabledFault _ -> "com.amazonaws.redshift#SnapshotCopyDisabledFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRetentionPeriodFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_retention_period_fault_of_xml
        with
        | Ok s -> `InvalidRetentionPeriodFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotCopyDisabledFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_copy_disabled_fault_of_xml
        with
        | Ok s -> `SnapshotCopyDisabledFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_snapshot_copy_retention_period_message) =
    let fields = modify_snapshot_copy_retention_period_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifySnapshotCopyRetentionPeriod"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_snapshot_copy_retention_period_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_snapshot_copy_retention_period_message) =
    let fields = modify_snapshot_copy_retention_period_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifySnapshotCopyRetentionPeriod"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:modify_snapshot_copy_retention_period_result_of_xml ~error_deserializer
end

module ModifySnapshotSchedule = struct
  let error_to_string = function
    | `InvalidScheduleFault _ -> "com.amazonaws.redshift#InvalidScheduleFault"
    | `SnapshotScheduleNotFoundFault _ -> "com.amazonaws.redshift#SnapshotScheduleNotFoundFault"
    | `SnapshotScheduleUpdateInProgressFault _ ->
        "com.amazonaws.redshift#SnapshotScheduleUpdateInProgressFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidSchedule" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_schedule_fault_of_xml
        with
        | Ok s -> `InvalidScheduleFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotScheduleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_schedule_not_found_fault_of_xml
        with
        | Ok s -> `SnapshotScheduleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotScheduleUpdateInProgress" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_schedule_update_in_progress_fault_of_xml
        with
        | Ok s -> `SnapshotScheduleUpdateInProgressFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_snapshot_schedule_message) =
    let fields = modify_snapshot_schedule_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifySnapshotSchedule"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:snapshot_schedule_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_snapshot_schedule_message) =
    let fields = modify_snapshot_schedule_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifySnapshotSchedule"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:snapshot_schedule_of_xml ~error_deserializer
end

module ModifyUsageLimit = struct
  let error_to_string = function
    | `InvalidUsageLimitFault _ -> "com.amazonaws.redshift#InvalidUsageLimitFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | `UsageLimitNotFoundFault _ -> "com.amazonaws.redshift#UsageLimitNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidUsageLimit" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_usage_limit_fault_of_xml
        with
        | Ok s -> `InvalidUsageLimitFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UsageLimitNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:usage_limit_not_found_fault_of_xml
        with
        | Ok s -> `UsageLimitNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_usage_limit_message) =
    let fields = modify_usage_limit_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyUsageLimit"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:usage_limit_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_usage_limit_message) =
    let fields = modify_usage_limit_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyUsageLimit"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:usage_limit_of_xml ~error_deserializer
end

module PauseCluster = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : pause_cluster_message) =
    let fields = pause_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PauseCluster"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:pause_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : pause_cluster_message) =
    let fields = pause_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PauseCluster"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:pause_cluster_result_of_xml ~error_deserializer
end

module PurchaseReservedNodeOffering = struct
  let error_to_string = function
    | `ReservedNodeAlreadyExistsFault _ -> "com.amazonaws.redshift#ReservedNodeAlreadyExistsFault"
    | `ReservedNodeOfferingNotFoundFault _ ->
        "com.amazonaws.redshift#ReservedNodeOfferingNotFoundFault"
    | `ReservedNodeQuotaExceededFault _ -> "com.amazonaws.redshift#ReservedNodeQuotaExceededFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ReservedNodeAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_already_exists_fault_of_xml
        with
        | Ok s -> `ReservedNodeAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeOfferingNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_offering_not_found_fault_of_xml
        with
        | Ok s -> `ReservedNodeOfferingNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_quota_exceeded_fault_of_xml
        with
        | Ok s -> `ReservedNodeQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : purchase_reserved_node_offering_message) =
    let fields = purchase_reserved_node_offering_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PurchaseReservedNodeOffering"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:purchase_reserved_node_offering_result_of_xml ~error_deserializer

  let request_with_metadata context (request : purchase_reserved_node_offering_message) =
    let fields = purchase_reserved_node_offering_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PurchaseReservedNodeOffering"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:purchase_reserved_node_offering_result_of_xml ~error_deserializer
end

module PutResourcePolicy = struct
  let error_to_string = function
    | `ConflictPolicyUpdateFault _ -> "com.amazonaws.redshift#ConflictPolicyUpdateFault"
    | `InvalidPolicyFault _ -> "com.amazonaws.redshift#InvalidPolicyFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.redshift#ResourceNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConflictPolicyUpdateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:conflict_policy_update_fault_of_xml
        with
        | Ok s -> `ConflictPolicyUpdateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidPolicyFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_policy_fault_of_xml
        with
        | Ok s -> `InvalidPolicyFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_fault_of_xml
        with
        | Ok s -> `ResourceNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_resource_policy_message) =
    let fields = put_resource_policy_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutResourcePolicy"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:put_resource_policy_result_of_xml ~error_deserializer

  let request_with_metadata context (request : put_resource_policy_message) =
    let fields = put_resource_policy_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutResourcePolicy"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:put_resource_policy_result_of_xml ~error_deserializer
end

module RebootCluster = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : reboot_cluster_message) =
    let fields = reboot_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RebootCluster"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:reboot_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : reboot_cluster_message) =
    let fields = reboot_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RebootCluster"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:reboot_cluster_result_of_xml ~error_deserializer
end

module RegisterNamespace = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `InvalidNamespaceFault _ -> "com.amazonaws.redshift#InvalidNamespaceFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidNamespaceFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_namespace_fault_of_xml
        with
        | Ok s -> `InvalidNamespaceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : register_namespace_input_message) =
    let fields = register_namespace_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RegisterNamespace"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:register_namespace_output_message_of_xml ~error_deserializer

  let request_with_metadata context (request : register_namespace_input_message) =
    let fields = register_namespace_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RegisterNamespace"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:register_namespace_output_message_of_xml ~error_deserializer
end

module RejectDataShare = struct
  let error_to_string = function
    | `InvalidDataShareFault _ -> "com.amazonaws.redshift#InvalidDataShareFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidDataShareFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_data_share_fault_of_xml
        with
        | Ok s -> `InvalidDataShareFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : reject_data_share_message) =
    let fields = reject_data_share_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RejectDataShare"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:data_share_of_xml ~error_deserializer

  let request_with_metadata context (request : reject_data_share_message) =
    let fields = reject_data_share_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RejectDataShare"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:data_share_of_xml ~error_deserializer
end

module ResetClusterParameterGroup = struct
  let error_to_string = function
    | `ClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.redshift#ClusterParameterGroupNotFoundFault"
    | `InvalidClusterParameterGroupStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterParameterGroupStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterParameterGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_parameter_group_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterParameterGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : reset_cluster_parameter_group_message) =
    let fields = reset_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ResetClusterParameterGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_parameter_group_name_message_of_xml ~error_deserializer

  let request_with_metadata context (request : reset_cluster_parameter_group_message) =
    let fields = reset_cluster_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ResetClusterParameterGroup"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:cluster_parameter_group_name_message_of_xml ~error_deserializer
end

module ResizeCluster = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `DependentServiceUnavailableFault _ ->
        "com.amazonaws.redshift#DependentServiceUnavailableFault"
    | `InsufficientClusterCapacityFault _ ->
        "com.amazonaws.redshift#InsufficientClusterCapacityFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `InvalidReservedNodeStateFault _ -> "com.amazonaws.redshift#InvalidReservedNodeStateFault"
    | `LimitExceededFault _ -> "com.amazonaws.redshift#LimitExceededFault"
    | `NumberOfNodesPerClusterLimitExceededFault _ ->
        "com.amazonaws.redshift#NumberOfNodesPerClusterLimitExceededFault"
    | `NumberOfNodesQuotaExceededFault _ -> "com.amazonaws.redshift#NumberOfNodesQuotaExceededFault"
    | `ReservedNodeAlreadyExistsFault _ -> "com.amazonaws.redshift#ReservedNodeAlreadyExistsFault"
    | `ReservedNodeAlreadyMigratedFault _ ->
        "com.amazonaws.redshift#ReservedNodeAlreadyMigratedFault"
    | `ReservedNodeNotFoundFault _ -> "com.amazonaws.redshift#ReservedNodeNotFoundFault"
    | `ReservedNodeOfferingNotFoundFault _ ->
        "com.amazonaws.redshift#ReservedNodeOfferingNotFoundFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | `UnsupportedOptionFault _ -> "com.amazonaws.redshift#UnsupportedOptionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceUnavailableFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_unavailable_fault_of_xml
        with
        | Ok s -> `DependentServiceUnavailableFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientClusterCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReservedNodeState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_reserved_node_state_fault_of_xml
        with
        | Ok s -> `InvalidReservedNodeStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NumberOfNodesPerClusterLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:number_of_nodes_per_cluster_limit_exceeded_fault_of_xml
        with
        | Ok s -> `NumberOfNodesPerClusterLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NumberOfNodesQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:number_of_nodes_quota_exceeded_fault_of_xml
        with
        | Ok s -> `NumberOfNodesQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_already_exists_fault_of_xml
        with
        | Ok s -> `ReservedNodeAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeAlreadyMigrated" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_already_migrated_fault_of_xml
        with
        | Ok s -> `ReservedNodeAlreadyMigratedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_not_found_fault_of_xml
        with
        | Ok s -> `ReservedNodeNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeOfferingNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_offering_not_found_fault_of_xml
        with
        | Ok s -> `ReservedNodeOfferingNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOptionFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_option_fault_of_xml
        with
        | Ok s -> `UnsupportedOptionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : resize_cluster_message) =
    let fields = resize_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ResizeCluster"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:resize_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : resize_cluster_message) =
    let fields = resize_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ResizeCluster"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:resize_cluster_result_of_xml ~error_deserializer
end

module RestoreFromClusterSnapshot = struct
  let error_to_string = function
    | `AccessToSnapshotDeniedFault _ -> "com.amazonaws.redshift#AccessToSnapshotDeniedFault"
    | `ClusterAlreadyExistsFault _ -> "com.amazonaws.redshift#ClusterAlreadyExistsFault"
    | `ClusterParameterGroupNotFoundFault _ ->
        "com.amazonaws.redshift#ClusterParameterGroupNotFoundFault"
    | `ClusterQuotaExceededFault _ -> "com.amazonaws.redshift#ClusterQuotaExceededFault"
    | `ClusterSecurityGroupNotFoundFault _ ->
        "com.amazonaws.redshift#ClusterSecurityGroupNotFoundFault"
    | `ClusterSnapshotNotFoundFault _ -> "com.amazonaws.redshift#ClusterSnapshotNotFoundFault"
    | `ClusterSubnetGroupNotFoundFault _ -> "com.amazonaws.redshift#ClusterSubnetGroupNotFoundFault"
    | `DependentServiceAccessDeniedFault _ ->
        "com.amazonaws.redshift#DependentServiceAccessDeniedFault"
    | `DependentServiceRequestThrottlingFault _ ->
        "com.amazonaws.redshift#DependentServiceRequestThrottlingFault"
    | `DependentServiceUnavailableFault _ ->
        "com.amazonaws.redshift#DependentServiceUnavailableFault"
    | `HsmClientCertificateNotFoundFault _ ->
        "com.amazonaws.redshift#HsmClientCertificateNotFoundFault"
    | `HsmConfigurationNotFoundFault _ -> "com.amazonaws.redshift#HsmConfigurationNotFoundFault"
    | `InsufficientClusterCapacityFault _ ->
        "com.amazonaws.redshift#InsufficientClusterCapacityFault"
    | `InvalidClusterSnapshotStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSnapshotStateFault"
    | `InvalidClusterSubnetGroupStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSubnetGroupStateFault"
    | `InvalidClusterTrackFault _ -> "com.amazonaws.redshift#InvalidClusterTrackFault"
    | `InvalidElasticIpFault _ -> "com.amazonaws.redshift#InvalidElasticIpFault"
    | `InvalidReservedNodeStateFault _ -> "com.amazonaws.redshift#InvalidReservedNodeStateFault"
    | `InvalidRestoreFault _ -> "com.amazonaws.redshift#InvalidRestoreFault"
    | `InvalidSubnet _ -> "com.amazonaws.redshift#InvalidSubnet"
    | `InvalidTagFault _ -> "com.amazonaws.redshift#InvalidTagFault"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.redshift#InvalidVPCNetworkStateFault"
    | `Ipv6CidrBlockNotFoundFault _ -> "com.amazonaws.redshift#Ipv6CidrBlockNotFoundFault"
    | `LimitExceededFault _ -> "com.amazonaws.redshift#LimitExceededFault"
    | `NumberOfNodesPerClusterLimitExceededFault _ ->
        "com.amazonaws.redshift#NumberOfNodesPerClusterLimitExceededFault"
    | `NumberOfNodesQuotaExceededFault _ -> "com.amazonaws.redshift#NumberOfNodesQuotaExceededFault"
    | `RedshiftIdcApplicationNotExistsFault _ ->
        "com.amazonaws.redshift#RedshiftIdcApplicationNotExistsFault"
    | `ReservedNodeAlreadyExistsFault _ -> "com.amazonaws.redshift#ReservedNodeAlreadyExistsFault"
    | `ReservedNodeAlreadyMigratedFault _ ->
        "com.amazonaws.redshift#ReservedNodeAlreadyMigratedFault"
    | `ReservedNodeNotFoundFault _ -> "com.amazonaws.redshift#ReservedNodeNotFoundFault"
    | `ReservedNodeOfferingNotFoundFault _ ->
        "com.amazonaws.redshift#ReservedNodeOfferingNotFoundFault"
    | `SnapshotScheduleNotFoundFault _ -> "com.amazonaws.redshift#SnapshotScheduleNotFoundFault"
    | `TagLimitExceededFault _ -> "com.amazonaws.redshift#TagLimitExceededFault"
    | `UnauthorizedOperation _ -> "com.amazonaws.redshift#UnauthorizedOperation"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AccessToSnapshotDenied" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_to_snapshot_denied_fault_of_xml
        with
        | Ok s -> `AccessToSnapshotDeniedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_already_exists_fault_of_xml
        with
        | Ok s -> `ClusterAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_quota_exceeded_fault_of_xml
        with
        | Ok s -> `ClusterQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_security_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceAccessDenied" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_access_denied_fault_of_xml
        with
        | Ok s -> `DependentServiceAccessDeniedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceRequestThrottlingFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_request_throttling_fault_of_xml
        with
        | Ok s -> `DependentServiceRequestThrottlingFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceUnavailableFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_unavailable_fault_of_xml
        with
        | Ok s -> `DependentServiceUnavailableFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "HsmClientCertificateNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:hsm_client_certificate_not_found_fault_of_xml
        with
        | Ok s -> `HsmClientCertificateNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "HsmConfigurationNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:hsm_configuration_not_found_fault_of_xml
        with
        | Ok s -> `HsmConfigurationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientClusterCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSnapshotState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSubnetGroupStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_subnet_group_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSubnetGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterTrack" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_track_fault_of_xml
        with
        | Ok s -> `InvalidClusterTrackFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidElasticIpFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_elastic_ip_fault_of_xml
        with
        | Ok s -> `InvalidElasticIpFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReservedNodeState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_reserved_node_state_fault_of_xml
        with
        | Ok s -> `InvalidReservedNodeStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRestore" -> (
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
    | "InvalidTagFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tag_fault_of_xml
        with
        | Ok s -> `InvalidTagFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "Ipv6CidrBlockNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:ipv6_cidr_block_not_found_fault_of_xml
        with
        | Ok s -> `Ipv6CidrBlockNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NumberOfNodesPerClusterLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:number_of_nodes_per_cluster_limit_exceeded_fault_of_xml
        with
        | Ok s -> `NumberOfNodesPerClusterLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NumberOfNodesQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:number_of_nodes_quota_exceeded_fault_of_xml
        with
        | Ok s -> `NumberOfNodesQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RedshiftIdcApplicationNotExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:redshift_idc_application_not_exists_fault_of_xml
        with
        | Ok s -> `RedshiftIdcApplicationNotExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_already_exists_fault_of_xml
        with
        | Ok s -> `ReservedNodeAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeAlreadyMigrated" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_already_migrated_fault_of_xml
        with
        | Ok s -> `ReservedNodeAlreadyMigratedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_not_found_fault_of_xml
        with
        | Ok s -> `ReservedNodeNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedNodeOfferingNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_node_offering_not_found_fault_of_xml
        with
        | Ok s -> `ReservedNodeOfferingNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotScheduleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_schedule_not_found_fault_of_xml
        with
        | Ok s -> `SnapshotScheduleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_fault_of_xml
        with
        | Ok s -> `TagLimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_operation_of_xml
        with
        | Ok s -> `UnauthorizedOperation s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : restore_from_cluster_snapshot_message) =
    let fields = restore_from_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RestoreFromClusterSnapshot"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:restore_from_cluster_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : restore_from_cluster_snapshot_message) =
    let fields = restore_from_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RestoreFromClusterSnapshot"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:restore_from_cluster_snapshot_result_of_xml ~error_deserializer
end

module RestoreTableFromClusterSnapshot = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `ClusterSnapshotNotFoundFault _ -> "com.amazonaws.redshift#ClusterSnapshotNotFoundFault"
    | `InProgressTableRestoreQuotaExceededFault _ ->
        "com.amazonaws.redshift#InProgressTableRestoreQuotaExceededFault"
    | `InvalidClusterSnapshotStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSnapshotStateFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `InvalidTableRestoreArgumentFault _ ->
        "com.amazonaws.redshift#InvalidTableRestoreArgumentFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InProgressTableRestoreQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:in_progress_table_restore_quota_exceeded_fault_of_xml
        with
        | Ok s -> `InProgressTableRestoreQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSnapshotState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTableRestoreArgument" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_table_restore_argument_fault_of_xml
        with
        | Ok s -> `InvalidTableRestoreArgumentFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : restore_table_from_cluster_snapshot_message) =
    let fields = restore_table_from_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RestoreTableFromClusterSnapshot"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:restore_table_from_cluster_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : restore_table_from_cluster_snapshot_message) =
    let fields = restore_table_from_cluster_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RestoreTableFromClusterSnapshot"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:restore_table_from_cluster_snapshot_result_of_xml ~error_deserializer
end

module ResumeCluster = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `InsufficientClusterCapacityFault _ ->
        "com.amazonaws.redshift#InsufficientClusterCapacityFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientClusterCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : resume_cluster_message) =
    let fields = resume_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ResumeCluster"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:resume_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : resume_cluster_message) =
    let fields = resume_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ResumeCluster"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:resume_cluster_result_of_xml ~error_deserializer
end

module RevokeClusterSecurityGroupIngress = struct
  let error_to_string = function
    | `AuthorizationNotFoundFault _ -> "com.amazonaws.redshift#AuthorizationNotFoundFault"
    | `ClusterSecurityGroupNotFoundFault _ ->
        "com.amazonaws.redshift#ClusterSecurityGroupNotFoundFault"
    | `InvalidClusterSecurityGroupStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSecurityGroupStateFault"
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
    | "ClusterSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_security_group_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : revoke_cluster_security_group_ingress_message) =
    let fields = revoke_cluster_security_group_ingress_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RevokeClusterSecurityGroupIngress"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:revoke_cluster_security_group_ingress_result_of_xml ~error_deserializer

  let request_with_metadata context (request : revoke_cluster_security_group_ingress_message) =
    let fields = revoke_cluster_security_group_ingress_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RevokeClusterSecurityGroupIngress"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:revoke_cluster_security_group_ingress_result_of_xml ~error_deserializer
end

module RevokeEndpointAccess = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `EndpointAuthorizationNotFoundFault _ ->
        "com.amazonaws.redshift#EndpointAuthorizationNotFoundFault"
    | `EndpointNotFoundFault _ -> "com.amazonaws.redshift#EndpointNotFoundFault"
    | `InvalidAuthorizationStateFault _ -> "com.amazonaws.redshift#InvalidAuthorizationStateFault"
    | `InvalidClusterSecurityGroupStateFault _ ->
        "com.amazonaws.redshift#InvalidClusterSecurityGroupStateFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `InvalidEndpointStateFault _ -> "com.amazonaws.redshift#InvalidEndpointStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EndpointAuthorizationNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:endpoint_authorization_not_found_fault_of_xml
        with
        | Ok s -> `EndpointAuthorizationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EndpointNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:endpoint_not_found_fault_of_xml
        with
        | Ok s -> `EndpointNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidAuthorizationState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_authorization_state_fault_of_xml
        with
        | Ok s -> `InvalidAuthorizationStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidEndpointState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_endpoint_state_fault_of_xml
        with
        | Ok s -> `InvalidEndpointStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : revoke_endpoint_access_message) =
    let fields = revoke_endpoint_access_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RevokeEndpointAccess"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:endpoint_authorization_of_xml ~error_deserializer

  let request_with_metadata context (request : revoke_endpoint_access_message) =
    let fields = revoke_endpoint_access_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RevokeEndpointAccess"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:endpoint_authorization_of_xml ~error_deserializer
end

module RevokeSnapshotAccess = struct
  let error_to_string = function
    | `AccessToSnapshotDeniedFault _ -> "com.amazonaws.redshift#AccessToSnapshotDeniedFault"
    | `AuthorizationNotFoundFault _ -> "com.amazonaws.redshift#AuthorizationNotFoundFault"
    | `ClusterSnapshotNotFoundFault _ -> "com.amazonaws.redshift#ClusterSnapshotNotFoundFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AccessToSnapshotDenied" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_to_snapshot_denied_fault_of_xml
        with
        | Ok s -> `AccessToSnapshotDeniedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "AuthorizationNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_not_found_fault_of_xml
        with
        | Ok s -> `AuthorizationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterSnapshotNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ClusterSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : revoke_snapshot_access_message) =
    let fields = revoke_snapshot_access_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RevokeSnapshotAccess"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:revoke_snapshot_access_result_of_xml ~error_deserializer

  let request_with_metadata context (request : revoke_snapshot_access_message) =
    let fields = revoke_snapshot_access_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RevokeSnapshotAccess"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:revoke_snapshot_access_result_of_xml ~error_deserializer
end

module RotateEncryptionKey = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `DependentServiceRequestThrottlingFault _ ->
        "com.amazonaws.redshift#DependentServiceRequestThrottlingFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.redshift#InvalidClusterStateFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependentServiceRequestThrottlingFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependent_service_request_throttling_fault_of_xml
        with
        | Ok s -> `DependentServiceRequestThrottlingFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : rotate_encryption_key_message) =
    let fields = rotate_encryption_key_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RotateEncryptionKey"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:rotate_encryption_key_result_of_xml ~error_deserializer

  let request_with_metadata context (request : rotate_encryption_key_message) =
    let fields = rotate_encryption_key_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RotateEncryptionKey"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:rotate_encryption_key_result_of_xml ~error_deserializer
end

module UpdatePartnerStatus = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.redshift#ClusterNotFoundFault"
    | `PartnerNotFoundFault _ -> "com.amazonaws.redshift#PartnerNotFoundFault"
    | `UnauthorizedPartnerIntegrationFault _ ->
        "com.amazonaws.redshift#UnauthorizedPartnerIntegrationFault"
    | `UnsupportedOperationFault _ -> "com.amazonaws.redshift#UnsupportedOperationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_not_found_fault_of_xml
        with
        | Ok s -> `ClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PartnerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:partner_not_found_fault_of_xml
        with
        | Ok s -> `PartnerNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnauthorizedPartnerIntegration" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unauthorized_partner_integration_fault_of_xml
        with
        | Ok s -> `UnauthorizedPartnerIntegrationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedOperation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_operation_fault_of_xml
        with
        | Ok s -> `UnsupportedOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_partner_status_input_message) =
    let fields = update_partner_status_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdatePartnerStatus"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:partner_integration_output_message_of_xml ~error_deserializer

  let request_with_metadata context (request : update_partner_status_input_message) =
    let fields = update_partner_status_input_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdatePartnerStatus"
      ~xmlNamespace:"http://redshift.amazonaws.com/doc/2012-12-01/" ~service ~context ~fields
      ~output_deserializer:partner_integration_output_message_of_xml ~error_deserializer
end
