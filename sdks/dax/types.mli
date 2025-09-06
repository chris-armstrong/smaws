type nonrec string_ = string[@@ocaml.doc ""]
type nonrec subnet =
  {
  subnet_availability_zone: string_ option
    [@ocaml.doc "The Availability Zone (AZ) for the subnet.\n"];
  subnet_identifier: string_ option
    [@ocaml.doc "The system-assigned identifier for the subnet.\n"]}[@@ocaml.doc
                                                                    "Represents the subnet associated with a DAX cluster. This parameter refers to subnets defined in Amazon Virtual Private Cloud (Amazon VPC) and used with DAX.\n"]
type nonrec subnet_list = subnet list[@@ocaml.doc ""]
type nonrec subnet_group =
  {
  subnets: subnet_list option
    [@ocaml.doc "A list of subnets associated with the subnet group. \n"];
  vpc_id: string_ option
    [@ocaml.doc
      "The Amazon Virtual Private Cloud identifier (VPC ID) of the subnet group.\n"];
  description: string_ option
    [@ocaml.doc "The description of the subnet group.\n"];
  subnet_group_name: string_ option
    [@ocaml.doc "The name of the subnet group.\n"]}[@@ocaml.doc
                                                     "Represents the output of one of the following actions:\n\n {ul\n       {-   {i CreateSubnetGroup} \n           \n            }\n       {-   {i ModifySubnetGroup} \n           \n            }\n       }\n  "]
type nonrec update_subnet_group_response =
  {
  subnet_group: subnet_group option
    [@ocaml.doc "The subnet group that has been modified.\n"]}[@@ocaml.doc
                                                                ""]
type nonrec subnet_identifier_list = string_ list[@@ocaml.doc ""]
type nonrec update_subnet_group_request =
  {
  subnet_ids: subnet_identifier_list option
    [@ocaml.doc "A list of subnet IDs in the subnet group.\n"];
  description: string_ option
    [@ocaml.doc "A description of the subnet group.\n"];
  subnet_group_name: string_ [@ocaml.doc "The name of the subnet group.\n"]}
[@@ocaml.doc ""]
type nonrec exception_message = string[@@ocaml.doc ""]
type nonrec subnet_quota_exceeded_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The request cannot be processed because it would exceed the allowed number of subnets in a subnet group.\n"]
type nonrec subnet_in_use =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The requested subnet is being used by another subnet group.\n"]
type nonrec subnet_group_not_found_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The requested subnet group name does not refer to an existing subnet group.\n"]
type nonrec service_linked_role_not_found_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The specified service linked role (SLR) was not found.\n"]
type nonrec invalid_subnet =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "An invalid subnet identifier was specified.\n"]
type nonrec parameter_group =
  {
  description: string_ option
    [@ocaml.doc "A description of the parameter group.\n"];
  parameter_group_name: string_ option
    [@ocaml.doc "The name of the parameter group.\n"]}[@@ocaml.doc
                                                        "A named set of parameters that are applied to all of the nodes in a DAX cluster.\n"]
