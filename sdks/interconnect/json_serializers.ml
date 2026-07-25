open Smaws_Lib.Json.SerializeHelpers
open Types

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree
let activation_key_to_yojson = string_to_yojson
let owner_account_id_to_yojson = string_to_yojson
let billing_tier_to_yojson = int_to_yojson
let connection_shared_id_to_yojson = string_to_yojson

let connection_state_to_yojson (x : connection_state) =
  match x with
  | AVAILABLE -> `String "available"
  | REQUESTED -> `String "requested"
  | PENDING -> `String "pending"
  | DOWN -> `String "down"
  | DELETING -> `String "deleting"
  | DELETED -> `String "deleted"
  | FAILED -> `String "failed"
  | UPDATING -> `String "updating"

let product_type_to_yojson = string_to_yojson
let location_to_yojson = string_to_yojson
let last_mile_provider_to_yojson = string_to_yojson
let cloud_service_provider_to_yojson = string_to_yojson

let provider_to_yojson (x : provider) =
  match x with
  | CloudServiceProvider arg ->
      assoc_to_yojson [ ("cloudServiceProvider", Some (cloud_service_provider_to_yojson arg)) ]
  | LastMileProvider arg ->
      assoc_to_yojson [ ("lastMileProvider", Some (last_mile_provider_to_yojson arg)) ]

let environment_id_to_yojson = string_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let direct_connect_gateway_attach_point_to_yojson = string_to_yojson

let attach_point_to_yojson (x : attach_point) =
  match x with
  | DirectConnectGateway arg ->
      assoc_to_yojson
        [ ("directConnectGateway", Some (direct_connect_gateway_attach_point_to_yojson arg)) ]
  | Arn arg -> assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson arg)) ]

let connection_bandwidth_to_yojson = string_to_yojson
let connection_description_to_yojson = string_to_yojson
let connection_id_to_yojson = string_to_yojson

let connection_to_yojson (x : connection) =
  assoc_to_yojson
    [
      ("id", Some (connection_id_to_yojson x.id));
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("description", Some (connection_description_to_yojson x.description));
      ("bandwidth", Some (connection_bandwidth_to_yojson x.bandwidth));
      ("attachPoint", Some (attach_point_to_yojson x.attach_point));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("provider", Some (provider_to_yojson x.provider));
      ("location", Some (location_to_yojson x.location));
      ("type", Some (product_type_to_yojson x.type_));
      ("state", Some (connection_state_to_yojson x.state));
      ("sharedId", Some (connection_shared_id_to_yojson x.shared_id));
      ("billingTier", option_to_yojson billing_tier_to_yojson x.billing_tier);
      ("ownerAccount", Some (owner_account_id_to_yojson x.owner_account));
      ("activationKey", Some (activation_key_to_yojson x.activation_key));
      ("tags", option_to_yojson tag_map_to_yojson x.tags);
    ]

let accept_connection_proposal_response_to_yojson (x : accept_connection_proposal_response) =
  assoc_to_yojson [ ("connection", option_to_yojson connection_to_yojson x.connection) ]

