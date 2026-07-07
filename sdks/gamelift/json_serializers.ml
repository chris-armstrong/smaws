open Smaws_Lib.Json.SerializeHelpers
open Types

let zip_blob_to_yojson = blob_to_yojson

let zero_capacity_strategy_to_yojson (x : zero_capacity_strategy) =
  match x with
  | SCALE_TO_AND_FROM_ZERO -> `String "SCALE_TO_AND_FROM_ZERO"
  | MANUAL -> `String "MANUAL"

let whole_number_long_to_yojson = long_to_yojson
let whole_number_to_yojson = int_to_yojson
let weighted_capacity_to_yojson = string_to_yojson
let vpc_subnet_to_yojson = string_to_yojson
let vpc_subnets_to_yojson tree = list_to_yojson vpc_subnet_to_yojson tree
let non_zero_and_max_string_to_yojson = string_to_yojson

let vpc_peering_connection_status_to_yojson (x : vpc_peering_connection_status) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson non_zero_and_max_string_to_yojson x.message);
      ("Code", option_to_yojson non_zero_and_max_string_to_yojson x.code);
    ]

let fleet_id_to_yojson = string_to_yojson
let fleet_arn_to_yojson = string_to_yojson

let vpc_peering_connection_to_yojson (x : vpc_peering_connection) =
  assoc_to_yojson
    [
      ("GameLiftVpcId", option_to_yojson non_zero_and_max_string_to_yojson x.game_lift_vpc_id);
      ("PeerVpcId", option_to_yojson non_zero_and_max_string_to_yojson x.peer_vpc_id);
      ("Status", option_to_yojson vpc_peering_connection_status_to_yojson x.status);
      ( "VpcPeeringConnectionId",
        option_to_yojson non_zero_and_max_string_to_yojson x.vpc_peering_connection_id );
      ("IpV4CidrBlock", option_to_yojson non_zero_and_max_string_to_yojson x.ip_v4_cidr_block);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let vpc_peering_connection_list_to_yojson tree =
  list_to_yojson vpc_peering_connection_to_yojson tree

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let vpc_peering_authorization_to_yojson (x : vpc_peering_authorization) =
  assoc_to_yojson
    [
      ("ExpirationTime", option_to_yojson timestamp_to_yojson x.expiration_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("PeerVpcId", option_to_yojson non_zero_and_max_string_to_yojson x.peer_vpc_id);
      ( "PeerVpcAwsAccountId",
        option_to_yojson non_zero_and_max_string_to_yojson x.peer_vpc_aws_account_id );
      ( "GameLiftAwsAccountId",
        option_to_yojson non_zero_and_max_string_to_yojson x.game_lift_aws_account_id );
    ]

let vpc_peering_authorization_list_to_yojson tree =
  list_to_yojson vpc_peering_authorization_to_yojson tree

let boolean_model_to_yojson = bool_to_yojson

let validate_matchmaking_rule_set_output_to_yojson (x : validate_matchmaking_rule_set_output) =
  assoc_to_yojson [ ("Valid", option_to_yojson boolean_model_to_yojson x.valid) ]

let rule_set_body_to_yojson = string_to_yojson

let validate_matchmaking_rule_set_input_to_yojson (x : validate_matchmaking_rule_set_input) =
  assoc_to_yojson [ ("RuleSetBody", Some (rule_set_body_to_yojson x.rule_set_body)) ]

let non_empty_string_to_yojson = string_to_yojson

let unsupported_region_exception_to_yojson (x : unsupported_region_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let internal_service_exception_to_yojson (x : internal_service_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let script_id_to_yojson = string_to_yojson
let script_arn_to_yojson = string_to_yojson

let s3_location_to_yojson (x : s3_location) =
  assoc_to_yojson
    [
      ("ObjectVersion", option_to_yojson non_empty_string_to_yojson x.object_version);
      ("RoleArn", option_to_yojson non_empty_string_to_yojson x.role_arn);
      ("Key", option_to_yojson non_empty_string_to_yojson x.key);
      ("Bucket", option_to_yojson non_empty_string_to_yojson x.bucket);
    ]

let node_js_version_to_yojson = string_to_yojson

let script_to_yojson (x : script) =
  assoc_to_yojson
    [
      ("NodeJsVersion", option_to_yojson node_js_version_to_yojson x.node_js_version);
      ("StorageLocation", option_to_yojson s3_location_to_yojson x.storage_location);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("SizeOnDisk", option_to_yojson whole_number_long_to_yojson x.size_on_disk);
      ("Version", option_to_yojson non_zero_and_max_string_to_yojson x.version);
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("ScriptArn", option_to_yojson script_arn_to_yojson x.script_arn);
      ("ScriptId", option_to_yojson script_id_to_yojson x.script_id);
    ]

let update_script_output_to_yojson (x : update_script_output) =
  assoc_to_yojson [ ("Script", option_to_yojson script_to_yojson x.script) ]

let script_id_or_arn_to_yojson = string_to_yojson

let update_script_input_to_yojson (x : update_script_input) =
  assoc_to_yojson
    [
      ("ZipFile", option_to_yojson zip_blob_to_yojson x.zip_file);
      ("StorageLocation", option_to_yojson s3_location_to_yojson x.storage_location);
      ("Version", option_to_yojson non_zero_and_max_string_to_yojson x.version);
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("ScriptId", Some (script_id_or_arn_to_yojson x.script_id));
    ]

let unauthorized_exception_to_yojson (x : unauthorized_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let not_found_exception_to_yojson (x : not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let launch_path_string_model_to_yojson = string_to_yojson
let launch_parameters_string_model_to_yojson = string_to_yojson
let positive_integer_to_yojson = int_to_yojson

let server_process_to_yojson (x : server_process) =
  assoc_to_yojson
    [
      ("ConcurrentExecutions", Some (positive_integer_to_yojson x.concurrent_executions));
      ("Parameters", option_to_yojson launch_parameters_string_model_to_yojson x.parameters);
      ("LaunchPath", Some (launch_path_string_model_to_yojson x.launch_path));
    ]

let server_process_list_to_yojson tree = list_to_yojson server_process_to_yojson tree
let max_concurrent_game_session_activations_to_yojson = int_to_yojson
let game_session_activation_timeout_seconds_to_yojson = int_to_yojson

let runtime_configuration_to_yojson (x : runtime_configuration) =
  assoc_to_yojson
    [
      ( "GameSessionActivationTimeoutSeconds",
        option_to_yojson game_session_activation_timeout_seconds_to_yojson
          x.game_session_activation_timeout_seconds );
      ( "MaxConcurrentGameSessionActivations",
        option_to_yojson max_concurrent_game_session_activations_to_yojson
          x.max_concurrent_game_session_activations );
      ("ServerProcesses", option_to_yojson server_process_list_to_yojson x.server_processes);
    ]

let update_runtime_configuration_output_to_yojson (x : update_runtime_configuration_output) =
  assoc_to_yojson
    [
      ( "RuntimeConfiguration",
        option_to_yojson runtime_configuration_to_yojson x.runtime_configuration );
    ]

let fleet_id_or_arn_to_yojson = string_to_yojson

let update_runtime_configuration_input_to_yojson (x : update_runtime_configuration_input) =
  assoc_to_yojson
    [
      ("RuntimeConfiguration", Some (runtime_configuration_to_yojson x.runtime_configuration));
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let invalid_fleet_status_exception_to_yojson (x : invalid_fleet_status_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let matchmaking_id_string_model_to_yojson = string_to_yojson
let matchmaking_configuration_arn_to_yojson = string_to_yojson
let arn_string_model_to_yojson = string_to_yojson
let queue_arns_list_to_yojson tree = list_to_yojson arn_string_model_to_yojson tree
let matchmaking_request_timeout_integer_to_yojson = int_to_yojson
let matchmaking_acceptance_timeout_integer_to_yojson = int_to_yojson
let matchmaking_rule_set_arn_to_yojson = string_to_yojson
let sns_arn_string_model_to_yojson = string_to_yojson
let custom_event_data_to_yojson = string_to_yojson
let game_property_key_to_yojson = string_to_yojson
let game_property_value_to_yojson = string_to_yojson

let game_property_to_yojson (x : game_property) =
  assoc_to_yojson
    [
      ("Value", Some (game_property_value_to_yojson x.value));
      ("Key", Some (game_property_key_to_yojson x.key));
    ]

let game_property_list_to_yojson tree = list_to_yojson game_property_to_yojson tree
let game_session_data_to_yojson = string_to_yojson

let backfill_mode_to_yojson (x : backfill_mode) =
  match x with MANUAL -> `String "MANUAL" | AUTOMATIC -> `String "AUTOMATIC"

let flex_match_mode_to_yojson (x : flex_match_mode) =
  match x with WITH_QUEUE -> `String "WITH_QUEUE" | STANDALONE -> `String "STANDALONE"

let matchmaking_configuration_to_yojson (x : matchmaking_configuration) =
  assoc_to_yojson
    [
      ("FlexMatchMode", option_to_yojson flex_match_mode_to_yojson x.flex_match_mode);
      ("BackfillMode", option_to_yojson backfill_mode_to_yojson x.backfill_mode);
      ("GameSessionData", option_to_yojson game_session_data_to_yojson x.game_session_data);
      ("GameProperties", option_to_yojson game_property_list_to_yojson x.game_properties);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CustomEventData", option_to_yojson custom_event_data_to_yojson x.custom_event_data);
      ("AdditionalPlayerCount", option_to_yojson whole_number_to_yojson x.additional_player_count);
      ("NotificationTarget", option_to_yojson sns_arn_string_model_to_yojson x.notification_target);
      ("RuleSetArn", option_to_yojson matchmaking_rule_set_arn_to_yojson x.rule_set_arn);
      ("RuleSetName", option_to_yojson matchmaking_id_string_model_to_yojson x.rule_set_name);
      ("AcceptanceRequired", option_to_yojson boolean_model_to_yojson x.acceptance_required);
      ( "AcceptanceTimeoutSeconds",
        option_to_yojson matchmaking_acceptance_timeout_integer_to_yojson
          x.acceptance_timeout_seconds );
      ( "RequestTimeoutSeconds",
        option_to_yojson matchmaking_request_timeout_integer_to_yojson x.request_timeout_seconds );
      ("GameSessionQueueArns", option_to_yojson queue_arns_list_to_yojson x.game_session_queue_arns);
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ( "ConfigurationArn",
        option_to_yojson matchmaking_configuration_arn_to_yojson x.configuration_arn );
      ("Name", option_to_yojson matchmaking_id_string_model_to_yojson x.name);
    ]

let update_matchmaking_configuration_output_to_yojson (x : update_matchmaking_configuration_output)
    =
  assoc_to_yojson
    [ ("Configuration", option_to_yojson matchmaking_configuration_to_yojson x.configuration) ]

let matchmaking_configuration_name_to_yojson = string_to_yojson
let matchmaking_rule_set_name_to_yojson = string_to_yojson

let update_matchmaking_configuration_input_to_yojson (x : update_matchmaking_configuration_input) =
  assoc_to_yojson
    [
      ("FlexMatchMode", option_to_yojson flex_match_mode_to_yojson x.flex_match_mode);
      ("BackfillMode", option_to_yojson backfill_mode_to_yojson x.backfill_mode);
      ("GameSessionData", option_to_yojson game_session_data_to_yojson x.game_session_data);
      ("GameProperties", option_to_yojson game_property_list_to_yojson x.game_properties);
      ("CustomEventData", option_to_yojson custom_event_data_to_yojson x.custom_event_data);
      ("AdditionalPlayerCount", option_to_yojson whole_number_to_yojson x.additional_player_count);
      ("NotificationTarget", option_to_yojson sns_arn_string_model_to_yojson x.notification_target);
      ("RuleSetName", option_to_yojson matchmaking_rule_set_name_to_yojson x.rule_set_name);
      ("AcceptanceRequired", option_to_yojson boolean_model_to_yojson x.acceptance_required);
      ( "AcceptanceTimeoutSeconds",
        option_to_yojson matchmaking_acceptance_timeout_integer_to_yojson
          x.acceptance_timeout_seconds );
      ( "RequestTimeoutSeconds",
        option_to_yojson matchmaking_request_timeout_integer_to_yojson x.request_timeout_seconds );
      ("GameSessionQueueArns", option_to_yojson queue_arns_list_to_yojson x.game_session_queue_arns);
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("Name", Some (matchmaking_configuration_name_to_yojson x.name));
    ]

let game_session_queue_name_to_yojson = string_to_yojson
let game_session_queue_arn_to_yojson = string_to_yojson

let player_latency_policy_to_yojson (x : player_latency_policy) =
  assoc_to_yojson
    [
      ("PolicyDurationSeconds", option_to_yojson whole_number_to_yojson x.policy_duration_seconds);
      ( "MaximumIndividualPlayerLatencyMilliseconds",
        option_to_yojson whole_number_to_yojson x.maximum_individual_player_latency_milliseconds );
    ]

let player_latency_policy_list_to_yojson tree = list_to_yojson player_latency_policy_to_yojson tree

let game_session_queue_destination_to_yojson (x : game_session_queue_destination) =
  assoc_to_yojson
    [ ("DestinationArn", option_to_yojson arn_string_model_to_yojson x.destination_arn) ]

let game_session_queue_destination_list_to_yojson tree =
  list_to_yojson game_session_queue_destination_to_yojson tree

let location_string_model_to_yojson = string_to_yojson
let location_list_to_yojson tree = list_to_yojson location_string_model_to_yojson tree

let filter_configuration_to_yojson (x : filter_configuration) =
  assoc_to_yojson
    [ ("AllowedLocations", option_to_yojson location_list_to_yojson x.allowed_locations) ]

let priority_type_to_yojson (x : priority_type) =
  match x with
  | LOCATION -> `String "LOCATION"
  | DESTINATION -> `String "DESTINATION"
  | COST -> `String "COST"
  | LATENCY -> `String "LATENCY"

let priority_type_list_to_yojson tree = list_to_yojson priority_type_to_yojson tree

let priority_configuration_to_yojson (x : priority_configuration) =
  assoc_to_yojson
    [
      ("LocationOrder", option_to_yojson location_list_to_yojson x.location_order);
      ("PriorityOrder", option_to_yojson priority_type_list_to_yojson x.priority_order);
    ]

let queue_custom_event_data_to_yojson = string_to_yojson
let queue_sns_arn_string_model_to_yojson = string_to_yojson

let game_session_queue_to_yojson (x : game_session_queue) =
  assoc_to_yojson
    [
      ( "NotificationTarget",
        option_to_yojson queue_sns_arn_string_model_to_yojson x.notification_target );
      ("CustomEventData", option_to_yojson queue_custom_event_data_to_yojson x.custom_event_data);
      ( "PriorityConfiguration",
        option_to_yojson priority_configuration_to_yojson x.priority_configuration );
      ("FilterConfiguration", option_to_yojson filter_configuration_to_yojson x.filter_configuration);
      ("Destinations", option_to_yojson game_session_queue_destination_list_to_yojson x.destinations);
      ( "PlayerLatencyPolicies",
        option_to_yojson player_latency_policy_list_to_yojson x.player_latency_policies );
      ("TimeoutInSeconds", option_to_yojson whole_number_to_yojson x.timeout_in_seconds);
      ( "GameSessionQueueArn",
        option_to_yojson game_session_queue_arn_to_yojson x.game_session_queue_arn );
      ("Name", option_to_yojson game_session_queue_name_to_yojson x.name);
    ]

let update_game_session_queue_output_to_yojson (x : update_game_session_queue_output) =
  assoc_to_yojson
    [ ("GameSessionQueue", option_to_yojson game_session_queue_to_yojson x.game_session_queue) ]

let game_session_queue_name_or_arn_to_yojson = string_to_yojson

let update_game_session_queue_input_to_yojson (x : update_game_session_queue_input) =
  assoc_to_yojson
    [
      ( "NotificationTarget",
        option_to_yojson queue_sns_arn_string_model_to_yojson x.notification_target );
      ("CustomEventData", option_to_yojson queue_custom_event_data_to_yojson x.custom_event_data);
      ( "PriorityConfiguration",
        option_to_yojson priority_configuration_to_yojson x.priority_configuration );
      ("FilterConfiguration", option_to_yojson filter_configuration_to_yojson x.filter_configuration);
      ("Destinations", option_to_yojson game_session_queue_destination_list_to_yojson x.destinations);
      ( "PlayerLatencyPolicies",
        option_to_yojson player_latency_policy_list_to_yojson x.player_latency_policies );
      ("TimeoutInSeconds", option_to_yojson whole_number_to_yojson x.timeout_in_seconds);
      ("Name", Some (game_session_queue_name_or_arn_to_yojson x.name));
    ]

let game_session_status_to_yojson (x : game_session_status) =
  match x with
  | ERROR -> `String "ERROR"
  | TERMINATING -> `String "TERMINATING"
  | TERMINATED -> `String "TERMINATED"
  | ACTIVATING -> `String "ACTIVATING"
  | ACTIVE -> `String "ACTIVE"

let game_session_status_reason_to_yojson (x : game_session_status_reason) =
  match x with
  | FORCE_TERMINATED -> `String "FORCE_TERMINATED"
  | TRIGGERED_ON_PROCESS_TERMINATE -> `String "TRIGGERED_ON_PROCESS_TERMINATE"
  | INTERRUPTED -> `String "INTERRUPTED"

let ip_address_to_yojson = string_to_yojson
let dns_name_to_yojson = string_to_yojson
let port_number_to_yojson = int_to_yojson

let player_session_creation_policy_to_yojson (x : player_session_creation_policy) =
  match x with DENY_ALL -> `String "DENY_ALL" | ACCEPT_ALL -> `String "ACCEPT_ALL"

let large_game_session_data_to_yojson = string_to_yojson
let matchmaker_data_to_yojson = string_to_yojson
let compute_name_to_yojson = string_to_yojson

let player_gateway_status_to_yojson (x : player_gateway_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let game_session_to_yojson (x : game_session) =
  assoc_to_yojson
    [
      ( "PlayerGatewayStatus",
        option_to_yojson player_gateway_status_to_yojson x.player_gateway_status );
      ("ComputeName", option_to_yojson compute_name_to_yojson x.compute_name);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("MatchmakerData", option_to_yojson matchmaker_data_to_yojson x.matchmaker_data);
      ("GameSessionData", option_to_yojson large_game_session_data_to_yojson x.game_session_data);
      ("CreatorId", option_to_yojson non_zero_and_max_string_to_yojson x.creator_id);
      ( "PlayerSessionCreationPolicy",
        option_to_yojson player_session_creation_policy_to_yojson x.player_session_creation_policy
      );
      ("Port", option_to_yojson port_number_to_yojson x.port);
      ("DnsName", option_to_yojson dns_name_to_yojson x.dns_name);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("GameProperties", option_to_yojson game_property_list_to_yojson x.game_properties);
      ("StatusReason", option_to_yojson game_session_status_reason_to_yojson x.status_reason);
      ("Status", option_to_yojson game_session_status_to_yojson x.status);
      ( "MaximumPlayerSessionCount",
        option_to_yojson whole_number_to_yojson x.maximum_player_session_count );
      ( "CurrentPlayerSessionCount",
        option_to_yojson whole_number_to_yojson x.current_player_session_count );
      ("TerminationTime", option_to_yojson timestamp_to_yojson x.termination_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("GameSessionId", option_to_yojson non_zero_and_max_string_to_yojson x.game_session_id);
    ]

let update_game_session_output_to_yojson (x : update_game_session_output) =
  assoc_to_yojson [ ("GameSession", option_to_yojson game_session_to_yojson x.game_session) ]

let protection_policy_to_yojson (x : protection_policy) =
  match x with FullProtection -> `String "FullProtection" | NoProtection -> `String "NoProtection"

let update_game_session_input_to_yojson (x : update_game_session_input) =
  assoc_to_yojson
    [
      ("GameProperties", option_to_yojson game_property_list_to_yojson x.game_properties);
      ("ProtectionPolicy", option_to_yojson protection_policy_to_yojson x.protection_policy);
      ( "PlayerSessionCreationPolicy",
        option_to_yojson player_session_creation_policy_to_yojson x.player_session_creation_policy
      );
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ( "MaximumPlayerSessionCount",
        option_to_yojson whole_number_to_yojson x.maximum_player_session_count );
      ("GameSessionId", Some (arn_string_model_to_yojson x.game_session_id));
    ]

let not_ready_exception_to_yojson (x : not_ready_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let invalid_game_session_status_exception_to_yojson (x : invalid_game_session_status_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let game_server_group_name_to_yojson = string_to_yojson
let game_server_group_arn_to_yojson = string_to_yojson
let game_server_id_to_yojson = string_to_yojson
let game_server_instance_id_to_yojson = string_to_yojson
let game_server_connection_info_to_yojson = string_to_yojson
let game_server_data_to_yojson = string_to_yojson

let game_server_claim_status_to_yojson (x : game_server_claim_status) =
  match x with CLAIMED -> `String "CLAIMED"

let game_server_utilization_status_to_yojson (x : game_server_utilization_status) =
  match x with UTILIZED -> `String "UTILIZED" | AVAILABLE -> `String "AVAILABLE"

let game_server_to_yojson (x : game_server) =
  assoc_to_yojson
    [
      ("LastHealthCheckTime", option_to_yojson timestamp_to_yojson x.last_health_check_time);
      ("LastClaimTime", option_to_yojson timestamp_to_yojson x.last_claim_time);
      ("RegistrationTime", option_to_yojson timestamp_to_yojson x.registration_time);
      ( "UtilizationStatus",
        option_to_yojson game_server_utilization_status_to_yojson x.utilization_status );
      ("ClaimStatus", option_to_yojson game_server_claim_status_to_yojson x.claim_status);
      ("GameServerData", option_to_yojson game_server_data_to_yojson x.game_server_data);
      ("ConnectionInfo", option_to_yojson game_server_connection_info_to_yojson x.connection_info);
      ("InstanceId", option_to_yojson game_server_instance_id_to_yojson x.instance_id);
      ("GameServerId", option_to_yojson game_server_id_to_yojson x.game_server_id);
      ( "GameServerGroupArn",
        option_to_yojson game_server_group_arn_to_yojson x.game_server_group_arn );
      ( "GameServerGroupName",
        option_to_yojson game_server_group_name_to_yojson x.game_server_group_name );
    ]

let update_game_server_output_to_yojson (x : update_game_server_output) =
  assoc_to_yojson [ ("GameServer", option_to_yojson game_server_to_yojson x.game_server) ]

let game_server_group_name_or_arn_to_yojson = string_to_yojson

let game_server_health_check_to_yojson (x : game_server_health_check) =
  match x with HEALTHY -> `String "HEALTHY"

let update_game_server_input_to_yojson (x : update_game_server_input) =
  assoc_to_yojson
    [
      ("HealthCheck", option_to_yojson game_server_health_check_to_yojson x.health_check);
      ( "UtilizationStatus",
        option_to_yojson game_server_utilization_status_to_yojson x.utilization_status );
      ("GameServerData", option_to_yojson game_server_data_to_yojson x.game_server_data);
      ("GameServerId", Some (game_server_id_to_yojson x.game_server_id));
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
    ]

let iam_role_arn_to_yojson = string_to_yojson

let game_server_group_instance_type_to_yojson (x : game_server_group_instance_type) =
  match x with
  | M6g_16xlarge -> `String "m6g.16xlarge"
  | M6g_12xlarge -> `String "m6g.12xlarge"
  | M6g_8xlarge -> `String "m6g.8xlarge"
  | M6g_4xlarge -> `String "m6g.4xlarge"
  | M6g_2xlarge -> `String "m6g.2xlarge"
  | M6g_xlarge -> `String "m6g.xlarge"
  | M6g_large -> `String "m6g.large"
  | M6g_medium -> `String "m6g.medium"
  | M5a_24xlarge -> `String "m5a.24xlarge"
  | M5a_16xlarge -> `String "m5a.16xlarge"
  | M5a_12xlarge -> `String "m5a.12xlarge"
  | M5a_8xlarge -> `String "m5a.8xlarge"
  | M5a_4xlarge -> `String "m5a.4xlarge"
  | M5a_2xlarge -> `String "m5a.2xlarge"
  | M5a_xlarge -> `String "m5a.xlarge"
  | M5a_large -> `String "m5a.large"
  | M5_24xlarge -> `String "m5.24xlarge"
  | M5_16xlarge -> `String "m5.16xlarge"
  | M5_12xlarge -> `String "m5.12xlarge"
  | M5_8xlarge -> `String "m5.8xlarge"
  | M5_4xlarge -> `String "m5.4xlarge"
  | M5_2xlarge -> `String "m5.2xlarge"
  | M5_xlarge -> `String "m5.xlarge"
  | M5_large -> `String "m5.large"
  | M4_10xlarge -> `String "m4.10xlarge"
  | M4_4xlarge -> `String "m4.4xlarge"
  | M4_2xlarge -> `String "m4.2xlarge"
  | M4_xlarge -> `String "m4.xlarge"
  | M4_large -> `String "m4.large"
  | R6g_16xlarge -> `String "r6g.16xlarge"
  | R6g_12xlarge -> `String "r6g.12xlarge"
  | R6g_8xlarge -> `String "r6g.8xlarge"
  | R6g_4xlarge -> `String "r6g.4xlarge"
  | R6g_2xlarge -> `String "r6g.2xlarge"
  | R6g_xlarge -> `String "r6g.xlarge"
  | R6g_large -> `String "r6g.large"
  | R6g_medium -> `String "r6g.medium"
  | R5a_24xlarge -> `String "r5a.24xlarge"
  | R5a_16xlarge -> `String "r5a.16xlarge"
  | R5a_12xlarge -> `String "r5a.12xlarge"
  | R5a_8xlarge -> `String "r5a.8xlarge"
  | R5a_4xlarge -> `String "r5a.4xlarge"
  | R5a_2xlarge -> `String "r5a.2xlarge"
  | R5a_xlarge -> `String "r5a.xlarge"
  | R5a_large -> `String "r5a.large"
  | R5_24xlarge -> `String "r5.24xlarge"
  | R5_16xlarge -> `String "r5.16xlarge"
  | R5_12xlarge -> `String "r5.12xlarge"
  | R5_8xlarge -> `String "r5.8xlarge"
  | R5_4xlarge -> `String "r5.4xlarge"
  | R5_2xlarge -> `String "r5.2xlarge"
  | R5_xlarge -> `String "r5.xlarge"
  | R5_large -> `String "r5.large"
  | R4_16xlarge -> `String "r4.16xlarge"
  | R4_8xlarge -> `String "r4.8xlarge"
  | R4_4xlarge -> `String "r4.4xlarge"
  | R4_2xlarge -> `String "r4.2xlarge"
  | R4_xlarge -> `String "r4.xlarge"
  | R4_large -> `String "r4.large"
  | C6g_16xlarge -> `String "c6g.16xlarge"
  | C6g_12xlarge -> `String "c6g.12xlarge"
  | C6g_8xlarge -> `String "c6g.8xlarge"
  | C6g_4xlarge -> `String "c6g.4xlarge"
  | C6g_2xlarge -> `String "c6g.2xlarge"
  | C6g_xlarge -> `String "c6g.xlarge"
  | C6g_large -> `String "c6g.large"
  | C6g_medium -> `String "c6g.medium"
  | C5a_24xlarge -> `String "c5a.24xlarge"
  | C5a_16xlarge -> `String "c5a.16xlarge"
  | C5a_12xlarge -> `String "c5a.12xlarge"
  | C5a_8xlarge -> `String "c5a.8xlarge"
  | C5a_4xlarge -> `String "c5a.4xlarge"
  | C5a_2xlarge -> `String "c5a.2xlarge"
  | C5a_xlarge -> `String "c5a.xlarge"
  | C5a_large -> `String "c5a.large"
  | C5_24xlarge -> `String "c5.24xlarge"
  | C5_18xlarge -> `String "c5.18xlarge"
  | C5_12xlarge -> `String "c5.12xlarge"
  | C5_9xlarge -> `String "c5.9xlarge"
  | C5_4xlarge -> `String "c5.4xlarge"
  | C5_2xlarge -> `String "c5.2xlarge"
  | C5_xlarge -> `String "c5.xlarge"
  | C5_large -> `String "c5.large"
  | C4_8xlarge -> `String "c4.8xlarge"
  | C4_4xlarge -> `String "c4.4xlarge"
  | C4_2xlarge -> `String "c4.2xlarge"
  | C4_xlarge -> `String "c4.xlarge"
  | C4_large -> `String "c4.large"

let instance_definition_to_yojson (x : instance_definition) =
  assoc_to_yojson
    [
      ("WeightedCapacity", option_to_yojson weighted_capacity_to_yojson x.weighted_capacity);
      ("InstanceType", Some (game_server_group_instance_type_to_yojson x.instance_type));
    ]

let instance_definitions_to_yojson tree = list_to_yojson instance_definition_to_yojson tree

let balancing_strategy_to_yojson (x : balancing_strategy) =
  match x with
  | ON_DEMAND_ONLY -> `String "ON_DEMAND_ONLY"
  | SPOT_PREFERRED -> `String "SPOT_PREFERRED"
  | SPOT_ONLY -> `String "SPOT_ONLY"

let game_server_protection_policy_to_yojson (x : game_server_protection_policy) =
  match x with
  | FULL_PROTECTION -> `String "FULL_PROTECTION"
  | NO_PROTECTION -> `String "NO_PROTECTION"

let auto_scaling_group_arn_to_yojson = string_to_yojson

let game_server_group_status_to_yojson (x : game_server_group_status) =
  match x with
  | ERROR -> `String "ERROR"
  | DELETED -> `String "DELETED"
  | DELETING -> `String "DELETING"
  | DELETE_SCHEDULED -> `String "DELETE_SCHEDULED"
  | ACTIVE -> `String "ACTIVE"
  | ACTIVATING -> `String "ACTIVATING"
  | NEW -> `String "NEW"

let game_server_group_action_to_yojson (x : game_server_group_action) =
  match x with REPLACE_INSTANCE_TYPES -> `String "REPLACE_INSTANCE_TYPES"

let game_server_group_actions_to_yojson tree =
  list_to_yojson game_server_group_action_to_yojson tree

let game_server_group_to_yojson (x : game_server_group) =
  assoc_to_yojson
    [
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("SuspendedActions", option_to_yojson game_server_group_actions_to_yojson x.suspended_actions);
      ("StatusReason", option_to_yojson non_zero_and_max_string_to_yojson x.status_reason);
      ("Status", option_to_yojson game_server_group_status_to_yojson x.status);
      ( "AutoScalingGroupArn",
        option_to_yojson auto_scaling_group_arn_to_yojson x.auto_scaling_group_arn );
      ( "GameServerProtectionPolicy",
        option_to_yojson game_server_protection_policy_to_yojson x.game_server_protection_policy );
      ("BalancingStrategy", option_to_yojson balancing_strategy_to_yojson x.balancing_strategy);
      ("InstanceDefinitions", option_to_yojson instance_definitions_to_yojson x.instance_definitions);
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ( "GameServerGroupArn",
        option_to_yojson game_server_group_arn_to_yojson x.game_server_group_arn );
      ( "GameServerGroupName",
        option_to_yojson game_server_group_name_to_yojson x.game_server_group_name );
    ]

let update_game_server_group_output_to_yojson (x : update_game_server_group_output) =
  assoc_to_yojson
    [ ("GameServerGroup", option_to_yojson game_server_group_to_yojson x.game_server_group) ]

let update_game_server_group_input_to_yojson (x : update_game_server_group_input) =
  assoc_to_yojson
    [
      ("BalancingStrategy", option_to_yojson balancing_strategy_to_yojson x.balancing_strategy);
      ( "GameServerProtectionPolicy",
        option_to_yojson game_server_protection_policy_to_yojson x.game_server_protection_policy );
      ("InstanceDefinitions", option_to_yojson instance_definitions_to_yojson x.instance_definitions);
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
    ]

let update_fleet_port_settings_output_to_yojson (x : update_fleet_port_settings_output) =
  assoc_to_yojson
    [
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let ip_range_to_yojson = string_to_yojson

let ip_protocol_to_yojson (x : ip_protocol) =
  match x with UDP -> `String "UDP" | TCP -> `String "TCP"

let ip_permission_to_yojson (x : ip_permission) =
  assoc_to_yojson
    [
      ("Protocol", Some (ip_protocol_to_yojson x.protocol));
      ("IpRange", Some (ip_range_to_yojson x.ip_range));
      ("ToPort", Some (port_number_to_yojson x.to_port));
      ("FromPort", Some (port_number_to_yojson x.from_port));
    ]

let ip_permissions_list_to_yojson tree = list_to_yojson ip_permission_to_yojson tree

let update_fleet_port_settings_input_to_yojson (x : update_fleet_port_settings_input) =
  assoc_to_yojson
    [
      ( "InboundPermissionRevocations",
        option_to_yojson ip_permissions_list_to_yojson x.inbound_permission_revocations );
      ( "InboundPermissionAuthorizations",
        option_to_yojson ip_permissions_list_to_yojson x.inbound_permission_authorizations );
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let scale_in_after_inactivity_minutes_to_yojson = int_to_yojson

let managed_capacity_configuration_to_yojson (x : managed_capacity_configuration) =
  assoc_to_yojson
    [
      ( "ScaleInAfterInactivityMinutes",
        option_to_yojson scale_in_after_inactivity_minutes_to_yojson
          x.scale_in_after_inactivity_minutes );
      ( "ZeroCapacityStrategy",
        option_to_yojson zero_capacity_strategy_to_yojson x.zero_capacity_strategy );
    ]

let update_fleet_capacity_output_to_yojson (x : update_fleet_capacity_output) =
  assoc_to_yojson
    [
      ( "ManagedCapacityConfiguration",
        option_to_yojson managed_capacity_configuration_to_yojson x.managed_capacity_configuration
      );
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let update_fleet_capacity_input_to_yojson (x : update_fleet_capacity_input) =
  assoc_to_yojson
    [
      ( "ManagedCapacityConfiguration",
        option_to_yojson managed_capacity_configuration_to_yojson x.managed_capacity_configuration
      );
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("MaxSize", option_to_yojson whole_number_to_yojson x.max_size);
      ("MinSize", option_to_yojson whole_number_to_yojson x.min_size);
      ("DesiredInstances", option_to_yojson whole_number_to_yojson x.desired_instances);
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let update_fleet_attributes_output_to_yojson (x : update_fleet_attributes_output) =
  assoc_to_yojson
    [
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let resource_creation_limit_policy_to_yojson (x : resource_creation_limit_policy) =
  assoc_to_yojson
    [
      ("PolicyPeriodInMinutes", option_to_yojson whole_number_to_yojson x.policy_period_in_minutes);
      ( "NewGameSessionsPerCreator",
        option_to_yojson whole_number_to_yojson x.new_game_sessions_per_creator );
    ]

let metric_group_to_yojson = string_to_yojson
let metric_group_list_to_yojson tree = list_to_yojson metric_group_to_yojson tree
let non_negative_limited_length_double_to_yojson = string_to_yojson

let anywhere_configuration_to_yojson (x : anywhere_configuration) =
  assoc_to_yojson [ ("Cost", Some (non_negative_limited_length_double_to_yojson x.cost)) ]

let update_fleet_attributes_input_to_yojson (x : update_fleet_attributes_input) =
  assoc_to_yojson
    [
      ( "AnywhereConfiguration",
        option_to_yojson anywhere_configuration_to_yojson x.anywhere_configuration );
      ("MetricGroups", option_to_yojson metric_group_list_to_yojson x.metric_groups);
      ( "ResourceCreationLimitPolicy",
        option_to_yojson resource_creation_limit_policy_to_yojson x.resource_creation_limit_policy
      );
      ( "NewGameSessionProtectionPolicy",
        option_to_yojson protection_policy_to_yojson x.new_game_session_protection_policy );
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let container_group_definition_arn_to_yojson = string_to_yojson

let container_operating_system_to_yojson (x : container_operating_system) =
  match x with AMAZON_LINUX_2023 -> `String "AMAZON_LINUX_2023"

let container_group_definition_name_to_yojson = string_to_yojson

let container_group_type_to_yojson (x : container_group_type) =
  match x with PER_INSTANCE -> `String "PER_INSTANCE" | GAME_SERVER -> `String "GAME_SERVER"

let container_total_memory_limit_to_yojson = int_to_yojson
let container_total_vcpu_limit_to_yojson = double_to_yojson
let non_zero_and128_max_ascii_string_to_yojson = string_to_yojson

let container_dependency_condition_to_yojson (x : container_dependency_condition) =
  match x with
  | HEALTHY -> `String "HEALTHY"
  | SUCCESS -> `String "SUCCESS"
  | COMPLETE -> `String "COMPLETE"
  | START -> `String "START"

let container_dependency_to_yojson (x : container_dependency) =
  assoc_to_yojson
    [
      ("Condition", Some (container_dependency_condition_to_yojson x.condition));
      ("ContainerName", Some (non_zero_and128_max_ascii_string_to_yojson x.container_name));
    ]

let container_dependency_list_to_yojson tree = list_to_yojson container_dependency_to_yojson tree
let instance_path_string_to_yojson = string_to_yojson
let container_path_string_to_yojson = string_to_yojson

let container_mount_point_access_level_to_yojson (x : container_mount_point_access_level) =
  match x with READ_AND_WRITE -> `String "READ_AND_WRITE" | READ_ONLY -> `String "READ_ONLY"

let container_mount_point_to_yojson (x : container_mount_point) =
  assoc_to_yojson
    [
      ("AccessLevel", option_to_yojson container_mount_point_access_level_to_yojson x.access_level);
      ("ContainerPath", option_to_yojson container_path_string_to_yojson x.container_path);
      ("InstancePath", Some (instance_path_string_to_yojson x.instance_path));
    ]

let container_mount_point_list_to_yojson tree = list_to_yojson container_mount_point_to_yojson tree
let non_zero_and255_max_string_to_yojson = string_to_yojson

let container_environment_to_yojson (x : container_environment) =
  assoc_to_yojson
    [
      ("Value", Some (non_zero_and255_max_string_to_yojson x.value));
      ("Name", Some (non_zero_and255_max_string_to_yojson x.name));
    ]

let container_environment_list_to_yojson tree = list_to_yojson container_environment_to_yojson tree
let image_uri_string_to_yojson = string_to_yojson

let container_port_range_to_yojson (x : container_port_range) =
  assoc_to_yojson
    [
      ("Protocol", Some (ip_protocol_to_yojson x.protocol));
      ("ToPort", Some (port_number_to_yojson x.to_port));
      ("FromPort", Some (port_number_to_yojson x.from_port));
    ]

let container_port_range_list_to_yojson tree = list_to_yojson container_port_range_to_yojson tree

let container_port_configuration_to_yojson (x : container_port_configuration) =
  assoc_to_yojson
    [ ("ContainerPortRanges", Some (container_port_range_list_to_yojson x.container_port_ranges)) ]

let sha256_to_yojson = string_to_yojson
let server_sdk_version_to_yojson = string_to_yojson

let linux_capability_to_yojson (x : linux_capability) =
  match x with
  | WAKE_ALARM -> `String "WAKE_ALARM"
  | SYSLOG -> `String "SYSLOG"
  | SYS_TTY_CONFIG -> `String "SYS_TTY_CONFIG"
  | SYS_TIME -> `String "SYS_TIME"
  | SYS_RESOURCE -> `String "SYS_RESOURCE"
  | SYS_RAWIO -> `String "SYS_RAWIO"
  | SYS_PTRACE -> `String "SYS_PTRACE"
  | SYS_PACCT -> `String "SYS_PACCT"
  | SYS_NICE -> `String "SYS_NICE"
  | SYS_MODULE -> `String "SYS_MODULE"
  | SYS_CHROOT -> `String "SYS_CHROOT"
  | SYS_BOOT -> `String "SYS_BOOT"
  | SYS_ADMIN -> `String "SYS_ADMIN"
  | SETUID -> `String "SETUID"
  | SETPCAP -> `String "SETPCAP"
  | SETGID -> `String "SETGID"
  | SETFCAP -> `String "SETFCAP"
  | NET_RAW -> `String "NET_RAW"
  | NET_BROADCAST -> `String "NET_BROADCAST"
  | NET_BIND_SERVICE -> `String "NET_BIND_SERVICE"
  | NET_ADMIN -> `String "NET_ADMIN"
  | MKNOD -> `String "MKNOD"
  | MAC_OVERRIDE -> `String "MAC_OVERRIDE"
  | MAC_ADMIN -> `String "MAC_ADMIN"
  | LINUX_IMMUTABLE -> `String "LINUX_IMMUTABLE"
  | LEASE -> `String "LEASE"
  | KILL -> `String "KILL"
  | IPC_OWNER -> `String "IPC_OWNER"
  | IPC_LOCK -> `String "IPC_LOCK"
  | FSETID -> `String "FSETID"
  | FOWNER -> `String "FOWNER"
  | DAC_READ_SEARCH -> `String "DAC_READ_SEARCH"
  | DAC_OVERRIDE -> `String "DAC_OVERRIDE"
  | CHOWN -> `String "CHOWN"
  | BLOCK_SUSPEND -> `String "BLOCK_SUSPEND"
  | AUDIT_WRITE -> `String "AUDIT_WRITE"
  | AUDIT_CONTROL -> `String "AUDIT_CONTROL"

let linux_capability_list_to_yojson tree = list_to_yojson linux_capability_to_yojson tree

let linux_capabilities_to_yojson (x : linux_capabilities) =
  assoc_to_yojson [ ("Include", option_to_yojson linux_capability_list_to_yojson x.include_) ]

let game_server_container_definition_to_yojson (x : game_server_container_definition) =
  assoc_to_yojson
    [
      ("LinuxCapabilities", option_to_yojson linux_capabilities_to_yojson x.linux_capabilities);
      ("ServerSdkVersion", option_to_yojson server_sdk_version_to_yojson x.server_sdk_version);
      ("ResolvedImageDigest", option_to_yojson sha256_to_yojson x.resolved_image_digest);
      ( "PortConfiguration",
        option_to_yojson container_port_configuration_to_yojson x.port_configuration );
      ("ImageUri", option_to_yojson image_uri_string_to_yojson x.image_uri);
      ( "EnvironmentOverride",
        option_to_yojson container_environment_list_to_yojson x.environment_override );
      ("MountPoints", option_to_yojson container_mount_point_list_to_yojson x.mount_points);
      ("DependsOn", option_to_yojson container_dependency_list_to_yojson x.depends_on);
      ("ContainerName", option_to_yojson non_zero_and128_max_ascii_string_to_yojson x.container_name);
    ]

let container_command_string_list_to_yojson tree =
  list_to_yojson non_zero_and255_max_string_to_yojson tree

let container_health_check_interval_to_yojson = int_to_yojson
let container_health_check_retries_to_yojson = int_to_yojson
let container_health_check_start_period_to_yojson = int_to_yojson
let container_health_check_timeout_to_yojson = int_to_yojson

let container_health_check_to_yojson (x : container_health_check) =
  assoc_to_yojson
    [
      ("Timeout", option_to_yojson container_health_check_timeout_to_yojson x.timeout);
      ("StartPeriod", option_to_yojson container_health_check_start_period_to_yojson x.start_period);
      ("Retries", option_to_yojson container_health_check_retries_to_yojson x.retries);
      ("Interval", option_to_yojson container_health_check_interval_to_yojson x.interval);
      ("Command", Some (container_command_string_list_to_yojson x.command));
    ]

let container_memory_limit_to_yojson = int_to_yojson
let container_vcpu_to_yojson = double_to_yojson

let support_container_definition_to_yojson (x : support_container_definition) =
  assoc_to_yojson
    [
      ("LinuxCapabilities", option_to_yojson linux_capabilities_to_yojson x.linux_capabilities);
      ("Vcpu", option_to_yojson container_vcpu_to_yojson x.vcpu);
      ("ResolvedImageDigest", option_to_yojson sha256_to_yojson x.resolved_image_digest);
      ( "PortConfiguration",
        option_to_yojson container_port_configuration_to_yojson x.port_configuration );
      ( "MemoryHardLimitMebibytes",
        option_to_yojson container_memory_limit_to_yojson x.memory_hard_limit_mebibytes );
      ("ImageUri", option_to_yojson image_uri_string_to_yojson x.image_uri);
      ("HealthCheck", option_to_yojson container_health_check_to_yojson x.health_check);
      ("Essential", option_to_yojson boolean_model_to_yojson x.essential);
      ( "EnvironmentOverride",
        option_to_yojson container_environment_list_to_yojson x.environment_override );
      ("MountPoints", option_to_yojson container_mount_point_list_to_yojson x.mount_points);
      ("DependsOn", option_to_yojson container_dependency_list_to_yojson x.depends_on);
      ("ContainerName", option_to_yojson non_zero_and128_max_ascii_string_to_yojson x.container_name);
    ]

let support_container_definition_list_to_yojson tree =
  list_to_yojson support_container_definition_to_yojson tree

let container_group_definition_status_to_yojson (x : container_group_definition_status) =
  match x with
  | FAILED -> `String "FAILED"
  | COPYING -> `String "COPYING"
  | READY -> `String "READY"

let container_group_definition_to_yojson (x : container_group_definition) =
  assoc_to_yojson
    [
      ("StatusReason", option_to_yojson non_zero_and_max_string_to_yojson x.status_reason);
      ("Status", option_to_yojson container_group_definition_status_to_yojson x.status);
      ( "VersionDescription",
        option_to_yojson non_zero_and_max_string_to_yojson x.version_description );
      ("VersionNumber", option_to_yojson positive_integer_to_yojson x.version_number);
      ( "SupportContainerDefinitions",
        option_to_yojson support_container_definition_list_to_yojson x.support_container_definitions
      );
      ( "GameServerContainerDefinition",
        option_to_yojson game_server_container_definition_to_yojson
          x.game_server_container_definition );
      ("TotalVcpuLimit", option_to_yojson container_total_vcpu_limit_to_yojson x.total_vcpu_limit);
      ( "TotalMemoryLimitMebibytes",
        option_to_yojson container_total_memory_limit_to_yojson x.total_memory_limit_mebibytes );
      ("ContainerGroupType", option_to_yojson container_group_type_to_yojson x.container_group_type);
      ("Name", Some (container_group_definition_name_to_yojson x.name));
      ("OperatingSystem", option_to_yojson container_operating_system_to_yojson x.operating_system);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "ContainerGroupDefinitionArn",
        option_to_yojson container_group_definition_arn_to_yojson x.container_group_definition_arn
      );
    ]

let update_container_group_definition_output_to_yojson
    (x : update_container_group_definition_output) =
  assoc_to_yojson
    [
      ( "ContainerGroupDefinition",
        option_to_yojson container_group_definition_to_yojson x.container_group_definition );
    ]

let container_group_definition_name_or_arn_to_yojson = string_to_yojson

let game_server_container_definition_input_to_yojson (x : game_server_container_definition_input) =
  assoc_to_yojson
    [
      ("LinuxCapabilities", option_to_yojson linux_capabilities_to_yojson x.linux_capabilities);
      ("ServerSdkVersion", Some (server_sdk_version_to_yojson x.server_sdk_version));
      ("PortConfiguration", Some (container_port_configuration_to_yojson x.port_configuration));
      ("ImageUri", Some (image_uri_string_to_yojson x.image_uri));
      ( "EnvironmentOverride",
        option_to_yojson container_environment_list_to_yojson x.environment_override );
      ("MountPoints", option_to_yojson container_mount_point_list_to_yojson x.mount_points);
      ("DependsOn", option_to_yojson container_dependency_list_to_yojson x.depends_on);
      ("ContainerName", Some (non_zero_and128_max_ascii_string_to_yojson x.container_name));
    ]

let support_container_definition_input_to_yojson (x : support_container_definition_input) =
  assoc_to_yojson
    [
      ("LinuxCapabilities", option_to_yojson linux_capabilities_to_yojson x.linux_capabilities);
      ("Vcpu", option_to_yojson container_vcpu_to_yojson x.vcpu);
      ( "PortConfiguration",
        option_to_yojson container_port_configuration_to_yojson x.port_configuration );
      ( "MemoryHardLimitMebibytes",
        option_to_yojson container_memory_limit_to_yojson x.memory_hard_limit_mebibytes );
      ("ImageUri", Some (image_uri_string_to_yojson x.image_uri));
      ("HealthCheck", option_to_yojson container_health_check_to_yojson x.health_check);
      ("Essential", option_to_yojson boolean_model_to_yojson x.essential);
      ( "EnvironmentOverride",
        option_to_yojson container_environment_list_to_yojson x.environment_override );
      ("MountPoints", option_to_yojson container_mount_point_list_to_yojson x.mount_points);
      ("DependsOn", option_to_yojson container_dependency_list_to_yojson x.depends_on);
      ("ContainerName", Some (non_zero_and128_max_ascii_string_to_yojson x.container_name));
    ]

let support_container_definition_input_list_to_yojson tree =
  list_to_yojson support_container_definition_input_to_yojson tree

let update_container_group_definition_input_to_yojson (x : update_container_group_definition_input)
    =
  assoc_to_yojson
    [
      ("OperatingSystem", option_to_yojson container_operating_system_to_yojson x.operating_system);
      ("SourceVersionNumber", option_to_yojson positive_integer_to_yojson x.source_version_number);
      ( "VersionDescription",
        option_to_yojson non_zero_and_max_string_to_yojson x.version_description );
      ("TotalVcpuLimit", option_to_yojson container_total_vcpu_limit_to_yojson x.total_vcpu_limit);
      ( "TotalMemoryLimitMebibytes",
        option_to_yojson container_total_memory_limit_to_yojson x.total_memory_limit_mebibytes );
      ( "SupportContainerDefinitions",
        option_to_yojson support_container_definition_input_list_to_yojson
          x.support_container_definitions );
      ( "GameServerContainerDefinition",
        option_to_yojson game_server_container_definition_input_to_yojson
          x.game_server_container_definition );
      ("Name", Some (container_group_definition_name_or_arn_to_yojson x.name));
    ]

let connection_port_range_to_yojson (x : connection_port_range) =
  assoc_to_yojson
    [
      ("ToPort", Some (port_number_to_yojson x.to_port));
      ("FromPort", Some (port_number_to_yojson x.from_port));
    ]

let game_server_container_groups_per_instance_to_yojson = int_to_yojson
let maximum_game_server_container_groups_per_instance_to_yojson = int_to_yojson

let container_fleet_billing_type_to_yojson (x : container_fleet_billing_type) =
  match x with SPOT -> `String "SPOT" | ON_DEMAND -> `String "ON_DEMAND"

let game_session_creation_limit_policy_to_yojson (x : game_session_creation_limit_policy) =
  assoc_to_yojson
    [
      ("PolicyPeriodInMinutes", option_to_yojson whole_number_to_yojson x.policy_period_in_minutes);
      ( "NewGameSessionsPerCreator",
        option_to_yojson whole_number_to_yojson x.new_game_sessions_per_creator );
    ]

let container_fleet_status_to_yojson (x : container_fleet_status) =
  match x with
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | ACTIVE -> `String "ACTIVE"
  | ACTIVATING -> `String "ACTIVATING"
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"
  | PENDING -> `String "PENDING"

let deployment_id_to_yojson = string_to_yojson

let deployment_details_to_yojson (x : deployment_details) =
  assoc_to_yojson
    [ ("LatestDeploymentId", option_to_yojson deployment_id_to_yojson x.latest_deployment_id) ]

let log_destination_to_yojson (x : log_destination) =
  match x with S3 -> `String "S3" | CLOUDWATCH -> `String "CLOUDWATCH" | NONE -> `String "NONE"

let log_group_arn_string_model_to_yojson = string_to_yojson

let log_configuration_to_yojson (x : log_configuration) =
  assoc_to_yojson
    [
      ("LogGroupArn", option_to_yojson log_group_arn_string_model_to_yojson x.log_group_arn);
      ("S3BucketName", option_to_yojson non_empty_string_to_yojson x.s3_bucket_name);
      ("LogDestination", option_to_yojson log_destination_to_yojson x.log_destination);
    ]

let container_fleet_location_status_to_yojson (x : container_fleet_location_status) =
  match x with
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | ACTIVE -> `String "ACTIVE"
  | ACTIVATING -> `String "ACTIVATING"
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"
  | PENDING -> `String "PENDING"

let container_fleet_location_attributes_to_yojson (x : container_fleet_location_attributes) =
  assoc_to_yojson
    [
      ( "PlayerGatewayStatus",
        option_to_yojson player_gateway_status_to_yojson x.player_gateway_status );
      ("Status", option_to_yojson container_fleet_location_status_to_yojson x.status);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
    ]

let container_fleet_location_attributes_list_to_yojson tree =
  list_to_yojson container_fleet_location_attributes_to_yojson tree

let player_gateway_mode_to_yojson (x : player_gateway_mode) =
  match x with
  | REQUIRED -> `String "REQUIRED"
  | ENABLED -> `String "ENABLED"
  | DISABLED -> `String "DISABLED"

let container_fleet_to_yojson (x : container_fleet) =
  assoc_to_yojson
    [
      ("PlayerGatewayMode", option_to_yojson player_gateway_mode_to_yojson x.player_gateway_mode);
      ( "LocationAttributes",
        option_to_yojson container_fleet_location_attributes_list_to_yojson x.location_attributes );
      ("LogConfiguration", option_to_yojson log_configuration_to_yojson x.log_configuration);
      ("DeploymentDetails", option_to_yojson deployment_details_to_yojson x.deployment_details);
      ("Status", option_to_yojson container_fleet_status_to_yojson x.status);
      ( "GameSessionCreationLimitPolicy",
        option_to_yojson game_session_creation_limit_policy_to_yojson
          x.game_session_creation_limit_policy );
      ( "NewGameSessionProtectionPolicy",
        option_to_yojson protection_policy_to_yojson x.new_game_session_protection_policy );
      ("MetricGroups", option_to_yojson metric_group_list_to_yojson x.metric_groups);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("BillingType", option_to_yojson container_fleet_billing_type_to_yojson x.billing_type);
      ("InstanceType", option_to_yojson non_zero_and_max_string_to_yojson x.instance_type);
      ( "MaximumGameServerContainerGroupsPerInstance",
        option_to_yojson maximum_game_server_container_groups_per_instance_to_yojson
          x.maximum_game_server_container_groups_per_instance );
      ( "GameServerContainerGroupsPerInstance",
        option_to_yojson game_server_container_groups_per_instance_to_yojson
          x.game_server_container_groups_per_instance );
      ( "InstanceInboundPermissions",
        option_to_yojson ip_permissions_list_to_yojson x.instance_inbound_permissions );
      ( "InstanceConnectionPortRange",
        option_to_yojson connection_port_range_to_yojson x.instance_connection_port_range );
      ( "PerInstanceContainerGroupDefinitionArn",
        option_to_yojson container_group_definition_arn_to_yojson
          x.per_instance_container_group_definition_arn );
      ( "PerInstanceContainerGroupDefinitionName",
        option_to_yojson container_group_definition_name_to_yojson
          x.per_instance_container_group_definition_name );
      ( "GameServerContainerGroupDefinitionArn",
        option_to_yojson container_group_definition_arn_to_yojson
          x.game_server_container_group_definition_arn );
      ( "GameServerContainerGroupDefinitionName",
        option_to_yojson container_group_definition_name_to_yojson
          x.game_server_container_group_definition_name );
      ("FleetRoleArn", option_to_yojson iam_role_arn_to_yojson x.fleet_role_arn);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let update_container_fleet_output_to_yojson (x : update_container_fleet_output) =
  assoc_to_yojson
    [ ("ContainerFleet", option_to_yojson container_fleet_to_yojson x.container_fleet) ]

let deployment_protection_strategy_to_yojson (x : deployment_protection_strategy) =
  match x with
  | IGNORE_PROTECTION -> `String "IGNORE_PROTECTION"
  | WITH_PROTECTION -> `String "WITH_PROTECTION"

let minimum_healthy_percentage_to_yojson = int_to_yojson

let deployment_impairment_strategy_to_yojson (x : deployment_impairment_strategy) =
  match x with ROLLBACK -> `String "ROLLBACK" | MAINTAIN -> `String "MAINTAIN"

let deployment_configuration_to_yojson (x : deployment_configuration) =
  assoc_to_yojson
    [
      ( "ImpairmentStrategy",
        option_to_yojson deployment_impairment_strategy_to_yojson x.impairment_strategy );
      ( "MinimumHealthyPercentage",
        option_to_yojson minimum_healthy_percentage_to_yojson x.minimum_healthy_percentage );
      ( "ProtectionStrategy",
        option_to_yojson deployment_protection_strategy_to_yojson x.protection_strategy );
    ]

let container_fleet_remove_attribute_to_yojson (x : container_fleet_remove_attribute) =
  match x with
  | PER_INSTANCE_CONTAINER_GROUP_DEFINITION -> `String "PER_INSTANCE_CONTAINER_GROUP_DEFINITION"

let container_fleet_remove_attribute_list_to_yojson tree =
  list_to_yojson container_fleet_remove_attribute_to_yojson tree

let update_container_fleet_input_to_yojson (x : update_container_fleet_input) =
  assoc_to_yojson
    [
      ( "RemoveAttributes",
        option_to_yojson container_fleet_remove_attribute_list_to_yojson x.remove_attributes );
      ("LogConfiguration", option_to_yojson log_configuration_to_yojson x.log_configuration);
      ( "GameSessionCreationLimitPolicy",
        option_to_yojson game_session_creation_limit_policy_to_yojson
          x.game_session_creation_limit_policy );
      ( "NewGameSessionProtectionPolicy",
        option_to_yojson protection_policy_to_yojson x.new_game_session_protection_policy );
      ("MetricGroups", option_to_yojson metric_group_list_to_yojson x.metric_groups);
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ( "DeploymentConfiguration",
        option_to_yojson deployment_configuration_to_yojson x.deployment_configuration );
      ( "InstanceInboundPermissionRevocations",
        option_to_yojson ip_permissions_list_to_yojson x.instance_inbound_permission_revocations );
      ( "InstanceInboundPermissionAuthorizations",
        option_to_yojson ip_permissions_list_to_yojson x.instance_inbound_permission_authorizations
      );
      ( "InstanceConnectionPortRange",
        option_to_yojson connection_port_range_to_yojson x.instance_connection_port_range );
      ( "GameServerContainerGroupsPerInstance",
        option_to_yojson game_server_container_groups_per_instance_to_yojson
          x.game_server_container_groups_per_instance );
      ( "PerInstanceContainerGroupDefinitionName",
        option_to_yojson container_group_definition_name_or_arn_to_yojson
          x.per_instance_container_group_definition_name );
      ( "GameServerContainerGroupDefinitionName",
        option_to_yojson container_group_definition_name_or_arn_to_yojson
          x.game_server_container_group_definition_name );
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let build_id_to_yojson = string_to_yojson
let build_arn_to_yojson = string_to_yojson
let free_text_to_yojson = string_to_yojson

let build_status_to_yojson (x : build_status) =
  match x with
  | FAILED -> `String "FAILED"
  | READY -> `String "READY"
  | INITIALIZED -> `String "INITIALIZED"

let operating_system_to_yojson (x : operating_system) =
  match x with
  | WINDOWS_2022 -> `String "WINDOWS_2022"
  | AMAZON_LINUX_2023 -> `String "AMAZON_LINUX_2023"
  | WINDOWS_2016 -> `String "WINDOWS_2016"
  | AMAZON_LINUX_2 -> `String "AMAZON_LINUX_2"
  | AMAZON_LINUX -> `String "AMAZON_LINUX"
  | WINDOWS_2012 -> `String "WINDOWS_2012"

let build_to_yojson (x : build) =
  assoc_to_yojson
    [
      ("ServerSdkVersion", option_to_yojson server_sdk_version_to_yojson x.server_sdk_version);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("SizeOnDisk", option_to_yojson whole_number_long_to_yojson x.size_on_disk);
      ("Status", option_to_yojson build_status_to_yojson x.status);
      ("Version", option_to_yojson free_text_to_yojson x.version);
      ("Name", option_to_yojson free_text_to_yojson x.name);
      ("BuildArn", option_to_yojson build_arn_to_yojson x.build_arn);
      ("BuildId", option_to_yojson build_id_to_yojson x.build_id);
    ]

let update_build_output_to_yojson (x : update_build_output) =
  assoc_to_yojson [ ("Build", option_to_yojson build_to_yojson x.build) ]

let build_id_or_arn_to_yojson = string_to_yojson

let update_build_input_to_yojson (x : update_build_input) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson non_zero_and_max_string_to_yojson x.version);
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("BuildId", Some (build_id_or_arn_to_yojson x.build_id));
    ]

let alias_id_to_yojson = string_to_yojson
let non_blank_and_length_constraint_string_to_yojson = string_to_yojson
let alias_arn_to_yojson = string_to_yojson

let routing_strategy_type_to_yojson (x : routing_strategy_type) =
  match x with TERMINAL -> `String "TERMINAL" | SIMPLE -> `String "SIMPLE"

let routing_strategy_to_yojson (x : routing_strategy) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson free_text_to_yojson x.message);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("Type", option_to_yojson routing_strategy_type_to_yojson x.type_);
    ]

let alias_to_yojson (x : alias) =
  assoc_to_yojson
    [
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("RoutingStrategy", option_to_yojson routing_strategy_to_yojson x.routing_strategy);
      ("Description", option_to_yojson free_text_to_yojson x.description);
      ("AliasArn", option_to_yojson alias_arn_to_yojson x.alias_arn);
      ("Name", option_to_yojson non_blank_and_length_constraint_string_to_yojson x.name);
      ("AliasId", option_to_yojson alias_id_to_yojson x.alias_id);
    ]

let update_alias_output_to_yojson (x : update_alias_output) =
  assoc_to_yojson [ ("Alias", option_to_yojson alias_to_yojson x.alias) ]

let alias_id_or_arn_to_yojson = string_to_yojson

let update_alias_input_to_yojson (x : update_alias_input) =
  assoc_to_yojson
    [
      ("RoutingStrategy", option_to_yojson routing_strategy_to_yojson x.routing_strategy);
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("Name", option_to_yojson non_blank_and_length_constraint_string_to_yojson x.name);
      ("AliasId", Some (alias_id_or_arn_to_yojson x.alias_id));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let tagging_failed_exception_to_yojson (x : tagging_failed_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let udp_endpoint_to_yojson (x : udp_endpoint) =
  assoc_to_yojson
    [
      ("Port", option_to_yojson positive_integer_to_yojson x.port);
      ("Domain", option_to_yojson non_zero_and_max_string_to_yojson x.domain);
    ]

let termination_mode_to_yojson (x : termination_mode) =
  match x with
  | FORCE_TERMINATE -> `String "FORCE_TERMINATE"
  | TRIGGER_ON_PROCESS_TERMINATE -> `String "TRIGGER_ON_PROCESS_TERMINATE"

let terminate_game_session_output_to_yojson (x : terminate_game_session_output) =
  assoc_to_yojson [ ("GameSession", option_to_yojson game_session_to_yojson x.game_session) ]

let terminate_game_session_input_to_yojson (x : terminate_game_session_input) =
  assoc_to_yojson
    [
      ("TerminationMode", Some (termination_mode_to_yojson x.termination_mode));
      ("GameSessionId", Some (arn_string_model_to_yojson x.game_session_id));
    ]

let terminal_routing_strategy_exception_to_yojson (x : terminal_routing_strategy_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let non_negative_double_to_yojson = double_to_yojson

let target_tracking_configuration_to_yojson (x : target_tracking_configuration) =
  assoc_to_yojson [ ("TargetValue", Some (non_negative_double_to_yojson x.target_value)) ]

let double_to_yojson = double_to_yojson

let target_configuration_to_yojson (x : target_configuration) =
  assoc_to_yojson [ ("TargetValue", Some (double_to_yojson x.target_value)) ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let suspend_game_server_group_output_to_yojson (x : suspend_game_server_group_output) =
  assoc_to_yojson
    [ ("GameServerGroup", option_to_yojson game_server_group_to_yojson x.game_server_group) ]

let suspend_game_server_group_input_to_yojson (x : suspend_game_server_group_input) =
  assoc_to_yojson
    [
      ("SuspendActions", Some (game_server_group_actions_to_yojson x.suspend_actions));
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
    ]

let string_model_to_yojson = string_to_yojson
let string_list_to_yojson tree = list_to_yojson non_zero_and_max_string_to_yojson tree
let stop_matchmaking_output_to_yojson = unit_to_yojson

let stop_matchmaking_input_to_yojson (x : stop_matchmaking_input) =
  assoc_to_yojson [ ("TicketId", Some (matchmaking_id_string_model_to_yojson x.ticket_id)) ]

let id_string_model_to_yojson = string_to_yojson

let game_session_placement_state_to_yojson (x : game_session_placement_state) =
  match x with
  | FAILED -> `String "FAILED"
  | TIMED_OUT -> `String "TIMED_OUT"
  | CANCELLED -> `String "CANCELLED"
  | FULFILLED -> `String "FULFILLED"
  | PENDING -> `String "PENDING"

let player_id_to_yojson = string_to_yojson
let float__to_yojson = float_to_yojson

let player_latency_to_yojson (x : player_latency) =
  assoc_to_yojson
    [
      ("LatencyInMilliseconds", option_to_yojson float__to_yojson x.latency_in_milliseconds);
      ("RegionIdentifier", option_to_yojson non_zero_and_max_string_to_yojson x.region_identifier);
      ("PlayerId", option_to_yojson player_id_to_yojson x.player_id);
    ]

let player_latency_list_to_yojson tree = list_to_yojson player_latency_to_yojson tree
let player_session_id_to_yojson = string_to_yojson

let placed_player_session_to_yojson (x : placed_player_session) =
  assoc_to_yojson
    [
      ("PlayerSessionId", option_to_yojson player_session_id_to_yojson x.player_session_id);
      ("PlayerId", option_to_yojson player_id_to_yojson x.player_id);
    ]

let placed_player_session_list_to_yojson tree = list_to_yojson placed_player_session_to_yojson tree

let placement_fallback_strategy_to_yojson (x : placement_fallback_strategy) =
  match x with
  | NONE -> `String "NONE"
  | DEFAULT_AFTER_SINGLE_PASS -> `String "DEFAULT_AFTER_SINGLE_PASS"

let location_order_override_list_to_yojson tree =
  list_to_yojson location_string_model_to_yojson tree

let priority_configuration_override_to_yojson (x : priority_configuration_override) =
  assoc_to_yojson
    [
      ("LocationOrder", Some (location_order_override_list_to_yojson x.location_order));
      ( "PlacementFallbackStrategy",
        option_to_yojson placement_fallback_strategy_to_yojson x.placement_fallback_strategy );
    ]

let game_session_placement_to_yojson (x : game_session_placement) =
  assoc_to_yojson
    [
      ( "PlayerGatewayStatus",
        option_to_yojson player_gateway_status_to_yojson x.player_gateway_status );
      ( "PriorityConfigurationOverride",
        option_to_yojson priority_configuration_override_to_yojson x.priority_configuration_override
      );
      ("MatchmakerData", option_to_yojson matchmaker_data_to_yojson x.matchmaker_data);
      ("GameSessionData", option_to_yojson large_game_session_data_to_yojson x.game_session_data);
      ( "PlacedPlayerSessions",
        option_to_yojson placed_player_session_list_to_yojson x.placed_player_sessions );
      ("Port", option_to_yojson port_number_to_yojson x.port);
      ("DnsName", option_to_yojson dns_name_to_yojson x.dns_name);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("PlayerLatencies", option_to_yojson player_latency_list_to_yojson x.player_latencies);
      ("GameSessionRegion", option_to_yojson non_zero_and_max_string_to_yojson x.game_session_region);
      ("GameSessionArn", option_to_yojson non_zero_and_max_string_to_yojson x.game_session_arn);
      ("GameSessionId", option_to_yojson non_zero_and_max_string_to_yojson x.game_session_id);
      ("GameSessionName", option_to_yojson non_zero_and_max_string_to_yojson x.game_session_name);
      ( "MaximumPlayerSessionCount",
        option_to_yojson whole_number_to_yojson x.maximum_player_session_count );
      ("GameProperties", option_to_yojson game_property_list_to_yojson x.game_properties);
      ("Status", option_to_yojson game_session_placement_state_to_yojson x.status);
      ( "GameSessionQueueName",
        option_to_yojson game_session_queue_name_to_yojson x.game_session_queue_name );
      ("PlacementId", option_to_yojson id_string_model_to_yojson x.placement_id);
    ]

let stop_game_session_placement_output_to_yojson (x : stop_game_session_placement_output) =
  assoc_to_yojson
    [
      ( "GameSessionPlacement",
        option_to_yojson game_session_placement_to_yojson x.game_session_placement );
    ]

let stop_game_session_placement_input_to_yojson (x : stop_game_session_placement_input) =
  assoc_to_yojson [ ("PlacementId", Some (id_string_model_to_yojson x.placement_id)) ]

let stop_fleet_actions_output_to_yojson (x : stop_fleet_actions_output) =
  assoc_to_yojson
    [
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let fleet_action_to_yojson (x : fleet_action) = match x with AutoScaling -> `String "AUTO_SCALING"
let fleet_action_list_to_yojson tree = list_to_yojson fleet_action_to_yojson tree

let stop_fleet_actions_input_to_yojson (x : stop_fleet_actions_input) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("Actions", Some (fleet_action_list_to_yojson x.actions));
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let matchmaking_configuration_status_to_yojson (x : matchmaking_configuration_status) =
  match x with
  | TIMED_OUT -> `String "TIMED_OUT"
  | SEARCHING -> `String "SEARCHING"
  | REQUIRES_ACCEPTANCE -> `String "REQUIRES_ACCEPTANCE"
  | QUEUED -> `String "QUEUED"
  | PLACING -> `String "PLACING"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | CANCELLED -> `String "CANCELLED"

let player_attribute_string_to_yojson = string_to_yojson
let double_object_to_yojson = double_to_yojson

let player_attribute_string_list_to_yojson tree =
  list_to_yojson player_attribute_string_to_yojson tree

let player_attribute_string_double_map_to_yojson tree =
  map_to_yojson player_attribute_string_to_yojson double_object_to_yojson tree

let attribute_value_to_yojson (x : attribute_value) =
  assoc_to_yojson
    [
      ("SDM", option_to_yojson player_attribute_string_double_map_to_yojson x.sd_m);
      ("SL", option_to_yojson player_attribute_string_list_to_yojson x.s_l);
      ("N", option_to_yojson double_object_to_yojson x.n);
      ("S", option_to_yojson player_attribute_string_to_yojson x.s);
    ]

let player_attribute_map_to_yojson tree =
  map_to_yojson non_zero_and_max_string_to_yojson attribute_value_to_yojson tree

let latency_map_to_yojson tree =
  map_to_yojson non_empty_string_to_yojson positive_integer_to_yojson tree

let player_to_yojson (x : player) =
  assoc_to_yojson
    [
      ("LatencyInMs", option_to_yojson latency_map_to_yojson x.latency_in_ms);
      ("Team", option_to_yojson non_zero_and_max_string_to_yojson x.team);
      ("PlayerAttributes", option_to_yojson player_attribute_map_to_yojson x.player_attributes);
      ("PlayerId", option_to_yojson player_id_to_yojson x.player_id);
    ]

let player_list_to_yojson tree = list_to_yojson player_to_yojson tree

let matched_player_session_to_yojson (x : matched_player_session) =
  assoc_to_yojson
    [
      ("PlayerSessionId", option_to_yojson player_session_id_to_yojson x.player_session_id);
      ("PlayerId", option_to_yojson player_id_to_yojson x.player_id);
    ]

let matched_player_session_list_to_yojson tree =
  list_to_yojson matched_player_session_to_yojson tree

let game_session_connection_info_to_yojson (x : game_session_connection_info) =
  assoc_to_yojson
    [
      ( "PlayerGatewayStatus",
        option_to_yojson player_gateway_status_to_yojson x.player_gateway_status );
      ( "MatchedPlayerSessions",
        option_to_yojson matched_player_session_list_to_yojson x.matched_player_sessions );
      ("Port", option_to_yojson positive_integer_to_yojson x.port);
      ("DnsName", option_to_yojson dns_name_to_yojson x.dns_name);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("GameSessionArn", option_to_yojson arn_string_model_to_yojson x.game_session_arn);
    ]

let matchmaking_ticket_to_yojson (x : matchmaking_ticket) =
  assoc_to_yojson
    [
      ("EstimatedWaitTime", option_to_yojson whole_number_to_yojson x.estimated_wait_time);
      ( "GameSessionConnectionInfo",
        option_to_yojson game_session_connection_info_to_yojson x.game_session_connection_info );
      ("Players", option_to_yojson player_list_to_yojson x.players);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("StatusMessage", option_to_yojson string_model_to_yojson x.status_message);
      ("StatusReason", option_to_yojson string_model_to_yojson x.status_reason);
      ("Status", option_to_yojson matchmaking_configuration_status_to_yojson x.status);
      ( "ConfigurationArn",
        option_to_yojson matchmaking_configuration_arn_to_yojson x.configuration_arn );
      ( "ConfigurationName",
        option_to_yojson matchmaking_id_string_model_to_yojson x.configuration_name );
      ("TicketId", option_to_yojson matchmaking_id_string_model_to_yojson x.ticket_id);
    ]

let start_matchmaking_output_to_yojson (x : start_matchmaking_output) =
  assoc_to_yojson
    [ ("MatchmakingTicket", option_to_yojson matchmaking_ticket_to_yojson x.matchmaking_ticket) ]

let start_matchmaking_input_to_yojson (x : start_matchmaking_input) =
  assoc_to_yojson
    [
      ("Players", Some (player_list_to_yojson x.players));
      ("ConfigurationName", Some (matchmaking_configuration_name_to_yojson x.configuration_name));
      ("TicketId", option_to_yojson matchmaking_id_string_model_to_yojson x.ticket_id);
    ]

let start_match_backfill_output_to_yojson (x : start_match_backfill_output) =
  assoc_to_yojson
    [ ("MatchmakingTicket", option_to_yojson matchmaking_ticket_to_yojson x.matchmaking_ticket) ]

let start_match_backfill_input_to_yojson (x : start_match_backfill_input) =
  assoc_to_yojson
    [
      ("Players", Some (player_list_to_yojson x.players));
      ("GameSessionArn", option_to_yojson arn_string_model_to_yojson x.game_session_arn);
      ("ConfigurationName", Some (matchmaking_configuration_name_to_yojson x.configuration_name));
      ("TicketId", option_to_yojson matchmaking_id_string_model_to_yojson x.ticket_id);
    ]

let start_game_session_placement_output_to_yojson (x : start_game_session_placement_output) =
  assoc_to_yojson
    [
      ( "GameSessionPlacement",
        option_to_yojson game_session_placement_to_yojson x.game_session_placement );
    ]

let player_data_to_yojson = string_to_yojson

let desired_player_session_to_yojson (x : desired_player_session) =
  assoc_to_yojson
    [
      ("PlayerData", option_to_yojson player_data_to_yojson x.player_data);
      ("PlayerId", option_to_yojson player_id_to_yojson x.player_id);
    ]

let desired_player_session_list_to_yojson tree =
  list_to_yojson desired_player_session_to_yojson tree

let start_game_session_placement_input_to_yojson (x : start_game_session_placement_input) =
  assoc_to_yojson
    [
      ( "PriorityConfigurationOverride",
        option_to_yojson priority_configuration_override_to_yojson x.priority_configuration_override
      );
      ("GameSessionData", option_to_yojson large_game_session_data_to_yojson x.game_session_data);
      ( "DesiredPlayerSessions",
        option_to_yojson desired_player_session_list_to_yojson x.desired_player_sessions );
      ("PlayerLatencies", option_to_yojson player_latency_list_to_yojson x.player_latencies);
      ("GameSessionName", option_to_yojson non_zero_and_max_string_to_yojson x.game_session_name);
      ("MaximumPlayerSessionCount", Some (whole_number_to_yojson x.maximum_player_session_count));
      ("GameProperties", option_to_yojson game_property_list_to_yojson x.game_properties);
      ( "GameSessionQueueName",
        Some (game_session_queue_name_or_arn_to_yojson x.game_session_queue_name) );
      ("PlacementId", Some (id_string_model_to_yojson x.placement_id));
    ]

let start_fleet_actions_output_to_yojson (x : start_fleet_actions_output) =
  assoc_to_yojson
    [
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let start_fleet_actions_input_to_yojson (x : start_fleet_actions_input) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("Actions", Some (fleet_action_list_to_yojson x.actions));
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let sort_order_to_yojson (x : sort_order) =
  match x with DESCENDING -> `String "DESCENDING" | ASCENDING -> `String "ASCENDING"

let session_target_to_yojson = string_to_yojson
let game_session_list_to_yojson tree = list_to_yojson game_session_to_yojson tree

let search_game_sessions_output_to_yojson (x : search_game_sessions_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("GameSessions", option_to_yojson game_session_list_to_yojson x.game_sessions);
    ]

let search_game_sessions_input_to_yojson (x : search_game_sessions_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("SortExpression", option_to_yojson non_zero_and_max_string_to_yojson x.sort_expression);
      ("FilterExpression", option_to_yojson non_zero_and_max_string_to_yojson x.filter_expression);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("AliasId", option_to_yojson alias_id_or_arn_to_yojson x.alias_id);
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
    ]

let script_list_to_yojson tree = list_to_yojson script_to_yojson tree

let scaling_status_type_to_yojson (x : scaling_status_type) =
  match x with
  | ERROR -> `String "ERROR"
  | DELETED -> `String "DELETED"
  | DELETING -> `String "DELETING"
  | DELETE_REQUESTED -> `String "DELETE_REQUESTED"
  | UPDATING -> `String "UPDATING"
  | UPDATE_REQUESTED -> `String "UPDATE_REQUESTED"
  | ACTIVE -> `String "ACTIVE"

let integer_to_yojson = int_to_yojson

let scaling_adjustment_type_to_yojson (x : scaling_adjustment_type) =
  match x with
  | PercentChangeInCapacity -> `String "PercentChangeInCapacity"
  | ExactCapacity -> `String "ExactCapacity"
  | ChangeInCapacity -> `String "ChangeInCapacity"

let comparison_operator_type_to_yojson (x : comparison_operator_type) =
  match x with
  | LessThanOrEqualToThreshold -> `String "LessThanOrEqualToThreshold"
  | LessThanThreshold -> `String "LessThanThreshold"
  | GreaterThanThreshold -> `String "GreaterThanThreshold"
  | GreaterThanOrEqualToThreshold -> `String "GreaterThanOrEqualToThreshold"

let metric_name_to_yojson (x : metric_name) =
  match x with
  | ConcurrentActivatableGameSessions -> `String "ConcurrentActivatableGameSessions"
  | WaitTime -> `String "WaitTime"
  | QueueDepth -> `String "QueueDepth"
  | PercentIdleInstances -> `String "PercentIdleInstances"
  | PercentAvailableGameSessions -> `String "PercentAvailableGameSessions"
  | IdleInstances -> `String "IdleInstances"
  | CurrentPlayerSessions -> `String "CurrentPlayerSessions"
  | AvailablePlayerSessions -> `String "AvailablePlayerSessions"
  | AvailableGameSessions -> `String "AvailableGameSessions"
  | ActiveInstances -> `String "ActiveInstances"
  | ActiveGameSessions -> `String "ActiveGameSessions"
  | ActivatingGameSessions -> `String "ActivatingGameSessions"

let policy_type_to_yojson (x : policy_type) =
  match x with TargetBased -> `String "TargetBased" | RuleBased -> `String "RuleBased"

let location_update_status_to_yojson (x : location_update_status) =
  match x with PENDING_UPDATE -> `String "PENDING_UPDATE"

let scaling_policy_to_yojson (x : scaling_policy) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("UpdateStatus", option_to_yojson location_update_status_to_yojson x.update_status);
      ("TargetConfiguration", option_to_yojson target_configuration_to_yojson x.target_configuration);
      ("PolicyType", option_to_yojson policy_type_to_yojson x.policy_type);
      ("MetricName", option_to_yojson metric_name_to_yojson x.metric_name);
      ("EvaluationPeriods", option_to_yojson positive_integer_to_yojson x.evaluation_periods);
      ("Threshold", option_to_yojson double_to_yojson x.threshold);
      ( "ComparisonOperator",
        option_to_yojson comparison_operator_type_to_yojson x.comparison_operator );
      ( "ScalingAdjustmentType",
        option_to_yojson scaling_adjustment_type_to_yojson x.scaling_adjustment_type );
      ("ScalingAdjustment", option_to_yojson integer_to_yojson x.scaling_adjustment);
      ("Status", option_to_yojson scaling_status_type_to_yojson x.status);
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let scaling_policy_list_to_yojson tree = list_to_yojson scaling_policy_to_yojson tree
let rule_set_limit_to_yojson = int_to_yojson

let resume_game_server_group_output_to_yojson (x : resume_game_server_group_output) =
  assoc_to_yojson
    [ ("GameServerGroup", option_to_yojson game_server_group_to_yojson x.game_server_group) ]

let resume_game_server_group_input_to_yojson (x : resume_game_server_group_input) =
  assoc_to_yojson
    [
      ("ResumeActions", Some (game_server_group_actions_to_yojson x.resume_actions));
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
    ]

let resolve_alias_output_to_yojson (x : resolve_alias_output) =
  assoc_to_yojson
    [
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let resolve_alias_input_to_yojson (x : resolve_alias_input) =
  assoc_to_yojson [ ("AliasId", Some (alias_id_or_arn_to_yojson x.alias_id)) ]

let aws_credentials_to_yojson (x : aws_credentials) =
  assoc_to_yojson
    [
      ("SessionToken", option_to_yojson non_empty_string_to_yojson x.session_token);
      ("SecretAccessKey", option_to_yojson non_empty_string_to_yojson x.secret_access_key);
      ("AccessKeyId", option_to_yojson non_empty_string_to_yojson x.access_key_id);
    ]

let request_upload_credentials_output_to_yojson (x : request_upload_credentials_output) =
  assoc_to_yojson
    [
      ("StorageLocation", option_to_yojson s3_location_to_yojson x.storage_location);
      ("UploadCredentials", option_to_yojson aws_credentials_to_yojson x.upload_credentials);
    ]

let request_upload_credentials_input_to_yojson (x : request_upload_credentials_input) =
  assoc_to_yojson [ ("BuildId", Some (build_id_or_arn_to_yojson x.build_id)) ]

let register_game_server_output_to_yojson (x : register_game_server_output) =
  assoc_to_yojson [ ("GameServer", option_to_yojson game_server_to_yojson x.game_server) ]

let register_game_server_input_to_yojson (x : register_game_server_input) =
  assoc_to_yojson
    [
      ("GameServerData", option_to_yojson game_server_data_to_yojson x.game_server_data);
      ("ConnectionInfo", option_to_yojson game_server_connection_info_to_yojson x.connection_info);
      ("InstanceId", Some (game_server_instance_id_to_yojson x.instance_id));
      ("GameServerId", Some (game_server_id_to_yojson x.game_server_id));
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
    ]

let compute_arn_to_yojson = string_to_yojson

let compute_status_to_yojson (x : compute_status) =
  match x with
  | IMPAIRED -> `String "IMPAIRED"
  | TERMINATING -> `String "TERMINATING"
  | ACTIVE -> `String "ACTIVE"
  | PENDING -> `String "PENDING"

let ec2_instance_type_to_yojson (x : ec2_instance_type) =
  match x with
  | R7a_48xlarge -> `String "r7a.48xlarge"
  | R7a_32xlarge -> `String "r7a.32xlarge"
  | R7a_24xlarge -> `String "r7a.24xlarge"
  | M7i_48xlarge -> `String "m7i.48xlarge"
  | M7i_24xlarge -> `String "m7i.24xlarge"
  | M7a_48xlarge -> `String "m7a.48xlarge"
  | M7a_32xlarge -> `String "m7a.32xlarge"
  | M7a_24xlarge -> `String "m7a.24xlarge"
  | M6i_32xlarge -> `String "m6i.32xlarge"
  | M6i_24xlarge -> `String "m6i.24xlarge"
  | M6a_48xlarge -> `String "m6a.48xlarge"
  | M6a_32xlarge -> `String "m6a.32xlarge"
  | M6a_24xlarge -> `String "m6a.24xlarge"
  | C7i_48xlarge -> `String "c7i.48xlarge"
  | C7i_24xlarge -> `String "c7i.24xlarge"
  | C7a_48xlarge -> `String "c7a.48xlarge"
  | C7a_32xlarge -> `String "c7a.32xlarge"
  | C7a_24xlarge -> `String "c7a.24xlarge"
  | C6in_32xlarge -> `String "c6in.32xlarge"
  | C6in_24xlarge -> `String "c6in.24xlarge"
  | R6i_32xlarge -> `String "r6i.32xlarge"
  | R6i_24xlarge -> `String "r6i.24xlarge"
  | C6i_32xlarge -> `String "c6i.32xlarge"
  | C6a_48xlarge -> `String "c6a.48xlarge"
  | C6a_32xlarge -> `String "c6a.32xlarge"
  | M4_16xlarge -> `String "m4.16xlarge"
  | R8g_48xlarge -> `String "r8g.48xlarge"
  | R8g_24xlarge -> `String "r8g.24xlarge"
  | R8g_16xlarge -> `String "r8g.16xlarge"
  | R8g_12xlarge -> `String "r8g.12xlarge"
  | R8g_8xlarge -> `String "r8g.8xlarge"
  | R8g_4xlarge -> `String "r8g.4xlarge"
  | R8g_2xlarge -> `String "r8g.2xlarge"
  | R8g_xlarge -> `String "r8g.xlarge"
  | R8g_large -> `String "r8g.large"
  | R8g_medium -> `String "r8g.medium"
  | R6in_32xlarge -> `String "r6in.32xlarge"
  | R6in_24xlarge -> `String "r6in.24xlarge"
  | R6in_16xlarge -> `String "r6in.16xlarge"
  | R6in_12xlarge -> `String "r6in.12xlarge"
  | R6in_8xlarge -> `String "r6in.8xlarge"
  | R6in_4xlarge -> `String "r6in.4xlarge"
  | R6in_2xlarge -> `String "r6in.2xlarge"
  | R6in_xlarge -> `String "r6in.xlarge"
  | R6in_large -> `String "r6in.large"
  | R6idn_32xlarge -> `String "r6idn.32xlarge"
  | R6idn_24xlarge -> `String "r6idn.24xlarge"
  | R6idn_16xlarge -> `String "r6idn.16xlarge"
  | R6idn_12xlarge -> `String "r6idn.12xlarge"
  | R6idn_8xlarge -> `String "r6idn.8xlarge"
  | R6idn_4xlarge -> `String "r6idn.4xlarge"
  | R6idn_2xlarge -> `String "r6idn.2xlarge"
  | R6idn_xlarge -> `String "r6idn.xlarge"
  | R6idn_large -> `String "r6idn.large"
  | R6id_32xlarge -> `String "r6id.32xlarge"
  | R6id_24xlarge -> `String "r6id.24xlarge"
  | R6id_16xlarge -> `String "r6id.16xlarge"
  | R6id_12xlarge -> `String "r6id.12xlarge"
  | R6id_8xlarge -> `String "r6id.8xlarge"
  | R6id_4xlarge -> `String "r6id.4xlarge"
  | R6id_2xlarge -> `String "r6id.2xlarge"
  | R6id_xlarge -> `String "r6id.xlarge"
  | R6id_large -> `String "r6id.large"
  | R6a_48xlarge -> `String "r6a.48xlarge"
  | R6a_32xlarge -> `String "r6a.32xlarge"
  | R6a_24xlarge -> `String "r6a.24xlarge"
  | R6a_16xlarge -> `String "r6a.16xlarge"
  | R6a_12xlarge -> `String "r6a.12xlarge"
  | R6a_8xlarge -> `String "r6a.8xlarge"
  | R6a_4xlarge -> `String "r6a.4xlarge"
  | R6a_2xlarge -> `String "r6a.2xlarge"
  | R6a_xlarge -> `String "r6a.xlarge"
  | R6a_large -> `String "r6a.large"
  | R5n_24xlarge -> `String "r5n.24xlarge"
  | R5n_16xlarge -> `String "r5n.16xlarge"
  | R5n_12xlarge -> `String "r5n.12xlarge"
  | R5n_8xlarge -> `String "r5n.8xlarge"
  | R5n_4xlarge -> `String "r5n.4xlarge"
  | R5n_2xlarge -> `String "r5n.2xlarge"
  | R5n_xlarge -> `String "r5n.xlarge"
  | R5n_large -> `String "r5n.large"
  | R5dn_24xlarge -> `String "r5dn.24xlarge"
  | R5dn_16xlarge -> `String "r5dn.16xlarge"
  | R5dn_12xlarge -> `String "r5dn.12xlarge"
  | R5dn_8xlarge -> `String "r5dn.8xlarge"
  | R5dn_4xlarge -> `String "r5dn.4xlarge"
  | R5dn_2xlarge -> `String "r5dn.2xlarge"
  | R5dn_xlarge -> `String "r5dn.xlarge"
  | R5dn_large -> `String "r5dn.large"
  | M8g_48xlarge -> `String "m8g.48xlarge"
  | M8g_24xlarge -> `String "m8g.24xlarge"
  | M8g_16xlarge -> `String "m8g.16xlarge"
  | M8g_12xlarge -> `String "m8g.12xlarge"
  | M8g_8xlarge -> `String "m8g.8xlarge"
  | M8g_4xlarge -> `String "m8g.4xlarge"
  | M8g_2xlarge -> `String "m8g.2xlarge"
  | M8g_xlarge -> `String "m8g.xlarge"
  | M8g_large -> `String "m8g.large"
  | M8g_medium -> `String "m8g.medium"
  | M6in_32xlarge -> `String "m6in.32xlarge"
  | M6in_24xlarge -> `String "m6in.24xlarge"
  | M6in_16xlarge -> `String "m6in.16xlarge"
  | M6in_12xlarge -> `String "m6in.12xlarge"
  | M6in_8xlarge -> `String "m6in.8xlarge"
  | M6in_4xlarge -> `String "m6in.4xlarge"
  | M6in_2xlarge -> `String "m6in.2xlarge"
  | M6in_xlarge -> `String "m6in.xlarge"
  | M6in_large -> `String "m6in.large"
  | M6idn_32xlarge -> `String "m6idn.32xlarge"
  | M6idn_24xlarge -> `String "m6idn.24xlarge"
  | M6idn_16xlarge -> `String "m6idn.16xlarge"
  | M6idn_12xlarge -> `String "m6idn.12xlarge"
  | M6idn_8xlarge -> `String "m6idn.8xlarge"
  | M6idn_4xlarge -> `String "m6idn.4xlarge"
  | M6idn_2xlarge -> `String "m6idn.2xlarge"
  | M6idn_xlarge -> `String "m6idn.xlarge"
  | M6idn_large -> `String "m6idn.large"
  | M6id_32xlarge -> `String "m6id.32xlarge"
  | M6id_24xlarge -> `String "m6id.24xlarge"
  | M6id_16xlarge -> `String "m6id.16xlarge"
  | M6id_12xlarge -> `String "m6id.12xlarge"
  | M6id_8xlarge -> `String "m6id.8xlarge"
  | M6id_4xlarge -> `String "m6id.4xlarge"
  | M6id_2xlarge -> `String "m6id.2xlarge"
  | M6id_xlarge -> `String "m6id.xlarge"
  | M6id_large -> `String "m6id.large"
  | M5n_24xlarge -> `String "m5n.24xlarge"
  | M5n_16xlarge -> `String "m5n.16xlarge"
  | M5n_12xlarge -> `String "m5n.12xlarge"
  | M5n_8xlarge -> `String "m5n.8xlarge"
  | M5n_4xlarge -> `String "m5n.4xlarge"
  | M5n_2xlarge -> `String "m5n.2xlarge"
  | M5n_xlarge -> `String "m5n.xlarge"
  | M5n_large -> `String "m5n.large"
  | M5dn_24xlarge -> `String "m5dn.24xlarge"
  | M5dn_16xlarge -> `String "m5dn.16xlarge"
  | M5dn_12xlarge -> `String "m5dn.12xlarge"
  | M5dn_8xlarge -> `String "m5dn.8xlarge"
  | M5dn_4xlarge -> `String "m5dn.4xlarge"
  | M5dn_2xlarge -> `String "m5dn.2xlarge"
  | M5dn_xlarge -> `String "m5dn.xlarge"
  | M5dn_large -> `String "m5dn.large"
  | M5d_24xlarge -> `String "m5d.24xlarge"
  | M5d_16xlarge -> `String "m5d.16xlarge"
  | M5d_12xlarge -> `String "m5d.12xlarge"
  | M5d_8xlarge -> `String "m5d.8xlarge"
  | M5d_4xlarge -> `String "m5d.4xlarge"
  | M5d_2xlarge -> `String "m5d.2xlarge"
  | M5d_xlarge -> `String "m5d.xlarge"
  | M5d_large -> `String "m5d.large"
  | M5ad_24xlarge -> `String "m5ad.24xlarge"
  | M5ad_16xlarge -> `String "m5ad.16xlarge"
  | M5ad_12xlarge -> `String "m5ad.12xlarge"
  | M5ad_8xlarge -> `String "m5ad.8xlarge"
  | M5ad_4xlarge -> `String "m5ad.4xlarge"
  | M5ad_2xlarge -> `String "m5ad.2xlarge"
  | M5ad_xlarge -> `String "m5ad.xlarge"
  | M5ad_large -> `String "m5ad.large"
  | C8g_48xlarge -> `String "c8g.48xlarge"
  | C8g_24xlarge -> `String "c8g.24xlarge"
  | C8g_16xlarge -> `String "c8g.16xlarge"
  | C8g_12xlarge -> `String "c8g.12xlarge"
  | C8g_8xlarge -> `String "c8g.8xlarge"
  | C8g_4xlarge -> `String "c8g.4xlarge"
  | C8g_2xlarge -> `String "c8g.2xlarge"
  | C8g_xlarge -> `String "c8g.xlarge"
  | C8g_large -> `String "c8g.large"
  | C8g_medium -> `String "c8g.medium"
  | C6id_32xlarge -> `String "c6id.32xlarge"
  | C6id_24xlarge -> `String "c6id.24xlarge"
  | C6id_16xlarge -> `String "c6id.16xlarge"
  | C6id_12xlarge -> `String "c6id.12xlarge"
  | C6id_8xlarge -> `String "c6id.8xlarge"
  | C6id_4xlarge -> `String "c6id.4xlarge"
  | C6id_2xlarge -> `String "c6id.2xlarge"
  | C6id_xlarge -> `String "c6id.xlarge"
  | C6id_large -> `String "c6id.large"
  | R5ad_24xlarge -> `String "r5ad.24xlarge"
  | R5ad_16xlarge -> `String "r5ad.16xlarge"
  | R5ad_12xlarge -> `String "r5ad.12xlarge"
  | R5ad_8xlarge -> `String "r5ad.8xlarge"
  | R5ad_4xlarge -> `String "r5ad.4xlarge"
  | R5ad_2xlarge -> `String "r5ad.2xlarge"
  | R5ad_xlarge -> `String "r5ad.xlarge"
  | R5ad_large -> `String "r5ad.large"
  | C5n_18xlarge -> `String "c5n.18xlarge"
  | C5n_9xlarge -> `String "c5n.9xlarge"
  | C5n_4xlarge -> `String "c5n.4xlarge"
  | C5n_2xlarge -> `String "c5n.2xlarge"
  | C5n_xlarge -> `String "c5n.xlarge"
  | C5n_large -> `String "c5n.large"
  | C5ad_24xlarge -> `String "c5ad.24xlarge"
  | C5ad_16xlarge -> `String "c5ad.16xlarge"
  | C5ad_12xlarge -> `String "c5ad.12xlarge"
  | C5ad_8xlarge -> `String "c5ad.8xlarge"
  | C5ad_4xlarge -> `String "c5ad.4xlarge"
  | C5ad_2xlarge -> `String "c5ad.2xlarge"
  | C5ad_xlarge -> `String "c5ad.xlarge"
  | C5ad_large -> `String "c5ad.large"
  | R7i_48xlarge -> `String "r7i.48xlarge"
  | R7i_24xlarge -> `String "r7i.24xlarge"
  | R7i_16xlarge -> `String "r7i.16xlarge"
  | R7i_12xlarge -> `String "r7i.12xlarge"
  | R7i_8xlarge -> `String "r7i.8xlarge"
  | R7i_4xlarge -> `String "r7i.4xlarge"
  | R7i_2xlarge -> `String "r7i.2xlarge"
  | R7i_xlarge -> `String "r7i.xlarge"
  | R7i_large -> `String "r7i.large"
  | R7gd_16xlarge -> `String "r7gd.16xlarge"
  | R7gd_12xlarge -> `String "r7gd.12xlarge"
  | R7gd_8xlarge -> `String "r7gd.8xlarge"
  | R7gd_4xlarge -> `String "r7gd.4xlarge"
  | R7gd_2xlarge -> `String "r7gd.2xlarge"
  | R7gd_xlarge -> `String "r7gd.xlarge"
  | R7gd_large -> `String "r7gd.large"
  | R7gd_medium -> `String "r7gd.medium"
  | R7a_16xlarge -> `String "r7a.16xlarge"
  | R7a_12xlarge -> `String "r7a.12xlarge"
  | R7a_8xlarge -> `String "r7a.8xlarge"
  | R7a_4xlarge -> `String "r7a.4xlarge"
  | R7a_2xlarge -> `String "r7a.2xlarge"
  | R7a_xlarge -> `String "r7a.xlarge"
  | R7a_large -> `String "r7a.large"
  | R7a_medium -> `String "r7a.medium"
  | R6gd_16xlarge -> `String "r6gd.16xlarge"
  | R6gd_12xlarge -> `String "r6gd.12xlarge"
  | R6gd_8xlarge -> `String "r6gd.8xlarge"
  | R6gd_4xlarge -> `String "r6gd.4xlarge"
  | R6gd_2xlarge -> `String "r6gd.2xlarge"
  | R6gd_xlarge -> `String "r6gd.xlarge"
  | R6gd_large -> `String "r6gd.large"
  | R6gd_medium -> `String "r6gd.medium"
  | M7i_16xlarge -> `String "m7i.16xlarge"
  | M7i_12xlarge -> `String "m7i.12xlarge"
  | M7i_8xlarge -> `String "m7i.8xlarge"
  | M7i_4xlarge -> `String "m7i.4xlarge"
  | M7i_2xlarge -> `String "m7i.2xlarge"
  | M7i_xlarge -> `String "m7i.xlarge"
  | M7i_large -> `String "m7i.large"
  | M7gd_16xlarge -> `String "m7gd.16xlarge"
  | M7gd_12xlarge -> `String "m7gd.12xlarge"
  | M7gd_8xlarge -> `String "m7gd.8xlarge"
  | M7gd_4xlarge -> `String "m7gd.4xlarge"
  | M7gd_2xlarge -> `String "m7gd.2xlarge"
  | M7gd_xlarge -> `String "m7gd.xlarge"
  | M7gd_large -> `String "m7gd.large"
  | M7gd_medium -> `String "m7gd.medium"
  | M7a_16xlarge -> `String "m7a.16xlarge"
  | M7a_12xlarge -> `String "m7a.12xlarge"
  | M7a_8xlarge -> `String "m7a.8xlarge"
  | M7a_4xlarge -> `String "m7a.4xlarge"
  | M7a_2xlarge -> `String "m7a.2xlarge"
  | M7a_xlarge -> `String "m7a.xlarge"
  | M7a_large -> `String "m7a.large"
  | M7a_medium -> `String "m7a.medium"
  | M6i_16xlarge -> `String "m6i.16xlarge"
  | M6i_12xlarge -> `String "m6i.12xlarge"
  | M6i_8xlarge -> `String "m6i.8xlarge"
  | M6i_4xlarge -> `String "m6i.4xlarge"
  | M6i_2xlarge -> `String "m6i.2xlarge"
  | M6i_xlarge -> `String "m6i.xlarge"
  | M6i_large -> `String "m6i.large"
  | M6gd_16xlarge -> `String "m6gd.16xlarge"
  | M6gd_12xlarge -> `String "m6gd.12xlarge"
  | M6gd_8xlarge -> `String "m6gd.8xlarge"
  | M6gd_4xlarge -> `String "m6gd.4xlarge"
  | M6gd_2xlarge -> `String "m6gd.2xlarge"
  | M6gd_xlarge -> `String "m6gd.xlarge"
  | M6gd_large -> `String "m6gd.large"
  | M6gd_medium -> `String "m6gd.medium"
  | M6a_16xlarge -> `String "m6a.16xlarge"
  | M6a_12xlarge -> `String "m6a.12xlarge"
  | M6a_8xlarge -> `String "m6a.8xlarge"
  | M6a_4xlarge -> `String "m6a.4xlarge"
  | M6a_2xlarge -> `String "m6a.2xlarge"
  | M6a_xlarge -> `String "m6a.xlarge"
  | M6a_large -> `String "m6a.large"
  | C7i_16xlarge -> `String "c7i.16xlarge"
  | C7i_12xlarge -> `String "c7i.12xlarge"
  | C7i_8xlarge -> `String "c7i.8xlarge"
  | C7i_4xlarge -> `String "c7i.4xlarge"
  | C7i_2xlarge -> `String "c7i.2xlarge"
  | C7i_xlarge -> `String "c7i.xlarge"
  | C7i_large -> `String "c7i.large"
  | C7gn_16xlarge -> `String "c7gn.16xlarge"
  | C7gn_12xlarge -> `String "c7gn.12xlarge"
  | C7gn_8xlarge -> `String "c7gn.8xlarge"
  | C7gn_4xlarge -> `String "c7gn.4xlarge"
  | C7gn_2xlarge -> `String "c7gn.2xlarge"
  | C7gn_xlarge -> `String "c7gn.xlarge"
  | C7gn_large -> `String "c7gn.large"
  | C7gn_medium -> `String "c7gn.medium"
  | C7gd_16xlarge -> `String "c7gd.16xlarge"
  | C7gd_12xlarge -> `String "c7gd.12xlarge"
  | C7gd_8xlarge -> `String "c7gd.8xlarge"
  | C7gd_4xlarge -> `String "c7gd.4xlarge"
  | C7gd_2xlarge -> `String "c7gd.2xlarge"
  | C7gd_xlarge -> `String "c7gd.xlarge"
  | C7gd_large -> `String "c7gd.large"
  | C7gd_medium -> `String "c7gd.medium"
  | C7a_16xlarge -> `String "c7a.16xlarge"
  | C7a_12xlarge -> `String "c7a.12xlarge"
  | C7a_8xlarge -> `String "c7a.8xlarge"
  | C7a_4xlarge -> `String "c7a.4xlarge"
  | C7a_2xlarge -> `String "c7a.2xlarge"
  | C7a_xlarge -> `String "c7a.xlarge"
  | C7a_large -> `String "c7a.large"
  | C7a_medium -> `String "c7a.medium"
  | C6in_16xlarge -> `String "c6in.16xlarge"
  | C6in_12xlarge -> `String "c6in.12xlarge"
  | C6in_8xlarge -> `String "c6in.8xlarge"
  | C6in_4xlarge -> `String "c6in.4xlarge"
  | C6in_2xlarge -> `String "c6in.2xlarge"
  | C6in_xlarge -> `String "c6in.xlarge"
  | C6in_large -> `String "c6in.large"
  | C6gd_16xlarge -> `String "c6gd.16xlarge"
  | C6gd_12xlarge -> `String "c6gd.12xlarge"
  | C6gd_8xlarge -> `String "c6gd.8xlarge"
  | C6gd_4xlarge -> `String "c6gd.4xlarge"
  | C6gd_2xlarge -> `String "c6gd.2xlarge"
  | C6gd_xlarge -> `String "c6gd.xlarge"
  | C6gd_large -> `String "c6gd.large"
  | C6gd_medium -> `String "c6gd.medium"
  | R6i_16xlarge -> `String "r6i.16xlarge"
  | R6i_12xlarge -> `String "r6i.12xlarge"
  | R6i_8xlarge -> `String "r6i.8xlarge"
  | R6i_4xlarge -> `String "r6i.4xlarge"
  | R6i_2xlarge -> `String "r6i.2xlarge"
  | R6i_xlarge -> `String "r6i.xlarge"
  | R6i_large -> `String "r6i.large"
  | G5g_16xlarge -> `String "g5g.16xlarge"
  | G5g_8xlarge -> `String "g5g.8xlarge"
  | G5g_4xlarge -> `String "g5g.4xlarge"
  | G5g_2xlarge -> `String "g5g.2xlarge"
  | G5g_xlarge -> `String "g5g.xlarge"
  | M7g_16xlarge -> `String "m7g.16xlarge"
  | M7g_12xlarge -> `String "m7g.12xlarge"
  | M7g_8xlarge -> `String "m7g.8xlarge"
  | M7g_4xlarge -> `String "m7g.4xlarge"
  | M7g_2xlarge -> `String "m7g.2xlarge"
  | M7g_xlarge -> `String "m7g.xlarge"
  | M7g_large -> `String "m7g.large"
  | M7g_medium -> `String "m7g.medium"
  | R7g_16xlarge -> `String "r7g.16xlarge"
  | R7g_12xlarge -> `String "r7g.12xlarge"
  | R7g_8xlarge -> `String "r7g.8xlarge"
  | R7g_4xlarge -> `String "r7g.4xlarge"
  | R7g_2xlarge -> `String "r7g.2xlarge"
  | R7g_xlarge -> `String "r7g.xlarge"
  | R7g_large -> `String "r7g.large"
  | R7g_medium -> `String "r7g.medium"
  | C7g_16xlarge -> `String "c7g.16xlarge"
  | C7g_12xlarge -> `String "c7g.12xlarge"
  | C7g_8xlarge -> `String "c7g.8xlarge"
  | C7g_4xlarge -> `String "c7g.4xlarge"
  | C7g_2xlarge -> `String "c7g.2xlarge"
  | C7g_xlarge -> `String "c7g.xlarge"
  | C7g_large -> `String "c7g.large"
  | C7g_medium -> `String "c7g.medium"
  | C6gn_16xlarge -> `String "c6gn.16xlarge"
  | C6gn_12xlarge -> `String "c6gn.12xlarge"
  | C6gn_8xlarge -> `String "c6gn.8xlarge"
  | C6gn_4xlarge -> `String "c6gn.4xlarge"
  | C6gn_2xlarge -> `String "c6gn.2xlarge"
  | C6gn_xlarge -> `String "c6gn.xlarge"
  | C6gn_large -> `String "c6gn.large"
  | C6gn_medium -> `String "c6gn.medium"
  | R6g_16xlarge -> `String "r6g.16xlarge"
  | R6g_12xlarge -> `String "r6g.12xlarge"
  | R6g_8xlarge -> `String "r6g.8xlarge"
  | R6g_4xlarge -> `String "r6g.4xlarge"
  | R6g_2xlarge -> `String "r6g.2xlarge"
  | R6g_xlarge -> `String "r6g.xlarge"
  | R6g_large -> `String "r6g.large"
  | R6g_medium -> `String "r6g.medium"
  | C6g_16xlarge -> `String "c6g.16xlarge"
  | C6g_12xlarge -> `String "c6g.12xlarge"
  | C6g_8xlarge -> `String "c6g.8xlarge"
  | C6g_4xlarge -> `String "c6g.4xlarge"
  | C6g_2xlarge -> `String "c6g.2xlarge"
  | C6g_xlarge -> `String "c6g.xlarge"
  | C6g_large -> `String "c6g.large"
  | C6g_medium -> `String "c6g.medium"
  | M6g_16xlarge -> `String "m6g.16xlarge"
  | M6g_12xlarge -> `String "m6g.12xlarge"
  | M6g_8xlarge -> `String "m6g.8xlarge"
  | M6g_4xlarge -> `String "m6g.4xlarge"
  | M6g_2xlarge -> `String "m6g.2xlarge"
  | M6g_xlarge -> `String "m6g.xlarge"
  | M6g_large -> `String "m6g.large"
  | M6g_medium -> `String "m6g.medium"
  | R5d_24xlarge -> `String "r5d.24xlarge"
  | R5d_16xlarge -> `String "r5d.16xlarge"
  | R5d_12xlarge -> `String "r5d.12xlarge"
  | R5d_8xlarge -> `String "r5d.8xlarge"
  | R5d_4xlarge -> `String "r5d.4xlarge"
  | R5d_2xlarge -> `String "r5d.2xlarge"
  | R5d_xlarge -> `String "r5d.xlarge"
  | R5d_large -> `String "r5d.large"
  | C6i_24xlarge -> `String "c6i.24xlarge"
  | C6i_16xlarge -> `String "c6i.16xlarge"
  | C6i_12xlarge -> `String "c6i.12xlarge"
  | C6i_8xlarge -> `String "c6i.8xlarge"
  | C6i_4xlarge -> `String "c6i.4xlarge"
  | C6i_2xlarge -> `String "c6i.2xlarge"
  | C6i_xlarge -> `String "c6i.xlarge"
  | C6i_large -> `String "c6i.large"
  | C6a_24xlarge -> `String "c6a.24xlarge"
  | C6a_16xlarge -> `String "c6a.16xlarge"
  | C6a_12xlarge -> `String "c6a.12xlarge"
  | C6a_8xlarge -> `String "c6a.8xlarge"
  | C6a_4xlarge -> `String "c6a.4xlarge"
  | C6a_2xlarge -> `String "c6a.2xlarge"
  | C6a_xlarge -> `String "c6a.xlarge"
  | C6a_large -> `String "c6a.large"
  | C5d_24xlarge -> `String "c5d.24xlarge"
  | C5d_18xlarge -> `String "c5d.18xlarge"
  | C5d_12xlarge -> `String "c5d.12xlarge"
  | C5d_9xlarge -> `String "c5d.9xlarge"
  | C5d_4xlarge -> `String "c5d.4xlarge"
  | C5d_2xlarge -> `String "c5d.2xlarge"
  | C5d_xlarge -> `String "c5d.xlarge"
  | C5d_large -> `String "c5d.large"
  | M5a_24xlarge -> `String "m5a.24xlarge"
  | M5a_16xlarge -> `String "m5a.16xlarge"
  | M5a_12xlarge -> `String "m5a.12xlarge"
  | M5a_8xlarge -> `String "m5a.8xlarge"
  | M5a_4xlarge -> `String "m5a.4xlarge"
  | M5a_2xlarge -> `String "m5a.2xlarge"
  | M5a_xlarge -> `String "m5a.xlarge"
  | M5a_large -> `String "m5a.large"
  | M5_24xlarge -> `String "m5.24xlarge"
  | M5_16xlarge -> `String "m5.16xlarge"
  | M5_12xlarge -> `String "m5.12xlarge"
  | M5_8xlarge -> `String "m5.8xlarge"
  | M5_4xlarge -> `String "m5.4xlarge"
  | M5_2xlarge -> `String "m5.2xlarge"
  | M5_xlarge -> `String "m5.xlarge"
  | M5_large -> `String "m5.large"
  | M4_10xlarge -> `String "m4.10xlarge"
  | M4_4xlarge -> `String "m4.4xlarge"
  | M4_2xlarge -> `String "m4.2xlarge"
  | M4_xlarge -> `String "m4.xlarge"
  | M4_large -> `String "m4.large"
  | M3_2xlarge -> `String "m3.2xlarge"
  | M3_xlarge -> `String "m3.xlarge"
  | M3_large -> `String "m3.large"
  | M3_medium -> `String "m3.medium"
  | R5a_24xlarge -> `String "r5a.24xlarge"
  | R5a_16xlarge -> `String "r5a.16xlarge"
  | R5a_12xlarge -> `String "r5a.12xlarge"
  | R5a_8xlarge -> `String "r5a.8xlarge"
  | R5a_4xlarge -> `String "r5a.4xlarge"
  | R5a_2xlarge -> `String "r5a.2xlarge"
  | R5a_xlarge -> `String "r5a.xlarge"
  | R5a_large -> `String "r5a.large"
  | R5_24xlarge -> `String "r5.24xlarge"
  | R5_16xlarge -> `String "r5.16xlarge"
  | R5_12xlarge -> `String "r5.12xlarge"
  | R5_8xlarge -> `String "r5.8xlarge"
  | R5_4xlarge -> `String "r5.4xlarge"
  | R5_2xlarge -> `String "r5.2xlarge"
  | R5_xlarge -> `String "r5.xlarge"
  | R5_large -> `String "r5.large"
  | R4_16xlarge -> `String "r4.16xlarge"
  | R4_8xlarge -> `String "r4.8xlarge"
  | R4_4xlarge -> `String "r4.4xlarge"
  | R4_2xlarge -> `String "r4.2xlarge"
  | R4_xlarge -> `String "r4.xlarge"
  | R4_large -> `String "r4.large"
  | R3_8xlarge -> `String "r3.8xlarge"
  | R3_4xlarge -> `String "r3.4xlarge"
  | R3_2xlarge -> `String "r3.2xlarge"
  | R3_xlarge -> `String "r3.xlarge"
  | R3_large -> `String "r3.large"
  | C5a_24xlarge -> `String "c5a.24xlarge"
  | C5a_16xlarge -> `String "c5a.16xlarge"
  | C5a_12xlarge -> `String "c5a.12xlarge"
  | C5a_8xlarge -> `String "c5a.8xlarge"
  | C5a_4xlarge -> `String "c5a.4xlarge"
  | C5a_2xlarge -> `String "c5a.2xlarge"
  | C5a_xlarge -> `String "c5a.xlarge"
  | C5a_large -> `String "c5a.large"
  | C5_24xlarge -> `String "c5.24xlarge"
  | C5_18xlarge -> `String "c5.18xlarge"
  | C5_12xlarge -> `String "c5.12xlarge"
  | C5_9xlarge -> `String "c5.9xlarge"
  | C5_4xlarge -> `String "c5.4xlarge"
  | C5_2xlarge -> `String "c5.2xlarge"
  | C5_xlarge -> `String "c5.xlarge"
  | C5_large -> `String "c5.large"
  | C4_8xlarge -> `String "c4.8xlarge"
  | C4_4xlarge -> `String "c4.4xlarge"
  | C4_2xlarge -> `String "c4.2xlarge"
  | C4_xlarge -> `String "c4.xlarge"
  | C4_large -> `String "c4.large"
  | C3_8xlarge -> `String "c3.8xlarge"
  | C3_4xlarge -> `String "c3.4xlarge"
  | C3_2xlarge -> `String "c3.2xlarge"
  | C3_xlarge -> `String "c3.xlarge"
  | C3_large -> `String "c3.large"
  | T2_large -> `String "t2.large"
  | T2_medium -> `String "t2.medium"
  | T2_small -> `String "t2.small"
  | T2_micro -> `String "t2.micro"

let game_lift_service_sdk_endpoint_output_to_yojson = string_to_yojson
let game_lift_agent_endpoint_output_to_yojson = string_to_yojson
let instance_id_to_yojson = string_to_yojson

let container_attribute_to_yojson (x : container_attribute) =
  assoc_to_yojson
    [
      ("ContainerRuntimeId", option_to_yojson non_empty_string_to_yojson x.container_runtime_id);
      ("ContainerName", option_to_yojson non_zero_and128_max_ascii_string_to_yojson x.container_name);
    ]

let container_attributes_to_yojson tree = list_to_yojson container_attribute_to_yojson tree

let compute_to_yojson (x : compute) =
  assoc_to_yojson
    [
      ( "GameServerContainerGroupDefinitionArn",
        option_to_yojson container_group_definition_name_or_arn_to_yojson
          x.game_server_container_group_definition_arn );
      ("ContainerAttributes", option_to_yojson container_attributes_to_yojson x.container_attributes);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ( "GameLiftAgentEndpoint",
        option_to_yojson game_lift_agent_endpoint_output_to_yojson x.game_lift_agent_endpoint );
      ( "GameLiftServiceSdkEndpoint",
        option_to_yojson game_lift_service_sdk_endpoint_output_to_yojson
          x.game_lift_service_sdk_endpoint );
      ("Type", option_to_yojson ec2_instance_type_to_yojson x.type_);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("ComputeStatus", option_to_yojson compute_status_to_yojson x.compute_status);
      ("DnsName", option_to_yojson dns_name_to_yojson x.dns_name);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("ComputeArn", option_to_yojson compute_arn_to_yojson x.compute_arn);
      ("ComputeName", option_to_yojson compute_name_to_yojson x.compute_name);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let register_compute_output_to_yojson (x : register_compute_output) =
  assoc_to_yojson [ ("Compute", option_to_yojson compute_to_yojson x.compute) ]

let dns_name_input_to_yojson = string_to_yojson

let register_compute_input_to_yojson (x : register_compute_input) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("DnsName", option_to_yojson dns_name_input_to_yojson x.dns_name);
      ("CertificatePath", option_to_yojson non_zero_and_max_string_to_yojson x.certificate_path);
      ("ComputeName", Some (compute_name_to_yojson x.compute_name));
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let put_scaling_policy_output_to_yojson (x : put_scaling_policy_output) =
  assoc_to_yojson [ ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name) ]

let put_scaling_policy_input_to_yojson (x : put_scaling_policy_input) =
  assoc_to_yojson
    [
      ("TargetConfiguration", option_to_yojson target_configuration_to_yojson x.target_configuration);
      ("PolicyType", option_to_yojson policy_type_to_yojson x.policy_type);
      ("MetricName", Some (metric_name_to_yojson x.metric_name));
      ("EvaluationPeriods", option_to_yojson positive_integer_to_yojson x.evaluation_periods);
      ( "ComparisonOperator",
        option_to_yojson comparison_operator_type_to_yojson x.comparison_operator );
      ("Threshold", option_to_yojson double_to_yojson x.threshold);
      ( "ScalingAdjustmentType",
        option_to_yojson scaling_adjustment_type_to_yojson x.scaling_adjustment_type );
      ("ScalingAdjustment", option_to_yojson integer_to_yojson x.scaling_adjustment);
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("Name", Some (non_zero_and_max_string_to_yojson x.name));
    ]

let player_session_status_to_yojson (x : player_session_status) =
  match x with
  | TIMEDOUT -> `String "TIMEDOUT"
  | COMPLETED -> `String "COMPLETED"
  | ACTIVE -> `String "ACTIVE"
  | RESERVED -> `String "RESERVED"

let player_session_to_yojson (x : player_session) =
  assoc_to_yojson
    [
      ("PlayerData", option_to_yojson player_data_to_yojson x.player_data);
      ("Port", option_to_yojson port_number_to_yojson x.port);
      ("DnsName", option_to_yojson dns_name_to_yojson x.dns_name);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("Status", option_to_yojson player_session_status_to_yojson x.status);
      ("TerminationTime", option_to_yojson timestamp_to_yojson x.termination_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("GameSessionId", option_to_yojson non_zero_and_max_string_to_yojson x.game_session_id);
      ("PlayerId", option_to_yojson player_id_to_yojson x.player_id);
      ("PlayerSessionId", option_to_yojson player_session_id_to_yojson x.player_session_id);
    ]

let player_session_list_to_yojson tree = list_to_yojson player_session_to_yojson tree
let player_ids_for_accept_match_to_yojson tree = list_to_yojson player_id_to_yojson tree
let player_id_list_to_yojson tree = list_to_yojson player_id_to_yojson tree

let game_server_ip_protocol_supported_to_yojson (x : game_server_ip_protocol_supported) =
  match x with DUAL_STACK -> `String "DUAL_STACK" | IPv4 -> `String "IPv4"

let player_gateway_configuration_to_yojson (x : player_gateway_configuration) =
  assoc_to_yojson
    [
      ( "GameServerIpProtocolSupported",
        option_to_yojson game_server_ip_protocol_supported_to_yojson
          x.game_server_ip_protocol_supported );
    ]

let player_data_map_to_yojson tree =
  map_to_yojson non_zero_and_max_string_to_yojson player_data_to_yojson tree

let player_connection_endpoint_to_yojson (x : player_connection_endpoint) =
  assoc_to_yojson
    [
      ("Port", option_to_yojson port_number_to_yojson x.port);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
    ]

let player_connection_endpoint_list_to_yojson tree =
  list_to_yojson player_connection_endpoint_to_yojson tree

let max_string_to_yojson = string_to_yojson

let player_connection_detail_to_yojson (x : player_connection_detail) =
  assoc_to_yojson
    [
      ("Expiration", option_to_yojson timestamp_to_yojson x.expiration);
      ("PlayerGatewayToken", option_to_yojson max_string_to_yojson x.player_gateway_token);
      ("Endpoints", option_to_yojson player_connection_endpoint_list_to_yojson x.endpoints);
      ("PlayerId", option_to_yojson player_id_to_yojson x.player_id);
    ]

let player_connection_detail_list_to_yojson tree =
  list_to_yojson player_connection_detail_to_yojson tree

let ping_beacon_to_yojson (x : ping_beacon) =
  assoc_to_yojson [ ("UDPEndpoint", option_to_yojson udp_endpoint_to_yojson x.udp_endpoint) ]

let out_of_capacity_exception_to_yojson (x : out_of_capacity_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let matchmaking_ticket_list_to_yojson tree = list_to_yojson matchmaking_ticket_to_yojson tree

let matchmaking_rule_set_name_list_to_yojson tree =
  list_to_yojson matchmaking_rule_set_name_to_yojson tree

let matchmaking_rule_set_to_yojson (x : matchmaking_rule_set) =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("RuleSetBody", Some (rule_set_body_to_yojson x.rule_set_body));
      ("RuleSetArn", option_to_yojson matchmaking_rule_set_arn_to_yojson x.rule_set_arn);
      ("RuleSetName", option_to_yojson matchmaking_id_string_model_to_yojson x.rule_set_name);
    ]

let matchmaking_rule_set_list_to_yojson tree = list_to_yojson matchmaking_rule_set_to_yojson tree
let matchmaking_id_list_to_yojson tree = list_to_yojson matchmaking_id_string_model_to_yojson tree

let matchmaking_configuration_name_list_to_yojson tree =
  list_to_yojson matchmaking_configuration_name_to_yojson tree

let matchmaking_configuration_list_to_yojson tree =
  list_to_yojson matchmaking_configuration_to_yojson tree

let deployment_status_to_yojson (x : deployment_status) =
  match x with
  | PENDING -> `String "PENDING"
  | CANCELLED -> `String "CANCELLED"
  | ROLLBACK_COMPLETE -> `String "ROLLBACK_COMPLETE"
  | ROLLBACK_IN_PROGRESS -> `String "ROLLBACK_IN_PROGRESS"
  | COMPLETE -> `String "COMPLETE"
  | IMPAIRED -> `String "IMPAIRED"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let locational_deployment_to_yojson (x : locational_deployment) =
  assoc_to_yojson
    [ ("DeploymentStatus", option_to_yojson deployment_status_to_yojson x.deployment_status) ]

let locational_deployments_to_yojson tree =
  map_to_yojson non_zero_and128_max_ascii_string_to_yojson locational_deployment_to_yojson tree

let fleet_status_to_yojson (x : fleet_status) =
  match x with
  | NOT_FOUND -> `String "NOT_FOUND"
  | TERMINATED -> `String "TERMINATED"
  | ERROR -> `String "ERROR"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | ACTIVATING -> `String "ACTIVATING"
  | BUILDING -> `String "BUILDING"
  | VALIDATING -> `String "VALIDATING"
  | DOWNLOADING -> `String "DOWNLOADING"
  | NEW -> `String "NEW"

let location_state_to_yojson (x : location_state) =
  assoc_to_yojson
    [
      ( "PlayerGatewayStatus",
        option_to_yojson player_gateway_status_to_yojson x.player_gateway_status );
      ("Status", option_to_yojson fleet_status_to_yojson x.status);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
    ]

let location_state_list_to_yojson tree = list_to_yojson location_state_to_yojson tree
let location_arn_model_to_yojson = string_to_yojson

let location_model_to_yojson (x : location_model) =
  assoc_to_yojson
    [
      ("PingBeacon", option_to_yojson ping_beacon_to_yojson x.ping_beacon);
      ("LocationArn", option_to_yojson location_arn_model_to_yojson x.location_arn);
      ("LocationName", option_to_yojson location_string_model_to_yojson x.location_name);
    ]

let location_model_list_to_yojson tree = list_to_yojson location_model_to_yojson tree

let location_filter_to_yojson (x : location_filter) =
  match x with CUSTOM -> `String "CUSTOM" | AWS -> `String "AWS"

let location_filter_list_to_yojson tree = list_to_yojson location_filter_to_yojson tree

let location_configuration_to_yojson (x : location_configuration) =
  assoc_to_yojson [ ("Location", Some (location_string_model_to_yojson x.location)) ]

let location_configuration_list_to_yojson tree =
  list_to_yojson location_configuration_to_yojson tree

let location_attributes_to_yojson (x : location_attributes) =
  assoc_to_yojson
    [
      ("UpdateStatus", option_to_yojson location_update_status_to_yojson x.update_status);
      ("StoppedActions", option_to_yojson fleet_action_list_to_yojson x.stopped_actions);
      ("LocationState", option_to_yojson location_state_to_yojson x.location_state);
    ]

let location_attributes_list_to_yojson tree = list_to_yojson location_attributes_to_yojson tree

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let list_scripts_output_to_yojson (x : list_scripts_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
      ("Scripts", option_to_yojson script_list_to_yojson x.scripts);
    ]

let list_scripts_input_to_yojson (x : list_scripts_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
    ]

let list_locations_output_to_yojson (x : list_locations_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Locations", option_to_yojson location_model_list_to_yojson x.locations);
    ]

let list_locations_limit_to_yojson = int_to_yojson

let list_locations_input_to_yojson (x : list_locations_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson list_locations_limit_to_yojson x.limit);
      ("Filters", option_to_yojson location_filter_list_to_yojson x.filters);
    ]

let game_servers_to_yojson tree = list_to_yojson game_server_to_yojson tree

let list_game_servers_output_to_yojson (x : list_game_servers_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("GameServers", option_to_yojson game_servers_to_yojson x.game_servers);
    ]

let list_game_servers_input_to_yojson (x : list_game_servers_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
    ]

let game_server_groups_to_yojson tree = list_to_yojson game_server_group_to_yojson tree

let list_game_server_groups_output_to_yojson (x : list_game_server_groups_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("GameServerGroups", option_to_yojson game_server_groups_to_yojson x.game_server_groups);
    ]

let list_game_server_groups_input_to_yojson (x : list_game_server_groups_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
    ]

let fleet_id_list_to_yojson tree = list_to_yojson fleet_id_to_yojson tree

let list_fleets_output_to_yojson (x : list_fleets_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("FleetIds", option_to_yojson fleet_id_list_to_yojson x.fleet_ids);
    ]

let list_fleets_input_to_yojson (x : list_fleets_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("ScriptId", option_to_yojson script_id_or_arn_to_yojson x.script_id);
      ("BuildId", option_to_yojson build_id_or_arn_to_yojson x.build_id);
    ]

let fleet_binary_arn_to_yojson = string_to_yojson

let fleet_deployment_to_yojson (x : fleet_deployment) =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "DeploymentConfiguration",
        option_to_yojson deployment_configuration_to_yojson x.deployment_configuration );
      ("DeploymentStatus", option_to_yojson deployment_status_to_yojson x.deployment_status);
      ( "RollbackPerInstanceBinaryArn",
        option_to_yojson fleet_binary_arn_to_yojson x.rollback_per_instance_binary_arn );
      ("PerInstanceBinaryArn", option_to_yojson fleet_binary_arn_to_yojson x.per_instance_binary_arn);
      ( "RollbackGameServerBinaryArn",
        option_to_yojson fleet_binary_arn_to_yojson x.rollback_game_server_binary_arn );
      ("GameServerBinaryArn", option_to_yojson fleet_binary_arn_to_yojson x.game_server_binary_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("DeploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
    ]

let fleet_deployments_to_yojson tree = list_to_yojson fleet_deployment_to_yojson tree

let list_fleet_deployments_output_to_yojson (x : list_fleet_deployments_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("FleetDeployments", option_to_yojson fleet_deployments_to_yojson x.fleet_deployments);
    ]

let list_fleet_deployments_input_to_yojson (x : list_fleet_deployments_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
    ]

let container_group_definition_list_to_yojson tree =
  list_to_yojson container_group_definition_to_yojson tree

let list_container_group_definitions_output_to_yojson (x : list_container_group_definitions_output)
    =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ( "ContainerGroupDefinitions",
        option_to_yojson container_group_definition_list_to_yojson x.container_group_definitions );
    ]

let list_container_group_definitions_limit_to_yojson = int_to_yojson

let list_container_group_definitions_input_to_yojson (x : list_container_group_definitions_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson list_container_group_definitions_limit_to_yojson x.limit);
      ("ContainerGroupType", option_to_yojson container_group_type_to_yojson x.container_group_type);
    ]

let list_container_group_definition_versions_output_to_yojson
    (x : list_container_group_definition_versions_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ( "ContainerGroupDefinitions",
        option_to_yojson container_group_definition_list_to_yojson x.container_group_definitions );
    ]

let list_container_group_definition_versions_limit_to_yojson = int_to_yojson

let list_container_group_definition_versions_input_to_yojson
    (x : list_container_group_definition_versions_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson list_container_group_definition_versions_limit_to_yojson x.limit);
      ("Name", Some (container_group_definition_name_or_arn_to_yojson x.name));
    ]

let container_fleet_list_to_yojson tree = list_to_yojson container_fleet_to_yojson tree

let list_container_fleets_output_to_yojson (x : list_container_fleets_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("ContainerFleets", option_to_yojson container_fleet_list_to_yojson x.container_fleets);
    ]

let list_container_fleets_input_to_yojson (x : list_container_fleets_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ( "ContainerGroupDefinitionName",
        option_to_yojson container_group_definition_name_or_arn_to_yojson
          x.container_group_definition_name );
    ]

let compute_list_to_yojson tree = list_to_yojson compute_to_yojson tree

let list_compute_output_to_yojson (x : list_compute_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("ComputeList", option_to_yojson compute_list_to_yojson x.compute_list);
    ]

let list_compute_input_status_to_yojson (x : list_compute_input_status) =
  match x with IMPAIRED -> `String "IMPAIRED" | ACTIVE -> `String "ACTIVE"

let list_compute_input_to_yojson (x : list_compute_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("ComputeStatus", option_to_yojson list_compute_input_status_to_yojson x.compute_status);
      ( "ContainerGroupDefinitionName",
        option_to_yojson container_group_definition_name_or_arn_to_yojson
          x.container_group_definition_name );
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let build_list_to_yojson tree = list_to_yojson build_to_yojson tree

let list_builds_output_to_yojson (x : list_builds_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
      ("Builds", option_to_yojson build_list_to_yojson x.builds);
    ]

let list_builds_input_to_yojson (x : list_builds_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("Status", option_to_yojson build_status_to_yojson x.status);
    ]

let alias_list_to_yojson tree = list_to_yojson alias_to_yojson tree

let list_aliases_output_to_yojson (x : list_aliases_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
      ("Aliases", option_to_yojson alias_list_to_yojson x.aliases);
    ]

let list_aliases_input_to_yojson (x : list_aliases_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("Name", option_to_yojson non_empty_string_to_yojson x.name);
      ( "RoutingStrategyType",
        option_to_yojson routing_strategy_type_to_yojson x.routing_strategy_type );
    ]

let launch_template_version_to_yojson = string_to_yojson
let launch_template_id_to_yojson = string_to_yojson
let launch_template_name_to_yojson = string_to_yojson

let launch_template_specification_to_yojson (x : launch_template_specification) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson launch_template_version_to_yojson x.version);
      ("LaunchTemplateName", option_to_yojson launch_template_name_to_yojson x.launch_template_name);
      ("LaunchTemplateId", option_to_yojson launch_template_id_to_yojson x.launch_template_id);
    ]

let instance_status_to_yojson (x : instance_status) =
  match x with
  | TERMINATING -> `String "TERMINATING"
  | ACTIVE -> `String "ACTIVE"
  | PENDING -> `String "PENDING"

let instance_role_credentials_provider_to_yojson (x : instance_role_credentials_provider) =
  match x with SHARED_CREDENTIAL_FILE -> `String "SHARED_CREDENTIAL_FILE"

let instance_to_yojson (x : instance) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Status", option_to_yojson instance_status_to_yojson x.status);
      ("Type", option_to_yojson ec2_instance_type_to_yojson x.type_);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("DnsName", option_to_yojson dns_name_to_yojson x.dns_name);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let instance_list_to_yojson tree = list_to_yojson instance_to_yojson tree

let instance_credentials_to_yojson (x : instance_credentials) =
  assoc_to_yojson
    [
      ("Secret", option_to_yojson non_empty_string_to_yojson x.secret);
      ("UserName", option_to_yojson non_empty_string_to_yojson x.user_name);
    ]

let instance_access_to_yojson (x : instance_access) =
  assoc_to_yojson
    [
      ("Credentials", option_to_yojson instance_credentials_to_yojson x.credentials);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let idempotent_parameter_mismatch_exception_to_yojson (x : idempotent_parameter_mismatch_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let get_player_connection_details_output_to_yojson (x : get_player_connection_details_output) =
  assoc_to_yojson
    [
      ( "PlayerConnectionDetails",
        option_to_yojson player_connection_detail_list_to_yojson x.player_connection_details );
      ("GameSessionId", option_to_yojson arn_string_model_to_yojson x.game_session_id);
    ]

let get_player_connection_details_input_to_yojson (x : get_player_connection_details_input) =
  assoc_to_yojson
    [
      ("PlayerIds", Some (player_id_list_to_yojson x.player_ids));
      ("GameSessionId", Some (arn_string_model_to_yojson x.game_session_id));
    ]

let get_instance_access_output_to_yojson (x : get_instance_access_output) =
  assoc_to_yojson
    [ ("InstanceAccess", option_to_yojson instance_access_to_yojson x.instance_access) ]

let get_instance_access_input_to_yojson (x : get_instance_access_input) =
  assoc_to_yojson
    [
      ("InstanceId", Some (instance_id_to_yojson x.instance_id));
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let get_game_session_log_url_output_to_yojson (x : get_game_session_log_url_output) =
  assoc_to_yojson
    [ ("PreSignedUrl", option_to_yojson non_zero_and_max_string_to_yojson x.pre_signed_url) ]

let get_game_session_log_url_input_to_yojson (x : get_game_session_log_url_input) =
  assoc_to_yojson [ ("GameSessionId", Some (arn_string_model_to_yojson x.game_session_id)) ]

let compute_name_or_arn_to_yojson = string_to_yojson
let compute_auth_token_to_yojson = string_to_yojson

let get_compute_auth_token_output_to_yojson (x : get_compute_auth_token_output) =
  assoc_to_yojson
    [
      ("ExpirationTimestamp", option_to_yojson timestamp_to_yojson x.expiration_timestamp);
      ("AuthToken", option_to_yojson compute_auth_token_to_yojson x.auth_token);
      ("ComputeArn", option_to_yojson compute_arn_to_yojson x.compute_arn);
      ("ComputeName", option_to_yojson compute_name_or_arn_to_yojson x.compute_name);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
    ]

let get_compute_auth_token_input_to_yojson (x : get_compute_auth_token_input) =
  assoc_to_yojson
    [
      ("ComputeName", Some (compute_name_or_arn_to_yojson x.compute_name));
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let container_identifier_to_yojson (x : container_identifier) =
  assoc_to_yojson
    [
      ("ContainerRuntimeId", option_to_yojson non_empty_string_to_yojson x.container_runtime_id);
      ("ContainerName", option_to_yojson non_zero_and128_max_ascii_string_to_yojson x.container_name);
    ]

let container_identifier_list_to_yojson tree = list_to_yojson container_identifier_to_yojson tree

let get_compute_access_output_to_yojson (x : get_compute_access_output) =
  assoc_to_yojson
    [
      ( "ContainerIdentifiers",
        option_to_yojson container_identifier_list_to_yojson x.container_identifiers );
      ("Target", option_to_yojson session_target_to_yojson x.target);
      ("Credentials", option_to_yojson aws_credentials_to_yojson x.credentials);
      ("ComputeArn", option_to_yojson compute_arn_to_yojson x.compute_arn);
      ("ComputeName", option_to_yojson compute_name_or_arn_to_yojson x.compute_name);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
    ]

let get_compute_access_input_to_yojson (x : get_compute_access_input) =
  assoc_to_yojson
    [
      ("ComputeName", Some (compute_name_or_arn_to_yojson x.compute_name));
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let game_session_queue_name_or_arn_list_to_yojson tree =
  list_to_yojson game_session_queue_name_or_arn_to_yojson tree

let game_session_queue_list_to_yojson tree = list_to_yojson game_session_queue_to_yojson tree

let game_session_full_exception_to_yojson (x : game_session_full_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let game_session_detail_to_yojson (x : game_session_detail) =
  assoc_to_yojson
    [
      ("ProtectionPolicy", option_to_yojson protection_policy_to_yojson x.protection_policy);
      ("GameSession", option_to_yojson game_session_to_yojson x.game_session);
    ]

let game_session_detail_list_to_yojson tree = list_to_yojson game_session_detail_to_yojson tree

let game_server_instance_status_to_yojson (x : game_server_instance_status) =
  match x with
  | SPOT_TERMINATING -> `String "SPOT_TERMINATING"
  | DRAINING -> `String "DRAINING"
  | ACTIVE -> `String "ACTIVE"

let game_server_instance_to_yojson (x : game_server_instance) =
  assoc_to_yojson
    [
      ("InstanceStatus", option_to_yojson game_server_instance_status_to_yojson x.instance_status);
      ("InstanceId", option_to_yojson game_server_instance_id_to_yojson x.instance_id);
      ( "GameServerGroupArn",
        option_to_yojson game_server_group_arn_to_yojson x.game_server_group_arn );
      ( "GameServerGroupName",
        option_to_yojson game_server_group_name_to_yojson x.game_server_group_name );
    ]

let game_server_instances_to_yojson tree = list_to_yojson game_server_instance_to_yojson tree
let game_server_instance_ids_to_yojson tree = list_to_yojson game_server_instance_id_to_yojson tree

let game_server_group_delete_option_to_yojson (x : game_server_group_delete_option) =
  match x with
  | RETAIN -> `String "RETAIN"
  | FORCE_DELETE -> `String "FORCE_DELETE"
  | SAFE_DELETE -> `String "SAFE_DELETE"

let game_server_group_auto_scaling_policy_to_yojson (x : game_server_group_auto_scaling_policy) =
  assoc_to_yojson
    [
      ( "TargetTrackingConfiguration",
        Some (target_tracking_configuration_to_yojson x.target_tracking_configuration) );
      ( "EstimatedInstanceWarmup",
        option_to_yojson positive_integer_to_yojson x.estimated_instance_warmup );
    ]

let game_server_container_group_counts_to_yojson (x : game_server_container_group_counts) =
  assoc_to_yojson
    [
      ("TERMINATING", option_to_yojson whole_number_to_yojson x.terminatin_g);
      ("IDLE", option_to_yojson whole_number_to_yojson x.idl_e);
      ("ACTIVE", option_to_yojson whole_number_to_yojson x.activ_e);
      ("PENDING", option_to_yojson whole_number_to_yojson x.pendin_g);
    ]

let describe_vpc_peering_connections_output_to_yojson (x : describe_vpc_peering_connections_output)
    =
  assoc_to_yojson
    [
      ( "VpcPeeringConnections",
        option_to_yojson vpc_peering_connection_list_to_yojson x.vpc_peering_connections );
    ]

let describe_vpc_peering_connections_input_to_yojson (x : describe_vpc_peering_connections_input) =
  assoc_to_yojson [ ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id) ]

let describe_vpc_peering_authorizations_output_to_yojson
    (x : describe_vpc_peering_authorizations_output) =
  assoc_to_yojson
    [
      ( "VpcPeeringAuthorizations",
        option_to_yojson vpc_peering_authorization_list_to_yojson x.vpc_peering_authorizations );
    ]

let describe_vpc_peering_authorizations_input_to_yojson = unit_to_yojson

let describe_script_output_to_yojson (x : describe_script_output) =
  assoc_to_yojson [ ("Script", option_to_yojson script_to_yojson x.script) ]

let describe_script_input_to_yojson (x : describe_script_input) =
  assoc_to_yojson [ ("ScriptId", Some (script_id_or_arn_to_yojson x.script_id)) ]

let describe_scaling_policies_output_to_yojson (x : describe_scaling_policies_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("ScalingPolicies", option_to_yojson scaling_policy_list_to_yojson x.scaling_policies);
    ]

let describe_scaling_policies_input_to_yojson (x : describe_scaling_policies_input) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("StatusFilter", option_to_yojson scaling_status_type_to_yojson x.status_filter);
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let describe_runtime_configuration_output_to_yojson (x : describe_runtime_configuration_output) =
  assoc_to_yojson
    [
      ( "RuntimeConfiguration",
        option_to_yojson runtime_configuration_to_yojson x.runtime_configuration );
    ]

let describe_runtime_configuration_input_to_yojson (x : describe_runtime_configuration_input) =
  assoc_to_yojson [ ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id)) ]

let describe_player_sessions_output_to_yojson (x : describe_player_sessions_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("PlayerSessions", option_to_yojson player_session_list_to_yojson x.player_sessions);
    ]

let describe_player_sessions_input_to_yojson (x : describe_player_sessions_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ( "PlayerSessionStatusFilter",
        option_to_yojson non_zero_and_max_string_to_yojson x.player_session_status_filter );
      ("PlayerSessionId", option_to_yojson player_session_id_to_yojson x.player_session_id);
      ("PlayerId", option_to_yojson player_id_to_yojson x.player_id);
      ("GameSessionId", option_to_yojson arn_string_model_to_yojson x.game_session_id);
    ]

let describe_matchmaking_rule_sets_output_to_yojson (x : describe_matchmaking_rule_sets_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("RuleSets", Some (matchmaking_rule_set_list_to_yojson x.rule_sets));
    ]

let describe_matchmaking_rule_sets_input_to_yojson (x : describe_matchmaking_rule_sets_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson rule_set_limit_to_yojson x.limit);
      ("Names", option_to_yojson matchmaking_rule_set_name_list_to_yojson x.names);
    ]

let describe_matchmaking_configurations_output_to_yojson
    (x : describe_matchmaking_configurations_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Configurations", option_to_yojson matchmaking_configuration_list_to_yojson x.configurations);
    ]

let describe_matchmaking_configurations_input_to_yojson
    (x : describe_matchmaking_configurations_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("RuleSetName", option_to_yojson matchmaking_rule_set_name_to_yojson x.rule_set_name);
      ("Names", option_to_yojson matchmaking_configuration_name_list_to_yojson x.names);
    ]

let describe_matchmaking_output_to_yojson (x : describe_matchmaking_output) =
  assoc_to_yojson
    [ ("TicketList", option_to_yojson matchmaking_ticket_list_to_yojson x.ticket_list) ]

let describe_matchmaking_input_to_yojson (x : describe_matchmaking_input) =
  assoc_to_yojson [ ("TicketIds", Some (matchmaking_id_list_to_yojson x.ticket_ids)) ]

let describe_instances_output_to_yojson (x : describe_instances_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Instances", option_to_yojson instance_list_to_yojson x.instances);
    ]

let describe_instances_input_to_yojson (x : describe_instances_input) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let describe_game_sessions_output_to_yojson (x : describe_game_sessions_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("GameSessions", option_to_yojson game_session_list_to_yojson x.game_sessions);
    ]

let describe_game_sessions_input_to_yojson (x : describe_game_sessions_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("StatusFilter", option_to_yojson non_zero_and_max_string_to_yojson x.status_filter);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("AliasId", option_to_yojson alias_id_or_arn_to_yojson x.alias_id);
      ("GameSessionId", option_to_yojson arn_string_model_to_yojson x.game_session_id);
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
    ]

let describe_game_session_queues_output_to_yojson (x : describe_game_session_queues_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("GameSessionQueues", option_to_yojson game_session_queue_list_to_yojson x.game_session_queues);
    ]

let describe_game_session_queues_input_to_yojson (x : describe_game_session_queues_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("Names", option_to_yojson game_session_queue_name_or_arn_list_to_yojson x.names);
    ]

let describe_game_session_placement_output_to_yojson (x : describe_game_session_placement_output) =
  assoc_to_yojson
    [
      ( "GameSessionPlacement",
        option_to_yojson game_session_placement_to_yojson x.game_session_placement );
    ]

let describe_game_session_placement_input_to_yojson (x : describe_game_session_placement_input) =
  assoc_to_yojson [ ("PlacementId", Some (id_string_model_to_yojson x.placement_id)) ]

let describe_game_session_details_output_to_yojson (x : describe_game_session_details_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ( "GameSessionDetails",
        option_to_yojson game_session_detail_list_to_yojson x.game_session_details );
    ]

let describe_game_session_details_input_to_yojson (x : describe_game_session_details_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("StatusFilter", option_to_yojson non_zero_and_max_string_to_yojson x.status_filter);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("AliasId", option_to_yojson alias_id_or_arn_to_yojson x.alias_id);
      ("GameSessionId", option_to_yojson arn_string_model_to_yojson x.game_session_id);
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
    ]

let describe_game_server_instances_output_to_yojson (x : describe_game_server_instances_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ( "GameServerInstances",
        option_to_yojson game_server_instances_to_yojson x.game_server_instances );
    ]

let describe_game_server_instances_input_to_yojson (x : describe_game_server_instances_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("InstanceIds", option_to_yojson game_server_instance_ids_to_yojson x.instance_ids);
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
    ]

let describe_game_server_group_output_to_yojson (x : describe_game_server_group_output) =
  assoc_to_yojson
    [ ("GameServerGroup", option_to_yojson game_server_group_to_yojson x.game_server_group) ]

let describe_game_server_group_input_to_yojson (x : describe_game_server_group_input) =
  assoc_to_yojson
    [
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
    ]

let describe_game_server_output_to_yojson (x : describe_game_server_output) =
  assoc_to_yojson [ ("GameServer", option_to_yojson game_server_to_yojson x.game_server) ]

let describe_game_server_input_to_yojson (x : describe_game_server_input) =
  assoc_to_yojson
    [
      ("GameServerId", Some (game_server_id_to_yojson x.game_server_id));
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
    ]

let fleet_utilization_to_yojson (x : fleet_utilization) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ( "MaximumPlayerSessionCount",
        option_to_yojson whole_number_to_yojson x.maximum_player_session_count );
      ( "CurrentPlayerSessionCount",
        option_to_yojson whole_number_to_yojson x.current_player_session_count );
      ("ActiveGameSessionCount", option_to_yojson whole_number_to_yojson x.active_game_session_count);
      ( "ActiveServerProcessCount",
        option_to_yojson whole_number_to_yojson x.active_server_process_count );
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let fleet_utilization_list_to_yojson tree = list_to_yojson fleet_utilization_to_yojson tree

let describe_fleet_utilization_output_to_yojson (x : describe_fleet_utilization_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("FleetUtilization", option_to_yojson fleet_utilization_list_to_yojson x.fleet_utilization);
    ]

let fleet_id_or_arn_list_to_yojson tree = list_to_yojson fleet_id_or_arn_to_yojson tree

let describe_fleet_utilization_input_to_yojson (x : describe_fleet_utilization_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("FleetIds", option_to_yojson fleet_id_or_arn_list_to_yojson x.fleet_ids);
    ]

let describe_fleet_port_settings_output_to_yojson (x : describe_fleet_port_settings_output) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("UpdateStatus", option_to_yojson location_update_status_to_yojson x.update_status);
      ("InboundPermissions", option_to_yojson ip_permissions_list_to_yojson x.inbound_permissions);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let describe_fleet_port_settings_input_to_yojson (x : describe_fleet_port_settings_input) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let describe_fleet_location_utilization_output_to_yojson
    (x : describe_fleet_location_utilization_output) =
  assoc_to_yojson
    [ ("FleetUtilization", option_to_yojson fleet_utilization_to_yojson x.fleet_utilization) ]

let describe_fleet_location_utilization_input_to_yojson
    (x : describe_fleet_location_utilization_input) =
  assoc_to_yojson
    [
      ("Location", Some (location_string_model_to_yojson x.location));
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let ec2_instance_counts_to_yojson (x : ec2_instance_counts) =
  assoc_to_yojson
    [
      ("TERMINATING", option_to_yojson whole_number_to_yojson x.terminatin_g);
      ("IDLE", option_to_yojson whole_number_to_yojson x.idl_e);
      ("ACTIVE", option_to_yojson whole_number_to_yojson x.activ_e);
      ("PENDING", option_to_yojson whole_number_to_yojson x.pendin_g);
      ("MAXIMUM", option_to_yojson whole_number_to_yojson x.maximu_m);
      ("MINIMUM", option_to_yojson whole_number_to_yojson x.minimu_m);
      ("DESIRED", option_to_yojson whole_number_to_yojson x.desire_d);
    ]

let fleet_capacity_to_yojson (x : fleet_capacity) =
  assoc_to_yojson
    [
      ( "ManagedCapacityConfiguration",
        option_to_yojson managed_capacity_configuration_to_yojson x.managed_capacity_configuration
      );
      ( "GameServerContainerGroupCounts",
        option_to_yojson game_server_container_group_counts_to_yojson
          x.game_server_container_group_counts );
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("InstanceCounts", option_to_yojson ec2_instance_counts_to_yojson x.instance_counts);
      ("InstanceType", option_to_yojson ec2_instance_type_to_yojson x.instance_type);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let describe_fleet_location_capacity_output_to_yojson (x : describe_fleet_location_capacity_output)
    =
  assoc_to_yojson [ ("FleetCapacity", option_to_yojson fleet_capacity_to_yojson x.fleet_capacity) ]

let describe_fleet_location_capacity_input_to_yojson (x : describe_fleet_location_capacity_input) =
  assoc_to_yojson
    [
      ("Location", Some (location_string_model_to_yojson x.location));
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let describe_fleet_location_attributes_output_to_yojson
    (x : describe_fleet_location_attributes_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ( "LocationAttributes",
        option_to_yojson location_attributes_list_to_yojson x.location_attributes );
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
    ]

let describe_fleet_location_attributes_input_to_yojson
    (x : describe_fleet_location_attributes_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("Locations", option_to_yojson location_list_to_yojson x.locations);
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let event_code_to_yojson (x : event_code) =
  match x with
  | LOCATION_STATE_DELETED -> `String "LOCATION_STATE_DELETED"
  | LOCATION_STATE_DELETING -> `String "LOCATION_STATE_DELETING"
  | LOCATION_STATE_ERROR -> `String "LOCATION_STATE_ERROR"
  | LOCATION_STATE_UPDATING -> `String "LOCATION_STATE_UPDATING"
  | LOCATION_STATE_ACTIVE -> `String "LOCATION_STATE_ACTIVE"
  | LOCATION_STATE_ACTIVATING -> `String "LOCATION_STATE_ACTIVATING"
  | LOCATION_STATE_CREATED -> `String "LOCATION_STATE_CREATED"
  | LOCATION_STATE_CREATING -> `String "LOCATION_STATE_CREATING"
  | LOCATION_STATE_PENDING -> `String "LOCATION_STATE_PENDING"
  | GAME_SERVER_CONTAINER_GROUP_REPLACED_UNHEALTHY ->
      `String "GAME_SERVER_CONTAINER_GROUP_REPLACED_UNHEALTHY"
  | PER_INSTANCE_CONTAINER_GROUP_CRASHED -> `String "PER_INSTANCE_CONTAINER_GROUP_CRASHED"
  | GAME_SERVER_CONTAINER_GROUP_CRASHED -> `String "GAME_SERVER_CONTAINER_GROUP_CRASHED"
  | COMPUTE_LOG_UPLOAD_FAILED -> `String "COMPUTE_LOG_UPLOAD_FAILED"
  | FLEET_CREATION_FAILED_INSTALLER -> `String "FLEET_CREATION_FAILED_INSTALLER"
  | FLEET_CREATION_COMPLETED_INSTALLER -> `String "FLEET_CREATION_COMPLETED_INSTALLER"
  | INSTANCE_REPLACED_UNHEALTHY -> `String "INSTANCE_REPLACED_UNHEALTHY"
  | INSTANCE_RECYCLED -> `String "INSTANCE_RECYCLED"
  | INSTANCE_INTERRUPTED -> `String "INSTANCE_INTERRUPTED"
  | FLEET_VPC_PEERING_DELETED -> `String "FLEET_VPC_PEERING_DELETED"
  | FLEET_VPC_PEERING_FAILED -> `String "FLEET_VPC_PEERING_FAILED"
  | FLEET_VPC_PEERING_SUCCEEDED -> `String "FLEET_VPC_PEERING_SUCCEEDED"
  | FLEET_CREATION_VALIDATING_RUNTIME_CONFIG -> `String "FLEET_CREATION_VALIDATING_RUNTIME_CONFIG"
  | FLEET_CREATION_RUNNING_INSTALLER -> `String "FLEET_CREATION_RUNNING_INSTALLER"
  | FLEET_CREATION_EXTRACTING_BUILD -> `String "FLEET_CREATION_EXTRACTING_BUILD"
  | GAME_SESSION_ACTIVATION_TIMEOUT -> `String "GAME_SESSION_ACTIVATION_TIMEOUT"
  | SERVER_PROCESS_MISCONFIGURED_CONTAINER_PORT ->
      `String "SERVER_PROCESS_MISCONFIGURED_CONTAINER_PORT"
  | SERVER_PROCESS_SDK_INITIALIZATION_FAILED -> `String "SERVER_PROCESS_SDK_INITIALIZATION_FAILED"
  | SERVER_PROCESS_PROCESS_EXIT_TIMEOUT -> `String "SERVER_PROCESS_PROCESS_EXIT_TIMEOUT"
  | SERVER_PROCESS_FORCE_TERMINATED -> `String "SERVER_PROCESS_FORCE_TERMINATED"
  | SERVER_PROCESS_TERMINATED_UNHEALTHY -> `String "SERVER_PROCESS_TERMINATED_UNHEALTHY"
  | SERVER_PROCESS_CRASHED -> `String "SERVER_PROCESS_CRASHED"
  | SERVER_PROCESS_PROCESS_READY_TIMEOUT -> `String "SERVER_PROCESS_PROCESS_READY_TIMEOUT"
  | SERVER_PROCESS_SDK_INITIALIZATION_TIMEOUT -> `String "SERVER_PROCESS_SDK_INITIALIZATION_TIMEOUT"
  | SERVER_PROCESS_INVALID_PATH -> `String "SERVER_PROCESS_INVALID_PATH"
  | FLEET_NEW_GAME_SESSION_PROTECTION_POLICY_UPDATED ->
      `String "FLEET_NEW_GAME_SESSION_PROTECTION_POLICY_UPDATED"
  | FLEET_ACTIVATION_FAILED_NO_INSTANCES -> `String "FLEET_ACTIVATION_FAILED_NO_INSTANCES"
  | FLEET_ACTIVATION_FAILED -> `String "FLEET_ACTIVATION_FAILED"
  | FLEET_VALIDATION_TIMED_OUT -> `String "FLEET_VALIDATION_TIMED_OUT"
  | FLEET_VALIDATION_EXECUTABLE_RUNTIME_FAILURE ->
      `String "FLEET_VALIDATION_EXECUTABLE_RUNTIME_FAILURE"
  | FLEET_VALIDATION_LAUNCH_PATH_NOT_FOUND -> `String "FLEET_VALIDATION_LAUNCH_PATH_NOT_FOUND"
  | FLEET_BINARY_DOWNLOAD_FAILED -> `String "FLEET_BINARY_DOWNLOAD_FAILED"
  | FLEET_INITIALIZATION_FAILED -> `String "FLEET_INITIALIZATION_FAILED"
  | FLEET_STATE_UPDATING -> `String "FLEET_STATE_UPDATING"
  | FLEET_STATE_CREATED -> `String "FLEET_STATE_CREATED"
  | FLEET_STATE_CREATING -> `String "FLEET_STATE_CREATING"
  | FLEET_STATE_PENDING -> `String "FLEET_STATE_PENDING"
  | FLEET_STATE_ERROR -> `String "FLEET_STATE_ERROR"
  | FLEET_STATE_ACTIVE -> `String "FLEET_STATE_ACTIVE"
  | FLEET_STATE_ACTIVATING -> `String "FLEET_STATE_ACTIVATING"
  | FLEET_STATE_BUILDING -> `String "FLEET_STATE_BUILDING"
  | FLEET_STATE_VALIDATING -> `String "FLEET_STATE_VALIDATING"
  | FLEET_STATE_DOWNLOADING -> `String "FLEET_STATE_DOWNLOADING"
  | FLEET_SCALING_EVENT -> `String "FLEET_SCALING_EVENT"
  | FLEET_DELETED -> `String "FLEET_DELETED"
  | FLEET_CREATED -> `String "FLEET_CREATED"
  | GENERIC_EVENT -> `String "GENERIC_EVENT"

let event_count_to_yojson = long_to_yojson

let event_to_yojson (x : event) =
  assoc_to_yojson
    [
      ("Count", option_to_yojson event_count_to_yojson x.count);
      ("PreSignedLogUrl", option_to_yojson non_zero_and_max_string_to_yojson x.pre_signed_log_url);
      ("EventTime", option_to_yojson timestamp_to_yojson x.event_time);
      ("Message", option_to_yojson non_empty_string_to_yojson x.message);
      ("EventCode", option_to_yojson event_code_to_yojson x.event_code);
      ("ResourceId", option_to_yojson non_zero_and_max_string_to_yojson x.resource_id);
      ("EventId", option_to_yojson non_zero_and_max_string_to_yojson x.event_id);
    ]

let event_list_to_yojson tree = list_to_yojson event_to_yojson tree

let describe_fleet_events_output_to_yojson (x : describe_fleet_events_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Events", option_to_yojson event_list_to_yojson x.events);
    ]

let describe_fleet_events_input_to_yojson (x : describe_fleet_events_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let describe_fleet_deployment_output_to_yojson (x : describe_fleet_deployment_output) =
  assoc_to_yojson
    [
      ( "LocationalDeployments",
        option_to_yojson locational_deployments_to_yojson x.locational_deployments );
      ("FleetDeployment", option_to_yojson fleet_deployment_to_yojson x.fleet_deployment);
    ]

let describe_fleet_deployment_input_to_yojson (x : describe_fleet_deployment_input) =
  assoc_to_yojson
    [
      ("DeploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let fleet_capacity_list_to_yojson tree = list_to_yojson fleet_capacity_to_yojson tree

let describe_fleet_capacity_output_to_yojson (x : describe_fleet_capacity_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("FleetCapacity", option_to_yojson fleet_capacity_list_to_yojson x.fleet_capacity);
    ]

let describe_fleet_capacity_input_to_yojson (x : describe_fleet_capacity_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("FleetIds", option_to_yojson fleet_id_or_arn_list_to_yojson x.fleet_ids);
    ]

let fleet_type_to_yojson (x : fleet_type) =
  match x with Spot -> `String "SPOT" | OnDemand -> `String "ON_DEMAND"

let certificate_type_to_yojson (x : certificate_type) =
  match x with Generated -> `String "GENERATED" | Disabled -> `String "DISABLED"

let certificate_configuration_to_yojson (x : certificate_configuration) =
  assoc_to_yojson [ ("CertificateType", Some (certificate_type_to_yojson x.certificate_type)) ]

let compute_type_to_yojson (x : compute_type) =
  match x with ANYWHERE -> `String "ANYWHERE" | EC2 -> `String "EC2"

let fleet_attributes_to_yojson (x : fleet_attributes) =
  assoc_to_yojson
    [
      ( "PlayerGatewayConfiguration",
        option_to_yojson player_gateway_configuration_to_yojson x.player_gateway_configuration );
      ("PlayerGatewayMode", option_to_yojson player_gateway_mode_to_yojson x.player_gateway_mode);
      ( "InstanceRoleCredentialsProvider",
        option_to_yojson instance_role_credentials_provider_to_yojson
          x.instance_role_credentials_provider );
      ( "AnywhereConfiguration",
        option_to_yojson anywhere_configuration_to_yojson x.anywhere_configuration );
      ("ComputeType", option_to_yojson compute_type_to_yojson x.compute_type);
      ( "CertificateConfiguration",
        option_to_yojson certificate_configuration_to_yojson x.certificate_configuration );
      ("InstanceRoleArn", option_to_yojson non_empty_string_to_yojson x.instance_role_arn);
      ("StoppedActions", option_to_yojson fleet_action_list_to_yojson x.stopped_actions);
      ("MetricGroups", option_to_yojson metric_group_list_to_yojson x.metric_groups);
      ( "ResourceCreationLimitPolicy",
        option_to_yojson resource_creation_limit_policy_to_yojson x.resource_creation_limit_policy
      );
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ( "NewGameSessionProtectionPolicy",
        option_to_yojson protection_policy_to_yojson x.new_game_session_protection_policy );
      ("LogPaths", option_to_yojson string_list_to_yojson x.log_paths);
      ( "ServerLaunchParameters",
        option_to_yojson launch_parameters_string_model_to_yojson x.server_launch_parameters );
      ("ServerLaunchPath", option_to_yojson launch_path_string_model_to_yojson x.server_launch_path);
      ("ScriptArn", option_to_yojson script_arn_to_yojson x.script_arn);
      ("ScriptId", option_to_yojson script_id_to_yojson x.script_id);
      ("BuildArn", option_to_yojson build_arn_to_yojson x.build_arn);
      ("BuildId", option_to_yojson build_id_to_yojson x.build_id);
      ("Status", option_to_yojson fleet_status_to_yojson x.status);
      ("TerminationTime", option_to_yojson timestamp_to_yojson x.termination_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("InstanceType", option_to_yojson ec2_instance_type_to_yojson x.instance_type);
      ("FleetType", option_to_yojson fleet_type_to_yojson x.fleet_type);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let fleet_attributes_list_to_yojson tree = list_to_yojson fleet_attributes_to_yojson tree

let describe_fleet_attributes_output_to_yojson (x : describe_fleet_attributes_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("FleetAttributes", option_to_yojson fleet_attributes_list_to_yojson x.fleet_attributes);
    ]

let describe_fleet_attributes_input_to_yojson (x : describe_fleet_attributes_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("FleetIds", option_to_yojson fleet_id_or_arn_list_to_yojson x.fleet_ids);
    ]

let ec2_instance_limit_to_yojson (x : ec2_instance_limit) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("InstanceLimit", option_to_yojson whole_number_to_yojson x.instance_limit);
      ("CurrentInstances", option_to_yojson whole_number_to_yojson x.current_instances);
      ("EC2InstanceType", option_to_yojson ec2_instance_type_to_yojson x.ec2_instance_type);
    ]

let ec2_instance_limit_list_to_yojson tree = list_to_yojson ec2_instance_limit_to_yojson tree

let describe_ec2_instance_limits_output_to_yojson (x : describe_ec2_instance_limits_output) =
  assoc_to_yojson
    [
      ("EC2InstanceLimits", option_to_yojson ec2_instance_limit_list_to_yojson x.ec2_instance_limits);
    ]

let describe_ec2_instance_limits_input_to_yojson (x : describe_ec2_instance_limits_input) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("EC2InstanceType", option_to_yojson ec2_instance_type_to_yojson x.ec2_instance_type);
    ]

let container_port_mapping_to_yojson (x : container_port_mapping) =
  assoc_to_yojson
    [
      ("Protocol", option_to_yojson ip_protocol_to_yojson x.protocol);
      ("ConnectionPort", option_to_yojson port_number_to_yojson x.connection_port);
      ("ContainerPort", option_to_yojson port_number_to_yojson x.container_port);
    ]

let container_port_mapping_list_to_yojson tree =
  list_to_yojson container_port_mapping_to_yojson tree

let container_group_port_mapping_to_yojson (x : container_group_port_mapping) =
  assoc_to_yojson
    [
      ( "ContainerPortMappings",
        option_to_yojson container_port_mapping_list_to_yojson x.container_port_mappings );
      ("ContainerRuntimeId", option_to_yojson non_empty_string_to_yojson x.container_runtime_id);
      ("ContainerName", option_to_yojson non_zero_and128_max_ascii_string_to_yojson x.container_name);
    ]

let container_group_port_mapping_list_to_yojson tree =
  list_to_yojson container_group_port_mapping_to_yojson tree

let describe_container_group_port_mappings_output_to_yojson
    (x : describe_container_group_port_mappings_output) =
  assoc_to_yojson
    [
      ( "ContainerGroupPortMappings",
        option_to_yojson container_group_port_mapping_list_to_yojson x.container_group_port_mappings
      );
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("ComputeName", option_to_yojson compute_name_to_yojson x.compute_name);
      ("ContainerGroupType", option_to_yojson container_group_type_to_yojson x.container_group_type);
      ( "ContainerGroupDefinitionArn",
        option_to_yojson container_group_definition_arn_to_yojson x.container_group_definition_arn
      );
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
    ]

let describe_container_group_port_mappings_input_to_yojson
    (x : describe_container_group_port_mappings_input) =
  assoc_to_yojson
    [
      ("ContainerName", option_to_yojson non_zero_and128_max_ascii_string_to_yojson x.container_name);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("ComputeName", option_to_yojson compute_name_or_arn_to_yojson x.compute_name);
      ("ContainerGroupType", Some (container_group_type_to_yojson x.container_group_type));
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let describe_container_group_definition_output_to_yojson
    (x : describe_container_group_definition_output) =
  assoc_to_yojson
    [
      ( "ContainerGroupDefinition",
        option_to_yojson container_group_definition_to_yojson x.container_group_definition );
    ]

let describe_container_group_definition_input_to_yojson
    (x : describe_container_group_definition_input) =
  assoc_to_yojson
    [
      ("VersionNumber", option_to_yojson positive_integer_to_yojson x.version_number);
      ("Name", Some (container_group_definition_name_or_arn_to_yojson x.name));
    ]

let describe_container_fleet_output_to_yojson (x : describe_container_fleet_output) =
  assoc_to_yojson
    [ ("ContainerFleet", option_to_yojson container_fleet_to_yojson x.container_fleet) ]

let describe_container_fleet_input_to_yojson (x : describe_container_fleet_input) =
  assoc_to_yojson [ ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id)) ]

let describe_compute_output_to_yojson (x : describe_compute_output) =
  assoc_to_yojson [ ("Compute", option_to_yojson compute_to_yojson x.compute) ]

let describe_compute_input_to_yojson (x : describe_compute_input) =
  assoc_to_yojson
    [
      ("ComputeName", Some (compute_name_or_arn_to_yojson x.compute_name));
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let describe_build_output_to_yojson (x : describe_build_output) =
  assoc_to_yojson [ ("Build", option_to_yojson build_to_yojson x.build) ]

let describe_build_input_to_yojson (x : describe_build_input) =
  assoc_to_yojson [ ("BuildId", Some (build_id_or_arn_to_yojson x.build_id)) ]

let describe_alias_output_to_yojson (x : describe_alias_output) =
  assoc_to_yojson [ ("Alias", option_to_yojson alias_to_yojson x.alias) ]

let describe_alias_input_to_yojson (x : describe_alias_input) =
  assoc_to_yojson [ ("AliasId", Some (alias_id_or_arn_to_yojson x.alias_id)) ]

let deregister_game_server_input_to_yojson (x : deregister_game_server_input) =
  assoc_to_yojson
    [
      ("GameServerId", Some (game_server_id_to_yojson x.game_server_id));
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
    ]

let deregister_compute_output_to_yojson = unit_to_yojson

let deregister_compute_input_to_yojson (x : deregister_compute_input) =
  assoc_to_yojson
    [
      ("ComputeName", Some (compute_name_or_arn_to_yojson x.compute_name));
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let delete_vpc_peering_connection_output_to_yojson = unit_to_yojson

let delete_vpc_peering_connection_input_to_yojson (x : delete_vpc_peering_connection_input) =
  assoc_to_yojson
    [
      ( "VpcPeeringConnectionId",
        Some (non_zero_and_max_string_to_yojson x.vpc_peering_connection_id) );
      ("FleetId", Some (fleet_id_to_yojson x.fleet_id));
    ]

let delete_vpc_peering_authorization_output_to_yojson = unit_to_yojson

let delete_vpc_peering_authorization_input_to_yojson (x : delete_vpc_peering_authorization_input) =
  assoc_to_yojson
    [
      ("PeerVpcId", Some (non_zero_and_max_string_to_yojson x.peer_vpc_id));
      ("GameLiftAwsAccountId", Some (non_zero_and_max_string_to_yojson x.game_lift_aws_account_id));
    ]

let delete_script_input_to_yojson (x : delete_script_input) =
  assoc_to_yojson [ ("ScriptId", Some (script_id_or_arn_to_yojson x.script_id)) ]

let delete_scaling_policy_input_to_yojson (x : delete_scaling_policy_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("Name", Some (non_zero_and_max_string_to_yojson x.name));
    ]

let delete_matchmaking_rule_set_output_to_yojson = unit_to_yojson

let delete_matchmaking_rule_set_input_to_yojson (x : delete_matchmaking_rule_set_input) =
  assoc_to_yojson [ ("Name", Some (matchmaking_rule_set_name_to_yojson x.name)) ]

let delete_matchmaking_configuration_output_to_yojson = unit_to_yojson

let delete_matchmaking_configuration_input_to_yojson (x : delete_matchmaking_configuration_input) =
  assoc_to_yojson [ ("Name", Some (matchmaking_configuration_name_to_yojson x.name)) ]

let delete_location_output_to_yojson = unit_to_yojson
let custom_location_name_or_arn_model_to_yojson = string_to_yojson

let delete_location_input_to_yojson (x : delete_location_input) =
  assoc_to_yojson
    [ ("LocationName", Some (custom_location_name_or_arn_model_to_yojson x.location_name)) ]

let delete_game_session_queue_output_to_yojson = unit_to_yojson

let delete_game_session_queue_input_to_yojson (x : delete_game_session_queue_input) =
  assoc_to_yojson [ ("Name", Some (game_session_queue_name_or_arn_to_yojson x.name)) ]

let delete_game_server_group_output_to_yojson (x : delete_game_server_group_output) =
  assoc_to_yojson
    [ ("GameServerGroup", option_to_yojson game_server_group_to_yojson x.game_server_group) ]

let delete_game_server_group_input_to_yojson (x : delete_game_server_group_input) =
  assoc_to_yojson
    [
      ("DeleteOption", option_to_yojson game_server_group_delete_option_to_yojson x.delete_option);
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
    ]

let delete_fleet_locations_output_to_yojson (x : delete_fleet_locations_output) =
  assoc_to_yojson
    [
      ("LocationStates", option_to_yojson location_state_list_to_yojson x.location_states);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
    ]

let delete_fleet_locations_input_to_yojson (x : delete_fleet_locations_input) =
  assoc_to_yojson
    [
      ("Locations", Some (location_list_to_yojson x.locations));
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let delete_fleet_input_to_yojson (x : delete_fleet_input) =
  assoc_to_yojson [ ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id)) ]

let delete_container_group_definition_output_to_yojson = unit_to_yojson

let delete_container_group_definition_input_to_yojson (x : delete_container_group_definition_input)
    =
  assoc_to_yojson
    [
      ("VersionCountToRetain", option_to_yojson whole_number_to_yojson x.version_count_to_retain);
      ("VersionNumber", option_to_yojson positive_integer_to_yojson x.version_number);
      ("Name", Some (container_group_definition_name_or_arn_to_yojson x.name));
    ]

let delete_container_fleet_output_to_yojson = unit_to_yojson

let delete_container_fleet_input_to_yojson (x : delete_container_fleet_input) =
  assoc_to_yojson [ ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id)) ]

let delete_build_input_to_yojson (x : delete_build_input) =
  assoc_to_yojson [ ("BuildId", Some (build_id_or_arn_to_yojson x.build_id)) ]

let delete_alias_input_to_yojson (x : delete_alias_input) =
  assoc_to_yojson [ ("AliasId", Some (alias_id_or_arn_to_yojson x.alias_id)) ]

let create_vpc_peering_connection_output_to_yojson = unit_to_yojson

let create_vpc_peering_connection_input_to_yojson (x : create_vpc_peering_connection_input) =
  assoc_to_yojson
    [
      ("PeerVpcId", Some (non_zero_and_max_string_to_yojson x.peer_vpc_id));
      ("PeerVpcAwsAccountId", Some (non_zero_and_max_string_to_yojson x.peer_vpc_aws_account_id));
      ("FleetId", Some (fleet_id_to_yojson x.fleet_id));
    ]

let create_vpc_peering_authorization_output_to_yojson (x : create_vpc_peering_authorization_output)
    =
  assoc_to_yojson
    [
      ( "VpcPeeringAuthorization",
        option_to_yojson vpc_peering_authorization_to_yojson x.vpc_peering_authorization );
    ]

let create_vpc_peering_authorization_input_to_yojson (x : create_vpc_peering_authorization_input) =
  assoc_to_yojson
    [
      ("PeerVpcId", Some (non_zero_and_max_string_to_yojson x.peer_vpc_id));
      ("GameLiftAwsAccountId", Some (non_zero_and_max_string_to_yojson x.game_lift_aws_account_id));
    ]

let create_script_output_to_yojson (x : create_script_output) =
  assoc_to_yojson [ ("Script", option_to_yojson script_to_yojson x.script) ]

let create_script_input_to_yojson (x : create_script_input) =
  assoc_to_yojson
    [
      ("NodeJsVersion", option_to_yojson node_js_version_to_yojson x.node_js_version);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ZipFile", option_to_yojson zip_blob_to_yojson x.zip_file);
      ("StorageLocation", option_to_yojson s3_location_to_yojson x.storage_location);
      ("Version", option_to_yojson non_zero_and_max_string_to_yojson x.version);
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
    ]

let create_player_sessions_output_to_yojson (x : create_player_sessions_output) =
  assoc_to_yojson
    [ ("PlayerSessions", option_to_yojson player_session_list_to_yojson x.player_sessions) ]

let create_player_sessions_input_to_yojson (x : create_player_sessions_input) =
  assoc_to_yojson
    [
      ("PlayerDataMap", option_to_yojson player_data_map_to_yojson x.player_data_map);
      ("PlayerIds", Some (player_id_list_to_yojson x.player_ids));
      ("GameSessionId", Some (arn_string_model_to_yojson x.game_session_id));
    ]

let create_player_session_output_to_yojson (x : create_player_session_output) =
  assoc_to_yojson [ ("PlayerSession", option_to_yojson player_session_to_yojson x.player_session) ]

let create_player_session_input_to_yojson (x : create_player_session_input) =
  assoc_to_yojson
    [
      ("PlayerData", option_to_yojson player_data_to_yojson x.player_data);
      ("PlayerId", Some (player_id_to_yojson x.player_id));
      ("GameSessionId", Some (arn_string_model_to_yojson x.game_session_id));
    ]

let create_matchmaking_rule_set_output_to_yojson (x : create_matchmaking_rule_set_output) =
  assoc_to_yojson [ ("RuleSet", Some (matchmaking_rule_set_to_yojson x.rule_set)) ]

let create_matchmaking_rule_set_input_to_yojson (x : create_matchmaking_rule_set_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("RuleSetBody", Some (rule_set_body_to_yojson x.rule_set_body));
      ("Name", Some (matchmaking_id_string_model_to_yojson x.name));
    ]

let create_matchmaking_configuration_output_to_yojson (x : create_matchmaking_configuration_output)
    =
  assoc_to_yojson
    [ ("Configuration", option_to_yojson matchmaking_configuration_to_yojson x.configuration) ]

let create_matchmaking_configuration_input_to_yojson (x : create_matchmaking_configuration_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("FlexMatchMode", option_to_yojson flex_match_mode_to_yojson x.flex_match_mode);
      ("BackfillMode", option_to_yojson backfill_mode_to_yojson x.backfill_mode);
      ("GameSessionData", option_to_yojson game_session_data_to_yojson x.game_session_data);
      ("GameProperties", option_to_yojson game_property_list_to_yojson x.game_properties);
      ("CustomEventData", option_to_yojson custom_event_data_to_yojson x.custom_event_data);
      ("AdditionalPlayerCount", option_to_yojson whole_number_to_yojson x.additional_player_count);
      ("NotificationTarget", option_to_yojson sns_arn_string_model_to_yojson x.notification_target);
      ("RuleSetName", Some (matchmaking_rule_set_name_to_yojson x.rule_set_name));
      ("AcceptanceRequired", Some (boolean_model_to_yojson x.acceptance_required));
      ( "AcceptanceTimeoutSeconds",
        option_to_yojson matchmaking_acceptance_timeout_integer_to_yojson
          x.acceptance_timeout_seconds );
      ( "RequestTimeoutSeconds",
        Some (matchmaking_request_timeout_integer_to_yojson x.request_timeout_seconds) );
      ("GameSessionQueueArns", option_to_yojson queue_arns_list_to_yojson x.game_session_queue_arns);
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("Name", Some (matchmaking_id_string_model_to_yojson x.name));
    ]

let create_location_output_to_yojson (x : create_location_output) =
  assoc_to_yojson [ ("Location", option_to_yojson location_model_to_yojson x.location) ]

let custom_input_location_string_model_to_yojson = string_to_yojson

let create_location_input_to_yojson (x : create_location_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("LocationName", Some (custom_input_location_string_model_to_yojson x.location_name));
    ]

let create_game_session_queue_output_to_yojson (x : create_game_session_queue_output) =
  assoc_to_yojson
    [ ("GameSessionQueue", option_to_yojson game_session_queue_to_yojson x.game_session_queue) ]

let create_game_session_queue_input_to_yojson (x : create_game_session_queue_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "NotificationTarget",
        option_to_yojson queue_sns_arn_string_model_to_yojson x.notification_target );
      ("CustomEventData", option_to_yojson queue_custom_event_data_to_yojson x.custom_event_data);
      ( "PriorityConfiguration",
        option_to_yojson priority_configuration_to_yojson x.priority_configuration );
      ("FilterConfiguration", option_to_yojson filter_configuration_to_yojson x.filter_configuration);
      ("Destinations", option_to_yojson game_session_queue_destination_list_to_yojson x.destinations);
      ( "PlayerLatencyPolicies",
        option_to_yojson player_latency_policy_list_to_yojson x.player_latency_policies );
      ("TimeoutInSeconds", option_to_yojson whole_number_to_yojson x.timeout_in_seconds);
      ("Name", Some (game_session_queue_name_to_yojson x.name));
    ]

let fleet_capacity_exceeded_exception_to_yojson (x : fleet_capacity_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let create_game_session_output_to_yojson (x : create_game_session_output) =
  assoc_to_yojson [ ("GameSession", option_to_yojson game_session_to_yojson x.game_session) ]

let create_game_session_input_to_yojson (x : create_game_session_input) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("GameSessionData", option_to_yojson large_game_session_data_to_yojson x.game_session_data);
      ("IdempotencyToken", option_to_yojson id_string_model_to_yojson x.idempotency_token);
      ("GameSessionId", option_to_yojson id_string_model_to_yojson x.game_session_id);
      ("CreatorId", option_to_yojson non_zero_and_max_string_to_yojson x.creator_id);
      ("GameProperties", option_to_yojson game_property_list_to_yojson x.game_properties);
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("MaximumPlayerSessionCount", Some (whole_number_to_yojson x.maximum_player_session_count));
      ("AliasId", option_to_yojson alias_id_or_arn_to_yojson x.alias_id);
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
    ]

let create_game_server_group_output_to_yojson (x : create_game_server_group_output) =
  assoc_to_yojson
    [ ("GameServerGroup", option_to_yojson game_server_group_to_yojson x.game_server_group) ]

let create_game_server_group_input_to_yojson (x : create_game_server_group_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("VpcSubnets", option_to_yojson vpc_subnets_to_yojson x.vpc_subnets);
      ( "GameServerProtectionPolicy",
        option_to_yojson game_server_protection_policy_to_yojson x.game_server_protection_policy );
      ("BalancingStrategy", option_to_yojson balancing_strategy_to_yojson x.balancing_strategy);
      ( "AutoScalingPolicy",
        option_to_yojson game_server_group_auto_scaling_policy_to_yojson x.auto_scaling_policy );
      ("InstanceDefinitions", Some (instance_definitions_to_yojson x.instance_definitions));
      ("LaunchTemplate", Some (launch_template_specification_to_yojson x.launch_template));
      ("MaxSize", Some (positive_integer_to_yojson x.max_size));
      ("MinSize", Some (whole_number_to_yojson x.min_size));
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("GameServerGroupName", Some (game_server_group_name_to_yojson x.game_server_group_name));
    ]

let create_fleet_locations_output_to_yojson (x : create_fleet_locations_output) =
  assoc_to_yojson
    [
      ("LocationStates", option_to_yojson location_state_list_to_yojson x.location_states);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
    ]

let create_fleet_locations_input_to_yojson (x : create_fleet_locations_input) =
  assoc_to_yojson
    [
      ("Locations", Some (location_configuration_list_to_yojson x.locations));
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let create_fleet_output_to_yojson (x : create_fleet_output) =
  assoc_to_yojson
    [
      ("LocationStates", option_to_yojson location_state_list_to_yojson x.location_states);
      ("FleetAttributes", option_to_yojson fleet_attributes_to_yojson x.fleet_attributes);
    ]

let create_fleet_input_to_yojson (x : create_fleet_input) =
  assoc_to_yojson
    [
      ( "PlayerGatewayConfiguration",
        option_to_yojson player_gateway_configuration_to_yojson x.player_gateway_configuration );
      ("PlayerGatewayMode", option_to_yojson player_gateway_mode_to_yojson x.player_gateway_mode);
      ( "InstanceRoleCredentialsProvider",
        option_to_yojson instance_role_credentials_provider_to_yojson
          x.instance_role_credentials_provider );
      ( "AnywhereConfiguration",
        option_to_yojson anywhere_configuration_to_yojson x.anywhere_configuration );
      ("ComputeType", option_to_yojson compute_type_to_yojson x.compute_type);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Locations", option_to_yojson location_configuration_list_to_yojson x.locations);
      ( "CertificateConfiguration",
        option_to_yojson certificate_configuration_to_yojson x.certificate_configuration );
      ("InstanceRoleArn", option_to_yojson non_empty_string_to_yojson x.instance_role_arn);
      ("FleetType", option_to_yojson fleet_type_to_yojson x.fleet_type);
      ("PeerVpcId", option_to_yojson non_zero_and_max_string_to_yojson x.peer_vpc_id);
      ( "PeerVpcAwsAccountId",
        option_to_yojson non_zero_and_max_string_to_yojson x.peer_vpc_aws_account_id );
      ("MetricGroups", option_to_yojson metric_group_list_to_yojson x.metric_groups);
      ( "ResourceCreationLimitPolicy",
        option_to_yojson resource_creation_limit_policy_to_yojson x.resource_creation_limit_policy
      );
      ( "RuntimeConfiguration",
        option_to_yojson runtime_configuration_to_yojson x.runtime_configuration );
      ( "NewGameSessionProtectionPolicy",
        option_to_yojson protection_policy_to_yojson x.new_game_session_protection_policy );
      ( "EC2InboundPermissions",
        option_to_yojson ip_permissions_list_to_yojson x.ec2_inbound_permissions );
      ("EC2InstanceType", option_to_yojson ec2_instance_type_to_yojson x.ec2_instance_type);
      ("LogPaths", option_to_yojson string_list_to_yojson x.log_paths);
      ( "ServerLaunchParameters",
        option_to_yojson launch_parameters_string_model_to_yojson x.server_launch_parameters );
      ("ServerLaunchPath", option_to_yojson launch_path_string_model_to_yojson x.server_launch_path);
      ("ScriptId", option_to_yojson script_id_or_arn_to_yojson x.script_id);
      ("BuildId", option_to_yojson build_id_or_arn_to_yojson x.build_id);
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("Name", Some (non_zero_and_max_string_to_yojson x.name));
    ]

let create_container_group_definition_output_to_yojson
    (x : create_container_group_definition_output) =
  assoc_to_yojson
    [
      ( "ContainerGroupDefinition",
        option_to_yojson container_group_definition_to_yojson x.container_group_definition );
    ]

let create_container_group_definition_input_to_yojson (x : create_container_group_definition_input)
    =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "VersionDescription",
        option_to_yojson non_zero_and_max_string_to_yojson x.version_description );
      ("OperatingSystem", Some (container_operating_system_to_yojson x.operating_system));
      ( "SupportContainerDefinitions",
        option_to_yojson support_container_definition_input_list_to_yojson
          x.support_container_definitions );
      ( "GameServerContainerDefinition",
        option_to_yojson game_server_container_definition_input_to_yojson
          x.game_server_container_definition );
      ("TotalVcpuLimit", Some (container_total_vcpu_limit_to_yojson x.total_vcpu_limit));
      ( "TotalMemoryLimitMebibytes",
        Some (container_total_memory_limit_to_yojson x.total_memory_limit_mebibytes) );
      ("ContainerGroupType", option_to_yojson container_group_type_to_yojson x.container_group_type);
      ("Name", Some (container_group_definition_name_to_yojson x.name));
    ]

let create_container_fleet_output_to_yojson (x : create_container_fleet_output) =
  assoc_to_yojson
    [ ("ContainerFleet", option_to_yojson container_fleet_to_yojson x.container_fleet) ]

let create_container_fleet_input_to_yojson (x : create_container_fleet_input) =
  assoc_to_yojson
    [
      ("PlayerGatewayMode", option_to_yojson player_gateway_mode_to_yojson x.player_gateway_mode);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("LogConfiguration", option_to_yojson log_configuration_to_yojson x.log_configuration);
      ( "GameSessionCreationLimitPolicy",
        option_to_yojson game_session_creation_limit_policy_to_yojson
          x.game_session_creation_limit_policy );
      ( "NewGameSessionProtectionPolicy",
        option_to_yojson protection_policy_to_yojson x.new_game_session_protection_policy );
      ("MetricGroups", option_to_yojson metric_group_list_to_yojson x.metric_groups);
      ("Locations", option_to_yojson location_configuration_list_to_yojson x.locations);
      ("BillingType", option_to_yojson container_fleet_billing_type_to_yojson x.billing_type);
      ("InstanceType", option_to_yojson non_zero_and_max_string_to_yojson x.instance_type);
      ( "GameServerContainerGroupsPerInstance",
        option_to_yojson game_server_container_groups_per_instance_to_yojson
          x.game_server_container_groups_per_instance );
      ( "InstanceInboundPermissions",
        option_to_yojson ip_permissions_list_to_yojson x.instance_inbound_permissions );
      ( "InstanceConnectionPortRange",
        option_to_yojson connection_port_range_to_yojson x.instance_connection_port_range );
      ( "PerInstanceContainerGroupDefinitionName",
        option_to_yojson container_group_definition_name_or_arn_to_yojson
          x.per_instance_container_group_definition_name );
      ( "GameServerContainerGroupDefinitionName",
        option_to_yojson container_group_definition_name_or_arn_to_yojson
          x.game_server_container_group_definition_name );
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("FleetRoleArn", Some (iam_role_arn_to_yojson x.fleet_role_arn));
    ]

let create_build_output_to_yojson (x : create_build_output) =
  assoc_to_yojson
    [
      ("StorageLocation", option_to_yojson s3_location_to_yojson x.storage_location);
      ("UploadCredentials", option_to_yojson aws_credentials_to_yojson x.upload_credentials);
      ("Build", option_to_yojson build_to_yojson x.build);
    ]

let create_build_input_to_yojson (x : create_build_input) =
  assoc_to_yojson
    [
      ("ServerSdkVersion", option_to_yojson server_sdk_version_to_yojson x.server_sdk_version);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("StorageLocation", option_to_yojson s3_location_to_yojson x.storage_location);
      ("Version", option_to_yojson non_zero_and_max_string_to_yojson x.version);
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
    ]

let create_alias_output_to_yojson (x : create_alias_output) =
  assoc_to_yojson [ ("Alias", option_to_yojson alias_to_yojson x.alias) ]

let create_alias_input_to_yojson (x : create_alias_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("RoutingStrategy", Some (routing_strategy_to_yojson x.routing_strategy));
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("Name", Some (non_blank_and_length_constraint_string_to_yojson x.name));
    ]

let claim_game_server_output_to_yojson (x : claim_game_server_output) =
  assoc_to_yojson [ ("GameServer", option_to_yojson game_server_to_yojson x.game_server) ]

let filter_instance_status_to_yojson (x : filter_instance_status) =
  match x with DRAINING -> `String "DRAINING" | ACTIVE -> `String "ACTIVE"

let filter_instance_statuses_to_yojson tree = list_to_yojson filter_instance_status_to_yojson tree

let claim_filter_option_to_yojson (x : claim_filter_option) =
  assoc_to_yojson
    [
      ("InstanceStatuses", option_to_yojson filter_instance_statuses_to_yojson x.instance_statuses);
    ]

let claim_game_server_input_to_yojson (x : claim_game_server_input) =
  assoc_to_yojson
    [
      ("FilterOption", option_to_yojson claim_filter_option_to_yojson x.filter_option);
      ("GameServerData", option_to_yojson game_server_data_to_yojson x.game_server_data);
      ("GameServerId", option_to_yojson game_server_id_to_yojson x.game_server_id);
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
    ]

let accept_match_output_to_yojson = unit_to_yojson

let acceptance_type_to_yojson (x : acceptance_type) =
  match x with REJECT -> `String "REJECT" | ACCEPT -> `String "ACCEPT"

let accept_match_input_to_yojson (x : accept_match_input) =
  assoc_to_yojson
    [
      ("AcceptanceType", Some (acceptance_type_to_yojson x.acceptance_type));
      ("PlayerIds", Some (player_ids_for_accept_match_to_yojson x.player_ids));
      ("TicketId", Some (matchmaking_id_string_model_to_yojson x.ticket_id));
    ]
