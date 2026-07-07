open Smaws_Lib.Json.DeserializeHelpers
open Types

let connection_id_of_yojson = string_of_yojson
let amazon_resource_name_of_yojson = string_of_yojson
let connection_description_of_yojson = string_of_yojson
let connection_bandwidth_of_yojson = string_of_yojson
let direct_connect_gateway_attach_point_of_yojson = string_of_yojson

let attach_point_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "arn" -> Arn (amazon_resource_name_of_yojson value_ path)
   | "directConnectGateway" ->
       DirectConnectGateway (direct_connect_gateway_attach_point_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "AttachPoint" unknown)
    : attach_point)

let environment_id_of_yojson = string_of_yojson
let cloud_service_provider_of_yojson = string_of_yojson
let last_mile_provider_of_yojson = string_of_yojson

let provider_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "lastMileProvider" -> LastMileProvider (last_mile_provider_of_yojson value_ path)
   | "cloudServiceProvider" -> CloudServiceProvider (cloud_service_provider_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "Provider" unknown)
    : provider)

let location_of_yojson = string_of_yojson
let product_type_of_yojson = string_of_yojson

let connection_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "updating" -> UPDATING
    | `String "failed" -> FAILED
    | `String "deleted" -> DELETED
    | `String "deleting" -> DELETING
    | `String "down" -> DOWN
    | `String "pending" -> PENDING
    | `String "requested" -> REQUESTED
    | `String "available" -> AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionState" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionState")
     : connection_state)
    : connection_state)

let connection_shared_id_of_yojson = string_of_yojson
let billing_tier_of_yojson = int_of_yojson
let owner_account_id_of_yojson = string_of_yojson
let activation_key_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_map_of_yojson tree path = map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let connection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_map_of_yojson "tags") _list path;
     activation_key = value_for_key activation_key_of_yojson "activationKey" _list path;
     owner_account = value_for_key owner_account_id_of_yojson "ownerAccount" _list path;
     billing_tier = option_of_yojson (value_for_key billing_tier_of_yojson "billingTier") _list path;
     shared_id = value_for_key connection_shared_id_of_yojson "sharedId" _list path;
     state = value_for_key connection_state_of_yojson "state" _list path;
     type_ = value_for_key product_type_of_yojson "type" _list path;
     location = value_for_key location_of_yojson "location" _list path;
     provider = value_for_key provider_of_yojson "provider" _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     attach_point = value_for_key attach_point_of_yojson "attachPoint" _list path;
     bandwidth = value_for_key connection_bandwidth_of_yojson "bandwidth" _list path;
     description = value_for_key connection_description_of_yojson "description" _list path;
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     id = value_for_key connection_id_of_yojson "id" _list path;
   }
    : connection)

let update_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection = option_of_yojson (value_for_key connection_of_yojson "connection") _list path }
    : update_connection_response)

let update_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clientToken")
         _list path;
     bandwidth =
       option_of_yojson (value_for_key connection_bandwidth_of_yojson "bandwidth") _list path;
     description =
       option_of_yojson (value_for_key connection_description_of_yojson "description") _list path;
     identifier = value_for_key connection_id_of_yojson "identifier" _list path;
   }
    : update_connection_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
   }
    : untag_resource_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : throttling_exception)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_map_of_yojson "tags" _list path;
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
   }
    : tag_resource_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : service_quota_exceeded_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : resource_not_found_exception)

let remote_owner_account_of_yojson = string_of_yojson

let remote_account_identifier_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "email" -> EMAIL
    | `String "account" -> ACCOUNT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RemoteAccountIdentifierType" value)
    | _ -> raise (deserialize_wrong_type_error path "RemoteAccountIdentifierType")
     : remote_account_identifier_type)
    : remote_account_identifier_type)

let remote_account_identifier_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "identifier" -> Identifier (remote_owner_account_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "RemoteAccountIdentifier" unknown)
    : remote_account_identifier)

let next_token_of_yojson = string_of_yojson
let max_results_of_yojson = int_of_yojson

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_map_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path }
    : list_tags_for_resource_request)

let environment_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "unavailable" -> UNAVAILABLE
    | `String "limited" -> LIMITED
    | `String "available" -> AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "EnvironmentState" value)
    | _ -> raise (deserialize_wrong_type_error path "EnvironmentState")
     : environment_state)
    : environment_state)

let bandwidth_list_of_yojson tree path = list_of_yojson connection_bandwidth_of_yojson tree path

let bandwidths_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     supported = option_of_yojson (value_for_key bandwidth_list_of_yojson "supported") _list path;
     available = option_of_yojson (value_for_key bandwidth_list_of_yojson "available") _list path;
   }
    : bandwidths)

let environment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remote_identifier_type =
       option_of_yojson
         (value_for_key remote_account_identifier_type_of_yojson "remoteIdentifierType")
         _list path;
     activation_page_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "activationPageUrl")
         _list path;
     type_ = value_for_key product_type_of_yojson "type" _list path;
     bandwidths = value_for_key bandwidths_of_yojson "bandwidths" _list path;
     state = value_for_key environment_state_of_yojson "state" _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     location = value_for_key location_of_yojson "location" _list path;
     provider = value_for_key provider_of_yojson "provider" _list path;
   }
    : environment)

