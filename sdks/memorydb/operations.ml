open Types
open Service_metadata

module BatchUpdateCluster = struct
  let error_to_string = function
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ServiceUpdateNotFoundFault _ -> "com.amazonaws.memorydb#ServiceUpdateNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServiceUpdateNotFoundFault" ->
          `ServiceUpdateNotFoundFault
            (Json_deserializers.service_update_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_update_cluster_request) =
    let input = Json_serializers.batch_update_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.BatchUpdateCluster" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_update_cluster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_update_cluster_request) =
    let input = Json_serializers.batch_update_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.BatchUpdateCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_update_cluster_response_of_yojson
      ~error_deserializer
end

module CopySnapshot = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `InvalidSnapshotStateFault _ -> "com.amazonaws.memorydb#InvalidSnapshotStateFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | `SnapshotAlreadyExistsFault _ -> "com.amazonaws.memorydb#SnapshotAlreadyExistsFault"
    | `SnapshotNotFoundFault _ -> "com.amazonaws.memorydb#SnapshotNotFoundFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.memorydb#SnapshotQuotaExceededFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.memorydb#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "InvalidSnapshotStateFault" ->
          `InvalidSnapshotStateFault
            (Json_deserializers.invalid_snapshot_state_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "SnapshotAlreadyExistsFault" ->
          `SnapshotAlreadyExistsFault
            (Json_deserializers.snapshot_already_exists_fault_of_yojson tree path)
      | _, "SnapshotNotFoundFault" ->
          `SnapshotNotFoundFault (Json_deserializers.snapshot_not_found_fault_of_yojson tree path)
      | _, "SnapshotQuotaExceededFault" ->
          `SnapshotQuotaExceededFault
            (Json_deserializers.snapshot_quota_exceeded_fault_of_yojson tree path)
      | _, "TagQuotaPerResourceExceeded" ->
          `TagQuotaPerResourceExceeded
            (Json_deserializers.tag_quota_per_resource_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : copy_snapshot_request) =
    let input = Json_serializers.copy_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.CopySnapshot" ~service ~context
      ~input ~output_deserializer:Json_deserializers.copy_snapshot_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : copy_snapshot_request) =
    let input = Json_serializers.copy_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.CopySnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.copy_snapshot_response_of_yojson ~error_deserializer
end

