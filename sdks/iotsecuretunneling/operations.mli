open Types

module CloseTunnel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    close_tunnel_request ->
    ( close_tunnel_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    close_tunnel_request ->
    ( close_tunnel_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Closes a tunnel identified by the unique tunnel id. When a [CloseTunnel] request is received, \
   we close the WebSocket connections between the client and proxy server so no data can be \
   transmitted.\n\n\
  \ Requires permission to access the \
   {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions}CloseTunnel} \
   action.\n\
  \ "]

module DescribeTunnel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tunnel_request ->
    ( describe_tunnel_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tunnel_request ->
    ( describe_tunnel_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about a tunnel identified by the unique tunnel id.\n\n\
  \ Requires permission to access the \
   {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions}DescribeTunnel} \
   action.\n\
  \ "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the tags for the specified resource.\n"]

module ListTunnels : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tunnels_request ->
    (list_tunnels_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tunnels_request ->
    ( list_tunnels_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List all tunnels for an Amazon Web Services account. Tunnels are listed by creation time in \
   descending order, newer tunnels will be listed before older tunnels.\n\n\
  \ Requires permission to access the \
   {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions}ListTunnels} \
   action.\n\
  \ "]

module OpenTunnel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    open_tunnel_request ->
    ( open_tunnel_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    open_tunnel_request ->
    ( open_tunnel_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new tunnel, and returns two client access tokens for clients to use to connect to the \
   IoT Secure Tunneling proxy server.\n\n\
  \ Requires permission to access the \
   {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions}OpenTunnel} \
   action.\n\
  \ "]

module RotateTunnelAccessToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    rotate_tunnel_access_token_request ->
    ( rotate_tunnel_access_token_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    rotate_tunnel_access_token_request ->
    ( rotate_tunnel_access_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Revokes the current client access token (CAT) and returns new CAT for clients to use when \
   reconnecting to secure tunneling to access the same tunnel.\n\n\
  \ Requires permission to access the \
   {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions}RotateTunnelAccessToken} \
   action.\n\
  \ \n\
  \   Rotating the CAT doesn't extend the tunnel duration. For example, say the tunnel duration is \
   12 hours and the tunnel has already been open for 4 hours. When you rotate the access tokens, \
   the new tokens that are generated can only be used for the remaining 8 hours.\n\
  \   \n\
  \    "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "A resource tag.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a tag from a resource.\n"]