let environment_list_of_yojson tree path = list_of_yojson environment_of_yojson tree path

let list_environments_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     environments = value_for_key environment_list_of_yojson "environments" _list path;
   }
    : list_environments_response)

let list_environments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location = option_of_yojson (value_for_key location_of_yojson "location") _list path;
     provider = option_of_yojson (value_for_key provider_of_yojson "provider") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_environments_request)

let connection_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_tier = option_of_yojson (value_for_key billing_tier_of_yojson "billingTier") _list path;
     shared_id = value_for_key connection_shared_id_of_yojson "sharedId" _list path;
     state = value_for_key connection_state_of_yojson "state" _list path;
     type_ = value_for_key product_type_of_yojson "type" _list path;
     location = value_for_key location_of_yojson "location" _list path;
     provider = value_for_key provider_of_yojson "provider" _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     attach_point = value_for_key attach_point_of_yojson "attachPoint" _list path;
     bandwidth = value_for_key connection_bandwidth_of_yojson "bandwidth" _list path;
     description = value_for_key connection_description_of_yojson "description" _list path;
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     id = value_for_key connection_id_of_yojson "id" _list path;
   }
    : connection_summary)

let connection_summaries_list_of_yojson tree path =
  list_of_yojson connection_summary_of_yojson tree path

let list_connections_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     connections =
       option_of_yojson (value_for_key connection_summaries_list_of_yojson "connections") _list path;
   }
    : list_connections_response)

let list_connections_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attach_point = option_of_yojson (value_for_key attach_point_of_yojson "attachPoint") _list path;
     provider = option_of_yojson (value_for_key provider_of_yojson "provider") _list path;
     environment_id =
       option_of_yojson (value_for_key environment_id_of_yojson "environmentId") _list path;
     state = option_of_yojson (value_for_key connection_state_of_yojson "state") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_connections_request)

let attach_point_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DirectConnectGateway" -> DirectConnectGateway
    | `String value -> raise (deserialize_unknown_enum_value_error path "AttachPointType" value)
    | _ -> raise (deserialize_wrong_type_error path "AttachPointType")
     : attach_point_type)
    : attach_point_type)

let attach_point_descriptor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "name" _list path;
     identifier =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "identifier" _list
         path;
     type_ = value_for_key attach_point_type_of_yojson "type" _list path;
   }
    : attach_point_descriptor)

let attach_point_descriptor_list_of_yojson tree path =
  list_of_yojson attach_point_descriptor_of_yojson tree path

let list_attach_points_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     attach_points = value_for_key attach_point_descriptor_list_of_yojson "attachPoints" _list path;
   }
    : list_attach_points_response)

let list_attach_points_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
   }
    : list_attach_points_request)

let interconnect_validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : interconnect_validation_exception)

let interconnect_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : interconnect_server_exception)

let interconnect_client_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : interconnect_client_exception)

let describe_connection_proposal_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location = value_for_key location_of_yojson "location" _list path;
     provider = value_for_key provider_of_yojson "provider" _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     bandwidth = value_for_key connection_bandwidth_of_yojson "bandwidth" _list path;
   }
    : describe_connection_proposal_response)

let describe_connection_proposal_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ activation_key = value_for_key activation_key_of_yojson "activationKey" _list path }
    : describe_connection_proposal_request)

let accept_connection_proposal_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection = option_of_yojson (value_for_key connection_of_yojson "connection") _list path }
    : accept_connection_proposal_response)

let accept_connection_proposal_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clientToken")
         _list path;
     tags = option_of_yojson (value_for_key tag_map_of_yojson "tags") _list path;
     description =
       option_of_yojson (value_for_key connection_description_of_yojson "description") _list path;
     activation_key = value_for_key activation_key_of_yojson "activationKey" _list path;
     attach_point = value_for_key attach_point_of_yojson "attachPoint" _list path;
   }
    : accept_connection_proposal_request)

let get_environment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ environment = value_for_key environment_of_yojson "environment" _list path }
    : get_environment_response)

let get_environment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key environment_id_of_yojson "id" _list path } : get_environment_request)

let get_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection = option_of_yojson (value_for_key connection_of_yojson "connection") _list path }
    : get_connection_response)

let get_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key connection_id_of_yojson "identifier" _list path }
    : get_connection_request)

let delete_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection = value_for_key connection_of_yojson "connection" _list path }
    : delete_connection_response)

let delete_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clientToken")
         _list path;
     identifier = value_for_key connection_id_of_yojson "identifier" _list path;
   }
    : delete_connection_request)

let create_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection = option_of_yojson (value_for_key connection_of_yojson "connection") _list path }
    : create_connection_response)

let create_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clientToken")
         _list path;
     tags = option_of_yojson (value_for_key tag_map_of_yojson "tags") _list path;
     remote_account =
       option_of_yojson
         (value_for_key remote_account_identifier_of_yojson "remoteAccount")
         _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     attach_point = value_for_key attach_point_of_yojson "attachPoint" _list path;
     bandwidth = value_for_key connection_bandwidth_of_yojson "bandwidth" _list path;
     description =
       option_of_yojson (value_for_key connection_description_of_yojson "description") _list path;
   }
    : create_connection_request)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : access_denied_exception)
