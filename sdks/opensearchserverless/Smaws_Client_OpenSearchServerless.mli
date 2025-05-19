(** 
    OpenSearchServerless client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec vpc_endpoint_status =
  | PENDING 
  | DELETING 
  | ACTIVE 
  | FAILED [@@ocaml.doc ""]
type nonrec vpc_endpoint_summary =
  {
  status: vpc_endpoint_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc "The VPC endpoint object.\n"]
type nonrec vpc_endpoint_filters = {
  status: vpc_endpoint_status option }[@@ocaml.doc
                                        "Filter the results of a [ListVpcEndpoints] request.\n"]
type nonrec vpc_endpoint_error_detail =
  {
  error_code: string option ;
  error_message: string option ;
  id: string option }[@@ocaml.doc
                       "Error information for a failed [BatchGetVpcEndpoint] request.\n"]
type nonrec vpc_endpoint_detail =
  {
  created_date: int option ;
  status: vpc_endpoint_status option ;
  security_group_ids: string list option ;
  subnet_ids: string list option ;
  vpc_id: string option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Details about an OpenSearch Serverless-managed interface endpoint.\n"]
type nonrec validation_exception = {
  message: string option }[@@ocaml.doc
                            "Thrown when the HTTP request contains invalid input or is missing required input.\n"]
type nonrec update_vpc_endpoint_detail =
  {
  last_modified_date: int option ;
  security_group_ids: string list option ;
  subnet_ids: string list option ;
  status: vpc_endpoint_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Update details for an OpenSearch Serverless-managed interface endpoint.\n"]
type nonrec update_vpc_endpoint_response =
  {
  update_vpc_endpoint_detail: update_vpc_endpoint_detail option }[@@ocaml.doc
                                                                   ""]
type nonrec update_vpc_endpoint_request =
  {
  client_token: string option ;
  remove_security_group_ids: string list option ;
  add_security_group_ids: string list option ;
  remove_subnet_ids: string list option ;
  add_subnet_ids: string list option ;
  id: string }[@@ocaml.doc ""]
type nonrec internal_server_exception = {
  message: string option }[@@ocaml.doc
                            "Thrown when an error internal to the service occurs while processing a request.\n"]
type nonrec conflict_exception = {
  message: string option }[@@ocaml.doc
                            "When creating a resource, thrown when a resource with the same name already exists or is being created. When deleting a resource, thrown when the resource is not in the ACTIVE or FAILED state.\n"]
type nonrec security_policy_type =
  | Encryption 
  | Network [@@ocaml.doc ""]
type nonrec security_policy_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  policy: CoreTypes.Document.t option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: security_policy_type option }[@@ocaml.doc
                                        "Details about an OpenSearch Serverless security policy.\n"]
type nonrec update_security_policy_response =
  {
  security_policy_detail: security_policy_detail option }[@@ocaml.doc ""]
type nonrec update_security_policy_request =
  {
  client_token: string option ;
  policy: string option ;
  description: string option ;
  policy_version: string ;
  name: string ;
  type_: security_policy_type }[@@ocaml.doc ""]
type nonrec service_quota_exceeded_exception =
  {
  quota_code: string option ;
  service_code: string ;
  resource_type: string option ;
  resource_id: string option ;
  message: string }[@@ocaml.doc
                     "Thrown when you attempt to create more resources than the service allows based on service quotas.\n"]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "Thrown when accessing or deleting a resource that does not exist.\n"]
type nonrec security_config_type =
  | Saml [@@ocaml.doc ""]
type nonrec saml_config_options =
  {
  session_timeout: int option ;
  group_attribute: string option ;
  user_attribute: string option ;
  metadata: string }[@@ocaml.doc
                      "Describes SAML options for an OpenSearch Serverless security configuration in the form of a key-value map.\n"]
type nonrec security_config_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  saml_options: saml_config_options option ;
  description: string option ;
  config_version: string option ;
  type_: security_config_type option ;
  id: string option }[@@ocaml.doc
                       "Details about a security configuration for OpenSearch Serverless. \n"]
type nonrec update_security_config_response =
  {
  security_config_detail: security_config_detail option }[@@ocaml.doc ""]
type nonrec update_security_config_request =
  {
  client_token: string option ;
  saml_options: saml_config_options option ;
  description: string option ;
  config_version: string ;
  id: string }[@@ocaml.doc ""]
