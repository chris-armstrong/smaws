(** IoTSecureTunneling client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:amazon_resource_name -> unit -> untag_resource_request

val make_tunnel_summary :
  ?last_updated_at:date_type ->
  ?created_at:date_type ->
  ?description:description ->
  ?status:tunnel_status ->
  ?tunnel_arn:tunnel_arn ->
  ?tunnel_id:tunnel_id ->
  unit ->
  tunnel_summary

val make_connection_state :
  ?last_updated_at:date_type -> ?status:connection_status -> unit -> connection_state

val make_destination_config :
  ?thing_name:thing_name -> services:service_list -> unit -> destination_config

val make_timeout_config : ?max_lifetime_timeout_minutes:timeout_in_min -> unit -> timeout_config
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tunnel :
  ?last_updated_at:date_type ->
  ?created_at:date_type ->
  ?tags:tag_list ->
  ?timeout_config:timeout_config ->
  ?destination_config:destination_config ->
  ?description:description ->
  ?destination_connection_state:connection_state ->
  ?source_connection_state:connection_state ->
  ?status:tunnel_status ->
  ?tunnel_arn:tunnel_arn ->
  ?tunnel_id:tunnel_id ->
  unit ->
  tunnel

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:tag_list -> resource_arn:amazon_resource_name -> unit -> tag_resource_request

val make_rotate_tunnel_access_token_response :
  ?destination_access_token:client_access_token ->
  ?source_access_token:client_access_token ->
  ?tunnel_arn:tunnel_arn ->
  unit ->
  rotate_tunnel_access_token_response

val make_rotate_tunnel_access_token_request :
  ?destination_config:destination_config ->
  client_mode:client_mode ->
  tunnel_id:tunnel_id ->
  unit ->
  rotate_tunnel_access_token_request

val make_open_tunnel_response :
  ?destination_access_token:client_access_token ->
  ?source_access_token:client_access_token ->
  ?tunnel_arn:tunnel_arn ->
  ?tunnel_id:tunnel_id ->
  unit ->
  open_tunnel_response

val make_open_tunnel_request :
  ?timeout_config:timeout_config ->
  ?destination_config:destination_config ->
  ?tags:tag_list ->
  ?description:description ->
  unit ->
  open_tunnel_request

val make_list_tunnels_response :
  ?next_token:next_token -> ?tunnel_summaries:tunnel_summary_list -> unit -> list_tunnels_response

val make_list_tunnels_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?thing_name:thing_name ->
  unit ->
  list_tunnels_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_describe_tunnel_response : ?tunnel:tunnel -> unit -> describe_tunnel_response
val make_describe_tunnel_request : tunnel_id:tunnel_id -> unit -> describe_tunnel_request
val make_close_tunnel_response : unit -> unit

val make_close_tunnel_request :
  ?delete:delete_flag -> tunnel_id:tunnel_id -> unit -> close_tunnel_request
(** {1:operations Operations} *)

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

(** {1:Serialization and Deserialization} *)
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

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
