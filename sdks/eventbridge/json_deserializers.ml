open Smaws_Lib.Json.DeserializeHelpers
open Types

let string__of_yojson = string_of_yojson
let event_bus_name_of_yojson = string_of_yojson
let kms_key_identifier_of_yojson = string_of_yojson
let event_bus_description_of_yojson = string_of_yojson
let resource_arn_of_yojson = string_of_yojson

let dead_letter_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = option_of_yojson (value_for_key resource_arn_of_yojson "Arn") _list path }
    : dead_letter_config)

let update_event_bus_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dead_letter_config =
       option_of_yojson (value_for_key dead_letter_config_of_yojson "DeadLetterConfig") _list path;
     description =
       option_of_yojson (value_for_key event_bus_description_of_yojson "Description") _list path;
     kms_key_identifier =
       option_of_yojson (value_for_key kms_key_identifier_of_yojson "KmsKeyIdentifier") _list path;
     name = option_of_yojson (value_for_key event_bus_name_of_yojson "Name") _list path;
     arn = option_of_yojson (value_for_key string__of_yojson "Arn") _list path;
   }
    : update_event_bus_response)

let update_event_bus_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dead_letter_config =
       option_of_yojson (value_for_key dead_letter_config_of_yojson "DeadLetterConfig") _list path;
     description =
       option_of_yojson (value_for_key event_bus_description_of_yojson "Description") _list path;
     kms_key_identifier =
       option_of_yojson (value_for_key kms_key_identifier_of_yojson "KmsKeyIdentifier") _list path;
     name = option_of_yojson (value_for_key event_bus_name_of_yojson "Name") _list path;
   }
    : update_event_bus_request)

let error_message_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_not_found_exception)

let operation_disabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : operation_disabled_exception)

let internal_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : internal_exception)

let concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : concurrent_modification_exception)

let endpoint_name_of_yojson = string_of_yojson
let endpoint_arn_of_yojson = string_of_yojson
let health_check_of_yojson = string_of_yojson

let primary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ health_check = value_for_key health_check_of_yojson "HealthCheck" _list path } : primary)

let route_of_yojson = string_of_yojson

let secondary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ route = value_for_key route_of_yojson "Route" _list path } : secondary)

let failover_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secondary = value_for_key secondary_of_yojson "Secondary" _list path;
     primary = value_for_key primary_of_yojson "Primary" _list path;
   }
    : failover_config)

let routing_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ failover_config = value_for_key failover_config_of_yojson "FailoverConfig" _list path }
    : routing_config)

let replication_state_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReplicationState" value)
    | _ -> raise (deserialize_wrong_type_error path "ReplicationState")
     : replication_state)
    : replication_state)

let replication_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ state = option_of_yojson (value_for_key replication_state_of_yojson "State") _list path }
    : replication_config)

let non_partner_event_bus_arn_of_yojson = string_of_yojson

let endpoint_event_bus_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ event_bus_arn = value_for_key non_partner_event_bus_arn_of_yojson "EventBusArn" _list path }
    : endpoint_event_bus)

let endpoint_event_bus_list_of_yojson tree path =
  list_of_yojson endpoint_event_bus_of_yojson tree path

let iam_role_arn_of_yojson = string_of_yojson
let endpoint_id_of_yojson = string_of_yojson
let endpoint_url_of_yojson = string_of_yojson

let endpoint_state_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "DELETING" -> DELETING
    | `String "UPDATING" -> UPDATING
    | `String "CREATING" -> CREATING
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "EndpointState" value)
    | _ -> raise (deserialize_wrong_type_error path "EndpointState")
     : endpoint_state)
    : endpoint_state)

let update_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key endpoint_state_of_yojson "State") _list path;
     endpoint_url = option_of_yojson (value_for_key endpoint_url_of_yojson "EndpointUrl") _list path;
     endpoint_id = option_of_yojson (value_for_key endpoint_id_of_yojson "EndpointId") _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     event_buses =
       option_of_yojson (value_for_key endpoint_event_bus_list_of_yojson "EventBuses") _list path;
     replication_config =
       option_of_yojson (value_for_key replication_config_of_yojson "ReplicationConfig") _list path;
     routing_config =
       option_of_yojson (value_for_key routing_config_of_yojson "RoutingConfig") _list path;
     arn = option_of_yojson (value_for_key endpoint_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key endpoint_name_of_yojson "Name") _list path;
   }
    : update_endpoint_response)

let endpoint_description_of_yojson = string_of_yojson

let update_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     event_buses =
       option_of_yojson (value_for_key endpoint_event_bus_list_of_yojson "EventBuses") _list path;
     replication_config =
       option_of_yojson (value_for_key replication_config_of_yojson "ReplicationConfig") _list path;
     routing_config =
       option_of_yojson (value_for_key routing_config_of_yojson "RoutingConfig") _list path;
     description =
       option_of_yojson (value_for_key endpoint_description_of_yojson "Description") _list path;
     name = value_for_key endpoint_name_of_yojson "Name" _list path;
   }
    : update_endpoint_request)

let connection_arn_of_yojson = string_of_yojson

let connection_state_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "FAILED_CONNECTIVITY" -> FAILED_CONNECTIVITY
    | `String "ACTIVE" -> ACTIVE
    | `String "DEAUTHORIZING" -> DEAUTHORIZING
    | `String "AUTHORIZING" -> AUTHORIZING
    | `String "DEAUTHORIZED" -> DEAUTHORIZED
    | `String "AUTHORIZED" -> AUTHORIZED
    | `String "DELETING" -> DELETING
    | `String "UPDATING" -> UPDATING
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionState" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionState")
     : connection_state)
    : connection_state)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let update_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_authorized_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastAuthorizedTime") _list path;
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     connection_state =
       option_of_yojson (value_for_key connection_state_of_yojson "ConnectionState") _list path;
     connection_arn =
       option_of_yojson (value_for_key connection_arn_of_yojson "ConnectionArn") _list path;
   }
    : update_connection_response)

let connection_name_of_yojson = string_of_yojson
let connection_description_of_yojson = string_of_yojson

let connection_authorization_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "API_KEY" -> API_KEY
    | `String "OAUTH_CLIENT_CREDENTIALS" -> OAUTH_CLIENT_CREDENTIALS
    | `String "BASIC" -> BASIC
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConnectionAuthorizationType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionAuthorizationType")
     : connection_authorization_type)
    : connection_authorization_type)

let auth_header_parameters_of_yojson = string_of_yojson
let auth_header_parameters_sensitive_of_yojson = string_of_yojson

let update_connection_basic_auth_request_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     password =
       option_of_yojson
         (value_for_key auth_header_parameters_sensitive_of_yojson "Password")
         _list path;
     username =
       option_of_yojson (value_for_key auth_header_parameters_of_yojson "Username") _list path;
   }
    : update_connection_basic_auth_request_parameters)

let update_connection_o_auth_client_request_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_secret =
       option_of_yojson
         (value_for_key auth_header_parameters_sensitive_of_yojson "ClientSecret")
         _list path;
     client_i_d =
       option_of_yojson (value_for_key auth_header_parameters_of_yojson "ClientID") _list path;
   }
    : update_connection_o_auth_client_request_parameters)

let https_endpoint_of_yojson = string_of_yojson

let connection_o_auth_http_method_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "PUT" -> PUT
    | `String "POST" -> POST
    | `String "GET" -> GET
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConnectionOAuthHttpMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionOAuthHttpMethod")
     : connection_o_auth_http_method)
    : connection_o_auth_http_method)

let header_key_of_yojson = string_of_yojson
let header_value_sensitive_of_yojson = string_of_yojson
let boolean__of_yojson = bool_of_yojson

let connection_header_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_value_secret =
       option_of_yojson (value_for_key boolean__of_yojson "IsValueSecret") _list path;
     value = option_of_yojson (value_for_key header_value_sensitive_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key header_key_of_yojson "Key") _list path;
   }
    : connection_header_parameter)

let connection_header_parameters_list_of_yojson tree path =
  list_of_yojson connection_header_parameter_of_yojson tree path

let query_string_key_of_yojson = string_of_yojson
let query_string_value_sensitive_of_yojson = string_of_yojson

let connection_query_string_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_value_secret =
       option_of_yojson (value_for_key boolean__of_yojson "IsValueSecret") _list path;
     value =
       option_of_yojson (value_for_key query_string_value_sensitive_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key query_string_key_of_yojson "Key") _list path;
   }
    : connection_query_string_parameter)

let connection_query_string_parameters_list_of_yojson tree path =
  list_of_yojson connection_query_string_parameter_of_yojson tree path

let sensitive_string_of_yojson = string_of_yojson

let connection_body_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_value_secret =
       option_of_yojson (value_for_key boolean__of_yojson "IsValueSecret") _list path;
     value = option_of_yojson (value_for_key sensitive_string_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key string__of_yojson "Key") _list path;
   }
    : connection_body_parameter)

let connection_body_parameters_list_of_yojson tree path =
  list_of_yojson connection_body_parameter_of_yojson tree path

let connection_http_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     body_parameters =
       option_of_yojson
         (value_for_key connection_body_parameters_list_of_yojson "BodyParameters")
         _list path;
     query_string_parameters =
       option_of_yojson
         (value_for_key connection_query_string_parameters_list_of_yojson "QueryStringParameters")
         _list path;
     header_parameters =
       option_of_yojson
         (value_for_key connection_header_parameters_list_of_yojson "HeaderParameters")
         _list path;
   }
    : connection_http_parameters)

let update_connection_o_auth_request_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     o_auth_http_parameters =
       option_of_yojson
         (value_for_key connection_http_parameters_of_yojson "OAuthHttpParameters")
         _list path;
     http_method =
       option_of_yojson
         (value_for_key connection_o_auth_http_method_of_yojson "HttpMethod")
         _list path;
     authorization_endpoint =
       option_of_yojson (value_for_key https_endpoint_of_yojson "AuthorizationEndpoint") _list path;
     client_parameters =
       option_of_yojson
         (value_for_key update_connection_o_auth_client_request_parameters_of_yojson
            "ClientParameters")
         _list path;
   }
    : update_connection_o_auth_request_parameters)

let update_connection_api_key_auth_request_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     api_key_value =
       option_of_yojson
         (value_for_key auth_header_parameters_sensitive_of_yojson "ApiKeyValue")
         _list path;
     api_key_name =
       option_of_yojson (value_for_key auth_header_parameters_of_yojson "ApiKeyName") _list path;
   }
    : update_connection_api_key_auth_request_parameters)

let resource_configuration_arn_of_yojson = string_of_yojson

let connectivity_resource_configuration_arn_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_configuration_arn =
       value_for_key resource_configuration_arn_of_yojson "ResourceConfigurationArn" _list path;
   }
    : connectivity_resource_configuration_arn)

let connectivity_resource_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_parameters =
       value_for_key connectivity_resource_configuration_arn_of_yojson "ResourceParameters" _list
         path;
   }
    : connectivity_resource_parameters)

let update_connection_auth_request_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connectivity_parameters =
       option_of_yojson
         (value_for_key connectivity_resource_parameters_of_yojson "ConnectivityParameters")
         _list path;
     invocation_http_parameters =
       option_of_yojson
         (value_for_key connection_http_parameters_of_yojson "InvocationHttpParameters")
         _list path;
     api_key_auth_parameters =
       option_of_yojson
         (value_for_key update_connection_api_key_auth_request_parameters_of_yojson
            "ApiKeyAuthParameters")
         _list path;
     o_auth_parameters =
       option_of_yojson
         (value_for_key update_connection_o_auth_request_parameters_of_yojson "OAuthParameters")
         _list path;
     basic_auth_parameters =
       option_of_yojson
         (value_for_key update_connection_basic_auth_request_parameters_of_yojson
            "BasicAuthParameters")
         _list path;
   }
    : update_connection_auth_request_parameters)

let update_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_identifier =
       option_of_yojson (value_for_key kms_key_identifier_of_yojson "KmsKeyIdentifier") _list path;
     invocation_connectivity_parameters =
       option_of_yojson
         (value_for_key connectivity_resource_parameters_of_yojson
            "InvocationConnectivityParameters")
         _list path;
     auth_parameters =
       option_of_yojson
         (value_for_key update_connection_auth_request_parameters_of_yojson "AuthParameters")
         _list path;
     authorization_type =
       option_of_yojson
         (value_for_key connection_authorization_type_of_yojson "AuthorizationType")
         _list path;
     description =
       option_of_yojson (value_for_key connection_description_of_yojson "Description") _list path;
     name = value_for_key connection_name_of_yojson "Name" _list path;
   }
    : update_connection_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : throttling_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : access_denied_exception)

let archive_arn_of_yojson = string_of_yojson

let archive_state_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "UPDATING" -> UPDATING
    | `String "CREATING" -> CREATING
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ArchiveState" value)
    | _ -> raise (deserialize_wrong_type_error path "ArchiveState")
     : archive_state)
    : archive_state)

