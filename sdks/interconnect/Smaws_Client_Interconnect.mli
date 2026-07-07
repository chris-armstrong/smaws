(** Interconnect client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_connection :
  ?tags:tag_map ->
  ?billing_tier:billing_tier ->
  activation_key:activation_key ->
  owner_account:owner_account_id ->
  shared_id:connection_shared_id ->
  state:connection_state ->
  type_:product_type ->
  location:location ->
  provider:provider ->
  environment_id:environment_id ->
  attach_point:attach_point ->
  bandwidth:connection_bandwidth ->
  description:connection_description ->
  arn:amazon_resource_name ->
  id:connection_id ->
  unit ->
  connection

val make_update_connection_response : ?connection:connection -> unit -> update_connection_response

val make_update_connection_request :
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?bandwidth:connection_bandwidth ->
  ?description:connection_description ->
  identifier:connection_id ->
  unit ->
  update_connection_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> arn:amazon_resource_name -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:tag_map -> arn:amazon_resource_name -> unit -> tag_resource_request

val make_list_tags_for_resource_response : ?tags:tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  arn:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_bandwidths : ?supported:bandwidth_list -> ?available:bandwidth_list -> unit -> bandwidths

val make_environment :
  ?remote_identifier_type:remote_account_identifier_type ->
  ?activation_page_url:Smaws_Lib.Smithy_api.Types.string_ ->
  type_:product_type ->
  bandwidths:bandwidths ->
  state:environment_state ->
  environment_id:environment_id ->
  location:location ->
  provider:provider ->
  unit ->
  environment

val make_list_environments_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  environments:environment_list ->
  unit ->
  list_environments_response

val make_list_environments_request :
  ?location:location ->
  ?provider:provider ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_environments_request

val make_connection_summary :
  ?billing_tier:billing_tier ->
  shared_id:connection_shared_id ->
  state:connection_state ->
  type_:product_type ->
  location:location ->
  provider:provider ->
  environment_id:environment_id ->
  attach_point:attach_point ->
  bandwidth:connection_bandwidth ->
  description:connection_description ->
  arn:amazon_resource_name ->
  id:connection_id ->
  unit ->
  connection_summary

val make_list_connections_response :
  ?next_token:next_token ->
  ?connections:connection_summaries_list ->
  unit ->
  list_connections_response

val make_list_connections_request :
  ?attach_point:attach_point ->
  ?provider:provider ->
  ?environment_id:environment_id ->
  ?state:connection_state ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_connections_request

val make_attach_point_descriptor :
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  type_:attach_point_type ->
  unit ->
  attach_point_descriptor

val make_list_attach_points_response :
  ?next_token:next_token ->
  attach_points:attach_point_descriptor_list ->
  unit ->
  list_attach_points_response

val make_list_attach_points_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  environment_id:environment_id ->
  unit ->
  list_attach_points_request

val make_describe_connection_proposal_response :
  location:location ->
  provider:provider ->
  environment_id:environment_id ->
  bandwidth:connection_bandwidth ->
  unit ->
  describe_connection_proposal_response

val make_describe_connection_proposal_request :
  activation_key:activation_key -> unit -> describe_connection_proposal_request

val make_accept_connection_proposal_response :
  ?connection:connection -> unit -> accept_connection_proposal_response

val make_accept_connection_proposal_request :
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tags:tag_map ->
  ?description:connection_description ->
  activation_key:activation_key ->
  attach_point:attach_point ->
  unit ->
  accept_connection_proposal_request

val make_get_environment_response : environment:environment -> unit -> get_environment_response
val make_get_environment_request : id:environment_id -> unit -> get_environment_request
val make_get_connection_response : ?connection:connection -> unit -> get_connection_response
val make_get_connection_request : identifier:connection_id -> unit -> get_connection_request
val make_delete_connection_response : connection:connection -> unit -> delete_connection_response

val make_delete_connection_request :
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  identifier:connection_id ->
  unit ->
  delete_connection_request

val make_create_connection_response : ?connection:connection -> unit -> create_connection_response

val make_create_connection_request :
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tags:tag_map ->
  ?remote_account:remote_account_identifier ->
  ?description:connection_description ->
  environment_id:environment_id ->
  attach_point:attach_point ->
  bandwidth:connection_bandwidth ->
  unit ->
  create_connection_request
(** {1:operations Operations} *)

module CreateConnection : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_connection_request ->
    (create_connection_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_connection_request ->
    ( create_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates the process to create a Connection across the specified Environment. \n\n\
  \ The Environment dictates the specified partner and location to which the other end of the \
   connection should attach. You can see a list of the available Environments by calling \
   [ListEnvironments] \n\
  \ \n\
  \  The Attach Point specifies where within the AWS Network your connection will logically connect.\n\
  \  \n\
  \   After a successful call to this method, the resulting [Connection] will return an Activation \
   Key which will need to be brought to the specific partner's portal to confirm the [Connection] \
   on both sides. (See [Environment$activationPageUrl] for a direct link to the partner portal). \n\
  \   "]

module DeleteConnection : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_request ->
    (delete_connection_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_request ->
    ( delete_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing Connection with the supplied identifier.\n\n\
  \ This operation will also inform the remote partner of your intention to delete your \
   connection. Note, the partner may still require you to delete to fully clean up resources, but \
   the network connectivity provided by the [Connection] will cease to exist.\n\
  \ "]

module GetConnection : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_connection_request ->
    (get_connection_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_connection_request ->
    ( get_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the current state of a Connection resource as specified by the identifier. \n"]

module GetEnvironment : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_environment_request ->
    (get_environment_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_environment_request ->
    ( get_environment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a specific [Environment] \n"]

module AcceptConnectionProposal : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_connection_proposal_request ->
    (accept_connection_proposal_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_connection_proposal_request ->
    ( accept_connection_proposal_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts a connection proposal which was generated at a supported partner's portal.\n\n\
  \ The proposal contains the Environment and bandwidth that were chosen on the partner's portal \
   and cannot be modified.\n\
  \ \n\
  \  Upon accepting the proposal a connection will be made between the AWS network as accessed via \
   the selected Attach Point and the network previously selected network on the partner's portal.\n\
  \  "]

module DescribeConnectionProposal : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_connection_proposal_request ->
    (describe_connection_proposal_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_connection_proposal_request ->
    ( describe_connection_proposal_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the details of a connection proposal generated at a partner's portal.\n"]

module ListAttachPoints : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_attach_points_request ->
    (list_attach_points_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_attach_points_request ->
    ( list_attach_points_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all Attach Points the caller has access to that are valid for the specified [Environment].\n"]

module ListConnections : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_connections_request ->
    (list_connections_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_connections_request ->
    ( list_connections_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all connection objects to which the caller has access.\n\n\
  \ Allows for optional filtering by the following properties:\n\
  \ \n\
  \  {ul\n\
  \        {-   [state] \n\
  \            \n\
  \             }\n\
  \        {-   [environmentId] \n\
  \            \n\
  \             }\n\
  \        {-   [provider] \n\
  \            \n\
  \             }\n\
  \        {-   [attach point] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   Only [Connection] objects matching all filters will be returned.\n\
  \   "]

module ListEnvironments : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_environments_request ->
    (list_environments_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_environments_request ->
    ( list_environments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all of the environments that can produce connections that will land in the called AWS \
   region.\n"]

module ListTagsForResource : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    (list_tags_for_resource_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List all current tags on the specified resource. Currently this supports [Connection] resources. \n"]

module TagResource : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    (tag_resource_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Add new tags to the specified resource.\n"]

module UntagResource : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    (untag_resource_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes tags from the specified resource.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateConnection : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_connection_request ->
    (update_connection_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_connection_request ->
    ( update_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies an existing connection. Currently we support modifications to the connection's \
   description and/or bandwidth.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
