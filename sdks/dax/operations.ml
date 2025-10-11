open Types
open Service_metadata

module CreateCluster = struct
  let error_to_string = function
    | `ClusterAlreadyExistsFault _ -> "com.amazonaws.dax#ClusterAlreadyExistsFault"
    | `ClusterQuotaForCustomerExceededFault _ ->
        "com.amazonaws.dax#ClusterQuotaForCustomerExceededFault"
    | `InsufficientClusterCapacityFault _ -> "com.amazonaws.dax#InsufficientClusterCapacityFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.dax#InvalidClusterStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterGroupStateFault _ -> "com.amazonaws.dax#InvalidParameterGroupStateFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.dax#InvalidVPCNetworkStateFault"
    | `NodeQuotaForClusterExceededFault _ -> "com.amazonaws.dax#NodeQuotaForClusterExceededFault"
    | `NodeQuotaForCustomerExceededFault _ -> "com.amazonaws.dax#NodeQuotaForCustomerExceededFault"
    | `ParameterGroupNotFoundFault _ -> "com.amazonaws.dax#ParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.dax#ServiceQuotaExceededException"
    | `SubnetGroupNotFoundFault _ -> "com.amazonaws.dax#SubnetGroupNotFoundFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.dax#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClusterAlreadyExistsFault" ->
          `ClusterAlreadyExistsFault
            (Json_deserializers.cluster_already_exists_fault_of_yojson tree path)
      | _, "ClusterQuotaForCustomerExceededFault" ->
          `ClusterQuotaForCustomerExceededFault
            (Json_deserializers.cluster_quota_for_customer_exceeded_fault_of_yojson tree path)
      | _, "InsufficientClusterCapacityFault" ->
          `InsufficientClusterCapacityFault
            (Json_deserializers.insufficient_cluster_capacity_fault_of_yojson tree path)
      | _, "InvalidClusterStateFault" ->
          `InvalidClusterStateFault
            (Json_deserializers.invalid_cluster_state_fault_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterGroupStateFault" ->
          `InvalidParameterGroupStateFault
            (Json_deserializers.invalid_parameter_group_state_fault_of_yojson tree path)
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
      | _, "ParameterGroupNotFoundFault" ->
          `ParameterGroupNotFoundFault
            (Json_deserializers.parameter_group_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.CreateCluster" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_cluster_response_of_yojson
      ~error_deserializer
end

module CreateParameterGroup = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterGroupStateFault _ -> "com.amazonaws.dax#InvalidParameterGroupStateFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `ParameterGroupAlreadyExistsFault _ -> "com.amazonaws.dax#ParameterGroupAlreadyExistsFault"
    | `ParameterGroupQuotaExceededFault _ -> "com.amazonaws.dax#ParameterGroupQuotaExceededFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
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
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_parameter_group_request) =
    let input = Json_serializers.create_parameter_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.CreateParameterGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_parameter_group_response_of_yojson
      ~error_deserializer
end

module CreateSubnetGroup = struct
  let error_to_string = function
    | `InvalidSubnet _ -> "com.amazonaws.dax#InvalidSubnet"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
    | `SubnetGroupAlreadyExistsFault _ -> "com.amazonaws.dax#SubnetGroupAlreadyExistsFault"
    | `SubnetGroupQuotaExceededFault _ -> "com.amazonaws.dax#SubnetGroupQuotaExceededFault"
    | `SubnetQuotaExceededFault _ -> "com.amazonaws.dax#SubnetQuotaExceededFault"
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
      | _, "SubnetQuotaExceededFault" ->
          `SubnetQuotaExceededFault
            (Json_deserializers.subnet_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_subnet_group_request) =
    let input = Json_serializers.create_subnet_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.CreateSubnetGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_subnet_group_response_of_yojson
      ~error_deserializer
end

