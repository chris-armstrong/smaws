open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "dax";
      endpointPrefix = "dax";
      version = "2017-04-19";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec subnet =
  {
  subnet_availability_zone: string option ;
  subnet_identifier: string option }[@@ocaml.doc
                                      "Represents the subnet associated with a DAX cluster. This parameter refers to subnets defined in Amazon Virtual Private Cloud (Amazon VPC) and used with DAX.\n"]
type nonrec subnet_group =
  {
  subnets: subnet list option ;
  vpc_id: string option ;
  description: string option ;
  subnet_group_name: string option }[@@ocaml.doc
                                      "Represents the output of one of the following actions:\n\n {ul\n       {-   {i CreateSubnetGroup} \n           \n            }\n       {-   {i ModifySubnetGroup} \n           \n            }\n       }\n  "]
type nonrec update_subnet_group_response =
  {
  subnet_group: subnet_group option }[@@ocaml.doc ""]
type nonrec update_subnet_group_request =
  {
  subnet_ids: string list option ;
  description: string option ;
  subnet_group_name: string }[@@ocaml.doc ""]
type nonrec subnet_quota_exceeded_fault = {
  message: string option }[@@ocaml.doc
                            "The request cannot be processed because it would exceed the allowed number of subnets in a subnet group.\n"]
type nonrec subnet_in_use = {
  message: string option }[@@ocaml.doc
                            "The requested subnet is being used by another subnet group.\n"]
type nonrec subnet_group_not_found_fault = {
  message: string option }[@@ocaml.doc
                            "The requested subnet group name does not refer to an existing subnet group.\n"]
type nonrec service_linked_role_not_found_fault = {
  message: string option }[@@ocaml.doc
                            "The specified service linked role (SLR) was not found.\n"]
type nonrec invalid_subnet = {
  message: string option }[@@ocaml.doc
                            "An invalid subnet identifier was specified.\n"]
type nonrec parameter_group =
  {
  description: string option ;
  parameter_group_name: string option }[@@ocaml.doc
                                         "A named set of parameters that are applied to all of the nodes in a DAX cluster.\n"]
type nonrec update_parameter_group_response =
  {
  parameter_group: parameter_group option }[@@ocaml.doc ""]
type nonrec parameter_name_value =
  {
  parameter_value: string option ;
  parameter_name: string option }[@@ocaml.doc
                                   "An individual DAX parameter.\n"]
type nonrec update_parameter_group_request =
  {
  parameter_name_values: parameter_name_value list ;
  parameter_group_name: string }[@@ocaml.doc ""]
type nonrec parameter_group_not_found_fault = {
  message: string option }[@@ocaml.doc
                            "The specified parameter group does not exist.\n"]
type nonrec invalid_parameter_value_exception = {
  message: string option }[@@ocaml.doc
                            "The value for a parameter is invalid.\n"]
type nonrec invalid_parameter_group_state_fault = {
  message: string option }[@@ocaml.doc
                            "One or more parameters in a parameter group are in an invalid state.\n"]
type nonrec invalid_parameter_combination_exception =
  {
  message: string option }[@@ocaml.doc
                            "Two or more incompatible parameters were specified.\n"]
type nonrec endpoint =
  {
  ur_l: string option ;
  port: int option ;
  address: string option }[@@ocaml.doc
                            "Represents the information required for client programs to connect to the endpoint for a DAX cluster.\n"]
type nonrec node =
  {
  parameter_group_status: string option ;
  node_status: string option ;
  availability_zone: string option ;
  node_create_time: CoreTypes.Timestamp.t option ;
  endpoint: endpoint option ;
  node_id: string option }[@@ocaml.doc
                            "Represents an individual node within a DAX cluster.\n"]
type nonrec notification_configuration =
  {
  topic_status: string option ;
  topic_arn: string option }[@@ocaml.doc
                              "Describes a notification topic and its status. Notification topics are used for publishing DAX events to subscribers using Amazon Simple Notification Service (SNS).\n"]
