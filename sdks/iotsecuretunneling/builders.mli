open Types

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