type nonrec lifecycle_policy_type =
  | Retention [@@ocaml.doc ""]
type nonrec lifecycle_policy_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  policy: CoreTypes.Document.t option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: lifecycle_policy_type option }[@@ocaml.doc
                                         "Details about an OpenSearch Serverless lifecycle policy.\n"]
type nonrec update_lifecycle_policy_response =
  {
  lifecycle_policy_detail: lifecycle_policy_detail option }[@@ocaml.doc ""]
type nonrec update_lifecycle_policy_request =
  {
  client_token: string option ;
  policy: string option ;
  description: string option ;
  policy_version: string ;
  name: string ;
  type_: lifecycle_policy_type }[@@ocaml.doc ""]
type nonrec collection_status =
  | CREATING 
  | DELETING 
  | ACTIVE 
  | FAILED [@@ocaml.doc ""]
type nonrec collection_type =
  | SEARCH 
  | TIMESERIES 
  | VECTORSEARCH [@@ocaml.doc ""]
type nonrec update_collection_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  arn: string option ;
  description: string option ;
  type_: collection_type option ;
  status: collection_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Details about an updated OpenSearch Serverless collection.\n"]
type nonrec update_collection_response =
  {
  update_collection_detail: update_collection_detail option }[@@ocaml.doc ""]
type nonrec update_collection_request =
  {
  client_token: string option ;
  description: string option ;
  id: string }[@@ocaml.doc ""]
type nonrec capacity_limits =
  {
  max_search_capacity_in_oc_u: int option ;
  max_indexing_capacity_in_oc_u: int option }[@@ocaml.doc
                                               "The maximum capacity limits for all OpenSearch Serverless collections, in OpenSearch Compute Units (OCUs). These limits are used to scale your collections based on the current workload. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-scaling.html}Managing capacity limits for Amazon OpenSearch Serverless}.\n"]
type nonrec account_settings_detail =
  {
  capacity_limits: capacity_limits option }[@@ocaml.doc
                                             "OpenSearch Serverless-related information for the current account.\n"]
type nonrec update_account_settings_response =
  {
  account_settings_detail: account_settings_detail option }[@@ocaml.doc ""]
type nonrec update_account_settings_request =
  {
  capacity_limits: capacity_limits option }[@@ocaml.doc ""]
type nonrec access_policy_type =
  | Data [@@ocaml.doc ""]
type nonrec access_policy_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  policy: CoreTypes.Document.t option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: access_policy_type option }[@@ocaml.doc
                                      "Details about an OpenSearch Serverless access policy.\n"]
type nonrec update_access_policy_response =
  {
  access_policy_detail: access_policy_detail option }[@@ocaml.doc ""]
type nonrec update_access_policy_request =
  {
  client_token: string option ;
  policy: string option ;
  description: string option ;
  policy_version: string ;
  name: string ;
  type_: access_policy_type }[@@ocaml.doc ""]
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc
                 "A map of key-value pairs associated to an OpenSearch Serverless resource.\n"]
type nonrec tag_resource_response = unit
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec standby_replicas =
  | ENABLED 
  | DISABLED [@@ocaml.doc ""]
type nonrec security_policy_summary =
  {
  last_modified_date: int option ;
  created_date: int option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: security_policy_type option }[@@ocaml.doc
                                        "A summary of a security policy for OpenSearch Serverless.\n"]
type nonrec security_policy_stats =
  {
  network_policy_count: int option ;
  encryption_policy_count: int option }[@@ocaml.doc
                                         "Statistics for an OpenSearch Serverless security policy.\n"]
type nonrec security_config_summary =
  {
  last_modified_date: int option ;
  created_date: int option ;
  description: string option ;
  config_version: string option ;
  type_: security_config_type option ;
  id: string option }[@@ocaml.doc
                       "A summary of a security configuration for OpenSearch Serverless.\n"]
type nonrec security_config_stats = {
  saml_config_count: int option }[@@ocaml.doc
                                   "Statistics for an OpenSearch Serverless security configuration.\n"]
type nonrec resource_type =
  | Index [@@ocaml.doc ""]
