open Smaws_Lib.Json.SerializeHelpers
open Types

let amazon_resource_name_to_yojson = string_to_yojson
let client_access_token_to_yojson = string_to_yojson

let client_mode_to_yojson (x : client_mode) =
  match x with
  | SOURCE -> `String "SOURCE"
  | DESTINATION -> `String "DESTINATION"
  | ALL -> `String "ALL"

let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let close_tunnel_response_to_yojson = unit_to_yojson
let delete_flag_to_yojson = bool_to_yojson
let tunnel_id_to_yojson = string_to_yojson

let close_tunnel_request_to_yojson (x : close_tunnel_request) =
  assoc_to_yojson
    [
      ("tunnelId", Some (tunnel_id_to_yojson x.tunnel_id));
      ("delete", option_to_yojson delete_flag_to_yojson x.delete);
    ]

let date_type_to_yojson = timestamp_epoch_seconds_to_yojson

let connection_status_to_yojson (x : connection_status) =
  match x with CONNECTED -> `String "CONNECTED" | DISCONNECTED -> `String "DISCONNECTED"

let connection_state_to_yojson (x : connection_state) =
  assoc_to_yojson
    [
      ("status", option_to_yojson connection_status_to_yojson x.status);
      ("lastUpdatedAt", option_to_yojson date_type_to_yojson x.last_updated_at);
    ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("key", Some (tag_key_to_yojson x.key)); ("value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let timeout_in_min_to_yojson = int_to_yojson

let timeout_config_to_yojson (x : timeout_config) =
  assoc_to_yojson
    [
      ( "maxLifetimeTimeoutMinutes",
        option_to_yojson timeout_in_min_to_yojson x.max_lifetime_timeout_minutes );
    ]

let service_to_yojson = string_to_yojson
let service_list_to_yojson tree = list_to_yojson service_to_yojson tree
let thing_name_to_yojson = string_to_yojson

let destination_config_to_yojson (x : destination_config) =
  assoc_to_yojson
    [
      ("thingName", option_to_yojson thing_name_to_yojson x.thing_name);
      ("services", Some (service_list_to_yojson x.services));
    ]

let description_to_yojson = string_to_yojson

let tunnel_status_to_yojson (x : tunnel_status) =
  match x with OPEN -> `String "OPEN" | CLOSED -> `String "CLOSED"

let tunnel_arn_to_yojson = string_to_yojson

let tunnel_to_yojson (x : tunnel) =
  assoc_to_yojson
    [
      ("tunnelId", option_to_yojson tunnel_id_to_yojson x.tunnel_id);
      ("tunnelArn", option_to_yojson tunnel_arn_to_yojson x.tunnel_arn);
      ("status", option_to_yojson tunnel_status_to_yojson x.status);
      ( "sourceConnectionState",
        option_to_yojson connection_state_to_yojson x.source_connection_state );
      ( "destinationConnectionState",
        option_to_yojson connection_state_to_yojson x.destination_connection_state );
      ("description", option_to_yojson description_to_yojson x.description);
      ("destinationConfig", option_to_yojson destination_config_to_yojson x.destination_config);
      ("timeoutConfig", option_to_yojson timeout_config_to_yojson x.timeout_config);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("createdAt", option_to_yojson date_type_to_yojson x.created_at);
      ("lastUpdatedAt", option_to_yojson date_type_to_yojson x.last_updated_at);
    ]

let describe_tunnel_response_to_yojson (x : describe_tunnel_response) =
  assoc_to_yojson [ ("tunnel", option_to_yojson tunnel_to_yojson x.tunnel) ]

let describe_tunnel_request_to_yojson (x : describe_tunnel_request) =
  assoc_to_yojson [ ("tunnelId", Some (tunnel_id_to_yojson x.tunnel_id)) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("tags", Some (tag_list_to_yojson x.tags));
    ]

let rotate_tunnel_access_token_response_to_yojson (x : rotate_tunnel_access_token_response) =
  assoc_to_yojson
    [
      ("tunnelArn", option_to_yojson tunnel_arn_to_yojson x.tunnel_arn);
      ("sourceAccessToken", option_to_yojson client_access_token_to_yojson x.source_access_token);
      ( "destinationAccessToken",
        option_to_yojson client_access_token_to_yojson x.destination_access_token );
    ]

let rotate_tunnel_access_token_request_to_yojson (x : rotate_tunnel_access_token_request) =
  assoc_to_yojson
    [
      ("tunnelId", Some (tunnel_id_to_yojson x.tunnel_id));
      ("clientMode", Some (client_mode_to_yojson x.client_mode));
      ("destinationConfig", option_to_yojson destination_config_to_yojson x.destination_config);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let open_tunnel_response_to_yojson (x : open_tunnel_response) =
  assoc_to_yojson
    [
      ("tunnelId", option_to_yojson tunnel_id_to_yojson x.tunnel_id);
      ("tunnelArn", option_to_yojson tunnel_arn_to_yojson x.tunnel_arn);
      ("sourceAccessToken", option_to_yojson client_access_token_to_yojson x.source_access_token);
      ( "destinationAccessToken",
        option_to_yojson client_access_token_to_yojson x.destination_access_token );
    ]

let open_tunnel_request_to_yojson (x : open_tunnel_request) =
  assoc_to_yojson
    [
      ("description", option_to_yojson description_to_yojson x.description);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("destinationConfig", option_to_yojson destination_config_to_yojson x.destination_config);
      ("timeoutConfig", option_to_yojson timeout_config_to_yojson x.timeout_config);
    ]

let next_token_to_yojson = string_to_yojson

let tunnel_summary_to_yojson (x : tunnel_summary) =
  assoc_to_yojson
    [
      ("tunnelId", option_to_yojson tunnel_id_to_yojson x.tunnel_id);
      ("tunnelArn", option_to_yojson tunnel_arn_to_yojson x.tunnel_arn);
      ("status", option_to_yojson tunnel_status_to_yojson x.status);
      ("description", option_to_yojson description_to_yojson x.description);
      ("createdAt", option_to_yojson date_type_to_yojson x.created_at);
      ("lastUpdatedAt", option_to_yojson date_type_to_yojson x.last_updated_at);
    ]

let tunnel_summary_list_to_yojson tree = list_to_yojson tunnel_summary_to_yojson tree

let list_tunnels_response_to_yojson (x : list_tunnels_response) =
  assoc_to_yojson
    [
      ("tunnelSummaries", option_to_yojson tunnel_summary_list_to_yojson x.tunnel_summaries);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_tunnels_request_to_yojson (x : list_tunnels_request) =
  assoc_to_yojson
    [
      ("thingName", option_to_yojson thing_name_to_yojson x.thing_name);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]