module DecreaseReplicationFactor = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.dax#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.dax#InvalidClusterStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `NodeNotFoundFault _ -> "com.amazonaws.dax#NodeNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
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
      | _, "NodeNotFoundFault" ->
          `NodeNotFoundFault (Json_deserializers.node_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : decrease_replication_factor_request) =
    let input = Json_serializers.decrease_replication_factor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.DecreaseReplicationFactor" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.decrease_replication_factor_response_of_yojson
      ~error_deserializer
end

module DeleteCluster = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.dax#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.dax#InvalidClusterStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
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
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_cluster_request) =
    let input = Json_serializers.delete_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.DeleteCluster" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_cluster_response_of_yojson
      ~error_deserializer
end

module DeleteParameterGroup = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterGroupStateFault _ -> "com.amazonaws.dax#InvalidParameterGroupStateFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `ParameterGroupNotFoundFault _ -> "com.amazonaws.dax#ParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.DeleteParameterGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_parameter_group_response_of_yojson
      ~error_deserializer
end

module DeleteSubnetGroup = struct
  let error_to_string = function
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
    | `SubnetGroupInUseFault _ -> "com.amazonaws.dax#SubnetGroupInUseFault"
    | `SubnetGroupNotFoundFault _ -> "com.amazonaws.dax#SubnetGroupNotFoundFault"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.DeleteSubnetGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_subnet_group_response_of_yojson
      ~error_deserializer
end

module DescribeClusters = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.dax#ClusterNotFoundFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.DescribeClusters" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_clusters_response_of_yojson
      ~error_deserializer
end

module DescribeDefaultParameters = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
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

  let request context (request : describe_default_parameters_request) =
    let input = Json_serializers.describe_default_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.DescribeDefaultParameters" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_default_parameters_response_of_yojson
      ~error_deserializer
end

module DescribeEvents = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.DescribeEvents" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_events_response_of_yojson
      ~error_deserializer
end

module DescribeParameterGroups = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `ParameterGroupNotFoundFault _ -> "com.amazonaws.dax#ParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.DescribeParameterGroups" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_parameter_groups_response_of_yojson
      ~error_deserializer
end

module DescribeParameters = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `ParameterGroupNotFoundFault _ -> "com.amazonaws.dax#ParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.DescribeParameters" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_parameters_response_of_yojson
      ~error_deserializer
end

module DescribeSubnetGroups = struct
  let error_to_string = function
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
    | `SubnetGroupNotFoundFault _ -> "com.amazonaws.dax#SubnetGroupNotFoundFault"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.DescribeSubnetGroups" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_subnet_groups_response_of_yojson
      ~error_deserializer
end

module IncreaseReplicationFactor = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.dax#ClusterNotFoundFault"
    | `InsufficientClusterCapacityFault _ -> "com.amazonaws.dax#InsufficientClusterCapacityFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.dax#InvalidClusterStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.dax#InvalidVPCNetworkStateFault"
    | `NodeQuotaForClusterExceededFault _ -> "com.amazonaws.dax#NodeQuotaForClusterExceededFault"
    | `NodeQuotaForCustomerExceededFault _ -> "com.amazonaws.dax#NodeQuotaForCustomerExceededFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClusterNotFoundFault" ->
          `ClusterNotFoundFault (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
      | _, "InsufficientClusterCapacityFault" ->
          `InsufficientClusterCapacityFault
            (Json_deserializers.insufficient_cluster_capacity_fault_of_yojson tree path)
      | _, "InvalidClusterStateFault" ->
          `InvalidClusterStateFault
            (Json_deserializers.invalid_cluster_state_fault_of_yojson tree path)
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
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : increase_replication_factor_request) =
    let input = Json_serializers.increase_replication_factor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.IncreaseReplicationFactor" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.increase_replication_factor_response_of_yojson
      ~error_deserializer
end

module ListTags = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.dax#ClusterNotFoundFault"
    | `InvalidARNFault _ -> "com.amazonaws.dax#InvalidARNFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.dax#InvalidClusterStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClusterNotFoundFault" ->
          `ClusterNotFoundFault (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
      | _, "InvalidARNFault" ->
          `InvalidARNFault (Json_deserializers.invalid_arn_fault_of_yojson tree path)
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
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_request) =
    let input = Json_serializers.list_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.ListTags" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_response_of_yojson ~error_deserializer