let archive_state_reason_of_yojson = string_of_yojson

let update_archive_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     state_reason =
       option_of_yojson (value_for_key archive_state_reason_of_yojson "StateReason") _list path;
     state = option_of_yojson (value_for_key archive_state_of_yojson "State") _list path;
     archive_arn = option_of_yojson (value_for_key archive_arn_of_yojson "ArchiveArn") _list path;
   }
    : update_archive_response)

let archive_name_of_yojson = string_of_yojson
let archive_description_of_yojson = string_of_yojson
let event_pattern_of_yojson = string_of_yojson
let retention_days_of_yojson = int_of_yojson

let update_archive_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_identifier =
       option_of_yojson (value_for_key kms_key_identifier_of_yojson "KmsKeyIdentifier") _list path;
     retention_days =
       option_of_yojson (value_for_key retention_days_of_yojson "RetentionDays") _list path;
     event_pattern =
       option_of_yojson (value_for_key event_pattern_of_yojson "EventPattern") _list path;
     description =
       option_of_yojson (value_for_key archive_description_of_yojson "Description") _list path;
     archive_name = value_for_key archive_name_of_yojson "ArchiveName" _list path;
   }
    : update_archive_request)

let invalid_event_pattern_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_event_pattern_exception)

let api_destination_arn_of_yojson = string_of_yojson

let api_destination_state_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "INACTIVE" -> INACTIVE
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ApiDestinationState" value)
    | _ -> raise (deserialize_wrong_type_error path "ApiDestinationState")
     : api_destination_state)
    : api_destination_state)

let update_api_destination_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     api_destination_state =
       option_of_yojson
         (value_for_key api_destination_state_of_yojson "ApiDestinationState")
         _list path;
     api_destination_arn =
       option_of_yojson (value_for_key api_destination_arn_of_yojson "ApiDestinationArn") _list path;
   }
    : update_api_destination_response)

let api_destination_name_of_yojson = string_of_yojson
let api_destination_description_of_yojson = string_of_yojson

let api_destination_http_method_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DELETE" -> DELETE
    | `String "PATCH" -> PATCH
    | `String "PUT" -> PUT
    | `String "OPTIONS" -> OPTIONS
    | `String "HEAD" -> HEAD
    | `String "GET" -> GET
    | `String "POST" -> POST
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ApiDestinationHttpMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "ApiDestinationHttpMethod")
     : api_destination_http_method)
    : api_destination_http_method)

let api_destination_invocation_rate_limit_per_second_of_yojson = int_of_yojson

let update_api_destination_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invocation_rate_limit_per_second =
       option_of_yojson
         (value_for_key api_destination_invocation_rate_limit_per_second_of_yojson
            "InvocationRateLimitPerSecond")
         _list path;
     http_method =
       option_of_yojson
         (value_for_key api_destination_http_method_of_yojson "HttpMethod")
         _list path;
     invocation_endpoint =
       option_of_yojson (value_for_key https_endpoint_of_yojson "InvocationEndpoint") _list path;
     connection_arn =
       option_of_yojson (value_for_key connection_arn_of_yojson "ConnectionArn") _list path;
     description =
       option_of_yojson
         (value_for_key api_destination_description_of_yojson "Description")
         _list path;
     name = value_for_key api_destination_name_of_yojson "Name" _list path;
   }
    : update_api_destination_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let arn_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_ar_n = value_for_key arn_of_yojson "ResourceARN" _list path;
   }
    : untag_resource_request)

let managed_rule_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : managed_rule_exception)

let target_input_path_of_yojson = string_of_yojson
let input_transformer_path_key_of_yojson = string_of_yojson

let transformer_paths_of_yojson tree path =
  map_of_yojson input_transformer_path_key_of_yojson target_input_path_of_yojson tree path

let transformer_input_of_yojson = string_of_yojson
let trace_header_of_yojson = string_of_yojson

let test_event_pattern_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ result = option_of_yojson (value_for_key boolean__of_yojson "Result") _list path }
    : test_event_pattern_response)

let test_event_pattern_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event = value_for_key string__of_yojson "Event" _list path;
     event_pattern = value_for_key event_pattern_of_yojson "EventPattern" _list path;
   }
    : test_event_pattern_request)

let target_partition_key_path_of_yojson = string_of_yojson
let target_id_of_yojson = string_of_yojson
let target_arn_of_yojson = string_of_yojson
let role_arn_of_yojson = string_of_yojson
let target_input_of_yojson = string_of_yojson

let input_transformer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_template = value_for_key transformer_input_of_yojson "InputTemplate" _list path;
     input_paths_map =
       option_of_yojson (value_for_key transformer_paths_of_yojson "InputPathsMap") _list path;
   }
    : input_transformer)

let kinesis_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partition_key_path =
       value_for_key target_partition_key_path_of_yojson "PartitionKeyPath" _list path;
   }
    : kinesis_parameters)

let run_command_target_key_of_yojson = string_of_yojson
let run_command_target_value_of_yojson = string_of_yojson

let run_command_target_values_of_yojson tree path =
  list_of_yojson run_command_target_value_of_yojson tree path

let run_command_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = value_for_key run_command_target_values_of_yojson "Values" _list path;
     key = value_for_key run_command_target_key_of_yojson "Key" _list path;
   }
    : run_command_target)

let run_command_targets_of_yojson tree path = list_of_yojson run_command_target_of_yojson tree path

let run_command_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run_command_targets =
       value_for_key run_command_targets_of_yojson "RunCommandTargets" _list path;
   }
    : run_command_parameters)

let limit_min1_of_yojson = int_of_yojson

