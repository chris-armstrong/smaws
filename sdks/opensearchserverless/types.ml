type nonrec access_policy = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec policy_description = string [@@ocaml.doc ""]

type nonrec policy_version = string [@@ocaml.doc ""]

type nonrec policy_name = string [@@ocaml.doc ""]

type nonrec access_policy_type = Data [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec access_policy_detail = {
  type_ : access_policy_type option; [@ocaml.doc "The type of access policy.\n"]
  name : policy_name option; [@ocaml.doc "The name of the policy.\n"]
  policy_version : policy_version option; [@ocaml.doc "The version of the policy.\n"]
  description : policy_description option; [@ocaml.doc "The description of the policy.\n"]
  policy : Smaws_Lib.Smithy_api.Types.document option;
      [@ocaml.doc "The JSON policy document without any whitespaces.\n"]
  created_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The date the policy was created.\n"]
  last_modified_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The timestamp of when the policy was last modified.\n"]
}
[@@ocaml.doc "Details about an OpenSearch Serverless access policy.\n"]

type nonrec access_policy_stats = {
  data_policy_count : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The number of data access policies in the current account.\n"]
}
[@@ocaml.doc "Statistics for an OpenSearch Serverless access policy.\n"]

type nonrec access_policy_summary = {
  type_ : access_policy_type option;
      [@ocaml.doc "The type of access policy. Currently, the only available type is [data].\n"]
  name : policy_name option; [@ocaml.doc "The name of the access policy.\n"]
  policy_version : policy_version option; [@ocaml.doc "The version of the policy.\n"]
  description : policy_description option; [@ocaml.doc "The description of the access policy.\n"]
  created_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The Epoch time when the access policy was created.\n"]
  last_modified_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The date and time when the collection was last modified.\n"]
}
[@@ocaml.doc "A summary of the data access policy.\n"]

type nonrec access_policy_summaries = access_policy_summary list [@@ocaml.doc ""]

type nonrec search_capacity_value = int [@@ocaml.doc ""]

type nonrec indexing_capacity_value = int [@@ocaml.doc ""]

type nonrec capacity_limits = {
  max_indexing_capacity_in_oc_u : indexing_capacity_value option;
      [@ocaml.doc "The maximum indexing capacity for collections.\n"]
  max_search_capacity_in_oc_u : search_capacity_value option;
      [@ocaml.doc "The maximum search capacity for collections.\n"]
}
[@@ocaml.doc
  "The maximum capacity limits for all OpenSearch Serverless collections, in OpenSearch Compute \
   Units (OCUs). These limits are used to scale your collections based on the current workload. \
   For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-scaling.html}Managing \
   capacity limits for Amazon OpenSearch Serverless}.\n"]

type nonrec account_settings_detail = { capacity_limits : capacity_limits option [@ocaml.doc ""] }
[@@ocaml.doc "OpenSearch Serverless-related information for the current account.\n"]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec autoscaling_status =
  | ACTION_SCALING_UP [@ocaml.doc ""]
  | ACTION_SCALING_DOWN [@ocaml.doc ""]
  | NO_ACTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "Thrown when the HTTP request contains invalid input or is missing required input.\n"]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "Thrown when an error internal to the service occurs while processing a request.\n"]

type nonrec collection_name = string [@@ocaml.doc ""]

type nonrec collection_id = string [@@ocaml.doc ""]

type nonrec collection_error_detail = {
  id : collection_id option;
      [@ocaml.doc
        "If the request contains collection IDs, the response includes the IDs provided in the \
         request.\n"]
  name : collection_name option;
      [@ocaml.doc
        "If the request contains collection names, the response includes the names provided in the \
         request.\n"]
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A description of the error. For example, [The specified Collection is not found.] \n"]
  error_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The error code for the request. For example, [NOT_FOUND].\n"]
}
[@@ocaml.doc "Error information for an OpenSearch Serverless request.\n"]

type nonrec collection_error_details = collection_error_detail list [@@ocaml.doc ""]

type nonrec collection_group_name = string [@@ocaml.doc ""]

type nonrec fips_endpoints = {
  collection_endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "FIPS-compliant collection endpoint used to submit index, search, and data upload requests \
         to an OpenSearch Serverless collection. This endpoint uses FIPS 140-3 validated \
         cryptography and is required for federal government workloads.\n"]
  dashboard_endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "FIPS-compliant endpoint used to access OpenSearch Dashboards. This endpoint uses FIPS \
         140-3 validated cryptography and is required for federal government workloads that need \
         dashboard visualization capabilities.\n"]
}
[@@ocaml.doc
  "FIPS-compliant endpoint URLs for an OpenSearch Serverless collection. These endpoints ensure \
   all data transmission uses FIPS 140-3 validated cryptographic implementations, meeting federal \
   security requirements for government workloads.\n"]

type nonrec serverless_vector_acceleration_status =
  | ENABLED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | ALLOWED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec vector_options = {
  serverless_vector_acceleration : serverless_vector_acceleration_status;
      [@ocaml.doc
        "Specifies whether serverless vector acceleration is enabled for the collection.\n"]
}
[@@ocaml.doc
  "Configuration options for vector search capabilities in an OpenSearch Serverless collection.\n"]

type nonrec deletion_protection = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec standby_replicas = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec collection_type =
  | SEARCH [@ocaml.doc ""]
  | TIMESERIES [@ocaml.doc ""]
  | VECTORSEARCH [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec collection_status =
  | CREATING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | UPDATE_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec collection_detail = {
  id : collection_id option; [@ocaml.doc "A unique identifier for the collection.\n"]
  name : collection_name option; [@ocaml.doc "The name of the collection.\n"]
  status : collection_status option; [@ocaml.doc "The current status of the collection.\n"]
  type_ : collection_type option; [@ocaml.doc "The type of collection.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A description of the collection.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the collection.\n"]
  kms_key_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The ARN of the Amazon Web Services KMS key used to encrypt the collection.\n"]
  standby_replicas : standby_replicas option;
      [@ocaml.doc "Details about an OpenSearch Serverless collection.\n"]
  deletion_protection : deletion_protection option;
      [@ocaml.doc
        "Indicates whether deletion protection is [ENABLED] or [DISABLED] for the collection.\n"]
  vector_options : vector_options option;
      [@ocaml.doc "Configuration options for vector search capabilities in the collection.\n"]
  created_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The Epoch time when the collection was created.\n"]
  last_modified_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The date and time when the collection was last modified.\n"]
  collection_endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Collection-specific endpoint used to submit index, search, and data upload requests to an \
         OpenSearch Serverless collection.\n"]
  dashboard_endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Collection-specific endpoint used to access OpenSearch Dashboards.\n"]
  fips_endpoints : fips_endpoints option;
      [@ocaml.doc
        "FIPS-compliant endpoints for the collection. These endpoints use FIPS 140-3 validated \
         cryptographic modules and are required for federal government workloads that must comply \
         with FedRAMP security standards.\n"]
  failure_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A failure code associated with the request.\n"]
  failure_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A message associated with the failure code.\n"]
  collection_group_name : collection_group_name option;
      [@ocaml.doc "The name of the collection group that contains this collection.\n"]
}
[@@ocaml.doc
  "Details about each OpenSearch Serverless collection, including the collection endpoint, the \
   OpenSearch Dashboards endpoint, and FIPS-compliant endpoints for federal government workloads.\n"]

type nonrec collection_details = collection_detail list [@@ocaml.doc ""]

type nonrec batch_get_collection_response = {
  collection_details : collection_details option; [@ocaml.doc "Details about each collection.\n"]
  collection_error_details : collection_error_details option;
      [@ocaml.doc "Error information for the request.\n"]
}
[@@ocaml.doc ""]

type nonrec collection_names = collection_name list [@@ocaml.doc ""]

type nonrec collection_ids = collection_id list [@@ocaml.doc ""]

type nonrec batch_get_collection_request = {
  ids : collection_ids option;
      [@ocaml.doc
        "A list of collection IDs. You can't provide names and IDs in the same request. The ID is \
         part of the collection endpoint. You can also retrieve it using the \
         {{:https://docs.aws.amazon.com/opensearch-service/latest/ServerlessAPIReference/API_ListCollections.html}ListCollections} \
         API.\n"]
  names : collection_names option;
      [@ocaml.doc
        "A list of collection names. You can't provide names and IDs in the same request.\n"]
}
[@@ocaml.doc ""]

type nonrec collection_group_id = string [@@ocaml.doc ""]

type nonrec collection_group_error_detail = {
  id : collection_group_id option;
      [@ocaml.doc
        "If the request contains collection group IDs, the response includes the IDs provided in \
         the request.\n"]
  name : collection_group_name option;
      [@ocaml.doc
        "If the request contains collection group names, the response includes the names provided \
         in the request.\n"]
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A description of the error. For example, [The specified Collection Group is not found.] \n"]
  error_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The error code for the request. For example, [NOT_FOUND].\n"]
}
[@@ocaml.doc "Error details for a collection group operation.\n"]

type nonrec collection_group_error_details = collection_group_error_detail list [@@ocaml.doc ""]

type nonrec serverless_generation = CLASSIC [@ocaml.doc ""] | NEXTGEN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec capacity_details = {
  capacity_in_ocu : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc "The current capacity in OpenSearch Compute Units (OCUs).\n"]
  autoscaling_status : autoscaling_status option;
      [@ocaml.doc "The current autoscaling status for the collection group.\n"]
}
[@@ocaml.doc
  "Capacity details for an OpenSearch Serverless collection group, including the current capacity \
   and autoscaling status.\n"]