type nonrec update_parameter_group_response =
  {
  parameter_group: parameter_group option
    [@ocaml.doc "The parameter group that has been modified.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec parameter_name_value =
  {
  parameter_value: string_ option
    [@ocaml.doc "The value of the parameter.\n"];
  parameter_name: string_ option [@ocaml.doc "The name of the parameter.\n"]}
[@@ocaml.doc "An individual DAX parameter.\n"]
type nonrec parameter_name_value_list = parameter_name_value list[@@ocaml.doc
                                                                   ""]
type nonrec update_parameter_group_request =
  {
  parameter_name_values: parameter_name_value_list
    [@ocaml.doc
      "An array of name-value pairs for the parameters in the group. Each element in the array represents a single parameter.\n\n   [record-ttl-millis] and [query-ttl-millis] are the only supported parameter names. For more details, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DAX.cluster-management.html#DAX.cluster-management.custom-settings.ttl}Configuring TTL Settings}.\n  \n   "];
  parameter_group_name: string_
    [@ocaml.doc "The name of the parameter group.\n"]}[@@ocaml.doc ""]
type nonrec parameter_group_not_found_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The specified parameter group does not exist.\n"]
type nonrec aws_query_error_message = string[@@ocaml.doc ""]
type nonrec invalid_parameter_value_exception =
  {
  message: aws_query_error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                            "The value for a parameter is invalid.\n"]
type nonrec invalid_parameter_group_state_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "One or more parameters in a parameter group are in an invalid state.\n"]
type nonrec invalid_parameter_combination_exception =
  {
  message: aws_query_error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                            "Two or more incompatible parameters were specified.\n"]
type nonrec integer_optional = int[@@ocaml.doc ""]
type nonrec integer = int[@@ocaml.doc ""]
type nonrec endpoint =
  {
  ur_l: string_ option
    [@ocaml.doc
      "The URL that applications should use to connect to the endpoint. The default ports are 8111 for the \"dax\" protocol and 9111 for the \"daxs\" protocol.\n"];
  port: integer option
    [@ocaml.doc
      "The port number that applications should use to connect to the endpoint.\n"];
  address: string_ option [@ocaml.doc "The DNS hostname of the endpoint.\n"]}
[@@ocaml.doc
  "Represents the information required for client programs to connect to the endpoint for a DAX cluster.\n"]
type nonrec node_identifier_list = string_ list[@@ocaml.doc ""]
type nonrec t_stamp = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec node =
  {
  parameter_group_status: string_ option
    [@ocaml.doc
      "The status of the parameter group associated with this node. For example, [in-sync].\n"];
  node_status: string_ option
    [@ocaml.doc
      "The current status of the node. For example: [available].\n"];
  availability_zone: string_ option
    [@ocaml.doc
      "The Availability Zone (AZ) in which the node has been deployed.\n"];
  node_create_time: t_stamp option
    [@ocaml.doc
      "The date and time (in UNIX epoch format) when the node was launched.\n"];
  endpoint: endpoint option
    [@ocaml.doc
      "The endpoint for the node, consisting of a DNS name and a port number. Client applications can connect directly to a node endpoint, if desired (as an alternative to allowing DAX client software to intelligently route requests and responses to nodes in the DAX cluster.\n"];
  node_id: string_ option
    [@ocaml.doc "A system-generated identifier for the node.\n"]}[@@ocaml.doc
                                                                   "Represents an individual node within a DAX cluster.\n"]
type nonrec node_list = node list[@@ocaml.doc ""]
type nonrec notification_configuration =
  {
  topic_status: string_ option
    [@ocaml.doc
      "The current state of the topic. A value of \226\128\156active\226\128\157 means that notifications will be sent to the topic. A value of \226\128\156inactive\226\128\157 means that notifications will not be sent to the topic.\n"];
  topic_arn: string_ option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the topic. \n"]}
[@@ocaml.doc
  "Describes a notification topic and its status. Notification topics are used for publishing DAX events to subscribers using Amazon Simple Notification Service (SNS).\n"]
type nonrec security_group_membership =
  {
  status: string_ option [@ocaml.doc "The status of this security group.\n"];
  security_group_identifier: string_ option
    [@ocaml.doc "The unique ID for this security group.\n"]}[@@ocaml.doc
                                                              "An individual VPC security group and its status.\n"]
type nonrec security_group_membership_list = security_group_membership list
[@@ocaml.doc ""]
type nonrec parameter_group_status =
  {
  node_ids_to_reboot: node_identifier_list option
    [@ocaml.doc "The node IDs of one or more nodes to be rebooted.\n"];
  parameter_apply_status: string_ option
    [@ocaml.doc "The status of parameter updates. \n"];
  parameter_group_name: string_ option
    [@ocaml.doc "The name of the parameter group.\n"]}[@@ocaml.doc
                                                        "The status of a parameter group.\n"]
type nonrec sse_status =
  | DISABLED [@ocaml.doc ""]
  | DISABLING [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | ENABLING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sse_description =
  {
  status: sse_status option
    [@ocaml.doc
      "The current state of server-side encryption:\n\n {ul\n       {-   [ENABLING] - Server-side encryption is being enabled.\n           \n            }\n       {-   [ENABLED] - Server-side encryption is enabled.\n           \n            }\n       {-   [DISABLING] - Server-side encryption is being disabled.\n           \n            }\n       {-   [DISABLED] - Server-side encryption is disabled.\n           \n            }\n       }\n  "]}
[@@ocaml.doc
  "The description of the server-side encryption status on the specified DAX cluster.\n"]
type nonrec cluster_endpoint_encryption_type =
  | TLS [@ocaml.doc ""]
  | NONE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec cluster =
  {
  cluster_endpoint_encryption_type: cluster_endpoint_encryption_type option
    [@ocaml.doc
      "The type of encryption supported by the cluster's endpoint. Values are:\n\n {ul\n       {-   [NONE] for no encryption\n           \n             [TLS] for Transport Layer Security\n            \n             }\n       }\n  "];
  sse_description: sse_description option
    [@ocaml.doc
      "The description of the server-side encryption status on the specified DAX cluster.\n"];
  parameter_group: parameter_group_status option
    [@ocaml.doc "The parameter group being used by nodes in the cluster.\n"];
  iam_role_arn: string_ option
    [@ocaml.doc
      "A valid Amazon Resource Name (ARN) that identifies an IAM role. At runtime, DAX will assume this role and use the role's permissions to access DynamoDB on your behalf.\n"];
  security_groups: security_group_membership_list option
    [@ocaml.doc
      "A list of security groups, and the status of each, for the nodes in the cluster.\n"];
  subnet_group: string_ option
    [@ocaml.doc "The subnet group where the DAX cluster is running.\n"];
  notification_configuration: notification_configuration option
    [@ocaml.doc
      "Describes a notification topic and its status. Notification topics are used for publishing DAX events to subscribers using Amazon Simple Notification Service (SNS).\n"];
  preferred_maintenance_window: string_ option
    [@ocaml.doc
      "A range of time when maintenance of DAX cluster software will be performed. For example: [sun:01:00-sun:09:00]. Cluster maintenance normally takes less than 30 minutes, and is performed automatically within the maintenance window.\n"];
  nodes: node_list option
    [@ocaml.doc "A list of nodes that are currently in the cluster.\n"];
  node_ids_to_remove: node_identifier_list option
    [@ocaml.doc "A list of nodes to be removed from the cluster.\n"];
  cluster_discovery_endpoint: endpoint option
    [@ocaml.doc
      "The endpoint for this DAX cluster, consisting of a DNS name, a port number, and a URL. Applications should use the URL to configure the DAX client to find their cluster.\n"];
  status: string_ option [@ocaml.doc "The current status of the cluster.\n"];
  node_type: string_ option
    [@ocaml.doc
      "The node type for the nodes in the cluster. (All nodes in a DAX cluster are of the same type.)\n"];
  active_nodes: integer_optional option
    [@ocaml.doc
      "The number of nodes in the cluster that are active (i.e., capable of serving requests).\n"];
  total_nodes: integer_optional option
    [@ocaml.doc "The total number of nodes in the cluster.\n"];
  cluster_arn: string_ option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that uniquely identifies the cluster. \n"];
  description: string_ option
    [@ocaml.doc "The description of the cluster.\n"];
  cluster_name: string_ option [@ocaml.doc "The name of the DAX cluster.\n"]}
[@@ocaml.doc "Contains all of the attributes of a specific DAX cluster.\n"]
type nonrec update_cluster_response =
  {
  cluster: cluster option
    [@ocaml.doc
      "A description of the DAX cluster, after it has been modified.\n"]}
[@@ocaml.doc ""]
type nonrec security_group_identifier_list = string_ list[@@ocaml.doc ""]
type nonrec update_cluster_request =
  {
  security_group_ids: security_group_identifier_list option
    [@ocaml.doc
      "A list of user-specified security group IDs to be assigned to each node in the DAX cluster. If this parameter is not specified, DAX assigns the default VPC security group to each node.\n"];
  parameter_group_name: string_ option
    [@ocaml.doc "The name of a parameter group for this cluster.\n"];
  notification_topic_status: string_ option
    [@ocaml.doc
      "The current state of the topic. A value of \226\128\156active\226\128\157 means that notifications will be sent to the topic. A value of \226\128\156inactive\226\128\157 means that notifications will not be sent to the topic.\n"];
  notification_topic_arn: string_ option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the topic.\n"];
  preferred_maintenance_window: string_ option
    [@ocaml.doc
      "A range of time when maintenance of DAX cluster software will be performed. For example: [sun:01:00-sun:09:00]. Cluster maintenance normally takes less than 30 minutes, and is performed automatically within the maintenance window.\n"];
  description: string_ option
    [@ocaml.doc "A description of the changes being made to the cluster.\n"];
  cluster_name: string_
    [@ocaml.doc "The name of the DAX cluster to be modified.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec invalid_cluster_state_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The requested DAX cluster is not in the {i available} state.\n"]
type nonrec cluster_not_found_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The requested cluster ID does not refer to an existing DAX cluster.\n"]
type nonrec tag =
  {
  value: string_ option
    [@ocaml.doc
      "The value of the tag. Tag values are case-sensitive and can be null. \n"];
  key: string_ option
    [@ocaml.doc
      "The key for the tag. Tag keys are case sensitive. Every DAX cluster can only have one tag with the same key. If you try to add an existing tag (same key), the existing tag value will be updated to the new value.\n"]}
[@@ocaml.doc
  "A description of a tag. Every tag is a key-value pair. You can add up to 50 tags to a single DAX cluster.\n\n AWS-assigned tag names and values are automatically assigned the [aws:] prefix, which the user cannot assign. AWS-assigned tag names do not count towards the tag limit of 50. User-assigned tag names have the prefix [user:].\n \n  You cannot backdate the application of a tag.\n  "]
type nonrec tag_list = tag list[@@ocaml.doc ""]
type nonrec untag_resource_response =
  {
  tags: tag_list option
    [@ocaml.doc "The tag keys that have been removed from the cluster.\n"]}
[@@ocaml.doc ""]
type nonrec key_list = string_ list[@@ocaml.doc ""]
type nonrec untag_resource_request =
  {
  tag_keys: key_list
    [@ocaml.doc
      "A list of tag keys. If the DAX cluster has any tags with these keys, then the tags are removed from the cluster.\n"];
  resource_name: string_
    [@ocaml.doc
      "The name of the DAX resource from which the tags should be removed.\n"]}
[@@ocaml.doc ""]
type nonrec tag_not_found_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The tag does not exist.\n"]
type nonrec invalid_arn_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The Amazon Resource Name (ARN) supplied in the request is not valid.\n"]
type nonrec tag_resource_response =
  {
  tags: tag_list option
    [@ocaml.doc
      "The list of tags that are associated with the DAX resource.\n"]}
[@@ocaml.doc ""]
type nonrec tag_resource_request =
  {
  tags: tag_list
    [@ocaml.doc "The tags to be assigned to the DAX resource. \n"];
  resource_name: string_
    [@ocaml.doc
      "The name of the DAX resource to which tags should be added.\n"]}
[@@ocaml.doc ""]
type nonrec tag_quota_per_resource_exceeded =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "You have exceeded the maximum number of tags for this DAX cluster.\n"]
type nonrec subnet_group_quota_exceeded_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The request cannot be processed because it would exceed the allowed number of subnets in a subnet group.\n"]
type nonrec subnet_group_name_list = string_ list[@@ocaml.doc ""]
type nonrec subnet_group_list = subnet_group list[@@ocaml.doc ""]
type nonrec subnet_group_in_use_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The specified subnet group is currently in use.\n"]
type nonrec subnet_group_already_exists_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The specified subnet group already exists.\n"]
type nonrec source_type =
  | SUBNET_GROUP [@ocaml.doc ""]
  | PARAMETER_GROUP [@ocaml.doc ""]
  | CLUSTER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec service_quota_exceeded_exception = unit[@@ocaml.doc ""]
type nonrec sse_enabled = bool[@@ocaml.doc ""]
type nonrec sse_specification =
  {
  enabled: sse_enabled
    [@ocaml.doc
      "Indicates whether server-side encryption is enabled (true) or disabled (false) on the cluster.\n"]}
[@@ocaml.doc
  "Represents the settings used to enable server-side encryption.\n"]
type nonrec reboot_node_response =
  {
  cluster: cluster option
    [@ocaml.doc
      "A description of the DAX cluster after a node has been rebooted.\n"]}
[@@ocaml.doc ""]
type nonrec reboot_node_request =
  {
  node_id: string_
    [@ocaml.doc "The system-assigned ID of the node to be rebooted.\n"];
  cluster_name: string_
    [@ocaml.doc
      "The name of the DAX cluster containing the node to be rebooted.\n"]}
[@@ocaml.doc ""]
type nonrec node_not_found_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "None of the nodes in the cluster have the given node ID.\n"]
type nonrec parameter_type =
  | NODE_TYPE_SPECIFIC [@ocaml.doc ""]
  | DEFAULT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec node_type_specific_value =
  {
  value: string_ option
    [@ocaml.doc "The parameter value for this node type.\n"];
  node_type: string_ option
    [@ocaml.doc "A node type to which the parameter value applies.\n"]}
[@@ocaml.doc
  "Represents a parameter value that is applicable to a particular node type.\n"]
type nonrec node_type_specific_value_list = node_type_specific_value list
[@@ocaml.doc ""]
type nonrec is_modifiable =
  | CONDITIONAL [@ocaml.doc ""]
  | FALSE [@ocaml.doc ""]
  | TRUE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec change_type =
  | REQUIRES_REBOOT [@ocaml.doc ""]
  | IMMEDIATE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec parameter =
  {
  change_type: change_type option
    [@ocaml.doc
      "The conditions under which changes to this parameter can be applied. For example, [requires-reboot] indicates that a new value for this parameter will only take effect if a node is rebooted.\n"];
  is_modifiable: is_modifiable option
    [@ocaml.doc "Whether the customer is allowed to modify the parameter.\n"];
  allowed_values: string_ option
    [@ocaml.doc "A range of values within which the parameter can be set.\n"];
  data_type: string_ option
    [@ocaml.doc "The data type of the parameter. For example, [integer]:\n"];
  source: string_ option
    [@ocaml.doc
      "How the parameter is defined. For example, [system] denotes a system-defined parameter.\n"];
  description: string_ option [@ocaml.doc "A description of the parameter\n"];
  node_type_specific_values: node_type_specific_value_list option
    [@ocaml.doc
      "A list of node types, and specific parameter values for each node.\n"];
  parameter_value: string_ option
    [@ocaml.doc "The value for the parameter.\n"];
  parameter_type: parameter_type option
    [@ocaml.doc
      "Determines whether the parameter can be applied to any nodes, or only nodes of a particular type.\n"];
  parameter_name: string_ option [@ocaml.doc "The name of the parameter.\n"]}
[@@ocaml.doc
  "Describes an individual setting that controls some aspect of DAX behavior.\n"]
type nonrec parameter_list = parameter list[@@ocaml.doc ""]
type nonrec parameter_group_quota_exceeded_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "You have attempted to exceed the maximum number of parameter groups.\n"]
type nonrec parameter_group_name_list = string_ list[@@ocaml.doc ""]
type nonrec parameter_group_list = parameter_group list[@@ocaml.doc ""]
type nonrec parameter_group_already_exists_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The specified parameter group already exists.\n"]
type nonrec node_quota_for_customer_exceeded_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "You have attempted to exceed the maximum number of nodes for your AWS account.\n"]
type nonrec node_quota_for_cluster_exceeded_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "You have attempted to exceed the maximum number of nodes for a DAX cluster.\n"]
type nonrec list_tags_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "If this value is present, there are additional results to be displayed. To retrieve them, call [ListTags] again, with [NextToken] set to this value.\n"];
  tags: tag_list option
    [@ocaml.doc
      "A list of tags currently associated with the DAX cluster.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token.\n"];
  resource_name: string_
    [@ocaml.doc "The name of the DAX resource to which the tags belong.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_vpc_network_state_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The VPC network is in an invalid state.\n"]