let launch_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "EXTERNAL" -> EXTERNAL
    | `String "FARGATE" -> FARGATE
    | `String "EC2" -> EC2
    | `String value -> raise (deserialize_unknown_enum_value_error path "LaunchType" value)
    | _ -> raise (deserialize_wrong_type_error path "LaunchType")
     : launch_type)
    : launch_type)

let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let assign_public_ip_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssignPublicIp" value)
    | _ -> raise (deserialize_wrong_type_error path "AssignPublicIp")
     : assign_public_ip)
    : assign_public_ip)

let aws_vpc_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assign_public_ip =
       option_of_yojson (value_for_key assign_public_ip_of_yojson "AssignPublicIp") _list path;
     security_groups =
       option_of_yojson (value_for_key string_list_of_yojson "SecurityGroups") _list path;
     subnets = value_for_key string_list_of_yojson "Subnets" _list path;
   }
    : aws_vpc_configuration)

let network_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     awsvpc_configuration =
       option_of_yojson
         (value_for_key aws_vpc_configuration_of_yojson "awsvpcConfiguration")
         _list path;
   }
    : network_configuration)

let capacity_provider_of_yojson = string_of_yojson
let capacity_provider_strategy_item_weight_of_yojson = int_of_yojson
let capacity_provider_strategy_item_base_of_yojson = int_of_yojson

let capacity_provider_strategy_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     base =
       option_of_yojson
         (value_for_key capacity_provider_strategy_item_base_of_yojson "base")
         _list path;
     weight =
       option_of_yojson
         (value_for_key capacity_provider_strategy_item_weight_of_yojson "weight")
         _list path;
     capacity_provider = value_for_key capacity_provider_of_yojson "capacityProvider" _list path;
   }
    : capacity_provider_strategy_item)

let capacity_provider_strategy_of_yojson tree path =
  list_of_yojson capacity_provider_strategy_item_of_yojson tree path

let placement_constraint_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "memberOf" -> MEMBER_OF
    | `String "distinctInstance" -> DISTINCT_INSTANCE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PlacementConstraintType" value)
    | _ -> raise (deserialize_wrong_type_error path "PlacementConstraintType")
     : placement_constraint_type)
    : placement_constraint_type)

let placement_constraint_expression_of_yojson = string_of_yojson

let placement_constraint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expression =
       option_of_yojson
         (value_for_key placement_constraint_expression_of_yojson "expression")
         _list path;
     type_ = option_of_yojson (value_for_key placement_constraint_type_of_yojson "type") _list path;
   }
    : placement_constraint)

let placement_constraints_of_yojson tree path =
  list_of_yojson placement_constraint_of_yojson tree path

let placement_strategy_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "binpack" -> BINPACK
    | `String "spread" -> SPREAD
    | `String "random" -> RANDOM
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PlacementStrategyType" value)
    | _ -> raise (deserialize_wrong_type_error path "PlacementStrategyType")
     : placement_strategy_type)
    : placement_strategy_type)

let placement_strategy_field_of_yojson = string_of_yojson

let placement_strategy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field = option_of_yojson (value_for_key placement_strategy_field_of_yojson "field") _list path;
     type_ = option_of_yojson (value_for_key placement_strategy_type_of_yojson "type") _list path;
   }
    : placement_strategy)

let placement_strategies_of_yojson tree path = list_of_yojson placement_strategy_of_yojson tree path

let propagate_tags_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "TASK_DEFINITION" -> TASK_DEFINITION
    | `String value -> raise (deserialize_unknown_enum_value_error path "PropagateTags" value)
    | _ -> raise (deserialize_wrong_type_error path "PropagateTags")
     : propagate_tags)
    : propagate_tags)

let reference_id_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let ecs_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     reference_id = option_of_yojson (value_for_key reference_id_of_yojson "ReferenceId") _list path;
     propagate_tags =
       option_of_yojson (value_for_key propagate_tags_of_yojson "PropagateTags") _list path;
     placement_strategy =
       option_of_yojson
         (value_for_key placement_strategies_of_yojson "PlacementStrategy")
         _list path;
     placement_constraints =
       option_of_yojson
         (value_for_key placement_constraints_of_yojson "PlacementConstraints")
         _list path;
     enable_execute_command =
       option_of_yojson (value_for_key boolean__of_yojson "EnableExecuteCommand") _list path;
     enable_ecs_managed_tags =
       option_of_yojson (value_for_key boolean__of_yojson "EnableECSManagedTags") _list path;
     capacity_provider_strategy =
       option_of_yojson
         (value_for_key capacity_provider_strategy_of_yojson "CapacityProviderStrategy")
         _list path;
     group = option_of_yojson (value_for_key string__of_yojson "Group") _list path;
     platform_version =
       option_of_yojson (value_for_key string__of_yojson "PlatformVersion") _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "NetworkConfiguration")
         _list path;
     launch_type = option_of_yojson (value_for_key launch_type_of_yojson "LaunchType") _list path;
     task_count = option_of_yojson (value_for_key limit_min1_of_yojson "TaskCount") _list path;
     task_definition_arn = value_for_key arn_of_yojson "TaskDefinitionArn" _list path;
   }
    : ecs_parameters)

let integer_of_yojson = int_of_yojson

let batch_array_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ size = option_of_yojson (value_for_key integer_of_yojson "Size") _list path }
    : batch_array_properties)

let batch_retry_strategy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ attempts = option_of_yojson (value_for_key integer_of_yojson "Attempts") _list path }
    : batch_retry_strategy)

let batch_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_strategy =
       option_of_yojson (value_for_key batch_retry_strategy_of_yojson "RetryStrategy") _list path;
     array_properties =
       option_of_yojson
         (value_for_key batch_array_properties_of_yojson "ArrayProperties")
         _list path;
     job_name = value_for_key string__of_yojson "JobName" _list path;
     job_definition = value_for_key string__of_yojson "JobDefinition" _list path;
   }
    : batch_parameters)

let message_group_id_of_yojson = string_of_yojson

let sqs_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message_group_id =
       option_of_yojson (value_for_key message_group_id_of_yojson "MessageGroupId") _list path;
   }
    : sqs_parameters)

let path_parameter_of_yojson = string_of_yojson
let path_parameter_list_of_yojson tree path = list_of_yojson path_parameter_of_yojson tree path
let header_value_of_yojson = string_of_yojson

let header_parameters_map_of_yojson tree path =
  map_of_yojson header_key_of_yojson header_value_of_yojson tree path

let query_string_value_of_yojson = string_of_yojson

let query_string_parameters_map_of_yojson tree path =
  map_of_yojson query_string_key_of_yojson query_string_value_of_yojson tree path

let http_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_string_parameters =
       option_of_yojson
         (value_for_key query_string_parameters_map_of_yojson "QueryStringParameters")
         _list path;
     header_parameters =
       option_of_yojson
         (value_for_key header_parameters_map_of_yojson "HeaderParameters")
         _list path;
     path_parameter_values =
       option_of_yojson
         (value_for_key path_parameter_list_of_yojson "PathParameterValues")
         _list path;
   }
    : http_parameters)

let redshift_secret_manager_arn_of_yojson = string_of_yojson
let database_of_yojson = string_of_yojson
let db_user_of_yojson = string_of_yojson
let sql_of_yojson = string_of_yojson
let statement_name_of_yojson = string_of_yojson
let sqls_of_yojson tree path = list_of_yojson sql_of_yojson tree path

let redshift_data_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sqls = option_of_yojson (value_for_key sqls_of_yojson "Sqls") _list path;
     with_event = option_of_yojson (value_for_key boolean__of_yojson "WithEvent") _list path;
     statement_name =
       option_of_yojson (value_for_key statement_name_of_yojson "StatementName") _list path;
     sql = option_of_yojson (value_for_key sql_of_yojson "Sql") _list path;
     db_user = option_of_yojson (value_for_key db_user_of_yojson "DbUser") _list path;
     database = value_for_key database_of_yojson "Database" _list path;
     secret_manager_arn =
       option_of_yojson
         (value_for_key redshift_secret_manager_arn_of_yojson "SecretManagerArn")
         _list path;
   }
    : redshift_data_parameters)

let sage_maker_pipeline_parameter_name_of_yojson = string_of_yojson
let sage_maker_pipeline_parameter_value_of_yojson = string_of_yojson

let sage_maker_pipeline_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key sage_maker_pipeline_parameter_value_of_yojson "Value" _list path;
     name = value_for_key sage_maker_pipeline_parameter_name_of_yojson "Name" _list path;
   }
    : sage_maker_pipeline_parameter)

let sage_maker_pipeline_parameter_list_of_yojson tree path =
  list_of_yojson sage_maker_pipeline_parameter_of_yojson tree path

let sage_maker_pipeline_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_parameter_list =
       option_of_yojson
         (value_for_key sage_maker_pipeline_parameter_list_of_yojson "PipelineParameterList")
         _list path;
   }
    : sage_maker_pipeline_parameters)

let maximum_retry_attempts_of_yojson = int_of_yojson
let maximum_event_age_in_seconds_of_yojson = int_of_yojson

let retry_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     maximum_event_age_in_seconds =
       option_of_yojson
         (value_for_key maximum_event_age_in_seconds_of_yojson "MaximumEventAgeInSeconds")
         _list path;
     maximum_retry_attempts =
       option_of_yojson
         (value_for_key maximum_retry_attempts_of_yojson "MaximumRetryAttempts")
         _list path;
   }
    : retry_policy)

let graph_ql_operation_of_yojson = string_of_yojson

let app_sync_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     graph_ql_operation =
       option_of_yojson (value_for_key graph_ql_operation_of_yojson "GraphQLOperation") _list path;
   }
    : app_sync_parameters)

let target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     app_sync_parameters =
       option_of_yojson (value_for_key app_sync_parameters_of_yojson "AppSyncParameters") _list path;
     retry_policy = option_of_yojson (value_for_key retry_policy_of_yojson "RetryPolicy") _list path;
     dead_letter_config =
       option_of_yojson (value_for_key dead_letter_config_of_yojson "DeadLetterConfig") _list path;
     sage_maker_pipeline_parameters =
       option_of_yojson
         (value_for_key sage_maker_pipeline_parameters_of_yojson "SageMakerPipelineParameters")
         _list path;
     redshift_data_parameters =
       option_of_yojson
         (value_for_key redshift_data_parameters_of_yojson "RedshiftDataParameters")
         _list path;
     http_parameters =
       option_of_yojson (value_for_key http_parameters_of_yojson "HttpParameters") _list path;
     sqs_parameters =
       option_of_yojson (value_for_key sqs_parameters_of_yojson "SqsParameters") _list path;
     batch_parameters =
       option_of_yojson (value_for_key batch_parameters_of_yojson "BatchParameters") _list path;
     ecs_parameters =
       option_of_yojson (value_for_key ecs_parameters_of_yojson "EcsParameters") _list path;
     run_command_parameters =
       option_of_yojson
         (value_for_key run_command_parameters_of_yojson "RunCommandParameters")
         _list path;
     kinesis_parameters =
       option_of_yojson (value_for_key kinesis_parameters_of_yojson "KinesisParameters") _list path;
     input_transformer =
       option_of_yojson (value_for_key input_transformer_of_yojson "InputTransformer") _list path;
     input_path =
       option_of_yojson (value_for_key target_input_path_of_yojson "InputPath") _list path;
     input = option_of_yojson (value_for_key target_input_of_yojson "Input") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list path;
     arn = value_for_key target_arn_of_yojson "Arn" _list path;
     id = value_for_key target_id_of_yojson "Id" _list path;
   }
    : target)

let target_list_of_yojson tree path = list_of_yojson target_of_yojson tree path
let target_id_list_of_yojson tree path = list_of_yojson target_id_of_yojson tree path

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_ar_n = value_for_key arn_of_yojson "ResourceARN" _list path;
   }
    : tag_resource_request)

let statement_id_of_yojson = string_of_yojson
let replay_arn_of_yojson = string_of_yojson

let replay_state_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "FAILED" -> FAILED
    | `String "CANCELLED" -> CANCELLED
    | `String "COMPLETED" -> COMPLETED
    | `String "CANCELLING" -> CANCELLING
    | `String "RUNNING" -> RUNNING
    | `String "STARTING" -> STARTING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReplayState" value)
    | _ -> raise (deserialize_wrong_type_error path "ReplayState")
     : replay_state)
    : replay_state)

