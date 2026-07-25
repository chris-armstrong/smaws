type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_map = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec activation_key = string [@@ocaml.doc ""]

type nonrec owner_account_id = string [@@ocaml.doc ""]

type nonrec billing_tier = int [@@ocaml.doc ""]

type nonrec connection_shared_id = string [@@ocaml.doc ""]

type nonrec connection_state =
  | AVAILABLE [@ocaml.doc ""]
  | REQUESTED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | DOWN [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec product_type = string [@@ocaml.doc ""]

type nonrec location = string [@@ocaml.doc ""]

type nonrec last_mile_provider = string [@@ocaml.doc ""]

type nonrec cloud_service_provider = string [@@ocaml.doc ""]

type nonrec provider =
  | CloudServiceProvider of cloud_service_provider
      [@ocaml.doc
        "The provider's name. Specifically, connections to/from this Cloud Service Provider will \
         be considered Multicloud connections.\n"]
  | LastMileProvider of last_mile_provider
      [@ocaml.doc
        "The provider's name. Specifically, connections to/from this Last Mile Provider will be \
         considered LastMile connections.\n"]
[@@ocaml.doc "Describes the respective AWS Interconnect Partner organization.\n"]

type nonrec environment_id = string [@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec direct_connect_gateway_attach_point = string [@@ocaml.doc ""]

type nonrec attach_point =
  | DirectConnectGateway of direct_connect_gateway_attach_point
      [@ocaml.doc "Identifies an DirectConnect Gateway attach point by DirectConnectGatewayID.\n"]
  | Arn of amazon_resource_name [@ocaml.doc "Identifies an attach point by full ARN.\n"]
[@@ocaml.doc "Identifies an attach point to use with a Connection.\n"]

type nonrec connection_bandwidth = string [@@ocaml.doc ""]

type nonrec connection_description = string [@@ocaml.doc ""]

type nonrec connection_id = string [@@ocaml.doc ""]

type nonrec connection = {
  id : connection_id; [@ocaml.doc "The short identifier of the connection object.\n"]
  arn : amazon_resource_name; [@ocaml.doc "An ARN of a [Connection] object.\n"]
  description : connection_description; [@ocaml.doc "A descriptive name for the connection.\n"]
  bandwidth : connection_bandwidth;
      [@ocaml.doc "The specific selected bandwidth of this connection.\n"]
  attach_point : attach_point;
      [@ocaml.doc "The Attach Point to which the connection should be associated.\"\n"]
  environment_id : environment_id;
      [@ocaml.doc "The specific [Environment] this connection is placed upon.\n"]
  provider : provider; [@ocaml.doc "The provider on the remote side of this [Connection].\n"]
  location : location;
      [@ocaml.doc "The provider specific location on the remote side of this [Connection] \n"]
  type_ : product_type; [@ocaml.doc "The specific product type of this [Connection].\n"]
  state : connection_state;
      [@ocaml.doc
        "{ul\n\
        \      {-   [requested]: The initial state of a connection. The state will remain here \
         until the Connection is accepted on the Partner portal.\n\
        \          \n\
        \           }\n\
        \      {-   [pending]: The connection has been accepted and is being provisioned between \
         AWS and the Partner.\n\
        \          \n\
        \           }\n\
        \      {-   [available]: The connection has been fully provisioned between AWS and the \
         Partner.\n\
        \          \n\
        \           }\n\
        \      {-   [deleting]: The connection is being deleted.\n\
        \          \n\
        \           }\n\
        \      {-   [deleted]: The connection has been deleted.\n\
        \          \n\
        \           }\n\
        \      {-   [failed]: The connection has failed to be created.\n\
        \          \n\
        \           }\n\
        \      {-   [updating]: The connection is being updated.\n\
        \          \n\
        \           }\n\
        \      }\n\
        \  "]
  shared_id : connection_shared_id;
      [@ocaml.doc
        "An identifier used by both AWS and the remote partner to identify the specific connection.\n"]
  billing_tier : billing_tier option;
      [@ocaml.doc "The billing tier this connection is currently assigned.\n"]
  owner_account : owner_account_id; [@ocaml.doc "The account that owns this [Connection] \n"]
  activation_key : activation_key;
      [@ocaml.doc "The Activation Key associated to this connection.\n"]
  tags : tag_map option; [@ocaml.doc "The tags on the [Connection] \n"]
}
[@@ocaml.doc
  "The object describing the provided connectivity from the AWS region to the partner location.\n"]

type nonrec accept_connection_proposal_response = {
  connection : connection option; [@ocaml.doc "The created [Connection] object.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_connection_proposal_request = {
  attach_point : attach_point;
      [@ocaml.doc "The Attach Point to which the connection should be associated.\n"]
  activation_key : activation_key;
      [@ocaml.doc
        "An Activation Key that was generated on a supported partner's portal. This key captures \
         the desired parameters from the initial creation request.\n\n\
        \ The details of this request can be described using with [DescribeConnectionProposal]. \n\
        \ "]
  description : connection_description option;
      [@ocaml.doc "A description to distinguish this [Connection].\n"]
  tags : tag_map option; [@ocaml.doc "The tags to associate with the resulting [Connection].\n"]
  client_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Idempotency token used for the request.\n"]
}
[@@ocaml.doc ""]

type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The calling principal is not allowed to access the specified resource, or the resource does not \
   exist.\n"]

type nonrec attach_point_type = DirectConnectGateway [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec attach_point_descriptor = {
  type_ : attach_point_type;
      [@ocaml.doc
        "The type of this AttachPoint, which will dictate the syntax of the identifier.\n\n\
        \ Current types include:\n\
        \ \n\
        \  {ul\n\
        \        {-  ARN\n\
        \            \n\
        \             }\n\
        \        {-  DirectConnect Gateway\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  identifier : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The identifier for the specific type of the AttachPoint.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The descriptive name of the identifier attach point.\n"]
}
[@@ocaml.doc "Describes a possible Attach Point for a Connection.\n"]

type nonrec attach_point_descriptor_list = attach_point_descriptor list [@@ocaml.doc ""]

type nonrec bandwidth_list = connection_bandwidth list [@@ocaml.doc ""]

type nonrec bandwidths = {
  available : bandwidth_list option; [@ocaml.doc "The list of currently available bandwidths.\n"]
  supported : bandwidth_list option;
      [@ocaml.doc "The list of all bandwidths that this environment plans to support\n"]
}
[@@ocaml.doc "Contains the details about the available and supported bandwidths.\n"]

type nonrec connection_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec connection_summary = {
  id : connection_id; [@ocaml.doc "The identifier of the requested [Connection] \n"]
  arn : amazon_resource_name; [@ocaml.doc "The ARN of the [Connection] \n"]
  description : connection_description; [@ocaml.doc "A descriptive name of the [Connection] \n"]
  bandwidth : connection_bandwidth; [@ocaml.doc "The bandwidth of the [Connection] \n"]
  attach_point : attach_point;
      [@ocaml.doc "The Attach Point to which the connection should be associated.\n"]
  environment_id : environment_id;
      [@ocaml.doc "The [Environment] that this [Connection] is created on.\n"]
  provider : provider; [@ocaml.doc "The provider on the remote end of this [Connection] \n"]
  location : location;
      [@ocaml.doc "The provider specific location at the remote end of this [Connection] \n"]
  type_ : product_type; [@ocaml.doc "The product variant supplied by this resource.\n"]
  state : connection_state;
      [@ocaml.doc
        "{ul\n\
        \      {-   [requested]: The initial state of a connection. The state will remain here \
         until the Connection is accepted on the Partner portal.\n\
        \          \n\
        \           }\n\
        \      {-   [pending]: The connection has been accepted and is being provisioned between \
         AWS and the Partner.\n\
        \          \n\
        \           }\n\
        \      {-   [available]: The connection has been fully provisioned between AWS and the \
         Partner.\n\
        \          \n\
        \           }\n\
        \      {-   [deleting]: The connection is being deleted.\n\
        \          \n\
        \           }\n\
        \      {-   [deleted]: The connection has been deleted.\n\
        \          \n\
        \           }\n\
        \      {-   [failed]: The connection has failed to be created.\n\
        \          \n\
        \           }\n\
        \      {-   [updating]: The connection is being updated.\n\
        \          \n\
        \           }\n\
        \      }\n\
        \  "]
  shared_id : connection_shared_id;
      [@ocaml.doc
        "An identifier used by both AWS and the remote partner to identify the specific connection.\n"]
  billing_tier : billing_tier option;
      [@ocaml.doc "The billing tier this connection is currently assigned.\n"]
}
[@@ocaml.doc "Summarized view of a Connection object.\n"]

type nonrec connection_summaries_list = connection_summary list [@@ocaml.doc ""]

type nonrec create_connection_response = {
  connection : connection option; [@ocaml.doc "The resulting [Connection].\n"]
}
[@@ocaml.doc ""]

type nonrec remote_owner_account = string [@@ocaml.doc ""]

type nonrec remote_account_identifier =
  | Identifier of remote_owner_account
      [@ocaml.doc
        "A generic bit of identifying information. Can be used in place of any of the more \
         specific types.\n"]
[@@ocaml.doc "The types of identifiers that may be needed for remote account specification.\n"]

type nonrec create_connection_request = {
  description : connection_description option;
      [@ocaml.doc "A description to distinguish this [Connection].\n"]
  bandwidth : connection_bandwidth;
      [@ocaml.doc "The desired bandwidth of the requested [Connection] \n"]
  attach_point : attach_point;
      [@ocaml.doc "The Attach Point to which the connection should be associated.\"\n"]
  environment_id : environment_id;
      [@ocaml.doc
        "The identifier of the [Environment] across which this [Connection] should be created.\n\n\
        \ The available [Environment] objects can be determined using [ListEnvironments].\n\
        \ "]
  remote_account : remote_account_identifier option;
      [@ocaml.doc
        "Account and/or principal identifying information that can be verified by the partner of \
         this specific Environment.\n"]
  tags : tag_map option; [@ocaml.doc "The tag to associate with the resulting [Connection].\n"]
  client_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Idempotency token used for the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_connection_response = {
  connection : connection;
      [@ocaml.doc "The [Connection] object that has been marked for deletion.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_connection_request = {
  identifier : connection_id; [@ocaml.doc "The identifier of the [Connection] to be deleted. \n"]
  client_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Idempotency token used for the request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_connection_proposal_response = {
  bandwidth : connection_bandwidth; [@ocaml.doc "The bandwidth of the proposed [Connection]. \n"]
  environment_id : environment_id;
      [@ocaml.doc
        "The identifier of the [Environment] upon which the [Connection] would be placed if this \
         proposal were accepted.\n"]
  provider : provider;
      [@ocaml.doc "The partner provider of the specific [Environment] of the proposal.\n"]
  location : location;
      [@ocaml.doc
        "The partner specific location distinguisher of the specific [Environment] of the proposal.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_connection_proposal_request = {
  activation_key : activation_key;
      [@ocaml.doc
        "An Activation Key that was generated on a supported partner's portal. This key captures \
         the desired parameters from the initial creation request.\n"]
}
[@@ocaml.doc ""]

type nonrec remote_account_identifier_type = ACCOUNT [@ocaml.doc ""] | EMAIL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec environment_state =
  | AVAILABLE [@ocaml.doc ""]
  | LIMITED [@ocaml.doc ""]
  | UNAVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec environment = {
  provider : provider; [@ocaml.doc "The provider on the remote side of this [Connection].\n"]
  location : location;
      [@ocaml.doc "The provider specific location on the remote side of this [Connection].\n"]
  environment_id : environment_id; [@ocaml.doc "The identifier of this [Environment] \n"]
  state : environment_state;
      [@ocaml.doc
        "The state of the [Environment]. Possible values:\n\n\
        \ {ul\n\
        \       {-   [available]: The environment is available and new [Connection] objects can be \
         requested.\n\
        \           \n\
        \            }\n\
        \       {-   [limited]: The environment is available, but overall capacity is limited. The \
         set of available bandwidths \n\
        \           \n\
        \            }\n\
        \       {-   [unavailable]: The environment is currently unavailable.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  bandwidths : bandwidths;
      [@ocaml.doc "The sets of bandwidths that are available and supported on this environment.\n"]
  type_ : product_type;
      [@ocaml.doc
        "The specific product type of [Connection] objects provided by this [Environment].\n"]
  activation_page_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "An HTTPS URL on the remote partner portal where the Activation Key should be brought to \
         complete the creation process.\n"]
  remote_identifier_type : remote_account_identifier_type option;
      [@ocaml.doc
        "The type of identifying information that should be supplied to the [remoteAccount] \
         parameter of a [CreateConnection] call for this specific Environment.\n"]
}
[@@ocaml.doc
  "Defines the logical topology that an AWS Interconnect Connection is created upon.\n\n\
  \ Specifically, an Environment defines the partner The remote Cloud Service Provider of this \
   resource. or The remote Last Mile Provider of this resource. and the region or location \
   specification to which an AWS Interconnect Connection can be made.\n\
  \ "]

type nonrec environment_list = environment list [@@ocaml.doc ""]

type nonrec environment_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec get_connection_response = {
  connection : connection option; [@ocaml.doc "The existing [Connection] resource.\n"]
}
[@@ocaml.doc ""]

type nonrec get_connection_request = {
  identifier : connection_id; [@ocaml.doc "The identifier of the requested [Connection] \n"]
}
[@@ocaml.doc ""]

type nonrec get_environment_response = {
  environment : environment; [@ocaml.doc "The requested [Environment] structure.\n"]
}
[@@ocaml.doc ""]

type nonrec get_environment_request = {
  id : environment_id; [@ocaml.doc "The identifier of the specific [Environment] to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  arn : amazon_resource_name;
      [@ocaml.doc "The ARN of the resource from which the specified tags should be removed.\n"]
  tag_keys : tag_key_list;
      [@ocaml.doc "The list of tag keys that should be removed from the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  arn : amazon_resource_name;
      [@ocaml.doc "The ARN of the resource that should receive the new tags.\n"]
  tags : tag_map; [@ocaml.doc "A map of tags to apply to the specified resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_map option; [@ocaml.doc "The tags on the specified ARN.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  arn : amazon_resource_name; [@ocaml.doc "The resource ARN for which to list tags. \n"]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec list_attach_points_response = {
  attach_points : attach_point_descriptor_list; [@ocaml.doc "The valid [AttachPoint] \n"]
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token indicating that there are more results that can be fetched.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_attach_points_request = {
  environment_id : environment_id;
      [@ocaml.doc "The identifier of the [Environment] for which to list valid Attach Points.\n"]
  max_results : max_results option;
      [@ocaml.doc "The max number of list results in a single paginated response.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token from a previous paginated response indicating you wish to get the next \
         page.\n"]
}
[@@ocaml.doc ""]

type nonrec interconnect_client_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was denied due to incorrect client supplied parameters.\n"]

type nonrec interconnect_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "The request resulted in an exception internal to the service.\n"]

type nonrec interconnect_validation_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "The input fails to satisfy the constraints specified.\n"]

type nonrec list_connections_response = {
  connections : connection_summaries_list option;
      [@ocaml.doc "The resulting list of [Connection] objects.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token for use in subsequent calls to fetch the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_connections_request = {
  max_results : max_results option;
      [@ocaml.doc "The max number of list results in a single paginated response.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token from a previous paginated response indicating you wish to get the next \
         page of results.\n"]
  state : connection_state option;
      [@ocaml.doc
        "Filter the results to only include [Connection] objects in the given [Connection$state].\n"]
  environment_id : environment_id option;
      [@ocaml.doc
        "Filter the results to only include [Connection] objects on the given [Environment].\n"]
  provider : provider option;
      [@ocaml.doc
        "Filter the results to only include [Connection] objects to the given [Provider].\n"]
  attach_point : attach_point option;
      [@ocaml.doc
        "Filter results to only include [Connection] objects attached to the given [AttachPoint].\n"]
}
[@@ocaml.doc ""]

type nonrec list_environments_response = {
  environments : environment_list; [@ocaml.doc "The list of matching [Environment] objects.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A pagination token for use in subsequent calls to fetch the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_environments_request = {
  max_results : max_results option;
      [@ocaml.doc "The max number of list results in a single paginated response.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token from a previous paginated response indicating you wish to get the next \
         page of results.\n"]
  provider : provider option;
      [@ocaml.doc
        "Filter results to only include [Environment] objects that connect to the [Provider].\n"]
  location : location option;
      [@ocaml.doc
        "Filter results to only include [Environment] objects that connect to a given location \
         distiguisher.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request specifies a resource that does not exist on the server.\n"]

type nonrec service_quota_exceeded_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The requested operation would result in the calling principal exceeding their allotted quota.\n"]

type nonrec throttling_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was denied due to request throttling.\n"]

type nonrec update_connection_response = {
  connection : connection option; [@ocaml.doc "The resulting updated [Connection] \n"]
}
[@@ocaml.doc ""]

type nonrec update_connection_request = {
  identifier : connection_id;
      [@ocaml.doc "The identifier of the [Connection] that should be updated.\n"]
  description : connection_description option;
      [@ocaml.doc "An updated description to apply to the [Connection] \n"]
  bandwidth : connection_bandwidth option;
      [@ocaml.doc
        "Request a new bandwidth size on the given [Connection].\n\n\
        \ Note that changes to the size may be subject to additional policy, and does require the \
         remote partner provider to acknowledge and permit this new bandwidth size.\n\
        \ "]
  client_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Idempotency token used for the request.\n"]
}
[@@ocaml.doc ""]