type nonrec security_group_membership =
  {
  status: string option ;
  security_group_identifier: string option }[@@ocaml.doc
                                              "An individual VPC security group and its status.\n"]
type nonrec parameter_group_status =
  {
  node_ids_to_reboot: string list option ;
  parameter_apply_status: string option ;
  parameter_group_name: string option }[@@ocaml.doc
                                         "The status of a parameter group.\n"]
type nonrec sse_status =
  | DISABLED 
  | DISABLING 
  | ENABLED 
  | ENABLING [@@ocaml.doc ""]
type nonrec sse_description = {
  status: sse_status option }[@@ocaml.doc
                               "The description of the server-side encryption status on the specified DAX cluster.\n"]
type nonrec cluster_endpoint_encryption_type =
  | TLS 
  | NONE [@@ocaml.doc ""]
type nonrec cluster =
  {
  cluster_endpoint_encryption_type: cluster_endpoint_encryption_type option ;
  sse_description: sse_description option ;
  parameter_group: parameter_group_status option ;
  iam_role_arn: string option ;
  security_groups: security_group_membership list option ;
  subnet_group: string option ;
  notification_configuration: notification_configuration option ;
  preferred_maintenance_window: string option ;
  nodes: node list option ;
  node_ids_to_remove: string list option ;
  cluster_discovery_endpoint: endpoint option ;
  status: string option ;
  node_type: string option ;
  active_nodes: int option ;
  total_nodes: int option ;
  cluster_arn: string option ;
  description: string option ;
  cluster_name: string option }[@@ocaml.doc
                                 "Contains all of the attributes of a specific DAX cluster.\n"]
type nonrec update_cluster_response = {
  cluster: cluster option }[@@ocaml.doc ""]
type nonrec update_cluster_request =
  {
  security_group_ids: string list option ;
  parameter_group_name: string option ;
  notification_topic_status: string option ;
  notification_topic_arn: string option ;
  preferred_maintenance_window: string option ;
  description: string option ;
  cluster_name: string }[@@ocaml.doc ""]
type nonrec invalid_cluster_state_fault = {
  message: string option }[@@ocaml.doc
                            "The requested DAX cluster is not in the {i available} state.\n"]
type nonrec cluster_not_found_fault = {
  message: string option }[@@ocaml.doc
                            "The requested cluster ID does not refer to an existing DAX cluster.\n"]
type nonrec tag = {
  value: string option ;
  key: string option }[@@ocaml.doc
                        "A description of a tag. Every tag is a key-value pair. You can add up to 50 tags to a single DAX cluster.\n\n AWS-assigned tag names and values are automatically assigned the [aws:] prefix, which the user cannot assign. AWS-assigned tag names do not count towards the tag limit of 50. User-assigned tag names have the prefix [user:].\n \n  You cannot backdate the application of a tag.\n  "]
type nonrec untag_resource_response = {
  tags: tag list option }[@@ocaml.doc ""]
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_name: string }[@@ocaml.doc ""]
type nonrec tag_not_found_fault = {
  message: string option }[@@ocaml.doc "The tag does not exist.\n"]
type nonrec invalid_arn_fault = {
  message: string option }[@@ocaml.doc
                            "The Amazon Resource Name (ARN) supplied in the request is not valid.\n"]
type nonrec tag_resource_response = {
  tags: tag list option }[@@ocaml.doc ""]
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_name: string }[@@ocaml.doc ""]
type nonrec tag_quota_per_resource_exceeded = {
  message: string option }[@@ocaml.doc
                            "You have exceeded the maximum number of tags for this DAX cluster.\n"]
type nonrec subnet_group_quota_exceeded_fault = {
  message: string option }[@@ocaml.doc
                            "The request cannot be processed because it would exceed the allowed number of subnets in a subnet group.\n"]