module CreateACL = struct
  let error_to_string = function
    | `ACLAlreadyExistsFault _ -> "com.amazonaws.memorydb#ACLAlreadyExistsFault"
    | `ACLQuotaExceededFault _ -> "com.amazonaws.memorydb#ACLQuotaExceededFault"
    | `DefaultUserRequired _ -> "com.amazonaws.memorydb#DefaultUserRequired"
    | `DuplicateUserNameFault _ -> "com.amazonaws.memorydb#DuplicateUserNameFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.memorydb#TagQuotaPerResourceExceeded"
    | `UserNotFoundFault _ -> "com.amazonaws.memorydb#UserNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ACLAlreadyExistsFault" ->
          `ACLAlreadyExistsFault (Json_deserializers.acl_already_exists_fault_of_yojson tree path)
      | _, "ACLQuotaExceededFault" ->
          `ACLQuotaExceededFault (Json_deserializers.acl_quota_exceeded_fault_of_yojson tree path)
      | _, "DefaultUserRequired" ->
          `DefaultUserRequired (Json_deserializers.default_user_required_of_yojson tree path)
      | _, "DuplicateUserNameFault" ->
          `DuplicateUserNameFault (Json_deserializers.duplicate_user_name_fault_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "TagQuotaPerResourceExceeded" ->
          `TagQuotaPerResourceExceeded
            (Json_deserializers.tag_quota_per_resource_exceeded_of_yojson tree path)
      | _, "UserNotFoundFault" ->
          `UserNotFoundFault (Json_deserializers.user_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_acl_request) =
    let input = Json_serializers.create_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.CreateACL" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_acl_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_acl_request) =
    let input = Json_serializers.create_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.CreateACL"
      ~service ~context ~input ~output_deserializer:Json_deserializers.create_acl_response_of_yojson
      ~error_deserializer
end

module CreateCluster = struct
  let error_to_string = function
    | `ACLNotFoundFault _ -> "com.amazonaws.memorydb#ACLNotFoundFault"
    | `ClusterAlreadyExistsFault _ -> "com.amazonaws.memorydb#ClusterAlreadyExistsFault"
    | `ClusterQuotaForCustomerExceededFault _ ->
        "com.amazonaws.memorydb#ClusterQuotaForCustomerExceededFault"
    | `InsufficientClusterCapacityFault _ ->
        "com.amazonaws.memorydb#InsufficientClusterCapacityFault"
    | `InvalidACLStateFault _ -> "com.amazonaws.memorydb#InvalidACLStateFault"
    | `InvalidCredentialsException _ -> "com.amazonaws.memorydb#InvalidCredentialsException"
    | `InvalidMultiRegionClusterStateFault _ ->
        "com.amazonaws.memorydb#InvalidMultiRegionClusterStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.memorydb#InvalidVPCNetworkStateFault"
    | `MultiRegionClusterNotFoundFault _ -> "com.amazonaws.memorydb#MultiRegionClusterNotFoundFault"
    | `NodeQuotaForClusterExceededFault _ ->
        "com.amazonaws.memorydb#NodeQuotaForClusterExceededFault"
    | `NodeQuotaForCustomerExceededFault _ ->
        "com.amazonaws.memorydb#NodeQuotaForCustomerExceededFault"
    | `ParameterGroupNotFoundFault _ -> "com.amazonaws.memorydb#ParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | `ShardsPerClusterQuotaExceededFault _ ->
        "com.amazonaws.memorydb#ShardsPerClusterQuotaExceededFault"
    | `SubnetGroupNotFoundFault _ -> "com.amazonaws.memorydb#SubnetGroupNotFoundFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.memorydb#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ACLNotFoundFault" ->
          `ACLNotFoundFault (Json_deserializers.acl_not_found_fault_of_yojson tree path)
      | _, "ClusterAlreadyExistsFault" ->
          `ClusterAlreadyExistsFault
            (Json_deserializers.cluster_already_exists_fault_of_yojson tree path)
      | _, "ClusterQuotaForCustomerExceededFault" ->
          `ClusterQuotaForCustomerExceededFault
            (Json_deserializers.cluster_quota_for_customer_exceeded_fault_of_yojson tree path)
      | _, "InsufficientClusterCapacityFault" ->
          `InsufficientClusterCapacityFault
            (Json_deserializers.insufficient_cluster_capacity_fault_of_yojson tree path)
      | _, "InvalidACLStateFault" ->
          `InvalidACLStateFault (Json_deserializers.invalid_acl_state_fault_of_yojson tree path)
      | _, "InvalidCredentialsException" ->
          `InvalidCredentialsException
            (Json_deserializers.invalid_credentials_exception_of_yojson tree path)
      | _, "InvalidMultiRegionClusterStateFault" ->
          `InvalidMultiRegionClusterStateFault
            (Json_deserializers.invalid_multi_region_cluster_state_fault_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "InvalidVPCNetworkStateFault" ->
          `InvalidVPCNetworkStateFault
            (Json_deserializers.invalid_vpc_network_state_fault_of_yojson tree path)
      | _, "MultiRegionClusterNotFoundFault" ->
          `MultiRegionClusterNotFoundFault
            (Json_deserializers.multi_region_cluster_not_found_fault_of_yojson tree path)
      | _, "NodeQuotaForClusterExceededFault" ->
          `NodeQuotaForClusterExceededFault
            (Json_deserializers.node_quota_for_cluster_exceeded_fault_of_yojson tree path)
      | _, "NodeQuotaForCustomerExceededFault" ->
          `NodeQuotaForCustomerExceededFault
            (Json_deserializers.node_quota_for_customer_exceeded_fault_of_yojson tree path)
      | _, "ParameterGroupNotFoundFault" ->
          `ParameterGroupNotFoundFault
            (Json_deserializers.parameter_group_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "ShardsPerClusterQuotaExceededFault" ->
          `ShardsPerClusterQuotaExceededFault
            (Json_deserializers.shards_per_cluster_quota_exceeded_fault_of_yojson tree path)
      | _, "SubnetGroupNotFoundFault" ->
          `SubnetGroupNotFoundFault
            (Json_deserializers.subnet_group_not_found_fault_of_yojson tree path)
      | _, "TagQuotaPerResourceExceeded" ->
          `TagQuotaPerResourceExceeded
            (Json_deserializers.tag_quota_per_resource_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_cluster_request) =
    let input = Json_serializers.create_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.CreateCluster" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_cluster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_cluster_request) =
    let input = Json_serializers.create_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.CreateCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_cluster_response_of_yojson ~error_deserializer
end

module CreateMultiRegionCluster = struct
  let error_to_string = function
    | `ClusterQuotaForCustomerExceededFault _ ->
        "com.amazonaws.memorydb#ClusterQuotaForCustomerExceededFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `MultiRegionClusterAlreadyExistsFault _ ->
        "com.amazonaws.memorydb#MultiRegionClusterAlreadyExistsFault"
    | `MultiRegionParameterGroupNotFoundFault _ ->
        "com.amazonaws.memorydb#MultiRegionParameterGroupNotFoundFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.memorydb#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClusterQuotaForCustomerExceededFault" ->
          `ClusterQuotaForCustomerExceededFault
            (Json_deserializers.cluster_quota_for_customer_exceeded_fault_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MultiRegionClusterAlreadyExistsFault" ->
          `MultiRegionClusterAlreadyExistsFault
            (Json_deserializers.multi_region_cluster_already_exists_fault_of_yojson tree path)
      | _, "MultiRegionParameterGroupNotFoundFault" ->
          `MultiRegionParameterGroupNotFoundFault
            (Json_deserializers.multi_region_parameter_group_not_found_fault_of_yojson tree path)
      | _, "TagQuotaPerResourceExceeded" ->
          `TagQuotaPerResourceExceeded
            (Json_deserializers.tag_quota_per_resource_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_multi_region_cluster_request) =
    let input = Json_serializers.create_multi_region_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.CreateMultiRegionCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_multi_region_cluster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_multi_region_cluster_request) =
    let input = Json_serializers.create_multi_region_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.CreateMultiRegionCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_multi_region_cluster_response_of_yojson
      ~error_deserializer
end

module CreateParameterGroup = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterGroupStateFault _ -> "com.amazonaws.memorydb#InvalidParameterGroupStateFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ParameterGroupAlreadyExistsFault _ ->
        "com.amazonaws.memorydb#ParameterGroupAlreadyExistsFault"
    | `ParameterGroupQuotaExceededFault _ ->
        "com.amazonaws.memorydb#ParameterGroupQuotaExceededFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.memorydb#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterGroupStateFault" ->
          `InvalidParameterGroupStateFault
            (Json_deserializers.invalid_parameter_group_state_fault_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ParameterGroupAlreadyExistsFault" ->
          `ParameterGroupAlreadyExistsFault
            (Json_deserializers.parameter_group_already_exists_fault_of_yojson tree path)
      | _, "ParameterGroupQuotaExceededFault" ->
          `ParameterGroupQuotaExceededFault
            (Json_deserializers.parameter_group_quota_exceeded_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "TagQuotaPerResourceExceeded" ->
          `TagQuotaPerResourceExceeded
            (Json_deserializers.tag_quota_per_resource_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_parameter_group_request) =
    let input = Json_serializers.create_parameter_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.CreateParameterGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_parameter_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_parameter_group_request) =
    let input = Json_serializers.create_parameter_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.CreateParameterGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_parameter_group_response_of_yojson
      ~error_deserializer
end

module CreateSnapshot = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.memorydb#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.memorydb#InvalidClusterStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | `SnapshotAlreadyExistsFault _ -> "com.amazonaws.memorydb#SnapshotAlreadyExistsFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.memorydb#SnapshotQuotaExceededFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.memorydb#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClusterNotFoundFault" ->
          `ClusterNotFoundFault (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
      | _, "InvalidClusterStateFault" ->
          `InvalidClusterStateFault
            (Json_deserializers.invalid_cluster_state_fault_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "SnapshotAlreadyExistsFault" ->
          `SnapshotAlreadyExistsFault
            (Json_deserializers.snapshot_already_exists_fault_of_yojson tree path)
      | _, "SnapshotQuotaExceededFault" ->
          `SnapshotQuotaExceededFault
            (Json_deserializers.snapshot_quota_exceeded_fault_of_yojson tree path)
      | _, "TagQuotaPerResourceExceeded" ->
          `TagQuotaPerResourceExceeded
            (Json_deserializers.tag_quota_per_resource_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_snapshot_request) =
    let input = Json_serializers.create_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.CreateSnapshot" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_snapshot_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_snapshot_request) =
    let input = Json_serializers.create_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.CreateSnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_snapshot_response_of_yojson ~error_deserializer
end

module CreateSubnetGroup = struct
  let error_to_string = function
    | `InvalidSubnet _ -> "com.amazonaws.memorydb#InvalidSubnet"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | `SubnetGroupAlreadyExistsFault _ -> "com.amazonaws.memorydb#SubnetGroupAlreadyExistsFault"
    | `SubnetGroupQuotaExceededFault _ -> "com.amazonaws.memorydb#SubnetGroupQuotaExceededFault"
    | `SubnetNotAllowedFault _ -> "com.amazonaws.memorydb#SubnetNotAllowedFault"
    | `SubnetQuotaExceededFault _ -> "com.amazonaws.memorydb#SubnetQuotaExceededFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.memorydb#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidSubnet" -> `InvalidSubnet (Json_deserializers.invalid_subnet_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "SubnetGroupAlreadyExistsFault" ->
          `SubnetGroupAlreadyExistsFault
            (Json_deserializers.subnet_group_already_exists_fault_of_yojson tree path)
      | _, "SubnetGroupQuotaExceededFault" ->
          `SubnetGroupQuotaExceededFault
            (Json_deserializers.subnet_group_quota_exceeded_fault_of_yojson tree path)
      | _, "SubnetNotAllowedFault" ->
          `SubnetNotAllowedFault (Json_deserializers.subnet_not_allowed_fault_of_yojson tree path)
      | _, "SubnetQuotaExceededFault" ->
          `SubnetQuotaExceededFault
            (Json_deserializers.subnet_quota_exceeded_fault_of_yojson tree path)
      | _, "TagQuotaPerResourceExceeded" ->
          `TagQuotaPerResourceExceeded
            (Json_deserializers.tag_quota_per_resource_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_subnet_group_request) =
    let input = Json_serializers.create_subnet_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.CreateSubnetGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_subnet_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_subnet_group_request) =
    let input = Json_serializers.create_subnet_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.CreateSubnetGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_subnet_group_response_of_yojson
      ~error_deserializer
end

module CreateUser = struct
  let error_to_string = function
    | `DuplicateUserNameFault _ -> "com.amazonaws.memorydb#DuplicateUserNameFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.memorydb#TagQuotaPerResourceExceeded"
    | `UserAlreadyExistsFault _ -> "com.amazonaws.memorydb#UserAlreadyExistsFault"
    | `UserQuotaExceededFault _ -> "com.amazonaws.memorydb#UserQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateUserNameFault" ->
          `DuplicateUserNameFault (Json_deserializers.duplicate_user_name_fault_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "TagQuotaPerResourceExceeded" ->
          `TagQuotaPerResourceExceeded
            (Json_deserializers.tag_quota_per_resource_exceeded_of_yojson tree path)
      | _, "UserAlreadyExistsFault" ->
          `UserAlreadyExistsFault (Json_deserializers.user_already_exists_fault_of_yojson tree path)
      | _, "UserQuotaExceededFault" ->
          `UserQuotaExceededFault (Json_deserializers.user_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_user_request) =
    let input = Json_serializers.create_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.CreateUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_user_request) =
    let input = Json_serializers.create_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.CreateUser"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_response_of_yojson ~error_deserializer
end

module DeleteACL = struct
  let error_to_string = function
    | `ACLNotFoundFault _ -> "com.amazonaws.memorydb#ACLNotFoundFault"
    | `InvalidACLStateFault _ -> "com.amazonaws.memorydb#InvalidACLStateFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ACLNotFoundFault" ->
          `ACLNotFoundFault (Json_deserializers.acl_not_found_fault_of_yojson tree path)
      | _, "InvalidACLStateFault" ->
          `InvalidACLStateFault (Json_deserializers.invalid_acl_state_fault_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_acl_request) =
    let input = Json_serializers.delete_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DeleteACL" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_acl_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_acl_request) =
    let input = Json_serializers.delete_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.DeleteACL"
      ~service ~context ~input ~output_deserializer:Json_deserializers.delete_acl_response_of_yojson
      ~error_deserializer
end

module DeleteCluster = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.memorydb#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.memorydb#InvalidClusterStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | `SnapshotAlreadyExistsFault _ -> "com.amazonaws.memorydb#SnapshotAlreadyExistsFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClusterNotFoundFault" ->
          `ClusterNotFoundFault (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
      | _, "InvalidClusterStateFault" ->
          `InvalidClusterStateFault
            (Json_deserializers.invalid_cluster_state_fault_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "SnapshotAlreadyExistsFault" ->
          `SnapshotAlreadyExistsFault
            (Json_deserializers.snapshot_already_exists_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_cluster_request) =
    let input = Json_serializers.delete_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DeleteCluster" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_cluster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_cluster_request) =
    let input = Json_serializers.delete_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.DeleteCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_cluster_response_of_yojson ~error_deserializer
end

module DeleteMultiRegionCluster = struct
  let error_to_string = function
    | `InvalidMultiRegionClusterStateFault _ ->
        "com.amazonaws.memorydb#InvalidMultiRegionClusterStateFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `MultiRegionClusterNotFoundFault _ -> "com.amazonaws.memorydb#MultiRegionClusterNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidMultiRegionClusterStateFault" ->
          `InvalidMultiRegionClusterStateFault
            (Json_deserializers.invalid_multi_region_cluster_state_fault_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MultiRegionClusterNotFoundFault" ->
          `MultiRegionClusterNotFoundFault
            (Json_deserializers.multi_region_cluster_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_multi_region_cluster_request) =
    let input = Json_serializers.delete_multi_region_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DeleteMultiRegionCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_multi_region_cluster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_multi_region_cluster_request) =
    let input = Json_serializers.delete_multi_region_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.DeleteMultiRegionCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_multi_region_cluster_response_of_yojson
      ~error_deserializer
end

module DeleteParameterGroup = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterGroupStateFault _ -> "com.amazonaws.memorydb#InvalidParameterGroupStateFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ParameterGroupNotFoundFault _ -> "com.amazonaws.memorydb#ParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterGroupStateFault" ->
          `InvalidParameterGroupStateFault
            (Json_deserializers.invalid_parameter_group_state_fault_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ParameterGroupNotFoundFault" ->
          `ParameterGroupNotFoundFault
            (Json_deserializers.parameter_group_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_parameter_group_request) =
    let input = Json_serializers.delete_parameter_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DeleteParameterGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_parameter_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_parameter_group_request) =
    let input = Json_serializers.delete_parameter_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.DeleteParameterGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_parameter_group_response_of_yojson
      ~error_deserializer
end

module DeleteSnapshot = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `InvalidSnapshotStateFault _ -> "com.amazonaws.memorydb#InvalidSnapshotStateFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | `SnapshotNotFoundFault _ -> "com.amazonaws.memorydb#SnapshotNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "InvalidSnapshotStateFault" ->
          `InvalidSnapshotStateFault
            (Json_deserializers.invalid_snapshot_state_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "SnapshotNotFoundFault" ->
          `SnapshotNotFoundFault (Json_deserializers.snapshot_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_snapshot_request) =
    let input = Json_serializers.delete_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DeleteSnapshot" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_snapshot_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_snapshot_request) =
    let input = Json_serializers.delete_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.DeleteSnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_snapshot_response_of_yojson ~error_deserializer
end

module DeleteSubnetGroup = struct
  let error_to_string = function
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | `SubnetGroupInUseFault _ -> "com.amazonaws.memorydb#SubnetGroupInUseFault"
    | `SubnetGroupNotFoundFault _ -> "com.amazonaws.memorydb#SubnetGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "SubnetGroupInUseFault" ->
          `SubnetGroupInUseFault (Json_deserializers.subnet_group_in_use_fault_of_yojson tree path)
      | _, "SubnetGroupNotFoundFault" ->
          `SubnetGroupNotFoundFault
            (Json_deserializers.subnet_group_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_subnet_group_request) =
    let input = Json_serializers.delete_subnet_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DeleteSubnetGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_subnet_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_subnet_group_request) =
    let input = Json_serializers.delete_subnet_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.DeleteSubnetGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_subnet_group_response_of_yojson
      ~error_deserializer