let accept_connection_proposal_request_to_yojson (x : accept_connection_proposal_request) =
  assoc_to_yojson
    [
      ("attachPoint", Some (attach_point_to_yojson x.attach_point));
      ("activationKey", Some (activation_key_to_yojson x.activation_key));
      ("description", option_to_yojson connection_description_to_yojson x.description);
      ("tags", option_to_yojson tag_map_to_yojson x.tags);
      ( "clientToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let attach_point_type_to_yojson (x : attach_point_type) =
  match x with DirectConnectGateway -> `String "DirectConnectGateway"

let attach_point_descriptor_to_yojson (x : attach_point_descriptor) =
  assoc_to_yojson
    [
      ("type", Some (attach_point_type_to_yojson x.type_));
      ("identifier", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.identifier));
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
    ]

let attach_point_descriptor_list_to_yojson tree =
  list_to_yojson attach_point_descriptor_to_yojson tree

let bandwidth_list_to_yojson tree = list_to_yojson connection_bandwidth_to_yojson tree

let bandwidths_to_yojson (x : bandwidths) =
  assoc_to_yojson
    [
      ("available", option_to_yojson bandwidth_list_to_yojson x.available);
      ("supported", option_to_yojson bandwidth_list_to_yojson x.supported);
    ]

let connection_summary_to_yojson (x : connection_summary) =
  assoc_to_yojson
    [
      ("id", Some (connection_id_to_yojson x.id));
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("description", Some (connection_description_to_yojson x.description));
      ("bandwidth", Some (connection_bandwidth_to_yojson x.bandwidth));
      ("attachPoint", Some (attach_point_to_yojson x.attach_point));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("provider", Some (provider_to_yojson x.provider));
      ("location", Some (location_to_yojson x.location));
      ("type", Some (product_type_to_yojson x.type_));
      ("state", Some (connection_state_to_yojson x.state));
      ("sharedId", Some (connection_shared_id_to_yojson x.shared_id));
      ("billingTier", option_to_yojson billing_tier_to_yojson x.billing_tier);
    ]

let connection_summaries_list_to_yojson tree = list_to_yojson connection_summary_to_yojson tree

let create_connection_response_to_yojson (x : create_connection_response) =
  assoc_to_yojson [ ("connection", option_to_yojson connection_to_yojson x.connection) ]

let remote_owner_account_to_yojson = string_to_yojson

let remote_account_identifier_to_yojson (x : remote_account_identifier) =
  match x with
  | Identifier arg -> assoc_to_yojson [ ("identifier", Some (remote_owner_account_to_yojson arg)) ]

let create_connection_request_to_yojson (x : create_connection_request) =
  assoc_to_yojson
    [
      ("description", option_to_yojson connection_description_to_yojson x.description);
      ("bandwidth", Some (connection_bandwidth_to_yojson x.bandwidth));
      ("attachPoint", Some (attach_point_to_yojson x.attach_point));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("remoteAccount", option_to_yojson remote_account_identifier_to_yojson x.remote_account);
      ("tags", option_to_yojson tag_map_to_yojson x.tags);
      ( "clientToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_connection_response_to_yojson (x : delete_connection_response) =
  assoc_to_yojson [ ("connection", Some (connection_to_yojson x.connection)) ]

let delete_connection_request_to_yojson (x : delete_connection_request) =
  assoc_to_yojson
    [
      ("identifier", Some (connection_id_to_yojson x.identifier));
      ( "clientToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let describe_connection_proposal_response_to_yojson (x : describe_connection_proposal_response) =
  assoc_to_yojson
    [
      ("bandwidth", Some (connection_bandwidth_to_yojson x.bandwidth));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("provider", Some (provider_to_yojson x.provider));
      ("location", Some (location_to_yojson x.location));
    ]

let describe_connection_proposal_request_to_yojson (x : describe_connection_proposal_request) =
  assoc_to_yojson [ ("activationKey", Some (activation_key_to_yojson x.activation_key)) ]

let remote_account_identifier_type_to_yojson (x : remote_account_identifier_type) =
  match x with ACCOUNT -> `String "account" | EMAIL -> `String "email"

let environment_state_to_yojson (x : environment_state) =
  match x with
  | AVAILABLE -> `String "available"
  | LIMITED -> `String "limited"
  | UNAVAILABLE -> `String "unavailable"

let environment_to_yojson (x : environment) =
  assoc_to_yojson
    [
      ("provider", Some (provider_to_yojson x.provider));
      ("location", Some (location_to_yojson x.location));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("state", Some (environment_state_to_yojson x.state));
      ("bandwidths", Some (bandwidths_to_yojson x.bandwidths));
      ("type", Some (product_type_to_yojson x.type_));
      ( "activationPageUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.activation_page_url );
      ( "remoteIdentifierType",
        option_to_yojson remote_account_identifier_type_to_yojson x.remote_identifier_type );
    ]

let environment_list_to_yojson tree = list_to_yojson environment_to_yojson tree

let get_connection_response_to_yojson (x : get_connection_response) =
  assoc_to_yojson [ ("connection", option_to_yojson connection_to_yojson x.connection) ]

let get_connection_request_to_yojson (x : get_connection_request) =
  assoc_to_yojson [ ("identifier", Some (connection_id_to_yojson x.identifier)) ]

let get_environment_response_to_yojson (x : get_environment_response) =
  assoc_to_yojson [ ("environment", Some (environment_to_yojson x.environment)) ]

let get_environment_request_to_yojson (x : get_environment_request) =
  assoc_to_yojson [ ("id", Some (environment_id_to_yojson x.id)) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn)); ("tags", Some (tag_map_to_yojson x.tags));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_map_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let next_token_to_yojson = string_to_yojson

let list_attach_points_response_to_yojson (x : list_attach_points_response) =
  assoc_to_yojson
    [
      ("attachPoints", Some (attach_point_descriptor_list_to_yojson x.attach_points));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_attach_points_request_to_yojson (x : list_attach_points_request) =
  assoc_to_yojson
    [
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let interconnect_client_exception_to_yojson (x : interconnect_client_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let interconnect_server_exception_to_yojson (x : interconnect_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let interconnect_validation_exception_to_yojson (x : interconnect_validation_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let list_connections_response_to_yojson (x : list_connections_response) =
  assoc_to_yojson
    [
      ("connections", option_to_yojson connection_summaries_list_to_yojson x.connections);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_connections_request_to_yojson (x : list_connections_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("state", option_to_yojson connection_state_to_yojson x.state);
      ("environmentId", option_to_yojson environment_id_to_yojson x.environment_id);
      ("provider", option_to_yojson provider_to_yojson x.provider);
      ("attachPoint", option_to_yojson attach_point_to_yojson x.attach_point);
    ]

let list_environments_response_to_yojson (x : list_environments_response) =
  assoc_to_yojson
    [
      ("environments", Some (environment_list_to_yojson x.environments));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_environments_request_to_yojson (x : list_environments_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("provider", option_to_yojson provider_to_yojson x.provider);
      ("location", option_to_yojson location_to_yojson x.location);
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let update_connection_response_to_yojson (x : update_connection_response) =
  assoc_to_yojson [ ("connection", option_to_yojson connection_to_yojson x.connection) ]

let update_connection_request_to_yojson (x : update_connection_request) =
  assoc_to_yojson
    [
      ("identifier", Some (connection_id_to_yojson x.identifier));
      ("description", option_to_yojson connection_description_to_yojson x.description);
      ("bandwidth", option_to_yojson connection_bandwidth_to_yojson x.bandwidth);
      ( "clientToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]