type nonrec insufficient_cluster_capacity_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "There are not enough system resources to create the cluster you requested (or to resize an already-existing cluster). \n"]
type nonrec increase_replication_factor_response =
  {
  cluster: cluster option
    [@ocaml.doc
      "A description of the DAX cluster. with its new replication factor.\n"]}
[@@ocaml.doc ""]
type nonrec availability_zone_list = string_ list[@@ocaml.doc ""]
type nonrec increase_replication_factor_request =
  {
  availability_zones: availability_zone_list option
    [@ocaml.doc
      "The Availability Zones (AZs) in which the cluster nodes will be created. All nodes belonging to the cluster are placed in these Availability Zones. Use this parameter if you want to distribute the nodes across multiple AZs.\n"];
  new_replication_factor: integer
    [@ocaml.doc "The new number of nodes for the DAX cluster.\n"];
  cluster_name: string_
    [@ocaml.doc
      "The name of the DAX cluster that will receive additional nodes.\n"]}
[@@ocaml.doc ""]
type nonrec event =
  {
  date: t_stamp option
    [@ocaml.doc "The date and time when the event occurred.\n"];
  message: string_ option
    [@ocaml.doc "A user-defined message associated with the event.\n"];
  source_type: source_type option
    [@ocaml.doc
      "Specifies the origin of this event - a cluster, a parameter group, a node ID, etc.\n"];
  source_name: string_ option
    [@ocaml.doc
      "The source of the event. For example, if the event occurred at the node level, the source would be the node ID.\n"]}
