open Types

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
