open Smaws_Lib.Json.SerializeHelpers
open Types

let untag_resource_response_to_yojson = unit_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
    ]

let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let tunnel_id_to_yojson = string_to_yojson
let tunnel_arn_to_yojson = string_to_yojson

let tunnel_status_to_yojson (x : tunnel_status) =
  match x with CLOSED -> `String "CLOSED" | OPEN -> `String "OPEN"

let description_to_yojson = string_to_yojson
let date_type_to_yojson = timestamp_epoch_seconds_to_yojson

let tunnel_summary_to_yojson (x : tunnel_summary) =
  assoc_to_yojson
    [
      ("lastUpdatedAt", option_to_yojson date_type_to_yojson x.last_updated_at);
      ("createdAt", option_to_yojson date_type_to_yojson x.created_at);
      ("description", option_to_yojson description_to_yojson x.description);
      ("status", option_to_yojson tunnel_status_to_yojson x.status);
      ("tunnelArn", option_to_yojson tunnel_arn_to_yojson x.tunnel_arn);
      ("tunnelId", option_to_yojson tunnel_id_to_yojson x.tunnel_id);
    ]

let tunnel_summary_list_to_yojson tree = list_to_yojson tunnel_summary_to_yojson tree

let connection_status_to_yojson (x : connection_status) =
  match x with DISCONNECTED -> `String "DISCONNECTED" | CONNECTED -> `String "CONNECTED"

let connection_state_to_yojson (x : connection_state) =
  assoc_to_yojson
    [
      ("lastUpdatedAt", option_to_yojson date_type_to_yojson x.last_updated_at);
      ("status", option_to_yojson connection_status_to_yojson x.status);
    ]

let thing_name_to_yojson = string_to_yojson
let service_to_yojson = string_to_yojson
let service_list_to_yojson tree = list_to_yojson service_to_yojson tree

let destination_config_to_yojson (x : destination_config) =
  assoc_to_yojson
    [
      ("services", Some (service_list_to_yojson x.services));
      ("thingName", option_to_yojson thing_name_to_yojson x.thing_name);
    ]

let timeout_in_min_to_yojson = int_to_yojson

let timeout_config_to_yojson (x : timeout_config) =
  assoc_to_yojson
    [
      ( "maxLifetimeTimeoutMinutes",
        option_to_yojson timeout_in_min_to_yojson x.max_lifetime_timeout_minutes );
    ]

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("value", Some (tag_value_to_yojson x.value)); ("key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tunnel_to_yojson (x : tunnel) =
  assoc_to_yojson
    [
      ("lastUpdatedAt", option_to_yojson date_type_to_yojson x.last_updated_at);
      ("createdAt", option_to_yojson date_type_to_yojson x.created_at);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("timeoutConfig", option_to_yojson timeout_config_to_yojson x.timeout_config);
      ("destinationConfig", option_to_yojson destination_config_to_yojson x.destination_config);
      ("description", option_to_yojson description_to_yojson x.description);
      ( "destinationConnectionState",
        option_to_yojson connection_state_to_yojson x.destination_connection_state );
      ( "sourceConnectionState",
        option_to_yojson connection_state_to_yojson x.source_connection_state );
      ("status", option_to_yojson tunnel_status_to_yojson x.status);
      ("tunnelArn", option_to_yojson tunnel_arn_to_yojson x.tunnel_arn);
      ("tunnelId", option_to_yojson tunnel_id_to_yojson x.tunnel_id);
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (tag_list_to_yojson x.tags));
      ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
    ]

let client_access_token_to_yojson = string_to_yojson

let rotate_tunnel_access_token_response_to_yojson (x : rotate_tunnel_access_token_response) =
  assoc_to_yojson
    [
      ( "destinationAccessToken",
        option_to_yojson client_access_token_to_yojson x.destination_access_token );
      ("sourceAccessToken", option_to_yojson client_access_token_to_yojson x.source_access_token);
      ("tunnelArn", option_to_yojson tunnel_arn_to_yojson x.tunnel_arn);
    ]

let client_mode_to_yojson (x : client_mode) =
  match x with
  | ALL -> `String "ALL"
  | DESTINATION -> `String "DESTINATION"
  | SOURCE -> `String "SOURCE"

let rotate_tunnel_access_token_request_to_yojson (x : rotate_tunnel_access_token_request) =
  assoc_to_yojson
    [
      ("destinationConfig", option_to_yojson destination_config_to_yojson x.destination_config);
      ("clientMode", Some (client_mode_to_yojson x.client_mode));
      ("tunnelId", Some (tunnel_id_to_yojson x.tunnel_id));
    ]

let open_tunnel_response_to_yojson (x : open_tunnel_response) =
  assoc_to_yojson
    [
      ( "destinationAccessToken",
        option_to_yojson client_access_token_to_yojson x.destination_access_token );
      ("sourceAccessToken", option_to_yojson client_access_token_to_yojson x.source_access_token);
      ("tunnelArn", option_to_yojson tunnel_arn_to_yojson x.tunnel_arn);
      ("tunnelId", option_to_yojson tunnel_id_to_yojson x.tunnel_id);
    ]

let open_tunnel_request_to_yojson (x : open_tunnel_request) =
  assoc_to_yojson
    [
      ("timeoutConfig", option_to_yojson timeout_config_to_yojson x.timeout_config);
      ("destinationConfig", option_to_yojson destination_config_to_yojson x.destination_config);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("description", option_to_yojson description_to_yojson x.description);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let next_token_to_yojson = string_to_yojson
let max_results_to_yojson = int_to_yojson

let list_tunnels_response_to_yojson (x : list_tunnels_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("tunnelSummaries", option_to_yojson tunnel_summary_list_to_yojson x.tunnel_summaries);
    ]

let list_tunnels_request_to_yojson (x : list_tunnels_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("thingName", option_to_yojson thing_name_to_yojson x.thing_name);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]

let describe_tunnel_response_to_yojson (x : describe_tunnel_response) =
  assoc_to_yojson [ ("tunnel", option_to_yojson tunnel_to_yojson x.tunnel) ]

let describe_tunnel_request_to_yojson (x : describe_tunnel_request) =
  assoc_to_yojson [ ("tunnelId", Some (tunnel_id_to_yojson x.tunnel_id)) ]

let close_tunnel_response_to_yojson = unit_to_yojson
let delete_flag_to_yojson = bool_to_yojson

let close_tunnel_request_to_yojson (x : close_tunnel_request) =
  assoc_to_yojson
    [
      ("delete", option_to_yojson delete_flag_to_yojson x.delete);
      ("tunnelId", Some (tunnel_id_to_yojson x.tunnel_id));
    ]
