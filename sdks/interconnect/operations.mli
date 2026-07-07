open Types

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