end

module DeleteUser = struct
  let error_to_string = function
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `InvalidUserStateFault _ -> "com.amazonaws.memorydb#InvalidUserStateFault"
    | `UserNotFoundFault _ -> "com.amazonaws.memorydb#UserNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "InvalidUserStateFault" ->
          `InvalidUserStateFault (Json_deserializers.invalid_user_state_fault_of_yojson tree path)
      | _, "UserNotFoundFault" ->
          `UserNotFoundFault (Json_deserializers.user_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_user_request) =
    let input = Json_serializers.delete_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DeleteUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_user_request) =
    let input = Json_serializers.delete_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.DeleteUser"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_user_response_of_yojson ~error_deserializer
end

module DescribeACLs = struct
  let error_to_string = function
    | `ACLNotFoundFault _ -> "com.amazonaws.memorydb#ACLNotFoundFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ACLNotFoundFault" ->
          `ACLNotFoundFault (Json_deserializers.acl_not_found_fault_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_ac_ls_request) =
    let input = Json_serializers.describe_ac_ls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DescribeACLs" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_ac_ls_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_ac_ls_request) =
    let input = Json_serializers.describe_ac_ls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.DescribeACLs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_ac_ls_response_of_yojson ~error_deserializer
end

module DescribeClusters = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.memorydb#ClusterNotFoundFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClusterNotFoundFault" ->
          `ClusterNotFoundFault (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_clusters_request) =
    let input = Json_serializers.describe_clusters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DescribeClusters" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_clusters_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_clusters_request) =
    let input = Json_serializers.describe_clusters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.DescribeClusters"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_clusters_response_of_yojson
      ~error_deserializer
end

module DescribeEngineVersions = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_engine_versions_request) =
    let input = Json_serializers.describe_engine_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DescribeEngineVersions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_engine_versions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_engine_versions_request) =
    let input = Json_serializers.describe_engine_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.DescribeEngineVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_engine_versions_response_of_yojson
      ~error_deserializer
end

module DescribeEvents = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_events_request) =
    let input = Json_serializers.describe_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DescribeEvents" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_events_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_events_request) =
    let input = Json_serializers.describe_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.DescribeEvents"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_events_response_of_yojson ~error_deserializer
end

module DescribeMultiRegionClusters = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.memorydb#ClusterNotFoundFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `MultiRegionClusterNotFoundFault _ -> "com.amazonaws.memorydb#MultiRegionClusterNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClusterNotFoundFault" ->
          `ClusterNotFoundFault (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MultiRegionClusterNotFoundFault" ->
          `MultiRegionClusterNotFoundFault
            (Json_deserializers.multi_region_cluster_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_multi_region_clusters_request) =
    let input = Json_serializers.describe_multi_region_clusters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DescribeMultiRegionClusters"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_multi_region_clusters_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_multi_region_clusters_request) =
    let input = Json_serializers.describe_multi_region_clusters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.DescribeMultiRegionClusters" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_multi_region_clusters_response_of_yojson
      ~error_deserializer
