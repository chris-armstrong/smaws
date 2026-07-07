open Smaws_Lib.Json.DeserializeHelpers
open Types

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let amazon_resource_name_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
     resource_arn = value_for_key amazon_resource_name_of_yojson "resourceArn" _list path;
   }
    : untag_resource_request)

let error_message_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_not_found_exception)

let tunnel_id_of_yojson = string_of_yojson
let tunnel_arn_of_yojson = string_of_yojson

let tunnel_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CLOSED" -> CLOSED
    | `String "OPEN" -> OPEN
    | `String value -> raise (deserialize_unknown_enum_value_error path "TunnelStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TunnelStatus")
     : tunnel_status)
    : tunnel_status)

let description_of_yojson = string_of_yojson
let date_type_of_yojson = timestamp_epoch_seconds_of_yojson

let tunnel_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_at =
       option_of_yojson (value_for_key date_type_of_yojson "lastUpdatedAt") _list path;
     created_at = option_of_yojson (value_for_key date_type_of_yojson "createdAt") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     status = option_of_yojson (value_for_key tunnel_status_of_yojson "status") _list path;
     tunnel_arn = option_of_yojson (value_for_key tunnel_arn_of_yojson "tunnelArn") _list path;
     tunnel_id = option_of_yojson (value_for_key tunnel_id_of_yojson "tunnelId") _list path;
   }
    : tunnel_summary)

let tunnel_summary_list_of_yojson tree path = list_of_yojson tunnel_summary_of_yojson tree path

let connection_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISCONNECTED" -> DISCONNECTED
    | `String "CONNECTED" -> CONNECTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionStatus")
     : connection_status)
    : connection_status)

let connection_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_at =
       option_of_yojson (value_for_key date_type_of_yojson "lastUpdatedAt") _list path;
     status = option_of_yojson (value_for_key connection_status_of_yojson "status") _list path;
   }
    : connection_state)

let thing_name_of_yojson = string_of_yojson
let service_of_yojson = string_of_yojson
let service_list_of_yojson tree path = list_of_yojson service_of_yojson tree path

let destination_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     services = value_for_key service_list_of_yojson "services" _list path;
     thing_name = option_of_yojson (value_for_key thing_name_of_yojson "thingName") _list path;
   }
    : destination_config)

let timeout_in_min_of_yojson = int_of_yojson

let timeout_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_lifetime_timeout_minutes =
       option_of_yojson
         (value_for_key timeout_in_min_of_yojson "maxLifetimeTimeoutMinutes")
         _list path;
   }
    : timeout_config)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "value" _list path;
     key = value_for_key tag_key_of_yojson "key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tunnel_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_at =
       option_of_yojson (value_for_key date_type_of_yojson "lastUpdatedAt") _list path;
     created_at = option_of_yojson (value_for_key date_type_of_yojson "createdAt") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     timeout_config =
       option_of_yojson (value_for_key timeout_config_of_yojson "timeoutConfig") _list path;
     destination_config =
       option_of_yojson (value_for_key destination_config_of_yojson "destinationConfig") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     destination_connection_state =
       option_of_yojson
         (value_for_key connection_state_of_yojson "destinationConnectionState")
         _list path;
     source_connection_state =
       option_of_yojson
         (value_for_key connection_state_of_yojson "sourceConnectionState")
         _list path;
     status = option_of_yojson (value_for_key tunnel_status_of_yojson "status") _list path;
     tunnel_arn = option_of_yojson (value_for_key tunnel_arn_of_yojson "tunnelArn") _list path;
     tunnel_id = option_of_yojson (value_for_key tunnel_id_of_yojson "tunnelId") _list path;
   }
    : tunnel)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "tags" _list path;
     resource_arn = value_for_key amazon_resource_name_of_yojson "resourceArn" _list path;
   }
    : tag_resource_request)

let client_access_token_of_yojson = string_of_yojson

let rotate_tunnel_access_token_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_access_token =
       option_of_yojson
         (value_for_key client_access_token_of_yojson "destinationAccessToken")
         _list path;
     source_access_token =
       option_of_yojson (value_for_key client_access_token_of_yojson "sourceAccessToken") _list path;
     tunnel_arn = option_of_yojson (value_for_key tunnel_arn_of_yojson "tunnelArn") _list path;
   }
    : rotate_tunnel_access_token_response)

let client_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL" -> ALL
    | `String "DESTINATION" -> DESTINATION
    | `String "SOURCE" -> SOURCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClientMode" value)
    | _ -> raise (deserialize_wrong_type_error path "ClientMode")
     : client_mode)
    : client_mode)

let rotate_tunnel_access_token_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_config =
       option_of_yojson (value_for_key destination_config_of_yojson "destinationConfig") _list path;
     client_mode = value_for_key client_mode_of_yojson "clientMode" _list path;
     tunnel_id = value_for_key tunnel_id_of_yojson "tunnelId" _list path;
   }
    : rotate_tunnel_access_token_request)

let open_tunnel_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_access_token =
       option_of_yojson
         (value_for_key client_access_token_of_yojson "destinationAccessToken")
         _list path;
     source_access_token =
       option_of_yojson (value_for_key client_access_token_of_yojson "sourceAccessToken") _list path;
     tunnel_arn = option_of_yojson (value_for_key tunnel_arn_of_yojson "tunnelArn") _list path;
     tunnel_id = option_of_yojson (value_for_key tunnel_id_of_yojson "tunnelId") _list path;
   }
    : open_tunnel_response)

let open_tunnel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_config =
       option_of_yojson (value_for_key timeout_config_of_yojson "timeoutConfig") _list path;
     destination_config =
       option_of_yojson (value_for_key destination_config_of_yojson "destinationConfig") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
   }
    : open_tunnel_request)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let next_token_of_yojson = string_of_yojson
let max_results_of_yojson = int_of_yojson

let list_tunnels_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     tunnel_summaries =
       option_of_yojson (value_for_key tunnel_summary_list_of_yojson "tunnelSummaries") _list path;
   }
    : list_tunnels_response)

let list_tunnels_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     thing_name = option_of_yojson (value_for_key thing_name_of_yojson "thingName") _list path;
   }
    : list_tunnels_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key amazon_resource_name_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let describe_tunnel_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tunnel = option_of_yojson (value_for_key tunnel_of_yojson "tunnel") _list path }
    : describe_tunnel_response)

let describe_tunnel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tunnel_id = value_for_key tunnel_id_of_yojson "tunnelId" _list path }
    : describe_tunnel_request)

let close_tunnel_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_flag_of_yojson = bool_of_yojson

let close_tunnel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete = option_of_yojson (value_for_key delete_flag_of_yojson "delete") _list path;
     tunnel_id = value_for_key tunnel_id_of_yojson "tunnelId" _list path;
   }
    : close_tunnel_request)