type nonrec current_capacity = {
  search : capacity_details option; [@ocaml.doc "The search capacity for the collection group.\n"]
  indexing : capacity_details option;
      [@ocaml.doc "The indexing capacity for the collection group.\n"]
}
[@@ocaml.doc
  "Current search and indexing capacity for an OpenSearch Serverless collection group. Measured in \
   OpenSearch Compute Units (OCUs).\n"]

type nonrec collection_group_min_search_capacity_value = float [@@ocaml.doc ""]

type nonrec collection_group_min_indexing_capacity_value = float [@@ocaml.doc ""]

type nonrec collection_group_max_search_capacity_value = float [@@ocaml.doc ""]

type nonrec collection_group_max_indexing_capacity_value = float [@@ocaml.doc ""]

type nonrec collection_group_capacity_limits = {
  max_indexing_capacity_in_oc_u : collection_group_max_indexing_capacity_value option;
      [@ocaml.doc "The maximum indexing capacity for collections in the group.\n"]
  max_search_capacity_in_oc_u : collection_group_max_search_capacity_value option;
      [@ocaml.doc "The maximum search capacity for collections in the group.\n"]
  min_indexing_capacity_in_oc_u : collection_group_min_indexing_capacity_value option;
      [@ocaml.doc "The minimum indexing capacity for collections in the group.\n"]
  min_search_capacity_in_oc_u : collection_group_min_search_capacity_value option;
      [@ocaml.doc "The minimum search capacity for collections in the group.\n"]
}
[@@ocaml.doc
  "Capacity limits for a collection group. These limits define the minimum and maximum OpenSearch \
   Compute Units (OCUs) for indexing and search operations that can be used by collections in the \
   group.\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The key to use in the tag.\n"]
  value : tag_value; [@ocaml.doc "The value of the tag.\n"]
}
[@@ocaml.doc "A map of key-value pairs associated to an OpenSearch Serverless resource.\n"]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec collection_group_detail = {
  id : collection_group_id option; [@ocaml.doc "The unique identifier of the collection group.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the collection group.\n"]
  name : collection_group_name option; [@ocaml.doc "The name of the collection group.\n"]
  standby_replicas : standby_replicas option;
      [@ocaml.doc "Indicates whether standby replicas are used for the collection group.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The description of the collection group.\n"]
  tags : tags option;
      [@ocaml.doc "A map of key-value pairs associated with the collection group.\n"]
  created_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The Epoch time when the collection group was created.\n"]
  capacity_limits : collection_group_capacity_limits option;
      [@ocaml.doc
        "The capacity limits for the collection group, in OpenSearch Compute Units (OCUs).\n"]
  current_capacity : current_capacity option;
      [@ocaml.doc "Current search and indexing capacity for the collection group.\n"]
  number_of_collections : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of collections associated with the collection group.\n"]
  generation : serverless_generation option;
      [@ocaml.doc "The generation of Amazon OpenSearch Serverless for the collection group.\n"]
}
[@@ocaml.doc "Details about a collection group.\n"]

type nonrec collection_group_details = collection_group_detail list [@@ocaml.doc ""]

type nonrec batch_get_collection_group_response = {
  collection_group_details : collection_group_details option;
      [@ocaml.doc "Details about each collection group.\n"]
  collection_group_error_details : collection_group_error_details option;
      [@ocaml.doc "Error information for the request.\n"]
}
[@@ocaml.doc ""]

type nonrec collection_group_names = collection_group_name list [@@ocaml.doc ""]

type nonrec collection_group_ids = collection_group_id list [@@ocaml.doc ""]

type nonrec batch_get_collection_group_request = {
  ids : collection_group_ids option;
      [@ocaml.doc
        "A list of collection group IDs. You can't provide names and IDs in the same request.\n"]
  names : collection_group_names option;
      [@ocaml.doc
        "A list of collection group names. You can't provide names and IDs in the same request.\n"]
}
[@@ocaml.doc ""]

type nonrec resource = string [@@ocaml.doc ""]