end

module DescribeMultiRegionParameterGroups = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `MultiRegionParameterGroupNotFoundFault _ ->
        "com.amazonaws.memorydb#MultiRegionParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MultiRegionParameterGroupNotFoundFault" ->
          `MultiRegionParameterGroupNotFoundFault
            (Json_deserializers.multi_region_parameter_group_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_multi_region_parameter_groups_request) =
    let input = Json_serializers.describe_multi_region_parameter_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonMemoryDB.DescribeMultiRegionParameterGroups" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_multi_region_parameter_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_multi_region_parameter_groups_request) =
    let input = Json_serializers.describe_multi_region_parameter_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.DescribeMultiRegionParameterGroups" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_multi_region_parameter_groups_response_of_yojson
      ~error_deserializer
end

module DescribeMultiRegionParameters = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `MultiRegionParameterGroupNotFoundFault _ ->
        "com.amazonaws.memorydb#MultiRegionParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MultiRegionParameterGroupNotFoundFault" ->
          `MultiRegionParameterGroupNotFoundFault
            (Json_deserializers.multi_region_parameter_group_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_multi_region_parameters_request) =
    let input = Json_serializers.describe_multi_region_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DescribeMultiRegionParameters"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_multi_region_parameters_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_multi_region_parameters_request) =
    let input = Json_serializers.describe_multi_region_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.DescribeMultiRegionParameters" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_multi_region_parameters_response_of_yojson
      ~error_deserializer
end

module DescribeParameterGroups = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ParameterGroupNotFoundFault _ -> "com.amazonaws.memorydb#ParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ParameterGroupNotFoundFault" ->
          `ParameterGroupNotFoundFault
            (Json_deserializers.parameter_group_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_parameter_groups_request) =
    let input = Json_serializers.describe_parameter_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DescribeParameterGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_parameter_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_parameter_groups_request) =
    let input = Json_serializers.describe_parameter_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.DescribeParameterGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_parameter_groups_response_of_yojson
      ~error_deserializer
end

module DescribeParameters = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ParameterGroupNotFoundFault _ -> "com.amazonaws.memorydb#ParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ParameterGroupNotFoundFault" ->
          `ParameterGroupNotFoundFault
            (Json_deserializers.parameter_group_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_parameters_request) =
    let input = Json_serializers.describe_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DescribeParameters" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_parameters_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_parameters_request) =
    let input = Json_serializers.describe_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.DescribeParameters" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_parameters_response_of_yojson
      ~error_deserializer
end

