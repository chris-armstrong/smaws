open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "dax";
      endpointPrefix = "dax";
      version = "2017-04-19";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec string_ = unit
type nonrec subnet =
  {
  subnet_availability_zone: string option ;
  subnet_identifier: string option }
type nonrec subnet_list = unit
type nonrec subnet_group =
  {
  subnets: subnet list option ;
  vpc_id: string option ;
  description: string option ;
  subnet_group_name: string option }
type nonrec update_subnet_group_response =
  {
  subnet_group: subnet_group option }
type nonrec subnet_identifier_list = unit
type nonrec update_subnet_group_request =
  {
  subnet_ids: string list option ;
  description: string option ;
  subnet_group_name: string }
type nonrec exception_message = unit
type nonrec subnet_quota_exceeded_fault = {
  message: string option }
type nonrec subnet_in_use = {
  message: string option }
type nonrec subnet_group_not_found_fault = {
  message: string option }
type nonrec service_linked_role_not_found_fault = {
  message: string option }
type nonrec invalid_subnet = {
  message: string option }
type nonrec parameter_group =
  {
  description: string option ;
  parameter_group_name: string option }
type nonrec update_parameter_group_response =
  {
  parameter_group: parameter_group option }
type nonrec parameter_name_value =
  {
  parameter_value: string option ;
  parameter_name: string option }
type nonrec parameter_name_value_list = unit
type nonrec update_parameter_group_request =
  {
  parameter_name_values: parameter_name_value list ;
  parameter_group_name: string }
type nonrec parameter_group_not_found_fault = {
  message: string option }
type nonrec aws_query_error_message = unit
type nonrec invalid_parameter_value_exception = {
  message: string option }
type nonrec invalid_parameter_group_state_fault = {
  message: string option }
type nonrec invalid_parameter_combination_exception =
  {
  message: string option }
type nonrec integer_optional = unit
type nonrec integer_ = unit
type nonrec endpoint =
  {
  ur_l: string option ;
  port: int option ;
  address: string option }
type nonrec node_identifier_list = unit
type nonrec t_stamp = unit
type nonrec node =
  {
  parameter_group_status: string option ;
  node_status: string option ;
  availability_zone: string option ;
  node_create_time: Timestamp.t option ;
  endpoint: endpoint option ;
  node_id: string option }
type nonrec node_list = unit
type nonrec notification_configuration =
  {
  topic_status: string option ;
  topic_arn: string option }
type nonrec security_group_membership =
  {
  status: string option ;
  security_group_identifier: string option }
type nonrec security_group_membership_list = unit
type nonrec parameter_group_status =
  {
  node_ids_to_reboot: string list option ;
  parameter_apply_status: string option ;
  parameter_group_name: string option }
type nonrec base_unit = unit
type nonrec sse_status =
  | DISABLED 
  | DISABLING 
  | ENABLED 
  | ENABLING 
type nonrec sse_description = {
  status: sse_status option }
type nonrec cluster_endpoint_encryption_type =
  | TLS 
  | NONE 
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
  cluster_name: string option }
type nonrec update_cluster_response = {
  cluster: cluster option }
type nonrec security_group_identifier_list = unit
type nonrec update_cluster_request =
  {
  security_group_ids: string list option ;
  parameter_group_name: string option ;
  notification_topic_status: string option ;
  notification_topic_arn: string option ;
  preferred_maintenance_window: string option ;
  description: string option ;
  cluster_name: string }
type nonrec invalid_cluster_state_fault = {
  message: string option }
type nonrec cluster_not_found_fault = {
  message: string option }
type nonrec tag = {
  value: string option ;
  key: string option }
type nonrec tag_list = unit
type nonrec untag_resource_response = {
  tags: tag list option }
type nonrec key_list = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_name: string }
type nonrec tag_not_found_fault = {
  message: string option }
type nonrec invalid_arn_fault = {
  message: string option }
type nonrec tag_resource_response = {
  tags: tag list option }
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_name: string }
type nonrec tag_quota_per_resource_exceeded = {
  message: string option }
type nonrec subnet_group_quota_exceeded_fault = {
  message: string option }
type nonrec subnet_group_name_list = unit
type nonrec subnet_group_list = unit
type nonrec subnet_group_in_use_fault = {
  message: string option }
type nonrec subnet_group_already_exists_fault = {
  message: string option }
type nonrec source_type =
  | SUBNET_GROUP 
  | PARAMETER_GROUP 
  | CLUSTER 
type nonrec service_quota_exceeded_exception = unit
type nonrec sse_enabled = unit
type nonrec sse_specification = {
  enabled: bool }
type nonrec reboot_node_response = {
  cluster: cluster option }
type nonrec reboot_node_request = {
  node_id: string ;
  cluster_name: string }
type nonrec node_not_found_fault = {
  message: string option }