let replay_state_reason_of_yojson = string_of_yojson

let start_replay_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replay_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ReplayStartTime") _list path;
     state_reason =
       option_of_yojson (value_for_key replay_state_reason_of_yojson "StateReason") _list path;
     state = option_of_yojson (value_for_key replay_state_of_yojson "State") _list path;
     replay_arn = option_of_yojson (value_for_key replay_arn_of_yojson "ReplayArn") _list path;
   }
    : start_replay_response)

let replay_name_of_yojson = string_of_yojson
let replay_description_of_yojson = string_of_yojson
let replay_destination_filters_of_yojson tree path = list_of_yojson arn_of_yojson tree path

let replay_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter_arns =
       option_of_yojson (value_for_key replay_destination_filters_of_yojson "FilterArns") _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : replay_destination)

let start_replay_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination = value_for_key replay_destination_of_yojson "Destination" _list path;
     event_end_time = value_for_key timestamp_of_yojson "EventEndTime" _list path;
     event_start_time = value_for_key timestamp_of_yojson "EventStartTime" _list path;
     event_source_arn = value_for_key archive_arn_of_yojson "EventSourceArn" _list path;
     description =
       option_of_yojson (value_for_key replay_description_of_yojson "Description") _list path;
     replay_name = value_for_key replay_name_of_yojson "ReplayName" _list path;
   }
    : start_replay_request)

let resource_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_already_exists_exception)

let secrets_manager_secret_arn_of_yojson = string_of_yojson
let schedule_expression_of_yojson = string_of_yojson

let rule_state_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS" ->
        ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleState" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleState")
     : rule_state)
    : rule_state)

let rule_name_of_yojson = string_of_yojson
let rule_arn_of_yojson = string_of_yojson
let rule_description_of_yojson = string_of_yojson
let managed_by_of_yojson = string_of_yojson

let rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_bus_name =
       option_of_yojson (value_for_key event_bus_name_of_yojson "EventBusName") _list path;
     managed_by = option_of_yojson (value_for_key managed_by_of_yojson "ManagedBy") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list path;
     schedule_expression =
       option_of_yojson
         (value_for_key schedule_expression_of_yojson "ScheduleExpression")
         _list path;
     description =
       option_of_yojson (value_for_key rule_description_of_yojson "Description") _list path;
     state = option_of_yojson (value_for_key rule_state_of_yojson "State") _list path;
     event_pattern =
       option_of_yojson (value_for_key event_pattern_of_yojson "EventPattern") _list path;
     arn = option_of_yojson (value_for_key rule_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key rule_name_of_yojson "Name") _list path;
   }
    : rule)

let rule_response_list_of_yojson tree path = list_of_yojson rule_of_yojson tree path
let rule_name_list_of_yojson tree path = list_of_yojson rule_name_of_yojson tree path
let resource_association_arn_of_yojson = string_of_yojson

let replay_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replay_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ReplayEndTime") _list path;
     replay_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ReplayStartTime") _list path;
     event_last_replayed_time =
       option_of_yojson (value_for_key timestamp_of_yojson "EventLastReplayedTime") _list path;
     event_end_time = option_of_yojson (value_for_key timestamp_of_yojson "EventEndTime") _list path;
     event_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "EventStartTime") _list path;
     state_reason =
       option_of_yojson (value_for_key replay_state_reason_of_yojson "StateReason") _list path;
     state = option_of_yojson (value_for_key replay_state_of_yojson "State") _list path;
     event_source_arn =
       option_of_yojson (value_for_key archive_arn_of_yojson "EventSourceArn") _list path;
     replay_name = option_of_yojson (value_for_key replay_name_of_yojson "ReplayName") _list path;
   }
    : replay)

let replay_list_of_yojson tree path = list_of_yojson replay_of_yojson tree path
let error_code_of_yojson = string_of_yojson

let remove_targets_result_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     target_id = option_of_yojson (value_for_key target_id_of_yojson "TargetId") _list path;
   }
    : remove_targets_result_entry)

let remove_targets_result_entry_list_of_yojson tree path =
  list_of_yojson remove_targets_result_entry_of_yojson tree path

let remove_targets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_entries =
       option_of_yojson
         (value_for_key remove_targets_result_entry_list_of_yojson "FailedEntries")
         _list path;
     failed_entry_count =
       option_of_yojson (value_for_key integer_of_yojson "FailedEntryCount") _list path;
   }
    : remove_targets_response)

let event_bus_name_or_arn_of_yojson = string_of_yojson

let remove_targets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     force = option_of_yojson (value_for_key boolean__of_yojson "Force") _list path;
     ids = value_for_key target_id_list_of_yojson "Ids" _list path;
     event_bus_name =
       option_of_yojson (value_for_key event_bus_name_or_arn_of_yojson "EventBusName") _list path;
     rule = value_for_key rule_name_of_yojson "Rule" _list path;
   }
    : remove_targets_request)

let non_partner_event_bus_name_of_yojson = string_of_yojson

let remove_permission_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_bus_name =
       option_of_yojson
         (value_for_key non_partner_event_bus_name_of_yojson "EventBusName")
         _list path;
     remove_all_permissions =
       option_of_yojson (value_for_key boolean__of_yojson "RemoveAllPermissions") _list path;
     statement_id = option_of_yojson (value_for_key statement_id_of_yojson "StatementId") _list path;
   }
    : remove_permission_request)

let put_targets_result_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     target_id = option_of_yojson (value_for_key target_id_of_yojson "TargetId") _list path;
   }
    : put_targets_result_entry)

let put_targets_result_entry_list_of_yojson tree path =
  list_of_yojson put_targets_result_entry_of_yojson tree path

let put_targets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_entries =
       option_of_yojson
         (value_for_key put_targets_result_entry_list_of_yojson "FailedEntries")
         _list path;
     failed_entry_count =
       option_of_yojson (value_for_key integer_of_yojson "FailedEntryCount") _list path;
   }
    : put_targets_response)

let put_targets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     targets = value_for_key target_list_of_yojson "Targets" _list path;
     event_bus_name =
       option_of_yojson (value_for_key event_bus_name_or_arn_of_yojson "EventBusName") _list path;
     rule = value_for_key rule_name_of_yojson "Rule" _list path;
   }
    : put_targets_request)

let put_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule_arn = option_of_yojson (value_for_key rule_arn_of_yojson "RuleArn") _list path }
    : put_rule_response)

let put_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_bus_name =
       option_of_yojson (value_for_key event_bus_name_or_arn_of_yojson "EventBusName") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list path;
     description =
       option_of_yojson (value_for_key rule_description_of_yojson "Description") _list path;
     state = option_of_yojson (value_for_key rule_state_of_yojson "State") _list path;
     event_pattern =
       option_of_yojson (value_for_key event_pattern_of_yojson "EventPattern") _list path;
     schedule_expression =
       option_of_yojson
         (value_for_key schedule_expression_of_yojson "ScheduleExpression")
         _list path;
     name = value_for_key rule_name_of_yojson "Name" _list path;
   }
    : put_rule_request)

let action_of_yojson = string_of_yojson
let principal_of_yojson = string_of_yojson

let condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key string__of_yojson "Value" _list path;
     key = value_for_key string__of_yojson "Key" _list path;
     type_ = value_for_key string__of_yojson "Type" _list path;
   }
    : condition)