module DescribeReservedNodes = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ReservedNodeNotFoundFault _ -> "com.amazonaws.memorydb#ReservedNodeNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ReservedNodeNotFoundFault" ->
          `ReservedNodeNotFoundFault
            (Json_deserializers.reserved_node_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_reserved_nodes_request) =
    let input = Json_serializers.describe_reserved_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DescribeReservedNodes" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_reserved_nodes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_reserved_nodes_request) =
    let input = Json_serializers.describe_reserved_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.DescribeReservedNodes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_reserved_nodes_response_of_yojson
      ~error_deserializer
end

module DescribeReservedNodesOfferings = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ReservedNodesOfferingNotFoundFault _ ->
        "com.amazonaws.memorydb#ReservedNodesOfferingNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ReservedNodesOfferingNotFoundFault" ->
          `ReservedNodesOfferingNotFoundFault
            (Json_deserializers.reserved_nodes_offering_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_reserved_nodes_offerings_request) =
    let input = Json_serializers.describe_reserved_nodes_offerings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DescribeReservedNodesOfferings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_reserved_nodes_offerings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_reserved_nodes_offerings_request) =
    let input = Json_serializers.describe_reserved_nodes_offerings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.DescribeReservedNodesOfferings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_reserved_nodes_offerings_response_of_yojson
      ~error_deserializer
end

module DescribeServiceUpdates = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_service_updates_request) =
    let input = Json_serializers.describe_service_updates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DescribeServiceUpdates" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_service_updates_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_service_updates_request) =
    let input = Json_serializers.describe_service_updates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.DescribeServiceUpdates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_service_updates_response_of_yojson
      ~error_deserializer
end

module DescribeSnapshots = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | `SnapshotNotFoundFault _ -> "com.amazonaws.memorydb#SnapshotNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "SnapshotNotFoundFault" ->
          `SnapshotNotFoundFault (Json_deserializers.snapshot_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_snapshots_request) =
    let input = Json_serializers.describe_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DescribeSnapshots" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_snapshots_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_snapshots_request) =
    let input = Json_serializers.describe_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.DescribeSnapshots"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_snapshots_response_of_yojson
      ~error_deserializer
end

module DescribeSubnetGroups = struct
  let error_to_string = function
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | `SubnetGroupNotFoundFault _ -> "com.amazonaws.memorydb#SubnetGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "SubnetGroupNotFoundFault" ->
          `SubnetGroupNotFoundFault
            (Json_deserializers.subnet_group_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_subnet_groups_request) =
    let input = Json_serializers.describe_subnet_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DescribeSubnetGroups" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_subnet_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_subnet_groups_request) =
    let input = Json_serializers.describe_subnet_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.DescribeSubnetGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_subnet_groups_response_of_yojson
      ~error_deserializer
end

module DescribeUsers = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `UserNotFoundFault _ -> "com.amazonaws.memorydb#UserNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "UserNotFoundFault" ->
          `UserNotFoundFault (Json_deserializers.user_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_users_request) =
    let input = Json_serializers.describe_users_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.DescribeUsers" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_users_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_users_request) =
    let input = Json_serializers.describe_users_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.DescribeUsers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_users_response_of_yojson ~error_deserializer
end

