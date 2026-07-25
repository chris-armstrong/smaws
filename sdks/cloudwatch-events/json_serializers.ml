open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let internal_exception_to_yojson (x : internal_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let connection_state_to_yojson (x : connection_state) =
  match x with
  | CREATING -> `String "CREATING"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | AUTHORIZED -> `String "AUTHORIZED"
  | DEAUTHORIZED -> `String "DEAUTHORIZED"
  | AUTHORIZING -> `String "AUTHORIZING"
  | DEAUTHORIZING -> `String "DEAUTHORIZING"

let connection_arn_to_yojson = string_to_yojson

let update_connection_response_to_yojson (x : update_connection_response) =
  assoc_to_yojson
    [
      ("ConnectionArn", option_to_yojson connection_arn_to_yojson x.connection_arn);
      ("ConnectionState", option_to_yojson connection_state_to_yojson x.connection_state);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastAuthorizedTime", option_to_yojson timestamp_to_yojson x.last_authorized_time);
    ]

let boolean__to_yojson = bool_to_yojson
let sensitive_string_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson

let connection_body_parameter_to_yojson (x : connection_body_parameter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson string__to_yojson x.key);
      ("Value", option_to_yojson sensitive_string_to_yojson x.value);
      ("IsValueSecret", option_to_yojson boolean__to_yojson x.is_value_secret);
    ]

let connection_body_parameters_list_to_yojson tree =
  list_to_yojson connection_body_parameter_to_yojson tree

let query_string_value_sensitive_to_yojson = string_to_yojson
let query_string_key_to_yojson = string_to_yojson

let connection_query_string_parameter_to_yojson (x : connection_query_string_parameter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson query_string_key_to_yojson x.key);
      ("Value", option_to_yojson query_string_value_sensitive_to_yojson x.value);
      ("IsValueSecret", option_to_yojson boolean__to_yojson x.is_value_secret);
    ]

let connection_query_string_parameters_list_to_yojson tree =
  list_to_yojson connection_query_string_parameter_to_yojson tree

let header_value_sensitive_to_yojson = string_to_yojson
let header_key_to_yojson = string_to_yojson

let connection_header_parameter_to_yojson (x : connection_header_parameter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson header_key_to_yojson x.key);
      ("Value", option_to_yojson header_value_sensitive_to_yojson x.value);
      ("IsValueSecret", option_to_yojson boolean__to_yojson x.is_value_secret);
    ]

let connection_header_parameters_list_to_yojson tree =
  list_to_yojson connection_header_parameter_to_yojson tree

let connection_http_parameters_to_yojson (x : connection_http_parameters) =
  assoc_to_yojson
    [
      ( "HeaderParameters",
        option_to_yojson connection_header_parameters_list_to_yojson x.header_parameters );
      ( "QueryStringParameters",
        option_to_yojson connection_query_string_parameters_list_to_yojson x.query_string_parameters
      );
      ( "BodyParameters",
        option_to_yojson connection_body_parameters_list_to_yojson x.body_parameters );
    ]

let auth_header_parameters_sensitive_to_yojson = string_to_yojson
let auth_header_parameters_to_yojson = string_to_yojson

let update_connection_api_key_auth_request_parameters_to_yojson
    (x : update_connection_api_key_auth_request_parameters) =
  assoc_to_yojson
    [
      ("ApiKeyName", option_to_yojson auth_header_parameters_to_yojson x.api_key_name);
      ("ApiKeyValue", option_to_yojson auth_header_parameters_sensitive_to_yojson x.api_key_value);
    ]

let connection_o_auth_http_method_to_yojson (x : connection_o_auth_http_method) =
  match x with GET -> `String "GET" | POST -> `String "POST" | PUT -> `String "PUT"

let https_endpoint_to_yojson = string_to_yojson

let update_connection_o_auth_client_request_parameters_to_yojson
    (x : update_connection_o_auth_client_request_parameters) =
  assoc_to_yojson
    [
      ("ClientID", option_to_yojson auth_header_parameters_to_yojson x.client_i_d);
      ("ClientSecret", option_to_yojson auth_header_parameters_sensitive_to_yojson x.client_secret);
    ]

let update_connection_o_auth_request_parameters_to_yojson
    (x : update_connection_o_auth_request_parameters) =
  assoc_to_yojson
    [
      ( "ClientParameters",
        option_to_yojson update_connection_o_auth_client_request_parameters_to_yojson
          x.client_parameters );
      ("AuthorizationEndpoint", option_to_yojson https_endpoint_to_yojson x.authorization_endpoint);
      ("HttpMethod", option_to_yojson connection_o_auth_http_method_to_yojson x.http_method);
      ( "OAuthHttpParameters",
        option_to_yojson connection_http_parameters_to_yojson x.o_auth_http_parameters );
    ]

let update_connection_basic_auth_request_parameters_to_yojson
    (x : update_connection_basic_auth_request_parameters) =
  assoc_to_yojson
    [
      ("Username", option_to_yojson auth_header_parameters_to_yojson x.username);
      ("Password", option_to_yojson auth_header_parameters_sensitive_to_yojson x.password);
    ]

let update_connection_auth_request_parameters_to_yojson
    (x : update_connection_auth_request_parameters) =
  assoc_to_yojson
    [
      ( "BasicAuthParameters",
        option_to_yojson update_connection_basic_auth_request_parameters_to_yojson
          x.basic_auth_parameters );
      ( "OAuthParameters",
        option_to_yojson update_connection_o_auth_request_parameters_to_yojson x.o_auth_parameters
      );
      ( "ApiKeyAuthParameters",
        option_to_yojson update_connection_api_key_auth_request_parameters_to_yojson
          x.api_key_auth_parameters );
      ( "InvocationHttpParameters",
        option_to_yojson connection_http_parameters_to_yojson x.invocation_http_parameters );
    ]

let connection_authorization_type_to_yojson (x : connection_authorization_type) =
  match x with
  | BASIC -> `String "BASIC"
  | OAUTH_CLIENT_CREDENTIALS -> `String "OAUTH_CLIENT_CREDENTIALS"
  | API_KEY -> `String "API_KEY"

let connection_description_to_yojson = string_to_yojson
let connection_name_to_yojson = string_to_yojson

let update_connection_request_to_yojson (x : update_connection_request) =
  assoc_to_yojson
    [
      ("Name", Some (connection_name_to_yojson x.name));
      ("Description", option_to_yojson connection_description_to_yojson x.description);
      ( "AuthorizationType",
        option_to_yojson connection_authorization_type_to_yojson x.authorization_type );
      ( "AuthParameters",
        option_to_yojson update_connection_auth_request_parameters_to_yojson x.auth_parameters );
    ]

let invalid_event_pattern_exception_to_yojson (x : invalid_event_pattern_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let archive_state_reason_to_yojson = string_to_yojson

let archive_state_to_yojson (x : archive_state) =
  match x with
  | ENABLED -> `String "ENABLED"
  | DISABLED -> `String "DISABLED"
  | CREATING -> `String "CREATING"
  | UPDATING -> `String "UPDATING"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"

let archive_arn_to_yojson = string_to_yojson

let update_archive_response_to_yojson (x : update_archive_response) =
  assoc_to_yojson
    [
      ("ArchiveArn", option_to_yojson archive_arn_to_yojson x.archive_arn);
      ("State", option_to_yojson archive_state_to_yojson x.state);
      ("StateReason", option_to_yojson archive_state_reason_to_yojson x.state_reason);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
    ]

let retention_days_to_yojson = int_to_yojson
let event_pattern_to_yojson = string_to_yojson
let archive_description_to_yojson = string_to_yojson
let archive_name_to_yojson = string_to_yojson

let update_archive_request_to_yojson (x : update_archive_request) =
  assoc_to_yojson
    [
      ("ArchiveName", Some (archive_name_to_yojson x.archive_name));
      ("Description", option_to_yojson archive_description_to_yojson x.description);
      ("EventPattern", option_to_yojson event_pattern_to_yojson x.event_pattern);
      ("RetentionDays", option_to_yojson retention_days_to_yojson x.retention_days);
    ]

let api_destination_state_to_yojson (x : api_destination_state) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE"

let api_destination_arn_to_yojson = string_to_yojson

let update_api_destination_response_to_yojson (x : update_api_destination_response) =
  assoc_to_yojson
    [
      ("ApiDestinationArn", option_to_yojson api_destination_arn_to_yojson x.api_destination_arn);
      ( "ApiDestinationState",
        option_to_yojson api_destination_state_to_yojson x.api_destination_state );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let api_destination_invocation_rate_limit_per_second_to_yojson = int_to_yojson

let api_destination_http_method_to_yojson (x : api_destination_http_method) =
  match x with
  | POST -> `String "POST"
  | GET -> `String "GET"
  | HEAD -> `String "HEAD"
  | OPTIONS -> `String "OPTIONS"
  | PUT -> `String "PUT"
  | PATCH -> `String "PATCH"
  | DELETE -> `String "DELETE"

let api_destination_description_to_yojson = string_to_yojson
let api_destination_name_to_yojson = string_to_yojson

let update_api_destination_request_to_yojson (x : update_api_destination_request) =
  assoc_to_yojson
    [
      ("Name", Some (api_destination_name_to_yojson x.name));
      ("Description", option_to_yojson api_destination_description_to_yojson x.description);
      ("ConnectionArn", option_to_yojson connection_arn_to_yojson x.connection_arn);
      ("InvocationEndpoint", option_to_yojson https_endpoint_to_yojson x.invocation_endpoint);
      ("HttpMethod", option_to_yojson api_destination_http_method_to_yojson x.http_method);
      ( "InvocationRateLimitPerSecond",
        option_to_yojson api_destination_invocation_rate_limit_per_second_to_yojson
          x.invocation_rate_limit_per_second );
    ]

let managed_rule_exception_to_yojson (x : managed_rule_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (arn_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let test_event_pattern_response_to_yojson (x : test_event_pattern_response) =
  assoc_to_yojson [ ("Result", option_to_yojson boolean__to_yojson x.result_) ]

let test_event_pattern_request_to_yojson (x : test_event_pattern_request) =
  assoc_to_yojson
    [
      ("EventPattern", Some (event_pattern_to_yojson x.event_pattern));
      ("Event", Some (string__to_yojson x.event));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (arn_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let replay_state_reason_to_yojson = string_to_yojson

let replay_state_to_yojson (x : replay_state) =
  match x with
  | STARTING -> `String "STARTING"
  | RUNNING -> `String "RUNNING"
  | CANCELLING -> `String "CANCELLING"
  | COMPLETED -> `String "COMPLETED"
  | CANCELLED -> `String "CANCELLED"
  | FAILED -> `String "FAILED"

let replay_arn_to_yojson = string_to_yojson

let start_replay_response_to_yojson (x : start_replay_response) =
  assoc_to_yojson
    [
      ("ReplayArn", option_to_yojson replay_arn_to_yojson x.replay_arn);
      ("State", option_to_yojson replay_state_to_yojson x.state);
      ("StateReason", option_to_yojson replay_state_reason_to_yojson x.state_reason);
      ("ReplayStartTime", option_to_yojson timestamp_to_yojson x.replay_start_time);
    ]

let replay_destination_filters_to_yojson tree = list_to_yojson arn_to_yojson tree

let replay_destination_to_yojson (x : replay_destination) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("FilterArns", option_to_yojson replay_destination_filters_to_yojson x.filter_arns);
    ]

let replay_description_to_yojson = string_to_yojson
let replay_name_to_yojson = string_to_yojson

let start_replay_request_to_yojson (x : start_replay_request) =
  assoc_to_yojson
    [
      ("ReplayName", Some (replay_name_to_yojson x.replay_name));
      ("Description", option_to_yojson replay_description_to_yojson x.description);
      ("EventSourceArn", Some (arn_to_yojson x.event_source_arn));
      ("EventStartTime", Some (timestamp_to_yojson x.event_start_time));
      ("EventEndTime", Some (timestamp_to_yojson x.event_end_time));
      ("Destination", Some (replay_destination_to_yojson x.destination));
    ]

let error_code_to_yojson = string_to_yojson
let target_id_to_yojson = string_to_yojson

let remove_targets_result_entry_to_yojson (x : remove_targets_result_entry) =
  assoc_to_yojson
    [
      ("TargetId", option_to_yojson target_id_to_yojson x.target_id);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let remove_targets_result_entry_list_to_yojson tree =
  list_to_yojson remove_targets_result_entry_to_yojson tree

let integer_to_yojson = int_to_yojson

let remove_targets_response_to_yojson (x : remove_targets_response) =
  assoc_to_yojson
    [
      ("FailedEntryCount", option_to_yojson integer_to_yojson x.failed_entry_count);
      ("FailedEntries", option_to_yojson remove_targets_result_entry_list_to_yojson x.failed_entries);
    ]

let target_id_list_to_yojson tree = list_to_yojson target_id_to_yojson tree
let event_bus_name_or_arn_to_yojson = string_to_yojson
let rule_name_to_yojson = string_to_yojson

let remove_targets_request_to_yojson (x : remove_targets_request) =
  assoc_to_yojson
    [
      ("Rule", Some (rule_name_to_yojson x.rule));
      ("EventBusName", option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name);
      ("Ids", Some (target_id_list_to_yojson x.ids));
      ("Force", option_to_yojson boolean__to_yojson x.force);
    ]

let operation_disabled_exception_to_yojson (x : operation_disabled_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let non_partner_event_bus_name_to_yojson = string_to_yojson
let statement_id_to_yojson = string_to_yojson

let remove_permission_request_to_yojson (x : remove_permission_request) =
  assoc_to_yojson
    [
      ("StatementId", option_to_yojson statement_id_to_yojson x.statement_id);
      ("RemoveAllPermissions", option_to_yojson boolean__to_yojson x.remove_all_permissions);
      ("EventBusName", option_to_yojson non_partner_event_bus_name_to_yojson x.event_bus_name);
    ]

let put_targets_result_entry_to_yojson (x : put_targets_result_entry) =
  assoc_to_yojson
    [
      ("TargetId", option_to_yojson target_id_to_yojson x.target_id);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let put_targets_result_entry_list_to_yojson tree =
  list_to_yojson put_targets_result_entry_to_yojson tree

let put_targets_response_to_yojson (x : put_targets_response) =
  assoc_to_yojson
    [
      ("FailedEntryCount", option_to_yojson integer_to_yojson x.failed_entry_count);
      ("FailedEntries", option_to_yojson put_targets_result_entry_list_to_yojson x.failed_entries);
    ]

let maximum_event_age_in_seconds_to_yojson = int_to_yojson
let maximum_retry_attempts_to_yojson = int_to_yojson

let retry_policy_to_yojson (x : retry_policy) =
  assoc_to_yojson
    [
      ( "MaximumRetryAttempts",
        option_to_yojson maximum_retry_attempts_to_yojson x.maximum_retry_attempts );
      ( "MaximumEventAgeInSeconds",
        option_to_yojson maximum_event_age_in_seconds_to_yojson x.maximum_event_age_in_seconds );
    ]

let resource_arn_to_yojson = string_to_yojson

let dead_letter_config_to_yojson (x : dead_letter_config) =
  assoc_to_yojson [ ("Arn", option_to_yojson resource_arn_to_yojson x.arn) ]

let sage_maker_pipeline_parameter_value_to_yojson = string_to_yojson
let sage_maker_pipeline_parameter_name_to_yojson = string_to_yojson

let sage_maker_pipeline_parameter_to_yojson (x : sage_maker_pipeline_parameter) =
  assoc_to_yojson
    [
      ("Name", Some (sage_maker_pipeline_parameter_name_to_yojson x.name));
      ("Value", Some (sage_maker_pipeline_parameter_value_to_yojson x.value));
    ]

let sage_maker_pipeline_parameter_list_to_yojson tree =
  list_to_yojson sage_maker_pipeline_parameter_to_yojson tree

let sage_maker_pipeline_parameters_to_yojson (x : sage_maker_pipeline_parameters) =
  assoc_to_yojson
    [
      ( "PipelineParameterList",
        option_to_yojson sage_maker_pipeline_parameter_list_to_yojson x.pipeline_parameter_list );
    ]

let statement_name_to_yojson = string_to_yojson
let sql_to_yojson = string_to_yojson
let db_user_to_yojson = string_to_yojson
let database_to_yojson = string_to_yojson
let redshift_secret_manager_arn_to_yojson = string_to_yojson

let redshift_data_parameters_to_yojson (x : redshift_data_parameters) =
  assoc_to_yojson
    [
      ( "SecretManagerArn",
        option_to_yojson redshift_secret_manager_arn_to_yojson x.secret_manager_arn );
      ("Database", Some (database_to_yojson x.database));
      ("DbUser", option_to_yojson db_user_to_yojson x.db_user);
      ("Sql", Some (sql_to_yojson x.sql));
      ("StatementName", option_to_yojson statement_name_to_yojson x.statement_name);
      ("WithEvent", option_to_yojson boolean__to_yojson x.with_event);
    ]

let query_string_value_to_yojson = string_to_yojson

let query_string_parameters_map_to_yojson tree =
  map_to_yojson query_string_key_to_yojson query_string_value_to_yojson tree

let header_value_to_yojson = string_to_yojson

let header_parameters_map_to_yojson tree =
  map_to_yojson header_key_to_yojson header_value_to_yojson tree

let path_parameter_to_yojson = string_to_yojson
let path_parameter_list_to_yojson tree = list_to_yojson path_parameter_to_yojson tree

let http_parameters_to_yojson (x : http_parameters) =
  assoc_to_yojson
    [
      ("PathParameterValues", option_to_yojson path_parameter_list_to_yojson x.path_parameter_values);
      ("HeaderParameters", option_to_yojson header_parameters_map_to_yojson x.header_parameters);
      ( "QueryStringParameters",
        option_to_yojson query_string_parameters_map_to_yojson x.query_string_parameters );
    ]

let message_group_id_to_yojson = string_to_yojson

let sqs_parameters_to_yojson (x : sqs_parameters) =
  assoc_to_yojson
    [ ("MessageGroupId", option_to_yojson message_group_id_to_yojson x.message_group_id) ]

let batch_retry_strategy_to_yojson (x : batch_retry_strategy) =
  assoc_to_yojson [ ("Attempts", option_to_yojson integer_to_yojson x.attempts) ]

let batch_array_properties_to_yojson (x : batch_array_properties) =
  assoc_to_yojson [ ("Size", option_to_yojson integer_to_yojson x.size) ]

let batch_parameters_to_yojson (x : batch_parameters) =
  assoc_to_yojson
    [
      ("JobDefinition", Some (string__to_yojson x.job_definition));
      ("JobName", Some (string__to_yojson x.job_name));
      ("ArrayProperties", option_to_yojson batch_array_properties_to_yojson x.array_properties);
      ("RetryStrategy", option_to_yojson batch_retry_strategy_to_yojson x.retry_strategy);
    ]

let reference_id_to_yojson = string_to_yojson

let propagate_tags_to_yojson (x : propagate_tags) =
  match x with TASK_DEFINITION -> `String "TASK_DEFINITION"

let placement_strategy_field_to_yojson = string_to_yojson

let placement_strategy_type_to_yojson (x : placement_strategy_type) =
  match x with
  | RANDOM -> `String "random"
  | SPREAD -> `String "spread"
  | BINPACK -> `String "binpack"

let placement_strategy_to_yojson (x : placement_strategy) =
  assoc_to_yojson
    [
      ("type", option_to_yojson placement_strategy_type_to_yojson x.type_);
      ("field", option_to_yojson placement_strategy_field_to_yojson x.field);
    ]

let placement_strategies_to_yojson tree = list_to_yojson placement_strategy_to_yojson tree
let placement_constraint_expression_to_yojson = string_to_yojson

let placement_constraint_type_to_yojson (x : placement_constraint_type) =
  match x with DISTINCT_INSTANCE -> `String "distinctInstance" | MEMBER_OF -> `String "memberOf"

let placement_constraint_to_yojson (x : placement_constraint) =
  assoc_to_yojson
    [
      ("type", option_to_yojson placement_constraint_type_to_yojson x.type_);
      ("expression", option_to_yojson placement_constraint_expression_to_yojson x.expression);
    ]

let placement_constraints_to_yojson tree = list_to_yojson placement_constraint_to_yojson tree
let capacity_provider_strategy_item_base_to_yojson = int_to_yojson
let capacity_provider_strategy_item_weight_to_yojson = int_to_yojson
let capacity_provider_to_yojson = string_to_yojson

let capacity_provider_strategy_item_to_yojson (x : capacity_provider_strategy_item) =
  assoc_to_yojson
    [
      ("capacityProvider", Some (capacity_provider_to_yojson x.capacity_provider));
      ("weight", option_to_yojson capacity_provider_strategy_item_weight_to_yojson x.weight);
      ("base", option_to_yojson capacity_provider_strategy_item_base_to_yojson x.base);
    ]

let capacity_provider_strategy_to_yojson tree =
  list_to_yojson capacity_provider_strategy_item_to_yojson tree

let assign_public_ip_to_yojson (x : assign_public_ip) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let aws_vpc_configuration_to_yojson (x : aws_vpc_configuration) =
  assoc_to_yojson
    [
      ("Subnets", Some (string_list_to_yojson x.subnets));
      ("SecurityGroups", option_to_yojson string_list_to_yojson x.security_groups);
      ("AssignPublicIp", option_to_yojson assign_public_ip_to_yojson x.assign_public_ip);
    ]

let network_configuration_to_yojson (x : network_configuration) =
  assoc_to_yojson
    [
      ( "awsvpcConfiguration",
        option_to_yojson aws_vpc_configuration_to_yojson x.awsvpc_configuration );
    ]

let launch_type_to_yojson (x : launch_type) =
  match x with
  | EC2 -> `String "EC2"
  | FARGATE -> `String "FARGATE"
  | EXTERNAL -> `String "EXTERNAL"

let limit_min1_to_yojson = int_to_yojson

let ecs_parameters_to_yojson (x : ecs_parameters) =
  assoc_to_yojson
    [
      ("TaskDefinitionArn", Some (arn_to_yojson x.task_definition_arn));
      ("TaskCount", option_to_yojson limit_min1_to_yojson x.task_count);
      ("LaunchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ( "NetworkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("PlatformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("Group", option_to_yojson string__to_yojson x.group);
      ( "CapacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
      ("EnableECSManagedTags", option_to_yojson boolean__to_yojson x.enable_ecs_managed_tags);
      ("EnableExecuteCommand", option_to_yojson boolean__to_yojson x.enable_execute_command);
      ( "PlacementConstraints",
        option_to_yojson placement_constraints_to_yojson x.placement_constraints );
      ("PlacementStrategy", option_to_yojson placement_strategies_to_yojson x.placement_strategy);
      ("PropagateTags", option_to_yojson propagate_tags_to_yojson x.propagate_tags);
      ("ReferenceId", option_to_yojson reference_id_to_yojson x.reference_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let run_command_target_value_to_yojson = string_to_yojson

let run_command_target_values_to_yojson tree =
  list_to_yojson run_command_target_value_to_yojson tree

let run_command_target_key_to_yojson = string_to_yojson

let run_command_target_to_yojson (x : run_command_target) =
  assoc_to_yojson
    [
      ("Key", Some (run_command_target_key_to_yojson x.key));
      ("Values", Some (run_command_target_values_to_yojson x.values));
    ]

let run_command_targets_to_yojson tree = list_to_yojson run_command_target_to_yojson tree

let run_command_parameters_to_yojson (x : run_command_parameters) =
  assoc_to_yojson
    [ ("RunCommandTargets", Some (run_command_targets_to_yojson x.run_command_targets)) ]

let target_partition_key_path_to_yojson = string_to_yojson

let kinesis_parameters_to_yojson (x : kinesis_parameters) =
  assoc_to_yojson
    [ ("PartitionKeyPath", Some (target_partition_key_path_to_yojson x.partition_key_path)) ]

let transformer_input_to_yojson = string_to_yojson
let target_input_path_to_yojson = string_to_yojson
let input_transformer_path_key_to_yojson = string_to_yojson

let transformer_paths_to_yojson tree =
  map_to_yojson input_transformer_path_key_to_yojson target_input_path_to_yojson tree

let input_transformer_to_yojson (x : input_transformer) =
  assoc_to_yojson
    [
      ("InputPathsMap", option_to_yojson transformer_paths_to_yojson x.input_paths_map);
      ("InputTemplate", Some (transformer_input_to_yojson x.input_template));
    ]

let target_input_to_yojson = string_to_yojson
let role_arn_to_yojson = string_to_yojson
let target_arn_to_yojson = string_to_yojson

let target_to_yojson (x : target) =
  assoc_to_yojson
    [
      ("Id", Some (target_id_to_yojson x.id));
      ("Arn", Some (target_arn_to_yojson x.arn));
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("Input", option_to_yojson target_input_to_yojson x.input);
      ("InputPath", option_to_yojson target_input_path_to_yojson x.input_path);
      ("InputTransformer", option_to_yojson input_transformer_to_yojson x.input_transformer);
      ("KinesisParameters", option_to_yojson kinesis_parameters_to_yojson x.kinesis_parameters);
      ( "RunCommandParameters",
        option_to_yojson run_command_parameters_to_yojson x.run_command_parameters );
      ("EcsParameters", option_to_yojson ecs_parameters_to_yojson x.ecs_parameters);
      ("BatchParameters", option_to_yojson batch_parameters_to_yojson x.batch_parameters);
      ("SqsParameters", option_to_yojson sqs_parameters_to_yojson x.sqs_parameters);
      ("HttpParameters", option_to_yojson http_parameters_to_yojson x.http_parameters);
      ( "RedshiftDataParameters",
        option_to_yojson redshift_data_parameters_to_yojson x.redshift_data_parameters );
      ( "SageMakerPipelineParameters",
        option_to_yojson sage_maker_pipeline_parameters_to_yojson x.sage_maker_pipeline_parameters
      );
      ("DeadLetterConfig", option_to_yojson dead_letter_config_to_yojson x.dead_letter_config);
      ("RetryPolicy", option_to_yojson retry_policy_to_yojson x.retry_policy);
    ]

let target_list_to_yojson tree = list_to_yojson target_to_yojson tree

let put_targets_request_to_yojson (x : put_targets_request) =
  assoc_to_yojson
    [
      ("Rule", Some (rule_name_to_yojson x.rule));
      ("EventBusName", option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name);
      ("Targets", Some (target_list_to_yojson x.targets));
    ]

let rule_arn_to_yojson = string_to_yojson

let put_rule_response_to_yojson (x : put_rule_response) =
  assoc_to_yojson [ ("RuleArn", option_to_yojson rule_arn_to_yojson x.rule_arn) ]

let rule_description_to_yojson = string_to_yojson

let rule_state_to_yojson (x : rule_state) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let schedule_expression_to_yojson = string_to_yojson

let put_rule_request_to_yojson (x : put_rule_request) =
  assoc_to_yojson
    [
      ("Name", Some (rule_name_to_yojson x.name));
      ("ScheduleExpression", option_to_yojson schedule_expression_to_yojson x.schedule_expression);
      ("EventPattern", option_to_yojson event_pattern_to_yojson x.event_pattern);
      ("State", option_to_yojson rule_state_to_yojson x.state);
      ("Description", option_to_yojson rule_description_to_yojson x.description);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("EventBusName", option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name);
    ]

let policy_length_exceeded_exception_to_yojson (x : policy_length_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let condition_to_yojson (x : condition) =
  assoc_to_yojson
    [
      ("Type", Some (string__to_yojson x.type_));
      ("Key", Some (string__to_yojson x.key));
      ("Value", Some (string__to_yojson x.value));
    ]

let principal_to_yojson = string_to_yojson
let action_to_yojson = string_to_yojson

let put_permission_request_to_yojson (x : put_permission_request) =
  assoc_to_yojson
    [
      ("EventBusName", option_to_yojson non_partner_event_bus_name_to_yojson x.event_bus_name);
      ("Action", option_to_yojson action_to_yojson x.action);
      ("Principal", option_to_yojson principal_to_yojson x.principal);
      ("StatementId", option_to_yojson statement_id_to_yojson x.statement_id);
      ("Condition", option_to_yojson condition_to_yojson x.condition);
      ("Policy", option_to_yojson string__to_yojson x.policy);
    ]

let event_id_to_yojson = string_to_yojson

let put_partner_events_result_entry_to_yojson (x : put_partner_events_result_entry) =
  assoc_to_yojson
    [
      ("EventId", option_to_yojson event_id_to_yojson x.event_id);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let put_partner_events_result_entry_list_to_yojson tree =
  list_to_yojson put_partner_events_result_entry_to_yojson tree

let put_partner_events_response_to_yojson (x : put_partner_events_response) =
  assoc_to_yojson
    [
      ("FailedEntryCount", option_to_yojson integer_to_yojson x.failed_entry_count);
      ("Entries", option_to_yojson put_partner_events_result_entry_list_to_yojson x.entries);
    ]

let event_resource_to_yojson = string_to_yojson
let event_resource_list_to_yojson tree = list_to_yojson event_resource_to_yojson tree
let event_source_name_to_yojson = string_to_yojson
let event_time_to_yojson = timestamp_epoch_seconds_to_yojson

let put_partner_events_request_entry_to_yojson (x : put_partner_events_request_entry) =
  assoc_to_yojson
    [
      ("Time", option_to_yojson event_time_to_yojson x.time);
      ("Source", option_to_yojson event_source_name_to_yojson x.source);
      ("Resources", option_to_yojson event_resource_list_to_yojson x.resources);
      ("DetailType", option_to_yojson string__to_yojson x.detail_type);
      ("Detail", option_to_yojson string__to_yojson x.detail);
    ]

let put_partner_events_request_entry_list_to_yojson tree =
  list_to_yojson put_partner_events_request_entry_to_yojson tree

let put_partner_events_request_to_yojson (x : put_partner_events_request) =
  assoc_to_yojson [ ("Entries", Some (put_partner_events_request_entry_list_to_yojson x.entries)) ]

let put_events_result_entry_to_yojson (x : put_events_result_entry) =
  assoc_to_yojson
    [
      ("EventId", option_to_yojson event_id_to_yojson x.event_id);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let put_events_result_entry_list_to_yojson tree =
  list_to_yojson put_events_result_entry_to_yojson tree

let put_events_response_to_yojson (x : put_events_response) =
  assoc_to_yojson
    [
      ("FailedEntryCount", option_to_yojson integer_to_yojson x.failed_entry_count);
      ("Entries", option_to_yojson put_events_result_entry_list_to_yojson x.entries);
    ]

let trace_header_to_yojson = string_to_yojson
let non_partner_event_bus_name_or_arn_to_yojson = string_to_yojson

let put_events_request_entry_to_yojson (x : put_events_request_entry) =
  assoc_to_yojson
    [
      ("Time", option_to_yojson event_time_to_yojson x.time);
      ("Source", option_to_yojson string__to_yojson x.source);
      ("Resources", option_to_yojson event_resource_list_to_yojson x.resources);
      ("DetailType", option_to_yojson string__to_yojson x.detail_type);
      ("Detail", option_to_yojson string__to_yojson x.detail);
      ("EventBusName", option_to_yojson non_partner_event_bus_name_or_arn_to_yojson x.event_bus_name);
      ("TraceHeader", option_to_yojson trace_header_to_yojson x.trace_header);
    ]

let put_events_request_entry_list_to_yojson tree =
  list_to_yojson put_events_request_entry_to_yojson tree

let put_events_request_to_yojson (x : put_events_request) =
  assoc_to_yojson [ ("Entries", Some (put_events_request_entry_list_to_yojson x.entries)) ]

let next_token_to_yojson = string_to_yojson

let list_targets_by_rule_response_to_yojson (x : list_targets_by_rule_response) =
  assoc_to_yojson
    [
      ("Targets", option_to_yojson target_list_to_yojson x.targets);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let limit_max100_to_yojson = int_to_yojson

let list_targets_by_rule_request_to_yojson (x : list_targets_by_rule_request) =
  assoc_to_yojson
    [
      ("Rule", Some (rule_name_to_yojson x.rule));
      ("EventBusName", option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_max100_to_yojson x.limit);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (arn_to_yojson x.resource_ar_n)) ]

let event_bus_name_to_yojson = string_to_yojson
let managed_by_to_yojson = string_to_yojson

let rule_to_yojson (x : rule) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson rule_name_to_yojson x.name);
      ("Arn", option_to_yojson rule_arn_to_yojson x.arn);
      ("EventPattern", option_to_yojson event_pattern_to_yojson x.event_pattern);
      ("State", option_to_yojson rule_state_to_yojson x.state);
      ("Description", option_to_yojson rule_description_to_yojson x.description);
      ("ScheduleExpression", option_to_yojson schedule_expression_to_yojson x.schedule_expression);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("ManagedBy", option_to_yojson managed_by_to_yojson x.managed_by);
      ("EventBusName", option_to_yojson event_bus_name_to_yojson x.event_bus_name);
    ]

let rule_response_list_to_yojson tree = list_to_yojson rule_to_yojson tree

let list_rules_response_to_yojson (x : list_rules_response) =
  assoc_to_yojson
    [
      ("Rules", option_to_yojson rule_response_list_to_yojson x.rules);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_rules_request_to_yojson (x : list_rules_request) =
  assoc_to_yojson
    [
      ("NamePrefix", option_to_yojson rule_name_to_yojson x.name_prefix);
      ("EventBusName", option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_max100_to_yojson x.limit);
    ]

let rule_name_list_to_yojson tree = list_to_yojson rule_name_to_yojson tree

let list_rule_names_by_target_response_to_yojson (x : list_rule_names_by_target_response) =
  assoc_to_yojson
    [
      ("RuleNames", option_to_yojson rule_name_list_to_yojson x.rule_names);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_rule_names_by_target_request_to_yojson (x : list_rule_names_by_target_request) =
  assoc_to_yojson
    [
      ("TargetArn", Some (target_arn_to_yojson x.target_arn));
      ("EventBusName", option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_max100_to_yojson x.limit);
    ]

let replay_to_yojson (x : replay) =
  assoc_to_yojson
    [
      ("ReplayName", option_to_yojson replay_name_to_yojson x.replay_name);
      ("EventSourceArn", option_to_yojson arn_to_yojson x.event_source_arn);
      ("State", option_to_yojson replay_state_to_yojson x.state);
      ("StateReason", option_to_yojson replay_state_reason_to_yojson x.state_reason);
      ("EventStartTime", option_to_yojson timestamp_to_yojson x.event_start_time);
      ("EventEndTime", option_to_yojson timestamp_to_yojson x.event_end_time);
      ("EventLastReplayedTime", option_to_yojson timestamp_to_yojson x.event_last_replayed_time);
      ("ReplayStartTime", option_to_yojson timestamp_to_yojson x.replay_start_time);
      ("ReplayEndTime", option_to_yojson timestamp_to_yojson x.replay_end_time);
    ]

let replay_list_to_yojson tree = list_to_yojson replay_to_yojson tree

let list_replays_response_to_yojson (x : list_replays_response) =
  assoc_to_yojson
    [
      ("Replays", option_to_yojson replay_list_to_yojson x.replays);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_replays_request_to_yojson (x : list_replays_request) =
  assoc_to_yojson
    [
      ("NamePrefix", option_to_yojson replay_name_to_yojson x.name_prefix);
      ("State", option_to_yojson replay_state_to_yojson x.state);
      ("EventSourceArn", option_to_yojson arn_to_yojson x.event_source_arn);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_max100_to_yojson x.limit);
    ]

let partner_event_source_to_yojson (x : partner_event_source) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson string__to_yojson x.arn);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let partner_event_source_list_to_yojson tree = list_to_yojson partner_event_source_to_yojson tree

let list_partner_event_sources_response_to_yojson (x : list_partner_event_sources_response) =
  assoc_to_yojson
    [
      ( "PartnerEventSources",
        option_to_yojson partner_event_source_list_to_yojson x.partner_event_sources );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let partner_event_source_name_prefix_to_yojson = string_to_yojson

let list_partner_event_sources_request_to_yojson (x : list_partner_event_sources_request) =
  assoc_to_yojson
    [
      ("NamePrefix", Some (partner_event_source_name_prefix_to_yojson x.name_prefix));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_max100_to_yojson x.limit);
    ]

let event_source_state_to_yojson (x : event_source_state) =
  match x with
  | PENDING -> `String "PENDING"
  | ACTIVE -> `String "ACTIVE"
  | DELETED -> `String "DELETED"

let account_id_to_yojson = string_to_yojson

let partner_event_source_account_to_yojson (x : partner_event_source_account) =
  assoc_to_yojson
    [
      ("Account", option_to_yojson account_id_to_yojson x.account);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("ExpirationTime", option_to_yojson timestamp_to_yojson x.expiration_time);
      ("State", option_to_yojson event_source_state_to_yojson x.state);
    ]

let partner_event_source_account_list_to_yojson tree =
  list_to_yojson partner_event_source_account_to_yojson tree

let list_partner_event_source_accounts_response_to_yojson
    (x : list_partner_event_source_accounts_response) =
  assoc_to_yojson
    [
      ( "PartnerEventSourceAccounts",
        option_to_yojson partner_event_source_account_list_to_yojson x.partner_event_source_accounts
      );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_partner_event_source_accounts_request_to_yojson
    (x : list_partner_event_source_accounts_request) =
  assoc_to_yojson
    [
      ("EventSourceName", Some (event_source_name_to_yojson x.event_source_name));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_max100_to_yojson x.limit);
    ]

let event_source_to_yojson (x : event_source) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson string__to_yojson x.arn);
      ("CreatedBy", option_to_yojson string__to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("ExpirationTime", option_to_yojson timestamp_to_yojson x.expiration_time);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("State", option_to_yojson event_source_state_to_yojson x.state);
    ]

let event_source_list_to_yojson tree = list_to_yojson event_source_to_yojson tree

let list_event_sources_response_to_yojson (x : list_event_sources_response) =
  assoc_to_yojson
    [
      ("EventSources", option_to_yojson event_source_list_to_yojson x.event_sources);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let event_source_name_prefix_to_yojson = string_to_yojson

let list_event_sources_request_to_yojson (x : list_event_sources_request) =
  assoc_to_yojson
    [
      ("NamePrefix", option_to_yojson event_source_name_prefix_to_yojson x.name_prefix);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_max100_to_yojson x.limit);
    ]

let event_bus_to_yojson (x : event_bus) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Arn", option_to_yojson string__to_yojson x.arn);
      ("Policy", option_to_yojson string__to_yojson x.policy);
    ]

let event_bus_list_to_yojson tree = list_to_yojson event_bus_to_yojson tree

let list_event_buses_response_to_yojson (x : list_event_buses_response) =
  assoc_to_yojson
    [
      ("EventBuses", option_to_yojson event_bus_list_to_yojson x.event_buses);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_event_buses_request_to_yojson (x : list_event_buses_request) =
  assoc_to_yojson
    [
      ("NamePrefix", option_to_yojson event_bus_name_to_yojson x.name_prefix);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_max100_to_yojson x.limit);
    ]

let connection_state_reason_to_yojson = string_to_yojson

let connection_to_yojson (x : connection) =
  assoc_to_yojson
    [
      ("ConnectionArn", option_to_yojson connection_arn_to_yojson x.connection_arn);
      ("Name", option_to_yojson connection_name_to_yojson x.name);
      ("ConnectionState", option_to_yojson connection_state_to_yojson x.connection_state);
      ("StateReason", option_to_yojson connection_state_reason_to_yojson x.state_reason);
      ( "AuthorizationType",
        option_to_yojson connection_authorization_type_to_yojson x.authorization_type );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastAuthorizedTime", option_to_yojson timestamp_to_yojson x.last_authorized_time);
    ]

let connection_response_list_to_yojson tree = list_to_yojson connection_to_yojson tree

let list_connections_response_to_yojson (x : list_connections_response) =
  assoc_to_yojson
    [
      ("Connections", option_to_yojson connection_response_list_to_yojson x.connections);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_connections_request_to_yojson (x : list_connections_request) =
  assoc_to_yojson
    [
      ("NamePrefix", option_to_yojson connection_name_to_yojson x.name_prefix);
      ("ConnectionState", option_to_yojson connection_state_to_yojson x.connection_state);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_max100_to_yojson x.limit);
    ]

let long_to_yojson = long_to_yojson

let archive_to_yojson (x : archive) =
  assoc_to_yojson
    [
      ("ArchiveName", option_to_yojson archive_name_to_yojson x.archive_name);
      ("EventSourceArn", option_to_yojson arn_to_yojson x.event_source_arn);
      ("State", option_to_yojson archive_state_to_yojson x.state);
      ("StateReason", option_to_yojson archive_state_reason_to_yojson x.state_reason);
      ("RetentionDays", option_to_yojson retention_days_to_yojson x.retention_days);
      ("SizeBytes", option_to_yojson long_to_yojson x.size_bytes);
      ("EventCount", option_to_yojson long_to_yojson x.event_count);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
    ]

let archive_response_list_to_yojson tree = list_to_yojson archive_to_yojson tree

let list_archives_response_to_yojson (x : list_archives_response) =
  assoc_to_yojson
    [
      ("Archives", option_to_yojson archive_response_list_to_yojson x.archives);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_archives_request_to_yojson (x : list_archives_request) =
  assoc_to_yojson
    [
      ("NamePrefix", option_to_yojson archive_name_to_yojson x.name_prefix);
      ("EventSourceArn", option_to_yojson arn_to_yojson x.event_source_arn);
      ("State", option_to_yojson archive_state_to_yojson x.state);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_max100_to_yojson x.limit);
    ]

let api_destination_to_yojson (x : api_destination) =
  assoc_to_yojson
    [
      ("ApiDestinationArn", option_to_yojson api_destination_arn_to_yojson x.api_destination_arn);
      ("Name", option_to_yojson api_destination_name_to_yojson x.name);
      ( "ApiDestinationState",
        option_to_yojson api_destination_state_to_yojson x.api_destination_state );
      ("ConnectionArn", option_to_yojson connection_arn_to_yojson x.connection_arn);
      ("InvocationEndpoint", option_to_yojson https_endpoint_to_yojson x.invocation_endpoint);
      ("HttpMethod", option_to_yojson api_destination_http_method_to_yojson x.http_method);
      ( "InvocationRateLimitPerSecond",
        option_to_yojson api_destination_invocation_rate_limit_per_second_to_yojson
          x.invocation_rate_limit_per_second );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let api_destination_response_list_to_yojson tree = list_to_yojson api_destination_to_yojson tree

let list_api_destinations_response_to_yojson (x : list_api_destinations_response) =
  assoc_to_yojson
    [
      ( "ApiDestinations",
        option_to_yojson api_destination_response_list_to_yojson x.api_destinations );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_api_destinations_request_to_yojson (x : list_api_destinations_request) =
  assoc_to_yojson
    [
      ("NamePrefix", option_to_yojson api_destination_name_to_yojson x.name_prefix);
      ("ConnectionArn", option_to_yojson connection_arn_to_yojson x.connection_arn);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_max100_to_yojson x.limit);
    ]

let enable_rule_request_to_yojson (x : enable_rule_request) =
  assoc_to_yojson
    [
      ("Name", Some (rule_name_to_yojson x.name));
      ("EventBusName", option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name);
    ]

let disable_rule_request_to_yojson (x : disable_rule_request) =
  assoc_to_yojson
    [
      ("Name", Some (rule_name_to_yojson x.name));
      ("EventBusName", option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name);
    ]

let created_by_to_yojson = string_to_yojson

let describe_rule_response_to_yojson (x : describe_rule_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson rule_name_to_yojson x.name);
      ("Arn", option_to_yojson rule_arn_to_yojson x.arn);
      ("EventPattern", option_to_yojson event_pattern_to_yojson x.event_pattern);
      ("ScheduleExpression", option_to_yojson schedule_expression_to_yojson x.schedule_expression);
      ("State", option_to_yojson rule_state_to_yojson x.state);
      ("Description", option_to_yojson rule_description_to_yojson x.description);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("ManagedBy", option_to_yojson managed_by_to_yojson x.managed_by);
      ("EventBusName", option_to_yojson event_bus_name_to_yojson x.event_bus_name);
      ("CreatedBy", option_to_yojson created_by_to_yojson x.created_by);
    ]

let describe_rule_request_to_yojson (x : describe_rule_request) =
  assoc_to_yojson
    [
      ("Name", Some (rule_name_to_yojson x.name));
      ("EventBusName", option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name);
    ]

let describe_replay_response_to_yojson (x : describe_replay_response) =
  assoc_to_yojson
    [
      ("ReplayName", option_to_yojson replay_name_to_yojson x.replay_name);
      ("ReplayArn", option_to_yojson replay_arn_to_yojson x.replay_arn);
      ("Description", option_to_yojson replay_description_to_yojson x.description);
      ("State", option_to_yojson replay_state_to_yojson x.state);
      ("StateReason", option_to_yojson replay_state_reason_to_yojson x.state_reason);
      ("EventSourceArn", option_to_yojson arn_to_yojson x.event_source_arn);
      ("Destination", option_to_yojson replay_destination_to_yojson x.destination);
      ("EventStartTime", option_to_yojson timestamp_to_yojson x.event_start_time);
      ("EventEndTime", option_to_yojson timestamp_to_yojson x.event_end_time);
      ("EventLastReplayedTime", option_to_yojson timestamp_to_yojson x.event_last_replayed_time);
      ("ReplayStartTime", option_to_yojson timestamp_to_yojson x.replay_start_time);
      ("ReplayEndTime", option_to_yojson timestamp_to_yojson x.replay_end_time);
    ]

let describe_replay_request_to_yojson (x : describe_replay_request) =
  assoc_to_yojson [ ("ReplayName", Some (replay_name_to_yojson x.replay_name)) ]

let describe_partner_event_source_response_to_yojson (x : describe_partner_event_source_response) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson string__to_yojson x.arn);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let describe_partner_event_source_request_to_yojson (x : describe_partner_event_source_request) =
  assoc_to_yojson [ ("Name", Some (event_source_name_to_yojson x.name)) ]

let describe_event_source_response_to_yojson (x : describe_event_source_response) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson string__to_yojson x.arn);
      ("CreatedBy", option_to_yojson string__to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("ExpirationTime", option_to_yojson timestamp_to_yojson x.expiration_time);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("State", option_to_yojson event_source_state_to_yojson x.state);
    ]

let describe_event_source_request_to_yojson (x : describe_event_source_request) =
  assoc_to_yojson [ ("Name", Some (event_source_name_to_yojson x.name)) ]

let describe_event_bus_response_to_yojson (x : describe_event_bus_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Arn", option_to_yojson string__to_yojson x.arn);
      ("Policy", option_to_yojson string__to_yojson x.policy);
    ]

let describe_event_bus_request_to_yojson (x : describe_event_bus_request) =
  assoc_to_yojson [ ("Name", option_to_yojson event_bus_name_or_arn_to_yojson x.name) ]

let connection_api_key_auth_response_parameters_to_yojson
    (x : connection_api_key_auth_response_parameters) =
  assoc_to_yojson
    [ ("ApiKeyName", option_to_yojson auth_header_parameters_to_yojson x.api_key_name) ]

let connection_o_auth_client_response_parameters_to_yojson
    (x : connection_o_auth_client_response_parameters) =
  assoc_to_yojson [ ("ClientID", option_to_yojson auth_header_parameters_to_yojson x.client_i_d) ]

let connection_o_auth_response_parameters_to_yojson (x : connection_o_auth_response_parameters) =
  assoc_to_yojson
    [
      ( "ClientParameters",
        option_to_yojson connection_o_auth_client_response_parameters_to_yojson x.client_parameters
      );
      ("AuthorizationEndpoint", option_to_yojson https_endpoint_to_yojson x.authorization_endpoint);
      ("HttpMethod", option_to_yojson connection_o_auth_http_method_to_yojson x.http_method);
      ( "OAuthHttpParameters",
        option_to_yojson connection_http_parameters_to_yojson x.o_auth_http_parameters );
    ]

let connection_basic_auth_response_parameters_to_yojson
    (x : connection_basic_auth_response_parameters) =
  assoc_to_yojson [ ("Username", option_to_yojson auth_header_parameters_to_yojson x.username) ]

let connection_auth_response_parameters_to_yojson (x : connection_auth_response_parameters) =
  assoc_to_yojson
    [
      ( "BasicAuthParameters",
        option_to_yojson connection_basic_auth_response_parameters_to_yojson x.basic_auth_parameters
      );
      ( "OAuthParameters",
        option_to_yojson connection_o_auth_response_parameters_to_yojson x.o_auth_parameters );
      ( "ApiKeyAuthParameters",
        option_to_yojson connection_api_key_auth_response_parameters_to_yojson
          x.api_key_auth_parameters );
      ( "InvocationHttpParameters",
        option_to_yojson connection_http_parameters_to_yojson x.invocation_http_parameters );
    ]

let secrets_manager_secret_arn_to_yojson = string_to_yojson

let describe_connection_response_to_yojson (x : describe_connection_response) =
  assoc_to_yojson
    [
      ("ConnectionArn", option_to_yojson connection_arn_to_yojson x.connection_arn);
      ("Name", option_to_yojson connection_name_to_yojson x.name);
      ("Description", option_to_yojson connection_description_to_yojson x.description);
      ("ConnectionState", option_to_yojson connection_state_to_yojson x.connection_state);
      ("StateReason", option_to_yojson connection_state_reason_to_yojson x.state_reason);
      ( "AuthorizationType",
        option_to_yojson connection_authorization_type_to_yojson x.authorization_type );
      ("SecretArn", option_to_yojson secrets_manager_secret_arn_to_yojson x.secret_arn);
      ( "AuthParameters",
        option_to_yojson connection_auth_response_parameters_to_yojson x.auth_parameters );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastAuthorizedTime", option_to_yojson timestamp_to_yojson x.last_authorized_time);
    ]

let describe_connection_request_to_yojson (x : describe_connection_request) =
  assoc_to_yojson [ ("Name", Some (connection_name_to_yojson x.name)) ]

let describe_archive_response_to_yojson (x : describe_archive_response) =
  assoc_to_yojson
    [
      ("ArchiveArn", option_to_yojson archive_arn_to_yojson x.archive_arn);
      ("ArchiveName", option_to_yojson archive_name_to_yojson x.archive_name);
      ("EventSourceArn", option_to_yojson arn_to_yojson x.event_source_arn);
      ("Description", option_to_yojson archive_description_to_yojson x.description);
      ("EventPattern", option_to_yojson event_pattern_to_yojson x.event_pattern);
      ("State", option_to_yojson archive_state_to_yojson x.state);
      ("StateReason", option_to_yojson archive_state_reason_to_yojson x.state_reason);
      ("RetentionDays", option_to_yojson retention_days_to_yojson x.retention_days);
      ("SizeBytes", option_to_yojson long_to_yojson x.size_bytes);
      ("EventCount", option_to_yojson long_to_yojson x.event_count);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
    ]

let describe_archive_request_to_yojson (x : describe_archive_request) =
  assoc_to_yojson [ ("ArchiveName", Some (archive_name_to_yojson x.archive_name)) ]

let describe_api_destination_response_to_yojson (x : describe_api_destination_response) =
  assoc_to_yojson
    [
      ("ApiDestinationArn", option_to_yojson api_destination_arn_to_yojson x.api_destination_arn);
      ("Name", option_to_yojson api_destination_name_to_yojson x.name);
      ("Description", option_to_yojson api_destination_description_to_yojson x.description);
      ( "ApiDestinationState",
        option_to_yojson api_destination_state_to_yojson x.api_destination_state );
      ("ConnectionArn", option_to_yojson connection_arn_to_yojson x.connection_arn);
      ("InvocationEndpoint", option_to_yojson https_endpoint_to_yojson x.invocation_endpoint);
      ("HttpMethod", option_to_yojson api_destination_http_method_to_yojson x.http_method);
      ( "InvocationRateLimitPerSecond",
        option_to_yojson api_destination_invocation_rate_limit_per_second_to_yojson
          x.invocation_rate_limit_per_second );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let describe_api_destination_request_to_yojson (x : describe_api_destination_request) =
  assoc_to_yojson [ ("Name", Some (api_destination_name_to_yojson x.name)) ]

let delete_rule_request_to_yojson (x : delete_rule_request) =
  assoc_to_yojson
    [
      ("Name", Some (rule_name_to_yojson x.name));
      ("EventBusName", option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name);
      ("Force", option_to_yojson boolean__to_yojson x.force);
    ]

let delete_partner_event_source_request_to_yojson (x : delete_partner_event_source_request) =
  assoc_to_yojson
    [
      ("Name", Some (event_source_name_to_yojson x.name));
      ("Account", Some (account_id_to_yojson x.account));
    ]

let delete_event_bus_request_to_yojson (x : delete_event_bus_request) =
  assoc_to_yojson [ ("Name", Some (event_bus_name_to_yojson x.name)) ]

let delete_connection_response_to_yojson (x : delete_connection_response) =
  assoc_to_yojson
    [
      ("ConnectionArn", option_to_yojson connection_arn_to_yojson x.connection_arn);
      ("ConnectionState", option_to_yojson connection_state_to_yojson x.connection_state);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastAuthorizedTime", option_to_yojson timestamp_to_yojson x.last_authorized_time);
    ]

let delete_connection_request_to_yojson (x : delete_connection_request) =
  assoc_to_yojson [ ("Name", Some (connection_name_to_yojson x.name)) ]

let delete_archive_response_to_yojson = unit_to_yojson

let delete_archive_request_to_yojson (x : delete_archive_request) =
  assoc_to_yojson [ ("ArchiveName", Some (archive_name_to_yojson x.archive_name)) ]

let delete_api_destination_response_to_yojson = unit_to_yojson

let delete_api_destination_request_to_yojson (x : delete_api_destination_request) =
  assoc_to_yojson [ ("Name", Some (api_destination_name_to_yojson x.name)) ]

let deauthorize_connection_response_to_yojson (x : deauthorize_connection_response) =
  assoc_to_yojson
    [
      ("ConnectionArn", option_to_yojson connection_arn_to_yojson x.connection_arn);
      ("ConnectionState", option_to_yojson connection_state_to_yojson x.connection_state);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("LastAuthorizedTime", option_to_yojson timestamp_to_yojson x.last_authorized_time);
    ]

let deauthorize_connection_request_to_yojson (x : deauthorize_connection_request) =
  assoc_to_yojson [ ("Name", Some (connection_name_to_yojson x.name)) ]

let invalid_state_exception_to_yojson (x : invalid_state_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let deactivate_event_source_request_to_yojson (x : deactivate_event_source_request) =
  assoc_to_yojson [ ("Name", Some (event_source_name_to_yojson x.name)) ]

let create_partner_event_source_response_to_yojson (x : create_partner_event_source_response) =
  assoc_to_yojson [ ("EventSourceArn", option_to_yojson string__to_yojson x.event_source_arn) ]

let create_partner_event_source_request_to_yojson (x : create_partner_event_source_request) =
  assoc_to_yojson
    [
      ("Name", Some (event_source_name_to_yojson x.name));
      ("Account", Some (account_id_to_yojson x.account));
    ]

let create_event_bus_response_to_yojson (x : create_event_bus_response) =
  assoc_to_yojson [ ("EventBusArn", option_to_yojson string__to_yojson x.event_bus_arn) ]

let create_event_bus_request_to_yojson (x : create_event_bus_request) =
  assoc_to_yojson
    [
      ("Name", Some (event_bus_name_to_yojson x.name));
      ("EventSourceName", option_to_yojson event_source_name_to_yojson x.event_source_name);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_connection_response_to_yojson (x : create_connection_response) =
  assoc_to_yojson
    [
      ("ConnectionArn", option_to_yojson connection_arn_to_yojson x.connection_arn);
      ("ConnectionState", option_to_yojson connection_state_to_yojson x.connection_state);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let create_connection_api_key_auth_request_parameters_to_yojson
    (x : create_connection_api_key_auth_request_parameters) =
  assoc_to_yojson
    [
      ("ApiKeyName", Some (auth_header_parameters_to_yojson x.api_key_name));
      ("ApiKeyValue", Some (auth_header_parameters_sensitive_to_yojson x.api_key_value));
    ]

let create_connection_o_auth_client_request_parameters_to_yojson
    (x : create_connection_o_auth_client_request_parameters) =
  assoc_to_yojson
    [
      ("ClientID", Some (auth_header_parameters_to_yojson x.client_i_d));
      ("ClientSecret", Some (auth_header_parameters_sensitive_to_yojson x.client_secret));
    ]

let create_connection_o_auth_request_parameters_to_yojson
    (x : create_connection_o_auth_request_parameters) =
  assoc_to_yojson
    [
      ( "ClientParameters",
        Some (create_connection_o_auth_client_request_parameters_to_yojson x.client_parameters) );
      ("AuthorizationEndpoint", Some (https_endpoint_to_yojson x.authorization_endpoint));
      ("HttpMethod", Some (connection_o_auth_http_method_to_yojson x.http_method));
      ( "OAuthHttpParameters",
        option_to_yojson connection_http_parameters_to_yojson x.o_auth_http_parameters );
    ]

let create_connection_basic_auth_request_parameters_to_yojson
    (x : create_connection_basic_auth_request_parameters) =
  assoc_to_yojson
    [
      ("Username", Some (auth_header_parameters_to_yojson x.username));
      ("Password", Some (auth_header_parameters_sensitive_to_yojson x.password));
    ]

let create_connection_auth_request_parameters_to_yojson
    (x : create_connection_auth_request_parameters) =
  assoc_to_yojson
    [
      ( "BasicAuthParameters",
        option_to_yojson create_connection_basic_auth_request_parameters_to_yojson
          x.basic_auth_parameters );
      ( "OAuthParameters",
        option_to_yojson create_connection_o_auth_request_parameters_to_yojson x.o_auth_parameters
      );
      ( "ApiKeyAuthParameters",
        option_to_yojson create_connection_api_key_auth_request_parameters_to_yojson
          x.api_key_auth_parameters );
      ( "InvocationHttpParameters",
        option_to_yojson connection_http_parameters_to_yojson x.invocation_http_parameters );
    ]

let create_connection_request_to_yojson (x : create_connection_request) =
  assoc_to_yojson
    [
      ("Name", Some (connection_name_to_yojson x.name));
      ("Description", option_to_yojson connection_description_to_yojson x.description);
      ("AuthorizationType", Some (connection_authorization_type_to_yojson x.authorization_type));
      ( "AuthParameters",
        Some (create_connection_auth_request_parameters_to_yojson x.auth_parameters) );
    ]

let create_archive_response_to_yojson (x : create_archive_response) =
  assoc_to_yojson
    [
      ("ArchiveArn", option_to_yojson archive_arn_to_yojson x.archive_arn);
      ("State", option_to_yojson archive_state_to_yojson x.state);
      ("StateReason", option_to_yojson archive_state_reason_to_yojson x.state_reason);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
    ]

let create_archive_request_to_yojson (x : create_archive_request) =
  assoc_to_yojson
    [
      ("ArchiveName", Some (archive_name_to_yojson x.archive_name));
      ("EventSourceArn", Some (arn_to_yojson x.event_source_arn));
      ("Description", option_to_yojson archive_description_to_yojson x.description);
      ("EventPattern", option_to_yojson event_pattern_to_yojson x.event_pattern);
      ("RetentionDays", option_to_yojson retention_days_to_yojson x.retention_days);
    ]

let create_api_destination_response_to_yojson (x : create_api_destination_response) =
  assoc_to_yojson
    [
      ("ApiDestinationArn", option_to_yojson api_destination_arn_to_yojson x.api_destination_arn);
      ( "ApiDestinationState",
        option_to_yojson api_destination_state_to_yojson x.api_destination_state );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let create_api_destination_request_to_yojson (x : create_api_destination_request) =
  assoc_to_yojson
    [
      ("Name", Some (api_destination_name_to_yojson x.name));
      ("Description", option_to_yojson api_destination_description_to_yojson x.description);
      ("ConnectionArn", Some (connection_arn_to_yojson x.connection_arn));
      ("InvocationEndpoint", Some (https_endpoint_to_yojson x.invocation_endpoint));
      ("HttpMethod", Some (api_destination_http_method_to_yojson x.http_method));
      ( "InvocationRateLimitPerSecond",
        option_to_yojson api_destination_invocation_rate_limit_per_second_to_yojson
          x.invocation_rate_limit_per_second );
    ]

let illegal_status_exception_to_yojson (x : illegal_status_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let cancel_replay_response_to_yojson (x : cancel_replay_response) =
  assoc_to_yojson
    [
      ("ReplayArn", option_to_yojson replay_arn_to_yojson x.replay_arn);
      ("State", option_to_yojson replay_state_to_yojson x.state);
      ("StateReason", option_to_yojson replay_state_reason_to_yojson x.state_reason);
    ]

let cancel_replay_request_to_yojson (x : cancel_replay_request) =
  assoc_to_yojson [ ("ReplayName", Some (replay_name_to_yojson x.replay_name)) ]

let activate_event_source_request_to_yojson (x : activate_event_source_request) =
  assoc_to_yojson [ ("Name", Some (event_source_name_to_yojson x.name)) ]
