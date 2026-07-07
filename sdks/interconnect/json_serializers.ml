open Smaws_Lib.Json.SerializeHelpers
open Types

let connection_id_to_yojson = string_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let connection_description_to_yojson = string_to_yojson
let connection_bandwidth_to_yojson = string_to_yojson
let direct_connect_gateway_attach_point_to_yojson = string_to_yojson

let attach_point_to_yojson (x : attach_point) =
  match x with
  | Arn arg -> assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson arg)) ]
  | DirectConnectGateway arg ->
      assoc_to_yojson
        [ ("directConnectGateway", Some (direct_connect_gateway_attach_point_to_yojson arg)) ]

let environment_id_to_yojson = string_to_yojson
let cloud_service_provider_to_yojson = string_to_yojson
let last_mile_provider_to_yojson = string_to_yojson

let provider_to_yojson (x : provider) =
  match x with
  | LastMileProvider arg ->
      assoc_to_yojson [ ("lastMileProvider", Some (last_mile_provider_to_yojson arg)) ]
  | CloudServiceProvider arg ->
      assoc_to_yojson [ ("cloudServiceProvider", Some (cloud_service_provider_to_yojson arg)) ]

let location_to_yojson = string_to_yojson
let product_type_to_yojson = string_to_yojson

let connection_state_to_yojson (x : connection_state) =
  match x with
  | UPDATING -> `String "updating"
  | FAILED -> `String "failed"
  | DELETED -> `String "deleted"
  | DELETING -> `String "deleting"
  | DOWN -> `String "down"
  | PENDING -> `String "pending"
  | REQUESTED -> `String "requested"
  | AVAILABLE -> `String "available"

let connection_shared_id_to_yojson = string_to_yojson
let billing_tier_to_yojson = int_to_yojson
let owner_account_id_to_yojson = string_to_yojson
let activation_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let connection_to_yojson (x : connection) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_map_to_yojson x.tags);
      ("activationKey", Some (activation_key_to_yojson x.activation_key));
      ("ownerAccount", Some (owner_account_id_to_yojson x.owner_account));
      ("billingTier", option_to_yojson billing_tier_to_yojson x.billing_tier);
      ("sharedId", Some (connection_shared_id_to_yojson x.shared_id));
      ("state", Some (connection_state_to_yojson x.state));
      ("type", Some (product_type_to_yojson x.type_));
      ("location", Some (location_to_yojson x.location));
      ("provider", Some (provider_to_yojson x.provider));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("attachPoint", Some (attach_point_to_yojson x.attach_point));
      ("bandwidth", Some (connection_bandwidth_to_yojson x.bandwidth));
      ("description", Some (connection_description_to_yojson x.description));
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("id", Some (connection_id_to_yojson x.id));
    ]

let update_connection_response_to_yojson (x : update_connection_response) =
  assoc_to_yojson [ ("connection", option_to_yojson connection_to_yojson x.connection) ]

let update_connection_request_to_yojson (x : update_connection_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("bandwidth", option_to_yojson connection_bandwidth_to_yojson x.bandwidth);
      ("description", option_to_yojson connection_description_to_yojson x.description);
      ("identifier", Some (connection_id_to_yojson x.identifier));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (tag_map_to_yojson x.tags)); ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let remote_owner_account_to_yojson = string_to_yojson

let remote_account_identifier_type_to_yojson (x : remote_account_identifier_type) =
  match x with EMAIL -> `String "email" | ACCOUNT -> `String "account"

let remote_account_identifier_to_yojson (x : remote_account_identifier) =
  match x with
  | Identifier arg -> assoc_to_yojson [ ("identifier", Some (remote_owner_account_to_yojson arg)) ]