type nonrec lifecycle_policy_type = Retention [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec effective_lifecycle_policy_error_detail = {
  type_ : lifecycle_policy_type option; [@ocaml.doc "The type of lifecycle policy.\n"]
  resource : resource option; [@ocaml.doc "The name of OpenSearch Serverless index resource.\n"]
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A description of the error. For example, [The specified Index resource is not found].\n"]
  error_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The error code for the request.\n"]
}
[@@ocaml.doc "Error information for an OpenSearch Serverless request.\n"]

type nonrec effective_lifecycle_policy_error_details = effective_lifecycle_policy_error_detail list
[@@ocaml.doc ""]

type nonrec resource_type = Index [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec effective_lifecycle_policy_detail = {
  type_ : lifecycle_policy_type option; [@ocaml.doc "The type of lifecycle policy.\n"]
  resource : resource option; [@ocaml.doc "The name of the OpenSearch Serverless index resource.\n"]
  policy_name : policy_name option; [@ocaml.doc "The name of the lifecycle policy.\n"]
  resource_type : resource_type option;
      [@ocaml.doc
        "The type of OpenSearch Serverless resource. Currently, the only supported resource is \
         [index].\n"]
  retention_period : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The minimum number of index retention in days or hours. This is an optional parameter \
         that will return only if it\226\128\153s set.\n"]
  no_min_retention_period : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "The minimum number of index retention days set. That is an optional param that will \
         return as [true] if the minimum number of days or hours is not set to a index resource.\n"]
}
[@@ocaml.doc "Error information for an OpenSearch Serverless request.\n"]

type nonrec effective_lifecycle_policy_details = effective_lifecycle_policy_detail list
[@@ocaml.doc ""]

type nonrec batch_get_effective_lifecycle_policy_response = {
  effective_lifecycle_policy_details : effective_lifecycle_policy_details option;
      [@ocaml.doc "A list of lifecycle policies applied to the OpenSearch Serverless indexes.\n"]
  effective_lifecycle_policy_error_details : effective_lifecycle_policy_error_details option;
      [@ocaml.doc "A list of resources for which retrieval failed.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_name = string [@@ocaml.doc ""]

type nonrec lifecycle_policy_resource_identifier = {
  type_ : lifecycle_policy_type; [@ocaml.doc "The type of lifecycle policy.\n"]
  resource : resource_name; [@ocaml.doc "The name of the OpenSearch Serverless ilndex resource.\n"]
}
[@@ocaml.doc "The unique identifiers of policy types and resource names.\n"]

type nonrec lifecycle_policy_resource_identifiers = lifecycle_policy_resource_identifier list
[@@ocaml.doc ""]

type nonrec batch_get_effective_lifecycle_policy_request = {
  resource_identifiers : lifecycle_policy_resource_identifiers;
      [@ocaml.doc "The unique identifiers of policy types and resource names.\n"]
}
[@@ocaml.doc ""]

type nonrec lifecycle_policy_error_detail = {
  type_ : lifecycle_policy_type option; [@ocaml.doc "The type of lifecycle policy.\n"]
  name : policy_name option; [@ocaml.doc "The name of the lifecycle policy.\n"]
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A description of the error. For example, [The specified Lifecycle Policy is not found].\n"]
  error_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The error code for the request. For example, [NOT_FOUND].\n"]
}
[@@ocaml.doc "Error information for an OpenSearch Serverless request.\n"]

type nonrec lifecycle_policy_error_details = lifecycle_policy_error_detail list [@@ocaml.doc ""]

type nonrec lifecycle_policy_detail = {
  type_ : lifecycle_policy_type option; [@ocaml.doc "The type of lifecycle policy.\n"]
  name : policy_name option; [@ocaml.doc "The name of the lifecycle policy.\n"]
  policy_version : policy_version option; [@ocaml.doc "The version of the lifecycle policy.\n"]
  description : policy_description option; [@ocaml.doc "The description of the lifecycle policy.\n"]
  policy : Smaws_Lib.Smithy_api.Types.document option;
      [@ocaml.doc "The JSON policy document without any whitespaces.\n"]
  created_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The date the lifecycle policy was created.\n"]
  last_modified_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The timestamp of when the lifecycle policy was last modified.\n"]
}
[@@ocaml.doc "Details about an OpenSearch Serverless lifecycle policy.\n"]

type nonrec lifecycle_policy_details = lifecycle_policy_detail list [@@ocaml.doc ""]

type nonrec batch_get_lifecycle_policy_response = {
  lifecycle_policy_details : lifecycle_policy_details option;
      [@ocaml.doc
        "A list of lifecycle policies matched to the input policy name and policy type.\n"]
  lifecycle_policy_error_details : lifecycle_policy_error_details option;
      [@ocaml.doc "A list of lifecycle policy names and policy types for which retrieval failed.\n"]
}
[@@ocaml.doc ""]

type nonrec lifecycle_policy_identifier = {
  type_ : lifecycle_policy_type; [@ocaml.doc "The type of lifecycle policy.\n"]
  name : policy_name; [@ocaml.doc "The name of the lifecycle policy.\n"]
}
[@@ocaml.doc "The unique identifiers of policy types and policy names.\n"]

type nonrec lifecycle_policy_identifiers = lifecycle_policy_identifier list [@@ocaml.doc ""]

type nonrec batch_get_lifecycle_policy_request = {
  identifiers : lifecycle_policy_identifiers;
      [@ocaml.doc "The unique identifiers of policy types and policy names.\n"]
}
[@@ocaml.doc ""]

type nonrec vpc_endpoint_id = string [@@ocaml.doc ""]

type nonrec vpc_endpoint_error_detail = {
  id : vpc_endpoint_id option; [@ocaml.doc "The unique identifier of the VPC endpoint.\n"]
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "An error message describing the reason for the failure.\n"]
  error_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The error code for the failed request.\n"]
}
[@@ocaml.doc "Error information for a failed [BatchGetVpcEndpoint] request.\n"]

type nonrec vpc_endpoint_error_details = vpc_endpoint_error_detail list [@@ocaml.doc ""]

type nonrec vpc_endpoint_status =
  | PENDING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec security_group_id = string [@@ocaml.doc ""]

type nonrec security_group_ids = security_group_id list [@@ocaml.doc ""]

type nonrec subnet_id = string [@@ocaml.doc ""]

type nonrec subnet_ids = subnet_id list [@@ocaml.doc ""]

type nonrec vpc_id = string [@@ocaml.doc ""]

type nonrec vpc_endpoint_name = string [@@ocaml.doc ""]

type nonrec vpc_endpoint_detail = {
  id : vpc_endpoint_id option; [@ocaml.doc "The unique identifier of the endpoint.\n"]
  name : vpc_endpoint_name option; [@ocaml.doc "The name of the endpoint.\n"]
  vpc_id : vpc_id option;
      [@ocaml.doc "The ID of the VPC from which you access OpenSearch Serverless.\n"]
  subnet_ids : subnet_ids option;
      [@ocaml.doc "The ID of the subnets from which you access OpenSearch Serverless.\n"]
  security_group_ids : security_group_ids option;
      [@ocaml.doc
        "The unique identifiers of the security groups that define the ports, protocols, and \
         sources for inbound traffic that you are authorizing into your endpoint.\n"]
  status : vpc_endpoint_status option; [@ocaml.doc "The current status of the endpoint.\n"]
  created_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The date the endpoint was created.\n"]
  failure_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A failure code associated with the request.\n"]
  failure_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A message associated with the failure code.\n"]
}
[@@ocaml.doc "Details about an OpenSearch Serverless-managed interface endpoint.\n"]

type nonrec vpc_endpoint_details = vpc_endpoint_detail list [@@ocaml.doc ""]

type nonrec batch_get_vpc_endpoint_response = {
  vpc_endpoint_details : vpc_endpoint_details option;
      [@ocaml.doc "Details about the specified VPC endpoint.\n"]
  vpc_endpoint_error_details : vpc_endpoint_error_details option;
      [@ocaml.doc "Error information for a failed request.\n"]
}
[@@ocaml.doc ""]

type nonrec vpc_endpoint_ids = vpc_endpoint_id list [@@ocaml.doc ""]

type nonrec batch_get_vpc_endpoint_request = {
  ids : vpc_endpoint_ids; [@ocaml.doc "A list of VPC endpoint identifiers.\n"]
}
[@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec collection = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec collection_filters = {
  name : collection_name option; [@ocaml.doc "The name of the collection.\n"]
  status : collection_status option; [@ocaml.doc "The current status of the collection.\n"]
  collection_group_name : collection_group_name option;
      [@ocaml.doc "The name of the collection group to filter by.\n"]
}
[@@ocaml.doc
  "A list of filter keys that you can use for LIST, UPDATE, and DELETE requests to OpenSearch \
   Serverless collections.\n"]

type nonrec collection_group = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec collection_group_summary = {
  id : collection_group_id option; [@ocaml.doc "The unique identifier of the collection group.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the collection group.\n"]
  name : collection_group_name option; [@ocaml.doc "The name of the collection group.\n"]
  number_of_collections : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of collections within the collection group.\n"]
  created_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The Epoch time when the collection group was created.\n"]
  capacity_limits : collection_group_capacity_limits option; [@ocaml.doc ""]
  generation : serverless_generation option;
      [@ocaml.doc "The generation of Amazon OpenSearch Serverless for the collection group.\n"]
}
[@@ocaml.doc "Summary information about a collection group.\n"]

type nonrec collection_group_summaries = collection_group_summary list [@@ocaml.doc ""]

type nonrec collection_summary = {
  id : collection_id option; [@ocaml.doc "The unique identifier of the collection.\n"]
  name : collection_name option; [@ocaml.doc "The name of the collection.\n"]
  status : collection_status option; [@ocaml.doc "The current status of the collection.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the collection.\n"]
  kms_key_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The ARN of the Amazon Web Services Key Management Service key used to encrypt the \
         collection.\n"]
  collection_group_name : collection_group_name option;
      [@ocaml.doc "The name of the collection group that contains this collection.\n"]
}
[@@ocaml.doc "Details about each OpenSearch Serverless collection.\n"]

type nonrec collection_summaries = collection_summary list [@@ocaml.doc ""]

type nonrec config_description = string [@@ocaml.doc ""]

type nonrec config_name = string [@@ocaml.doc ""]

type nonrec conflict_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "When creating a resource, thrown when a resource with the same name already exists or is being \
   created. When deleting a resource, thrown when the resource is not in the ACTIVE, FAILED, or \
   UPDATE_FAILED state.\n"]

type nonrec service_quota_exceeded_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "Description of the error."]
  resource_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Identifier of the resource affected."]
  resource_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Type of the resource affected."]
  service_code : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Service Quotas requirement to identify originating service."]
  quota_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Service Quotas requirement to identify originating quota."]
}
[@@ocaml.doc
  "Thrown when you attempt to create more resources than the service allows based on service quotas.\n"]

type nonrec create_access_policy_response = {
  access_policy_detail : access_policy_detail option;
      [@ocaml.doc "Details about the created access policy.\n"]
}
[@@ocaml.doc ""]

type nonrec policy_document = string [@@ocaml.doc ""]