type nonrec subnet_group_in_use_fault = {
  message: string option }[@@ocaml.doc
                            "The specified subnet group is currently in use.\n"]
type nonrec subnet_group_already_exists_fault = {
  message: string option }[@@ocaml.doc
                            "The specified subnet group already exists.\n"]
type nonrec source_type =
  | SUBNET_GROUP 
  | PARAMETER_GROUP 
  | CLUSTER [@@ocaml.doc ""]
type nonrec service_quota_exceeded_exception = unit
type nonrec sse_specification = {
  enabled: bool }[@@ocaml.doc
                   "Represents the settings used to enable server-side encryption.\n"]
type nonrec reboot_node_response = {
  cluster: cluster option }[@@ocaml.doc ""]
type nonrec reboot_node_request = {
  node_id: string ;
  cluster_name: string }[@@ocaml.doc ""]
type nonrec node_not_found_fault = {
  message: string option }[@@ocaml.doc
                            "None of the nodes in the cluster have the given node ID.\n"]
type nonrec parameter_type =
  | NODE_TYPE_SPECIFIC 
  | DEFAULT [@@ocaml.doc ""]
type nonrec node_type_specific_value =
  {
  value: string option ;
  node_type: string option }[@@ocaml.doc
                              "Represents a parameter value that is applicable to a particular node type.\n"]
type nonrec is_modifiable =
  | CONDITIONAL 
  | FALSE 
  | TRUE [@@ocaml.doc ""]
type nonrec change_type =
  | REQUIRES_REBOOT 
  | IMMEDIATE [@@ocaml.doc ""]
type nonrec parameter =
  {
  change_type: change_type option ;
  is_modifiable: is_modifiable option ;
  allowed_values: string option ;
  data_type: string option ;
  source: string option ;
  description: string option ;
  node_type_specific_values: node_type_specific_value list option ;
  parameter_value: string option ;
  parameter_type: parameter_type option ;
  parameter_name: string option }[@@ocaml.doc
                                   "Describes an individual setting that controls some aspect of DAX behavior.\n"]
type nonrec parameter_group_quota_exceeded_fault = {
  message: string option }[@@ocaml.doc
                            "You have attempted to exceed the maximum number of parameter groups.\n"]
type nonrec parameter_group_already_exists_fault = {
  message: string option }[@@ocaml.doc
                            "The specified parameter group already exists.\n"]
type nonrec node_quota_for_customer_exceeded_fault =
  {
  message: string option }[@@ocaml.doc
                            "You have attempted to exceed the maximum number of nodes for your AWS account.\n"]
type nonrec node_quota_for_cluster_exceeded_fault = {
  message: string option }[@@ocaml.doc
                            "You have attempted to exceed the maximum number of nodes for a DAX cluster.\n"]