[@@ocaml.doc
  "Represents a single occurrence of something interesting within the system. Some examples of events are creating a DAX cluster, adding or removing a node, or rebooting a node.\n"]
type nonrec event_list = event list[@@ocaml.doc ""]
type nonrec describe_subnet_groups_response =
  {
  subnet_groups: subnet_group_list option
    [@ocaml.doc
      "An array of subnet groups. Each element in the array represents a single subnet group.\n"];
  next_token: string_ option
    [@ocaml.doc
      "Provides an identifier to allow retrieval of paginated results.\n"]}
[@@ocaml.doc ""]
type nonrec describe_subnet_groups_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by [MaxResults].\n"];
  max_results: integer_optional option
    [@ocaml.doc
      "The maximum number of results to include in the response. If more results exist than the specified [MaxResults] value, a token is included in the response so that the remaining results can be retrieved.\n\n The value for [MaxResults] must be between 20 and 100.\n "];
  subnet_group_names: subnet_group_name_list option
    [@ocaml.doc "The name of the subnet group.\n"]}[@@ocaml.doc ""]
type nonrec describe_parameters_response =
  {
  parameters: parameter_list option
    [@ocaml.doc
      "A list of parameters within a parameter group. Each element in the list represents one parameter.\n"];
  next_token: string_ option
    [@ocaml.doc
      "Provides an identifier to allow retrieval of paginated results.\n"]}