type nonrec create_access_policy_request = {
  type_ : access_policy_type; [@ocaml.doc "The type of policy.\n"]
  name : policy_name; [@ocaml.doc "The name of the policy.\n"]
  description : policy_description option;
      [@ocaml.doc
        "A description of the policy. Typically used to store information about the permissions \
         defined in the policy.\n"]
  policy : policy_document;
      [@ocaml.doc "The JSON policy document to use as the content for the policy.\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec ocu_limit_exceeded_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "Description of the error."]
}
[@@ocaml.doc
  "Thrown when the collection you're attempting to create results in a number of search or \
   indexing OCUs that exceeds the account limit. \n"]

type nonrec create_collection_detail = {
  id : collection_id option; [@ocaml.doc "The unique identifier of the collection.\n"]
  name : collection_name option; [@ocaml.doc "The name of the collection.\n"]
  status : collection_status option; [@ocaml.doc "The current status of the collection.\n"]
  type_ : collection_type option; [@ocaml.doc "The type of collection.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A description of the collection.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the collection.\n"]
  kms_key_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the KMS key with which to encrypt the collection.\n"]
  standby_replicas : standby_replicas option;
      [@ocaml.doc "Creates details about an OpenSearch Serverless collection.\n"]
  deletion_protection : deletion_protection option;
      [@ocaml.doc
        "Indicates whether deletion protection is [ENABLED] or [DISABLED] for the collection.\n"]
  vector_options : vector_options option;
      [@ocaml.doc "Configuration options for vector search capabilities in the collection.\n"]
  created_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The Epoch time when the collection was created.\n"]
  last_modified_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The date and time when the collection was last modified.\n"]
  collection_group_name : collection_group_name option;
      [@ocaml.doc "The name of the collection group that contains this collection.\n"]
}
[@@ocaml.doc "Details about the created OpenSearch Serverless collection.\n"]

type nonrec create_collection_response = {
  create_collection_detail : create_collection_detail option;
      [@ocaml.doc "Details about the collection.\n"]
}
[@@ocaml.doc ""]

type nonrec encryption_config = {
  a_ws_owned_key : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether to use an Amazon Web Services-owned key for encryption.\n"]
  kms_key_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The ARN of the Amazon Web Services Key Management Service key used to encrypt the \
         collection.\n"]
}
[@@ocaml.doc "Encryption settings for a collection.\n"]

type nonrec create_collection_request = {
  name : collection_name; [@ocaml.doc "Name of the collection.\n"]
  type_ : collection_type option; [@ocaml.doc "The type of collection.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Description of the collection.\n"]
  tags : tags option;
      [@ocaml.doc
        "An arbitrary set of tags (key\226\128\147value pairs) to associate with the OpenSearch \
         Serverless collection.\n"]
  standby_replicas : standby_replicas option;
      [@ocaml.doc "Indicates whether standby replicas should be used for a collection.\n"]
  vector_options : vector_options option;
      [@ocaml.doc "Configuration options for vector search capabilities in the collection.\n"]
  collection_group_name : collection_group_name option;
      [@ocaml.doc "The name of the collection group to associate with the collection.\n"]
  encryption_config : encryption_config option;
      [@ocaml.doc "Encryption settings for the collection.\n"]
  deletion_protection : deletion_protection option;
      [@ocaml.doc
        "Indicates whether to enable deletion protection for the collection. When set to \
         [ENABLED], the collection cannot be deleted.\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec create_collection_group_detail = {
  id : collection_group_id option; [@ocaml.doc "The unique identifier of the collection group.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the collection group.\n"]
  name : collection_group_name option; [@ocaml.doc "The name of the collection group.\n"]
  standby_replicas : standby_replicas option;
      [@ocaml.doc "Indicates whether standby replicas are used for the collection group.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The description of the collection group.\n"]
  tags : tags option;
      [@ocaml.doc "A map of key-value pairs associated with the collection group.\n"]
  created_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The Epoch time when the collection group was created.\n"]
  capacity_limits : collection_group_capacity_limits option;
      [@ocaml.doc
        "The capacity limits for the collection group, in OpenSearch Compute Units (OCUs).\n"]
  generation : serverless_generation option;
      [@ocaml.doc "The generation of Amazon OpenSearch Serverless for the collection group.\n"]
}
[@@ocaml.doc "Details about the created collection group.\n"]

type nonrec create_collection_group_response = {
  create_collection_group_detail : create_collection_group_detail option;
      [@ocaml.doc "Details about the created collection group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_collection_group_request = {
  name : collection_group_name; [@ocaml.doc "The name of the collection group.\n"]
  standby_replicas : standby_replicas;
      [@ocaml.doc "Indicates whether standby replicas should be used for a collection group.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A description of the collection group.\n"]
  tags : tags option;
      [@ocaml.doc
        "An arbitrary set of tags (key\226\128\147value pairs) to associate with the OpenSearch \
         Serverless collection group.\n"]
  capacity_limits : collection_group_capacity_limits option;
      [@ocaml.doc
        "The capacity limits for the collection group, in OpenSearch Compute Units (OCUs). These \
         limits control the maximum and minimum capacity for collections within the group.\n"]
  generation : serverless_generation option;
      [@ocaml.doc
        "The generation of Amazon OpenSearch Serverless for the collection group. Valid values are \
         [CLASSIC] and [NEXTGEN].\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec iam_identity_center_group_attribute =
  | GroupId [@ocaml.doc ""]
  | GroupName [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec iam_identity_center_user_attribute =
  | UserId [@ocaml.doc ""]
  | UserName [@ocaml.doc ""]
  | Email [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec iam_identity_center_instance_arn = string [@@ocaml.doc ""]

type nonrec create_iam_identity_center_config_options = {
  instance_arn : iam_identity_center_instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance used to integrate with OpenSearch Serverless.\n"]
  user_attribute : iam_identity_center_user_attribute option;
      [@ocaml.doc
        "The user attribute for this IAM Identity Center integration. Defaults to [UserId].\n"]
  group_attribute : iam_identity_center_group_attribute option;
      [@ocaml.doc
        "The group attribute for this IAM Identity Center integration. Defaults to [GroupId].\n"]
}
[@@ocaml.doc
  "Describes IAM Identity Center options for creating an OpenSearch Serverless security \
   configuration in the form of a key-value map.\n"]

type nonrec resource_not_found_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "Thrown when accessing or deleting a resource that does not exist.\n"]

type nonrec create_index_response = unit [@@ocaml.doc ""]

type nonrec index_schema = Smaws_Lib.CoreTypes.Document.t [@@ocaml.doc ""]

type nonrec index_name = string [@@ocaml.doc ""]

type nonrec create_index_request = {
  id : collection_id;
      [@ocaml.doc "The unique identifier of the collection in which to create the index.\n"]
  index_name : index_name;
      [@ocaml.doc
        "The name of the index to create. Index names must be lowercase and can't begin with \
         underscores (_) or hyphens (-).\n"]
  index_schema : index_schema option;
      [@ocaml.doc
        "The JSON schema definition for the index, including field mappings and settings.\n"]
}
[@@ocaml.doc ""]

type nonrec create_lifecycle_policy_response = {
  lifecycle_policy_detail : lifecycle_policy_detail option;
      [@ocaml.doc "Details about the created lifecycle policy.\n"]
}
[@@ocaml.doc ""]

type nonrec create_lifecycle_policy_request = {
  type_ : lifecycle_policy_type; [@ocaml.doc "The type of lifecycle policy.\n"]
  name : policy_name; [@ocaml.doc "The name of the lifecycle policy.\n"]
  description : policy_description option; [@ocaml.doc "A description of the lifecycle policy.\n"]
  policy : policy_document;
      [@ocaml.doc "The JSON policy document to use as the content for the lifecycle policy.\n"]
  client_token : client_token option;
      [@ocaml.doc "A unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec iam_federation_user_attribute = string [@@ocaml.doc ""]

type nonrec iam_federation_group_attribute = string [@@ocaml.doc ""]

type nonrec iam_federation_config_options = {
  group_attribute : iam_federation_group_attribute option;
      [@ocaml.doc
        "The group attribute for this IAM federation integration. This attribute is used to map \
         identity provider groups to OpenSearch Serverless permissions.\n"]
  user_attribute : iam_federation_user_attribute option;
      [@ocaml.doc
        "The user attribute for this IAM federation integration. This attribute is used to \
         identify users in the federated authentication process.\n"]
}
[@@ocaml.doc
  "Describes IAM federation options for an OpenSearch Serverless security configuration in the \
   form of a key-value map. These options define how OpenSearch Serverless integrates with \
   external identity providers using federation.\n"]

type nonrec iam_identity_center_application_arn = string [@@ocaml.doc ""]

type nonrec iam_identity_center_config_options = {
  instance_arn : iam_identity_center_instance_arn option;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance used to integrate with OpenSearch Serverless.\n"]
  application_arn : iam_identity_center_application_arn option;
      [@ocaml.doc
        "The ARN of the IAM Identity Center application used to integrate with OpenSearch \
         Serverless.\n"]
  application_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The name of the IAM Identity Center application used to integrate with OpenSearch \
         Serverless.\n"]
  application_description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The description of the IAM Identity Center application used to integrate with OpenSearch \
         Serverless.\n"]
  user_attribute : iam_identity_center_user_attribute option;
      [@ocaml.doc
        "The user attribute for this IAM Identity Center integration. Defaults to [UserId] \n"]
  group_attribute : iam_identity_center_group_attribute option;
      [@ocaml.doc
        "The group attribute for this IAM Identity Center integration. Defaults to [GroupId].\n"]
}
[@@ocaml.doc
  "Describes IAM Identity Center options for an OpenSearch Serverless security configuration in \
   the form of a key-value map.\n"]

type nonrec open_search_serverless_entity_id = string [@@ocaml.doc ""]

type nonrec saml_group_attribute = string [@@ocaml.doc ""]

type nonrec saml_user_attribute = string [@@ocaml.doc ""]

type nonrec saml_metadata = string [@@ocaml.doc ""]

type nonrec saml_config_options = {
  metadata : saml_metadata;
      [@ocaml.doc "The XML IdP metadata file generated from your identity provider.\n"]
  user_attribute : saml_user_attribute option;
      [@ocaml.doc "A user attribute for this SAML integration.\n"]
  group_attribute : saml_group_attribute option;
      [@ocaml.doc "The group attribute for this SAML integration.\n"]
  open_search_serverless_entity_id : open_search_serverless_entity_id option;
      [@ocaml.doc
        "Custom entity ID attribute to override the default entity ID for this SAML integration.\n"]
  session_timeout : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The session timeout, in minutes. Default is 60 minutes (12 hours).\n"]
}
[@@ocaml.doc
  "Describes SAML options for an OpenSearch Serverless security configuration in the form of a \
   key-value map.\n"]

type nonrec security_config_type =
  | Saml [@ocaml.doc ""]
  | Iamidentitycenter [@ocaml.doc ""]
  | Iamfederation [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec security_config_id = string [@@ocaml.doc ""]

type nonrec security_config_detail = {
  id : security_config_id option;
      [@ocaml.doc "The unique identifier of the security configuration.\n"]
  type_ : security_config_type option; [@ocaml.doc "The type of security configuration.\n"]
  config_version : policy_version option;
      [@ocaml.doc "The version of the security configuration.\n"]
  description : config_description option;
      [@ocaml.doc "The description of the security configuration.\n"]
  saml_options : saml_config_options option;
      [@ocaml.doc "SAML options for the security configuration in the form of a key-value map.\n"]
  iam_identity_center_options : iam_identity_center_config_options option;
      [@ocaml.doc "Describes IAM Identity Center options in the form of a key-value map.\n"]
  iam_federation_options : iam_federation_config_options option;
      [@ocaml.doc
        "Describes IAM federation options in the form of a key-value map. Contains configuration \
         details about how OpenSearch Serverless integrates with external identity providers \
         through federation.\n"]
  created_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The date the configuration was created.\n"]
  last_modified_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The timestamp of when the configuration was last modified.\n"]
}
[@@ocaml.doc "Details about a security configuration for OpenSearch Serverless.\n"]

type nonrec create_security_config_response = {
  security_config_detail : security_config_detail option;
      [@ocaml.doc "Details about the created security configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec create_security_config_request = {
  type_ : security_config_type; [@ocaml.doc "The type of security configuration.\n"]
  name : config_name; [@ocaml.doc "The name of the security configuration.\n"]
  description : config_description option;
      [@ocaml.doc "A description of the security configuration.\n"]
  saml_options : saml_config_options option;
      [@ocaml.doc
        "Describes SAML options in the form of a key-value map. This field is required if you \
         specify [SAML] for the [type] parameter.\n"]
  iam_identity_center_options : create_iam_identity_center_config_options option;
      [@ocaml.doc
        "Describes IAM Identity Center options in the form of a key-value map. This field is \
         required if you specify [iamidentitycenter] for the [type] parameter.\n"]
  iam_federation_options : iam_federation_config_options option;
      [@ocaml.doc
        "Describes IAM federation options in the form of a key-value map. This field is required \
         if you specify [iamFederation] for the [type] parameter.\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec security_policy_type = Encryption [@ocaml.doc ""] | Network [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec security_policy_detail = {
  type_ : security_policy_type option; [@ocaml.doc "The type of security policy.\n"]
  name : policy_name option; [@ocaml.doc "The name of the policy.\n"]
  policy_version : policy_version option; [@ocaml.doc "The version of the policy.\n"]
  description : policy_description option; [@ocaml.doc "The description of the security policy.\n"]
  policy : Smaws_Lib.Smithy_api.Types.document option;
      [@ocaml.doc "The JSON policy document without any whitespaces.\n"]
  created_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The date the policy was created.\n"]
  last_modified_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The timestamp of when the policy was last modified.\n"]
}
[@@ocaml.doc "Details about an OpenSearch Serverless security policy.\n"]

type nonrec create_security_policy_response = {
  security_policy_detail : security_policy_detail option;
      [@ocaml.doc "Details about the created security policy.\n"]
}
[@@ocaml.doc ""]

type nonrec create_security_policy_request = {
  type_ : security_policy_type; [@ocaml.doc "The type of security policy.\n"]
  name : policy_name; [@ocaml.doc "The name of the policy.\n"]
  description : policy_description option;
      [@ocaml.doc
        "A description of the policy. Typically used to store information about the permissions \
         defined in the policy.\n"]
  policy : policy_document;
      [@ocaml.doc "The JSON policy document to use as the content for the new policy.\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec create_vpc_endpoint_detail = {
  id : vpc_endpoint_id option; [@ocaml.doc "The unique identifier of the endpoint.\n"]
  name : vpc_endpoint_name option; [@ocaml.doc "The name of the endpoint.\n"]
  status : vpc_endpoint_status option;
      [@ocaml.doc "The current status in the endpoint creation process.\n"]
}
[@@ocaml.doc
  "Creation details for an OpenSearch Serverless-managed interface endpoint. For more information, \
   see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access \
   Amazon OpenSearch Serverless using an interface endpoint}.\n"]

type nonrec create_vpc_endpoint_response = {
  create_vpc_endpoint_detail : create_vpc_endpoint_detail option;
      [@ocaml.doc "Details about the created interface VPC endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec create_vpc_endpoint_request = {
  name : vpc_endpoint_name; [@ocaml.doc "The name of the interface endpoint.\n"]
  vpc_id : vpc_id;
      [@ocaml.doc "The ID of the VPC from which you'll access OpenSearch Serverless.\n"]
  subnet_ids : subnet_ids;
      [@ocaml.doc "The ID of one or more subnets from which you'll access OpenSearch Serverless.\n"]
  security_group_ids : security_group_ids option;
      [@ocaml.doc
        "The unique identifiers of the security groups that define the ports, protocols, and \
         sources for inbound traffic that you are authorizing into your endpoint.\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_access_policy_response = unit [@@ocaml.doc ""]

type nonrec delete_access_policy_request = {
  type_ : access_policy_type; [@ocaml.doc "The type of policy.\n"]
  name : policy_name; [@ocaml.doc "The name of the policy to delete.\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_collection_detail = {
  id : collection_id option; [@ocaml.doc "The unique identifier of the collection.\n"]
  name : collection_name option; [@ocaml.doc "The name of the collection.\n"]
  status : collection_status option; [@ocaml.doc "The current status of the collection.\n"]
  deletion_protection : deletion_protection option;
      [@ocaml.doc
        "Indicates whether deletion protection is [ENABLED] or [DISABLED] for the collection.\n"]
}
[@@ocaml.doc "Details about a deleted OpenSearch Serverless collection.\n"]

type nonrec delete_collection_response = {
  delete_collection_detail : delete_collection_detail option;
      [@ocaml.doc "Details of the deleted collection.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_collection_request = {
  id : collection_id;
      [@ocaml.doc
        "The unique identifier of the collection. For example, [1iu5usc406kd]. The ID is part of \
         the collection endpoint. You can also retrieve it using the \
         {{:https://docs.aws.amazon.com/opensearch-service/latest/ServerlessAPIReference/API_ListCollections.html}ListCollections} \
         API.\n"]
  client_token : client_token option;
      [@ocaml.doc "A unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_collection_group_response = unit [@@ocaml.doc ""]

type nonrec delete_collection_group_request = {
  id : collection_group_id;
      [@ocaml.doc "The unique identifier of the collection group to delete.\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_index_response = unit [@@ocaml.doc ""]

type nonrec delete_index_request = {
  id : collection_id;
      [@ocaml.doc "The unique identifier of the collection containing the index to delete.\n"]
  index_name : index_name; [@ocaml.doc "The name of the index to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_lifecycle_policy_response = unit [@@ocaml.doc ""]

type nonrec delete_lifecycle_policy_request = {
  type_ : lifecycle_policy_type; [@ocaml.doc "The type of lifecycle policy.\n"]
  name : policy_name; [@ocaml.doc "The name of the policy to delete.\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_security_config_response = unit [@@ocaml.doc ""]

type nonrec delete_security_config_request = {
  id : security_config_id;
      [@ocaml.doc
        "The security configuration identifier. For SAML the ID will be \
         [saml/<accountId>/<idpProviderName>]. For example, [saml/123456789123/OKTADev].\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_security_policy_response = unit [@@ocaml.doc ""]

type nonrec delete_security_policy_request = {
  type_ : security_policy_type; [@ocaml.doc "The type of policy.\n"]
  name : policy_name; [@ocaml.doc "The name of the policy to delete.\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_vpc_endpoint_detail = {
  id : vpc_endpoint_id option; [@ocaml.doc "The unique identifier of the endpoint.\n"]
  name : vpc_endpoint_name option; [@ocaml.doc "The name of the endpoint.\n"]
  status : vpc_endpoint_status option;
      [@ocaml.doc "The current status of the endpoint deletion process.\n"]
}
[@@ocaml.doc "Deletion details for an OpenSearch Serverless-managed interface endpoint.\n"]

type nonrec delete_vpc_endpoint_response = {
  delete_vpc_endpoint_detail : delete_vpc_endpoint_detail option;
      [@ocaml.doc "Details about the deleted endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_vpc_endpoint_request = {
  id : vpc_endpoint_id; [@ocaml.doc "The VPC endpoint identifier.\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_access_policy_response = {
  access_policy_detail : access_policy_detail option;
      [@ocaml.doc "Details about the requested access policy.\n"]
}
[@@ocaml.doc ""]

type nonrec get_access_policy_request = {
  type_ : access_policy_type;
      [@ocaml.doc "Tye type of policy. Currently, the only supported value is [data].\n"]
  name : policy_name; [@ocaml.doc "The name of the access policy.\n"]
}
[@@ocaml.doc ""]

type nonrec get_account_settings_response = {
  account_settings_detail : account_settings_detail option;
      [@ocaml.doc "OpenSearch Serverless-related details for the current account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_account_settings_request = unit [@@ocaml.doc ""]

type nonrec get_index_response = {
  index_schema : index_schema option;
      [@ocaml.doc
        "The JSON schema definition for the index, including field mappings and settings.\n"]
}
[@@ocaml.doc ""]

type nonrec get_index_request = {
  id : collection_id; [@ocaml.doc "The unique identifier of the collection containing the index.\n"]
  index_name : index_name; [@ocaml.doc "The name of the index to retrieve information about.\n"]
}
[@@ocaml.doc ""]

type nonrec lifecycle_policy_stats = {
  retention_policy_count : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The number of retention lifecycle policies in the current account.\n"]
}
[@@ocaml.doc "Statistics for an OpenSearch Serverless lifecycle policy.\n"]

type nonrec security_config_stats = {
  saml_config_count : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The number of security configurations in the current account.\n"]
}
[@@ocaml.doc "Statistics for an OpenSearch Serverless security configuration.\n"]

type nonrec security_policy_stats = {
  encryption_policy_count : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The number of encryption policies in the current account.\n"]
  network_policy_count : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The number of network policies in the current account.\n"]
}
[@@ocaml.doc "Statistics for an OpenSearch Serverless security policy.\n"]

type nonrec get_policies_stats_response = {
  access_policy_stats : access_policy_stats option;
      [@ocaml.doc "Information about the data access policies in your account.\n"]
  security_policy_stats : security_policy_stats option;
      [@ocaml.doc "Information about the security policies in your account.\n"]
  security_config_stats : security_config_stats option;
      [@ocaml.doc "Information about the security configurations in your account.\n"]
  lifecycle_policy_stats : lifecycle_policy_stats option;
      [@ocaml.doc "Information about the lifecycle policies in your account.\n"]
  total_policy_count : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc
        "The total number of OpenSearch Serverless security policies and configurations in your \
         account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_policies_stats_request = unit [@@ocaml.doc ""]

type nonrec get_security_config_response = {
  security_config_detail : security_config_detail option;
      [@ocaml.doc "Details of the requested security configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec get_security_config_request = {
  id : security_config_id; [@ocaml.doc "The unique identifier of the security configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec get_security_policy_response = {
  security_policy_detail : security_policy_detail option;
      [@ocaml.doc "Details about the requested security policy.\n"]
}
[@@ocaml.doc ""]

type nonrec get_security_policy_request = {
  type_ : security_policy_type; [@ocaml.doc "The type of security policy.\n"]
  name : policy_name; [@ocaml.doc "The name of the security policy.\n"]
}
[@@ocaml.doc ""]

type nonrec index = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec lifecycle_policy = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec lifecycle_policy_summary = {
  type_ : lifecycle_policy_type option; [@ocaml.doc "The type of lifecycle policy.\n"]
  name : policy_name option; [@ocaml.doc "The name of the lifecycle policy.\n"]
  policy_version : policy_version option; [@ocaml.doc "The version of the lifecycle policy.\n"]
  description : policy_description option; [@ocaml.doc "The description of the lifecycle policy.\n"]
  created_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The Epoch time when the lifecycle policy was created.\n"]
  last_modified_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The date and time when the lifecycle policy was last modified.\n"]
}
[@@ocaml.doc "A summary of the lifecycle policy.\n"]

type nonrec lifecycle_policy_summaries = lifecycle_policy_summary list [@@ocaml.doc ""]

type nonrec lifecycle_resource = string [@@ocaml.doc ""]

type nonrec lifecycle_resource_filter = lifecycle_resource list [@@ocaml.doc ""]

type nonrec list_access_policies_response = {
  access_policy_summaries : access_policy_summaries option;
      [@ocaml.doc "Details about the requested access policies.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "When [nextToken] is returned, there are more results available. The value of [nextToken] \
         is a unique pagination token for each page. Make the call again using the returned token \
         to retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_filter = resource list [@@ocaml.doc ""]

type nonrec list_access_policies_request = {
  type_ : access_policy_type; [@ocaml.doc "The type of access policy.\n"]
  resource : resource_filter option;
      [@ocaml.doc "Resource filters (can be collections or indexes) that policies can apply to.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If your initial [ListAccessPolicies] operation returns a [nextToken], you can include the \
         returned [nextToken] in subsequent [ListAccessPolicies] operations, which returns results \
         in the next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "An optional parameter that specifies the maximum number of results to return. You can use \
         [nextToken] to get the next page of results. The default is 20.\n"]
}
[@@ocaml.doc ""]

type nonrec list_collection_groups_response = {
  collection_group_summaries : collection_group_summaries option;
      [@ocaml.doc "Details about each collection group.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "When [nextToken] is returned, there are more results available. The value of [nextToken] \
         is a unique pagination token for each page. Make the call again using the returned token \
         to retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_collection_groups_request = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If your initial [ListCollectionGroups] operation returns a [nextToken], you can include \
         the returned [nextToken] in subsequent [ListCollectionGroups] operations, which returns \
         results in the next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of results to return. Default is 20. You can use [nextToken] to get \
         the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_collections_response = {
  collection_summaries : collection_summaries option;
      [@ocaml.doc "Details about each collection.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "When [nextToken] is returned, there are more results available. The value of [nextToken] \
         is a unique pagination token for each page. Make the call again using the returned token \
         to retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_collections_request = {
  collection_filters : collection_filters option;
      [@ocaml.doc " A list of filter names and values that you can use for requests.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If your initial [ListCollections] operation returns a [nextToken], you can include the \
         returned [nextToken] in subsequent [ListCollections] operations, which returns results in \
         the next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of results to return. Default is 20. You can use [nextToken] to get \
         the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_lifecycle_policies_response = {
  lifecycle_policy_summaries : lifecycle_policy_summaries option;
      [@ocaml.doc "Details about the requested lifecycle policies.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "When [nextToken] is returned, there are more results available. The value of [nextToken] \
         is a unique pagination token for each page. Make the call again using the returned token \
         to retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_lifecycle_policies_request = {
  type_ : lifecycle_policy_type; [@ocaml.doc "The type of lifecycle policy.\n"]
  resources : lifecycle_resource_filter option;
      [@ocaml.doc
        "Resource filters that policies can apply to. Currently, the only supported resource type \
         is [index].\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If your initial [ListLifecyclePolicies] operation returns a [nextToken], you can include \
         the returned [nextToken] in subsequent [ListLifecyclePolicies] operations, which returns \
         results in the next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "An optional parameter that specifies the maximum number of results to return. You can use \
         use [nextToken] to get the next page of results. The default is 10.\n"]
}
[@@ocaml.doc ""]

type nonrec security_config_summary = {
  id : security_config_id option;
      [@ocaml.doc "The unique identifier of the security configuration.\n"]
  type_ : security_config_type option; [@ocaml.doc "The type of security configuration.\n"]
  config_version : policy_version option;
      [@ocaml.doc "The version of the security configuration.\n"]
  description : config_description option;
      [@ocaml.doc "The description of the security configuration.\n"]
  created_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The Epoch time when the security configuration was created.\n"]
  last_modified_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The timestamp of when the configuration was last modified.\n"]
}
[@@ocaml.doc "A summary of a security configuration for OpenSearch Serverless.\n"]

type nonrec security_config_summaries = security_config_summary list [@@ocaml.doc ""]

type nonrec list_security_configs_response = {
  security_config_summaries : security_config_summaries option;
      [@ocaml.doc "Details about the security configurations in your account.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "When [nextToken] is returned, there are more results available. The value of [nextToken] \
         is a unique pagination token for each page. Make the call again using the returned token \
         to retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_security_configs_request = {
  type_ : security_config_type; [@ocaml.doc "The type of security configuration.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If your initial [ListSecurityConfigs] operation returns a [nextToken], you can include \
         the returned [nextToken] in subsequent [ListSecurityConfigs] operations, which returns \
         results in the next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "An optional parameter that specifies the maximum number of results to return. You can use \
         [nextToken] to get the next page of results. The default is 20.\n"]
}
[@@ocaml.doc ""]

type nonrec security_policy_summary = {
  type_ : security_policy_type option; [@ocaml.doc "The type of security policy.\n"]
  name : policy_name option; [@ocaml.doc "The name of the policy.\n"]
  policy_version : policy_version option; [@ocaml.doc "The version of the policy.\n"]
  description : policy_description option; [@ocaml.doc "The description of the security policy.\n"]
  created_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The date the policy was created.\n"]
  last_modified_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The timestamp of when the policy was last modified.\n"]
}
[@@ocaml.doc "A summary of a security policy for OpenSearch Serverless.\n"]

type nonrec security_policy_summaries = security_policy_summary list [@@ocaml.doc ""]

type nonrec list_security_policies_response = {
  security_policy_summaries : security_policy_summaries option;
      [@ocaml.doc "Details about the security policies in your account.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "When [nextToken] is returned, there are more results available. The value of [nextToken] \
         is a unique pagination token for each page. Make the call again using the returned token \
         to retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_security_policies_request = {
  type_ : security_policy_type; [@ocaml.doc "The type of policy.\n"]
  resource : resource_filter option;
      [@ocaml.doc "Resource filters (can be collection or indexes) that policies can apply to. \n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If your initial [ListSecurityPolicies] operation returns a [nextToken], you can include \
         the returned [nextToken] in subsequent [ListSecurityPolicies] operations, which returns \
         results in the next page.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "An optional parameter that specifies the maximum number of results to return. You can use \
         [nextToken] to get the next page of results. The default is 20.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tags option; [@ocaml.doc "The tags associated with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource. The resource must be active (not in the \
         [DELETING] state), and must be owned by the account ID included in the request.\n"]
}
[@@ocaml.doc ""]

type nonrec vpc_endpoint_summary = {
  id : vpc_endpoint_id option; [@ocaml.doc "The unique identifier of the endpoint.\n"]
  name : vpc_endpoint_name option; [@ocaml.doc "The name of the endpoint.\n"]
  status : vpc_endpoint_status option; [@ocaml.doc "The current status of the endpoint.\n"]
}
[@@ocaml.doc "The VPC endpoint object.\n"]

type nonrec vpc_endpoint_summaries = vpc_endpoint_summary list [@@ocaml.doc ""]

type nonrec list_vpc_endpoints_response = {
  vpc_endpoint_summaries : vpc_endpoint_summaries option;
      [@ocaml.doc "Details about each VPC endpoint, including the name and current status.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "When [nextToken] is returned, there are more results available. The value of [nextToken] \
         is a unique pagination token for each page. Make the call again using the returned token \
         to retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec vpc_endpoint_filters = {
  status : vpc_endpoint_status option; [@ocaml.doc "The current status of the endpoint.\n"]
}
[@@ocaml.doc "Filter the results of a [ListVpcEndpoints] request.\n"]

type nonrec list_vpc_endpoints_request = {
  vpc_endpoint_filters : vpc_endpoint_filters option;
      [@ocaml.doc
        "Filter the results according to the current status of the VPC endpoint. Possible statuses \
         are [CREATING], [DELETING], [UPDATING], [ACTIVE], and [FAILED].\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If your initial [ListVpcEndpoints] operation returns a [nextToken], you can include the \
         returned [nextToken] in subsequent [ListVpcEndpoints] operations, which returns results \
         in the next page. \n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "An optional parameter that specifies the maximum number of results to return. You can use \
         [nextToken] to get the next page of results. The default is 20.\n"]
}
[@@ocaml.doc ""]

type nonrec update_vpc_endpoint_detail = {
  id : vpc_endpoint_id option; [@ocaml.doc "The unique identifier of the endpoint.\n"]
  name : vpc_endpoint_name option; [@ocaml.doc "The name of the endpoint.\n"]
  status : vpc_endpoint_status option;
      [@ocaml.doc "The current status of the endpoint update process.\n"]
  subnet_ids : subnet_ids option;
      [@ocaml.doc "The ID of the subnets from which you access OpenSearch Serverless.\n"]
  security_group_ids : security_group_ids option;
      [@ocaml.doc
        "The unique identifiers of the security groups that define the ports, protocols, and \
         sources for inbound traffic that you are authorizing into your endpoint.\n"]
  last_modified_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The timestamp of when the endpoint was last modified.\n"]
}
[@@ocaml.doc "Update details for an OpenSearch Serverless-managed interface endpoint.\n"]

type nonrec update_vpc_endpoint_response = {
  update_vpc_endpoint_detail : update_vpc_endpoint_detail option;
      [@ocaml.doc "Details about the updated VPC endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec update_vpc_endpoint_request = {
  id : vpc_endpoint_id; [@ocaml.doc "The unique identifier of the interface endpoint to update.\n"]
  add_subnet_ids : subnet_ids option;
      [@ocaml.doc "The ID of one or more subnets to add to the endpoint.\n"]
  remove_subnet_ids : subnet_ids option;
      [@ocaml.doc "The unique identifiers of the subnets to remove from the endpoint.\n"]
  add_security_group_ids : security_group_ids option;
      [@ocaml.doc
        "The unique identifiers of the security groups to add to the endpoint. Security groups \
         define the ports, protocols, and sources for inbound traffic that you are authorizing \
         into your endpoint.\n"]
  remove_security_group_ids : security_group_ids option;
      [@ocaml.doc "The unique identifiers of the security groups to remove from the endpoint.\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec update_account_settings_response = {
  account_settings_detail : account_settings_detail option;
      [@ocaml.doc
        "OpenSearch Serverless-related settings for the current Amazon Web Services account.\n"]
}
[@@ocaml.doc ""]

type nonrec update_account_settings_request = {
  capacity_limits : capacity_limits option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource to remove tags from. The resource must be \
         active (not in the [DELETING] state), and must be owned by the account ID included in the \
         request.\n"]
  tag_keys : tag_keys;
      [@ocaml.doc
        "The tag or set of tags to remove from the resource. All tag keys in the request must be \
         unique.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource. The resource must be active (not in the \
         [DELETING] state), and must be owned by the account ID included in the request.\n"]
  tags : tags;
      [@ocaml.doc
        "A list of tags (key-value pairs) to add to the resource. All tag keys in the request must \
         be unique.\n"]
}
[@@ocaml.doc ""]

type nonrec security_config = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec security_policy = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec update_access_policy_response = {
  access_policy_detail : access_policy_detail option;
      [@ocaml.doc "Details about the updated access policy.\n"]
}
[@@ocaml.doc ""]

type nonrec update_access_policy_request = {
  type_ : access_policy_type; [@ocaml.doc "The type of policy.\n"]
  name : policy_name; [@ocaml.doc "The name of the policy.\n"]
  policy_version : policy_version; [@ocaml.doc "The version of the policy being updated.\n"]
  description : policy_description option;
      [@ocaml.doc
        "A description of the policy. Typically used to store information about the permissions \
         defined in the policy.\n"]
  policy : policy_document option;
      [@ocaml.doc "The JSON policy document to use as the content for the policy.\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec update_collection_detail = {
  id : collection_id option; [@ocaml.doc "The unique identifier of the collection.\n"]
  name : collection_name option; [@ocaml.doc "The name of the collection.\n"]
  status : collection_status option; [@ocaml.doc "The current status of the collection.\n"]
  type_ : collection_type option; [@ocaml.doc "The collection type.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The description of the collection.\n"]
  vector_options : vector_options option;
      [@ocaml.doc "Configuration options for vector search capabilities in the collection.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the collection.\n"]
  created_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The date and time when the collection was created.\n"]
  last_modified_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The date and time when the collection was last modified.\n"]
  deletion_protection : deletion_protection option;
      [@ocaml.doc
        "Indicates whether deletion protection is [ENABLED] or [DISABLED] for the collection.\n"]
}
[@@ocaml.doc "Details about an updated OpenSearch Serverless collection.\n"]

type nonrec update_collection_response = {
  update_collection_detail : update_collection_detail option;
      [@ocaml.doc "Details about the updated collection.\n"]
}
[@@ocaml.doc ""]

type nonrec update_collection_request = {
  id : collection_id; [@ocaml.doc "The unique identifier of the collection.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A description of the collection.\n"]
  vector_options : vector_options option;
      [@ocaml.doc "Configuration options for vector search capabilities in the collection.\n"]
  deletion_protection : deletion_protection option;
      [@ocaml.doc
        "Indicates whether to enable or disable deletion protection for the collection. When set \
         to [ENABLED], the collection cannot be deleted.\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec update_collection_group_detail = {
  id : collection_group_id option; [@ocaml.doc "The unique identifier of the collection group.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the collection group.\n"]
  name : collection_group_name option; [@ocaml.doc "The name of the collection group.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The description of the collection group.\n"]
  capacity_limits : collection_group_capacity_limits option;
      [@ocaml.doc
        "The capacity limits for the collection group, in OpenSearch Compute Units (OCUs).\n"]
  created_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The Epoch time when the collection group was created.\n"]
  last_modified_date : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The date and time when the collection group was last modified.\n"]
  generation : serverless_generation option;
      [@ocaml.doc "The generation of Amazon OpenSearch Serverless for the collection group.\n"]
}
[@@ocaml.doc "Details about the updated collection group.\n"]

type nonrec update_collection_group_response = {
  update_collection_group_detail : update_collection_group_detail option;
      [@ocaml.doc "Details about the updated collection group.\n"]
}
[@@ocaml.doc ""]

type nonrec update_collection_group_request = {
  id : collection_group_id;
      [@ocaml.doc "The unique identifier of the collection group to update.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A new description for the collection group.\n"]
  capacity_limits : collection_group_capacity_limits option;
      [@ocaml.doc
        "Updated capacity limits for the collection group, in OpenSearch Compute Units (OCUs).\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec update_iam_identity_center_config_options = {
  user_attribute : iam_identity_center_user_attribute option;
      [@ocaml.doc
        "The user attribute for this IAM Identity Center integration. Defaults to [UserId].\n"]
  group_attribute : iam_identity_center_group_attribute option;
      [@ocaml.doc
        "The group attribute for this IAM Identity Center integration. Defaults to [GroupId].\n"]
}
[@@ocaml.doc
  "Describes IAM Identity Center options for updating an OpenSearch Serverless security \
   configuration in the form of a key-value map.\n"]

type nonrec update_index_response = unit [@@ocaml.doc ""]

type nonrec update_index_request = {
  id : collection_id;
      [@ocaml.doc "The unique identifier of the collection containing the index to update.\n"]
  index_name : index_name; [@ocaml.doc "The name of the index to update.\n"]
  index_schema : index_schema option;
      [@ocaml.doc
        "The updated JSON schema definition for the index, including field mappings and settings. \n"]
}
[@@ocaml.doc ""]

type nonrec update_lifecycle_policy_response = {
  lifecycle_policy_detail : lifecycle_policy_detail option;
      [@ocaml.doc "Details about the updated lifecycle policy.\n"]
}
[@@ocaml.doc ""]

type nonrec update_lifecycle_policy_request = {
  type_ : lifecycle_policy_type; [@ocaml.doc " The type of lifecycle policy.\n"]
  name : policy_name; [@ocaml.doc "The name of the policy.\n"]
  policy_version : policy_version; [@ocaml.doc "The version of the policy being updated.\n"]
  description : policy_description option; [@ocaml.doc "A description of the lifecycle policy.\n"]
  policy : policy_document option;
      [@ocaml.doc "The JSON policy document to use as the content for the lifecycle policy.\n"]
  client_token : client_token option;
      [@ocaml.doc "A unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec update_security_config_response = {
  security_config_detail : security_config_detail option;
      [@ocaml.doc "Details about the updated security configuration. \n"]
}
[@@ocaml.doc ""]

type nonrec update_security_config_request = {
  id : security_config_id;
      [@ocaml.doc
        "The security configuration identifier. For SAML the ID will be \
         [saml/<accountId>/<idpProviderName>]. For example, [saml/123456789123/OKTADev].\n"]
  config_version : policy_version;
      [@ocaml.doc
        "The version of the security configuration to be updated. You can find the most recent \
         version of a security configuration using the [GetSecurityPolicy] command.\n"]
  description : config_description option;
      [@ocaml.doc "A description of the security configuration.\n"]
  saml_options : saml_config_options option;
      [@ocaml.doc "SAML options in in the form of a key-value map.\n"]
  iam_identity_center_options_updates : update_iam_identity_center_config_options option;
      [@ocaml.doc "Describes IAM Identity Center options in the form of a key-value map.\n"]
  iam_federation_options : iam_federation_config_options option;
      [@ocaml.doc
        "Describes IAM federation options in the form of a key-value map for updating an existing \
         security configuration. Use this field to modify IAM federation settings for the security \
         configuration.\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec update_security_policy_response = {
  security_policy_detail : security_policy_detail option;
      [@ocaml.doc "Details about the updated security policy.\n"]
}
[@@ocaml.doc ""]

type nonrec update_security_policy_request = {
  type_ : security_policy_type; [@ocaml.doc "The type of access policy.\n"]
  name : policy_name; [@ocaml.doc "The name of the policy.\n"]
  policy_version : policy_version; [@ocaml.doc "The version of the policy being updated.\n"]
  description : policy_description option;
      [@ocaml.doc
        "A description of the policy. Typically used to store information about the permissions \
         defined in the policy.\n"]
  policy : policy_document option;
      [@ocaml.doc "The JSON policy document to use as the content for the new policy.\n"]
  client_token : client_token option;
      [@ocaml.doc "Unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec vpc_endpoint = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]