let next_token_to_yojson = string_to_yojson
let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_map_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let environment_state_to_yojson (x : environment_state) =
  match x with
  | UNAVAILABLE -> `String "unavailable"
  | LIMITED -> `String "limited"
  | AVAILABLE -> `String "available"

let bandwidth_list_to_yojson tree = list_to_yojson connection_bandwidth_to_yojson tree

let bandwidths_to_yojson (x : bandwidths) =
  assoc_to_yojson
    [
      ("supported", option_to_yojson bandwidth_list_to_yojson x.supported);
      ("available", option_to_yojson bandwidth_list_to_yojson x.available);
    ]

let environment_to_yojson (x : environment) =
  assoc_to_yojson
    [
      ( "remoteIdentifierType",
        option_to_yojson remote_account_identifier_type_to_yojson x.remote_identifier_type );
      ( "activationPageUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.activation_page_url );
      ("type", Some (product_type_to_yojson x.type_));
      ("bandwidths", Some (bandwidths_to_yojson x.bandwidths));
      ("state", Some (environment_state_to_yojson x.state));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("location", Some (location_to_yojson x.location));
      ("provider", Some (provider_to_yojson x.provider));
    ]

let environment_list_to_yojson tree = list_to_yojson environment_to_yojson tree

let list_environments_response_to_yojson (x : list_environments_response) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("environments", Some (environment_list_to_yojson x.environments));
    ]

let list_environments_request_to_yojson (x : list_environments_request) =
  assoc_to_yojson
    [
      ("location", option_to_yojson location_to_yojson x.location);
      ("provider", option_to_yojson provider_to_yojson x.provider);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let connection_summary_to_yojson (x : connection_summary) =
  assoc_to_yojson
    [
      ("billingTier", option_to_yojson billing_tier_to_yojson x.billing_tier);
      ("sharedId", Some (connection_shared_id_to_yojson x.shared_id));
      ("state", Some (connection_state_to_yojson x.state));
      ("type", Some (product_type_to_yojson x.type_));
      ("location", Some (location_to_yojson x.location));
      ("provider", Some (provider_to_yojson x.provider));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("attachPoint", Some (attach_point_to_yojson x.attach_point));
      ("bandwidth", Some (connection_bandwidth_to_yojson x.bandwidth));
      ("description", Some (connection_description_to_yojson x.description));
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("id", Some (connection_id_to_yojson x.id));
    ]

let connection_summaries_list_to_yojson tree = list_to_yojson connection_summary_to_yojson tree

let list_connections_response_to_yojson (x : list_connections_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("connections", option_to_yojson connection_summaries_list_to_yojson x.connections);
    ]

let list_connections_request_to_yojson (x : list_connections_request) =
  assoc_to_yojson
    [
      ("attachPoint", option_to_yojson attach_point_to_yojson x.attach_point);
      ("provider", option_to_yojson provider_to_yojson x.provider);
      ("environmentId", option_to_yojson environment_id_to_yojson x.environment_id);
      ("state", option_to_yojson connection_state_to_yojson x.state);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let attach_point_type_to_yojson (x : attach_point_type) =
  match x with DirectConnectGateway -> `String "DirectConnectGateway"

let attach_point_descriptor_to_yojson (x : attach_point_descriptor) =
  assoc_to_yojson
    [
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("identifier", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.identifier));
      ("type", Some (attach_point_type_to_yojson x.type_));
    ]

let attach_point_descriptor_list_to_yojson tree =
  list_to_yojson attach_point_descriptor_to_yojson tree

let list_attach_points_response_to_yojson (x : list_attach_points_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("attachPoints", Some (attach_point_descriptor_list_to_yojson x.attach_points));
    ]

let list_attach_points_request_to_yojson (x : list_attach_points_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
    ]

let interconnect_validation_exception_to_yojson (x : interconnect_validation_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let interconnect_server_exception_to_yojson (x : interconnect_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let interconnect_client_exception_to_yojson (x : interconnect_client_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let describe_connection_proposal_response_to_yojson (x : describe_connection_proposal_response) =
  assoc_to_yojson
    [
      ("location", Some (location_to_yojson x.location));
      ("provider", Some (provider_to_yojson x.provider));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("bandwidth", Some (connection_bandwidth_to_yojson x.bandwidth));
    ]

let describe_connection_proposal_request_to_yojson (x : describe_connection_proposal_request) =
  assoc_to_yojson [ ("activationKey", Some (activation_key_to_yojson x.activation_key)) ]

let accept_connection_proposal_response_to_yojson (x : accept_connection_proposal_response) =
  assoc_to_yojson [ ("connection", option_to_yojson connection_to_yojson x.connection) ]

let accept_connection_proposal_request_to_yojson (x : accept_connection_proposal_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("tags", option_to_yojson tag_map_to_yojson x.tags);
      ("description", option_to_yojson connection_description_to_yojson x.description);
      ("activationKey", Some (activation_key_to_yojson x.activation_key));
      ("attachPoint", Some (attach_point_to_yojson x.attach_point));
    ]

let get_environment_response_to_yojson (x : get_environment_response) =
  assoc_to_yojson [ ("environment", Some (environment_to_yojson x.environment)) ]

let get_environment_request_to_yojson (x : get_environment_request) =
  assoc_to_yojson [ ("id", Some (environment_id_to_yojson x.id)) ]

let get_connection_response_to_yojson (x : get_connection_response) =
  assoc_to_yojson [ ("connection", option_to_yojson connection_to_yojson x.connection) ]

let get_connection_request_to_yojson (x : get_connection_request) =
  assoc_to_yojson [ ("identifier", Some (connection_id_to_yojson x.identifier)) ]

let delete_connection_response_to_yojson (x : delete_connection_response) =
  assoc_to_yojson [ ("connection", Some (connection_to_yojson x.connection)) ]

let delete_connection_request_to_yojson (x : delete_connection_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("identifier", Some (connection_id_to_yojson x.identifier));
    ]

let create_connection_response_to_yojson (x : create_connection_response) =
  assoc_to_yojson [ ("connection", option_to_yojson connection_to_yojson x.connection) ]

let create_connection_request_to_yojson (x : create_connection_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("tags", option_to_yojson tag_map_to_yojson x.tags);
      ("remoteAccount", option_to_yojson remote_account_identifier_to_yojson x.remote_account);
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("attachPoint", Some (attach_point_to_yojson x.attach_point));
      ("bandwidth", Some (connection_bandwidth_to_yojson x.bandwidth));
      ("description", option_to_yojson connection_description_to_yojson x.description);
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]