end

module RebootNode = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.dax#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.dax#InvalidClusterStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `NodeNotFoundFault _ -> "com.amazonaws.dax#NodeNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
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
      | _, "NodeNotFoundFault" ->
          `NodeNotFoundFault (Json_deserializers.node_not_found_fault_of_yojson tree path)
      | _, "ServiceLinkedRoleNotFoundFault" ->
          `ServiceLinkedRoleNotFoundFault
            (Json_deserializers.service_linked_role_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reboot_node_request) =
    let input = Json_serializers.reboot_node_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.RebootNode" ~service ~context
      ~input ~output_deserializer:Json_deserializers.reboot_node_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.dax#ClusterNotFoundFault"
    | `InvalidARNFault _ -> "com.amazonaws.dax#InvalidARNFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.dax#InvalidClusterStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.dax#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClusterNotFoundFault" ->
          `ClusterNotFoundFault (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
      | _, "InvalidARNFault" ->
          `InvalidARNFault (Json_deserializers.invalid_arn_fault_of_yojson tree path)
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
      | _, "TagQuotaPerResourceExceeded" ->
          `TagQuotaPerResourceExceeded
            (Json_deserializers.tag_quota_per_resource_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.dax#ClusterNotFoundFault"
    | `InvalidARNFault _ -> "com.amazonaws.dax#InvalidARNFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.dax#InvalidClusterStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
    | `TagNotFoundFault _ -> "com.amazonaws.dax#TagNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClusterNotFoundFault" ->
          `ClusterNotFoundFault (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
      | _, "InvalidARNFault" ->
          `InvalidARNFault (Json_deserializers.invalid_arn_fault_of_yojson tree path)
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
      | _, "TagNotFoundFault" ->
          `TagNotFoundFault (Json_deserializers.tag_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.UntagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer
end

module UpdateCluster = struct
  let error_to_string = function
    | `ClusterNotFoundFault _ -> "com.amazonaws.dax#ClusterNotFoundFault"
    | `InvalidClusterStateFault _ -> "com.amazonaws.dax#InvalidClusterStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterGroupStateFault _ -> "com.amazonaws.dax#InvalidParameterGroupStateFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `ParameterGroupNotFoundFault _ -> "com.amazonaws.dax#ParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
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

  let request context (request : update_cluster_request) =
    let input = Json_serializers.update_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.UpdateCluster" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_cluster_response_of_yojson
      ~error_deserializer
end

module UpdateParameterGroup = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.dax#InvalidParameterCombinationException"
    | `InvalidParameterGroupStateFault _ -> "com.amazonaws.dax#InvalidParameterGroupStateFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.dax#InvalidParameterValueException"
    | `ParameterGroupNotFoundFault _ -> "com.amazonaws.dax#ParameterGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.UpdateParameterGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_parameter_group_response_of_yojson
      ~error_deserializer
end

module UpdateSubnetGroup = struct
  let error_to_string = function
    | `InvalidSubnet _ -> "com.amazonaws.dax#InvalidSubnet"
    | `ServiceLinkedRoleNotFoundFault _ -> "com.amazonaws.dax#ServiceLinkedRoleNotFoundFault"
    | `SubnetGroupNotFoundFault _ -> "com.amazonaws.dax#SubnetGroupNotFoundFault"
    | `SubnetInUse _ -> "com.amazonaws.dax#SubnetInUse"
    | `SubnetQuotaExceededFault _ -> "com.amazonaws.dax#SubnetQuotaExceededFault"
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
      | _, "SubnetQuotaExceededFault" ->
          `SubnetQuotaExceededFault
            (Json_deserializers.subnet_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_subnet_group_request) =
    let input = Json_serializers.update_subnet_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3.UpdateSubnetGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_subnet_group_response_of_yojson
      ~error_deserializer
end