type nonrec list_tags_response =
  {
  next_token: string option ;
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_request =
  {
  next_token: string option ;
  resource_name: string }[@@ocaml.doc ""]
type nonrec invalid_vpc_network_state_fault = {
  message: string option }[@@ocaml.doc
                            "The VPC network is in an invalid state.\n"]
type nonrec insufficient_cluster_capacity_fault = {
  message: string option }[@@ocaml.doc
                            "There are not enough system resources to create the cluster you requested (or to resize an already-existing cluster). \n"]
type nonrec increase_replication_factor_response = {
  cluster: cluster option }[@@ocaml.doc ""]
type nonrec increase_replication_factor_request =
  {
  availability_zones: string list option ;
  new_replication_factor: int ;
  cluster_name: string }[@@ocaml.doc ""]
type nonrec event =
  {
  date: CoreTypes.Timestamp.t option ;
  message: string option ;
  source_type: source_type option ;
  source_name: string option }[@@ocaml.doc
                                "Represents a single occurrence of something interesting within the system. Some examples of events are creating a DAX cluster, adding or removing a node, or rebooting a node.\n"]
type nonrec describe_subnet_groups_response =
  {
  subnet_groups: subnet_group list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec describe_subnet_groups_request =
  {
  next_token: string option ;
  max_results: int option ;
  subnet_group_names: string list option }[@@ocaml.doc ""]
type nonrec describe_parameters_response =
  {
  parameters: parameter list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec describe_parameters_request =
  {
  next_token: string option ;
  max_results: int option ;
  source: string option ;
  parameter_group_name: string }[@@ocaml.doc ""]
type nonrec describe_parameter_groups_response =
  {
  parameter_groups: parameter_group list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec describe_parameter_groups_request =
  {
  next_token: string option ;
  max_results: int option ;
  parameter_group_names: string list option }[@@ocaml.doc ""]
type nonrec describe_events_response =
  {
  events: event list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec describe_events_request =
  {
  next_token: string option ;
  max_results: int option ;
  duration: int option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  source_type: source_type option ;
  source_name: string option }[@@ocaml.doc ""]
type nonrec describe_default_parameters_response =
  {
  parameters: parameter list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec describe_default_parameters_request =
  {
  next_token: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec describe_clusters_response =
  {
  clusters: cluster list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec describe_clusters_request =
  {
  next_token: string option ;
  max_results: int option ;
  cluster_names: string list option }[@@ocaml.doc ""]
type nonrec delete_subnet_group_response = {
  deletion_message: string option }[@@ocaml.doc ""]
type nonrec delete_subnet_group_request = {
  subnet_group_name: string }[@@ocaml.doc ""]
type nonrec delete_parameter_group_response =
  {
  deletion_message: string option }[@@ocaml.doc ""]
type nonrec delete_parameter_group_request = {
  parameter_group_name: string }[@@ocaml.doc ""]
type nonrec delete_cluster_response = {
  cluster: cluster option }[@@ocaml.doc ""]
type nonrec delete_cluster_request = {
  cluster_name: string }[@@ocaml.doc ""]
type nonrec decrease_replication_factor_response = {
  cluster: cluster option }[@@ocaml.doc ""]
type nonrec decrease_replication_factor_request =
  {
  node_ids_to_remove: string list option ;
  availability_zones: string list option ;
  new_replication_factor: int ;
  cluster_name: string }[@@ocaml.doc ""]
type nonrec create_subnet_group_response =
  {
  subnet_group: subnet_group option }[@@ocaml.doc ""]
type nonrec create_subnet_group_request =
  {
  subnet_ids: string list ;
  description: string option ;
  subnet_group_name: string }[@@ocaml.doc ""]
type nonrec create_parameter_group_response =
  {
  parameter_group: parameter_group option }[@@ocaml.doc ""]
type nonrec create_parameter_group_request =
  {
  description: string option ;
  parameter_group_name: string }[@@ocaml.doc ""]
type nonrec create_cluster_response = {
  cluster: cluster option }[@@ocaml.doc ""]
type nonrec create_cluster_request =
  {
  cluster_endpoint_encryption_type: cluster_endpoint_encryption_type option ;
  sse_specification: sse_specification option ;
  tags: tag list option ;
  parameter_group_name: string option ;
  iam_role_arn: string ;
  notification_topic_arn: string option ;
  preferred_maintenance_window: string option ;
  security_group_ids: string list option ;
  subnet_group_name: string option ;
  availability_zones: string list option ;
  replication_factor: int ;
  description: string option ;
  node_type: string ;
  cluster_name: string }[@@ocaml.doc ""]
type nonrec cluster_quota_for_customer_exceeded_fault =
  {
  message: string option }[@@ocaml.doc
                            "You have attempted to exceed the maximum number of DAX clusters for your AWS account.\n"]
type nonrec cluster_already_exists_fault = {
  message: string option }[@@ocaml.doc
                            "You already have a DAX cluster with the given identifier.\n"]