type nonrec parameter_type =
  | NODE_TYPE_SPECIFIC 
  | DEFAULT 
type nonrec node_type_specific_value =
  {
  value: string option ;
  node_type: string option }
type nonrec node_type_specific_value_list = unit
type nonrec is_modifiable =
  | CONDITIONAL 
  | FALSE 
  | TRUE 
type nonrec change_type =
  | REQUIRES_REBOOT 
  | IMMEDIATE 
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
  parameter_name: string option }
type nonrec parameter_list = unit
type nonrec parameter_group_quota_exceeded_fault = {
  message: string option }
type nonrec parameter_group_name_list = unit
type nonrec parameter_group_list = unit
type nonrec parameter_group_already_exists_fault = {
  message: string option }
type nonrec node_quota_for_customer_exceeded_fault =
  {
  message: string option }
type nonrec node_quota_for_cluster_exceeded_fault = {
  message: string option }
type nonrec list_tags_response =
  {
  next_token: string option ;
  tags: tag list option }
type nonrec list_tags_request =
  {
  next_token: string option ;
  resource_name: string }
type nonrec invalid_vpc_network_state_fault = {
  message: string option }
type nonrec insufficient_cluster_capacity_fault = {
  message: string option }
type nonrec increase_replication_factor_response = {
  cluster: cluster option }
type nonrec availability_zone_list = unit
type nonrec increase_replication_factor_request =
  {
  availability_zones: string list option ;
  new_replication_factor: int ;
  cluster_name: string }
type nonrec event =
  {
  date: Timestamp.t option ;
  message: string option ;
  source_type: source_type option ;
  source_name: string option }
type nonrec event_list = unit
type nonrec describe_subnet_groups_response =
  {
  subnet_groups: subnet_group list option ;
  next_token: string option }
type nonrec describe_subnet_groups_request =
  {
  next_token: string option ;
  max_results: int option ;
  subnet_group_names: string list option }
type nonrec describe_parameters_response =
  {
  parameters: parameter list option ;
  next_token: string option }
type nonrec describe_parameters_request =
  {
  next_token: string option ;
  max_results: int option ;
  source: string option ;
  parameter_group_name: string }
type nonrec describe_parameter_groups_response =
  {
  parameter_groups: parameter_group list option ;
  next_token: string option }
type nonrec describe_parameter_groups_request =
  {
  next_token: string option ;
  max_results: int option ;
  parameter_group_names: string list option }
type nonrec describe_events_response =
  {
  events: event list option ;
  next_token: string option }
type nonrec describe_events_request =
  {
  next_token: string option ;
  max_results: int option ;
  duration: int option ;
  end_time: Timestamp.t option ;
  start_time: Timestamp.t option ;
  source_type: source_type option ;
  source_name: string option }
type nonrec describe_default_parameters_response =
  {
  parameters: parameter list option ;
  next_token: string option }
type nonrec describe_default_parameters_request =
  {
  next_token: string option ;
  max_results: int option }
type nonrec cluster_list = unit
type nonrec describe_clusters_response =
  {
  clusters: cluster list option ;
  next_token: string option }
type nonrec cluster_name_list = unit
type nonrec describe_clusters_request =
  {
  next_token: string option ;
  max_results: int option ;
  cluster_names: string list option }
type nonrec delete_subnet_group_response = {
  deletion_message: string option }
type nonrec delete_subnet_group_request = {
  subnet_group_name: string }
type nonrec delete_parameter_group_response =
  {
  deletion_message: string option }
type nonrec delete_parameter_group_request = {
  parameter_group_name: string }
type nonrec delete_cluster_response = {
  cluster: cluster option }
type nonrec delete_cluster_request = {
  cluster_name: string }
type nonrec decrease_replication_factor_response = {
  cluster: cluster option }
type nonrec decrease_replication_factor_request =
  {
  node_ids_to_remove: string list option ;
  availability_zones: string list option ;
  new_replication_factor: int ;
  cluster_name: string }
type nonrec create_subnet_group_response =
  {
  subnet_group: subnet_group option }
type nonrec create_subnet_group_request =
  {
  subnet_ids: string list ;
  description: string option ;
  subnet_group_name: string }
type nonrec create_parameter_group_response =
  {
  parameter_group: parameter_group option }
type nonrec create_parameter_group_request =
  {
  description: string option ;
  parameter_group_name: string }
type nonrec create_cluster_response = {
  cluster: cluster option }
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
  cluster_name: string }
type nonrec cluster_quota_for_customer_exceeded_fault =
  {
  message: string option }
type nonrec cluster_already_exists_fault = {
  message: string option }
type nonrec amazon_dax_v3 = unit
type nonrec base_string = unit
type nonrec base_boolean = unit
type nonrec base_integer = unit
type nonrec base_timestamp = unit
type nonrec base_long = unit
type nonrec base_document = unit