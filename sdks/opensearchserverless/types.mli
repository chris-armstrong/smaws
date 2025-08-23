open Smaws_Lib
type nonrec vpc_endpoint_status =
  | PENDING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec vpc_endpoint_summary =
  {
  status: vpc_endpoint_status option
    [@ocaml.doc "The current status of the endpoint.\n"];
  name: string option [@ocaml.doc "The name of the endpoint.\n"];
  id: string option [@ocaml.doc "The unique identifier of the endpoint.\n"]}
[@@ocaml.doc "The VPC endpoint object.\n"]
type nonrec vpc_endpoint_filters =
  {
  status: vpc_endpoint_status option
    [@ocaml.doc "The current status of the endpoint.\n"]}[@@ocaml.doc
                                                           "Filter the results of a [ListVpcEndpoints] request.\n"]
type nonrec vpc_endpoint_error_detail =
  {
  error_code: string option
    [@ocaml.doc "The error code for the failed request.\n"];
  error_message: string option
    [@ocaml.doc "An error message describing the reason for the failure.\n"];
  id: string option
    [@ocaml.doc "The unique identifier of the VPC endpoint.\n"]}[@@ocaml.doc
                                                                  "Error information for a failed [BatchGetVpcEndpoint] request.\n"]
type nonrec vpc_endpoint_detail =
  {
  failure_message: string option
    [@ocaml.doc "A message associated with the failure code.\n"];
  failure_code: string option
    [@ocaml.doc "A failure code associated with the request.\n"];
  created_date: int option
    [@ocaml.doc "The date the endpoint was created.\n"];
  status: vpc_endpoint_status option
    [@ocaml.doc "The current status of the endpoint.\n"];
  security_group_ids: string list option
    [@ocaml.doc
      "The unique identifiers of the security groups that define the ports, protocols, and sources for inbound traffic that you are authorizing into your endpoint.\n"];
  subnet_ids: string list option
    [@ocaml.doc
      "The ID of the subnets from which you access OpenSearch Serverless.\n"];
  vpc_id: string option
    [@ocaml.doc
      "The ID of the VPC from which you access OpenSearch Serverless.\n"];
  name: string option [@ocaml.doc "The name of the endpoint.\n"];
  id: string option [@ocaml.doc "The unique identifier of the endpoint.\n"]}
[@@ocaml.doc
  "Details about an OpenSearch Serverless-managed interface endpoint.\n"]
type nonrec validation_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Thrown when the HTTP request contains invalid input or is missing required input.\n"]
type nonrec update_vpc_endpoint_detail =
  {
  last_modified_date: int option
    [@ocaml.doc "The timestamp of when the endpoint was last modified.\n"];
  security_group_ids: string list option
    [@ocaml.doc
      "The unique identifiers of the security groups that define the ports, protocols, and sources for inbound traffic that you are authorizing into your endpoint.\n"];
  subnet_ids: string list option
    [@ocaml.doc
      "The ID of the subnets from which you access OpenSearch Serverless.\n"];
  status: vpc_endpoint_status option
    [@ocaml.doc "The current status of the endpoint update process.\n"];
  name: string option [@ocaml.doc "The name of the endpoint.\n"];
  id: string option [@ocaml.doc "The unique identifier of the endpoint.\n"]}
[@@ocaml.doc
  "Update details for an OpenSearch Serverless-managed interface endpoint.\n"]
type nonrec update_vpc_endpoint_response =
  {
  update_vpc_endpoint_detail: update_vpc_endpoint_detail option
    [@ocaml.doc "Details about the updated VPC endpoint.\n"]}[@@ocaml.doc ""]
type nonrec update_vpc_endpoint_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  remove_security_group_ids: string list option
    [@ocaml.doc
      "The unique identifiers of the security groups to remove from the endpoint.\n"];
  add_security_group_ids: string list option
    [@ocaml.doc
      "The unique identifiers of the security groups to add to the endpoint. Security groups define the ports, protocols, and sources for inbound traffic that you are authorizing into your endpoint.\n"];
  remove_subnet_ids: string list option
    [@ocaml.doc
      "The unique identifiers of the subnets to remove from the endpoint.\n"];
  add_subnet_ids: string list option
    [@ocaml.doc "The ID of one or more subnets to add to the endpoint.\n"];
  id: string
    [@ocaml.doc
      "The unique identifier of the interface endpoint to update.\n"]}