[@@ocaml.doc ""]
type nonrec describe_parameters_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by [MaxResults].\n"];
  max_results: integer_optional option
    [@ocaml.doc
      "The maximum number of results to include in the response. If more results exist than the specified [MaxResults] value, a token is included in the response so that the remaining results can be retrieved.\n\n The value for [MaxResults] must be between 20 and 100.\n "];
  source: string_ option
    [@ocaml.doc
      "How the parameter is defined. For example, [system] denotes a system-defined parameter.\n"];
  parameter_group_name: string_
    [@ocaml.doc "The name of the parameter group.\n"]}[@@ocaml.doc ""]
type nonrec describe_parameter_groups_response =
  {
  parameter_groups: parameter_group_list option
    [@ocaml.doc
      "An array of parameter groups. Each element in the array represents one parameter group.\n"];
  next_token: string_ option
    [@ocaml.doc
      "Provides an identifier to allow retrieval of paginated results.\n"]}
[@@ocaml.doc ""]
type nonrec describe_parameter_groups_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by [MaxResults].\n"];
  max_results: integer_optional option
    [@ocaml.doc
      "The maximum number of results to include in the response. If more results exist than the specified [MaxResults] value, a token is included in the response so that the remaining results can be retrieved.\n\n The value for [MaxResults] must be between 20 and 100.\n "];
  parameter_group_names: parameter_group_name_list option
    [@ocaml.doc "The names of the parameter groups.\n"]}[@@ocaml.doc ""]
