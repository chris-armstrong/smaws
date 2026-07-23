(** IoTSecureTunneling client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_close_tunnel_response : unit -> unit

val make_close_tunnel_request :
  ?delete:delete_flag -> tunnel_id:tunnel_id -> unit -> close_tunnel_request

val make_connection_state :
  ?status:connection_status -> ?last_updated_at:date_type -> unit -> connection_state

val make_tag : key:tag_key -> value:tag_value -> unit -> tag
val make_timeout_config : ?max_lifetime_timeout_minutes:timeout_in_min -> unit -> timeout_config

val make_destination_config :
  ?thing_name:thing_name -> services:service_list -> unit -> destination_config

val make_tunnel :
  ?tunnel_id:tunnel_id ->
  ?tunnel_arn:tunnel_arn ->
  ?status:tunnel_status ->
  ?source_connection_state:connection_state ->
  ?destination_connection_state:connection_state ->
  ?description:description ->
  ?destination_config:destination_config ->
  ?timeout_config:timeout_config ->
  ?tags:tag_list ->
  ?created_at:date_type ->
  ?last_updated_at:date_type ->
  unit ->
  tunnel

val make_describe_tunnel_response : ?tunnel:tunnel -> unit -> describe_tunnel_response
val make_describe_tunnel_request : tunnel_id:tunnel_id -> unit -> describe_tunnel_request
val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_request

val make_rotate_tunnel_access_token_response :
  ?tunnel_arn:tunnel_arn ->
  ?source_access_token:client_access_token ->
  ?destination_access_token:client_access_token ->
  unit ->
  rotate_tunnel_access_token_response

val make_rotate_tunnel_access_token_request :
  ?destination_config:destination_config ->
  tunnel_id:tunnel_id ->
  client_mode:client_mode ->
  unit ->
  rotate_tunnel_access_token_request

val make_open_tunnel_response :
  ?tunnel_id:tunnel_id ->
  ?tunnel_arn:tunnel_arn ->
  ?source_access_token:client_access_token ->
  ?destination_access_token:client_access_token ->
  unit ->
  open_tunnel_response

val make_open_tunnel_request :
  ?description:description ->
  ?tags:tag_list ->
  ?destination_config:destination_config ->
  ?timeout_config:timeout_config ->
  unit ->
  open_tunnel_request

val make_tunnel_summary :
  ?tunnel_id:tunnel_id ->
  ?tunnel_arn:tunnel_arn ->
  ?status:tunnel_status ->
  ?description:description ->
  ?created_at:date_type ->
  ?last_updated_at:date_type ->
  unit ->
  tunnel_summary

val make_list_tunnels_response :
  ?tunnel_summaries:tunnel_summary_list -> ?next_token:next_token -> unit -> list_tunnels_response

val make_list_tunnels_request :
  ?thing_name:thing_name ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_tunnels_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_request
(** {1:operations Operations} *)

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

(** {1:Serialization and Deserialization} *)
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

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