module FailoverShard = struct
  let error_to_string = function
    | `APICallRateForCustomerExceededFault _ ->
        "com.amazonaws.memorydb#APICallRateForCustomerExceededFault"
    | `ClusterNotFoundFault _ -> "com.amazonaws.memorydb#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.memorydb#InvalidClusterStateFault"
    | `InvalidKMSKeyFault _ -> "com.amazonaws.memorydb#InvalidKMSKeyFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ShardNotFoundFault _ -> "com.amazonaws.memorydb#ShardNotFoundFault"
    | `TestFailoverNotAvailableFault _ -> "com.amazonaws.memorydb#TestFailoverNotAvailableFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "APICallRateForCustomerExceededFault" ->
          `APICallRateForCustomerExceededFault
            (Json_deserializers.api_call_rate_for_customer_exceeded_fault_of_yojson tree path)
      | _, "ClusterNotFoundFault" ->
          `ClusterNotFoundFault (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
      | _, "InvalidClusterStateFault" ->
          `InvalidClusterStateFault
            (Json_deserializers.invalid_cluster_state_fault_of_yojson tree path)
      | _, "InvalidKMSKeyFault" ->
          `InvalidKMSKeyFault (Json_deserializers.invalid_kms_key_fault_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ShardNotFoundFault" ->
          `ShardNotFoundFault (Json_deserializers.shard_not_found_fault_of_yojson tree path)
      | _, "TestFailoverNotAvailableFault" ->
          `TestFailoverNotAvailableFault
            (Json_deserializers.test_failover_not_available_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : failover_shard_request) =
    let input = Json_serializers.failover_shard_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.FailoverShard" ~service ~context
      ~input ~output_deserializer:Json_deserializers.failover_shard_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : failover_shard_request) =
    let input = Json_serializers.failover_shard_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.FailoverShard"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.failover_shard_response_of_yojson ~error_deserializer
end

module ListAllowedMultiRegionClusterUpdates = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `MultiRegionClusterNotFoundFault _ -> "com.amazonaws.memorydb#MultiRegionClusterNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MultiRegionClusterNotFoundFault" ->
          `MultiRegionClusterNotFoundFault
            (Json_deserializers.multi_region_cluster_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_allowed_multi_region_cluster_updates_request) =
    let input =
      Json_serializers.list_allowed_multi_region_cluster_updates_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonMemoryDB.ListAllowedMultiRegionClusterUpdates" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_allowed_multi_region_cluster_updates_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_allowed_multi_region_cluster_updates_request) =
    let input =
      Json_serializers.list_allowed_multi_region_cluster_updates_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.ListAllowedMultiRegionClusterUpdates" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_allowed_multi_region_cluster_updates_response_of_yojson
      ~error_deserializer
end

module ListAllowedNodeTypeUpdates = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.memorydb#ClusterNotFoundFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClusterNotFoundFault" ->
          `ClusterNotFoundFault (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_allowed_node_type_updates_request) =
    let input = Json_serializers.list_allowed_node_type_updates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.ListAllowedNodeTypeUpdates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_allowed_node_type_updates_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_allowed_node_type_updates_request) =
    let input = Json_serializers.list_allowed_node_type_updates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.ListAllowedNodeTypeUpdates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_allowed_node_type_updates_response_of_yojson
      ~error_deserializer
end

module ListTags = struct
  let error_to_string = function
    | `ACLNotFoundFault _ -> "com.amazonaws.memorydb#ACLNotFoundFault"
    | `ClusterNotFoundFault _ -> "com.amazonaws.memorydb#ClusterNotFoundFault"
    | `InvalidARNFault _ -> "com.amazonaws.memorydb#InvalidARNFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.memorydb#InvalidClusterStateFault"
    | `MultiRegionClusterNotFoundFault _ -> "com.amazonaws.memorydb#MultiRegionClusterNotFoundFault"
    | `MultiRegionParameterGroupNotFoundFault _ ->
        "com.amazonaws.memorydb#MultiRegionParameterGroupNotFoundFault"
    | `ParameterGroupNotFoundFault _ -> "com.amazonaws.memorydb#ParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | `SnapshotNotFoundFault _ -> "com.amazonaws.memorydb#SnapshotNotFoundFault"
    | `SubnetGroupNotFoundFault _ -> "com.amazonaws.memorydb#SubnetGroupNotFoundFault"
    | `UserNotFoundFault _ -> "com.amazonaws.memorydb#UserNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ACLNotFoundFault" ->
          `ACLNotFoundFault (Json_deserializers.acl_not_found_fault_of_yojson tree path)
      | _, "ClusterNotFoundFault" ->
          `ClusterNotFoundFault (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
      | _, "InvalidARNFault" ->
          `InvalidARNFault (Json_deserializers.invalid_arn_fault_of_yojson tree path)
      | _, "InvalidClusterStateFault" ->
          `InvalidClusterStateFault
            (Json_deserializers.invalid_cluster_state_fault_of_yojson tree path)
      | _, "MultiRegionClusterNotFoundFault" ->
          `MultiRegionClusterNotFoundFault
            (Json_deserializers.multi_region_cluster_not_found_fault_of_yojson tree path)
      | _, "MultiRegionParameterGroupNotFoundFault" ->
          `MultiRegionParameterGroupNotFoundFault
            (Json_deserializers.multi_region_parameter_group_not_found_fault_of_yojson tree path)
      | _, "ParameterGroupNotFoundFault" ->
          `ParameterGroupNotFoundFault
            (Json_deserializers.parameter_group_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "SnapshotNotFoundFault" ->
          `SnapshotNotFoundFault (Json_deserializers.snapshot_not_found_fault_of_yojson tree path)
      | _, "SubnetGroupNotFoundFault" ->
          `SubnetGroupNotFoundFault
            (Json_deserializers.subnet_group_not_found_fault_of_yojson tree path)
      | _, "UserNotFoundFault" ->
          `UserNotFoundFault (Json_deserializers.user_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_request) =
    let input = Json_serializers.list_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.ListTags" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_tags_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_request) =
    let input = Json_serializers.list_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.ListTags" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_tags_response_of_yojson
      ~error_deserializer
end

module PurchaseReservedNodesOffering = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ReservedNodeAlreadyExistsFault _ -> "com.amazonaws.memorydb#ReservedNodeAlreadyExistsFault"
    | `ReservedNodeQuotaExceededFault _ -> "com.amazonaws.memorydb#ReservedNodeQuotaExceededFault"
    | `ReservedNodesOfferingNotFoundFault _ ->
        "com.amazonaws.memorydb#ReservedNodesOfferingNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.memorydb#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ReservedNodeAlreadyExistsFault" ->
          `ReservedNodeAlreadyExistsFault
            (Json_deserializers.reserved_node_already_exists_fault_of_yojson tree path)
      | _, "ReservedNodeQuotaExceededFault" ->
          `ReservedNodeQuotaExceededFault
            (Json_deserializers.reserved_node_quota_exceeded_fault_of_yojson tree path)
      | _, "ReservedNodesOfferingNotFoundFault" ->
          `ReservedNodesOfferingNotFoundFault
            (Json_deserializers.reserved_nodes_offering_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "TagQuotaPerResourceExceeded" ->
          `TagQuotaPerResourceExceeded
            (Json_deserializers.tag_quota_per_resource_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : purchase_reserved_nodes_offering_request) =
    let input = Json_serializers.purchase_reserved_nodes_offering_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.PurchaseReservedNodesOffering"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.purchase_reserved_nodes_offering_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : purchase_reserved_nodes_offering_request) =
    let input = Json_serializers.purchase_reserved_nodes_offering_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.PurchaseReservedNodesOffering" ~service ~context ~input
      ~output_deserializer:Json_deserializers.purchase_reserved_nodes_offering_response_of_yojson
      ~error_deserializer
end

module ResetParameterGroup = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterGroupStateFault _ -> "com.amazonaws.memorydb#InvalidParameterGroupStateFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ParameterGroupNotFoundFault _ -> "com.amazonaws.memorydb#ParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterGroupStateFault" ->
          `InvalidParameterGroupStateFault
            (Json_deserializers.invalid_parameter_group_state_fault_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ParameterGroupNotFoundFault" ->
          `ParameterGroupNotFoundFault
            (Json_deserializers.parameter_group_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reset_parameter_group_request) =
    let input = Json_serializers.reset_parameter_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.ResetParameterGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.reset_parameter_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reset_parameter_group_request) =
    let input = Json_serializers.reset_parameter_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.ResetParameterGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reset_parameter_group_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ACLNotFoundFault _ -> "com.amazonaws.memorydb#ACLNotFoundFault"
    | `ClusterNotFoundFault _ -> "com.amazonaws.memorydb#ClusterNotFoundFault"
    | `InvalidARNFault _ -> "com.amazonaws.memorydb#InvalidARNFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.memorydb#InvalidClusterStateFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `MultiRegionClusterNotFoundFault _ -> "com.amazonaws.memorydb#MultiRegionClusterNotFoundFault"
    | `MultiRegionParameterGroupNotFoundFault _ ->
        "com.amazonaws.memorydb#MultiRegionParameterGroupNotFoundFault"
    | `ParameterGroupNotFoundFault _ -> "com.amazonaws.memorydb#ParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | `SnapshotNotFoundFault _ -> "com.amazonaws.memorydb#SnapshotNotFoundFault"
    | `SubnetGroupNotFoundFault _ -> "com.amazonaws.memorydb#SubnetGroupNotFoundFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.memorydb#TagQuotaPerResourceExceeded"
    | `UserNotFoundFault _ -> "com.amazonaws.memorydb#UserNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ACLNotFoundFault" ->
          `ACLNotFoundFault (Json_deserializers.acl_not_found_fault_of_yojson tree path)
      | _, "ClusterNotFoundFault" ->
          `ClusterNotFoundFault (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
      | _, "InvalidARNFault" ->
          `InvalidARNFault (Json_deserializers.invalid_arn_fault_of_yojson tree path)
      | _, "InvalidClusterStateFault" ->
          `InvalidClusterStateFault
            (Json_deserializers.invalid_cluster_state_fault_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MultiRegionClusterNotFoundFault" ->
          `MultiRegionClusterNotFoundFault
            (Json_deserializers.multi_region_cluster_not_found_fault_of_yojson tree path)
      | _, "MultiRegionParameterGroupNotFoundFault" ->
          `MultiRegionParameterGroupNotFoundFault
            (Json_deserializers.multi_region_parameter_group_not_found_fault_of_yojson tree path)
      | _, "ParameterGroupNotFoundFault" ->
          `ParameterGroupNotFoundFault
            (Json_deserializers.parameter_group_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "SnapshotNotFoundFault" ->
          `SnapshotNotFoundFault (Json_deserializers.snapshot_not_found_fault_of_yojson tree path)
      | _, "SubnetGroupNotFoundFault" ->
          `SubnetGroupNotFoundFault
            (Json_deserializers.subnet_group_not_found_fault_of_yojson tree path)
      | _, "TagQuotaPerResourceExceeded" ->
          `TagQuotaPerResourceExceeded
            (Json_deserializers.tag_quota_per_resource_exceeded_of_yojson tree path)
      | _, "UserNotFoundFault" ->
          `UserNotFoundFault (Json_deserializers.user_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ACLNotFoundFault _ -> "com.amazonaws.memorydb#ACLNotFoundFault"
    | `ClusterNotFoundFault _ -> "com.amazonaws.memorydb#ClusterNotFoundFault"
    | `InvalidARNFault _ -> "com.amazonaws.memorydb#InvalidARNFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.memorydb#InvalidClusterStateFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `MultiRegionClusterNotFoundFault _ -> "com.amazonaws.memorydb#MultiRegionClusterNotFoundFault"
    | `MultiRegionParameterGroupNotFoundFault _ ->
        "com.amazonaws.memorydb#MultiRegionParameterGroupNotFoundFault"
    | `ParameterGroupNotFoundFault _ -> "com.amazonaws.memorydb#ParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | `SnapshotNotFoundFault _ -> "com.amazonaws.memorydb#SnapshotNotFoundFault"
    | `SubnetGroupNotFoundFault _ -> "com.amazonaws.memorydb#SubnetGroupNotFoundFault"
    | `TagNotFoundFault _ -> "com.amazonaws.memorydb#TagNotFoundFault"
    | `UserNotFoundFault _ -> "com.amazonaws.memorydb#UserNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ACLNotFoundFault" ->
          `ACLNotFoundFault (Json_deserializers.acl_not_found_fault_of_yojson tree path)
      | _, "ClusterNotFoundFault" ->
          `ClusterNotFoundFault (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
      | _, "InvalidARNFault" ->
          `InvalidARNFault (Json_deserializers.invalid_arn_fault_of_yojson tree path)
      | _, "InvalidClusterStateFault" ->
          `InvalidClusterStateFault
            (Json_deserializers.invalid_cluster_state_fault_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MultiRegionClusterNotFoundFault" ->
          `MultiRegionClusterNotFoundFault
            (Json_deserializers.multi_region_cluster_not_found_fault_of_yojson tree path)
      | _, "MultiRegionParameterGroupNotFoundFault" ->
          `MultiRegionParameterGroupNotFoundFault
            (Json_deserializers.multi_region_parameter_group_not_found_fault_of_yojson tree path)
      | _, "ParameterGroupNotFoundFault" ->
          `ParameterGroupNotFoundFault
            (Json_deserializers.parameter_group_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "SnapshotNotFoundFault" ->
          `SnapshotNotFoundFault (Json_deserializers.snapshot_not_found_fault_of_yojson tree path)
      | _, "SubnetGroupNotFoundFault" ->
          `SubnetGroupNotFoundFault
            (Json_deserializers.subnet_group_not_found_fault_of_yojson tree path)
      | _, "TagNotFoundFault" ->
          `TagNotFoundFault (Json_deserializers.tag_not_found_fault_of_yojson tree path)
      | _, "UserNotFoundFault" ->
          `UserNotFoundFault (Json_deserializers.user_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.UntagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateACL = struct
  let error_to_string = function
    | `ACLNotFoundFault _ -> "com.amazonaws.memorydb#ACLNotFoundFault"
    | `DefaultUserRequired _ -> "com.amazonaws.memorydb#DefaultUserRequired"
    | `DuplicateUserNameFault _ -> "com.amazonaws.memorydb#DuplicateUserNameFault"
    | `InvalidACLStateFault _ -> "com.amazonaws.memorydb#InvalidACLStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `UserNotFoundFault _ -> "com.amazonaws.memorydb#UserNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ACLNotFoundFault" ->
          `ACLNotFoundFault (Json_deserializers.acl_not_found_fault_of_yojson tree path)
      | _, "DefaultUserRequired" ->
          `DefaultUserRequired (Json_deserializers.default_user_required_of_yojson tree path)
      | _, "DuplicateUserNameFault" ->
          `DuplicateUserNameFault (Json_deserializers.duplicate_user_name_fault_of_yojson tree path)
      | _, "InvalidACLStateFault" ->
          `InvalidACLStateFault (Json_deserializers.invalid_acl_state_fault_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "UserNotFoundFault" ->
          `UserNotFoundFault (Json_deserializers.user_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_acl_request) =
    let input = Json_serializers.update_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.UpdateACL" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_acl_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_acl_request) =
    let input = Json_serializers.update_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.UpdateACL"
      ~service ~context ~input ~output_deserializer:Json_deserializers.update_acl_response_of_yojson
      ~error_deserializer
end

module UpdateCluster = struct
  let error_to_string = function
    | `ACLNotFoundFault _ -> "com.amazonaws.memorydb#ACLNotFoundFault"
    | `ClusterNotFoundFault _ -> "com.amazonaws.memorydb#ClusterNotFoundFault"
    | `ClusterQuotaForCustomerExceededFault _ ->
        "com.amazonaws.memorydb#ClusterQuotaForCustomerExceededFault"
    | `InvalidACLStateFault _ -> "com.amazonaws.memorydb#InvalidACLStateFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.memorydb#InvalidClusterStateFault"
    | `InvalidKMSKeyFault _ -> "com.amazonaws.memorydb#InvalidKMSKeyFault"
    | `InvalidNodeStateFault _ -> "com.amazonaws.memorydb#InvalidNodeStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.memorydb#InvalidVPCNetworkStateFault"
    | `NodeQuotaForClusterExceededFault _ ->
        "com.amazonaws.memorydb#NodeQuotaForClusterExceededFault"
    | `NodeQuotaForCustomerExceededFault _ ->
        "com.amazonaws.memorydb#NodeQuotaForCustomerExceededFault"
    | `NoOperationFault _ -> "com.amazonaws.memorydb#NoOperationFault"
    | `ParameterGroupNotFoundFault _ -> "com.amazonaws.memorydb#ParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | `ShardsPerClusterQuotaExceededFault _ ->
        "com.amazonaws.memorydb#ShardsPerClusterQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ACLNotFoundFault" ->
          `ACLNotFoundFault (Json_deserializers.acl_not_found_fault_of_yojson tree path)
      | _, "ClusterNotFoundFault" ->
          `ClusterNotFoundFault (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
      | _, "ClusterQuotaForCustomerExceededFault" ->
          `ClusterQuotaForCustomerExceededFault
            (Json_deserializers.cluster_quota_for_customer_exceeded_fault_of_yojson tree path)
      | _, "InvalidACLStateFault" ->
          `InvalidACLStateFault (Json_deserializers.invalid_acl_state_fault_of_yojson tree path)
      | _, "InvalidClusterStateFault" ->
          `InvalidClusterStateFault
            (Json_deserializers.invalid_cluster_state_fault_of_yojson tree path)
      | _, "InvalidKMSKeyFault" ->
          `InvalidKMSKeyFault (Json_deserializers.invalid_kms_key_fault_of_yojson tree path)
      | _, "InvalidNodeStateFault" ->
          `InvalidNodeStateFault (Json_deserializers.invalid_node_state_fault_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "InvalidVPCNetworkStateFault" ->
          `InvalidVPCNetworkStateFault
            (Json_deserializers.invalid_vpc_network_state_fault_of_yojson tree path)
      | _, "NodeQuotaForClusterExceededFault" ->
          `NodeQuotaForClusterExceededFault
            (Json_deserializers.node_quota_for_cluster_exceeded_fault_of_yojson tree path)
      | _, "NodeQuotaForCustomerExceededFault" ->
          `NodeQuotaForCustomerExceededFault
            (Json_deserializers.node_quota_for_customer_exceeded_fault_of_yojson tree path)
      | _, "NoOperationFault" ->
          `NoOperationFault (Json_deserializers.no_operation_fault_of_yojson tree path)
      | _, "ParameterGroupNotFoundFault" ->
          `ParameterGroupNotFoundFault
            (Json_deserializers.parameter_group_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "ShardsPerClusterQuotaExceededFault" ->
          `ShardsPerClusterQuotaExceededFault
            (Json_deserializers.shards_per_cluster_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_cluster_request) =
    let input = Json_serializers.update_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.UpdateCluster" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_cluster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_cluster_request) =
    let input = Json_serializers.update_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.UpdateCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_cluster_response_of_yojson ~error_deserializer
end

module UpdateMultiRegionCluster = struct
  let error_to_string = function
    | `InvalidMultiRegionClusterStateFault _ ->
        "com.amazonaws.memorydb#InvalidMultiRegionClusterStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `MultiRegionClusterNotFoundFault _ -> "com.amazonaws.memorydb#MultiRegionClusterNotFoundFault"
    | `MultiRegionParameterGroupNotFoundFault _ ->
        "com.amazonaws.memorydb#MultiRegionParameterGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidMultiRegionClusterStateFault" ->
          `InvalidMultiRegionClusterStateFault
            (Json_deserializers.invalid_multi_region_cluster_state_fault_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MultiRegionClusterNotFoundFault" ->
          `MultiRegionClusterNotFoundFault
            (Json_deserializers.multi_region_cluster_not_found_fault_of_yojson tree path)
      | _, "MultiRegionParameterGroupNotFoundFault" ->
          `MultiRegionParameterGroupNotFoundFault
            (Json_deserializers.multi_region_parameter_group_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_multi_region_cluster_request) =
    let input = Json_serializers.update_multi_region_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.UpdateMultiRegionCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_multi_region_cluster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_multi_region_cluster_request) =
    let input = Json_serializers.update_multi_region_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.UpdateMultiRegionCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_multi_region_cluster_response_of_yojson
      ~error_deserializer
end

module UpdateParameterGroup = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterGroupStateFault _ -> "com.amazonaws.memorydb#InvalidParameterGroupStateFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `ParameterGroupNotFoundFault _ -> "com.amazonaws.memorydb#ParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterGroupStateFault" ->
          `InvalidParameterGroupStateFault
            (Json_deserializers.invalid_parameter_group_state_fault_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ParameterGroupNotFoundFault" ->
          `ParameterGroupNotFoundFault
            (Json_deserializers.parameter_group_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_parameter_group_request) =
    let input = Json_serializers.update_parameter_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.UpdateParameterGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_parameter_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_parameter_group_request) =
    let input = Json_serializers.update_parameter_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMemoryDB.UpdateParameterGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_parameter_group_response_of_yojson
      ~error_deserializer
end

module UpdateSubnetGroup = struct
  let error_to_string = function
    | `InvalidSubnet _ -> "com.amazonaws.memorydb#InvalidSubnet"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.memorydb#ServiceLinkedRoleNotFoundFault"
    | `SubnetGroupNotFoundFault _ -> "com.amazonaws.memorydb#SubnetGroupNotFoundFault"
    | `SubnetInUse _ -> "com.amazonaws.memorydb#SubnetInUse"
    | `SubnetNotAllowedFault _ -> "com.amazonaws.memorydb#SubnetNotAllowedFault"
    | `SubnetQuotaExceededFault _ -> "com.amazonaws.memorydb#SubnetQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidSubnet" -> `InvalidSubnet (Json_deserializers.invalid_subnet_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "SubnetGroupNotFoundFault" ->
          `SubnetGroupNotFoundFault
            (Json_deserializers.subnet_group_not_found_fault_of_yojson tree path)
      | _, "SubnetInUse" -> `SubnetInUse (Json_deserializers.subnet_in_use_of_yojson tree path)
      | _, "SubnetNotAllowedFault" ->
          `SubnetNotAllowedFault (Json_deserializers.subnet_not_allowed_fault_of_yojson tree path)
      | _, "SubnetQuotaExceededFault" ->
          `SubnetQuotaExceededFault
            (Json_deserializers.subnet_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_subnet_group_request) =
    let input = Json_serializers.update_subnet_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.UpdateSubnetGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_subnet_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_subnet_group_request) =
    let input = Json_serializers.update_subnet_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.UpdateSubnetGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_subnet_group_response_of_yojson
      ~error_deserializer
end

module UpdateUser = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.memorydb#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.memorydb#InvalidParameterValueException"
    | `InvalidUserStateFault _ -> "com.amazonaws.memorydb#InvalidUserStateFault"
    | `UserNotFoundFault _ -> "com.amazonaws.memorydb#UserNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "InvalidUserStateFault" ->
          `InvalidUserStateFault (Json_deserializers.invalid_user_state_fault_of_yojson tree path)
      | _, "UserNotFoundFault" ->
          `UserNotFoundFault (Json_deserializers.user_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_user_request) =
    let input = Json_serializers.update_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMemoryDB.UpdateUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_user_request) =
    let input = Json_serializers.update_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMemoryDB.UpdateUser"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_user_response_of_yojson ~error_deserializer
end