type nonrec describe_events_response =
  {
  events: event_list option
    [@ocaml.doc
      "An array of events. Each element in the array represents one event.\n"];
  next_token: string_ option
    [@ocaml.doc
      "Provides an identifier to allow retrieval of paginated results.\n"]}
[@@ocaml.doc ""]
type nonrec describe_events_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by [MaxResults].\n"];
  max_results: integer_optional option
    [@ocaml.doc
      "The maximum number of results to include in the response. If more results exist than the specified [MaxResults] value, a token is included in the response so that the remaining results can be retrieved.\n\n The value for [MaxResults] must be between 20 and 100.\n "];
  duration: integer_optional option
    [@ocaml.doc "The number of minutes' worth of events to retrieve.\n"];
  end_time: t_stamp option
    [@ocaml.doc
      "The end of the time interval for which to retrieve events, specified in ISO 8601 format.\n"];
  start_time: t_stamp option
    [@ocaml.doc
      "The beginning of the time interval to retrieve events for, specified in ISO 8601 format.\n"];
  source_type: source_type option
    [@ocaml.doc
      "The event source to retrieve events for. If no value is specified, all events are returned.\n"];
  source_name: string_ option
    [@ocaml.doc
      "The identifier of the event source for which events will be returned. If not specified, then all sources are included in the response.\n"]}
[@@ocaml.doc ""]
type nonrec describe_default_parameters_response =
  {
  parameters: parameter_list option
    [@ocaml.doc
      "A list of parameters. Each element in the list represents one parameter.\n"];
  next_token: string_ option
    [@ocaml.doc
      "Provides an identifier to allow retrieval of paginated results.\n"]}