[@@ocaml.doc ""]
type nonrec internal_server_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Thrown when an error internal to the service occurs while processing a request.\n"]
type nonrec conflict_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "When creating a resource, thrown when a resource with the same name already exists or is being created. When deleting a resource, thrown when the resource is not in the ACTIVE or FAILED state.\n"]
type nonrec security_policy_type =
  | Encryption [@ocaml.doc ""]
  | Network [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec security_policy_detail =
  {
  last_modified_date: int option
    [@ocaml.doc "The timestamp of when the policy was last modified.\n"];
  created_date: int option [@ocaml.doc "The date the policy was created.\n"];
  policy: CoreTypes.Document.t option
    [@ocaml.doc "The JSON policy document without any whitespaces.\n"];
  description: string option
    [@ocaml.doc "The description of the security policy.\n"];
  policy_version: string option [@ocaml.doc "The version of the policy.\n"];
  name: string option [@ocaml.doc "The name of the policy.\n"];
  type_: security_policy_type option
    [@ocaml.doc "The type of security policy.\n"]}[@@ocaml.doc
                                                    "Details about an OpenSearch Serverless security policy.\n"]
type nonrec update_security_policy_response =
  {
  security_policy_detail: security_policy_detail option
    [@ocaml.doc "Details about the updated security policy.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec update_security_policy_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  policy: string option
    [@ocaml.doc
      "The JSON policy document to use as the content for the new policy.\n"];
  description: string option
    [@ocaml.doc
      "A description of the policy. Typically used to store information about the permissions defined in the policy.\n"];
  policy_version: string
    [@ocaml.doc "The version of the policy being updated.\n"];
  name: string [@ocaml.doc "The name of the policy.\n"];
  type_: security_policy_type [@ocaml.doc "The type of access policy.\n"]}
[@@ocaml.doc ""]
type nonrec service_quota_exceeded_exception =
  {
  quota_code: string option
    [@ocaml.doc "Service Quotas requirement to identify originating quota."];
  service_code: string
    [@ocaml.doc
      "Service Quotas requirement to identify originating service."];
  resource_type: string option [@ocaml.doc "Type of the resource affected."];
  resource_id: string option
    [@ocaml.doc "Identifier of the resource affected."];
  message: string [@ocaml.doc "Description of the error."]}[@@ocaml.doc
                                                             "Thrown when you attempt to create more resources than the service allows based on service quotas.\n"]
type nonrec resource_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Thrown when accessing or deleting a resource that does not exist.\n"]
type nonrec security_config_type =
  | Saml [@ocaml.doc ""]
  | Iamidentitycenter [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec saml_config_options =
  {
  session_timeout: int option
    [@ocaml.doc
      "The session timeout, in minutes. Default is 60 minutes (12 hours).\n"];
  open_search_serverless_entity_id: string option
    [@ocaml.doc
      "Custom entity id attribute to override default entity id for this saml integration.\n"];
  group_attribute: string option
    [@ocaml.doc "The group attribute for this SAML integration.\n"];
  user_attribute: string option
    [@ocaml.doc "A user attribute for this SAML integration.\n"];
  metadata: string
    [@ocaml.doc
      "The XML IdP metadata file generated from your identity provider.\n"]}
[@@ocaml.doc
  "Describes SAML options for an OpenSearch Serverless security configuration in the form of a key-value map.\n"]
type nonrec iam_identity_center_user_attribute =
  | UserId [@ocaml.doc ""]
  | UserName [@ocaml.doc ""]
  | Email [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec iam_identity_center_group_attribute =
  | GroupId [@ocaml.doc ""]
  | GroupName [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec iam_identity_center_config_options =
  {
  group_attribute: iam_identity_center_group_attribute option
    [@ocaml.doc
      "The group attribute for this IAM Identity Center integration. Defaults to [GroupId].\n"];
  user_attribute: iam_identity_center_user_attribute option
    [@ocaml.doc
      "The user attribute for this IAM Identity Center integration. Defaults to [UserId] \n"];
  application_description: string option
    [@ocaml.doc
      "The description of the IAM Identity Center application used to integrate with OpenSearch Serverless.\n"];
  application_name: string option
    [@ocaml.doc
      "The name of the IAM Identity Center application used to integrate with OpenSearch Serverless.\n"];
  application_arn: string option
    [@ocaml.doc
      "The ARN of the IAM Identity Center application used to integrate with OpenSearch Serverless.\n"];
  instance_arn: string option
    [@ocaml.doc
      "The ARN of the IAM Identity Center instance used to integrate with OpenSearch Serverless.\n"]}
[@@ocaml.doc
  "Describes IAM Identity Center options for an OpenSearch Serverless security configuration in the form of a key-value map.\n"]
type nonrec security_config_detail =
  {
  last_modified_date: int option
    [@ocaml.doc
      "The timestamp of when the configuration was last modified.\n"];
  created_date: int option
    [@ocaml.doc "The date the configuration was created.\n"];
  iam_identity_center_options: iam_identity_center_config_options option
    [@ocaml.doc
      "Describes IAM Identity Center options in the form of a key-value map.\n"];
  saml_options: saml_config_options option
    [@ocaml.doc
      "SAML options for the security configuration in the form of a key-value map.\n"];
  description: string option
    [@ocaml.doc "The description of the security configuration.\n"];
  config_version: string option
    [@ocaml.doc "The version of the security configuration.\n"];
  type_: security_config_type option
    [@ocaml.doc "The type of security configuration.\n"];
  id: string option
    [@ocaml.doc "The unique identifier of the security configuration.\n"]}
[@@ocaml.doc
  "Details about a security configuration for OpenSearch Serverless. \n"]
type nonrec update_security_config_response =
  {
  security_config_detail: security_config_detail option
    [@ocaml.doc "Details about the updated security configuration. \n"]}
[@@ocaml.doc ""]
type nonrec update_iam_identity_center_config_options =
  {
  group_attribute: iam_identity_center_group_attribute option
    [@ocaml.doc
      "The group attribute for this IAM Identity Center integration. Defaults to [GroupId].\n"];
  user_attribute: iam_identity_center_user_attribute option
    [@ocaml.doc
      "The user attribute for this IAM Identity Center integration. Defaults to [UserId].\n"]}
[@@ocaml.doc
  "Describes IAM Identity Center options for updating an OpenSearch Serverless security configuration in the form of a key-value map.\n"]
type nonrec update_security_config_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  iam_identity_center_options_updates:
    update_iam_identity_center_config_options option
    [@ocaml.doc
      "Describes IAM Identity Center options in the form of a key-value map.\n"];
  saml_options: saml_config_options option
    [@ocaml.doc "SAML options in in the form of a key-value map.\n"];
  description: string option
    [@ocaml.doc "A description of the security configuration.\n"];
  config_version: string
    [@ocaml.doc
      "The version of the security configuration to be updated. You can find the most recent version of a security configuration using the [GetSecurityPolicy] command.\n"];
  id: string
    [@ocaml.doc
      "The security configuration identifier. For SAML the ID will be [saml/<accountId>/<idpProviderName>]. For example, [saml/123456789123/OKTADev].\n"]}
[@@ocaml.doc ""]
type nonrec lifecycle_policy_type =
  | Retention [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec lifecycle_policy_detail =
  {
  last_modified_date: int option
    [@ocaml.doc
      "The timestamp of when the lifecycle policy was last modified.\n"];
  created_date: int option
    [@ocaml.doc "The date the lifecycle policy was created.\n"];
  policy: CoreTypes.Document.t option
    [@ocaml.doc "The JSON policy document without any whitespaces.\n"];
  description: string option
    [@ocaml.doc "The description of the lifecycle policy.\n"];
  policy_version: string option
    [@ocaml.doc "The version of the lifecycle policy.\n"];
  name: string option [@ocaml.doc "The name of the lifecycle policy.\n"];
  type_: lifecycle_policy_type option
    [@ocaml.doc "The type of lifecycle policy.\n"]}[@@ocaml.doc
                                                     "Details about an OpenSearch Serverless lifecycle policy.\n"]
type nonrec update_lifecycle_policy_response =
  {
  lifecycle_policy_detail: lifecycle_policy_detail option
    [@ocaml.doc "Details about the updated lifecycle policy.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec update_lifecycle_policy_request =
  {
  client_token: string option
    [@ocaml.doc
      "A unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  policy: string option
    [@ocaml.doc
      "The JSON policy document to use as the content for the lifecycle policy.\n"];
  description: string option
    [@ocaml.doc "A description of the lifecycle policy.\n"];
  policy_version: string
    [@ocaml.doc "The version of the policy being updated.\n"];
  name: string [@ocaml.doc "The name of the policy.\n"];
  type_: lifecycle_policy_type
    [@ocaml.doc " The type of lifecycle policy.\n"]}[@@ocaml.doc ""]
type nonrec collection_status =
  | CREATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec collection_type =
  | SEARCH [@ocaml.doc ""]
  | TIMESERIES [@ocaml.doc ""]
  | VECTORSEARCH [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_collection_detail =
  {
  last_modified_date: int option
    [@ocaml.doc "The date and time when the collection was last modified.\n"];
  created_date: int option
    [@ocaml.doc "The date and time when the collection was created.\n"];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the collection.\n"];
  description: string option
    [@ocaml.doc "The description of the collection.\n"];
  type_: collection_type option [@ocaml.doc "The collection type.\n"];
  status: collection_status option
    [@ocaml.doc "The current status of the collection.\n"];
  name: string option [@ocaml.doc "The name of the collection.\n"];
  id: string option [@ocaml.doc "The unique identifier of the collection.\n"]}
[@@ocaml.doc "Details about an updated OpenSearch Serverless collection.\n"]
type nonrec update_collection_response =
  {
  update_collection_detail: update_collection_detail option
    [@ocaml.doc "Details about the updated collection.\n"]}[@@ocaml.doc ""]
type nonrec update_collection_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  description: string option
    [@ocaml.doc "A description of the collection.\n"];
  id: string [@ocaml.doc "The unique identifier of the collection.\n"]}
[@@ocaml.doc ""]
type nonrec capacity_limits =
  {
  max_search_capacity_in_oc_u: int option
    [@ocaml.doc "The maximum search capacity for collections.\n"];
  max_indexing_capacity_in_oc_u: int option
    [@ocaml.doc "The maximum indexing capacity for collections.\n"]}[@@ocaml.doc
                                                                    "The maximum capacity limits for all OpenSearch Serverless collections, in OpenSearch Compute Units (OCUs). These limits are used to scale your collections based on the current workload. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-scaling.html}Managing capacity limits for Amazon OpenSearch Serverless}.\n"]
type nonrec account_settings_detail =
  {
  capacity_limits: capacity_limits option [@ocaml.doc ""]}[@@ocaml.doc
                                                            "OpenSearch Serverless-related information for the current account.\n"]
type nonrec update_account_settings_response =
  {
  account_settings_detail: account_settings_detail option
    [@ocaml.doc
      "OpenSearch Serverless-related settings for the current Amazon Web Services account. \n"]}
[@@ocaml.doc ""]
type nonrec update_account_settings_request =
  {
  capacity_limits: capacity_limits option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec access_policy_type =
  | Data [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec access_policy_detail =
  {
  last_modified_date: int option
    [@ocaml.doc "The timestamp of when the policy was last modified.\n"];
  created_date: int option [@ocaml.doc "The date the policy was created.\n"];
  policy: CoreTypes.Document.t option
    [@ocaml.doc "The JSON policy document without any whitespaces.\n"];
  description: string option [@ocaml.doc "The description of the policy.\n"];
  policy_version: string option [@ocaml.doc "The version of the policy.\n"];
  name: string option [@ocaml.doc "The name of the policy.\n"];
  type_: access_policy_type option
    [@ocaml.doc "The type of access policy.\n"]}[@@ocaml.doc
                                                  "Details about an OpenSearch Serverless access policy.\n"]
type nonrec update_access_policy_response =
  {
  access_policy_detail: access_policy_detail option
    [@ocaml.doc "Details about the updated access policy.\n"]}[@@ocaml.doc
                                                                ""]
type nonrec update_access_policy_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  policy: string option
    [@ocaml.doc
      "The JSON policy document to use as the content for the policy.\n"];
  description: string option
    [@ocaml.doc
      "A description of the policy. Typically used to store information about the permissions defined in the policy.\n"];
  policy_version: string
    [@ocaml.doc "The version of the policy being updated.\n"];
  name: string [@ocaml.doc "The name of the policy.\n"];
  type_: access_policy_type [@ocaml.doc "The type of policy.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec untag_resource_request =
  {
  tag_keys: string list
    [@ocaml.doc
      "The tag or set of tags to remove from the resource. All tag keys in the request must be unique.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource to remove tags from. The resource must be active (not in the [DELETING] state), and must be owned by the account ID included in the request.\n"]}
[@@ocaml.doc ""]
type nonrec tag =
  {
  value: string [@ocaml.doc "The value of the tag.\n"];
  key: string [@ocaml.doc "The key to use in the tag.\n"]}[@@ocaml.doc
                                                            "A map of key-value pairs associated to an OpenSearch Serverless resource.\n"]
type nonrec tag_resource_request =
  {
  tags: tag list
    [@ocaml.doc
      "A list of tags (key-value pairs) to add to the resource. All tag keys in the request must be unique.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource. The resource must be active (not in the [DELETING] state), and must be owned by the account ID included in the request.\n"]}
[@@ocaml.doc ""]
type nonrec standby_replicas =
  | ENABLED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec security_policy_summary =
  {
  last_modified_date: int option
    [@ocaml.doc "The timestamp of when the policy was last modified.\n"];
  created_date: int option [@ocaml.doc "The date the policy was created.\n"];
  description: string option
    [@ocaml.doc "The description of the security policy.\n"];
  policy_version: string option [@ocaml.doc "The version of the policy.\n"];
  name: string option [@ocaml.doc "The name of the policy.\n"];
  type_: security_policy_type option
    [@ocaml.doc "The type of security policy.\n"]}[@@ocaml.doc
                                                    "A summary of a security policy for OpenSearch Serverless.\n"]
type nonrec security_policy_stats =
  {
  network_policy_count: int option
    [@ocaml.doc "The number of network policies in the current account.\n"];
  encryption_policy_count: int option
    [@ocaml.doc
      "The number of encryption policies in the current account.\n"]}
[@@ocaml.doc "Statistics for an OpenSearch Serverless security policy.\n"]
type nonrec security_config_summary =
  {
  last_modified_date: int option
    [@ocaml.doc
      "The timestamp of when the configuration was last modified.\n"];
  created_date: int option
    [@ocaml.doc
      "The Epoch time when the security configuration was created.\n"];
  description: string option
    [@ocaml.doc "The description of the security configuration.\n"];
  config_version: string option
    [@ocaml.doc "The version of the security configuration.\n"];
  type_: security_config_type option
    [@ocaml.doc "The type of security configuration.\n"];
  id: string option
    [@ocaml.doc "The unique identifier of the security configuration.\n"]}
[@@ocaml.doc
  "A summary of a security configuration for OpenSearch Serverless.\n"]
type nonrec security_config_stats =
  {
  saml_config_count: int option
    [@ocaml.doc
      "The number of security configurations in the current account.\n"]}
[@@ocaml.doc
  "Statistics for an OpenSearch Serverless security configuration.\n"]
type nonrec resource_type =
  | Index [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec list_tags_for_resource_response =
  {
  tags: tag list option
    [@ocaml.doc "The tags associated with the resource.\n"]}[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource. The resource must be active (not in the [DELETING] state), and must be owned by the account ID included in the request.\n"]}
[@@ocaml.doc ""]
type nonrec access_policy_stats =
  {
  data_policy_count: int option
    [@ocaml.doc
      "The number of data access policies in the current account.\n"]}
[@@ocaml.doc "Statistics for an OpenSearch Serverless access policy.\n"]
type nonrec lifecycle_policy_stats =
  {
  retention_policy_count: int option
    [@ocaml.doc
      "The number of retention lifecycle policies in the current account.\n"]}
[@@ocaml.doc "Statistics for an OpenSearch Serverless lifecycle policy.\n"]
type nonrec get_policies_stats_response =
  {
  total_policy_count: int option
    [@ocaml.doc
      "The total number of OpenSearch Serverless security policies and configurations in your account.\n"];
  lifecycle_policy_stats: lifecycle_policy_stats option
    [@ocaml.doc
      "Information about the lifecycle policies in your account.\n"];
  security_config_stats: security_config_stats option
    [@ocaml.doc
      "Information about the security configurations in your account.\n"];
  security_policy_stats: security_policy_stats option
    [@ocaml.doc "Information about the security policies in your account.\n"];
  access_policy_stats: access_policy_stats option
    [@ocaml.doc
      "Information about the data access policies in your account.\n"]}
[@@ocaml.doc ""]
type nonrec get_account_settings_response =
  {
  account_settings_detail: account_settings_detail option
    [@ocaml.doc
      "OpenSearch Serverless-related details for the current account.\n"]}
[@@ocaml.doc ""]
type nonrec create_security_policy_response =
  {
  security_policy_detail: security_policy_detail option
    [@ocaml.doc "Details about the created security policy.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec create_security_policy_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  policy: string
    [@ocaml.doc
      "The JSON policy document to use as the content for the new policy.\n"];
  description: string option
    [@ocaml.doc
      "A description of the policy. Typically used to store information about the permissions defined in the policy.\n"];
  name: string [@ocaml.doc "The name of the policy.\n"];
  type_: security_policy_type [@ocaml.doc "The type of security policy.\n"]}
[@@ocaml.doc ""]
type nonrec create_lifecycle_policy_response =
  {
  lifecycle_policy_detail: lifecycle_policy_detail option
    [@ocaml.doc "Details about the created lifecycle policy.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec create_lifecycle_policy_request =
  {
  client_token: string option
    [@ocaml.doc
      "A unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  policy: string
    [@ocaml.doc
      "The JSON policy document to use as the content for the lifecycle policy.\n"];
  description: string option
    [@ocaml.doc "A description of the lifecycle policy.\n"];
  name: string [@ocaml.doc "The name of the lifecycle policy.\n"];
  type_: lifecycle_policy_type [@ocaml.doc "The type of lifecycle policy.\n"]}
[@@ocaml.doc ""]
type nonrec batch_get_vpc_endpoint_response =
  {
  vpc_endpoint_error_details: vpc_endpoint_error_detail list option
    [@ocaml.doc "Error information for a failed request.\n"];
  vpc_endpoint_details: vpc_endpoint_detail list option
    [@ocaml.doc "Details about the specified VPC endpoint.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec batch_get_vpc_endpoint_request =
  {
  ids: string list [@ocaml.doc "A list of VPC endpoint identifiers.\n"]}
[@@ocaml.doc ""]
type nonrec lifecycle_policy_error_detail =
  {
  error_code: string option
    [@ocaml.doc
      "The error code for the request. For example, [NOT_FOUND].\n"];
  error_message: string option
    [@ocaml.doc
      "A description of the error. For example, [The specified Lifecycle Policy is not found].\n"];
  name: string option [@ocaml.doc "The name of the lifecycle policy.\n"];
  type_: lifecycle_policy_type option
    [@ocaml.doc "The type of lifecycle policy.\n"]}[@@ocaml.doc
                                                     "Error information for an OpenSearch Serverless request.\n"]
type nonrec batch_get_lifecycle_policy_response =
  {
  lifecycle_policy_error_details: lifecycle_policy_error_detail list option
    [@ocaml.doc
      "A list of lifecycle policy names and policy types for which retrieval failed.\n"];
  lifecycle_policy_details: lifecycle_policy_detail list option
    [@ocaml.doc
      "A list of lifecycle policies matched to the input policy name and policy type.\n"]}
[@@ocaml.doc ""]
type nonrec lifecycle_policy_identifier =
  {
  name: string [@ocaml.doc "The name of the lifecycle policy.\n"];
  type_: lifecycle_policy_type [@ocaml.doc "The type of lifecycle policy.\n"]}
[@@ocaml.doc "The unique identifiers of policy types and policy names.\n"]
type nonrec batch_get_lifecycle_policy_request =
  {
  identifiers: lifecycle_policy_identifier list
    [@ocaml.doc "The unique identifiers of policy types and policy names.\n"]}
[@@ocaml.doc ""]
type nonrec effective_lifecycle_policy_detail =
  {
  no_min_retention_period: bool option
    [@ocaml.doc
      "The minimum number of index retention days set. That is an optional param that will return as [true] if the minimum number of days or hours is not set to a index resource.\n"];
  retention_period: string option
    [@ocaml.doc
      "The minimum number of index retention in days or hours. This is an optional parameter that will return only if it\226\128\153s set.\n"];
  resource_type: resource_type option
    [@ocaml.doc
      "The type of OpenSearch Serverless resource. Currently, the only supported resource is [index].\n"];
  policy_name: string option
    [@ocaml.doc "The name of the lifecycle policy.\n"];
  resource: string option
    [@ocaml.doc "The name of the OpenSearch Serverless index resource.\n"];
  type_: lifecycle_policy_type option
    [@ocaml.doc "The type of lifecycle policy.\n"]}[@@ocaml.doc
                                                     "Error information for an OpenSearch Serverless request.\n"]
type nonrec effective_lifecycle_policy_error_detail =
  {
  error_code: string option [@ocaml.doc "The error code for the request.\n"];
  error_message: string option
    [@ocaml.doc
      "A description of the error. For example, [The specified Index resource is not found].\n"];
  resource: string option
    [@ocaml.doc "The name of OpenSearch Serverless index resource.\n"];
  type_: lifecycle_policy_type option
    [@ocaml.doc "The type of lifecycle policy.\n"]}[@@ocaml.doc
                                                     "Error information for an OpenSearch Serverless request.\n"]
type nonrec batch_get_effective_lifecycle_policy_response =
  {
  effective_lifecycle_policy_error_details:
    effective_lifecycle_policy_error_detail list option
    [@ocaml.doc "A list of resources for which retrieval failed.\n"];
  effective_lifecycle_policy_details:
    effective_lifecycle_policy_detail list option
    [@ocaml.doc
      "A list of lifecycle policies applied to the OpenSearch Serverless indexes.\n"]}
[@@ocaml.doc ""]
type nonrec lifecycle_policy_resource_identifier =
  {
  resource: string
    [@ocaml.doc "The name of the OpenSearch Serverless ilndex resource.\n"];
  type_: lifecycle_policy_type [@ocaml.doc "The type of lifecycle policy.\n"]}
[@@ocaml.doc "The unique identifiers of policy types and resource names.\n"]
type nonrec batch_get_effective_lifecycle_policy_request =
  {
  resource_identifiers: lifecycle_policy_resource_identifier list
    [@ocaml.doc
      "The unique identifiers of policy types and resource names.\n"]}
[@@ocaml.doc ""]
type nonrec collection_detail =
  {
  failure_message: string option
    [@ocaml.doc "A message associated with the failure code.\n"];
  failure_code: string option
    [@ocaml.doc "A failure code associated with the request.\n"];
  dashboard_endpoint: string option
    [@ocaml.doc
      "Collection-specific endpoint used to access OpenSearch Dashboards.\n"];
  collection_endpoint: string option
    [@ocaml.doc
      "Collection-specific endpoint used to submit index, search, and data upload requests to an OpenSearch Serverless collection.\n"];
  last_modified_date: int option
    [@ocaml.doc "The date and time when the collection was last modified.\n"];
  created_date: int option
    [@ocaml.doc "The Epoch time when the collection was created.\n"];
  standby_replicas: standby_replicas option
    [@ocaml.doc "Details about an OpenSearch Serverless collection.\n"];
  kms_key_arn: string option
    [@ocaml.doc
      "The ARN of the Amazon Web Services KMS key used to encrypt the collection.\n"];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the collection.\n"];
  description: string option
    [@ocaml.doc "A description of the collection.\n"];
  type_: collection_type option [@ocaml.doc "The type of collection.\n"];
  status: collection_status option
    [@ocaml.doc "The current status of the collection.\n"];
  name: string option [@ocaml.doc "The name of the collection.\n"];
  id: string option [@ocaml.doc "A unique identifier for the collection.\n"]}
[@@ocaml.doc
  "Details about each OpenSearch Serverless collection, including the collection endpoint and the OpenSearch Dashboards endpoint.\n"]
type nonrec collection_error_detail =
  {
  error_code: string option
    [@ocaml.doc
      "The error code for the request. For example, [NOT_FOUND].\n"];
  error_message: string option
    [@ocaml.doc
      "A description of the error. For example, [The specified Collection is not\n                found.] \n"];
  name: string option
    [@ocaml.doc
      "If the request contains collection names, the response includes the names provided in the request.\n"];
  id: string option
    [@ocaml.doc
      "If the request contains collection IDs, the response includes the IDs provided in the request.\n"]}
[@@ocaml.doc "Error information for an OpenSearch Serverless request.\n"]
type nonrec batch_get_collection_response =
  {
  collection_error_details: collection_error_detail list option
    [@ocaml.doc "Error information for the request.\n"];
  collection_details: collection_detail list option
    [@ocaml.doc "Details about each collection.\n"]}[@@ocaml.doc ""]
type nonrec batch_get_collection_request =
  {
  names: string list option
    [@ocaml.doc
      "A list of collection names. You can't provide names and IDs in the same request.\n"];
  ids: string list option
    [@ocaml.doc
      "A list of collection IDs. You can't provide names and IDs in the same request. The ID is part of the collection endpoint. You can also retrieve it using the {{:https://docs.aws.amazon.com/opensearch-service/latest/ServerlessAPIReference/API_ListCollections.html}ListCollections} API.\n"]}
[@@ocaml.doc ""]
type nonrec ocu_limit_exceeded_exception =
  {
  message: string [@ocaml.doc "Description of the error."]}[@@ocaml.doc
                                                             "Thrown when the collection you're attempting to create results in a number of search or indexing OCUs that exceeds the account limit. \n"]
type nonrec list_vpc_endpoints_response =
  {
  next_token: string option
    [@ocaml.doc
      "When [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page.\n"];
  vpc_endpoint_summaries: vpc_endpoint_summary list option
    [@ocaml.doc
      "Details about each VPC endpoint, including the name and current status.\n"]}
[@@ocaml.doc ""]
type nonrec list_vpc_endpoints_request =
  {
  max_results: int option
    [@ocaml.doc
      "An optional parameter that specifies the maximum number of results to return. You can use [nextToken] to get the next page of results. The default is 20.\n"];
  next_token: string option
    [@ocaml.doc
      "If your initial [ListVpcEndpoints] operation returns a [nextToken], you can include the returned [nextToken] in subsequent [ListVpcEndpoints] operations, which returns results in the next page. \n"];
  vpc_endpoint_filters: vpc_endpoint_filters option
    [@ocaml.doc
      "Filter the results according to the current status of the VPC endpoint. Possible statuses are [CREATING], [DELETING], [UPDATING], [ACTIVE], and [FAILED].\n"]}
[@@ocaml.doc ""]
type nonrec list_security_policies_response =
  {
  next_token: string option
    [@ocaml.doc
      "When [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page.\n"];
  security_policy_summaries: security_policy_summary list option
    [@ocaml.doc "Details about the security policies in your account.\n"]}
[@@ocaml.doc ""]
type nonrec list_security_policies_request =
  {
  max_results: int option
    [@ocaml.doc
      "An optional parameter that specifies the maximum number of results to return. You can use [nextToken] to get the next page of results. The default is 20.\n"];
  next_token: string option
    [@ocaml.doc
      "If your initial [ListSecurityPolicies] operation returns a [nextToken], you can include the returned [nextToken] in subsequent [ListSecurityPolicies] operations, which returns results in the next page. \n"];
  resource: string list option
    [@ocaml.doc
      "Resource filters (can be collection or indexes) that policies can apply to. \n"];
  type_: security_policy_type [@ocaml.doc "The type of policy.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec list_security_configs_response =
  {
  next_token: string option
    [@ocaml.doc
      "When [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page.\n"];
  security_config_summaries: security_config_summary list option
    [@ocaml.doc
      "Details about the security configurations in your account.\n"]}
[@@ocaml.doc ""]
type nonrec list_security_configs_request =
  {
  max_results: int option
    [@ocaml.doc
      "An optional parameter that specifies the maximum number of results to return. You can use [nextToken] to get the next page of results. The default is 20.\n"];
  next_token: string option
    [@ocaml.doc
      "If your initial [ListSecurityConfigs] operation returns a [nextToken], you can include the returned [nextToken] in subsequent [ListSecurityConfigs] operations, which returns results in the next page. \n"];
  type_: security_config_type
    [@ocaml.doc "The type of security configuration.\n"]}[@@ocaml.doc ""]
type nonrec lifecycle_policy_summary =
  {
  last_modified_date: int option
    [@ocaml.doc
      "The date and time when the lifecycle policy was last modified.\n"];
  created_date: int option
    [@ocaml.doc "The Epoch time when the lifecycle policy was created.\n"];
  description: string option
    [@ocaml.doc "The description of the lifecycle policy.\n"];
  policy_version: string option
    [@ocaml.doc "The version of the lifecycle policy.\n"];
  name: string option [@ocaml.doc "The name of the lifecycle policy.\n"];
  type_: lifecycle_policy_type option
    [@ocaml.doc "The type of lifecycle policy.\n"]}[@@ocaml.doc
                                                     "A summary of the lifecycle policy.\n"]
type nonrec list_lifecycle_policies_response =
  {
  next_token: string option
    [@ocaml.doc
      "When [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page.\n"];
  lifecycle_policy_summaries: lifecycle_policy_summary list option
    [@ocaml.doc "Details about the requested lifecycle policies.\n"]}
[@@ocaml.doc ""]
type nonrec list_lifecycle_policies_request =
  {
  max_results: int option
    [@ocaml.doc
      "An optional parameter that specifies the maximum number of results to return. You can use use [nextToken] to get the next page of results. The default is 10.\n"];
  next_token: string option
    [@ocaml.doc
      "If your initial [ListLifecyclePolicies] operation returns a [nextToken], you can include the returned [nextToken] in subsequent [ListLifecyclePolicies] operations, which returns results in the next page.\n"];
  resources: string list option
    [@ocaml.doc
      "Resource filters that policies can apply to. Currently, the only supported resource type is [index].\n"];
  type_: lifecycle_policy_type [@ocaml.doc "The type of lifecycle policy.\n"]}
[@@ocaml.doc ""]
type nonrec collection_summary =
  {
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the collection.\n"];
  status: collection_status option
    [@ocaml.doc "The current status of the collection.\n"];
  name: string option [@ocaml.doc "The name of the collection.\n"];
  id: string option [@ocaml.doc "The unique identifier of the collection.\n"]}
[@@ocaml.doc "Details about each OpenSearch Serverless collection.\n"]
type nonrec list_collections_response =
  {
  next_token: string option
    [@ocaml.doc
      "When [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page.\n"];
  collection_summaries: collection_summary list option
    [@ocaml.doc "Details about each collection.\n"]}[@@ocaml.doc ""]
type nonrec collection_filters =
  {
  status: collection_status option
    [@ocaml.doc "The current status of the collection.\n"];
  name: string option [@ocaml.doc "The name of the collection.\n"]}[@@ocaml.doc
                                                                    "A list of filter keys that you can use for LIST, UPDATE, and DELETE requests to OpenSearch Serverless collections.\n"]
type nonrec list_collections_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to return. Default is 20. You can use [nextToken] to get the next page of results.\n"];
  next_token: string option
    [@ocaml.doc
      "If your initial [ListCollections] operation returns a [nextToken], you can include the returned [nextToken] in subsequent [ListCollections] operations, which returns results in the next page.\n"];
  collection_filters: collection_filters option
    [@ocaml.doc
      " A list of filter names and values that you can use for requests.\n"]}
[@@ocaml.doc ""]
type nonrec access_policy_summary =
  {
  last_modified_date: int option
    [@ocaml.doc "The date and time when the collection was last modified.\n"];
  created_date: int option
    [@ocaml.doc "The Epoch time when the access policy was created.\n"];
  description: string option
    [@ocaml.doc "The description of the access policy.\n"];
  policy_version: string option [@ocaml.doc "The version of the policy.\n"];
  name: string option [@ocaml.doc "The name of the access policy.\n"];
  type_: access_policy_type option
    [@ocaml.doc
      "The type of access policy. Currently, the only available type is [data].\n"]}
[@@ocaml.doc "A summary of the data access policy.\n"]
type nonrec list_access_policies_response =
  {
  next_token: string option
    [@ocaml.doc
      "When [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page.\n"];
  access_policy_summaries: access_policy_summary list option
    [@ocaml.doc "Details about the requested access policies.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec list_access_policies_request =
  {
  max_results: int option
    [@ocaml.doc
      "An optional parameter that specifies the maximum number of results to return. You can use [nextToken] to get the next page of results. The default is 20.\n"];
  next_token: string option
    [@ocaml.doc
      "If your initial [ListAccessPolicies] operation returns a [nextToken], you can include the returned [nextToken] in subsequent [ListAccessPolicies] operations, which returns results in the next page. \n"];
  resource: string list option
    [@ocaml.doc
      "Resource filters (can be collections or indexes) that policies can apply to.\n"];
  type_: access_policy_type [@ocaml.doc "The type of access policy.\n"]}
[@@ocaml.doc ""]
type nonrec get_security_policy_response =
  {
  security_policy_detail: security_policy_detail option
    [@ocaml.doc "Details about the requested security policy.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec get_security_policy_request =
  {
  name: string [@ocaml.doc "The name of the security policy.\n"];
  type_: security_policy_type [@ocaml.doc "The type of security policy.\n"]}
[@@ocaml.doc ""]
type nonrec get_security_config_response =
  {
  security_config_detail: security_config_detail option
    [@ocaml.doc "Details of the requested security configuration.\n"]}
[@@ocaml.doc ""]
type nonrec get_security_config_request =
  {
  id: string
    [@ocaml.doc "The unique identifier of the security configuration.\n"]}
[@@ocaml.doc ""]
type nonrec get_access_policy_response =
  {
  access_policy_detail: access_policy_detail option
    [@ocaml.doc "Details about the requested access policy.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec get_access_policy_request =
  {
  name: string [@ocaml.doc "The name of the access policy.\n"];
  type_: access_policy_type
    [@ocaml.doc
      "Tye type of policy. Currently, the only supported value is [data].\n"]}
[@@ocaml.doc ""]
type nonrec delete_vpc_endpoint_detail =
  {
  status: vpc_endpoint_status option
    [@ocaml.doc "The current status of the endpoint deletion process.\n"];
  name: string option [@ocaml.doc "The name of the endpoint.\n"];
  id: string option [@ocaml.doc "The unique identifier of the endpoint.\n"]}
[@@ocaml.doc
  "Deletion details for an OpenSearch Serverless-managed interface endpoint.\n"]
type nonrec delete_vpc_endpoint_response =
  {
  delete_vpc_endpoint_detail: delete_vpc_endpoint_detail option
    [@ocaml.doc "Details about the deleted endpoint.\n"]}[@@ocaml.doc ""]
type nonrec delete_vpc_endpoint_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  id: string [@ocaml.doc "The VPC endpoint identifier.\n"]}[@@ocaml.doc ""]
type nonrec delete_security_policy_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  name: string [@ocaml.doc "The name of the policy to delete.\n"];
  type_: security_policy_type [@ocaml.doc "The type of policy.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_security_config_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  id: string
    [@ocaml.doc
      "The security configuration identifier. For SAML the ID will be [saml/<accountId>/<idpProviderName>]. For example, [saml/123456789123/OKTADev].\n"]}
[@@ocaml.doc ""]
type nonrec delete_lifecycle_policy_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  name: string [@ocaml.doc "The name of the policy to delete.\n"];
  type_: lifecycle_policy_type [@ocaml.doc "The type of lifecycle policy.\n"]}
[@@ocaml.doc ""]
type nonrec delete_collection_detail =
  {
  status: collection_status option
    [@ocaml.doc "The current status of the collection.\n"];
  name: string option [@ocaml.doc "The name of the collection.\n"];
  id: string option [@ocaml.doc "The unique identifier of the collection.\n"]}
[@@ocaml.doc "Details about a deleted OpenSearch Serverless collection.\n"]
type nonrec delete_collection_response =
  {
  delete_collection_detail: delete_collection_detail option
    [@ocaml.doc "Details of the deleted collection.\n"]}[@@ocaml.doc ""]
type nonrec delete_collection_request =
  {
  client_token: string option
    [@ocaml.doc
      "A unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  id: string
    [@ocaml.doc
      "The unique identifier of the collection. For example, [1iu5usc406kd]. The ID is part of the collection endpoint. You can also retrieve it using the {{:https://docs.aws.amazon.com/opensearch-service/latest/ServerlessAPIReference/API_ListCollections.html}ListCollections} API.\n"]}
[@@ocaml.doc ""]
type nonrec delete_access_policy_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  name: string [@ocaml.doc "The name of the policy to delete.\n"];
  type_: access_policy_type [@ocaml.doc "The type of policy.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec create_vpc_endpoint_detail =
  {
  status: vpc_endpoint_status option
    [@ocaml.doc "The current status in the endpoint creation process.\n"];
  name: string option [@ocaml.doc "The name of the endpoint.\n"];
  id: string option [@ocaml.doc "The unique identifier of the endpoint.\n"]}
[@@ocaml.doc
  "Creation details for an OpenSearch Serverless-managed interface endpoint. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.\n"]
type nonrec create_vpc_endpoint_response =
  {
  create_vpc_endpoint_detail: create_vpc_endpoint_detail option
    [@ocaml.doc "Details about the created interface VPC endpoint.\n"]}
[@@ocaml.doc ""]
type nonrec create_vpc_endpoint_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  security_group_ids: string list option
    [@ocaml.doc
      "The unique identifiers of the security groups that define the ports, protocols, and sources for inbound traffic that you are authorizing into your endpoint.\n"];
  subnet_ids: string list
    [@ocaml.doc
      "The ID of one or more subnets from which you'll access OpenSearch Serverless.\n"];
  vpc_id: string
    [@ocaml.doc
      "The ID of the VPC from which you'll access OpenSearch Serverless.\n"];
  name: string [@ocaml.doc "The name of the interface endpoint.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec create_security_config_response =
  {
  security_config_detail: security_config_detail option
    [@ocaml.doc "Details about the created security configuration. \n"]}
[@@ocaml.doc ""]
type nonrec create_iam_identity_center_config_options =
  {
  group_attribute: iam_identity_center_group_attribute option
    [@ocaml.doc
      "The group attribute for this IAM Identity Center integration. Defaults to [GroupId].\n"];
  user_attribute: iam_identity_center_user_attribute option
    [@ocaml.doc
      "The user attribute for this IAM Identity Center integration. Defaults to [UserId].\n"];
  instance_arn: string
    [@ocaml.doc
      "The ARN of the IAM Identity Center instance used to integrate with OpenSearch Serverless.\n"]}
[@@ocaml.doc
  "Describes IAM Identity Center options for creating an OpenSearch Serverless security configuration in the form of a key-value map.\n"]
type nonrec create_security_config_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  iam_identity_center_options:
    create_iam_identity_center_config_options option
    [@ocaml.doc
      "Describes IAM Identity Center options in the form of a key-value map. This field is required if you specify iamidentitycenter for the type parameter.\n"];
  saml_options: saml_config_options option
    [@ocaml.doc
      "Describes SAML options in in the form of a key-value map. This field is required if you specify [saml] for the [type] parameter.\n"];
  description: string option
    [@ocaml.doc "A description of the security configuration.\n"];
  name: string [@ocaml.doc "The name of the security configuration.\n"];
  type_: security_config_type
    [@ocaml.doc "The type of security configuration.\n"]}[@@ocaml.doc ""]
type nonrec create_collection_detail =
  {
  last_modified_date: int option
    [@ocaml.doc "The date and time when the collection was last modified.\n"];
  created_date: int option
    [@ocaml.doc "The Epoch time when the collection was created.\n"];
  standby_replicas: standby_replicas option
    [@ocaml.doc
      "Creates details about an OpenSearch Serverless collection.\n"];
  kms_key_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the KMS key with which to encrypt the collection.\n"];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the collection.\n"];
  description: string option
    [@ocaml.doc "A description of the collection.\n"];
  type_: collection_type option [@ocaml.doc "The type of collection.\n"];
  status: collection_status option
    [@ocaml.doc "The current status of the collection.\n"];
  name: string option [@ocaml.doc "The name of the collection.\n"];
  id: string option [@ocaml.doc "The unique identifier of the collection.\n"]}
[@@ocaml.doc "Details about the created OpenSearch Serverless collection.\n"]
type nonrec create_collection_response =
  {
  create_collection_detail: create_collection_detail option
    [@ocaml.doc "Details about the collection.\n"]}[@@ocaml.doc ""]
type nonrec create_collection_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  standby_replicas: standby_replicas option
    [@ocaml.doc
      "Indicates whether standby replicas should be used for a collection.\n"];
  tags: tag list option
    [@ocaml.doc
      "An arbitrary set of tags (key\226\128\147value pairs) to associate with the OpenSearch Serverless collection.\n"];
  description: string option [@ocaml.doc "Description of the collection.\n"];
  type_: collection_type option [@ocaml.doc "The type of collection.\n"];
  name: string [@ocaml.doc "Name of the collection.\n"]}[@@ocaml.doc ""]
type nonrec create_access_policy_response =
  {
  access_policy_detail: access_policy_detail option
    [@ocaml.doc "Details about the created access policy.\n"]}[@@ocaml.doc
                                                                ""]
type nonrec create_access_policy_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
  policy: string
    [@ocaml.doc
      "The JSON policy document to use as the content for the policy.\n"];
  description: string option
    [@ocaml.doc
      "A description of the policy. Typically used to store information about the permissions defined in the policy.\n"];
  name: string [@ocaml.doc "The name of the policy.\n"];
  type_: access_policy_type [@ocaml.doc "The type of policy.\n"]}[@@ocaml.doc
                                                                   ""]