let put_permission_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy = option_of_yojson (value_for_key string__of_yojson "Policy") _list path;
     condition = option_of_yojson (value_for_key condition_of_yojson "Condition") _list path;
     statement_id = option_of_yojson (value_for_key statement_id_of_yojson "StatementId") _list path;
     principal = option_of_yojson (value_for_key principal_of_yojson "Principal") _list path;
     action = option_of_yojson (value_for_key action_of_yojson "Action") _list path;
     event_bus_name =
       option_of_yojson
         (value_for_key non_partner_event_bus_name_of_yojson "EventBusName")
         _list path;
   }
    : put_permission_request)

let policy_length_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : policy_length_exceeded_exception)

let event_id_of_yojson = string_of_yojson

let put_partner_events_result_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     event_id = option_of_yojson (value_for_key event_id_of_yojson "EventId") _list path;
   }
    : put_partner_events_result_entry)

let put_partner_events_result_entry_list_of_yojson tree path =
  list_of_yojson put_partner_events_result_entry_of_yojson tree path

let put_partner_events_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entries =
       option_of_yojson
         (value_for_key put_partner_events_result_entry_list_of_yojson "Entries")
         _list path;
     failed_entry_count =
       option_of_yojson (value_for_key integer_of_yojson "FailedEntryCount") _list path;
   }
    : put_partner_events_response)

let event_time_of_yojson = timestamp_epoch_seconds_of_yojson
let event_source_name_of_yojson = string_of_yojson
let event_resource_of_yojson = string_of_yojson
let event_resource_list_of_yojson tree path = list_of_yojson event_resource_of_yojson tree path

let put_partner_events_request_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     detail = option_of_yojson (value_for_key string__of_yojson "Detail") _list path;
     detail_type = option_of_yojson (value_for_key string__of_yojson "DetailType") _list path;
     resources =
       option_of_yojson (value_for_key event_resource_list_of_yojson "Resources") _list path;
     source = option_of_yojson (value_for_key event_source_name_of_yojson "Source") _list path;
     time = option_of_yojson (value_for_key event_time_of_yojson "Time") _list path;
   }
    : put_partner_events_request_entry)

let put_partner_events_request_entry_list_of_yojson tree path =
  list_of_yojson put_partner_events_request_entry_of_yojson tree path

let put_partner_events_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ entries = value_for_key put_partner_events_request_entry_list_of_yojson "Entries" _list path }
    : put_partner_events_request)

let put_events_result_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     event_id = option_of_yojson (value_for_key event_id_of_yojson "EventId") _list path;
   }
    : put_events_result_entry)

let put_events_result_entry_list_of_yojson tree path =
  list_of_yojson put_events_result_entry_of_yojson tree path

let put_events_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entries =
       option_of_yojson (value_for_key put_events_result_entry_list_of_yojson "Entries") _list path;
     failed_entry_count =
       option_of_yojson (value_for_key integer_of_yojson "FailedEntryCount") _list path;
   }
    : put_events_response)

let non_partner_event_bus_name_or_arn_of_yojson = string_of_yojson

let put_events_request_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trace_header = option_of_yojson (value_for_key trace_header_of_yojson "TraceHeader") _list path;
     event_bus_name =
       option_of_yojson
         (value_for_key non_partner_event_bus_name_or_arn_of_yojson "EventBusName")
         _list path;
     detail = option_of_yojson (value_for_key string__of_yojson "Detail") _list path;
     detail_type = option_of_yojson (value_for_key string__of_yojson "DetailType") _list path;
     resources =
       option_of_yojson (value_for_key event_resource_list_of_yojson "Resources") _list path;
     source = option_of_yojson (value_for_key string__of_yojson "Source") _list path;
     time = option_of_yojson (value_for_key event_time_of_yojson "Time") _list path;
   }
    : put_events_request_entry)

let put_events_request_entry_list_of_yojson tree path =
  list_of_yojson put_events_request_entry_of_yojson tree path

let put_events_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_id = option_of_yojson (value_for_key endpoint_id_of_yojson "EndpointId") _list path;
     entries = value_for_key put_events_request_entry_list_of_yojson "Entries" _list path;
   }
    : put_events_request)

let partner_event_source_name_prefix_of_yojson = string_of_yojson

let partner_event_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     arn = option_of_yojson (value_for_key string__of_yojson "Arn") _list path;
   }
    : partner_event_source)

let partner_event_source_list_of_yojson tree path =
  list_of_yojson partner_event_source_of_yojson tree path

let account_id_of_yojson = string_of_yojson