[@@ocaml.doc ""]
type nonrec describe_default_parameters_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by [MaxResults].\n"];
  max_results: integer_optional option
    [@ocaml.doc
      "The maximum number of results to include in the response. If more results exist than the specified [MaxResults] value, a token is included in the response so that the remaining results can be retrieved.\n\n The value for [MaxResults] must be between 20 and 100.\n "]}
[@@ocaml.doc ""]
type nonrec cluster_list = cluster list[@@ocaml.doc ""]
type nonrec describe_clusters_response =
  {
  clusters: cluster_list option
    [@ocaml.doc
      "The descriptions of your DAX clusters, in response to a {i DescribeClusters} request.\n"];
  next_token: string_ option
    [@ocaml.doc
      "Provides an identifier to allow retrieval of paginated results.\n"]}
[@@ocaml.doc ""]
type nonrec cluster_name_list = string_ list[@@ocaml.doc ""]
type nonrec describe_clusters_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by [MaxResults].\n"];
  max_results: integer_optional option
    [@ocaml.doc
      "The maximum number of results to include in the response. If more results exist than the specified [MaxResults] value, a token is included in the response so that the remaining results can be retrieved.\n\n The value for [MaxResults] must be between 20 and 100.\n "];
  cluster_names: cluster_name_list option
    [@ocaml.doc "The names of the DAX clusters being described.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_subnet_group_response =
  {
  deletion_message: string_ option
    [@ocaml.doc
      "A user-specified message for this action (i.e., a reason for deleting the subnet group).\n"]}
[@@ocaml.doc ""]
type nonrec delete_subnet_group_request =
  {
  subnet_group_name: string_
    [@ocaml.doc "The name of the subnet group to delete.\n"]}[@@ocaml.doc ""]
type nonrec delete_parameter_group_response =
  {
  deletion_message: string_ option
    [@ocaml.doc
      "A user-specified message for this action (i.e., a reason for deleting the parameter group).\n"]}
[@@ocaml.doc ""]
type nonrec delete_parameter_group_request =
  {
  parameter_group_name: string_
    [@ocaml.doc "The name of the parameter group to delete.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec delete_cluster_response =
  {
  cluster: cluster option
    [@ocaml.doc "A description of the DAX cluster that is being deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_cluster_request =
  {
  cluster_name: string_
    [@ocaml.doc "The name of the cluster to be deleted.\n"]}[@@ocaml.doc ""]
type nonrec decrease_replication_factor_response =
  {
  cluster: cluster option
    [@ocaml.doc
      "A description of the DAX cluster, after you have decreased its replication factor.\n"]}
[@@ocaml.doc ""]
type nonrec decrease_replication_factor_request =
  {
  node_ids_to_remove: node_identifier_list option
    [@ocaml.doc
      "The unique identifiers of the nodes to be removed from the cluster.\n"];
  availability_zones: availability_zone_list option
    [@ocaml.doc "The Availability Zone(s) from which to remove nodes.\n"];
  new_replication_factor: integer
    [@ocaml.doc "The new number of nodes for the DAX cluster.\n"];
  cluster_name: string_
    [@ocaml.doc
      "The name of the DAX cluster from which you want to remove nodes.\n"]}
[@@ocaml.doc ""]
type nonrec create_subnet_group_response =
  {
  subnet_group: subnet_group option
    [@ocaml.doc
      "Represents the output of a {i CreateSubnetGroup} operation.\n"]}
[@@ocaml.doc ""]
type nonrec create_subnet_group_request =
  {
  subnet_ids: subnet_identifier_list
    [@ocaml.doc "A list of VPC subnet IDs for the subnet group.\n"];
  description: string_ option
    [@ocaml.doc "A description for the subnet group\n"];
  subnet_group_name: string_
    [@ocaml.doc
      "A name for the subnet group. This value is stored as a lowercase string. \n"]}
[@@ocaml.doc ""]
type nonrec create_parameter_group_response =
  {
  parameter_group: parameter_group option
    [@ocaml.doc
      "Represents the output of a {i CreateParameterGroup} action.\n"]}
[@@ocaml.doc ""]
type nonrec create_parameter_group_request =
  {
  description: string_ option
    [@ocaml.doc "A description of the parameter group.\n"];
  parameter_group_name: string_
    [@ocaml.doc
      "The name of the parameter group to apply to all of the clusters in this replication group.\n"]}
[@@ocaml.doc ""]
type nonrec create_cluster_response =
  {
  cluster: cluster option
    [@ocaml.doc "A description of the DAX cluster that you have created.\n"]}
[@@ocaml.doc ""]
type nonrec create_cluster_request =
  {
  cluster_endpoint_encryption_type: cluster_endpoint_encryption_type option
    [@ocaml.doc
      "The type of encryption the cluster's endpoint should support. Values are:\n\n {ul\n       {-   [NONE] for no encryption\n           \n            }\n       {-   [TLS] for Transport Layer Security\n           \n            }\n       }\n  "];
  sse_specification: sse_specification option
    [@ocaml.doc
      "Represents the settings used to enable server-side encryption on the cluster.\n"];
  tags: tag_list option
    [@ocaml.doc "A set of tags to associate with the DAX cluster. \n"];
  parameter_group_name: string_ option
    [@ocaml.doc
      "The parameter group to be associated with the DAX cluster.\n"];
  iam_role_arn: string_
    [@ocaml.doc
      "A valid Amazon Resource Name (ARN) that identifies an IAM role. At runtime, DAX will assume this role and use the role's permissions to access DynamoDB on your behalf.\n"];
  notification_topic_arn: string_ option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Amazon SNS topic to which notifications will be sent.\n\n  The Amazon SNS topic owner must be same as the DAX cluster owner.\n  \n   "];
  preferred_maintenance_window: string_ option
    [@ocaml.doc
      "Specifies the weekly time range during which maintenance on the DAX cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Valid values for [ddd] are:\n\n {ul\n       {-   [sun] \n           \n            }\n       {-   [mon] \n           \n            }\n       {-   [tue] \n           \n            }\n       {-   [wed] \n           \n            }\n       {-   [thu] \n           \n            }\n       {-   [fri] \n           \n            }\n       {-   [sat] \n           \n            }\n       }\n   Example: [sun:05:00-sun:09:00] \n   \n     If you don't specify a preferred maintenance window when you create or modify a cache cluster, DAX assigns a 60-minute maintenance window on a randomly selected day of the week.\n     \n      "];
  security_group_ids: security_group_identifier_list option
    [@ocaml.doc
      "A list of security group IDs to be assigned to each node in the DAX cluster. (Each of the security group ID is system-generated.)\n\n If this parameter is not specified, DAX assigns the default VPC security group to each node.\n "];
  subnet_group_name: string_ option
    [@ocaml.doc
      "The name of the subnet group to be used for the replication group.\n\n  DAX clusters can only run in an Amazon VPC environment. All of the subnets that you specify in a subnet group must exist in the same VPC.\n  \n   "];
  availability_zones: availability_zone_list option
    [@ocaml.doc
      "The Availability Zones (AZs) in which the cluster nodes will reside after the cluster has been created or updated. If provided, the length of this list must equal the [ReplicationFactor] parameter. If you omit this parameter, DAX will spread the nodes across Availability Zones for the highest availability.\n"];
  replication_factor: integer
    [@ocaml.doc
      "The number of nodes in the DAX cluster. A replication factor of 1 will create a single-node cluster, without any read replicas. For additional fault tolerance, you can create a multiple node cluster with one or more read replicas. To do this, set [ReplicationFactor] to a number between 3 (one primary and two read replicas) and 10 (one primary and nine read replicas). [If the AvailabilityZones] parameter is provided, its length must equal the [ReplicationFactor].\n\n  AWS recommends that you have at least two read replicas per cluster.\n  \n   "];
  description: string_ option [@ocaml.doc "A description of the cluster.\n"];
  node_type: string_
    [@ocaml.doc
      "The compute and memory capacity of the nodes in the cluster.\n"];
  cluster_name: string_
    [@ocaml.doc
      "The cluster identifier. This parameter is stored as a lowercase string.\n\n  {b Constraints:} \n \n  {ul\n        {-  A name must contain from 1 to 20 alphanumeric characters or hyphens.\n            \n             }\n        {-  The first character must be a letter.\n            \n             }\n        {-  A name cannot end with a hyphen or contain two consecutive hyphens.\n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec cluster_quota_for_customer_exceeded_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "You have attempted to exceed the maximum number of DAX clusters for your AWS account.\n"]
type nonrec cluster_already_exists_fault =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "You already have a DAX cluster with the given identifier.\n"]