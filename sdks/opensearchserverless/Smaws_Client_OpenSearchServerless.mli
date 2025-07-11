(** 
    OpenSearchServerless client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
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
  | Saml [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec saml_config_options =
  {
  session_timeout: int option
    [@ocaml.doc
      "The session timeout, in minutes. Default is 60 minutes (12 hours).\n"];
  group_attribute: string option
    [@ocaml.doc "The group attribute for this SAML integration.\n"];
  user_attribute: string option
    [@ocaml.doc "A user attribute for this SAML integration.\n"];
  metadata: string
    [@ocaml.doc
      "The XML IdP metadata file generated from your identity provider.\n"]}
[@@ocaml.doc
  "Describes SAML options for an OpenSearch Serverless security configuration in the form of a key-value map.\n"]
type nonrec security_config_detail =
  {
  last_modified_date: int option
    [@ocaml.doc
      "The timestamp of when the configuration was last modified.\n"];
  created_date: int option
    [@ocaml.doc "The date the configuration was created.\n"];
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
type nonrec update_security_config_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
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
type nonrec create_security_config_request =
  {
  client_token: string option
    [@ocaml.doc
      "Unique, case-sensitive identifier to ensure idempotency of the request.\n"];
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
                                                                   ""](** {1:builders Builders} *)

val make_vpc_endpoint_summary :
  ?status:vpc_endpoint_status ->
    ?name:string -> ?id:string -> unit -> vpc_endpoint_summary
val make_vpc_endpoint_filters :
  ?status:vpc_endpoint_status -> unit -> vpc_endpoint_filters
val make_vpc_endpoint_error_detail :
  ?error_code:string ->
    ?error_message:string -> ?id:string -> unit -> vpc_endpoint_error_detail
val make_vpc_endpoint_detail :
  ?created_date:int ->
    ?status:vpc_endpoint_status ->
      ?security_group_ids:string list ->
        ?subnet_ids:string list ->
          ?vpc_id:string ->
            ?name:string -> ?id:string -> unit -> vpc_endpoint_detail
val make_update_vpc_endpoint_detail :
  ?last_modified_date:int ->
    ?security_group_ids:string list ->
      ?subnet_ids:string list ->
        ?status:vpc_endpoint_status ->
          ?name:string -> ?id:string -> unit -> update_vpc_endpoint_detail
val make_update_vpc_endpoint_response :
  ?update_vpc_endpoint_detail:update_vpc_endpoint_detail ->
    unit -> update_vpc_endpoint_response
val make_update_vpc_endpoint_request :
  ?client_token:string ->
    ?remove_security_group_ids:string list ->
      ?add_security_group_ids:string list ->
        ?remove_subnet_ids:string list ->
          ?add_subnet_ids:string list ->
            id:string -> unit -> update_vpc_endpoint_request
val make_security_policy_detail :
  ?last_modified_date:int ->
    ?created_date:int ->
      ?policy:CoreTypes.Document.t ->
        ?description:string ->
          ?policy_version:string ->
            ?name:string ->
              ?type_:security_policy_type -> unit -> security_policy_detail
val make_update_security_policy_response :
  ?security_policy_detail:security_policy_detail ->
    unit -> update_security_policy_response
val make_update_security_policy_request :
  ?client_token:string ->
    ?policy:string ->
      ?description:string ->
        policy_version:string ->
          name:string ->
            type_:security_policy_type ->
              unit -> update_security_policy_request
val make_saml_config_options :
  ?session_timeout:int ->
    ?group_attribute:string ->
      ?user_attribute:string ->
        metadata:string -> unit -> saml_config_options
val make_security_config_detail :
  ?last_modified_date:int ->
    ?created_date:int ->
      ?saml_options:saml_config_options ->
        ?description:string ->
          ?config_version:string ->
            ?type_:security_config_type ->
              ?id:string -> unit -> security_config_detail
val make_update_security_config_response :
  ?security_config_detail:security_config_detail ->
    unit -> update_security_config_response
val make_update_security_config_request :
  ?client_token:string ->
    ?saml_options:saml_config_options ->
      ?description:string ->
        config_version:string ->
          id:string -> unit -> update_security_config_request
val make_lifecycle_policy_detail :
  ?last_modified_date:int ->
    ?created_date:int ->
      ?policy:CoreTypes.Document.t ->
        ?description:string ->
          ?policy_version:string ->
            ?name:string ->
              ?type_:lifecycle_policy_type -> unit -> lifecycle_policy_detail
val make_update_lifecycle_policy_response :
  ?lifecycle_policy_detail:lifecycle_policy_detail ->
    unit -> update_lifecycle_policy_response
val make_update_lifecycle_policy_request :
  ?client_token:string ->
    ?policy:string ->
      ?description:string ->
        policy_version:string ->
          name:string ->
            type_:lifecycle_policy_type ->
              unit -> update_lifecycle_policy_request
val make_update_collection_detail :
  ?last_modified_date:int ->
    ?created_date:int ->
      ?arn:string ->
        ?description:string ->
          ?type_:collection_type ->
            ?status:collection_status ->
              ?name:string -> ?id:string -> unit -> update_collection_detail
val make_update_collection_response :
  ?update_collection_detail:update_collection_detail ->
    unit -> update_collection_response
val make_update_collection_request :
  ?client_token:string ->
    ?description:string -> id:string -> unit -> update_collection_request
val make_capacity_limits :
  ?max_search_capacity_in_oc_u:int ->
    ?max_indexing_capacity_in_oc_u:int -> unit -> capacity_limits
val make_account_settings_detail :
  ?capacity_limits:capacity_limits -> unit -> account_settings_detail
val make_update_account_settings_response :
  ?account_settings_detail:account_settings_detail ->
    unit -> update_account_settings_response
val make_update_account_settings_request :
  ?capacity_limits:capacity_limits -> unit -> update_account_settings_request
val make_access_policy_detail :
  ?last_modified_date:int ->
    ?created_date:int ->
      ?policy:CoreTypes.Document.t ->
        ?description:string ->
          ?policy_version:string ->
            ?name:string ->
              ?type_:access_policy_type -> unit -> access_policy_detail
val make_update_access_policy_response :
  ?access_policy_detail:access_policy_detail ->
    unit -> update_access_policy_response
val make_update_access_policy_request :
  ?client_token:string ->
    ?policy:string ->
      ?description:string ->
        policy_version:string ->
          name:string ->
            type_:access_policy_type -> unit -> update_access_policy_request
val make_untag_resource_response : unit -> unit
val make_untag_resource_request :
  tag_keys:string list ->
    resource_arn:string -> unit -> untag_resource_request
val make_tag : value:string -> key:string -> unit -> tag
val make_tag_resource_response : unit -> unit
val make_tag_resource_request :
  tags:tag list -> resource_arn:string -> unit -> tag_resource_request
val make_security_policy_summary :
  ?last_modified_date:int ->
    ?created_date:int ->
      ?description:string ->
        ?policy_version:string ->
          ?name:string ->
            ?type_:security_policy_type -> unit -> security_policy_summary
val make_security_policy_stats :
  ?network_policy_count:int ->
    ?encryption_policy_count:int -> unit -> security_policy_stats
val make_security_config_summary :
  ?last_modified_date:int ->
    ?created_date:int ->
      ?description:string ->
        ?config_version:string ->
          ?type_:security_config_type ->
            ?id:string -> unit -> security_config_summary
val make_security_config_stats :
  ?saml_config_count:int -> unit -> security_config_stats
val make_list_tags_for_resource_response :
  ?tags:tag list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_arn:string -> unit -> list_tags_for_resource_request
val make_access_policy_stats :
  ?data_policy_count:int -> unit -> access_policy_stats
val make_lifecycle_policy_stats :
  ?retention_policy_count:int -> unit -> lifecycle_policy_stats
val make_get_policies_stats_response :
  ?total_policy_count:int ->
    ?lifecycle_policy_stats:lifecycle_policy_stats ->
      ?security_config_stats:security_config_stats ->
        ?security_policy_stats:security_policy_stats ->
          ?access_policy_stats:access_policy_stats ->
            unit -> get_policies_stats_response
val make_get_policies_stats_request : unit -> unit
val make_get_account_settings_response :
  ?account_settings_detail:account_settings_detail ->
    unit -> get_account_settings_response
val make_get_account_settings_request : unit -> unit
val make_create_security_policy_response :
  ?security_policy_detail:security_policy_detail ->
    unit -> create_security_policy_response
val make_create_security_policy_request :
  ?client_token:string ->
    ?description:string ->
      policy:string ->
        name:string ->
          type_:security_policy_type ->
            unit -> create_security_policy_request
val make_create_lifecycle_policy_response :
  ?lifecycle_policy_detail:lifecycle_policy_detail ->
    unit -> create_lifecycle_policy_response
val make_create_lifecycle_policy_request :
  ?client_token:string ->
    ?description:string ->
      policy:string ->
        name:string ->
          type_:lifecycle_policy_type ->
            unit -> create_lifecycle_policy_request
val make_batch_get_vpc_endpoint_response :
  ?vpc_endpoint_error_details:vpc_endpoint_error_detail list ->
    ?vpc_endpoint_details:vpc_endpoint_detail list ->
      unit -> batch_get_vpc_endpoint_response
val make_batch_get_vpc_endpoint_request :
  ids:string list -> unit -> batch_get_vpc_endpoint_request
val make_lifecycle_policy_error_detail :
  ?error_code:string ->
    ?error_message:string ->
      ?name:string ->
        ?type_:lifecycle_policy_type -> unit -> lifecycle_policy_error_detail
val make_batch_get_lifecycle_policy_response :
  ?lifecycle_policy_error_details:lifecycle_policy_error_detail list ->
    ?lifecycle_policy_details:lifecycle_policy_detail list ->
      unit -> batch_get_lifecycle_policy_response
val make_lifecycle_policy_identifier :
  name:string ->
    type_:lifecycle_policy_type -> unit -> lifecycle_policy_identifier
val make_batch_get_lifecycle_policy_request :
  identifiers:lifecycle_policy_identifier list ->
    unit -> batch_get_lifecycle_policy_request
val make_effective_lifecycle_policy_detail :
  ?no_min_retention_period:bool ->
    ?retention_period:string ->
      ?resource_type:resource_type ->
        ?policy_name:string ->
          ?resource:string ->
            ?type_:lifecycle_policy_type ->
              unit -> effective_lifecycle_policy_detail
val make_effective_lifecycle_policy_error_detail :
  ?error_code:string ->
    ?error_message:string ->
      ?resource:string ->
        ?type_:lifecycle_policy_type ->
          unit -> effective_lifecycle_policy_error_detail
val make_batch_get_effective_lifecycle_policy_response :
  ?effective_lifecycle_policy_error_details:effective_lifecycle_policy_error_detail
    list ->
    ?effective_lifecycle_policy_details:effective_lifecycle_policy_detail
      list -> unit -> batch_get_effective_lifecycle_policy_response
val make_lifecycle_policy_resource_identifier :
  resource:string ->
    type_:lifecycle_policy_type ->
      unit -> lifecycle_policy_resource_identifier
val make_batch_get_effective_lifecycle_policy_request :
  resource_identifiers:lifecycle_policy_resource_identifier list ->
    unit -> batch_get_effective_lifecycle_policy_request
val make_collection_detail :
  ?dashboard_endpoint:string ->
    ?collection_endpoint:string ->
      ?last_modified_date:int ->
        ?created_date:int ->
          ?standby_replicas:standby_replicas ->
            ?kms_key_arn:string ->
              ?arn:string ->
                ?description:string ->
                  ?type_:collection_type ->
                    ?status:collection_status ->
                      ?name:string -> ?id:string -> unit -> collection_detail
val make_collection_error_detail :
  ?error_code:string ->
    ?error_message:string ->
      ?name:string -> ?id:string -> unit -> collection_error_detail
val make_batch_get_collection_response :
  ?collection_error_details:collection_error_detail list ->
    ?collection_details:collection_detail list ->
      unit -> batch_get_collection_response
val make_batch_get_collection_request :
  ?names:string list ->
    ?ids:string list -> unit -> batch_get_collection_request
val make_list_vpc_endpoints_response :
  ?next_token:string ->
    ?vpc_endpoint_summaries:vpc_endpoint_summary list ->
      unit -> list_vpc_endpoints_response
val make_list_vpc_endpoints_request :
  ?max_results:int ->
    ?next_token:string ->
      ?vpc_endpoint_filters:vpc_endpoint_filters ->
        unit -> list_vpc_endpoints_request
val make_list_security_policies_response :
  ?next_token:string ->
    ?security_policy_summaries:security_policy_summary list ->
      unit -> list_security_policies_response
val make_list_security_policies_request :
  ?max_results:int ->
    ?next_token:string ->
      ?resource:string list ->
        type_:security_policy_type -> unit -> list_security_policies_request
val make_list_security_configs_response :
  ?next_token:string ->
    ?security_config_summaries:security_config_summary list ->
      unit -> list_security_configs_response
val make_list_security_configs_request :
  ?max_results:int ->
    ?next_token:string ->
      type_:security_config_type -> unit -> list_security_configs_request
val make_lifecycle_policy_summary :
  ?last_modified_date:int ->
    ?created_date:int ->
      ?description:string ->
        ?policy_version:string ->
          ?name:string ->
            ?type_:lifecycle_policy_type -> unit -> lifecycle_policy_summary
val make_list_lifecycle_policies_response :
  ?next_token:string ->
    ?lifecycle_policy_summaries:lifecycle_policy_summary list ->
      unit -> list_lifecycle_policies_response
val make_list_lifecycle_policies_request :
  ?max_results:int ->
    ?next_token:string ->
      ?resources:string list ->
        type_:lifecycle_policy_type ->
          unit -> list_lifecycle_policies_request
val make_collection_summary :
  ?arn:string ->
    ?status:collection_status ->
      ?name:string -> ?id:string -> unit -> collection_summary
val make_list_collections_response :
  ?next_token:string ->
    ?collection_summaries:collection_summary list ->
      unit -> list_collections_response
val make_collection_filters :
  ?status:collection_status -> ?name:string -> unit -> collection_filters
val make_list_collections_request :
  ?max_results:int ->
    ?next_token:string ->
      ?collection_filters:collection_filters ->
        unit -> list_collections_request
val make_access_policy_summary :
  ?last_modified_date:int ->
    ?created_date:int ->
      ?description:string ->
        ?policy_version:string ->
          ?name:string ->
            ?type_:access_policy_type -> unit -> access_policy_summary
val make_list_access_policies_response :
  ?next_token:string ->
    ?access_policy_summaries:access_policy_summary list ->
      unit -> list_access_policies_response
val make_list_access_policies_request :
  ?max_results:int ->
    ?next_token:string ->
      ?resource:string list ->
        type_:access_policy_type -> unit -> list_access_policies_request
val make_get_security_policy_response :
  ?security_policy_detail:security_policy_detail ->
    unit -> get_security_policy_response
val make_get_security_policy_request :
  name:string ->
    type_:security_policy_type -> unit -> get_security_policy_request
val make_get_security_config_response :
  ?security_config_detail:security_config_detail ->
    unit -> get_security_config_response
val make_get_security_config_request :
  id:string -> unit -> get_security_config_request
val make_get_access_policy_response :
  ?access_policy_detail:access_policy_detail ->
    unit -> get_access_policy_response
val make_get_access_policy_request :
  name:string ->
    type_:access_policy_type -> unit -> get_access_policy_request
val make_delete_vpc_endpoint_detail :
  ?status:vpc_endpoint_status ->
    ?name:string -> ?id:string -> unit -> delete_vpc_endpoint_detail
val make_delete_vpc_endpoint_response :
  ?delete_vpc_endpoint_detail:delete_vpc_endpoint_detail ->
    unit -> delete_vpc_endpoint_response
val make_delete_vpc_endpoint_request :
  ?client_token:string -> id:string -> unit -> delete_vpc_endpoint_request
val make_delete_security_policy_response : unit -> unit
val make_delete_security_policy_request :
  ?client_token:string ->
    name:string ->
      type_:security_policy_type -> unit -> delete_security_policy_request
val make_delete_security_config_response : unit -> unit
val make_delete_security_config_request :
  ?client_token:string -> id:string -> unit -> delete_security_config_request
val make_delete_lifecycle_policy_response : unit -> unit
val make_delete_lifecycle_policy_request :
  ?client_token:string ->
    name:string ->
      type_:lifecycle_policy_type -> unit -> delete_lifecycle_policy_request
val make_delete_collection_detail :
  ?status:collection_status ->
    ?name:string -> ?id:string -> unit -> delete_collection_detail
val make_delete_collection_response :
  ?delete_collection_detail:delete_collection_detail ->
    unit -> delete_collection_response
val make_delete_collection_request :
  ?client_token:string -> id:string -> unit -> delete_collection_request
val make_delete_access_policy_response : unit -> unit
val make_delete_access_policy_request :
  ?client_token:string ->
    name:string ->
      type_:access_policy_type -> unit -> delete_access_policy_request
val make_create_vpc_endpoint_detail :
  ?status:vpc_endpoint_status ->
    ?name:string -> ?id:string -> unit -> create_vpc_endpoint_detail
val make_create_vpc_endpoint_response :
  ?create_vpc_endpoint_detail:create_vpc_endpoint_detail ->
    unit -> create_vpc_endpoint_response
val make_create_vpc_endpoint_request :
  ?client_token:string ->
    ?security_group_ids:string list ->
      subnet_ids:string list ->
        vpc_id:string -> name:string -> unit -> create_vpc_endpoint_request
val make_create_security_config_response :
  ?security_config_detail:security_config_detail ->
    unit -> create_security_config_response
val make_create_security_config_request :
  ?client_token:string ->
    ?saml_options:saml_config_options ->
      ?description:string ->
        name:string ->
          type_:security_config_type ->
            unit -> create_security_config_request
val make_create_collection_detail :
  ?last_modified_date:int ->
    ?created_date:int ->
      ?standby_replicas:standby_replicas ->
        ?kms_key_arn:string ->
          ?arn:string ->
            ?description:string ->
              ?type_:collection_type ->
                ?status:collection_status ->
                  ?name:string ->
                    ?id:string -> unit -> create_collection_detail
val make_create_collection_response :
  ?create_collection_detail:create_collection_detail ->
    unit -> create_collection_response
val make_create_collection_request :
  ?client_token:string ->
    ?standby_replicas:standby_replicas ->
      ?tags:tag list ->
        ?description:string ->
          ?type_:collection_type ->
            name:string -> unit -> create_collection_request
val make_create_access_policy_response :
  ?access_policy_detail:access_policy_detail ->
    unit -> create_access_policy_response
val make_create_access_policy_request :
  ?client_token:string ->
    ?description:string ->
      policy:string ->
        name:string ->
          type_:access_policy_type -> unit -> create_access_policy_request(** {1:operations Operations} *)

module CreateAccessPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_access_policy_request ->
        (create_access_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a data access policy for OpenSearch Serverless. Access policies limit access to collections and the resources within them, and allow a user to access that data irrespective of the access mechanism or network source. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data access control for Amazon OpenSearch Serverless}.\n"]
module CreateCollection :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_collection_request ->
        (create_collection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `OcuLimitExceededException of ocu_limit_exceeded_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a new OpenSearch Serverless collection. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html}Creating and managing Amazon OpenSearch Serverless collections}.\n"]
module CreateSecurityConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_security_config_request ->
        (create_security_config_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Specifies a security configuration for OpenSearch Serverless. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML authentication for Amazon OpenSearch Serverless}. \n"]
module CreateVpcEndpoint :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_vpc_endpoint_request ->
        (create_vpc_endpoint_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates an OpenSearch Serverless-managed interface VPC endpoint. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.\n"]
module DeleteAccessPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_access_policy_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes an OpenSearch Serverless access policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data access control for Amazon OpenSearch Serverless}.\n"]
module DeleteCollection :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_collection_request ->
        (delete_collection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes an OpenSearch Serverless collection. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html}Creating and managing Amazon OpenSearch Serverless collections}.\n"]
module DeleteLifecyclePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_lifecycle_policy_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes an OpenSearch Serverless lifecycle policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-delete}Deleting data lifecycle policies}.\n"]
module DeleteSecurityConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_security_config_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes a security configuration for OpenSearch Serverless. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML authentication for Amazon OpenSearch Serverless}.\n"]
module DeleteSecurityPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_security_policy_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Deletes an OpenSearch Serverless security policy.\n"]
module DeleteVpcEndpoint :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vpc_endpoint_request ->
        (delete_vpc_endpoint_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes an OpenSearch Serverless-managed interface endpoint. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.\n"]
module GetAccessPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_access_policy_request ->
        (get_access_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns an OpenSearch Serverless access policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data access control for Amazon OpenSearch Serverless}.\n"]
module GetSecurityConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_security_config_request ->
        (get_security_config_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns information about an OpenSearch Serverless security configuration. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML authentication for Amazon OpenSearch Serverless}.\n"]
module GetSecurityPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_security_policy_request ->
        (get_security_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns information about a configured OpenSearch Serverless security policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html}Network access for Amazon OpenSearch Serverless} and {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html}Encryption at rest for Amazon OpenSearch Serverless}.\n"]
module ListAccessPolicies :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_access_policies_request ->
        (list_access_policies_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns information about a list of OpenSearch Serverless access policies.\n"]
module ListCollections :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_collections_request ->
        (list_collections_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists all OpenSearch Serverless collections. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html}Creating and managing Amazon OpenSearch Serverless collections}.\n\n  Make sure to include an empty request body \\{\\} if you don't include any collection filters in the request.\n  \n   "]
module ListLifecyclePolicies :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_lifecycle_policies_request ->
        (list_lifecycle_policies_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns a list of OpenSearch Serverless lifecycle policies. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-list}Viewing data lifecycle policies}.\n"]
module ListSecurityConfigs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_security_configs_request ->
        (list_security_configs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns information about configured OpenSearch Serverless security configurations. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML authentication for Amazon OpenSearch Serverless}.\n"]
module ListSecurityPolicies :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_security_policies_request ->
        (list_security_policies_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns information about configured OpenSearch Serverless security policies.\n"]
module ListVpcEndpoints :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_vpc_endpoints_request ->
        (list_vpc_endpoints_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns the OpenSearch Serverless-managed interface VPC endpoints associated with the current account. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.\n"]
module BatchGetCollection :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_collection_request ->
        (batch_get_collection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns attributes for one or more collections, including the collection endpoint and the OpenSearch Dashboards endpoint. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html}Creating and managing Amazon OpenSearch Serverless collections}.\n"]
module BatchGetEffectiveLifecyclePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_effective_lifecycle_policy_request ->
        (batch_get_effective_lifecycle_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns a list of successful and failed retrievals for the OpenSearch Serverless indexes. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-list}Viewing data lifecycle policies}.\n"]
module BatchGetLifecyclePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_lifecycle_policy_request ->
        (batch_get_lifecycle_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns one or more configured OpenSearch Serverless lifecycle policies. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-list}Viewing data lifecycle policies}.\n"]
module BatchGetVpcEndpoint :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_vpc_endpoint_request ->
        (batch_get_vpc_endpoint_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns attributes for one or more VPC endpoints associated with the current account. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.\n"]
module CreateLifecyclePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_lifecycle_policy_request ->
        (create_lifecycle_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a lifecyle policy to be applied to OpenSearch Serverless indexes. Lifecycle policies define the number of days or hours to retain the data on an OpenSearch Serverless index. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-create}Creating data lifecycle policies}.\n"]
module CreateSecurityPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_security_policy_request ->
        (create_security_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a security policy to be used by one or more OpenSearch Serverless collections. Security policies provide access to a collection and its OpenSearch Dashboards endpoint from public networks or specific VPC endpoints. They also allow you to secure a collection with a KMS encryption key. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html}Network access for Amazon OpenSearch Serverless} and {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html}Encryption at rest for Amazon OpenSearch Serverless}.\n"]
module GetAccountSettings :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (get_account_settings_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns account-level settings related to OpenSearch Serverless.\n"]
module GetPoliciesStats :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (get_policies_stats_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception ]) result
end[@@ocaml.doc
     "Returns statistical information about your OpenSearch Serverless access policies, security configurations, and security policies.\n"]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns the tags for an OpenSearch Serverless resource. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-collection.html}Tagging Amazon OpenSearch Serverless collections}.\n"]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Associates tags with an OpenSearch Serverless resource. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-collection.html}Tagging Amazon OpenSearch Serverless collections}.\n"]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Removes a tag or set of tags from an OpenSearch Serverless resource. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-collection.html}Tagging Amazon OpenSearch Serverless collections}.\n"]
module UpdateAccessPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_access_policy_request ->
        (update_access_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates an OpenSearch Serverless access policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data access control for Amazon OpenSearch Serverless}.\n"]
module UpdateAccountSettings :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_account_settings_request ->
        (update_account_settings_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Update the OpenSearch Serverless settings for the current Amazon Web Services account. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-scaling.html}Managing capacity limits for Amazon OpenSearch Serverless}.\n"]
module UpdateCollection :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_collection_request ->
        (update_collection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Updates an OpenSearch Serverless collection.\n"]
module UpdateLifecyclePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_lifecycle_policy_request ->
        (update_lifecycle_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates an OpenSearch Serverless access policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-update}Updating data lifecycle policies}.\n"]
module UpdateSecurityConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_security_config_request ->
        (update_security_config_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates a security configuration for OpenSearch Serverless. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML authentication for Amazon OpenSearch Serverless}.\n"]
module UpdateSecurityPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_security_policy_request ->
        (update_security_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates an OpenSearch Serverless security policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html}Network access for Amazon OpenSearch Serverless} and {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html}Encryption at rest for Amazon OpenSearch Serverless}.\n"]
module UpdateVpcEndpoint :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_vpc_endpoint_request ->
        (update_vpc_endpoint_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates an OpenSearch Serverless-managed interface endpoint. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.\n"]