let event_source_state_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DELETED" -> DELETED
    | `String "ACTIVE" -> ACTIVE
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventSourceState" value)
    | _ -> raise (deserialize_wrong_type_error path "EventSourceState")
     : event_source_state)
    : event_source_state)

let partner_event_source_account_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key event_source_state_of_yojson "State") _list path;
     expiration_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ExpirationTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     account = option_of_yojson (value_for_key account_id_of_yojson "Account") _list path;
   }
    : partner_event_source_account)

let partner_event_source_account_list_of_yojson tree path =
  list_of_yojson partner_event_source_account_of_yojson tree path

let next_token_of_yojson = string_of_yojson
let long_of_yojson = long_of_yojson

let list_targets_by_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     targets = option_of_yojson (value_for_key target_list_of_yojson "Targets") _list path;
   }
    : list_targets_by_rule_response)

let limit_max100_of_yojson = int_of_yojson

let list_targets_by_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key limit_max100_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     event_bus_name =
       option_of_yojson (value_for_key event_bus_name_or_arn_of_yojson "EventBusName") _list path;
     rule = value_for_key rule_name_of_yojson "Rule" _list path;
   }
    : list_targets_by_rule_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key arn_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let list_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     rules = option_of_yojson (value_for_key rule_response_list_of_yojson "Rules") _list path;
   }
    : list_rules_response)

let list_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key limit_max100_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     event_bus_name =
       option_of_yojson (value_for_key event_bus_name_or_arn_of_yojson "EventBusName") _list path;
     name_prefix = option_of_yojson (value_for_key rule_name_of_yojson "NamePrefix") _list path;
   }
    : list_rules_request)

let list_rule_names_by_target_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     rule_names = option_of_yojson (value_for_key rule_name_list_of_yojson "RuleNames") _list path;
   }
    : list_rule_names_by_target_response)

let list_rule_names_by_target_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key limit_max100_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     event_bus_name =
       option_of_yojson (value_for_key event_bus_name_or_arn_of_yojson "EventBusName") _list path;
     target_arn = value_for_key target_arn_of_yojson "TargetArn" _list path;
   }
    : list_rule_names_by_target_request)

let list_replays_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     replays = option_of_yojson (value_for_key replay_list_of_yojson "Replays") _list path;
   }
    : list_replays_response)

let list_replays_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key limit_max100_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     event_source_arn =
       option_of_yojson (value_for_key archive_arn_of_yojson "EventSourceArn") _list path;
     state = option_of_yojson (value_for_key replay_state_of_yojson "State") _list path;
     name_prefix = option_of_yojson (value_for_key replay_name_of_yojson "NamePrefix") _list path;
   }
    : list_replays_request)

let list_partner_event_sources_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     partner_event_sources =
       option_of_yojson
         (value_for_key partner_event_source_list_of_yojson "PartnerEventSources")
         _list path;
   }
    : list_partner_event_sources_response)

let list_partner_event_sources_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key limit_max100_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     name_prefix = value_for_key partner_event_source_name_prefix_of_yojson "NamePrefix" _list path;
   }
    : list_partner_event_sources_request)

let list_partner_event_source_accounts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     partner_event_source_accounts =
       option_of_yojson
         (value_for_key partner_event_source_account_list_of_yojson "PartnerEventSourceAccounts")
         _list path;
   }
    : list_partner_event_source_accounts_response)

let list_partner_event_source_accounts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key limit_max100_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     event_source_name = value_for_key event_source_name_of_yojson "EventSourceName" _list path;
   }
    : list_partner_event_source_accounts_request)

let event_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key event_source_state_of_yojson "State") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     expiration_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ExpirationTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     created_by = option_of_yojson (value_for_key string__of_yojson "CreatedBy") _list path;
     arn = option_of_yojson (value_for_key string__of_yojson "Arn") _list path;
   }
    : event_source)

let event_source_list_of_yojson tree path = list_of_yojson event_source_of_yojson tree path

let list_event_sources_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     event_sources =
       option_of_yojson (value_for_key event_source_list_of_yojson "EventSources") _list path;
   }
    : list_event_sources_response)

let event_source_name_prefix_of_yojson = string_of_yojson

let list_event_sources_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key limit_max100_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     name_prefix =
       option_of_yojson (value_for_key event_source_name_prefix_of_yojson "NamePrefix") _list path;
   }
    : list_event_sources_request)

let event_bus_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     policy = option_of_yojson (value_for_key string__of_yojson "Policy") _list path;
     description =
       option_of_yojson (value_for_key event_bus_description_of_yojson "Description") _list path;
     arn = option_of_yojson (value_for_key string__of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : event_bus)

let event_bus_list_of_yojson tree path = list_of_yojson event_bus_of_yojson tree path

let list_event_buses_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     event_buses = option_of_yojson (value_for_key event_bus_list_of_yojson "EventBuses") _list path;
   }
    : list_event_buses_response)

let list_event_buses_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key limit_max100_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     name_prefix = option_of_yojson (value_for_key event_bus_name_of_yojson "NamePrefix") _list path;
   }
    : list_event_buses_request)

let endpoint_state_reason_of_yojson = string_of_yojson

let endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     state_reason =
       option_of_yojson (value_for_key endpoint_state_reason_of_yojson "StateReason") _list path;
     state = option_of_yojson (value_for_key endpoint_state_of_yojson "State") _list path;
     endpoint_url = option_of_yojson (value_for_key endpoint_url_of_yojson "EndpointUrl") _list path;
     endpoint_id = option_of_yojson (value_for_key endpoint_id_of_yojson "EndpointId") _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     event_buses =
       option_of_yojson (value_for_key endpoint_event_bus_list_of_yojson "EventBuses") _list path;
     replication_config =
       option_of_yojson (value_for_key replication_config_of_yojson "ReplicationConfig") _list path;
     routing_config =
       option_of_yojson (value_for_key routing_config_of_yojson "RoutingConfig") _list path;
     arn = option_of_yojson (value_for_key endpoint_arn_of_yojson "Arn") _list path;
     description =
       option_of_yojson (value_for_key endpoint_description_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key endpoint_name_of_yojson "Name") _list path;
   }
    : endpoint)

let endpoint_list_of_yojson tree path = list_of_yojson endpoint_of_yojson tree path

let list_endpoints_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     endpoints = option_of_yojson (value_for_key endpoint_list_of_yojson "Endpoints") _list path;
   }
    : list_endpoints_response)

let home_region_of_yojson = string_of_yojson

let list_endpoints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key limit_max100_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     home_region = option_of_yojson (value_for_key home_region_of_yojson "HomeRegion") _list path;
     name_prefix = option_of_yojson (value_for_key endpoint_name_of_yojson "NamePrefix") _list path;
   }
    : list_endpoints_request)

let connection_state_reason_of_yojson = string_of_yojson

let connection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_authorized_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastAuthorizedTime") _list path;
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     authorization_type =
       option_of_yojson
         (value_for_key connection_authorization_type_of_yojson "AuthorizationType")
         _list path;
     state_reason =
       option_of_yojson (value_for_key connection_state_reason_of_yojson "StateReason") _list path;
     connection_state =
       option_of_yojson (value_for_key connection_state_of_yojson "ConnectionState") _list path;
     name = option_of_yojson (value_for_key connection_name_of_yojson "Name") _list path;
     connection_arn =
       option_of_yojson (value_for_key connection_arn_of_yojson "ConnectionArn") _list path;
   }
    : connection)

let connection_response_list_of_yojson tree path = list_of_yojson connection_of_yojson tree path

let list_connections_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     connections =
       option_of_yojson (value_for_key connection_response_list_of_yojson "Connections") _list path;
   }
    : list_connections_response)

let list_connections_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key limit_max100_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     connection_state =
       option_of_yojson (value_for_key connection_state_of_yojson "ConnectionState") _list path;
     name_prefix =
       option_of_yojson (value_for_key connection_name_of_yojson "NamePrefix") _list path;
   }
    : list_connections_request)

let event_bus_arn_of_yojson = string_of_yojson

let archive_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     event_count = option_of_yojson (value_for_key long_of_yojson "EventCount") _list path;
     size_bytes = option_of_yojson (value_for_key long_of_yojson "SizeBytes") _list path;
     retention_days =
       option_of_yojson (value_for_key retention_days_of_yojson "RetentionDays") _list path;
     state_reason =
       option_of_yojson (value_for_key archive_state_reason_of_yojson "StateReason") _list path;
     state = option_of_yojson (value_for_key archive_state_of_yojson "State") _list path;
     event_source_arn =
       option_of_yojson (value_for_key event_bus_arn_of_yojson "EventSourceArn") _list path;
     archive_name = option_of_yojson (value_for_key archive_name_of_yojson "ArchiveName") _list path;
   }
    : archive)

let archive_response_list_of_yojson tree path = list_of_yojson archive_of_yojson tree path

let list_archives_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     archives =
       option_of_yojson (value_for_key archive_response_list_of_yojson "Archives") _list path;
   }
    : list_archives_response)

let list_archives_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key limit_max100_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     state = option_of_yojson (value_for_key archive_state_of_yojson "State") _list path;
     event_source_arn =
       option_of_yojson (value_for_key event_bus_arn_of_yojson "EventSourceArn") _list path;
     name_prefix = option_of_yojson (value_for_key archive_name_of_yojson "NamePrefix") _list path;
   }
    : list_archives_request)

let api_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     invocation_rate_limit_per_second =
       option_of_yojson
         (value_for_key api_destination_invocation_rate_limit_per_second_of_yojson
            "InvocationRateLimitPerSecond")
         _list path;
     http_method =
       option_of_yojson
         (value_for_key api_destination_http_method_of_yojson "HttpMethod")
         _list path;
     invocation_endpoint =
       option_of_yojson (value_for_key https_endpoint_of_yojson "InvocationEndpoint") _list path;
     connection_arn =
       option_of_yojson (value_for_key connection_arn_of_yojson "ConnectionArn") _list path;
     api_destination_state =
       option_of_yojson
         (value_for_key api_destination_state_of_yojson "ApiDestinationState")
         _list path;
     name = option_of_yojson (value_for_key api_destination_name_of_yojson "Name") _list path;
     api_destination_arn =
       option_of_yojson (value_for_key api_destination_arn_of_yojson "ApiDestinationArn") _list path;
   }
    : api_destination)

let api_destination_response_list_of_yojson tree path =
  list_of_yojson api_destination_of_yojson tree path

let list_api_destinations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     api_destinations =
       option_of_yojson
         (value_for_key api_destination_response_list_of_yojson "ApiDestinations")
         _list path;
   }
    : list_api_destinations_response)

let list_api_destinations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key limit_max100_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     connection_arn =
       option_of_yojson (value_for_key connection_arn_of_yojson "ConnectionArn") _list path;
     name_prefix =
       option_of_yojson (value_for_key api_destination_name_of_yojson "NamePrefix") _list path;
   }
    : list_api_destinations_request)

let invalid_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_state_exception)

let illegal_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : illegal_status_exception)

let enable_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_bus_name =
       option_of_yojson (value_for_key event_bus_name_or_arn_of_yojson "EventBusName") _list path;
     name = value_for_key rule_name_of_yojson "Name" _list path;
   }
    : enable_rule_request)

let disable_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_bus_name =
       option_of_yojson (value_for_key event_bus_name_or_arn_of_yojson "EventBusName") _list path;
     name = value_for_key rule_name_of_yojson "Name" _list path;
   }
    : disable_rule_request)

let created_by_of_yojson = string_of_yojson

let describe_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_by = option_of_yojson (value_for_key created_by_of_yojson "CreatedBy") _list path;
     event_bus_name =
       option_of_yojson (value_for_key event_bus_name_of_yojson "EventBusName") _list path;
     managed_by = option_of_yojson (value_for_key managed_by_of_yojson "ManagedBy") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list path;
     description =
       option_of_yojson (value_for_key rule_description_of_yojson "Description") _list path;
     state = option_of_yojson (value_for_key rule_state_of_yojson "State") _list path;
     schedule_expression =
       option_of_yojson
         (value_for_key schedule_expression_of_yojson "ScheduleExpression")
         _list path;
     event_pattern =
       option_of_yojson (value_for_key event_pattern_of_yojson "EventPattern") _list path;
     arn = option_of_yojson (value_for_key rule_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key rule_name_of_yojson "Name") _list path;
   }
    : describe_rule_response)

let describe_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_bus_name =
       option_of_yojson (value_for_key event_bus_name_or_arn_of_yojson "EventBusName") _list path;
     name = value_for_key rule_name_of_yojson "Name" _list path;
   }
    : describe_rule_request)

let describe_replay_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replay_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ReplayEndTime") _list path;
     replay_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ReplayStartTime") _list path;
     event_last_replayed_time =
       option_of_yojson (value_for_key timestamp_of_yojson "EventLastReplayedTime") _list path;
     event_end_time = option_of_yojson (value_for_key timestamp_of_yojson "EventEndTime") _list path;
     event_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "EventStartTime") _list path;
     destination =
       option_of_yojson (value_for_key replay_destination_of_yojson "Destination") _list path;
     event_source_arn =
       option_of_yojson (value_for_key archive_arn_of_yojson "EventSourceArn") _list path;
     state_reason =
       option_of_yojson (value_for_key replay_state_reason_of_yojson "StateReason") _list path;
     state = option_of_yojson (value_for_key replay_state_of_yojson "State") _list path;
     description =
       option_of_yojson (value_for_key replay_description_of_yojson "Description") _list path;
     replay_arn = option_of_yojson (value_for_key replay_arn_of_yojson "ReplayArn") _list path;
     replay_name = option_of_yojson (value_for_key replay_name_of_yojson "ReplayName") _list path;
   }
    : describe_replay_response)

let describe_replay_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ replay_name = value_for_key replay_name_of_yojson "ReplayName" _list path }
    : describe_replay_request)

let describe_partner_event_source_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     arn = option_of_yojson (value_for_key string__of_yojson "Arn") _list path;
   }
    : describe_partner_event_source_response)

let describe_partner_event_source_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key event_source_name_of_yojson "Name" _list path }
    : describe_partner_event_source_request)

let describe_event_source_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key event_source_state_of_yojson "State") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     expiration_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ExpirationTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     created_by = option_of_yojson (value_for_key string__of_yojson "CreatedBy") _list path;
     arn = option_of_yojson (value_for_key string__of_yojson "Arn") _list path;
   }
    : describe_event_source_response)

let describe_event_source_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key event_source_name_of_yojson "Name" _list path }
    : describe_event_source_request)

let describe_event_bus_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     policy = option_of_yojson (value_for_key string__of_yojson "Policy") _list path;
     dead_letter_config =
       option_of_yojson (value_for_key dead_letter_config_of_yojson "DeadLetterConfig") _list path;
     kms_key_identifier =
       option_of_yojson (value_for_key kms_key_identifier_of_yojson "KmsKeyIdentifier") _list path;
     description =
       option_of_yojson (value_for_key event_bus_description_of_yojson "Description") _list path;
     arn = option_of_yojson (value_for_key string__of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : describe_event_bus_response)

let describe_event_bus_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key event_bus_name_or_arn_of_yojson "Name") _list path }
    : describe_event_bus_request)

let describe_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     state_reason =
       option_of_yojson (value_for_key endpoint_state_reason_of_yojson "StateReason") _list path;
     state = option_of_yojson (value_for_key endpoint_state_of_yojson "State") _list path;
     endpoint_url = option_of_yojson (value_for_key endpoint_url_of_yojson "EndpointUrl") _list path;
     endpoint_id = option_of_yojson (value_for_key endpoint_id_of_yojson "EndpointId") _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     event_buses =
       option_of_yojson (value_for_key endpoint_event_bus_list_of_yojson "EventBuses") _list path;
     replication_config =
       option_of_yojson (value_for_key replication_config_of_yojson "ReplicationConfig") _list path;
     routing_config =
       option_of_yojson (value_for_key routing_config_of_yojson "RoutingConfig") _list path;
     arn = option_of_yojson (value_for_key endpoint_arn_of_yojson "Arn") _list path;
     description =
       option_of_yojson (value_for_key endpoint_description_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key endpoint_name_of_yojson "Name") _list path;
   }
    : describe_endpoint_response)

let describe_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     home_region = option_of_yojson (value_for_key home_region_of_yojson "HomeRegion") _list path;
     name = value_for_key endpoint_name_of_yojson "Name" _list path;
   }
    : describe_endpoint_request)

let describe_connection_resource_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_association_arn =
       value_for_key resource_association_arn_of_yojson "ResourceAssociationArn" _list path;
     resource_configuration_arn =
       value_for_key resource_configuration_arn_of_yojson "ResourceConfigurationArn" _list path;
   }
    : describe_connection_resource_parameters)

let describe_connection_connectivity_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_parameters =
       value_for_key describe_connection_resource_parameters_of_yojson "ResourceParameters" _list
         path;
   }
    : describe_connection_connectivity_parameters)

let connection_basic_auth_response_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     username =
       option_of_yojson (value_for_key auth_header_parameters_of_yojson "Username") _list path;
   }
    : connection_basic_auth_response_parameters)

let connection_o_auth_client_response_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_i_d =
       option_of_yojson (value_for_key auth_header_parameters_of_yojson "ClientID") _list path;
   }
    : connection_o_auth_client_response_parameters)

let connection_o_auth_response_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     o_auth_http_parameters =
       option_of_yojson
         (value_for_key connection_http_parameters_of_yojson "OAuthHttpParameters")
         _list path;
     http_method =
       option_of_yojson
         (value_for_key connection_o_auth_http_method_of_yojson "HttpMethod")
         _list path;
     authorization_endpoint =
       option_of_yojson (value_for_key https_endpoint_of_yojson "AuthorizationEndpoint") _list path;
     client_parameters =
       option_of_yojson
         (value_for_key connection_o_auth_client_response_parameters_of_yojson "ClientParameters")
         _list path;
   }
    : connection_o_auth_response_parameters)

let connection_api_key_auth_response_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     api_key_name =
       option_of_yojson (value_for_key auth_header_parameters_of_yojson "ApiKeyName") _list path;
   }
    : connection_api_key_auth_response_parameters)

let connection_auth_response_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connectivity_parameters =
       option_of_yojson
         (value_for_key describe_connection_connectivity_parameters_of_yojson
            "ConnectivityParameters")
         _list path;
     invocation_http_parameters =
       option_of_yojson
         (value_for_key connection_http_parameters_of_yojson "InvocationHttpParameters")
         _list path;
     api_key_auth_parameters =
       option_of_yojson
         (value_for_key connection_api_key_auth_response_parameters_of_yojson "ApiKeyAuthParameters")
         _list path;
     o_auth_parameters =
       option_of_yojson
         (value_for_key connection_o_auth_response_parameters_of_yojson "OAuthParameters")
         _list path;
     basic_auth_parameters =
       option_of_yojson
         (value_for_key connection_basic_auth_response_parameters_of_yojson "BasicAuthParameters")
         _list path;
   }
    : connection_auth_response_parameters)

let describe_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_authorized_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastAuthorizedTime") _list path;
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     auth_parameters =
       option_of_yojson
         (value_for_key connection_auth_response_parameters_of_yojson "AuthParameters")
         _list path;
     kms_key_identifier =
       option_of_yojson (value_for_key kms_key_identifier_of_yojson "KmsKeyIdentifier") _list path;
     secret_arn =
       option_of_yojson (value_for_key secrets_manager_secret_arn_of_yojson "SecretArn") _list path;
     authorization_type =
       option_of_yojson
         (value_for_key connection_authorization_type_of_yojson "AuthorizationType")
         _list path;
     state_reason =
       option_of_yojson (value_for_key connection_state_reason_of_yojson "StateReason") _list path;
     connection_state =
       option_of_yojson (value_for_key connection_state_of_yojson "ConnectionState") _list path;
     invocation_connectivity_parameters =
       option_of_yojson
         (value_for_key describe_connection_connectivity_parameters_of_yojson
            "InvocationConnectivityParameters")
         _list path;
     description =
       option_of_yojson (value_for_key connection_description_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key connection_name_of_yojson "Name") _list path;
     connection_arn =
       option_of_yojson (value_for_key connection_arn_of_yojson "ConnectionArn") _list path;
   }
    : describe_connection_response)

let describe_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key connection_name_of_yojson "Name" _list path }
    : describe_connection_request)

let describe_archive_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     event_count = option_of_yojson (value_for_key long_of_yojson "EventCount") _list path;
     size_bytes = option_of_yojson (value_for_key long_of_yojson "SizeBytes") _list path;
     retention_days =
       option_of_yojson (value_for_key retention_days_of_yojson "RetentionDays") _list path;
     kms_key_identifier =
       option_of_yojson (value_for_key kms_key_identifier_of_yojson "KmsKeyIdentifier") _list path;
     state_reason =
       option_of_yojson (value_for_key archive_state_reason_of_yojson "StateReason") _list path;
     state = option_of_yojson (value_for_key archive_state_of_yojson "State") _list path;
     event_pattern =
       option_of_yojson (value_for_key event_pattern_of_yojson "EventPattern") _list path;
     description =
       option_of_yojson (value_for_key archive_description_of_yojson "Description") _list path;
     event_source_arn =
       option_of_yojson (value_for_key event_bus_arn_of_yojson "EventSourceArn") _list path;
     archive_name = option_of_yojson (value_for_key archive_name_of_yojson "ArchiveName") _list path;
     archive_arn = option_of_yojson (value_for_key archive_arn_of_yojson "ArchiveArn") _list path;
   }
    : describe_archive_response)

let describe_archive_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ archive_name = value_for_key archive_name_of_yojson "ArchiveName" _list path }
    : describe_archive_request)

let describe_api_destination_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     invocation_rate_limit_per_second =
       option_of_yojson
         (value_for_key api_destination_invocation_rate_limit_per_second_of_yojson
            "InvocationRateLimitPerSecond")
         _list path;
     http_method =
       option_of_yojson
         (value_for_key api_destination_http_method_of_yojson "HttpMethod")
         _list path;
     invocation_endpoint =
       option_of_yojson (value_for_key https_endpoint_of_yojson "InvocationEndpoint") _list path;
     connection_arn =
       option_of_yojson (value_for_key connection_arn_of_yojson "ConnectionArn") _list path;
     api_destination_state =
       option_of_yojson
         (value_for_key api_destination_state_of_yojson "ApiDestinationState")
         _list path;
     description =
       option_of_yojson
         (value_for_key api_destination_description_of_yojson "Description")
         _list path;
     name = option_of_yojson (value_for_key api_destination_name_of_yojson "Name") _list path;
     api_destination_arn =
       option_of_yojson (value_for_key api_destination_arn_of_yojson "ApiDestinationArn") _list path;
   }
    : describe_api_destination_response)

let describe_api_destination_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key api_destination_name_of_yojson "Name" _list path }
    : describe_api_destination_request)

let delete_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     force = option_of_yojson (value_for_key boolean__of_yojson "Force") _list path;
     event_bus_name =
       option_of_yojson (value_for_key event_bus_name_or_arn_of_yojson "EventBusName") _list path;
     name = value_for_key rule_name_of_yojson "Name" _list path;
   }
    : delete_rule_request)

let delete_partner_event_source_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account = value_for_key account_id_of_yojson "Account" _list path;
     name = value_for_key event_source_name_of_yojson "Name" _list path;
   }
    : delete_partner_event_source_request)

let delete_event_bus_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key event_bus_name_of_yojson "Name" _list path } : delete_event_bus_request)

let delete_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key endpoint_name_of_yojson "Name" _list path } : delete_endpoint_request)

let delete_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_authorized_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastAuthorizedTime") _list path;
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     connection_state =
       option_of_yojson (value_for_key connection_state_of_yojson "ConnectionState") _list path;
     connection_arn =
       option_of_yojson (value_for_key connection_arn_of_yojson "ConnectionArn") _list path;
   }
    : delete_connection_response)

let delete_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key connection_name_of_yojson "Name" _list path } : delete_connection_request)

let delete_archive_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_archive_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ archive_name = value_for_key archive_name_of_yojson "ArchiveName" _list path }
    : delete_archive_request)

let delete_api_destination_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_api_destination_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key api_destination_name_of_yojson "Name" _list path }
    : delete_api_destination_request)

let deauthorize_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_authorized_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastAuthorizedTime") _list path;
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     connection_state =
       option_of_yojson (value_for_key connection_state_of_yojson "ConnectionState") _list path;
     connection_arn =
       option_of_yojson (value_for_key connection_arn_of_yojson "ConnectionArn") _list path;
   }
    : deauthorize_connection_response)

let deauthorize_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key connection_name_of_yojson "Name" _list path }
    : deauthorize_connection_request)

let deactivate_event_source_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key event_source_name_of_yojson "Name" _list path }
    : deactivate_event_source_request)

let create_partner_event_source_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_source_arn =
       option_of_yojson (value_for_key string__of_yojson "EventSourceArn") _list path;
   }
    : create_partner_event_source_response)

let create_partner_event_source_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account = value_for_key account_id_of_yojson "Account" _list path;
     name = value_for_key event_source_name_of_yojson "Name" _list path;
   }
    : create_partner_event_source_request)

let create_event_bus_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dead_letter_config =
       option_of_yojson (value_for_key dead_letter_config_of_yojson "DeadLetterConfig") _list path;
     kms_key_identifier =
       option_of_yojson (value_for_key kms_key_identifier_of_yojson "KmsKeyIdentifier") _list path;
     description =
       option_of_yojson (value_for_key event_bus_description_of_yojson "Description") _list path;
     event_bus_arn = option_of_yojson (value_for_key string__of_yojson "EventBusArn") _list path;
   }
    : create_event_bus_response)

let create_event_bus_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     dead_letter_config =
       option_of_yojson (value_for_key dead_letter_config_of_yojson "DeadLetterConfig") _list path;
     kms_key_identifier =
       option_of_yojson (value_for_key kms_key_identifier_of_yojson "KmsKeyIdentifier") _list path;
     description =
       option_of_yojson (value_for_key event_bus_description_of_yojson "Description") _list path;
     event_source_name =
       option_of_yojson (value_for_key event_source_name_of_yojson "EventSourceName") _list path;
     name = value_for_key event_bus_name_of_yojson "Name" _list path;
   }
    : create_event_bus_request)

let create_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key endpoint_state_of_yojson "State") _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     event_buses =
       option_of_yojson (value_for_key endpoint_event_bus_list_of_yojson "EventBuses") _list path;
     replication_config =
       option_of_yojson (value_for_key replication_config_of_yojson "ReplicationConfig") _list path;
     routing_config =
       option_of_yojson (value_for_key routing_config_of_yojson "RoutingConfig") _list path;
     arn = option_of_yojson (value_for_key endpoint_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key endpoint_name_of_yojson "Name") _list path;
   }
    : create_endpoint_response)

let create_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     event_buses = value_for_key endpoint_event_bus_list_of_yojson "EventBuses" _list path;
     replication_config =
       option_of_yojson (value_for_key replication_config_of_yojson "ReplicationConfig") _list path;
     routing_config = value_for_key routing_config_of_yojson "RoutingConfig" _list path;
     description =
       option_of_yojson (value_for_key endpoint_description_of_yojson "Description") _list path;
     name = value_for_key endpoint_name_of_yojson "Name" _list path;
   }
    : create_endpoint_request)

let create_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     connection_state =
       option_of_yojson (value_for_key connection_state_of_yojson "ConnectionState") _list path;
     connection_arn =
       option_of_yojson (value_for_key connection_arn_of_yojson "ConnectionArn") _list path;
   }
    : create_connection_response)

let create_connection_basic_auth_request_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     password = value_for_key auth_header_parameters_sensitive_of_yojson "Password" _list path;
     username = value_for_key auth_header_parameters_of_yojson "Username" _list path;
   }
    : create_connection_basic_auth_request_parameters)

let create_connection_o_auth_client_request_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_secret =
       value_for_key auth_header_parameters_sensitive_of_yojson "ClientSecret" _list path;
     client_i_d = value_for_key auth_header_parameters_of_yojson "ClientID" _list path;
   }
    : create_connection_o_auth_client_request_parameters)

let create_connection_o_auth_request_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     o_auth_http_parameters =
       option_of_yojson
         (value_for_key connection_http_parameters_of_yojson "OAuthHttpParameters")
         _list path;
     http_method = value_for_key connection_o_auth_http_method_of_yojson "HttpMethod" _list path;
     authorization_endpoint =
       value_for_key https_endpoint_of_yojson "AuthorizationEndpoint" _list path;
     client_parameters =
       value_for_key create_connection_o_auth_client_request_parameters_of_yojson "ClientParameters"
         _list path;
   }
    : create_connection_o_auth_request_parameters)

let create_connection_api_key_auth_request_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     api_key_value =
       value_for_key auth_header_parameters_sensitive_of_yojson "ApiKeyValue" _list path;
     api_key_name = value_for_key auth_header_parameters_of_yojson "ApiKeyName" _list path;
   }
    : create_connection_api_key_auth_request_parameters)

let create_connection_auth_request_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connectivity_parameters =
       option_of_yojson
         (value_for_key connectivity_resource_parameters_of_yojson "ConnectivityParameters")
         _list path;
     invocation_http_parameters =
       option_of_yojson
         (value_for_key connection_http_parameters_of_yojson "InvocationHttpParameters")
         _list path;
     api_key_auth_parameters =
       option_of_yojson
         (value_for_key create_connection_api_key_auth_request_parameters_of_yojson
            "ApiKeyAuthParameters")
         _list path;
     o_auth_parameters =
       option_of_yojson
         (value_for_key create_connection_o_auth_request_parameters_of_yojson "OAuthParameters")
         _list path;
     basic_auth_parameters =
       option_of_yojson
         (value_for_key create_connection_basic_auth_request_parameters_of_yojson
            "BasicAuthParameters")
         _list path;
   }
    : create_connection_auth_request_parameters)

let create_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_identifier =
       option_of_yojson (value_for_key kms_key_identifier_of_yojson "KmsKeyIdentifier") _list path;
     invocation_connectivity_parameters =
       option_of_yojson
         (value_for_key connectivity_resource_parameters_of_yojson
            "InvocationConnectivityParameters")
         _list path;
     auth_parameters =
       value_for_key create_connection_auth_request_parameters_of_yojson "AuthParameters" _list path;
     authorization_type =
       value_for_key connection_authorization_type_of_yojson "AuthorizationType" _list path;
     description =
       option_of_yojson (value_for_key connection_description_of_yojson "Description") _list path;
     name = value_for_key connection_name_of_yojson "Name" _list path;
   }
    : create_connection_request)

let create_archive_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     state_reason =
       option_of_yojson (value_for_key archive_state_reason_of_yojson "StateReason") _list path;
     state = option_of_yojson (value_for_key archive_state_of_yojson "State") _list path;
     archive_arn = option_of_yojson (value_for_key archive_arn_of_yojson "ArchiveArn") _list path;
   }
    : create_archive_response)

let create_archive_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_identifier =
       option_of_yojson (value_for_key kms_key_identifier_of_yojson "KmsKeyIdentifier") _list path;
     retention_days =
       option_of_yojson (value_for_key retention_days_of_yojson "RetentionDays") _list path;
     event_pattern =
       option_of_yojson (value_for_key event_pattern_of_yojson "EventPattern") _list path;
     description =
       option_of_yojson (value_for_key archive_description_of_yojson "Description") _list path;
     event_source_arn = value_for_key event_bus_arn_of_yojson "EventSourceArn" _list path;
     archive_name = value_for_key archive_name_of_yojson "ArchiveName" _list path;
   }
    : create_archive_request)

let create_api_destination_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     api_destination_state =
       option_of_yojson
         (value_for_key api_destination_state_of_yojson "ApiDestinationState")
         _list path;
     api_destination_arn =
       option_of_yojson (value_for_key api_destination_arn_of_yojson "ApiDestinationArn") _list path;
   }
    : create_api_destination_response)

let create_api_destination_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invocation_rate_limit_per_second =
       option_of_yojson
         (value_for_key api_destination_invocation_rate_limit_per_second_of_yojson
            "InvocationRateLimitPerSecond")
         _list path;
     http_method = value_for_key api_destination_http_method_of_yojson "HttpMethod" _list path;
     invocation_endpoint = value_for_key https_endpoint_of_yojson "InvocationEndpoint" _list path;
     connection_arn = value_for_key connection_arn_of_yojson "ConnectionArn" _list path;
     description =
       option_of_yojson
         (value_for_key api_destination_description_of_yojson "Description")
         _list path;
     name = value_for_key api_destination_name_of_yojson "Name" _list path;
   }
    : create_api_destination_request)

let cancel_replay_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_reason =
       option_of_yojson (value_for_key replay_state_reason_of_yojson "StateReason") _list path;
     state = option_of_yojson (value_for_key replay_state_of_yojson "State") _list path;
     replay_arn = option_of_yojson (value_for_key replay_arn_of_yojson "ReplayArn") _list path;
   }
    : cancel_replay_response)

let cancel_replay_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ replay_name = value_for_key replay_name_of_yojson "ReplayName" _list path }
    : cancel_replay_request)

let activate_event_source_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key event_source_name_of_yojson "Name" _list path }
    : activate_event_source_request)