type nonrec list_tags_for_resource_response = {
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec access_policy_stats = {
  data_policy_count: int option }[@@ocaml.doc
                                   "Statistics for an OpenSearch Serverless access policy.\n"]
type nonrec lifecycle_policy_stats = {
  retention_policy_count: int option }[@@ocaml.doc
                                        "Statistics for an OpenSearch Serverless lifecycle policy.\n"]
type nonrec get_policies_stats_response =
  {
  total_policy_count: int option ;
  lifecycle_policy_stats: lifecycle_policy_stats option ;
  security_config_stats: security_config_stats option ;
  security_policy_stats: security_policy_stats option ;
  access_policy_stats: access_policy_stats option }[@@ocaml.doc ""]
type nonrec get_policies_stats_request = unit
type nonrec get_account_settings_response =
  {
  account_settings_detail: account_settings_detail option }[@@ocaml.doc ""]
type nonrec get_account_settings_request = unit
type nonrec create_security_policy_response =
  {
  security_policy_detail: security_policy_detail option }[@@ocaml.doc ""]
type nonrec create_security_policy_request =
  {
  client_token: string option ;
  policy: string ;
  description: string option ;
  name: string ;
  type_: security_policy_type }[@@ocaml.doc ""]
type nonrec create_lifecycle_policy_response =
  {
  lifecycle_policy_detail: lifecycle_policy_detail option }[@@ocaml.doc ""]
type nonrec create_lifecycle_policy_request =
  {
  client_token: string option ;
  policy: string ;
  description: string option ;
  name: string ;
  type_: lifecycle_policy_type }[@@ocaml.doc ""]
type nonrec batch_get_vpc_endpoint_response =
  {
  vpc_endpoint_error_details: vpc_endpoint_error_detail list option ;
  vpc_endpoint_details: vpc_endpoint_detail list option }[@@ocaml.doc ""]
type nonrec batch_get_vpc_endpoint_request = {
  ids: string list }[@@ocaml.doc ""]
type nonrec lifecycle_policy_error_detail =
  {
  error_code: string option ;
  error_message: string option ;
  name: string option ;
  type_: lifecycle_policy_type option }[@@ocaml.doc
                                         "Error information for an OpenSearch Serverless request.\n"]
type nonrec batch_get_lifecycle_policy_response =
  {
  lifecycle_policy_error_details: lifecycle_policy_error_detail list option ;
  lifecycle_policy_details: lifecycle_policy_detail list option }[@@ocaml.doc
                                                                   ""]
type nonrec lifecycle_policy_identifier =
  {
  name: string ;
  type_: lifecycle_policy_type }[@@ocaml.doc
                                  "The unique identifiers of policy types and policy names.\n"]
type nonrec batch_get_lifecycle_policy_request =
  {
  identifiers: lifecycle_policy_identifier list }[@@ocaml.doc ""]
type nonrec effective_lifecycle_policy_detail =
  {
  no_min_retention_period: bool option ;
  retention_period: string option ;
  resource_type: resource_type option ;
  policy_name: string option ;
  resource: string option ;
  type_: lifecycle_policy_type option }[@@ocaml.doc
                                         "Error information for an OpenSearch Serverless request.\n"]
type nonrec effective_lifecycle_policy_error_detail =
  {
  error_code: string option ;
  error_message: string option ;
  resource: string option ;
  type_: lifecycle_policy_type option }[@@ocaml.doc
                                         "Error information for an OpenSearch Serverless request.\n"]
type nonrec batch_get_effective_lifecycle_policy_response =
  {
  effective_lifecycle_policy_error_details:
    effective_lifecycle_policy_error_detail list option ;
  effective_lifecycle_policy_details:
    effective_lifecycle_policy_detail list option }[@@ocaml.doc ""]
type nonrec lifecycle_policy_resource_identifier =
  {
  resource: string ;
  type_: lifecycle_policy_type }[@@ocaml.doc
                                  "The unique identifiers of policy types and resource names.\n"]
type nonrec batch_get_effective_lifecycle_policy_request =
  {
  resource_identifiers: lifecycle_policy_resource_identifier list }[@@ocaml.doc
                                                                    ""]
type nonrec collection_detail =
  {
  dashboard_endpoint: string option ;
  collection_endpoint: string option ;
  last_modified_date: int option ;
  created_date: int option ;
  standby_replicas: standby_replicas option ;
  kms_key_arn: string option ;
  arn: string option ;
  description: string option ;
  type_: collection_type option ;
  status: collection_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Details about each OpenSearch Serverless collection, including the collection endpoint and the OpenSearch Dashboards endpoint.\n"]
type nonrec collection_error_detail =
  {
  error_code: string option ;
  error_message: string option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Error information for an OpenSearch Serverless request.\n"]
type nonrec batch_get_collection_response =
  {
  collection_error_details: collection_error_detail list option ;
  collection_details: collection_detail list option }[@@ocaml.doc ""]
type nonrec batch_get_collection_request =
  {
  names: string list option ;
  ids: string list option }[@@ocaml.doc ""]
type nonrec ocu_limit_exceeded_exception = {
  message: string }[@@ocaml.doc
                     "Thrown when the collection you're attempting to create results in a number of search or indexing OCUs that exceeds the account limit. \n"]
type nonrec list_vpc_endpoints_response =
  {
  next_token: string option ;
  vpc_endpoint_summaries: vpc_endpoint_summary list option }[@@ocaml.doc ""]
type nonrec list_vpc_endpoints_request =
  {
  max_results: int option ;
  next_token: string option ;
  vpc_endpoint_filters: vpc_endpoint_filters option }[@@ocaml.doc ""]
type nonrec list_security_policies_response =
  {
  next_token: string option ;
  security_policy_summaries: security_policy_summary list option }[@@ocaml.doc
                                                                    ""]
type nonrec list_security_policies_request =
  {
  max_results: int option ;
  next_token: string option ;
  resource: string list option ;
  type_: security_policy_type }[@@ocaml.doc ""]
type nonrec list_security_configs_response =
  {
  next_token: string option ;
  security_config_summaries: security_config_summary list option }[@@ocaml.doc
                                                                    ""]
type nonrec list_security_configs_request =
  {
  max_results: int option ;
  next_token: string option ;
  type_: security_config_type }[@@ocaml.doc ""]
type nonrec lifecycle_policy_summary =
  {
  last_modified_date: int option ;
  created_date: int option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: lifecycle_policy_type option }[@@ocaml.doc
                                         "A summary of the lifecycle policy.\n"]
type nonrec list_lifecycle_policies_response =
  {
  next_token: string option ;
  lifecycle_policy_summaries: lifecycle_policy_summary list option }[@@ocaml.doc
                                                                    ""]
type nonrec list_lifecycle_policies_request =
  {
  max_results: int option ;
  next_token: string option ;
  resources: string list option ;
  type_: lifecycle_policy_type }[@@ocaml.doc ""]
type nonrec collection_summary =
  {
  arn: string option ;
  status: collection_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Details about each OpenSearch Serverless collection.\n"]
type nonrec list_collections_response =
  {
  next_token: string option ;
  collection_summaries: collection_summary list option }[@@ocaml.doc ""]
type nonrec collection_filters =
  {
  status: collection_status option ;
  name: string option }[@@ocaml.doc
                         "A list of filter keys that you can use for LIST, UPDATE, and DELETE requests to OpenSearch Serverless collections.\n"]
type nonrec list_collections_request =
  {
  max_results: int option ;
  next_token: string option ;
  collection_filters: collection_filters option }[@@ocaml.doc ""]
type nonrec access_policy_summary =
  {
  last_modified_date: int option ;
  created_date: int option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: access_policy_type option }[@@ocaml.doc
                                      "A summary of the data access policy.\n"]
type nonrec list_access_policies_response =
  {
  next_token: string option ;
  access_policy_summaries: access_policy_summary list option }[@@ocaml.doc
                                                                ""]
type nonrec list_access_policies_request =
  {
  max_results: int option ;
  next_token: string option ;
  resource: string list option ;
  type_: access_policy_type }[@@ocaml.doc ""]
type nonrec get_security_policy_response =
  {
  security_policy_detail: security_policy_detail option }[@@ocaml.doc ""]
type nonrec get_security_policy_request =
  {
  name: string ;
  type_: security_policy_type }[@@ocaml.doc ""]
type nonrec get_security_config_response =
  {
  security_config_detail: security_config_detail option }[@@ocaml.doc ""]
type nonrec get_security_config_request = {
  id: string }[@@ocaml.doc ""]
type nonrec get_access_policy_response =
  {
  access_policy_detail: access_policy_detail option }[@@ocaml.doc ""]
type nonrec get_access_policy_request =
  {
  name: string ;
  type_: access_policy_type }[@@ocaml.doc ""]
type nonrec delete_vpc_endpoint_detail =
  {
  status: vpc_endpoint_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Deletion details for an OpenSearch Serverless-managed interface endpoint.\n"]
type nonrec delete_vpc_endpoint_response =
  {
  delete_vpc_endpoint_detail: delete_vpc_endpoint_detail option }[@@ocaml.doc
                                                                   ""]
type nonrec delete_vpc_endpoint_request =
  {
  client_token: string option ;
  id: string }[@@ocaml.doc ""]
type nonrec delete_security_policy_response = unit
type nonrec delete_security_policy_request =
  {
  client_token: string option ;
  name: string ;
  type_: security_policy_type }[@@ocaml.doc ""]
type nonrec delete_security_config_response = unit
type nonrec delete_security_config_request =
  {
  client_token: string option ;
  id: string }[@@ocaml.doc ""]
type nonrec delete_lifecycle_policy_response = unit
type nonrec delete_lifecycle_policy_request =
  {
  client_token: string option ;
  name: string ;
  type_: lifecycle_policy_type }[@@ocaml.doc ""]
type nonrec delete_collection_detail =
  {
  status: collection_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Details about a deleted OpenSearch Serverless collection.\n"]
type nonrec delete_collection_response =
  {
  delete_collection_detail: delete_collection_detail option }[@@ocaml.doc ""]
type nonrec delete_collection_request =
  {
  client_token: string option ;
  id: string }[@@ocaml.doc ""]
type nonrec delete_access_policy_response = unit
type nonrec delete_access_policy_request =
  {
  client_token: string option ;
  name: string ;
  type_: access_policy_type }[@@ocaml.doc ""]
type nonrec create_vpc_endpoint_detail =
  {
  status: vpc_endpoint_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Creation details for an OpenSearch Serverless-managed interface endpoint. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.\n"]
type nonrec create_vpc_endpoint_response =
  {
  create_vpc_endpoint_detail: create_vpc_endpoint_detail option }[@@ocaml.doc
                                                                   ""]
type nonrec create_vpc_endpoint_request =
  {
  client_token: string option ;
  security_group_ids: string list option ;
  subnet_ids: string list ;
  vpc_id: string ;
  name: string }[@@ocaml.doc ""]
type nonrec create_security_config_response =
  {
  security_config_detail: security_config_detail option }[@@ocaml.doc ""]
type nonrec create_security_config_request =
  {
  client_token: string option ;
  saml_options: saml_config_options option ;
  description: string option ;
  name: string ;
  type_: security_config_type }[@@ocaml.doc ""]
type nonrec create_collection_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  standby_replicas: standby_replicas option ;
  kms_key_arn: string option ;
  arn: string option ;
  description: string option ;
  type_: collection_type option ;
  status: collection_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Details about the created OpenSearch Serverless collection.\n"]
type nonrec create_collection_response =
  {
  create_collection_detail: create_collection_detail option }[@@ocaml.doc ""]
type nonrec create_collection_request =
  {
  client_token: string option ;
  standby_replicas: standby_replicas option ;
  tags: tag list option ;
  description: string option ;
  type_: collection_type option ;
  name: string }[@@ocaml.doc ""]
type nonrec create_access_policy_response =
  {
  access_policy_detail: access_policy_detail option }[@@ocaml.doc ""]
type nonrec create_access_policy_request =
  {
  client_token: string option ;
  policy: string ;
  description: string option ;
  name: string ;
  type_: access_policy_type }[@@ocaml.doc ""](** {1:builders Builders} *)

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
val make_untag_resource_response : unit -> untag_resource_response
val make_untag_resource_request :
  tag_keys:string list ->
    resource_arn:string -> unit -> untag_resource_request
val make_tag : value:string -> key:string -> unit -> tag
val make_tag_resource_response : unit -> tag_resource_response
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
val make_get_policies_stats_request : unit -> get_policies_stats_request
val make_get_account_settings_response :
  ?account_settings_detail:account_settings_detail ->
    unit -> get_account_settings_response
val make_get_account_settings_request : unit -> get_account_settings_request
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
val make_delete_security_policy_response :
  unit -> delete_security_policy_response
val make_delete_security_policy_request :
  ?client_token:string ->
    name:string ->
      type_:security_policy_type -> unit -> delete_security_policy_request
val make_delete_security_config_response :
  unit -> delete_security_config_response
val make_delete_security_config_request :
  ?client_token:string -> id:string -> unit -> delete_security_config_request
val make_delete_lifecycle_policy_response :
  unit -> delete_lifecycle_policy_response
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
val make_delete_access_policy_response :
  unit -> delete_access_policy_response
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

module CreateAccessPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      create_access_policy_request ->
        (create_access_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Creates a data access policy for OpenSearch Serverless. Access policies limit access to collections and the resources within them, and allow a user to access that data irrespective of the access mechanism or network source. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data access control for Amazon OpenSearch Serverless}.
 *)

  
end

module CreateCollection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_collection_request ->
        (create_collection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `OcuLimitExceededException of ocu_limit_exceeded_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Creates a new OpenSearch Serverless collection. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html}Creating and managing Amazon OpenSearch Serverless collections}.
 *)

  
end

module CreateSecurityConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      create_security_config_request ->
        (create_security_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Specifies a security configuration for OpenSearch Serverless. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML authentication for Amazon OpenSearch Serverless}. 
 *)

  
end

module CreateVpcEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      create_vpc_endpoint_request ->
        (create_vpc_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Creates an OpenSearch Serverless-managed interface VPC endpoint. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.
 *)

  
end

module DeleteAccessPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_access_policy_request ->
        (delete_access_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Deletes an OpenSearch Serverless access policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data access control for Amazon OpenSearch Serverless}.
 *)

  
end

module DeleteCollection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_collection_request ->
        (delete_collection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Deletes an OpenSearch Serverless collection. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html}Creating and managing Amazon OpenSearch Serverless collections}.
 *)

  
end

module DeleteLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_lifecycle_policy_request ->
        (delete_lifecycle_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Deletes an OpenSearch Serverless lifecycle policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-delete}Deleting data lifecycle policies}.
 *)

  
end

module DeleteSecurityConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_security_config_request ->
        (delete_security_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Deletes a security configuration for OpenSearch Serverless. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML authentication for Amazon OpenSearch Serverless}.
 *)

  
end

module DeleteSecurityPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_security_policy_request ->
        (delete_security_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Deletes an OpenSearch Serverless security policy.
 *)

  
end

module DeleteVpcEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vpc_endpoint_request ->
        (delete_vpc_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Deletes an OpenSearch Serverless-managed interface endpoint. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.
 *)

  
end

module GetAccessPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_access_policy_request ->
        (get_access_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns an OpenSearch Serverless access policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data access control for Amazon OpenSearch Serverless}.
 *)

  
end

module GetSecurityConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      get_security_config_request ->
        (get_security_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns information about an OpenSearch Serverless security configuration. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML authentication for Amazon OpenSearch Serverless}.
 *)

  
end

module GetSecurityPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_security_policy_request ->
        (get_security_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns information about a configured OpenSearch Serverless security policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html}Network access for Amazon OpenSearch Serverless} and {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html}Encryption at rest for Amazon OpenSearch Serverless}.
 *)

  
end

module ListAccessPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_access_policies_request ->
        (list_access_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns information about a list of OpenSearch Serverless access policies.
 *)

  
end

module ListCollections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_collections_request ->
        (list_collections_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Lists all OpenSearch Serverless collections. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html}Creating and managing Amazon OpenSearch Serverless collections}.

  Make sure to include an empty request body \{\} if you don't include any collection filters in the request.
  
    *)

  
end

module ListLifecyclePolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_lifecycle_policies_request ->
        (list_lifecycle_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns a list of OpenSearch Serverless lifecycle policies. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-list}Viewing data lifecycle policies}.
 *)

  
end

module ListSecurityConfigs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_security_configs_request ->
        (list_security_configs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns information about configured OpenSearch Serverless security configurations. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML authentication for Amazon OpenSearch Serverless}.
 *)

  
end

module ListSecurityPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_security_policies_request ->
        (list_security_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns information about configured OpenSearch Serverless security policies.
 *)

  
end

module ListVpcEndpoints : sig
  val request :
    Smaws_Lib.Context.t ->
      list_vpc_endpoints_request ->
        (list_vpc_endpoints_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns the OpenSearch Serverless-managed interface VPC endpoints associated with the current account. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.
 *)

  
end

module BatchGetCollection : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_collection_request ->
        (batch_get_collection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns attributes for one or more collections, including the collection endpoint and the OpenSearch Dashboards endpoint. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html}Creating and managing Amazon OpenSearch Serverless collections}.
 *)

  
end

module BatchGetEffectiveLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_effective_lifecycle_policy_request ->
        (batch_get_effective_lifecycle_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns a list of successful and failed retrievals for the OpenSearch Serverless indexes. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-list}Viewing data lifecycle policies}.
 *)

  
end

module BatchGetLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_lifecycle_policy_request ->
        (batch_get_lifecycle_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns one or more configured OpenSearch Serverless lifecycle policies. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-list}Viewing data lifecycle policies}.
 *)

  
end

module BatchGetVpcEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_vpc_endpoint_request ->
        (batch_get_vpc_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns attributes for one or more VPC endpoints associated with the current account. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.
 *)

  
end

module CreateLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      create_lifecycle_policy_request ->
        (create_lifecycle_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Creates a lifecyle policy to be applied to OpenSearch Serverless indexes. Lifecycle policies define the number of days or hours to retain the data on an OpenSearch Serverless index. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-create}Creating data lifecycle policies}.
 *)

  
end

module CreateSecurityPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      create_security_policy_request ->
        (create_security_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Creates a security policy to be used by one or more OpenSearch Serverless collections. Security policies provide access to a collection and its OpenSearch Dashboards endpoint from public networks or specific VPC endpoints. They also allow you to secure a collection with a KMS encryption key. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html}Network access for Amazon OpenSearch Serverless} and {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html}Encryption at rest for Amazon OpenSearch Serverless}.
 *)

  
end

module GetAccountSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      get_account_settings_request ->
        (get_account_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns account-level settings related to OpenSearch Serverless.
 *)

  
end

module GetPoliciesStats : sig
  val request :
    Smaws_Lib.Context.t ->
      get_policies_stats_request ->
        (get_policies_stats_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            
        ]
      ) result
  (** Returns statistical information about your OpenSearch Serverless access policies, security configurations, and security policies.
 *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns the tags for an OpenSearch Serverless resource. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-collection.html}Tagging Amazon OpenSearch Serverless collections}.
 *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Associates tags with an OpenSearch Serverless resource. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-collection.html}Tagging Amazon OpenSearch Serverless collections}.
 *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Removes a tag or set of tags from an OpenSearch Serverless resource. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-collection.html}Tagging Amazon OpenSearch Serverless collections}.
 *)

  
end

module UpdateAccessPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      update_access_policy_request ->
        (update_access_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Updates an OpenSearch Serverless access policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data access control for Amazon OpenSearch Serverless}.
 *)

  
end

module UpdateAccountSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      update_account_settings_request ->
        (update_account_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Update the OpenSearch Serverless settings for the current Amazon Web Services account. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-scaling.html}Managing capacity limits for Amazon OpenSearch Serverless}.
 *)

  
end

module UpdateCollection : sig
  val request :
    Smaws_Lib.Context.t ->
      update_collection_request ->
        (update_collection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Updates an OpenSearch Serverless collection.
 *)

  
end

module UpdateLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      update_lifecycle_policy_request ->
        (update_lifecycle_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Updates an OpenSearch Serverless access policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-update}Updating data lifecycle policies}.
 *)

  
end

module UpdateSecurityConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      update_security_config_request ->
        (update_security_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Updates a security configuration for OpenSearch Serverless. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML authentication for Amazon OpenSearch Serverless}.
 *)

  
end

module UpdateSecurityPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      update_security_policy_request ->
        (update_security_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Updates an OpenSearch Serverless security policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html}Network access for Amazon OpenSearch Serverless} and {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html}Encryption at rest for Amazon OpenSearch Serverless}.
 *)

  
end

module UpdateVpcEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      update_vpc_endpoint_request ->
        (update_vpc_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Updates an OpenSearch Serverless-managed interface endpoint. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.
 *)

  
end

