open Types
open Service_metadata
module CreateCluster =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ClusterAlreadyExistsFault") ->
            `ClusterAlreadyExistsFault
              (Json_deserializers.cluster_already_exists_fault_of_yojson tree
                 path)
        | (_, "ClusterQuotaForCustomerExceededFault") ->
            `ClusterQuotaForCustomerExceededFault
              (Json_deserializers.cluster_quota_for_customer_exceeded_fault_of_yojson
                 tree path)
        | (_, "InsufficientClusterCapacityFault") ->
            `InsufficientClusterCapacityFault
              (Json_deserializers.insufficient_cluster_capacity_fault_of_yojson
                 tree path)
        | (_, "InvalidClusterStateFault") ->
            `InvalidClusterStateFault
              (Json_deserializers.invalid_cluster_state_fault_of_yojson tree
                 path)
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterGroupStateFault") ->
            `InvalidParameterGroupStateFault
              (Json_deserializers.invalid_parameter_group_state_fault_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "InvalidVPCNetworkStateFault") ->
            `InvalidVPCNetworkStateFault
              (Json_deserializers.invalid_vpc_network_state_fault_of_yojson
                 tree path)
        | (_, "NodeQuotaForClusterExceededFault") ->
            `NodeQuotaForClusterExceededFault
              (Json_deserializers.node_quota_for_cluster_exceeded_fault_of_yojson
                 tree path)
        | (_, "NodeQuotaForCustomerExceededFault") ->
            `NodeQuotaForCustomerExceededFault
              (Json_deserializers.node_quota_for_customer_exceeded_fault_of_yojson
                 tree path)
        | (_, "ParameterGroupNotFoundFault") ->
            `ParameterGroupNotFoundFault
              (Json_deserializers.parameter_group_not_found_fault_of_yojson
                 tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | (_, "ServiceQuotaExceededException") ->
            `ServiceQuotaExceededException
              (Json_deserializers.service_quota_exceeded_exception_of_yojson
                 tree path)
        | (_, "SubnetGroupNotFoundFault") ->
            `SubnetGroupNotFoundFault
              (Json_deserializers.subnet_group_not_found_fault_of_yojson tree
                 path)
        | (_, "TagQuotaPerResourceExceeded") ->
            `TagQuotaPerResourceExceeded
              (Json_deserializers.tag_quota_per_resource_exceeded_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : create_cluster_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.create_cluster_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3CreateCluster" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.create_cluster_response_of_yojson
          ~error_deserializer
  end
module CreateParameterGroup =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterGroupStateFault") ->
            `InvalidParameterGroupStateFault
              (Json_deserializers.invalid_parameter_group_state_fault_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "ParameterGroupAlreadyExistsFault") ->
            `ParameterGroupAlreadyExistsFault
              (Json_deserializers.parameter_group_already_exists_fault_of_yojson
                 tree path)
        | (_, "ParameterGroupQuotaExceededFault") ->
            `ParameterGroupQuotaExceededFault
              (Json_deserializers.parameter_group_quota_exceeded_fault_of_yojson
                 tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : create_parameter_group_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.create_parameter_group_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3CreateParameterGroup" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.create_parameter_group_response_of_yojson
          ~error_deserializer
  end
module CreateSubnetGroup =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidSubnet") ->
            `InvalidSubnet
              (Json_deserializers.invalid_subnet_of_yojson tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | (_, "SubnetGroupAlreadyExistsFault") ->
            `SubnetGroupAlreadyExistsFault
              (Json_deserializers.subnet_group_already_exists_fault_of_yojson
                 tree path)
        | (_, "SubnetGroupQuotaExceededFault") ->
            `SubnetGroupQuotaExceededFault
              (Json_deserializers.subnet_group_quota_exceeded_fault_of_yojson
                 tree path)
        | (_, "SubnetQuotaExceededFault") ->
            `SubnetQuotaExceededFault
              (Json_deserializers.subnet_quota_exceeded_fault_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : create_subnet_group_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.create_subnet_group_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3CreateSubnetGroup" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.create_subnet_group_response_of_yojson
          ~error_deserializer
  end
module DecreaseReplicationFactor =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ClusterNotFoundFault") ->
            `ClusterNotFoundFault
              (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
        | (_, "InvalidClusterStateFault") ->
            `InvalidClusterStateFault
              (Json_deserializers.invalid_cluster_state_fault_of_yojson tree
                 path)
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NodeNotFoundFault") ->
            `NodeNotFoundFault
              (Json_deserializers.node_not_found_fault_of_yojson tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : decrease_replication_factor_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.decrease_replication_factor_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3DecreaseReplicationFactor" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.decrease_replication_factor_response_of_yojson
          ~error_deserializer
  end
module DeleteCluster =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ClusterNotFoundFault") ->
            `ClusterNotFoundFault
              (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
        | (_, "InvalidClusterStateFault") ->
            `InvalidClusterStateFault
              (Json_deserializers.invalid_cluster_state_fault_of_yojson tree
                 path)
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_cluster_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.delete_cluster_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3DeleteCluster" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_cluster_response_of_yojson
          ~error_deserializer
  end
module DeleteParameterGroup =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterGroupStateFault") ->
            `InvalidParameterGroupStateFault
              (Json_deserializers.invalid_parameter_group_state_fault_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "ParameterGroupNotFoundFault") ->
            `ParameterGroupNotFoundFault
              (Json_deserializers.parameter_group_not_found_fault_of_yojson
                 tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_parameter_group_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_parameter_group_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3DeleteParameterGroup" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_parameter_group_response_of_yojson
          ~error_deserializer
  end
module DeleteSubnetGroup =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | (_, "SubnetGroupInUseFault") ->
            `SubnetGroupInUseFault
              (Json_deserializers.subnet_group_in_use_fault_of_yojson tree
                 path)
        | (_, "SubnetGroupNotFoundFault") ->
            `SubnetGroupNotFoundFault
              (Json_deserializers.subnet_group_not_found_fault_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_subnet_group_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_subnet_group_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3DeleteSubnetGroup" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_subnet_group_response_of_yojson
          ~error_deserializer
  end
module DescribeClusters =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ClusterNotFoundFault") ->
            `ClusterNotFoundFault
              (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_clusters_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_clusters_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3DescribeClusters" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_clusters_response_of_yojson
          ~error_deserializer
  end
module DescribeDefaultParameters =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_default_parameters_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_default_parameters_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3DescribeDefaultParameters" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_default_parameters_response_of_yojson
          ~error_deserializer
  end
module DescribeEvents =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_events_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_events_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3DescribeEvents" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_events_response_of_yojson
          ~error_deserializer
  end
module DescribeParameterGroups =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "ParameterGroupNotFoundFault") ->
            `ParameterGroupNotFoundFault
              (Json_deserializers.parameter_group_not_found_fault_of_yojson
                 tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_parameter_groups_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_parameter_groups_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3DescribeParameterGroups" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_parameter_groups_response_of_yojson
          ~error_deserializer
  end
module DescribeParameters =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "ParameterGroupNotFoundFault") ->
            `ParameterGroupNotFoundFault
              (Json_deserializers.parameter_group_not_found_fault_of_yojson
                 tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_parameters_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_parameters_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3DescribeParameters" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_parameters_response_of_yojson
          ~error_deserializer
  end
module DescribeSubnetGroups =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | (_, "SubnetGroupNotFoundFault") ->
            `SubnetGroupNotFoundFault
              (Json_deserializers.subnet_group_not_found_fault_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_subnet_groups_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_subnet_groups_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3DescribeSubnetGroups" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_subnet_groups_response_of_yojson
          ~error_deserializer
  end
module IncreaseReplicationFactor =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ClusterNotFoundFault") ->
            `ClusterNotFoundFault
              (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
        | (_, "InsufficientClusterCapacityFault") ->
            `InsufficientClusterCapacityFault
              (Json_deserializers.insufficient_cluster_capacity_fault_of_yojson
                 tree path)
        | (_, "InvalidClusterStateFault") ->
            `InvalidClusterStateFault
              (Json_deserializers.invalid_cluster_state_fault_of_yojson tree
                 path)
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "InvalidVPCNetworkStateFault") ->
            `InvalidVPCNetworkStateFault
              (Json_deserializers.invalid_vpc_network_state_fault_of_yojson
                 tree path)
        | (_, "NodeQuotaForClusterExceededFault") ->
            `NodeQuotaForClusterExceededFault
              (Json_deserializers.node_quota_for_cluster_exceeded_fault_of_yojson
                 tree path)
        | (_, "NodeQuotaForCustomerExceededFault") ->
            `NodeQuotaForCustomerExceededFault
              (Json_deserializers.node_quota_for_customer_exceeded_fault_of_yojson
                 tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : increase_replication_factor_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.increase_replication_factor_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3IncreaseReplicationFactor" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.increase_replication_factor_response_of_yojson
          ~error_deserializer
  end
module ListTags =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ClusterNotFoundFault") ->
            `ClusterNotFoundFault
              (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
        | (_, "InvalidARNFault") ->
            `InvalidARNFault
              (Json_deserializers.invalid_arn_fault_of_yojson tree path)
        | (_, "InvalidClusterStateFault") ->
            `InvalidClusterStateFault
              (Json_deserializers.invalid_cluster_state_fault_of_yojson tree
                 path)
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_tags_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.list_tags_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDAXV3ListTags"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_tags_response_of_yojson
          ~error_deserializer
  end
module RebootNode =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ClusterNotFoundFault") ->
            `ClusterNotFoundFault
              (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
        | (_, "InvalidClusterStateFault") ->
            `InvalidClusterStateFault
              (Json_deserializers.invalid_cluster_state_fault_of_yojson tree
                 path)
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NodeNotFoundFault") ->
            `NodeNotFoundFault
              (Json_deserializers.node_not_found_fault_of_yojson tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : reboot_node_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.reboot_node_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3RebootNode" ~service ~config:context.config
          ~http:context.http ~input
          ~output_deserializer:Json_deserializers.reboot_node_response_of_yojson
          ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ClusterNotFoundFault") ->
            `ClusterNotFoundFault
              (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
        | (_, "InvalidARNFault") ->
            `InvalidARNFault
              (Json_deserializers.invalid_arn_fault_of_yojson tree path)
        | (_, "InvalidClusterStateFault") ->
            `InvalidClusterStateFault
              (Json_deserializers.invalid_cluster_state_fault_of_yojson tree
                 path)
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | (_, "TagQuotaPerResourceExceeded") ->
            `TagQuotaPerResourceExceeded
              (Json_deserializers.tag_quota_per_resource_exceeded_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : tag_resource_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.tag_resource_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3TagResource" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
          ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ClusterNotFoundFault") ->
            `ClusterNotFoundFault
              (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
        | (_, "InvalidARNFault") ->
            `InvalidARNFault
              (Json_deserializers.invalid_arn_fault_of_yojson tree path)
        | (_, "InvalidClusterStateFault") ->
            `InvalidClusterStateFault
              (Json_deserializers.invalid_cluster_state_fault_of_yojson tree
                 path)
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | (_, "TagNotFoundFault") ->
            `TagNotFoundFault
              (Json_deserializers.tag_not_found_fault_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : untag_resource_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.untag_resource_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3UntagResource" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
          ~error_deserializer
  end
module UpdateCluster =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ClusterNotFoundFault") ->
            `ClusterNotFoundFault
              (Json_deserializers.cluster_not_found_fault_of_yojson tree path)
        | (_, "InvalidClusterStateFault") ->
            `InvalidClusterStateFault
              (Json_deserializers.invalid_cluster_state_fault_of_yojson tree
                 path)
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterGroupStateFault") ->
            `InvalidParameterGroupStateFault
              (Json_deserializers.invalid_parameter_group_state_fault_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "ParameterGroupNotFoundFault") ->
            `ParameterGroupNotFoundFault
              (Json_deserializers.parameter_group_not_found_fault_of_yojson
                 tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : update_cluster_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.update_cluster_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3UpdateCluster" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.update_cluster_response_of_yojson
          ~error_deserializer
  end
module UpdateParameterGroup =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterCombinationException") ->
            `InvalidParameterCombinationException
              (Json_deserializers.invalid_parameter_combination_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterGroupStateFault") ->
            `InvalidParameterGroupStateFault
              (Json_deserializers.invalid_parameter_group_state_fault_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "ParameterGroupNotFoundFault") ->
            `ParameterGroupNotFoundFault
              (Json_deserializers.parameter_group_not_found_fault_of_yojson
                 tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : update_parameter_group_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.update_parameter_group_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3UpdateParameterGroup" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.update_parameter_group_response_of_yojson
          ~error_deserializer
  end
module UpdateSubnetGroup =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidSubnet") ->
            `InvalidSubnet
              (Json_deserializers.invalid_subnet_of_yojson tree path)
        | (_, "ServiceLinkedRoleNotFoundFault") ->
            `ServiceLinkedRoleNotFoundFault
              (Json_deserializers.service_linked_role_not_found_fault_of_yojson
                 tree path)
        | (_, "SubnetGroupNotFoundFault") ->
            `SubnetGroupNotFoundFault
              (Json_deserializers.subnet_group_not_found_fault_of_yojson tree
                 path)
        | (_, "SubnetInUse") ->
            `SubnetInUse
              (Json_deserializers.subnet_in_use_of_yojson tree path)
        | (_, "SubnetQuotaExceededFault") ->
            `SubnetQuotaExceededFault
              (Json_deserializers.subnet_quota_exceeded_fault_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : update_subnet_group_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.update_subnet_group_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonDAXV3UpdateSubnetGroup" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.update_subnet_group_response_of_yojson
          ~error_deserializer
  end