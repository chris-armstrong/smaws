open Smaws_Lib.Json.SerializeHelpers
open Types

let non_empty_string_to_yojson = string_to_yojson

let unsupported_region_exception_to_yojson (x : unsupported_region_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let not_found_exception_to_yojson (x : not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let internal_service_exception_to_yojson (x : internal_service_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let accept_match_output_to_yojson = unit_to_yojson

let acceptance_type_to_yojson (x : acceptance_type) =
  match x with ACCEPT -> `String "ACCEPT" | REJECT -> `String "REJECT"

let player_id_to_yojson = string_to_yojson
let player_ids_for_accept_match_to_yojson tree = list_to_yojson player_id_to_yojson tree
let matchmaking_id_string_model_to_yojson = string_to_yojson

let accept_match_input_to_yojson (x : accept_match_input) =
  assoc_to_yojson
    [
      ("TicketId", Some (matchmaking_id_string_model_to_yojson x.ticket_id));
      ("PlayerIds", Some (player_ids_for_accept_match_to_yojson x.player_ids));
      ("AcceptanceType", Some (acceptance_type_to_yojson x.acceptance_type));
    ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let free_text_to_yojson = string_to_yojson
let fleet_id_to_yojson = string_to_yojson

let routing_strategy_type_to_yojson (x : routing_strategy_type) =
  match x with SIMPLE -> `String "SIMPLE" | TERMINAL -> `String "TERMINAL"

let routing_strategy_to_yojson (x : routing_strategy) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson routing_strategy_type_to_yojson x.type_);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("Message", option_to_yojson free_text_to_yojson x.message);
    ]

let alias_arn_to_yojson = string_to_yojson
let non_blank_and_length_constraint_string_to_yojson = string_to_yojson
let alias_id_to_yojson = string_to_yojson

let alias_to_yojson (x : alias) =
  assoc_to_yojson
    [
      ("AliasId", option_to_yojson alias_id_to_yojson x.alias_id);
      ("Name", option_to_yojson non_blank_and_length_constraint_string_to_yojson x.name);
      ("AliasArn", option_to_yojson alias_arn_to_yojson x.alias_arn);
      ("Description", option_to_yojson free_text_to_yojson x.description);
      ("RoutingStrategy", option_to_yojson routing_strategy_to_yojson x.routing_strategy);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
    ]

let alias_id_or_arn_to_yojson = string_to_yojson
let alias_list_to_yojson tree = list_to_yojson alias_to_yojson tree
let amazon_resource_name_to_yojson = string_to_yojson
let non_negative_limited_length_double_to_yojson = string_to_yojson

let anywhere_configuration_to_yojson (x : anywhere_configuration) =
  assoc_to_yojson [ ("Cost", Some (non_negative_limited_length_double_to_yojson x.cost)) ]

let arn_string_model_to_yojson = string_to_yojson
let double_object_to_yojson = double_to_yojson
let player_attribute_string_to_yojson = string_to_yojson

let player_attribute_string_double_map_to_yojson tree =
  map_to_yojson player_attribute_string_to_yojson double_object_to_yojson tree

let player_attribute_string_list_to_yojson tree =
  list_to_yojson player_attribute_string_to_yojson tree

let attribute_value_to_yojson (x : attribute_value) =
  assoc_to_yojson
    [
      ("S", option_to_yojson player_attribute_string_to_yojson x.s);
      ("N", option_to_yojson double_object_to_yojson x.n);
      ("SL", option_to_yojson player_attribute_string_list_to_yojson x.s_l);
      ("SDM", option_to_yojson player_attribute_string_double_map_to_yojson x.sd_m);
    ]

let auto_scaling_group_arn_to_yojson = string_to_yojson

let aws_credentials_to_yojson (x : aws_credentials) =
  assoc_to_yojson
    [
      ("AccessKeyId", option_to_yojson non_empty_string_to_yojson x.access_key_id);
      ("SecretAccessKey", option_to_yojson non_empty_string_to_yojson x.secret_access_key);
      ("SessionToken", option_to_yojson non_empty_string_to_yojson x.session_token);
    ]

let backfill_mode_to_yojson (x : backfill_mode) =
  match x with AUTOMATIC -> `String "AUTOMATIC" | MANUAL -> `String "MANUAL"

let balancing_strategy_to_yojson (x : balancing_strategy) =
  match x with
  | SPOT_ONLY -> `String "SPOT_ONLY"
  | SPOT_PREFERRED -> `String "SPOT_PREFERRED"
  | ON_DEMAND_ONLY -> `String "ON_DEMAND_ONLY"

let boolean_model_to_yojson = bool_to_yojson
let server_sdk_version_to_yojson = string_to_yojson

let operating_system_to_yojson (x : operating_system) =
  match x with
  | WINDOWS_2012 -> `String "WINDOWS_2012"
  | AMAZON_LINUX -> `String "AMAZON_LINUX"
  | AMAZON_LINUX_2 -> `String "AMAZON_LINUX_2"
  | WINDOWS_2016 -> `String "WINDOWS_2016"
  | AMAZON_LINUX_2023 -> `String "AMAZON_LINUX_2023"
  | WINDOWS_2022 -> `String "WINDOWS_2022"

let whole_number_long_to_yojson = long_to_yojson

let build_status_to_yojson (x : build_status) =
  match x with
  | INITIALIZED -> `String "INITIALIZED"
  | READY -> `String "READY"
  | FAILED -> `String "FAILED"

let build_arn_to_yojson = string_to_yojson
let build_id_to_yojson = string_to_yojson

let build_to_yojson (x : build) =
  assoc_to_yojson
    [
      ("BuildId", option_to_yojson build_id_to_yojson x.build_id);
      ("BuildArn", option_to_yojson build_arn_to_yojson x.build_arn);
      ("Name", option_to_yojson free_text_to_yojson x.name);
      ("Version", option_to_yojson free_text_to_yojson x.version);
      ("Status", option_to_yojson build_status_to_yojson x.status);
      ("SizeOnDisk", option_to_yojson whole_number_long_to_yojson x.size_on_disk);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("ServerSdkVersion", option_to_yojson server_sdk_version_to_yojson x.server_sdk_version);
    ]

let build_id_or_arn_to_yojson = string_to_yojson
let build_list_to_yojson tree = list_to_yojson build_to_yojson tree

let certificate_type_to_yojson (x : certificate_type) =
  match x with Disabled -> `String "DISABLED" | Generated -> `String "GENERATED"

let certificate_configuration_to_yojson (x : certificate_configuration) =
  assoc_to_yojson [ ("CertificateType", Some (certificate_type_to_yojson x.certificate_type)) ]

let filter_instance_status_to_yojson (x : filter_instance_status) =
  match x with ACTIVE -> `String "ACTIVE" | DRAINING -> `String "DRAINING"

let filter_instance_statuses_to_yojson tree = list_to_yojson filter_instance_status_to_yojson tree

let claim_filter_option_to_yojson (x : claim_filter_option) =
  assoc_to_yojson
    [
      ("InstanceStatuses", option_to_yojson filter_instance_statuses_to_yojson x.instance_statuses);
    ]

let unauthorized_exception_to_yojson (x : unauthorized_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let out_of_capacity_exception_to_yojson (x : out_of_capacity_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let game_server_utilization_status_to_yojson (x : game_server_utilization_status) =
  match x with AVAILABLE -> `String "AVAILABLE" | UTILIZED -> `String "UTILIZED"

let game_server_claim_status_to_yojson (x : game_server_claim_status) =
  match x with CLAIMED -> `String "CLAIMED"

let game_server_data_to_yojson = string_to_yojson
let game_server_connection_info_to_yojson = string_to_yojson
let game_server_instance_id_to_yojson = string_to_yojson
let game_server_id_to_yojson = string_to_yojson
let game_server_group_arn_to_yojson = string_to_yojson
let game_server_group_name_to_yojson = string_to_yojson

let game_server_to_yojson (x : game_server) =
  assoc_to_yojson
    [
      ( "GameServerGroupName",
        option_to_yojson game_server_group_name_to_yojson x.game_server_group_name );
      ( "GameServerGroupArn",
        option_to_yojson game_server_group_arn_to_yojson x.game_server_group_arn );
      ("GameServerId", option_to_yojson game_server_id_to_yojson x.game_server_id);
      ("InstanceId", option_to_yojson game_server_instance_id_to_yojson x.instance_id);
      ("ConnectionInfo", option_to_yojson game_server_connection_info_to_yojson x.connection_info);
      ("GameServerData", option_to_yojson game_server_data_to_yojson x.game_server_data);
      ("ClaimStatus", option_to_yojson game_server_claim_status_to_yojson x.claim_status);
      ( "UtilizationStatus",
        option_to_yojson game_server_utilization_status_to_yojson x.utilization_status );
      ("RegistrationTime", option_to_yojson timestamp_to_yojson x.registration_time);
      ("LastClaimTime", option_to_yojson timestamp_to_yojson x.last_claim_time);
      ("LastHealthCheckTime", option_to_yojson timestamp_to_yojson x.last_health_check_time);
    ]

let claim_game_server_output_to_yojson (x : claim_game_server_output) =
  assoc_to_yojson [ ("GameServer", option_to_yojson game_server_to_yojson x.game_server) ]

let game_server_group_name_or_arn_to_yojson = string_to_yojson

let claim_game_server_input_to_yojson (x : claim_game_server_input) =
  assoc_to_yojson
    [
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
      ("GameServerId", option_to_yojson game_server_id_to_yojson x.game_server_id);
      ("GameServerData", option_to_yojson game_server_data_to_yojson x.game_server_data);
      ("FilterOption", option_to_yojson claim_filter_option_to_yojson x.filter_option);
    ]

let comparison_operator_type_to_yojson (x : comparison_operator_type) =
  match x with
  | GreaterThanOrEqualToThreshold -> `String "GreaterThanOrEqualToThreshold"
  | GreaterThanThreshold -> `String "GreaterThanThreshold"
  | LessThanThreshold -> `String "LessThanThreshold"
  | LessThanOrEqualToThreshold -> `String "LessThanOrEqualToThreshold"

let container_group_definition_name_or_arn_to_yojson = string_to_yojson
let non_zero_and128_max_ascii_string_to_yojson = string_to_yojson

let container_attribute_to_yojson (x : container_attribute) =
  assoc_to_yojson
    [
      ("ContainerName", option_to_yojson non_zero_and128_max_ascii_string_to_yojson x.container_name);
      ("ContainerRuntimeId", option_to_yojson non_empty_string_to_yojson x.container_runtime_id);
    ]

let container_attributes_to_yojson tree = list_to_yojson container_attribute_to_yojson tree
let instance_id_to_yojson = string_to_yojson
let game_lift_agent_endpoint_output_to_yojson = string_to_yojson
let game_lift_service_sdk_endpoint_output_to_yojson = string_to_yojson

let ec2_instance_type_to_yojson (x : ec2_instance_type) =
  match x with
  | T2_micro -> `String "t2.micro"
  | T2_small -> `String "t2.small"
  | T2_medium -> `String "t2.medium"
  | T2_large -> `String "t2.large"
  | C3_large -> `String "c3.large"
  | C3_xlarge -> `String "c3.xlarge"
  | C3_2xlarge -> `String "c3.2xlarge"
  | C3_4xlarge -> `String "c3.4xlarge"
  | C3_8xlarge -> `String "c3.8xlarge"
  | C4_large -> `String "c4.large"
  | C4_xlarge -> `String "c4.xlarge"
  | C4_2xlarge -> `String "c4.2xlarge"
  | C4_4xlarge -> `String "c4.4xlarge"
  | C4_8xlarge -> `String "c4.8xlarge"
  | C5_large -> `String "c5.large"
  | C5_xlarge -> `String "c5.xlarge"
  | C5_2xlarge -> `String "c5.2xlarge"
  | C5_4xlarge -> `String "c5.4xlarge"
  | C5_9xlarge -> `String "c5.9xlarge"
  | C5_12xlarge -> `String "c5.12xlarge"
  | C5_18xlarge -> `String "c5.18xlarge"
  | C5_24xlarge -> `String "c5.24xlarge"
  | C5a_large -> `String "c5a.large"
  | C5a_xlarge -> `String "c5a.xlarge"
  | C5a_2xlarge -> `String "c5a.2xlarge"
  | C5a_4xlarge -> `String "c5a.4xlarge"
  | C5a_8xlarge -> `String "c5a.8xlarge"
  | C5a_12xlarge -> `String "c5a.12xlarge"
  | C5a_16xlarge -> `String "c5a.16xlarge"
  | C5a_24xlarge -> `String "c5a.24xlarge"
  | R3_large -> `String "r3.large"
  | R3_xlarge -> `String "r3.xlarge"
  | R3_2xlarge -> `String "r3.2xlarge"
  | R3_4xlarge -> `String "r3.4xlarge"
  | R3_8xlarge -> `String "r3.8xlarge"
  | R4_large -> `String "r4.large"
  | R4_xlarge -> `String "r4.xlarge"
  | R4_2xlarge -> `String "r4.2xlarge"
  | R4_4xlarge -> `String "r4.4xlarge"
  | R4_8xlarge -> `String "r4.8xlarge"
  | R4_16xlarge -> `String "r4.16xlarge"
  | R5_large -> `String "r5.large"
  | R5_xlarge -> `String "r5.xlarge"
  | R5_2xlarge -> `String "r5.2xlarge"
  | R5_4xlarge -> `String "r5.4xlarge"
  | R5_8xlarge -> `String "r5.8xlarge"
  | R5_12xlarge -> `String "r5.12xlarge"
  | R5_16xlarge -> `String "r5.16xlarge"
  | R5_24xlarge -> `String "r5.24xlarge"
  | R5a_large -> `String "r5a.large"
  | R5a_xlarge -> `String "r5a.xlarge"
  | R5a_2xlarge -> `String "r5a.2xlarge"
  | R5a_4xlarge -> `String "r5a.4xlarge"
  | R5a_8xlarge -> `String "r5a.8xlarge"
  | R5a_12xlarge -> `String "r5a.12xlarge"
  | R5a_16xlarge -> `String "r5a.16xlarge"
  | R5a_24xlarge -> `String "r5a.24xlarge"
  | M3_medium -> `String "m3.medium"
  | M3_large -> `String "m3.large"
  | M3_xlarge -> `String "m3.xlarge"
  | M3_2xlarge -> `String "m3.2xlarge"
  | M4_large -> `String "m4.large"
  | M4_xlarge -> `String "m4.xlarge"
  | M4_2xlarge -> `String "m4.2xlarge"
  | M4_4xlarge -> `String "m4.4xlarge"
  | M4_10xlarge -> `String "m4.10xlarge"
  | M5_large -> `String "m5.large"
  | M5_xlarge -> `String "m5.xlarge"
  | M5_2xlarge -> `String "m5.2xlarge"
  | M5_4xlarge -> `String "m5.4xlarge"
  | M5_8xlarge -> `String "m5.8xlarge"
  | M5_12xlarge -> `String "m5.12xlarge"
  | M5_16xlarge -> `String "m5.16xlarge"
  | M5_24xlarge -> `String "m5.24xlarge"
  | M5a_large -> `String "m5a.large"
  | M5a_xlarge -> `String "m5a.xlarge"
  | M5a_2xlarge -> `String "m5a.2xlarge"
  | M5a_4xlarge -> `String "m5a.4xlarge"
  | M5a_8xlarge -> `String "m5a.8xlarge"
  | M5a_12xlarge -> `String "m5a.12xlarge"
  | M5a_16xlarge -> `String "m5a.16xlarge"
  | M5a_24xlarge -> `String "m5a.24xlarge"
  | C5d_large -> `String "c5d.large"
  | C5d_xlarge -> `String "c5d.xlarge"
  | C5d_2xlarge -> `String "c5d.2xlarge"
  | C5d_4xlarge -> `String "c5d.4xlarge"
  | C5d_9xlarge -> `String "c5d.9xlarge"
  | C5d_12xlarge -> `String "c5d.12xlarge"
  | C5d_18xlarge -> `String "c5d.18xlarge"
  | C5d_24xlarge -> `String "c5d.24xlarge"
  | C6a_large -> `String "c6a.large"
  | C6a_xlarge -> `String "c6a.xlarge"
  | C6a_2xlarge -> `String "c6a.2xlarge"
  | C6a_4xlarge -> `String "c6a.4xlarge"
  | C6a_8xlarge -> `String "c6a.8xlarge"
  | C6a_12xlarge -> `String "c6a.12xlarge"
  | C6a_16xlarge -> `String "c6a.16xlarge"
  | C6a_24xlarge -> `String "c6a.24xlarge"
  | C6i_large -> `String "c6i.large"
  | C6i_xlarge -> `String "c6i.xlarge"
  | C6i_2xlarge -> `String "c6i.2xlarge"
  | C6i_4xlarge -> `String "c6i.4xlarge"
  | C6i_8xlarge -> `String "c6i.8xlarge"
  | C6i_12xlarge -> `String "c6i.12xlarge"
  | C6i_16xlarge -> `String "c6i.16xlarge"
  | C6i_24xlarge -> `String "c6i.24xlarge"
  | R5d_large -> `String "r5d.large"
  | R5d_xlarge -> `String "r5d.xlarge"
  | R5d_2xlarge -> `String "r5d.2xlarge"
  | R5d_4xlarge -> `String "r5d.4xlarge"
  | R5d_8xlarge -> `String "r5d.8xlarge"
  | R5d_12xlarge -> `String "r5d.12xlarge"
  | R5d_16xlarge -> `String "r5d.16xlarge"
  | R5d_24xlarge -> `String "r5d.24xlarge"
  | M6g_medium -> `String "m6g.medium"
  | M6g_large -> `String "m6g.large"
  | M6g_xlarge -> `String "m6g.xlarge"
  | M6g_2xlarge -> `String "m6g.2xlarge"
  | M6g_4xlarge -> `String "m6g.4xlarge"
  | M6g_8xlarge -> `String "m6g.8xlarge"
  | M6g_12xlarge -> `String "m6g.12xlarge"
  | M6g_16xlarge -> `String "m6g.16xlarge"
  | C6g_medium -> `String "c6g.medium"
  | C6g_large -> `String "c6g.large"
  | C6g_xlarge -> `String "c6g.xlarge"
  | C6g_2xlarge -> `String "c6g.2xlarge"
  | C6g_4xlarge -> `String "c6g.4xlarge"
  | C6g_8xlarge -> `String "c6g.8xlarge"
  | C6g_12xlarge -> `String "c6g.12xlarge"
  | C6g_16xlarge -> `String "c6g.16xlarge"
  | R6g_medium -> `String "r6g.medium"
  | R6g_large -> `String "r6g.large"
  | R6g_xlarge -> `String "r6g.xlarge"
  | R6g_2xlarge -> `String "r6g.2xlarge"
  | R6g_4xlarge -> `String "r6g.4xlarge"
  | R6g_8xlarge -> `String "r6g.8xlarge"
  | R6g_12xlarge -> `String "r6g.12xlarge"
  | R6g_16xlarge -> `String "r6g.16xlarge"
  | C6gn_medium -> `String "c6gn.medium"
  | C6gn_large -> `String "c6gn.large"
  | C6gn_xlarge -> `String "c6gn.xlarge"
  | C6gn_2xlarge -> `String "c6gn.2xlarge"
  | C6gn_4xlarge -> `String "c6gn.4xlarge"
  | C6gn_8xlarge -> `String "c6gn.8xlarge"
  | C6gn_12xlarge -> `String "c6gn.12xlarge"
  | C6gn_16xlarge -> `String "c6gn.16xlarge"
  | C7g_medium -> `String "c7g.medium"
  | C7g_large -> `String "c7g.large"
  | C7g_xlarge -> `String "c7g.xlarge"
  | C7g_2xlarge -> `String "c7g.2xlarge"
  | C7g_4xlarge -> `String "c7g.4xlarge"
  | C7g_8xlarge -> `String "c7g.8xlarge"
  | C7g_12xlarge -> `String "c7g.12xlarge"
  | C7g_16xlarge -> `String "c7g.16xlarge"
  | R7g_medium -> `String "r7g.medium"
  | R7g_large -> `String "r7g.large"
  | R7g_xlarge -> `String "r7g.xlarge"
  | R7g_2xlarge -> `String "r7g.2xlarge"
  | R7g_4xlarge -> `String "r7g.4xlarge"
  | R7g_8xlarge -> `String "r7g.8xlarge"
  | R7g_12xlarge -> `String "r7g.12xlarge"
  | R7g_16xlarge -> `String "r7g.16xlarge"
  | M7g_medium -> `String "m7g.medium"
  | M7g_large -> `String "m7g.large"
  | M7g_xlarge -> `String "m7g.xlarge"
  | M7g_2xlarge -> `String "m7g.2xlarge"
  | M7g_4xlarge -> `String "m7g.4xlarge"
  | M7g_8xlarge -> `String "m7g.8xlarge"
  | M7g_12xlarge -> `String "m7g.12xlarge"
  | M7g_16xlarge -> `String "m7g.16xlarge"
  | G5g_xlarge -> `String "g5g.xlarge"
  | G5g_2xlarge -> `String "g5g.2xlarge"
  | G5g_4xlarge -> `String "g5g.4xlarge"
  | G5g_8xlarge -> `String "g5g.8xlarge"
  | G5g_16xlarge -> `String "g5g.16xlarge"
  | R6i_large -> `String "r6i.large"
  | R6i_xlarge -> `String "r6i.xlarge"
  | R6i_2xlarge -> `String "r6i.2xlarge"
  | R6i_4xlarge -> `String "r6i.4xlarge"
  | R6i_8xlarge -> `String "r6i.8xlarge"
  | R6i_12xlarge -> `String "r6i.12xlarge"
  | R6i_16xlarge -> `String "r6i.16xlarge"
  | C6gd_medium -> `String "c6gd.medium"
  | C6gd_large -> `String "c6gd.large"
  | C6gd_xlarge -> `String "c6gd.xlarge"
  | C6gd_2xlarge -> `String "c6gd.2xlarge"
  | C6gd_4xlarge -> `String "c6gd.4xlarge"
  | C6gd_8xlarge -> `String "c6gd.8xlarge"
  | C6gd_12xlarge -> `String "c6gd.12xlarge"
  | C6gd_16xlarge -> `String "c6gd.16xlarge"
  | C6in_large -> `String "c6in.large"
  | C6in_xlarge -> `String "c6in.xlarge"
  | C6in_2xlarge -> `String "c6in.2xlarge"
  | C6in_4xlarge -> `String "c6in.4xlarge"
  | C6in_8xlarge -> `String "c6in.8xlarge"
  | C6in_12xlarge -> `String "c6in.12xlarge"
  | C6in_16xlarge -> `String "c6in.16xlarge"
  | C7a_medium -> `String "c7a.medium"
  | C7a_large -> `String "c7a.large"
  | C7a_xlarge -> `String "c7a.xlarge"
  | C7a_2xlarge -> `String "c7a.2xlarge"
  | C7a_4xlarge -> `String "c7a.4xlarge"
  | C7a_8xlarge -> `String "c7a.8xlarge"
  | C7a_12xlarge -> `String "c7a.12xlarge"
  | C7a_16xlarge -> `String "c7a.16xlarge"
  | C7gd_medium -> `String "c7gd.medium"
  | C7gd_large -> `String "c7gd.large"
  | C7gd_xlarge -> `String "c7gd.xlarge"
  | C7gd_2xlarge -> `String "c7gd.2xlarge"
  | C7gd_4xlarge -> `String "c7gd.4xlarge"
  | C7gd_8xlarge -> `String "c7gd.8xlarge"
  | C7gd_12xlarge -> `String "c7gd.12xlarge"
  | C7gd_16xlarge -> `String "c7gd.16xlarge"
  | C7gn_medium -> `String "c7gn.medium"
  | C7gn_large -> `String "c7gn.large"
  | C7gn_xlarge -> `String "c7gn.xlarge"
  | C7gn_2xlarge -> `String "c7gn.2xlarge"
  | C7gn_4xlarge -> `String "c7gn.4xlarge"
  | C7gn_8xlarge -> `String "c7gn.8xlarge"
  | C7gn_12xlarge -> `String "c7gn.12xlarge"
  | C7gn_16xlarge -> `String "c7gn.16xlarge"
  | C7i_large -> `String "c7i.large"
  | C7i_xlarge -> `String "c7i.xlarge"
  | C7i_2xlarge -> `String "c7i.2xlarge"
  | C7i_4xlarge -> `String "c7i.4xlarge"
  | C7i_8xlarge -> `String "c7i.8xlarge"
  | C7i_12xlarge -> `String "c7i.12xlarge"
  | C7i_16xlarge -> `String "c7i.16xlarge"
  | M6a_large -> `String "m6a.large"
  | M6a_xlarge -> `String "m6a.xlarge"
  | M6a_2xlarge -> `String "m6a.2xlarge"
  | M6a_4xlarge -> `String "m6a.4xlarge"
  | M6a_8xlarge -> `String "m6a.8xlarge"
  | M6a_12xlarge -> `String "m6a.12xlarge"
  | M6a_16xlarge -> `String "m6a.16xlarge"
  | M6gd_medium -> `String "m6gd.medium"
  | M6gd_large -> `String "m6gd.large"
  | M6gd_xlarge -> `String "m6gd.xlarge"
  | M6gd_2xlarge -> `String "m6gd.2xlarge"
  | M6gd_4xlarge -> `String "m6gd.4xlarge"
  | M6gd_8xlarge -> `String "m6gd.8xlarge"
  | M6gd_12xlarge -> `String "m6gd.12xlarge"
  | M6gd_16xlarge -> `String "m6gd.16xlarge"
  | M6i_large -> `String "m6i.large"
  | M6i_xlarge -> `String "m6i.xlarge"
  | M6i_2xlarge -> `String "m6i.2xlarge"
  | M6i_4xlarge -> `String "m6i.4xlarge"
  | M6i_8xlarge -> `String "m6i.8xlarge"
  | M6i_12xlarge -> `String "m6i.12xlarge"
  | M6i_16xlarge -> `String "m6i.16xlarge"
  | M7a_medium -> `String "m7a.medium"
  | M7a_large -> `String "m7a.large"
  | M7a_xlarge -> `String "m7a.xlarge"
  | M7a_2xlarge -> `String "m7a.2xlarge"
  | M7a_4xlarge -> `String "m7a.4xlarge"
  | M7a_8xlarge -> `String "m7a.8xlarge"
  | M7a_12xlarge -> `String "m7a.12xlarge"
  | M7a_16xlarge -> `String "m7a.16xlarge"
  | M7gd_medium -> `String "m7gd.medium"
  | M7gd_large -> `String "m7gd.large"
  | M7gd_xlarge -> `String "m7gd.xlarge"
  | M7gd_2xlarge -> `String "m7gd.2xlarge"
  | M7gd_4xlarge -> `String "m7gd.4xlarge"
  | M7gd_8xlarge -> `String "m7gd.8xlarge"
  | M7gd_12xlarge -> `String "m7gd.12xlarge"
  | M7gd_16xlarge -> `String "m7gd.16xlarge"
  | M7i_large -> `String "m7i.large"
  | M7i_xlarge -> `String "m7i.xlarge"
  | M7i_2xlarge -> `String "m7i.2xlarge"
  | M7i_4xlarge -> `String "m7i.4xlarge"
  | M7i_8xlarge -> `String "m7i.8xlarge"
  | M7i_12xlarge -> `String "m7i.12xlarge"
  | M7i_16xlarge -> `String "m7i.16xlarge"
  | R6gd_medium -> `String "r6gd.medium"
  | R6gd_large -> `String "r6gd.large"
  | R6gd_xlarge -> `String "r6gd.xlarge"
  | R6gd_2xlarge -> `String "r6gd.2xlarge"
  | R6gd_4xlarge -> `String "r6gd.4xlarge"
  | R6gd_8xlarge -> `String "r6gd.8xlarge"
  | R6gd_12xlarge -> `String "r6gd.12xlarge"
  | R6gd_16xlarge -> `String "r6gd.16xlarge"
  | R7a_medium -> `String "r7a.medium"
  | R7a_large -> `String "r7a.large"
  | R7a_xlarge -> `String "r7a.xlarge"
  | R7a_2xlarge -> `String "r7a.2xlarge"
  | R7a_4xlarge -> `String "r7a.4xlarge"
  | R7a_8xlarge -> `String "r7a.8xlarge"
  | R7a_12xlarge -> `String "r7a.12xlarge"
  | R7a_16xlarge -> `String "r7a.16xlarge"
  | R7gd_medium -> `String "r7gd.medium"
  | R7gd_large -> `String "r7gd.large"
  | R7gd_xlarge -> `String "r7gd.xlarge"
  | R7gd_2xlarge -> `String "r7gd.2xlarge"
  | R7gd_4xlarge -> `String "r7gd.4xlarge"
  | R7gd_8xlarge -> `String "r7gd.8xlarge"
  | R7gd_12xlarge -> `String "r7gd.12xlarge"
  | R7gd_16xlarge -> `String "r7gd.16xlarge"
  | R7i_large -> `String "r7i.large"
  | R7i_xlarge -> `String "r7i.xlarge"
  | R7i_2xlarge -> `String "r7i.2xlarge"
  | R7i_4xlarge -> `String "r7i.4xlarge"
  | R7i_8xlarge -> `String "r7i.8xlarge"
  | R7i_12xlarge -> `String "r7i.12xlarge"
  | R7i_16xlarge -> `String "r7i.16xlarge"
  | R7i_24xlarge -> `String "r7i.24xlarge"
  | R7i_48xlarge -> `String "r7i.48xlarge"
  | C5ad_large -> `String "c5ad.large"
  | C5ad_xlarge -> `String "c5ad.xlarge"
  | C5ad_2xlarge -> `String "c5ad.2xlarge"
  | C5ad_4xlarge -> `String "c5ad.4xlarge"
  | C5ad_8xlarge -> `String "c5ad.8xlarge"
  | C5ad_12xlarge -> `String "c5ad.12xlarge"
  | C5ad_16xlarge -> `String "c5ad.16xlarge"
  | C5ad_24xlarge -> `String "c5ad.24xlarge"
  | C5n_large -> `String "c5n.large"
  | C5n_xlarge -> `String "c5n.xlarge"
  | C5n_2xlarge -> `String "c5n.2xlarge"
  | C5n_4xlarge -> `String "c5n.4xlarge"
  | C5n_9xlarge -> `String "c5n.9xlarge"
  | C5n_18xlarge -> `String "c5n.18xlarge"
  | R5ad_large -> `String "r5ad.large"
  | R5ad_xlarge -> `String "r5ad.xlarge"
  | R5ad_2xlarge -> `String "r5ad.2xlarge"
  | R5ad_4xlarge -> `String "r5ad.4xlarge"
  | R5ad_8xlarge -> `String "r5ad.8xlarge"
  | R5ad_12xlarge -> `String "r5ad.12xlarge"
  | R5ad_16xlarge -> `String "r5ad.16xlarge"
  | R5ad_24xlarge -> `String "r5ad.24xlarge"
  | C6id_large -> `String "c6id.large"
  | C6id_xlarge -> `String "c6id.xlarge"
  | C6id_2xlarge -> `String "c6id.2xlarge"
  | C6id_4xlarge -> `String "c6id.4xlarge"
  | C6id_8xlarge -> `String "c6id.8xlarge"
  | C6id_12xlarge -> `String "c6id.12xlarge"
  | C6id_16xlarge -> `String "c6id.16xlarge"
  | C6id_24xlarge -> `String "c6id.24xlarge"
  | C6id_32xlarge -> `String "c6id.32xlarge"
  | C8g_medium -> `String "c8g.medium"
  | C8g_large -> `String "c8g.large"
  | C8g_xlarge -> `String "c8g.xlarge"
  | C8g_2xlarge -> `String "c8g.2xlarge"
  | C8g_4xlarge -> `String "c8g.4xlarge"
  | C8g_8xlarge -> `String "c8g.8xlarge"
  | C8g_12xlarge -> `String "c8g.12xlarge"
  | C8g_16xlarge -> `String "c8g.16xlarge"
  | C8g_24xlarge -> `String "c8g.24xlarge"
  | C8g_48xlarge -> `String "c8g.48xlarge"
  | M5ad_large -> `String "m5ad.large"
  | M5ad_xlarge -> `String "m5ad.xlarge"
  | M5ad_2xlarge -> `String "m5ad.2xlarge"
  | M5ad_4xlarge -> `String "m5ad.4xlarge"
  | M5ad_8xlarge -> `String "m5ad.8xlarge"
  | M5ad_12xlarge -> `String "m5ad.12xlarge"
  | M5ad_16xlarge -> `String "m5ad.16xlarge"
  | M5ad_24xlarge -> `String "m5ad.24xlarge"
  | M5d_large -> `String "m5d.large"
  | M5d_xlarge -> `String "m5d.xlarge"
  | M5d_2xlarge -> `String "m5d.2xlarge"
  | M5d_4xlarge -> `String "m5d.4xlarge"
  | M5d_8xlarge -> `String "m5d.8xlarge"
  | M5d_12xlarge -> `String "m5d.12xlarge"
  | M5d_16xlarge -> `String "m5d.16xlarge"
  | M5d_24xlarge -> `String "m5d.24xlarge"
  | M5dn_large -> `String "m5dn.large"
  | M5dn_xlarge -> `String "m5dn.xlarge"
  | M5dn_2xlarge -> `String "m5dn.2xlarge"
  | M5dn_4xlarge -> `String "m5dn.4xlarge"
  | M5dn_8xlarge -> `String "m5dn.8xlarge"
  | M5dn_12xlarge -> `String "m5dn.12xlarge"
  | M5dn_16xlarge -> `String "m5dn.16xlarge"
  | M5dn_24xlarge -> `String "m5dn.24xlarge"
  | M5n_large -> `String "m5n.large"
  | M5n_xlarge -> `String "m5n.xlarge"
  | M5n_2xlarge -> `String "m5n.2xlarge"
  | M5n_4xlarge -> `String "m5n.4xlarge"
  | M5n_8xlarge -> `String "m5n.8xlarge"
  | M5n_12xlarge -> `String "m5n.12xlarge"
  | M5n_16xlarge -> `String "m5n.16xlarge"
  | M5n_24xlarge -> `String "m5n.24xlarge"
  | M6id_large -> `String "m6id.large"
  | M6id_xlarge -> `String "m6id.xlarge"
  | M6id_2xlarge -> `String "m6id.2xlarge"
  | M6id_4xlarge -> `String "m6id.4xlarge"
  | M6id_8xlarge -> `String "m6id.8xlarge"
  | M6id_12xlarge -> `String "m6id.12xlarge"
  | M6id_16xlarge -> `String "m6id.16xlarge"
  | M6id_24xlarge -> `String "m6id.24xlarge"
  | M6id_32xlarge -> `String "m6id.32xlarge"
  | M6idn_large -> `String "m6idn.large"
  | M6idn_xlarge -> `String "m6idn.xlarge"
  | M6idn_2xlarge -> `String "m6idn.2xlarge"
  | M6idn_4xlarge -> `String "m6idn.4xlarge"
  | M6idn_8xlarge -> `String "m6idn.8xlarge"
  | M6idn_12xlarge -> `String "m6idn.12xlarge"
  | M6idn_16xlarge -> `String "m6idn.16xlarge"
  | M6idn_24xlarge -> `String "m6idn.24xlarge"
  | M6idn_32xlarge -> `String "m6idn.32xlarge"
  | M6in_large -> `String "m6in.large"
  | M6in_xlarge -> `String "m6in.xlarge"
  | M6in_2xlarge -> `String "m6in.2xlarge"
  | M6in_4xlarge -> `String "m6in.4xlarge"
  | M6in_8xlarge -> `String "m6in.8xlarge"
  | M6in_12xlarge -> `String "m6in.12xlarge"
  | M6in_16xlarge -> `String "m6in.16xlarge"
  | M6in_24xlarge -> `String "m6in.24xlarge"
  | M6in_32xlarge -> `String "m6in.32xlarge"
  | M8g_medium -> `String "m8g.medium"
  | M8g_large -> `String "m8g.large"
  | M8g_xlarge -> `String "m8g.xlarge"
  | M8g_2xlarge -> `String "m8g.2xlarge"
  | M8g_4xlarge -> `String "m8g.4xlarge"
  | M8g_8xlarge -> `String "m8g.8xlarge"
  | M8g_12xlarge -> `String "m8g.12xlarge"
  | M8g_16xlarge -> `String "m8g.16xlarge"
  | M8g_24xlarge -> `String "m8g.24xlarge"
  | M8g_48xlarge -> `String "m8g.48xlarge"
  | R5dn_large -> `String "r5dn.large"
  | R5dn_xlarge -> `String "r5dn.xlarge"
  | R5dn_2xlarge -> `String "r5dn.2xlarge"
  | R5dn_4xlarge -> `String "r5dn.4xlarge"
  | R5dn_8xlarge -> `String "r5dn.8xlarge"
  | R5dn_12xlarge -> `String "r5dn.12xlarge"
  | R5dn_16xlarge -> `String "r5dn.16xlarge"
  | R5dn_24xlarge -> `String "r5dn.24xlarge"
  | R5n_large -> `String "r5n.large"
  | R5n_xlarge -> `String "r5n.xlarge"
  | R5n_2xlarge -> `String "r5n.2xlarge"
  | R5n_4xlarge -> `String "r5n.4xlarge"
  | R5n_8xlarge -> `String "r5n.8xlarge"
  | R5n_12xlarge -> `String "r5n.12xlarge"
  | R5n_16xlarge -> `String "r5n.16xlarge"
  | R5n_24xlarge -> `String "r5n.24xlarge"
  | R6a_large -> `String "r6a.large"
  | R6a_xlarge -> `String "r6a.xlarge"
  | R6a_2xlarge -> `String "r6a.2xlarge"
  | R6a_4xlarge -> `String "r6a.4xlarge"
  | R6a_8xlarge -> `String "r6a.8xlarge"
  | R6a_12xlarge -> `String "r6a.12xlarge"
  | R6a_16xlarge -> `String "r6a.16xlarge"
  | R6a_24xlarge -> `String "r6a.24xlarge"
  | R6a_32xlarge -> `String "r6a.32xlarge"
  | R6a_48xlarge -> `String "r6a.48xlarge"
  | R6id_large -> `String "r6id.large"
  | R6id_xlarge -> `String "r6id.xlarge"
  | R6id_2xlarge -> `String "r6id.2xlarge"
  | R6id_4xlarge -> `String "r6id.4xlarge"
  | R6id_8xlarge -> `String "r6id.8xlarge"
  | R6id_12xlarge -> `String "r6id.12xlarge"
  | R6id_16xlarge -> `String "r6id.16xlarge"
  | R6id_24xlarge -> `String "r6id.24xlarge"
  | R6id_32xlarge -> `String "r6id.32xlarge"
  | R6idn_large -> `String "r6idn.large"
  | R6idn_xlarge -> `String "r6idn.xlarge"
  | R6idn_2xlarge -> `String "r6idn.2xlarge"
  | R6idn_4xlarge -> `String "r6idn.4xlarge"
  | R6idn_8xlarge -> `String "r6idn.8xlarge"
  | R6idn_12xlarge -> `String "r6idn.12xlarge"
  | R6idn_16xlarge -> `String "r6idn.16xlarge"
  | R6idn_24xlarge -> `String "r6idn.24xlarge"
  | R6idn_32xlarge -> `String "r6idn.32xlarge"
  | R6in_large -> `String "r6in.large"
  | R6in_xlarge -> `String "r6in.xlarge"
  | R6in_2xlarge -> `String "r6in.2xlarge"
  | R6in_4xlarge -> `String "r6in.4xlarge"
  | R6in_8xlarge -> `String "r6in.8xlarge"
  | R6in_12xlarge -> `String "r6in.12xlarge"
  | R6in_16xlarge -> `String "r6in.16xlarge"
  | R6in_24xlarge -> `String "r6in.24xlarge"
  | R6in_32xlarge -> `String "r6in.32xlarge"
  | R8g_medium -> `String "r8g.medium"
  | R8g_large -> `String "r8g.large"
  | R8g_xlarge -> `String "r8g.xlarge"
  | R8g_2xlarge -> `String "r8g.2xlarge"
  | R8g_4xlarge -> `String "r8g.4xlarge"
  | R8g_8xlarge -> `String "r8g.8xlarge"
  | R8g_12xlarge -> `String "r8g.12xlarge"
  | R8g_16xlarge -> `String "r8g.16xlarge"
  | R8g_24xlarge -> `String "r8g.24xlarge"
  | R8g_48xlarge -> `String "r8g.48xlarge"
  | M4_16xlarge -> `String "m4.16xlarge"
  | C6a_32xlarge -> `String "c6a.32xlarge"
  | C6a_48xlarge -> `String "c6a.48xlarge"
  | C6i_32xlarge -> `String "c6i.32xlarge"
  | R6i_24xlarge -> `String "r6i.24xlarge"
  | R6i_32xlarge -> `String "r6i.32xlarge"
  | C6in_24xlarge -> `String "c6in.24xlarge"
  | C6in_32xlarge -> `String "c6in.32xlarge"
  | C7a_24xlarge -> `String "c7a.24xlarge"
  | C7a_32xlarge -> `String "c7a.32xlarge"
  | C7a_48xlarge -> `String "c7a.48xlarge"
  | C7i_24xlarge -> `String "c7i.24xlarge"
  | C7i_48xlarge -> `String "c7i.48xlarge"
  | M6a_24xlarge -> `String "m6a.24xlarge"
  | M6a_32xlarge -> `String "m6a.32xlarge"
  | M6a_48xlarge -> `String "m6a.48xlarge"
  | M6i_24xlarge -> `String "m6i.24xlarge"
  | M6i_32xlarge -> `String "m6i.32xlarge"
  | M7a_24xlarge -> `String "m7a.24xlarge"
  | M7a_32xlarge -> `String "m7a.32xlarge"
  | M7a_48xlarge -> `String "m7a.48xlarge"
  | M7i_24xlarge -> `String "m7i.24xlarge"
  | M7i_48xlarge -> `String "m7i.48xlarge"
  | R7a_24xlarge -> `String "r7a.24xlarge"
  | R7a_32xlarge -> `String "r7a.32xlarge"
  | R7a_48xlarge -> `String "r7a.48xlarge"

let location_string_model_to_yojson = string_to_yojson

let compute_status_to_yojson (x : compute_status) =
  match x with
  | PENDING -> `String "PENDING"
  | ACTIVE -> `String "ACTIVE"
  | TERMINATING -> `String "TERMINATING"
  | IMPAIRED -> `String "IMPAIRED"

let dns_name_to_yojson = string_to_yojson
let ip_address_to_yojson = string_to_yojson
let compute_arn_to_yojson = string_to_yojson
let compute_name_to_yojson = string_to_yojson
let fleet_arn_to_yojson = string_to_yojson

let compute_to_yojson (x : compute) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("ComputeName", option_to_yojson compute_name_to_yojson x.compute_name);
      ("ComputeArn", option_to_yojson compute_arn_to_yojson x.compute_arn);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("DnsName", option_to_yojson dns_name_to_yojson x.dns_name);
      ("ComputeStatus", option_to_yojson compute_status_to_yojson x.compute_status);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("Type", option_to_yojson ec2_instance_type_to_yojson x.type_);
      ( "GameLiftServiceSdkEndpoint",
        option_to_yojson game_lift_service_sdk_endpoint_output_to_yojson
          x.game_lift_service_sdk_endpoint );
      ( "GameLiftAgentEndpoint",
        option_to_yojson game_lift_agent_endpoint_output_to_yojson x.game_lift_agent_endpoint );
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("ContainerAttributes", option_to_yojson container_attributes_to_yojson x.container_attributes);
      ( "GameServerContainerGroupDefinitionArn",
        option_to_yojson container_group_definition_name_or_arn_to_yojson
          x.game_server_container_group_definition_arn );
    ]

let compute_auth_token_to_yojson = string_to_yojson
let compute_list_to_yojson tree = list_to_yojson compute_to_yojson tree
let compute_name_or_arn_to_yojson = string_to_yojson

let compute_type_to_yojson (x : compute_type) =
  match x with EC2 -> `String "EC2" | ANYWHERE -> `String "ANYWHERE"

let port_number_to_yojson = int_to_yojson

let connection_port_range_to_yojson (x : connection_port_range) =
  assoc_to_yojson
    [
      ("FromPort", Some (port_number_to_yojson x.from_port));
      ("ToPort", Some (port_number_to_yojson x.to_port));
    ]

let non_zero_and255_max_string_to_yojson = string_to_yojson

let container_command_string_list_to_yojson tree =
  list_to_yojson non_zero_and255_max_string_to_yojson tree

let container_dependency_condition_to_yojson (x : container_dependency_condition) =
  match x with
  | START -> `String "START"
  | COMPLETE -> `String "COMPLETE"
  | SUCCESS -> `String "SUCCESS"
  | HEALTHY -> `String "HEALTHY"

let container_dependency_to_yojson (x : container_dependency) =
  assoc_to_yojson
    [
      ("ContainerName", Some (non_zero_and128_max_ascii_string_to_yojson x.container_name));
      ("Condition", Some (container_dependency_condition_to_yojson x.condition));
    ]

let container_dependency_list_to_yojson tree = list_to_yojson container_dependency_to_yojson tree

let container_environment_to_yojson (x : container_environment) =
  assoc_to_yojson
    [
      ("Name", Some (non_zero_and255_max_string_to_yojson x.name));
      ("Value", Some (non_zero_and255_max_string_to_yojson x.value));
    ]

let container_environment_list_to_yojson tree = list_to_yojson container_environment_to_yojson tree

let player_gateway_mode_to_yojson (x : player_gateway_mode) =
  match x with
  | DISABLED -> `String "DISABLED"
  | ENABLED -> `String "ENABLED"
  | REQUIRED -> `String "REQUIRED"

let player_gateway_status_to_yojson (x : player_gateway_status) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let container_fleet_location_status_to_yojson (x : container_fleet_location_status) =
  match x with
  | PENDING -> `String "PENDING"
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"
  | ACTIVATING -> `String "ACTIVATING"
  | ACTIVE -> `String "ACTIVE"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"

let container_fleet_location_attributes_to_yojson (x : container_fleet_location_attributes) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("Status", option_to_yojson container_fleet_location_status_to_yojson x.status);
      ( "PlayerGatewayStatus",
        option_to_yojson player_gateway_status_to_yojson x.player_gateway_status );
    ]

let container_fleet_location_attributes_list_to_yojson tree =
  list_to_yojson container_fleet_location_attributes_to_yojson tree

let log_group_arn_string_model_to_yojson = string_to_yojson

let log_destination_to_yojson (x : log_destination) =
  match x with NONE -> `String "NONE" | CLOUDWATCH -> `String "CLOUDWATCH" | S3 -> `String "S3"

let log_configuration_to_yojson (x : log_configuration) =
  assoc_to_yojson
    [
      ("LogDestination", option_to_yojson log_destination_to_yojson x.log_destination);
      ("S3BucketName", option_to_yojson non_empty_string_to_yojson x.s3_bucket_name);
      ("LogGroupArn", option_to_yojson log_group_arn_string_model_to_yojson x.log_group_arn);
    ]

let deployment_id_to_yojson = string_to_yojson

let deployment_details_to_yojson (x : deployment_details) =
  assoc_to_yojson
    [ ("LatestDeploymentId", option_to_yojson deployment_id_to_yojson x.latest_deployment_id) ]

let container_fleet_status_to_yojson (x : container_fleet_status) =
  match x with
  | PENDING -> `String "PENDING"
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"
  | ACTIVATING -> `String "ACTIVATING"
  | ACTIVE -> `String "ACTIVE"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"

let whole_number_to_yojson = int_to_yojson

let game_session_creation_limit_policy_to_yojson (x : game_session_creation_limit_policy) =
  assoc_to_yojson
    [
      ( "NewGameSessionsPerCreator",
        option_to_yojson whole_number_to_yojson x.new_game_sessions_per_creator );
      ("PolicyPeriodInMinutes", option_to_yojson whole_number_to_yojson x.policy_period_in_minutes);
    ]

let protection_policy_to_yojson (x : protection_policy) =
  match x with NoProtection -> `String "NoProtection" | FullProtection -> `String "FullProtection"

let metric_group_to_yojson = string_to_yojson
let metric_group_list_to_yojson tree = list_to_yojson metric_group_to_yojson tree
let non_zero_and_max_string_to_yojson = string_to_yojson

let container_fleet_billing_type_to_yojson (x : container_fleet_billing_type) =
  match x with ON_DEMAND -> `String "ON_DEMAND" | SPOT -> `String "SPOT"

let maximum_game_server_container_groups_per_instance_to_yojson = int_to_yojson
let game_server_container_groups_per_instance_to_yojson = int_to_yojson

let ip_protocol_to_yojson (x : ip_protocol) =
  match x with TCP -> `String "TCP" | UDP -> `String "UDP"

let ip_range_to_yojson = string_to_yojson

let ip_permission_to_yojson (x : ip_permission) =
  assoc_to_yojson
    [
      ("FromPort", Some (port_number_to_yojson x.from_port));
      ("ToPort", Some (port_number_to_yojson x.to_port));
      ("IpRange", Some (ip_range_to_yojson x.ip_range));
      ("Protocol", Some (ip_protocol_to_yojson x.protocol));
    ]

let ip_permissions_list_to_yojson tree = list_to_yojson ip_permission_to_yojson tree
let container_group_definition_arn_to_yojson = string_to_yojson
let container_group_definition_name_to_yojson = string_to_yojson
let iam_role_arn_to_yojson = string_to_yojson

let container_fleet_to_yojson (x : container_fleet) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetRoleArn", option_to_yojson iam_role_arn_to_yojson x.fleet_role_arn);
      ( "GameServerContainerGroupDefinitionName",
        option_to_yojson container_group_definition_name_to_yojson
          x.game_server_container_group_definition_name );
      ( "GameServerContainerGroupDefinitionArn",
        option_to_yojson container_group_definition_arn_to_yojson
          x.game_server_container_group_definition_arn );
      ( "PerInstanceContainerGroupDefinitionName",
        option_to_yojson container_group_definition_name_to_yojson
          x.per_instance_container_group_definition_name );
      ( "PerInstanceContainerGroupDefinitionArn",
        option_to_yojson container_group_definition_arn_to_yojson
          x.per_instance_container_group_definition_arn );
      ( "InstanceConnectionPortRange",
        option_to_yojson connection_port_range_to_yojson x.instance_connection_port_range );
      ( "InstanceInboundPermissions",
        option_to_yojson ip_permissions_list_to_yojson x.instance_inbound_permissions );
      ( "GameServerContainerGroupsPerInstance",
        option_to_yojson game_server_container_groups_per_instance_to_yojson
          x.game_server_container_groups_per_instance );
      ( "MaximumGameServerContainerGroupsPerInstance",
        option_to_yojson maximum_game_server_container_groups_per_instance_to_yojson
          x.maximum_game_server_container_groups_per_instance );
      ("InstanceType", option_to_yojson non_zero_and_max_string_to_yojson x.instance_type);
      ("BillingType", option_to_yojson container_fleet_billing_type_to_yojson x.billing_type);
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("MetricGroups", option_to_yojson metric_group_list_to_yojson x.metric_groups);
      ( "NewGameSessionProtectionPolicy",
        option_to_yojson protection_policy_to_yojson x.new_game_session_protection_policy );
      ( "GameSessionCreationLimitPolicy",
        option_to_yojson game_session_creation_limit_policy_to_yojson
          x.game_session_creation_limit_policy );
      ("Status", option_to_yojson container_fleet_status_to_yojson x.status);
      ("DeploymentDetails", option_to_yojson deployment_details_to_yojson x.deployment_details);
      ("LogConfiguration", option_to_yojson log_configuration_to_yojson x.log_configuration);
      ( "LocationAttributes",
        option_to_yojson container_fleet_location_attributes_list_to_yojson x.location_attributes );
      ("PlayerGatewayMode", option_to_yojson player_gateway_mode_to_yojson x.player_gateway_mode);
    ]

let container_fleet_list_to_yojson tree = list_to_yojson container_fleet_to_yojson tree

let container_fleet_remove_attribute_to_yojson (x : container_fleet_remove_attribute) =
  match x with
  | PER_INSTANCE_CONTAINER_GROUP_DEFINITION -> `String "PER_INSTANCE_CONTAINER_GROUP_DEFINITION"

let container_fleet_remove_attribute_list_to_yojson tree =
  list_to_yojson container_fleet_remove_attribute_to_yojson tree

let container_group_definition_status_to_yojson (x : container_group_definition_status) =
  match x with
  | READY -> `String "READY"
  | COPYING -> `String "COPYING"
  | FAILED -> `String "FAILED"

let positive_integer_to_yojson = int_to_yojson

let linux_capability_to_yojson (x : linux_capability) =
  match x with
  | AUDIT_CONTROL -> `String "AUDIT_CONTROL"
  | AUDIT_WRITE -> `String "AUDIT_WRITE"
  | BLOCK_SUSPEND -> `String "BLOCK_SUSPEND"
  | CHOWN -> `String "CHOWN"
  | DAC_OVERRIDE -> `String "DAC_OVERRIDE"
  | DAC_READ_SEARCH -> `String "DAC_READ_SEARCH"
  | FOWNER -> `String "FOWNER"
  | FSETID -> `String "FSETID"
  | IPC_LOCK -> `String "IPC_LOCK"
  | IPC_OWNER -> `String "IPC_OWNER"
  | KILL -> `String "KILL"
  | LEASE -> `String "LEASE"
  | LINUX_IMMUTABLE -> `String "LINUX_IMMUTABLE"
  | MAC_ADMIN -> `String "MAC_ADMIN"
  | MAC_OVERRIDE -> `String "MAC_OVERRIDE"
  | MKNOD -> `String "MKNOD"
  | NET_ADMIN -> `String "NET_ADMIN"
  | NET_BIND_SERVICE -> `String "NET_BIND_SERVICE"
  | NET_BROADCAST -> `String "NET_BROADCAST"
  | NET_RAW -> `String "NET_RAW"
  | SETFCAP -> `String "SETFCAP"
  | SETGID -> `String "SETGID"
  | SETPCAP -> `String "SETPCAP"
  | SETUID -> `String "SETUID"
  | SYS_ADMIN -> `String "SYS_ADMIN"
  | SYS_BOOT -> `String "SYS_BOOT"
  | SYS_CHROOT -> `String "SYS_CHROOT"
  | SYS_MODULE -> `String "SYS_MODULE"
  | SYS_NICE -> `String "SYS_NICE"
  | SYS_PACCT -> `String "SYS_PACCT"
  | SYS_PTRACE -> `String "SYS_PTRACE"
  | SYS_RAWIO -> `String "SYS_RAWIO"
  | SYS_RESOURCE -> `String "SYS_RESOURCE"
  | SYS_TIME -> `String "SYS_TIME"
  | SYS_TTY_CONFIG -> `String "SYS_TTY_CONFIG"
  | SYSLOG -> `String "SYSLOG"
  | WAKE_ALARM -> `String "WAKE_ALARM"

let linux_capability_list_to_yojson tree = list_to_yojson linux_capability_to_yojson tree

let linux_capabilities_to_yojson (x : linux_capabilities) =
  assoc_to_yojson [ ("Include", option_to_yojson linux_capability_list_to_yojson x.include_) ]

let container_vcpu_to_yojson = double_to_yojson
let sha256_to_yojson = string_to_yojson

let container_port_range_to_yojson (x : container_port_range) =
  assoc_to_yojson
    [
      ("FromPort", Some (port_number_to_yojson x.from_port));
      ("ToPort", Some (port_number_to_yojson x.to_port));
      ("Protocol", Some (ip_protocol_to_yojson x.protocol));
    ]

let container_port_range_list_to_yojson tree = list_to_yojson container_port_range_to_yojson tree

let container_port_configuration_to_yojson (x : container_port_configuration) =
  assoc_to_yojson
    [ ("ContainerPortRanges", Some (container_port_range_list_to_yojson x.container_port_ranges)) ]

let container_memory_limit_to_yojson = int_to_yojson
let image_uri_string_to_yojson = string_to_yojson
let container_health_check_timeout_to_yojson = int_to_yojson
let container_health_check_start_period_to_yojson = int_to_yojson
let container_health_check_retries_to_yojson = int_to_yojson
let container_health_check_interval_to_yojson = int_to_yojson

let container_health_check_to_yojson (x : container_health_check) =
  assoc_to_yojson
    [
      ("Command", Some (container_command_string_list_to_yojson x.command));
      ("Interval", option_to_yojson container_health_check_interval_to_yojson x.interval);
      ("Retries", option_to_yojson container_health_check_retries_to_yojson x.retries);
      ("StartPeriod", option_to_yojson container_health_check_start_period_to_yojson x.start_period);
      ("Timeout", option_to_yojson container_health_check_timeout_to_yojson x.timeout);
    ]

let container_mount_point_access_level_to_yojson (x : container_mount_point_access_level) =
  match x with READ_ONLY -> `String "READ_ONLY" | READ_AND_WRITE -> `String "READ_AND_WRITE"

let container_path_string_to_yojson = string_to_yojson
let instance_path_string_to_yojson = string_to_yojson

let container_mount_point_to_yojson (x : container_mount_point) =
  assoc_to_yojson
    [
      ("InstancePath", Some (instance_path_string_to_yojson x.instance_path));
      ("ContainerPath", option_to_yojson container_path_string_to_yojson x.container_path);
      ("AccessLevel", option_to_yojson container_mount_point_access_level_to_yojson x.access_level);
    ]

let container_mount_point_list_to_yojson tree = list_to_yojson container_mount_point_to_yojson tree

let support_container_definition_to_yojson (x : support_container_definition) =
  assoc_to_yojson
    [
      ("ContainerName", option_to_yojson non_zero_and128_max_ascii_string_to_yojson x.container_name);
      ("DependsOn", option_to_yojson container_dependency_list_to_yojson x.depends_on);
      ("MountPoints", option_to_yojson container_mount_point_list_to_yojson x.mount_points);
      ( "EnvironmentOverride",
        option_to_yojson container_environment_list_to_yojson x.environment_override );
      ("Essential", option_to_yojson boolean_model_to_yojson x.essential);
      ("HealthCheck", option_to_yojson container_health_check_to_yojson x.health_check);
      ("ImageUri", option_to_yojson image_uri_string_to_yojson x.image_uri);
      ( "MemoryHardLimitMebibytes",
        option_to_yojson container_memory_limit_to_yojson x.memory_hard_limit_mebibytes );
      ( "PortConfiguration",
        option_to_yojson container_port_configuration_to_yojson x.port_configuration );
      ("ResolvedImageDigest", option_to_yojson sha256_to_yojson x.resolved_image_digest);
      ("Vcpu", option_to_yojson container_vcpu_to_yojson x.vcpu);
      ("LinuxCapabilities", option_to_yojson linux_capabilities_to_yojson x.linux_capabilities);
    ]

let support_container_definition_list_to_yojson tree =
  list_to_yojson support_container_definition_to_yojson tree

let game_server_container_definition_to_yojson (x : game_server_container_definition) =
  assoc_to_yojson
    [
      ("ContainerName", option_to_yojson non_zero_and128_max_ascii_string_to_yojson x.container_name);
      ("DependsOn", option_to_yojson container_dependency_list_to_yojson x.depends_on);
      ("MountPoints", option_to_yojson container_mount_point_list_to_yojson x.mount_points);
      ( "EnvironmentOverride",
        option_to_yojson container_environment_list_to_yojson x.environment_override );
      ("ImageUri", option_to_yojson image_uri_string_to_yojson x.image_uri);
      ( "PortConfiguration",
        option_to_yojson container_port_configuration_to_yojson x.port_configuration );
      ("ResolvedImageDigest", option_to_yojson sha256_to_yojson x.resolved_image_digest);
      ("ServerSdkVersion", option_to_yojson server_sdk_version_to_yojson x.server_sdk_version);
      ("LinuxCapabilities", option_to_yojson linux_capabilities_to_yojson x.linux_capabilities);
    ]

let container_total_vcpu_limit_to_yojson = double_to_yojson
let container_total_memory_limit_to_yojson = int_to_yojson

let container_group_type_to_yojson (x : container_group_type) =
  match x with GAME_SERVER -> `String "GAME_SERVER" | PER_INSTANCE -> `String "PER_INSTANCE"

let container_operating_system_to_yojson (x : container_operating_system) =
  match x with AMAZON_LINUX_2023 -> `String "AMAZON_LINUX_2023"

let container_group_definition_to_yojson (x : container_group_definition) =
  assoc_to_yojson
    [
      ( "ContainerGroupDefinitionArn",
        option_to_yojson container_group_definition_arn_to_yojson x.container_group_definition_arn
      );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("OperatingSystem", option_to_yojson container_operating_system_to_yojson x.operating_system);
      ("Name", Some (container_group_definition_name_to_yojson x.name));
      ("ContainerGroupType", option_to_yojson container_group_type_to_yojson x.container_group_type);
      ( "TotalMemoryLimitMebibytes",
        option_to_yojson container_total_memory_limit_to_yojson x.total_memory_limit_mebibytes );
      ("TotalVcpuLimit", option_to_yojson container_total_vcpu_limit_to_yojson x.total_vcpu_limit);
      ( "GameServerContainerDefinition",
        option_to_yojson game_server_container_definition_to_yojson
          x.game_server_container_definition );
      ( "SupportContainerDefinitions",
        option_to_yojson support_container_definition_list_to_yojson x.support_container_definitions
      );
      ("VersionNumber", option_to_yojson positive_integer_to_yojson x.version_number);
      ( "VersionDescription",
        option_to_yojson non_zero_and_max_string_to_yojson x.version_description );
      ("Status", option_to_yojson container_group_definition_status_to_yojson x.status);
      ("StatusReason", option_to_yojson non_zero_and_max_string_to_yojson x.status_reason);
    ]

let container_group_definition_list_to_yojson tree =
  list_to_yojson container_group_definition_to_yojson tree

let container_port_mapping_to_yojson (x : container_port_mapping) =
  assoc_to_yojson
    [
      ("ContainerPort", option_to_yojson port_number_to_yojson x.container_port);
      ("ConnectionPort", option_to_yojson port_number_to_yojson x.connection_port);
      ("Protocol", option_to_yojson ip_protocol_to_yojson x.protocol);
    ]

let container_port_mapping_list_to_yojson tree =
  list_to_yojson container_port_mapping_to_yojson tree

let container_group_port_mapping_to_yojson (x : container_group_port_mapping) =
  assoc_to_yojson
    [
      ("ContainerName", option_to_yojson non_zero_and128_max_ascii_string_to_yojson x.container_name);
      ("ContainerRuntimeId", option_to_yojson non_empty_string_to_yojson x.container_runtime_id);
      ( "ContainerPortMappings",
        option_to_yojson container_port_mapping_list_to_yojson x.container_port_mappings );
    ]

let container_group_port_mapping_list_to_yojson tree =
  list_to_yojson container_group_port_mapping_to_yojson tree

let container_identifier_to_yojson (x : container_identifier) =
  assoc_to_yojson
    [
      ("ContainerName", option_to_yojson non_zero_and128_max_ascii_string_to_yojson x.container_name);
      ("ContainerRuntimeId", option_to_yojson non_empty_string_to_yojson x.container_runtime_id);
    ]

let container_identifier_list_to_yojson tree = list_to_yojson container_identifier_to_yojson tree

let tagging_failed_exception_to_yojson (x : tagging_failed_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let create_alias_output_to_yojson (x : create_alias_output) =
  assoc_to_yojson [ ("Alias", option_to_yojson alias_to_yojson x.alias) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let create_alias_input_to_yojson (x : create_alias_input) =
  assoc_to_yojson
    [
      ("Name", Some (non_blank_and_length_constraint_string_to_yojson x.name));
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("RoutingStrategy", Some (routing_strategy_to_yojson x.routing_strategy));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let s3_location_to_yojson (x : s3_location) =
  assoc_to_yojson
    [
      ("Bucket", option_to_yojson non_empty_string_to_yojson x.bucket);
      ("Key", option_to_yojson non_empty_string_to_yojson x.key);
      ("RoleArn", option_to_yojson non_empty_string_to_yojson x.role_arn);
      ("ObjectVersion", option_to_yojson non_empty_string_to_yojson x.object_version);
    ]

let create_build_output_to_yojson (x : create_build_output) =
  assoc_to_yojson
    [
      ("Build", option_to_yojson build_to_yojson x.build);
      ("UploadCredentials", option_to_yojson aws_credentials_to_yojson x.upload_credentials);
      ("StorageLocation", option_to_yojson s3_location_to_yojson x.storage_location);
    ]

let create_build_input_to_yojson (x : create_build_input) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("Version", option_to_yojson non_zero_and_max_string_to_yojson x.version);
      ("StorageLocation", option_to_yojson s3_location_to_yojson x.storage_location);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ServerSdkVersion", option_to_yojson server_sdk_version_to_yojson x.server_sdk_version);
    ]

let create_container_fleet_output_to_yojson (x : create_container_fleet_output) =
  assoc_to_yojson
    [ ("ContainerFleet", option_to_yojson container_fleet_to_yojson x.container_fleet) ]

let location_configuration_to_yojson (x : location_configuration) =
  assoc_to_yojson [ ("Location", Some (location_string_model_to_yojson x.location)) ]

let location_configuration_list_to_yojson tree =
  list_to_yojson location_configuration_to_yojson tree

let create_container_fleet_input_to_yojson (x : create_container_fleet_input) =
  assoc_to_yojson
    [
      ("FleetRoleArn", Some (iam_role_arn_to_yojson x.fleet_role_arn));
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ( "GameServerContainerGroupDefinitionName",
        option_to_yojson container_group_definition_name_or_arn_to_yojson
          x.game_server_container_group_definition_name );
      ( "PerInstanceContainerGroupDefinitionName",
        option_to_yojson container_group_definition_name_or_arn_to_yojson
          x.per_instance_container_group_definition_name );
      ( "InstanceConnectionPortRange",
        option_to_yojson connection_port_range_to_yojson x.instance_connection_port_range );
      ( "InstanceInboundPermissions",
        option_to_yojson ip_permissions_list_to_yojson x.instance_inbound_permissions );
      ( "GameServerContainerGroupsPerInstance",
        option_to_yojson game_server_container_groups_per_instance_to_yojson
          x.game_server_container_groups_per_instance );
      ("InstanceType", option_to_yojson non_zero_and_max_string_to_yojson x.instance_type);
      ("BillingType", option_to_yojson container_fleet_billing_type_to_yojson x.billing_type);
      ("Locations", option_to_yojson location_configuration_list_to_yojson x.locations);
      ("MetricGroups", option_to_yojson metric_group_list_to_yojson x.metric_groups);
      ( "NewGameSessionProtectionPolicy",
        option_to_yojson protection_policy_to_yojson x.new_game_session_protection_policy );
      ( "GameSessionCreationLimitPolicy",
        option_to_yojson game_session_creation_limit_policy_to_yojson
          x.game_session_creation_limit_policy );
      ("LogConfiguration", option_to_yojson log_configuration_to_yojson x.log_configuration);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("PlayerGatewayMode", option_to_yojson player_gateway_mode_to_yojson x.player_gateway_mode);
    ]

let create_container_group_definition_output_to_yojson
    (x : create_container_group_definition_output) =
  assoc_to_yojson
    [
      ( "ContainerGroupDefinition",
        option_to_yojson container_group_definition_to_yojson x.container_group_definition );
    ]

let support_container_definition_input_to_yojson (x : support_container_definition_input) =
  assoc_to_yojson
    [
      ("ContainerName", Some (non_zero_and128_max_ascii_string_to_yojson x.container_name));
      ("DependsOn", option_to_yojson container_dependency_list_to_yojson x.depends_on);
      ("MountPoints", option_to_yojson container_mount_point_list_to_yojson x.mount_points);
      ( "EnvironmentOverride",
        option_to_yojson container_environment_list_to_yojson x.environment_override );
      ("Essential", option_to_yojson boolean_model_to_yojson x.essential);
      ("HealthCheck", option_to_yojson container_health_check_to_yojson x.health_check);
      ("ImageUri", Some (image_uri_string_to_yojson x.image_uri));
      ( "MemoryHardLimitMebibytes",
        option_to_yojson container_memory_limit_to_yojson x.memory_hard_limit_mebibytes );
      ( "PortConfiguration",
        option_to_yojson container_port_configuration_to_yojson x.port_configuration );
      ("Vcpu", option_to_yojson container_vcpu_to_yojson x.vcpu);
      ("LinuxCapabilities", option_to_yojson linux_capabilities_to_yojson x.linux_capabilities);
    ]

let support_container_definition_input_list_to_yojson tree =
  list_to_yojson support_container_definition_input_to_yojson tree

let game_server_container_definition_input_to_yojson (x : game_server_container_definition_input) =
  assoc_to_yojson
    [
      ("ContainerName", Some (non_zero_and128_max_ascii_string_to_yojson x.container_name));
      ("DependsOn", option_to_yojson container_dependency_list_to_yojson x.depends_on);
      ("MountPoints", option_to_yojson container_mount_point_list_to_yojson x.mount_points);
      ( "EnvironmentOverride",
        option_to_yojson container_environment_list_to_yojson x.environment_override );
      ("ImageUri", Some (image_uri_string_to_yojson x.image_uri));
      ("PortConfiguration", Some (container_port_configuration_to_yojson x.port_configuration));
      ("ServerSdkVersion", Some (server_sdk_version_to_yojson x.server_sdk_version));
      ("LinuxCapabilities", option_to_yojson linux_capabilities_to_yojson x.linux_capabilities);
    ]

let create_container_group_definition_input_to_yojson (x : create_container_group_definition_input)
    =
  assoc_to_yojson
    [
      ("Name", Some (container_group_definition_name_to_yojson x.name));
      ("ContainerGroupType", option_to_yojson container_group_type_to_yojson x.container_group_type);
      ( "TotalMemoryLimitMebibytes",
        Some (container_total_memory_limit_to_yojson x.total_memory_limit_mebibytes) );
      ("TotalVcpuLimit", Some (container_total_vcpu_limit_to_yojson x.total_vcpu_limit));
      ( "GameServerContainerDefinition",
        option_to_yojson game_server_container_definition_input_to_yojson
          x.game_server_container_definition );
      ( "SupportContainerDefinitions",
        option_to_yojson support_container_definition_input_list_to_yojson
          x.support_container_definitions );
      ("OperatingSystem", Some (container_operating_system_to_yojson x.operating_system));
      ( "VersionDescription",
        option_to_yojson non_zero_and_max_string_to_yojson x.version_description );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let not_ready_exception_to_yojson (x : not_ready_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let fleet_status_to_yojson (x : fleet_status) =
  match x with
  | NEW -> `String "NEW"
  | DOWNLOADING -> `String "DOWNLOADING"
  | VALIDATING -> `String "VALIDATING"
  | BUILDING -> `String "BUILDING"
  | ACTIVATING -> `String "ACTIVATING"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | ERROR -> `String "ERROR"
  | TERMINATED -> `String "TERMINATED"
  | NOT_FOUND -> `String "NOT_FOUND"

let location_state_to_yojson (x : location_state) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("Status", option_to_yojson fleet_status_to_yojson x.status);
      ( "PlayerGatewayStatus",
        option_to_yojson player_gateway_status_to_yojson x.player_gateway_status );
    ]

let location_state_list_to_yojson tree = list_to_yojson location_state_to_yojson tree

let game_server_ip_protocol_supported_to_yojson (x : game_server_ip_protocol_supported) =
  match x with IPv4 -> `String "IPv4" | DUAL_STACK -> `String "DUAL_STACK"

let player_gateway_configuration_to_yojson (x : player_gateway_configuration) =
  assoc_to_yojson
    [
      ( "GameServerIpProtocolSupported",
        option_to_yojson game_server_ip_protocol_supported_to_yojson
          x.game_server_ip_protocol_supported );
    ]

let instance_role_credentials_provider_to_yojson (x : instance_role_credentials_provider) =
  match x with SHARED_CREDENTIAL_FILE -> `String "SHARED_CREDENTIAL_FILE"

let fleet_action_to_yojson (x : fleet_action) = match x with AutoScaling -> `String "AUTO_SCALING"
let fleet_action_list_to_yojson tree = list_to_yojson fleet_action_to_yojson tree

let resource_creation_limit_policy_to_yojson (x : resource_creation_limit_policy) =
  assoc_to_yojson
    [
      ( "NewGameSessionsPerCreator",
        option_to_yojson whole_number_to_yojson x.new_game_sessions_per_creator );
      ("PolicyPeriodInMinutes", option_to_yojson whole_number_to_yojson x.policy_period_in_minutes);
    ]

let string_list_to_yojson tree = list_to_yojson non_zero_and_max_string_to_yojson tree
let launch_parameters_string_model_to_yojson = string_to_yojson
let launch_path_string_model_to_yojson = string_to_yojson
let script_arn_to_yojson = string_to_yojson
let script_id_to_yojson = string_to_yojson

let fleet_type_to_yojson (x : fleet_type) =
  match x with OnDemand -> `String "ON_DEMAND" | Spot -> `String "SPOT"

let fleet_attributes_to_yojson (x : fleet_attributes) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("FleetType", option_to_yojson fleet_type_to_yojson x.fleet_type);
      ("InstanceType", option_to_yojson ec2_instance_type_to_yojson x.instance_type);
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("TerminationTime", option_to_yojson timestamp_to_yojson x.termination_time);
      ("Status", option_to_yojson fleet_status_to_yojson x.status);
      ("BuildId", option_to_yojson build_id_to_yojson x.build_id);
      ("BuildArn", option_to_yojson build_arn_to_yojson x.build_arn);
      ("ScriptId", option_to_yojson script_id_to_yojson x.script_id);
      ("ScriptArn", option_to_yojson script_arn_to_yojson x.script_arn);
      ("ServerLaunchPath", option_to_yojson launch_path_string_model_to_yojson x.server_launch_path);
      ( "ServerLaunchParameters",
        option_to_yojson launch_parameters_string_model_to_yojson x.server_launch_parameters );
      ("LogPaths", option_to_yojson string_list_to_yojson x.log_paths);
      ( "NewGameSessionProtectionPolicy",
        option_to_yojson protection_policy_to_yojson x.new_game_session_protection_policy );
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ( "ResourceCreationLimitPolicy",
        option_to_yojson resource_creation_limit_policy_to_yojson x.resource_creation_limit_policy
      );
      ("MetricGroups", option_to_yojson metric_group_list_to_yojson x.metric_groups);
      ("StoppedActions", option_to_yojson fleet_action_list_to_yojson x.stopped_actions);
      ("InstanceRoleArn", option_to_yojson non_empty_string_to_yojson x.instance_role_arn);
      ( "CertificateConfiguration",
        option_to_yojson certificate_configuration_to_yojson x.certificate_configuration );
      ("ComputeType", option_to_yojson compute_type_to_yojson x.compute_type);
      ( "AnywhereConfiguration",
        option_to_yojson anywhere_configuration_to_yojson x.anywhere_configuration );
      ( "InstanceRoleCredentialsProvider",
        option_to_yojson instance_role_credentials_provider_to_yojson
          x.instance_role_credentials_provider );
      ("PlayerGatewayMode", option_to_yojson player_gateway_mode_to_yojson x.player_gateway_mode);
      ( "PlayerGatewayConfiguration",
        option_to_yojson player_gateway_configuration_to_yojson x.player_gateway_configuration );
    ]

let create_fleet_output_to_yojson (x : create_fleet_output) =
  assoc_to_yojson
    [
      ("FleetAttributes", option_to_yojson fleet_attributes_to_yojson x.fleet_attributes);
      ("LocationStates", option_to_yojson location_state_list_to_yojson x.location_states);
    ]

let game_session_activation_timeout_seconds_to_yojson = int_to_yojson
let max_concurrent_game_session_activations_to_yojson = int_to_yojson

let server_process_to_yojson (x : server_process) =
  assoc_to_yojson
    [
      ("LaunchPath", Some (launch_path_string_model_to_yojson x.launch_path));
      ("Parameters", option_to_yojson launch_parameters_string_model_to_yojson x.parameters);
      ("ConcurrentExecutions", Some (positive_integer_to_yojson x.concurrent_executions));
    ]

let server_process_list_to_yojson tree = list_to_yojson server_process_to_yojson tree

let runtime_configuration_to_yojson (x : runtime_configuration) =
  assoc_to_yojson
    [
      ("ServerProcesses", option_to_yojson server_process_list_to_yojson x.server_processes);
      ( "MaxConcurrentGameSessionActivations",
        option_to_yojson max_concurrent_game_session_activations_to_yojson
          x.max_concurrent_game_session_activations );
      ( "GameSessionActivationTimeoutSeconds",
        option_to_yojson game_session_activation_timeout_seconds_to_yojson
          x.game_session_activation_timeout_seconds );
    ]

let script_id_or_arn_to_yojson = string_to_yojson

let create_fleet_input_to_yojson (x : create_fleet_input) =
  assoc_to_yojson
    [
      ("Name", Some (non_zero_and_max_string_to_yojson x.name));
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("BuildId", option_to_yojson build_id_or_arn_to_yojson x.build_id);
      ("ScriptId", option_to_yojson script_id_or_arn_to_yojson x.script_id);
      ("ServerLaunchPath", option_to_yojson launch_path_string_model_to_yojson x.server_launch_path);
      ( "ServerLaunchParameters",
        option_to_yojson launch_parameters_string_model_to_yojson x.server_launch_parameters );
      ("LogPaths", option_to_yojson string_list_to_yojson x.log_paths);
      ("EC2InstanceType", option_to_yojson ec2_instance_type_to_yojson x.ec2_instance_type);
      ( "EC2InboundPermissions",
        option_to_yojson ip_permissions_list_to_yojson x.ec2_inbound_permissions );
      ( "NewGameSessionProtectionPolicy",
        option_to_yojson protection_policy_to_yojson x.new_game_session_protection_policy );
      ( "RuntimeConfiguration",
        option_to_yojson runtime_configuration_to_yojson x.runtime_configuration );
      ( "ResourceCreationLimitPolicy",
        option_to_yojson resource_creation_limit_policy_to_yojson x.resource_creation_limit_policy
      );
      ("MetricGroups", option_to_yojson metric_group_list_to_yojson x.metric_groups);
      ( "PeerVpcAwsAccountId",
        option_to_yojson non_zero_and_max_string_to_yojson x.peer_vpc_aws_account_id );
      ("PeerVpcId", option_to_yojson non_zero_and_max_string_to_yojson x.peer_vpc_id);
      ("FleetType", option_to_yojson fleet_type_to_yojson x.fleet_type);
      ("InstanceRoleArn", option_to_yojson non_empty_string_to_yojson x.instance_role_arn);
      ( "CertificateConfiguration",
        option_to_yojson certificate_configuration_to_yojson x.certificate_configuration );
      ("Locations", option_to_yojson location_configuration_list_to_yojson x.locations);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ComputeType", option_to_yojson compute_type_to_yojson x.compute_type);
      ( "AnywhereConfiguration",
        option_to_yojson anywhere_configuration_to_yojson x.anywhere_configuration );
      ( "InstanceRoleCredentialsProvider",
        option_to_yojson instance_role_credentials_provider_to_yojson
          x.instance_role_credentials_provider );
      ("PlayerGatewayMode", option_to_yojson player_gateway_mode_to_yojson x.player_gateway_mode);
      ( "PlayerGatewayConfiguration",
        option_to_yojson player_gateway_configuration_to_yojson x.player_gateway_configuration );
    ]

let invalid_fleet_status_exception_to_yojson (x : invalid_fleet_status_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let fleet_id_or_arn_to_yojson = string_to_yojson

let create_fleet_locations_output_to_yojson (x : create_fleet_locations_output) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("LocationStates", option_to_yojson location_state_list_to_yojson x.location_states);
    ]

let create_fleet_locations_input_to_yojson (x : create_fleet_locations_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("Locations", Some (location_configuration_list_to_yojson x.locations));
    ]

let game_server_group_action_to_yojson (x : game_server_group_action) =
  match x with REPLACE_INSTANCE_TYPES -> `String "REPLACE_INSTANCE_TYPES"

let game_server_group_actions_to_yojson tree =
  list_to_yojson game_server_group_action_to_yojson tree

let game_server_group_status_to_yojson (x : game_server_group_status) =
  match x with
  | NEW -> `String "NEW"
  | ACTIVATING -> `String "ACTIVATING"
  | ACTIVE -> `String "ACTIVE"
  | DELETE_SCHEDULED -> `String "DELETE_SCHEDULED"
  | DELETING -> `String "DELETING"
  | DELETED -> `String "DELETED"
  | ERROR -> `String "ERROR"

let game_server_protection_policy_to_yojson (x : game_server_protection_policy) =
  match x with
  | NO_PROTECTION -> `String "NO_PROTECTION"
  | FULL_PROTECTION -> `String "FULL_PROTECTION"

let weighted_capacity_to_yojson = string_to_yojson

let game_server_group_instance_type_to_yojson (x : game_server_group_instance_type) =
  match x with
  | C4_large -> `String "c4.large"
  | C4_xlarge -> `String "c4.xlarge"
  | C4_2xlarge -> `String "c4.2xlarge"
  | C4_4xlarge -> `String "c4.4xlarge"
  | C4_8xlarge -> `String "c4.8xlarge"
  | C5_large -> `String "c5.large"
  | C5_xlarge -> `String "c5.xlarge"
  | C5_2xlarge -> `String "c5.2xlarge"
  | C5_4xlarge -> `String "c5.4xlarge"
  | C5_9xlarge -> `String "c5.9xlarge"
  | C5_12xlarge -> `String "c5.12xlarge"
  | C5_18xlarge -> `String "c5.18xlarge"
  | C5_24xlarge -> `String "c5.24xlarge"
  | C5a_large -> `String "c5a.large"
  | C5a_xlarge -> `String "c5a.xlarge"
  | C5a_2xlarge -> `String "c5a.2xlarge"
  | C5a_4xlarge -> `String "c5a.4xlarge"
  | C5a_8xlarge -> `String "c5a.8xlarge"
  | C5a_12xlarge -> `String "c5a.12xlarge"
  | C5a_16xlarge -> `String "c5a.16xlarge"
  | C5a_24xlarge -> `String "c5a.24xlarge"
  | C6g_medium -> `String "c6g.medium"
  | C6g_large -> `String "c6g.large"
  | C6g_xlarge -> `String "c6g.xlarge"
  | C6g_2xlarge -> `String "c6g.2xlarge"
  | C6g_4xlarge -> `String "c6g.4xlarge"
  | C6g_8xlarge -> `String "c6g.8xlarge"
  | C6g_12xlarge -> `String "c6g.12xlarge"
  | C6g_16xlarge -> `String "c6g.16xlarge"
  | R4_large -> `String "r4.large"
  | R4_xlarge -> `String "r4.xlarge"
  | R4_2xlarge -> `String "r4.2xlarge"
  | R4_4xlarge -> `String "r4.4xlarge"
  | R4_8xlarge -> `String "r4.8xlarge"
  | R4_16xlarge -> `String "r4.16xlarge"
  | R5_large -> `String "r5.large"
  | R5_xlarge -> `String "r5.xlarge"
  | R5_2xlarge -> `String "r5.2xlarge"
  | R5_4xlarge -> `String "r5.4xlarge"
  | R5_8xlarge -> `String "r5.8xlarge"
  | R5_12xlarge -> `String "r5.12xlarge"
  | R5_16xlarge -> `String "r5.16xlarge"
  | R5_24xlarge -> `String "r5.24xlarge"
  | R5a_large -> `String "r5a.large"
  | R5a_xlarge -> `String "r5a.xlarge"
  | R5a_2xlarge -> `String "r5a.2xlarge"
  | R5a_4xlarge -> `String "r5a.4xlarge"
  | R5a_8xlarge -> `String "r5a.8xlarge"
  | R5a_12xlarge -> `String "r5a.12xlarge"
  | R5a_16xlarge -> `String "r5a.16xlarge"
  | R5a_24xlarge -> `String "r5a.24xlarge"
  | R6g_medium -> `String "r6g.medium"
  | R6g_large -> `String "r6g.large"
  | R6g_xlarge -> `String "r6g.xlarge"
  | R6g_2xlarge -> `String "r6g.2xlarge"
  | R6g_4xlarge -> `String "r6g.4xlarge"
  | R6g_8xlarge -> `String "r6g.8xlarge"
  | R6g_12xlarge -> `String "r6g.12xlarge"
  | R6g_16xlarge -> `String "r6g.16xlarge"
  | M4_large -> `String "m4.large"
  | M4_xlarge -> `String "m4.xlarge"
  | M4_2xlarge -> `String "m4.2xlarge"
  | M4_4xlarge -> `String "m4.4xlarge"
  | M4_10xlarge -> `String "m4.10xlarge"
  | M5_large -> `String "m5.large"
  | M5_xlarge -> `String "m5.xlarge"
  | M5_2xlarge -> `String "m5.2xlarge"
  | M5_4xlarge -> `String "m5.4xlarge"
  | M5_8xlarge -> `String "m5.8xlarge"
  | M5_12xlarge -> `String "m5.12xlarge"
  | M5_16xlarge -> `String "m5.16xlarge"
  | M5_24xlarge -> `String "m5.24xlarge"
  | M5a_large -> `String "m5a.large"
  | M5a_xlarge -> `String "m5a.xlarge"
  | M5a_2xlarge -> `String "m5a.2xlarge"
  | M5a_4xlarge -> `String "m5a.4xlarge"
  | M5a_8xlarge -> `String "m5a.8xlarge"
  | M5a_12xlarge -> `String "m5a.12xlarge"
  | M5a_16xlarge -> `String "m5a.16xlarge"
  | M5a_24xlarge -> `String "m5a.24xlarge"
  | M6g_medium -> `String "m6g.medium"
  | M6g_large -> `String "m6g.large"
  | M6g_xlarge -> `String "m6g.xlarge"
  | M6g_2xlarge -> `String "m6g.2xlarge"
  | M6g_4xlarge -> `String "m6g.4xlarge"
  | M6g_8xlarge -> `String "m6g.8xlarge"
  | M6g_12xlarge -> `String "m6g.12xlarge"
  | M6g_16xlarge -> `String "m6g.16xlarge"

let instance_definition_to_yojson (x : instance_definition) =
  assoc_to_yojson
    [
      ("InstanceType", Some (game_server_group_instance_type_to_yojson x.instance_type));
      ("WeightedCapacity", option_to_yojson weighted_capacity_to_yojson x.weighted_capacity);
    ]

let instance_definitions_to_yojson tree = list_to_yojson instance_definition_to_yojson tree

let game_server_group_to_yojson (x : game_server_group) =
  assoc_to_yojson
    [
      ( "GameServerGroupName",
        option_to_yojson game_server_group_name_to_yojson x.game_server_group_name );
      ( "GameServerGroupArn",
        option_to_yojson game_server_group_arn_to_yojson x.game_server_group_arn );
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("InstanceDefinitions", option_to_yojson instance_definitions_to_yojson x.instance_definitions);
      ("BalancingStrategy", option_to_yojson balancing_strategy_to_yojson x.balancing_strategy);
      ( "GameServerProtectionPolicy",
        option_to_yojson game_server_protection_policy_to_yojson x.game_server_protection_policy );
      ( "AutoScalingGroupArn",
        option_to_yojson auto_scaling_group_arn_to_yojson x.auto_scaling_group_arn );
      ("Status", option_to_yojson game_server_group_status_to_yojson x.status);
      ("StatusReason", option_to_yojson non_zero_and_max_string_to_yojson x.status_reason);
      ("SuspendedActions", option_to_yojson game_server_group_actions_to_yojson x.suspended_actions);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
    ]

let create_game_server_group_output_to_yojson (x : create_game_server_group_output) =
  assoc_to_yojson
    [ ("GameServerGroup", option_to_yojson game_server_group_to_yojson x.game_server_group) ]

let vpc_subnet_to_yojson = string_to_yojson
let vpc_subnets_to_yojson tree = list_to_yojson vpc_subnet_to_yojson tree
let non_negative_double_to_yojson = double_to_yojson

let target_tracking_configuration_to_yojson (x : target_tracking_configuration) =
  assoc_to_yojson [ ("TargetValue", Some (non_negative_double_to_yojson x.target_value)) ]

let game_server_group_auto_scaling_policy_to_yojson (x : game_server_group_auto_scaling_policy) =
  assoc_to_yojson
    [
      ( "EstimatedInstanceWarmup",
        option_to_yojson positive_integer_to_yojson x.estimated_instance_warmup );
      ( "TargetTrackingConfiguration",
        Some (target_tracking_configuration_to_yojson x.target_tracking_configuration) );
    ]

let launch_template_version_to_yojson = string_to_yojson
let launch_template_name_to_yojson = string_to_yojson
let launch_template_id_to_yojson = string_to_yojson

let launch_template_specification_to_yojson (x : launch_template_specification) =
  assoc_to_yojson
    [
      ("LaunchTemplateId", option_to_yojson launch_template_id_to_yojson x.launch_template_id);
      ("LaunchTemplateName", option_to_yojson launch_template_name_to_yojson x.launch_template_name);
      ("Version", option_to_yojson launch_template_version_to_yojson x.version);
    ]

let create_game_server_group_input_to_yojson (x : create_game_server_group_input) =
  assoc_to_yojson
    [
      ("GameServerGroupName", Some (game_server_group_name_to_yojson x.game_server_group_name));
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("MinSize", Some (whole_number_to_yojson x.min_size));
      ("MaxSize", Some (positive_integer_to_yojson x.max_size));
      ("LaunchTemplate", Some (launch_template_specification_to_yojson x.launch_template));
      ("InstanceDefinitions", Some (instance_definitions_to_yojson x.instance_definitions));
      ( "AutoScalingPolicy",
        option_to_yojson game_server_group_auto_scaling_policy_to_yojson x.auto_scaling_policy );
      ("BalancingStrategy", option_to_yojson balancing_strategy_to_yojson x.balancing_strategy);
      ( "GameServerProtectionPolicy",
        option_to_yojson game_server_protection_policy_to_yojson x.game_server_protection_policy );
      ("VpcSubnets", option_to_yojson vpc_subnets_to_yojson x.vpc_subnets);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let terminal_routing_strategy_exception_to_yojson (x : terminal_routing_strategy_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let idempotent_parameter_mismatch_exception_to_yojson (x : idempotent_parameter_mismatch_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let fleet_capacity_exceeded_exception_to_yojson (x : fleet_capacity_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let matchmaker_data_to_yojson = string_to_yojson
let large_game_session_data_to_yojson = string_to_yojson

let player_session_creation_policy_to_yojson (x : player_session_creation_policy) =
  match x with ACCEPT_ALL -> `String "ACCEPT_ALL" | DENY_ALL -> `String "DENY_ALL"

let game_property_value_to_yojson = string_to_yojson
let game_property_key_to_yojson = string_to_yojson

let game_property_to_yojson (x : game_property) =
  assoc_to_yojson
    [
      ("Key", Some (game_property_key_to_yojson x.key));
      ("Value", Some (game_property_value_to_yojson x.value));
    ]

let game_property_list_to_yojson tree = list_to_yojson game_property_to_yojson tree

let game_session_status_reason_to_yojson (x : game_session_status_reason) =
  match x with
  | INTERRUPTED -> `String "INTERRUPTED"
  | TRIGGERED_ON_PROCESS_TERMINATE -> `String "TRIGGERED_ON_PROCESS_TERMINATE"
  | FORCE_TERMINATED -> `String "FORCE_TERMINATED"

let game_session_status_to_yojson (x : game_session_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | ACTIVATING -> `String "ACTIVATING"
  | TERMINATED -> `String "TERMINATED"
  | TERMINATING -> `String "TERMINATING"
  | ERROR -> `String "ERROR"

let game_session_to_yojson (x : game_session) =
  assoc_to_yojson
    [
      ("GameSessionId", option_to_yojson non_zero_and_max_string_to_yojson x.game_session_id);
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("TerminationTime", option_to_yojson timestamp_to_yojson x.termination_time);
      ( "CurrentPlayerSessionCount",
        option_to_yojson whole_number_to_yojson x.current_player_session_count );
      ( "MaximumPlayerSessionCount",
        option_to_yojson whole_number_to_yojson x.maximum_player_session_count );
      ("Status", option_to_yojson game_session_status_to_yojson x.status);
      ("StatusReason", option_to_yojson game_session_status_reason_to_yojson x.status_reason);
      ("GameProperties", option_to_yojson game_property_list_to_yojson x.game_properties);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("DnsName", option_to_yojson dns_name_to_yojson x.dns_name);
      ("Port", option_to_yojson port_number_to_yojson x.port);
      ( "PlayerSessionCreationPolicy",
        option_to_yojson player_session_creation_policy_to_yojson x.player_session_creation_policy
      );
      ("CreatorId", option_to_yojson non_zero_and_max_string_to_yojson x.creator_id);
      ("GameSessionData", option_to_yojson large_game_session_data_to_yojson x.game_session_data);
      ("MatchmakerData", option_to_yojson matchmaker_data_to_yojson x.matchmaker_data);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("ComputeName", option_to_yojson compute_name_to_yojson x.compute_name);
      ( "PlayerGatewayStatus",
        option_to_yojson player_gateway_status_to_yojson x.player_gateway_status );
    ]

let create_game_session_output_to_yojson (x : create_game_session_output) =
  assoc_to_yojson [ ("GameSession", option_to_yojson game_session_to_yojson x.game_session) ]

let id_string_model_to_yojson = string_to_yojson

let create_game_session_input_to_yojson (x : create_game_session_input) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
      ("AliasId", option_to_yojson alias_id_or_arn_to_yojson x.alias_id);
      ("MaximumPlayerSessionCount", Some (whole_number_to_yojson x.maximum_player_session_count));
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("GameProperties", option_to_yojson game_property_list_to_yojson x.game_properties);
      ("CreatorId", option_to_yojson non_zero_and_max_string_to_yojson x.creator_id);
      ("GameSessionId", option_to_yojson id_string_model_to_yojson x.game_session_id);
      ("IdempotencyToken", option_to_yojson id_string_model_to_yojson x.idempotency_token);
      ("GameSessionData", option_to_yojson large_game_session_data_to_yojson x.game_session_data);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
    ]

let queue_sns_arn_string_model_to_yojson = string_to_yojson
let queue_custom_event_data_to_yojson = string_to_yojson
let location_list_to_yojson tree = list_to_yojson location_string_model_to_yojson tree

let priority_type_to_yojson (x : priority_type) =
  match x with
  | LATENCY -> `String "LATENCY"
  | COST -> `String "COST"
  | DESTINATION -> `String "DESTINATION"
  | LOCATION -> `String "LOCATION"

let priority_type_list_to_yojson tree = list_to_yojson priority_type_to_yojson tree

let priority_configuration_to_yojson (x : priority_configuration) =
  assoc_to_yojson
    [
      ("PriorityOrder", option_to_yojson priority_type_list_to_yojson x.priority_order);
      ("LocationOrder", option_to_yojson location_list_to_yojson x.location_order);
    ]

let filter_configuration_to_yojson (x : filter_configuration) =
  assoc_to_yojson
    [ ("AllowedLocations", option_to_yojson location_list_to_yojson x.allowed_locations) ]

let game_session_queue_destination_to_yojson (x : game_session_queue_destination) =
  assoc_to_yojson
    [ ("DestinationArn", option_to_yojson arn_string_model_to_yojson x.destination_arn) ]

let game_session_queue_destination_list_to_yojson tree =
  list_to_yojson game_session_queue_destination_to_yojson tree

let player_latency_policy_to_yojson (x : player_latency_policy) =
  assoc_to_yojson
    [
      ( "MaximumIndividualPlayerLatencyMilliseconds",
        option_to_yojson whole_number_to_yojson x.maximum_individual_player_latency_milliseconds );
      ("PolicyDurationSeconds", option_to_yojson whole_number_to_yojson x.policy_duration_seconds);
    ]

let player_latency_policy_list_to_yojson tree = list_to_yojson player_latency_policy_to_yojson tree
let game_session_queue_arn_to_yojson = string_to_yojson
let game_session_queue_name_to_yojson = string_to_yojson

let game_session_queue_to_yojson (x : game_session_queue) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson game_session_queue_name_to_yojson x.name);
      ( "GameSessionQueueArn",
        option_to_yojson game_session_queue_arn_to_yojson x.game_session_queue_arn );
      ("TimeoutInSeconds", option_to_yojson whole_number_to_yojson x.timeout_in_seconds);
      ( "PlayerLatencyPolicies",
        option_to_yojson player_latency_policy_list_to_yojson x.player_latency_policies );
      ("Destinations", option_to_yojson game_session_queue_destination_list_to_yojson x.destinations);
      ("FilterConfiguration", option_to_yojson filter_configuration_to_yojson x.filter_configuration);
      ( "PriorityConfiguration",
        option_to_yojson priority_configuration_to_yojson x.priority_configuration );
      ("CustomEventData", option_to_yojson queue_custom_event_data_to_yojson x.custom_event_data);
      ( "NotificationTarget",
        option_to_yojson queue_sns_arn_string_model_to_yojson x.notification_target );
    ]

let create_game_session_queue_output_to_yojson (x : create_game_session_queue_output) =
  assoc_to_yojson
    [ ("GameSessionQueue", option_to_yojson game_session_queue_to_yojson x.game_session_queue) ]

let create_game_session_queue_input_to_yojson (x : create_game_session_queue_input) =
  assoc_to_yojson
    [
      ("Name", Some (game_session_queue_name_to_yojson x.name));
      ("TimeoutInSeconds", option_to_yojson whole_number_to_yojson x.timeout_in_seconds);
      ( "PlayerLatencyPolicies",
        option_to_yojson player_latency_policy_list_to_yojson x.player_latency_policies );
      ("Destinations", option_to_yojson game_session_queue_destination_list_to_yojson x.destinations);
      ("FilterConfiguration", option_to_yojson filter_configuration_to_yojson x.filter_configuration);
      ( "PriorityConfiguration",
        option_to_yojson priority_configuration_to_yojson x.priority_configuration );
      ("CustomEventData", option_to_yojson queue_custom_event_data_to_yojson x.custom_event_data);
      ( "NotificationTarget",
        option_to_yojson queue_sns_arn_string_model_to_yojson x.notification_target );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let udp_endpoint_to_yojson (x : udp_endpoint) =
  assoc_to_yojson
    [
      ("Domain", option_to_yojson non_zero_and_max_string_to_yojson x.domain);
      ("Port", option_to_yojson positive_integer_to_yojson x.port);
    ]

let ping_beacon_to_yojson (x : ping_beacon) =
  assoc_to_yojson [ ("UDPEndpoint", option_to_yojson udp_endpoint_to_yojson x.udp_endpoint) ]

let location_arn_model_to_yojson = string_to_yojson

let location_model_to_yojson (x : location_model) =
  assoc_to_yojson
    [
      ("LocationName", option_to_yojson location_string_model_to_yojson x.location_name);
      ("LocationArn", option_to_yojson location_arn_model_to_yojson x.location_arn);
      ("PingBeacon", option_to_yojson ping_beacon_to_yojson x.ping_beacon);
    ]

let create_location_output_to_yojson (x : create_location_output) =
  assoc_to_yojson [ ("Location", option_to_yojson location_model_to_yojson x.location) ]

let custom_input_location_string_model_to_yojson = string_to_yojson

let create_location_input_to_yojson (x : create_location_input) =
  assoc_to_yojson
    [
      ("LocationName", Some (custom_input_location_string_model_to_yojson x.location_name));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let flex_match_mode_to_yojson (x : flex_match_mode) =
  match x with STANDALONE -> `String "STANDALONE" | WITH_QUEUE -> `String "WITH_QUEUE"

let game_session_data_to_yojson = string_to_yojson
let custom_event_data_to_yojson = string_to_yojson
let sns_arn_string_model_to_yojson = string_to_yojson
let matchmaking_rule_set_arn_to_yojson = string_to_yojson
let matchmaking_acceptance_timeout_integer_to_yojson = int_to_yojson
let matchmaking_request_timeout_integer_to_yojson = int_to_yojson
let queue_arns_list_to_yojson tree = list_to_yojson arn_string_model_to_yojson tree
let matchmaking_configuration_arn_to_yojson = string_to_yojson

let matchmaking_configuration_to_yojson (x : matchmaking_configuration) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson matchmaking_id_string_model_to_yojson x.name);
      ( "ConfigurationArn",
        option_to_yojson matchmaking_configuration_arn_to_yojson x.configuration_arn );
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("GameSessionQueueArns", option_to_yojson queue_arns_list_to_yojson x.game_session_queue_arns);
      ( "RequestTimeoutSeconds",
        option_to_yojson matchmaking_request_timeout_integer_to_yojson x.request_timeout_seconds );
      ( "AcceptanceTimeoutSeconds",
        option_to_yojson matchmaking_acceptance_timeout_integer_to_yojson
          x.acceptance_timeout_seconds );
      ("AcceptanceRequired", option_to_yojson boolean_model_to_yojson x.acceptance_required);
      ("RuleSetName", option_to_yojson matchmaking_id_string_model_to_yojson x.rule_set_name);
      ("RuleSetArn", option_to_yojson matchmaking_rule_set_arn_to_yojson x.rule_set_arn);
      ("NotificationTarget", option_to_yojson sns_arn_string_model_to_yojson x.notification_target);
      ("AdditionalPlayerCount", option_to_yojson whole_number_to_yojson x.additional_player_count);
      ("CustomEventData", option_to_yojson custom_event_data_to_yojson x.custom_event_data);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("GameProperties", option_to_yojson game_property_list_to_yojson x.game_properties);
      ("GameSessionData", option_to_yojson game_session_data_to_yojson x.game_session_data);
      ("BackfillMode", option_to_yojson backfill_mode_to_yojson x.backfill_mode);
      ("FlexMatchMode", option_to_yojson flex_match_mode_to_yojson x.flex_match_mode);
    ]

let create_matchmaking_configuration_output_to_yojson (x : create_matchmaking_configuration_output)
    =
  assoc_to_yojson
    [ ("Configuration", option_to_yojson matchmaking_configuration_to_yojson x.configuration) ]

let matchmaking_rule_set_name_to_yojson = string_to_yojson

let create_matchmaking_configuration_input_to_yojson (x : create_matchmaking_configuration_input) =
  assoc_to_yojson
    [
      ("Name", Some (matchmaking_id_string_model_to_yojson x.name));
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("GameSessionQueueArns", option_to_yojson queue_arns_list_to_yojson x.game_session_queue_arns);
      ( "RequestTimeoutSeconds",
        Some (matchmaking_request_timeout_integer_to_yojson x.request_timeout_seconds) );
      ( "AcceptanceTimeoutSeconds",
        option_to_yojson matchmaking_acceptance_timeout_integer_to_yojson
          x.acceptance_timeout_seconds );
      ("AcceptanceRequired", Some (boolean_model_to_yojson x.acceptance_required));
      ("RuleSetName", Some (matchmaking_rule_set_name_to_yojson x.rule_set_name));
      ("NotificationTarget", option_to_yojson sns_arn_string_model_to_yojson x.notification_target);
      ("AdditionalPlayerCount", option_to_yojson whole_number_to_yojson x.additional_player_count);
      ("CustomEventData", option_to_yojson custom_event_data_to_yojson x.custom_event_data);
      ("GameProperties", option_to_yojson game_property_list_to_yojson x.game_properties);
      ("GameSessionData", option_to_yojson game_session_data_to_yojson x.game_session_data);
      ("BackfillMode", option_to_yojson backfill_mode_to_yojson x.backfill_mode);
      ("FlexMatchMode", option_to_yojson flex_match_mode_to_yojson x.flex_match_mode);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let rule_set_body_to_yojson = string_to_yojson

let matchmaking_rule_set_to_yojson (x : matchmaking_rule_set) =
  assoc_to_yojson
    [
      ("RuleSetName", option_to_yojson matchmaking_id_string_model_to_yojson x.rule_set_name);
      ("RuleSetArn", option_to_yojson matchmaking_rule_set_arn_to_yojson x.rule_set_arn);
      ("RuleSetBody", Some (rule_set_body_to_yojson x.rule_set_body));
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
    ]

let create_matchmaking_rule_set_output_to_yojson (x : create_matchmaking_rule_set_output) =
  assoc_to_yojson [ ("RuleSet", Some (matchmaking_rule_set_to_yojson x.rule_set)) ]

let create_matchmaking_rule_set_input_to_yojson (x : create_matchmaking_rule_set_input) =
  assoc_to_yojson
    [
      ("Name", Some (matchmaking_id_string_model_to_yojson x.name));
      ("RuleSetBody", Some (rule_set_body_to_yojson x.rule_set_body));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let invalid_game_session_status_exception_to_yojson (x : invalid_game_session_status_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let game_session_full_exception_to_yojson (x : game_session_full_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson non_empty_string_to_yojson x.message) ]

let player_data_to_yojson = string_to_yojson

let player_session_status_to_yojson (x : player_session_status) =
  match x with
  | RESERVED -> `String "RESERVED"
  | ACTIVE -> `String "ACTIVE"
  | COMPLETED -> `String "COMPLETED"
  | TIMEDOUT -> `String "TIMEDOUT"

let player_session_id_to_yojson = string_to_yojson

let player_session_to_yojson (x : player_session) =
  assoc_to_yojson
    [
      ("PlayerSessionId", option_to_yojson player_session_id_to_yojson x.player_session_id);
      ("PlayerId", option_to_yojson player_id_to_yojson x.player_id);
      ("GameSessionId", option_to_yojson non_zero_and_max_string_to_yojson x.game_session_id);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("TerminationTime", option_to_yojson timestamp_to_yojson x.termination_time);
      ("Status", option_to_yojson player_session_status_to_yojson x.status);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("DnsName", option_to_yojson dns_name_to_yojson x.dns_name);
      ("Port", option_to_yojson port_number_to_yojson x.port);
      ("PlayerData", option_to_yojson player_data_to_yojson x.player_data);
    ]

let create_player_session_output_to_yojson (x : create_player_session_output) =
  assoc_to_yojson [ ("PlayerSession", option_to_yojson player_session_to_yojson x.player_session) ]

let create_player_session_input_to_yojson (x : create_player_session_input) =
  assoc_to_yojson
    [
      ("GameSessionId", Some (arn_string_model_to_yojson x.game_session_id));
      ("PlayerId", Some (player_id_to_yojson x.player_id));
      ("PlayerData", option_to_yojson player_data_to_yojson x.player_data);
    ]

let player_session_list_to_yojson tree = list_to_yojson player_session_to_yojson tree

let create_player_sessions_output_to_yojson (x : create_player_sessions_output) =
  assoc_to_yojson
    [ ("PlayerSessions", option_to_yojson player_session_list_to_yojson x.player_sessions) ]

let player_data_map_to_yojson tree =
  map_to_yojson non_zero_and_max_string_to_yojson player_data_to_yojson tree

let player_id_list_to_yojson tree = list_to_yojson player_id_to_yojson tree

let create_player_sessions_input_to_yojson (x : create_player_sessions_input) =
  assoc_to_yojson
    [
      ("GameSessionId", Some (arn_string_model_to_yojson x.game_session_id));
      ("PlayerIds", Some (player_id_list_to_yojson x.player_ids));
      ("PlayerDataMap", option_to_yojson player_data_map_to_yojson x.player_data_map);
    ]

let node_js_version_to_yojson = string_to_yojson

let script_to_yojson (x : script) =
  assoc_to_yojson
    [
      ("ScriptId", option_to_yojson script_id_to_yojson x.script_id);
      ("ScriptArn", option_to_yojson script_arn_to_yojson x.script_arn);
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("Version", option_to_yojson non_zero_and_max_string_to_yojson x.version);
      ("SizeOnDisk", option_to_yojson whole_number_long_to_yojson x.size_on_disk);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("StorageLocation", option_to_yojson s3_location_to_yojson x.storage_location);
      ("NodeJsVersion", option_to_yojson node_js_version_to_yojson x.node_js_version);
    ]

let create_script_output_to_yojson (x : create_script_output) =
  assoc_to_yojson [ ("Script", option_to_yojson script_to_yojson x.script) ]

let zip_blob_to_yojson = blob_to_yojson

let create_script_input_to_yojson (x : create_script_input) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("Version", option_to_yojson non_zero_and_max_string_to_yojson x.version);
      ("StorageLocation", option_to_yojson s3_location_to_yojson x.storage_location);
      ("ZipFile", option_to_yojson zip_blob_to_yojson x.zip_file);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("NodeJsVersion", option_to_yojson node_js_version_to_yojson x.node_js_version);
    ]

let vpc_peering_authorization_to_yojson (x : vpc_peering_authorization) =
  assoc_to_yojson
    [
      ( "GameLiftAwsAccountId",
        option_to_yojson non_zero_and_max_string_to_yojson x.game_lift_aws_account_id );
      ( "PeerVpcAwsAccountId",
        option_to_yojson non_zero_and_max_string_to_yojson x.peer_vpc_aws_account_id );
      ("PeerVpcId", option_to_yojson non_zero_and_max_string_to_yojson x.peer_vpc_id);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("ExpirationTime", option_to_yojson timestamp_to_yojson x.expiration_time);
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
      ("GameLiftAwsAccountId", Some (non_zero_and_max_string_to_yojson x.game_lift_aws_account_id));
      ("PeerVpcId", Some (non_zero_and_max_string_to_yojson x.peer_vpc_id));
    ]

let create_vpc_peering_connection_output_to_yojson = unit_to_yojson

let create_vpc_peering_connection_input_to_yojson (x : create_vpc_peering_connection_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_to_yojson x.fleet_id));
      ("PeerVpcAwsAccountId", Some (non_zero_and_max_string_to_yojson x.peer_vpc_aws_account_id));
      ("PeerVpcId", Some (non_zero_and_max_string_to_yojson x.peer_vpc_id));
    ]

let custom_location_name_or_arn_model_to_yojson = string_to_yojson

let delete_alias_input_to_yojson (x : delete_alias_input) =
  assoc_to_yojson [ ("AliasId", Some (alias_id_or_arn_to_yojson x.alias_id)) ]

let delete_build_input_to_yojson (x : delete_build_input) =
  assoc_to_yojson [ ("BuildId", Some (build_id_or_arn_to_yojson x.build_id)) ]

let delete_container_fleet_output_to_yojson = unit_to_yojson

let delete_container_fleet_input_to_yojson (x : delete_container_fleet_input) =
  assoc_to_yojson [ ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id)) ]

let delete_container_group_definition_output_to_yojson = unit_to_yojson

let delete_container_group_definition_input_to_yojson (x : delete_container_group_definition_input)
    =
  assoc_to_yojson
    [
      ("Name", Some (container_group_definition_name_or_arn_to_yojson x.name));
      ("VersionNumber", option_to_yojson positive_integer_to_yojson x.version_number);
      ("VersionCountToRetain", option_to_yojson whole_number_to_yojson x.version_count_to_retain);
    ]

let delete_fleet_input_to_yojson (x : delete_fleet_input) =
  assoc_to_yojson [ ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id)) ]

let delete_fleet_locations_output_to_yojson (x : delete_fleet_locations_output) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("LocationStates", option_to_yojson location_state_list_to_yojson x.location_states);
    ]

let delete_fleet_locations_input_to_yojson (x : delete_fleet_locations_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("Locations", Some (location_list_to_yojson x.locations));
    ]

let delete_game_server_group_output_to_yojson (x : delete_game_server_group_output) =
  assoc_to_yojson
    [ ("GameServerGroup", option_to_yojson game_server_group_to_yojson x.game_server_group) ]

let game_server_group_delete_option_to_yojson (x : game_server_group_delete_option) =
  match x with
  | SAFE_DELETE -> `String "SAFE_DELETE"
  | FORCE_DELETE -> `String "FORCE_DELETE"
  | RETAIN -> `String "RETAIN"

let delete_game_server_group_input_to_yojson (x : delete_game_server_group_input) =
  assoc_to_yojson
    [
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
      ("DeleteOption", option_to_yojson game_server_group_delete_option_to_yojson x.delete_option);
    ]

let delete_game_session_queue_output_to_yojson = unit_to_yojson
let game_session_queue_name_or_arn_to_yojson = string_to_yojson

let delete_game_session_queue_input_to_yojson (x : delete_game_session_queue_input) =
  assoc_to_yojson [ ("Name", Some (game_session_queue_name_or_arn_to_yojson x.name)) ]

let delete_location_output_to_yojson = unit_to_yojson

let delete_location_input_to_yojson (x : delete_location_input) =
  assoc_to_yojson
    [ ("LocationName", Some (custom_location_name_or_arn_model_to_yojson x.location_name)) ]

let delete_matchmaking_configuration_output_to_yojson = unit_to_yojson
let matchmaking_configuration_name_to_yojson = string_to_yojson

let delete_matchmaking_configuration_input_to_yojson (x : delete_matchmaking_configuration_input) =
  assoc_to_yojson [ ("Name", Some (matchmaking_configuration_name_to_yojson x.name)) ]

let delete_matchmaking_rule_set_output_to_yojson = unit_to_yojson

let delete_matchmaking_rule_set_input_to_yojson (x : delete_matchmaking_rule_set_input) =
  assoc_to_yojson [ ("Name", Some (matchmaking_rule_set_name_to_yojson x.name)) ]

let delete_scaling_policy_input_to_yojson (x : delete_scaling_policy_input) =
  assoc_to_yojson
    [
      ("Name", Some (non_zero_and_max_string_to_yojson x.name));
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
    ]

let delete_script_input_to_yojson (x : delete_script_input) =
  assoc_to_yojson [ ("ScriptId", Some (script_id_or_arn_to_yojson x.script_id)) ]

let delete_vpc_peering_authorization_output_to_yojson = unit_to_yojson

let delete_vpc_peering_authorization_input_to_yojson (x : delete_vpc_peering_authorization_input) =
  assoc_to_yojson
    [
      ("GameLiftAwsAccountId", Some (non_zero_and_max_string_to_yojson x.game_lift_aws_account_id));
      ("PeerVpcId", Some (non_zero_and_max_string_to_yojson x.peer_vpc_id));
    ]

let delete_vpc_peering_connection_output_to_yojson = unit_to_yojson

let delete_vpc_peering_connection_input_to_yojson (x : delete_vpc_peering_connection_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_to_yojson x.fleet_id));
      ( "VpcPeeringConnectionId",
        Some (non_zero_and_max_string_to_yojson x.vpc_peering_connection_id) );
    ]

let deployment_impairment_strategy_to_yojson (x : deployment_impairment_strategy) =
  match x with MAINTAIN -> `String "MAINTAIN" | ROLLBACK -> `String "ROLLBACK"

let minimum_healthy_percentage_to_yojson = int_to_yojson

let deployment_protection_strategy_to_yojson (x : deployment_protection_strategy) =
  match x with
  | WITH_PROTECTION -> `String "WITH_PROTECTION"
  | IGNORE_PROTECTION -> `String "IGNORE_PROTECTION"

let deployment_configuration_to_yojson (x : deployment_configuration) =
  assoc_to_yojson
    [
      ( "ProtectionStrategy",
        option_to_yojson deployment_protection_strategy_to_yojson x.protection_strategy );
      ( "MinimumHealthyPercentage",
        option_to_yojson minimum_healthy_percentage_to_yojson x.minimum_healthy_percentage );
      ( "ImpairmentStrategy",
        option_to_yojson deployment_impairment_strategy_to_yojson x.impairment_strategy );
    ]

let deployment_status_to_yojson (x : deployment_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | IMPAIRED -> `String "IMPAIRED"
  | COMPLETE -> `String "COMPLETE"
  | ROLLBACK_IN_PROGRESS -> `String "ROLLBACK_IN_PROGRESS"
  | ROLLBACK_COMPLETE -> `String "ROLLBACK_COMPLETE"
  | CANCELLED -> `String "CANCELLED"
  | PENDING -> `String "PENDING"

let deregister_compute_output_to_yojson = unit_to_yojson

let deregister_compute_input_to_yojson (x : deregister_compute_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("ComputeName", Some (compute_name_or_arn_to_yojson x.compute_name));
    ]

let deregister_game_server_input_to_yojson (x : deregister_game_server_input) =
  assoc_to_yojson
    [
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
      ("GameServerId", Some (game_server_id_to_yojson x.game_server_id));
    ]

let describe_alias_output_to_yojson (x : describe_alias_output) =
  assoc_to_yojson [ ("Alias", option_to_yojson alias_to_yojson x.alias) ]

let describe_alias_input_to_yojson (x : describe_alias_input) =
  assoc_to_yojson [ ("AliasId", Some (alias_id_or_arn_to_yojson x.alias_id)) ]

let describe_build_output_to_yojson (x : describe_build_output) =
  assoc_to_yojson [ ("Build", option_to_yojson build_to_yojson x.build) ]

let describe_build_input_to_yojson (x : describe_build_input) =
  assoc_to_yojson [ ("BuildId", Some (build_id_or_arn_to_yojson x.build_id)) ]

let describe_compute_output_to_yojson (x : describe_compute_output) =
  assoc_to_yojson [ ("Compute", option_to_yojson compute_to_yojson x.compute) ]

let describe_compute_input_to_yojson (x : describe_compute_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("ComputeName", Some (compute_name_or_arn_to_yojson x.compute_name));
    ]

let describe_container_fleet_output_to_yojson (x : describe_container_fleet_output) =
  assoc_to_yojson
    [ ("ContainerFleet", option_to_yojson container_fleet_to_yojson x.container_fleet) ]

let describe_container_fleet_input_to_yojson (x : describe_container_fleet_input) =
  assoc_to_yojson [ ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id)) ]

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
      ("Name", Some (container_group_definition_name_or_arn_to_yojson x.name));
      ("VersionNumber", option_to_yojson positive_integer_to_yojson x.version_number);
    ]

let describe_container_group_port_mappings_output_to_yojson
    (x : describe_container_group_port_mappings_output) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ( "ContainerGroupDefinitionArn",
        option_to_yojson container_group_definition_arn_to_yojson x.container_group_definition_arn
      );
      ("ContainerGroupType", option_to_yojson container_group_type_to_yojson x.container_group_type);
      ("ComputeName", option_to_yojson compute_name_to_yojson x.compute_name);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ( "ContainerGroupPortMappings",
        option_to_yojson container_group_port_mapping_list_to_yojson x.container_group_port_mappings
      );
    ]

let describe_container_group_port_mappings_input_to_yojson
    (x : describe_container_group_port_mappings_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("ContainerGroupType", Some (container_group_type_to_yojson x.container_group_type));
      ("ComputeName", option_to_yojson compute_name_or_arn_to_yojson x.compute_name);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("ContainerName", option_to_yojson non_zero_and128_max_ascii_string_to_yojson x.container_name);
    ]

let ec2_instance_limit_to_yojson (x : ec2_instance_limit) =
  assoc_to_yojson
    [
      ("EC2InstanceType", option_to_yojson ec2_instance_type_to_yojson x.ec2_instance_type);
      ("CurrentInstances", option_to_yojson whole_number_to_yojson x.current_instances);
      ("InstanceLimit", option_to_yojson whole_number_to_yojson x.instance_limit);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
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
      ("EC2InstanceType", option_to_yojson ec2_instance_type_to_yojson x.ec2_instance_type);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
    ]

let fleet_attributes_list_to_yojson tree = list_to_yojson fleet_attributes_to_yojson tree

let describe_fleet_attributes_output_to_yojson (x : describe_fleet_attributes_output) =
  assoc_to_yojson
    [
      ("FleetAttributes", option_to_yojson fleet_attributes_list_to_yojson x.fleet_attributes);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let fleet_id_or_arn_list_to_yojson tree = list_to_yojson fleet_id_or_arn_to_yojson tree

let describe_fleet_attributes_input_to_yojson (x : describe_fleet_attributes_input) =
  assoc_to_yojson
    [
      ("FleetIds", option_to_yojson fleet_id_or_arn_list_to_yojson x.fleet_ids);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let scale_in_after_inactivity_minutes_to_yojson = int_to_yojson

let zero_capacity_strategy_to_yojson (x : zero_capacity_strategy) =
  match x with
  | MANUAL -> `String "MANUAL"
  | SCALE_TO_AND_FROM_ZERO -> `String "SCALE_TO_AND_FROM_ZERO"

let managed_capacity_configuration_to_yojson (x : managed_capacity_configuration) =
  assoc_to_yojson
    [
      ( "ZeroCapacityStrategy",
        option_to_yojson zero_capacity_strategy_to_yojson x.zero_capacity_strategy );
      ( "ScaleInAfterInactivityMinutes",
        option_to_yojson scale_in_after_inactivity_minutes_to_yojson
          x.scale_in_after_inactivity_minutes );
    ]

let game_server_container_group_counts_to_yojson (x : game_server_container_group_counts) =
  assoc_to_yojson
    [
      ("PENDING", option_to_yojson whole_number_to_yojson x.pendin_g);
      ("ACTIVE", option_to_yojson whole_number_to_yojson x.activ_e);
      ("IDLE", option_to_yojson whole_number_to_yojson x.idl_e);
      ("TERMINATING", option_to_yojson whole_number_to_yojson x.terminatin_g);
    ]

let ec2_instance_counts_to_yojson (x : ec2_instance_counts) =
  assoc_to_yojson
    [
      ("DESIRED", option_to_yojson whole_number_to_yojson x.desire_d);
      ("MINIMUM", option_to_yojson whole_number_to_yojson x.minimu_m);
      ("MAXIMUM", option_to_yojson whole_number_to_yojson x.maximu_m);
      ("PENDING", option_to_yojson whole_number_to_yojson x.pendin_g);
      ("ACTIVE", option_to_yojson whole_number_to_yojson x.activ_e);
      ("IDLE", option_to_yojson whole_number_to_yojson x.idl_e);
      ("TERMINATING", option_to_yojson whole_number_to_yojson x.terminatin_g);
    ]

let fleet_capacity_to_yojson (x : fleet_capacity) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("InstanceType", option_to_yojson ec2_instance_type_to_yojson x.instance_type);
      ("InstanceCounts", option_to_yojson ec2_instance_counts_to_yojson x.instance_counts);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ( "GameServerContainerGroupCounts",
        option_to_yojson game_server_container_group_counts_to_yojson
          x.game_server_container_group_counts );
      ( "ManagedCapacityConfiguration",
        option_to_yojson managed_capacity_configuration_to_yojson x.managed_capacity_configuration
      );
    ]

let fleet_capacity_list_to_yojson tree = list_to_yojson fleet_capacity_to_yojson tree

let describe_fleet_capacity_output_to_yojson (x : describe_fleet_capacity_output) =
  assoc_to_yojson
    [
      ("FleetCapacity", option_to_yojson fleet_capacity_list_to_yojson x.fleet_capacity);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let describe_fleet_capacity_input_to_yojson (x : describe_fleet_capacity_input) =
  assoc_to_yojson
    [
      ("FleetIds", option_to_yojson fleet_id_or_arn_list_to_yojson x.fleet_ids);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let locational_deployment_to_yojson (x : locational_deployment) =
  assoc_to_yojson
    [ ("DeploymentStatus", option_to_yojson deployment_status_to_yojson x.deployment_status) ]

let locational_deployments_to_yojson tree =
  map_to_yojson non_zero_and128_max_ascii_string_to_yojson locational_deployment_to_yojson tree

let fleet_binary_arn_to_yojson = string_to_yojson

let fleet_deployment_to_yojson (x : fleet_deployment) =
  assoc_to_yojson
    [
      ("DeploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("GameServerBinaryArn", option_to_yojson fleet_binary_arn_to_yojson x.game_server_binary_arn);
      ( "RollbackGameServerBinaryArn",
        option_to_yojson fleet_binary_arn_to_yojson x.rollback_game_server_binary_arn );
      ("PerInstanceBinaryArn", option_to_yojson fleet_binary_arn_to_yojson x.per_instance_binary_arn);
      ( "RollbackPerInstanceBinaryArn",
        option_to_yojson fleet_binary_arn_to_yojson x.rollback_per_instance_binary_arn );
      ("DeploymentStatus", option_to_yojson deployment_status_to_yojson x.deployment_status);
      ( "DeploymentConfiguration",
        option_to_yojson deployment_configuration_to_yojson x.deployment_configuration );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
    ]

let describe_fleet_deployment_output_to_yojson (x : describe_fleet_deployment_output) =
  assoc_to_yojson
    [
      ("FleetDeployment", option_to_yojson fleet_deployment_to_yojson x.fleet_deployment);
      ( "LocationalDeployments",
        option_to_yojson locational_deployments_to_yojson x.locational_deployments );
    ]

let describe_fleet_deployment_input_to_yojson (x : describe_fleet_deployment_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("DeploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
    ]

let event_count_to_yojson = long_to_yojson

let event_code_to_yojson (x : event_code) =
  match x with
  | GENERIC_EVENT -> `String "GENERIC_EVENT"
  | FLEET_CREATED -> `String "FLEET_CREATED"
  | FLEET_DELETED -> `String "FLEET_DELETED"
  | FLEET_SCALING_EVENT -> `String "FLEET_SCALING_EVENT"
  | FLEET_STATE_DOWNLOADING -> `String "FLEET_STATE_DOWNLOADING"
  | FLEET_STATE_VALIDATING -> `String "FLEET_STATE_VALIDATING"
  | FLEET_STATE_BUILDING -> `String "FLEET_STATE_BUILDING"
  | FLEET_STATE_ACTIVATING -> `String "FLEET_STATE_ACTIVATING"
  | FLEET_STATE_ACTIVE -> `String "FLEET_STATE_ACTIVE"
  | FLEET_STATE_ERROR -> `String "FLEET_STATE_ERROR"
  | FLEET_STATE_PENDING -> `String "FLEET_STATE_PENDING"
  | FLEET_STATE_CREATING -> `String "FLEET_STATE_CREATING"
  | FLEET_STATE_CREATED -> `String "FLEET_STATE_CREATED"
  | FLEET_STATE_UPDATING -> `String "FLEET_STATE_UPDATING"
  | FLEET_INITIALIZATION_FAILED -> `String "FLEET_INITIALIZATION_FAILED"
  | FLEET_BINARY_DOWNLOAD_FAILED -> `String "FLEET_BINARY_DOWNLOAD_FAILED"
  | FLEET_VALIDATION_LAUNCH_PATH_NOT_FOUND -> `String "FLEET_VALIDATION_LAUNCH_PATH_NOT_FOUND"
  | FLEET_VALIDATION_EXECUTABLE_RUNTIME_FAILURE ->
      `String "FLEET_VALIDATION_EXECUTABLE_RUNTIME_FAILURE"
  | FLEET_VALIDATION_TIMED_OUT -> `String "FLEET_VALIDATION_TIMED_OUT"
  | FLEET_ACTIVATION_FAILED -> `String "FLEET_ACTIVATION_FAILED"
  | FLEET_ACTIVATION_FAILED_NO_INSTANCES -> `String "FLEET_ACTIVATION_FAILED_NO_INSTANCES"
  | FLEET_NEW_GAME_SESSION_PROTECTION_POLICY_UPDATED ->
      `String "FLEET_NEW_GAME_SESSION_PROTECTION_POLICY_UPDATED"
  | SERVER_PROCESS_INVALID_PATH -> `String "SERVER_PROCESS_INVALID_PATH"
  | SERVER_PROCESS_SDK_INITIALIZATION_TIMEOUT -> `String "SERVER_PROCESS_SDK_INITIALIZATION_TIMEOUT"
  | SERVER_PROCESS_PROCESS_READY_TIMEOUT -> `String "SERVER_PROCESS_PROCESS_READY_TIMEOUT"
  | SERVER_PROCESS_CRASHED -> `String "SERVER_PROCESS_CRASHED"
  | SERVER_PROCESS_TERMINATED_UNHEALTHY -> `String "SERVER_PROCESS_TERMINATED_UNHEALTHY"
  | SERVER_PROCESS_FORCE_TERMINATED -> `String "SERVER_PROCESS_FORCE_TERMINATED"
  | SERVER_PROCESS_PROCESS_EXIT_TIMEOUT -> `String "SERVER_PROCESS_PROCESS_EXIT_TIMEOUT"
  | SERVER_PROCESS_SDK_INITIALIZATION_FAILED -> `String "SERVER_PROCESS_SDK_INITIALIZATION_FAILED"
  | SERVER_PROCESS_MISCONFIGURED_CONTAINER_PORT ->
      `String "SERVER_PROCESS_MISCONFIGURED_CONTAINER_PORT"
  | GAME_SESSION_ACTIVATION_TIMEOUT -> `String "GAME_SESSION_ACTIVATION_TIMEOUT"
  | FLEET_CREATION_EXTRACTING_BUILD -> `String "FLEET_CREATION_EXTRACTING_BUILD"
  | FLEET_CREATION_RUNNING_INSTALLER -> `String "FLEET_CREATION_RUNNING_INSTALLER"
  | FLEET_CREATION_VALIDATING_RUNTIME_CONFIG -> `String "FLEET_CREATION_VALIDATING_RUNTIME_CONFIG"
  | FLEET_VPC_PEERING_SUCCEEDED -> `String "FLEET_VPC_PEERING_SUCCEEDED"
  | FLEET_VPC_PEERING_FAILED -> `String "FLEET_VPC_PEERING_FAILED"
  | FLEET_VPC_PEERING_DELETED -> `String "FLEET_VPC_PEERING_DELETED"
  | INSTANCE_INTERRUPTED -> `String "INSTANCE_INTERRUPTED"
  | INSTANCE_RECYCLED -> `String "INSTANCE_RECYCLED"
  | INSTANCE_REPLACED_UNHEALTHY -> `String "INSTANCE_REPLACED_UNHEALTHY"
  | FLEET_CREATION_COMPLETED_INSTALLER -> `String "FLEET_CREATION_COMPLETED_INSTALLER"
  | FLEET_CREATION_FAILED_INSTALLER -> `String "FLEET_CREATION_FAILED_INSTALLER"
  | COMPUTE_LOG_UPLOAD_FAILED -> `String "COMPUTE_LOG_UPLOAD_FAILED"
  | GAME_SERVER_CONTAINER_GROUP_CRASHED -> `String "GAME_SERVER_CONTAINER_GROUP_CRASHED"
  | PER_INSTANCE_CONTAINER_GROUP_CRASHED -> `String "PER_INSTANCE_CONTAINER_GROUP_CRASHED"
  | GAME_SERVER_CONTAINER_GROUP_REPLACED_UNHEALTHY ->
      `String "GAME_SERVER_CONTAINER_GROUP_REPLACED_UNHEALTHY"
  | LOCATION_STATE_PENDING -> `String "LOCATION_STATE_PENDING"
  | LOCATION_STATE_CREATING -> `String "LOCATION_STATE_CREATING"
  | LOCATION_STATE_CREATED -> `String "LOCATION_STATE_CREATED"
  | LOCATION_STATE_ACTIVATING -> `String "LOCATION_STATE_ACTIVATING"
  | LOCATION_STATE_ACTIVE -> `String "LOCATION_STATE_ACTIVE"
  | LOCATION_STATE_UPDATING -> `String "LOCATION_STATE_UPDATING"
  | LOCATION_STATE_ERROR -> `String "LOCATION_STATE_ERROR"
  | LOCATION_STATE_DELETING -> `String "LOCATION_STATE_DELETING"
  | LOCATION_STATE_DELETED -> `String "LOCATION_STATE_DELETED"

let event_to_yojson (x : event) =
  assoc_to_yojson
    [
      ("EventId", option_to_yojson non_zero_and_max_string_to_yojson x.event_id);
      ("ResourceId", option_to_yojson non_zero_and_max_string_to_yojson x.resource_id);
      ("EventCode", option_to_yojson event_code_to_yojson x.event_code);
      ("Message", option_to_yojson non_empty_string_to_yojson x.message);
      ("EventTime", option_to_yojson timestamp_to_yojson x.event_time);
      ("PreSignedLogUrl", option_to_yojson non_zero_and_max_string_to_yojson x.pre_signed_log_url);
      ("Count", option_to_yojson event_count_to_yojson x.count);
    ]

let event_list_to_yojson tree = list_to_yojson event_to_yojson tree

let describe_fleet_events_output_to_yojson (x : describe_fleet_events_output) =
  assoc_to_yojson
    [
      ("Events", option_to_yojson event_list_to_yojson x.events);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let describe_fleet_events_input_to_yojson (x : describe_fleet_events_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let location_update_status_to_yojson (x : location_update_status) =
  match x with PENDING_UPDATE -> `String "PENDING_UPDATE"

let location_attributes_to_yojson (x : location_attributes) =
  assoc_to_yojson
    [
      ("LocationState", option_to_yojson location_state_to_yojson x.location_state);
      ("StoppedActions", option_to_yojson fleet_action_list_to_yojson x.stopped_actions);
      ("UpdateStatus", option_to_yojson location_update_status_to_yojson x.update_status);
    ]

let location_attributes_list_to_yojson tree = list_to_yojson location_attributes_to_yojson tree

let describe_fleet_location_attributes_output_to_yojson
    (x : describe_fleet_location_attributes_output) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ( "LocationAttributes",
        option_to_yojson location_attributes_list_to_yojson x.location_attributes );
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let describe_fleet_location_attributes_input_to_yojson
    (x : describe_fleet_location_attributes_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("Locations", option_to_yojson location_list_to_yojson x.locations);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let describe_fleet_location_capacity_output_to_yojson (x : describe_fleet_location_capacity_output)
    =
  assoc_to_yojson [ ("FleetCapacity", option_to_yojson fleet_capacity_to_yojson x.fleet_capacity) ]

let describe_fleet_location_capacity_input_to_yojson (x : describe_fleet_location_capacity_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("Location", Some (location_string_model_to_yojson x.location));
    ]

let fleet_utilization_to_yojson (x : fleet_utilization) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ( "ActiveServerProcessCount",
        option_to_yojson whole_number_to_yojson x.active_server_process_count );
      ("ActiveGameSessionCount", option_to_yojson whole_number_to_yojson x.active_game_session_count);
      ( "CurrentPlayerSessionCount",
        option_to_yojson whole_number_to_yojson x.current_player_session_count );
      ( "MaximumPlayerSessionCount",
        option_to_yojson whole_number_to_yojson x.maximum_player_session_count );
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
    ]

let describe_fleet_location_utilization_output_to_yojson
    (x : describe_fleet_location_utilization_output) =
  assoc_to_yojson
    [ ("FleetUtilization", option_to_yojson fleet_utilization_to_yojson x.fleet_utilization) ]

let describe_fleet_location_utilization_input_to_yojson
    (x : describe_fleet_location_utilization_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("Location", Some (location_string_model_to_yojson x.location));
    ]

let describe_fleet_port_settings_output_to_yojson (x : describe_fleet_port_settings_output) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("InboundPermissions", option_to_yojson ip_permissions_list_to_yojson x.inbound_permissions);
      ("UpdateStatus", option_to_yojson location_update_status_to_yojson x.update_status);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
    ]

let describe_fleet_port_settings_input_to_yojson (x : describe_fleet_port_settings_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
    ]

let fleet_utilization_list_to_yojson tree = list_to_yojson fleet_utilization_to_yojson tree

let describe_fleet_utilization_output_to_yojson (x : describe_fleet_utilization_output) =
  assoc_to_yojson
    [
      ("FleetUtilization", option_to_yojson fleet_utilization_list_to_yojson x.fleet_utilization);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let describe_fleet_utilization_input_to_yojson (x : describe_fleet_utilization_input) =
  assoc_to_yojson
    [
      ("FleetIds", option_to_yojson fleet_id_or_arn_list_to_yojson x.fleet_ids);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let describe_game_server_output_to_yojson (x : describe_game_server_output) =
  assoc_to_yojson [ ("GameServer", option_to_yojson game_server_to_yojson x.game_server) ]

let describe_game_server_input_to_yojson (x : describe_game_server_input) =
  assoc_to_yojson
    [
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
      ("GameServerId", Some (game_server_id_to_yojson x.game_server_id));
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

let game_server_instance_status_to_yojson (x : game_server_instance_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | DRAINING -> `String "DRAINING"
  | SPOT_TERMINATING -> `String "SPOT_TERMINATING"

let game_server_instance_to_yojson (x : game_server_instance) =
  assoc_to_yojson
    [
      ( "GameServerGroupName",
        option_to_yojson game_server_group_name_to_yojson x.game_server_group_name );
      ( "GameServerGroupArn",
        option_to_yojson game_server_group_arn_to_yojson x.game_server_group_arn );
      ("InstanceId", option_to_yojson game_server_instance_id_to_yojson x.instance_id);
      ("InstanceStatus", option_to_yojson game_server_instance_status_to_yojson x.instance_status);
    ]

let game_server_instances_to_yojson tree = list_to_yojson game_server_instance_to_yojson tree

let describe_game_server_instances_output_to_yojson (x : describe_game_server_instances_output) =
  assoc_to_yojson
    [
      ( "GameServerInstances",
        option_to_yojson game_server_instances_to_yojson x.game_server_instances );
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let game_server_instance_ids_to_yojson tree = list_to_yojson game_server_instance_id_to_yojson tree

let describe_game_server_instances_input_to_yojson (x : describe_game_server_instances_input) =
  assoc_to_yojson
    [
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
      ("InstanceIds", option_to_yojson game_server_instance_ids_to_yojson x.instance_ids);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let game_session_detail_to_yojson (x : game_session_detail) =
  assoc_to_yojson
    [
      ("GameSession", option_to_yojson game_session_to_yojson x.game_session);
      ("ProtectionPolicy", option_to_yojson protection_policy_to_yojson x.protection_policy);
    ]

let game_session_detail_list_to_yojson tree = list_to_yojson game_session_detail_to_yojson tree

let describe_game_session_details_output_to_yojson (x : describe_game_session_details_output) =
  assoc_to_yojson
    [
      ( "GameSessionDetails",
        option_to_yojson game_session_detail_list_to_yojson x.game_session_details );
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let describe_game_session_details_input_to_yojson (x : describe_game_session_details_input) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
      ("GameSessionId", option_to_yojson arn_string_model_to_yojson x.game_session_id);
      ("AliasId", option_to_yojson alias_id_or_arn_to_yojson x.alias_id);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("StatusFilter", option_to_yojson non_zero_and_max_string_to_yojson x.status_filter);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let location_order_override_list_to_yojson tree =
  list_to_yojson location_string_model_to_yojson tree

let placement_fallback_strategy_to_yojson (x : placement_fallback_strategy) =
  match x with
  | DEFAULT_AFTER_SINGLE_PASS -> `String "DEFAULT_AFTER_SINGLE_PASS"
  | NONE -> `String "NONE"

let priority_configuration_override_to_yojson (x : priority_configuration_override) =
  assoc_to_yojson
    [
      ( "PlacementFallbackStrategy",
        option_to_yojson placement_fallback_strategy_to_yojson x.placement_fallback_strategy );
      ("LocationOrder", Some (location_order_override_list_to_yojson x.location_order));
    ]

let placed_player_session_to_yojson (x : placed_player_session) =
  assoc_to_yojson
    [
      ("PlayerId", option_to_yojson player_id_to_yojson x.player_id);
      ("PlayerSessionId", option_to_yojson player_session_id_to_yojson x.player_session_id);
    ]

let placed_player_session_list_to_yojson tree = list_to_yojson placed_player_session_to_yojson tree
let float__to_yojson = float_to_yojson

let player_latency_to_yojson (x : player_latency) =
  assoc_to_yojson
    [
      ("PlayerId", option_to_yojson player_id_to_yojson x.player_id);
      ("RegionIdentifier", option_to_yojson non_zero_and_max_string_to_yojson x.region_identifier);
      ("LatencyInMilliseconds", option_to_yojson float__to_yojson x.latency_in_milliseconds);
    ]

let player_latency_list_to_yojson tree = list_to_yojson player_latency_to_yojson tree

let game_session_placement_state_to_yojson (x : game_session_placement_state) =
  match x with
  | PENDING -> `String "PENDING"
  | FULFILLED -> `String "FULFILLED"
  | CANCELLED -> `String "CANCELLED"
  | TIMED_OUT -> `String "TIMED_OUT"
  | FAILED -> `String "FAILED"

let game_session_placement_to_yojson (x : game_session_placement) =
  assoc_to_yojson
    [
      ("PlacementId", option_to_yojson id_string_model_to_yojson x.placement_id);
      ( "GameSessionQueueName",
        option_to_yojson game_session_queue_name_to_yojson x.game_session_queue_name );
      ("Status", option_to_yojson game_session_placement_state_to_yojson x.status);
      ("GameProperties", option_to_yojson game_property_list_to_yojson x.game_properties);
      ( "MaximumPlayerSessionCount",
        option_to_yojson whole_number_to_yojson x.maximum_player_session_count );
      ("GameSessionName", option_to_yojson non_zero_and_max_string_to_yojson x.game_session_name);
      ("GameSessionId", option_to_yojson non_zero_and_max_string_to_yojson x.game_session_id);
      ("GameSessionArn", option_to_yojson non_zero_and_max_string_to_yojson x.game_session_arn);
      ("GameSessionRegion", option_to_yojson non_zero_and_max_string_to_yojson x.game_session_region);
      ("PlayerLatencies", option_to_yojson player_latency_list_to_yojson x.player_latencies);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("DnsName", option_to_yojson dns_name_to_yojson x.dns_name);
      ("Port", option_to_yojson port_number_to_yojson x.port);
      ( "PlacedPlayerSessions",
        option_to_yojson placed_player_session_list_to_yojson x.placed_player_sessions );
      ("GameSessionData", option_to_yojson large_game_session_data_to_yojson x.game_session_data);
      ("MatchmakerData", option_to_yojson matchmaker_data_to_yojson x.matchmaker_data);
      ( "PriorityConfigurationOverride",
        option_to_yojson priority_configuration_override_to_yojson x.priority_configuration_override
      );
      ( "PlayerGatewayStatus",
        option_to_yojson player_gateway_status_to_yojson x.player_gateway_status );
    ]

let describe_game_session_placement_output_to_yojson (x : describe_game_session_placement_output) =
  assoc_to_yojson
    [
      ( "GameSessionPlacement",
        option_to_yojson game_session_placement_to_yojson x.game_session_placement );
    ]

let describe_game_session_placement_input_to_yojson (x : describe_game_session_placement_input) =
  assoc_to_yojson [ ("PlacementId", Some (id_string_model_to_yojson x.placement_id)) ]

let game_session_queue_list_to_yojson tree = list_to_yojson game_session_queue_to_yojson tree

let describe_game_session_queues_output_to_yojson (x : describe_game_session_queues_output) =
  assoc_to_yojson
    [
      ("GameSessionQueues", option_to_yojson game_session_queue_list_to_yojson x.game_session_queues);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let game_session_queue_name_or_arn_list_to_yojson tree =
  list_to_yojson game_session_queue_name_or_arn_to_yojson tree

let describe_game_session_queues_input_to_yojson (x : describe_game_session_queues_input) =
  assoc_to_yojson
    [
      ("Names", option_to_yojson game_session_queue_name_or_arn_list_to_yojson x.names);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let game_session_list_to_yojson tree = list_to_yojson game_session_to_yojson tree

let describe_game_sessions_output_to_yojson (x : describe_game_sessions_output) =
  assoc_to_yojson
    [
      ("GameSessions", option_to_yojson game_session_list_to_yojson x.game_sessions);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let describe_game_sessions_input_to_yojson (x : describe_game_sessions_input) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
      ("GameSessionId", option_to_yojson arn_string_model_to_yojson x.game_session_id);
      ("AliasId", option_to_yojson alias_id_or_arn_to_yojson x.alias_id);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("StatusFilter", option_to_yojson non_zero_and_max_string_to_yojson x.status_filter);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let instance_status_to_yojson (x : instance_status) =
  match x with
  | PENDING -> `String "PENDING"
  | ACTIVE -> `String "ACTIVE"
  | TERMINATING -> `String "TERMINATING"

let instance_to_yojson (x : instance) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("DnsName", option_to_yojson dns_name_to_yojson x.dns_name);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("Type", option_to_yojson ec2_instance_type_to_yojson x.type_);
      ("Status", option_to_yojson instance_status_to_yojson x.status);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
    ]

let instance_list_to_yojson tree = list_to_yojson instance_to_yojson tree

let describe_instances_output_to_yojson (x : describe_instances_output) =
  assoc_to_yojson
    [
      ("Instances", option_to_yojson instance_list_to_yojson x.instances);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let describe_instances_input_to_yojson (x : describe_instances_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
    ]

let matched_player_session_to_yojson (x : matched_player_session) =
  assoc_to_yojson
    [
      ("PlayerId", option_to_yojson player_id_to_yojson x.player_id);
      ("PlayerSessionId", option_to_yojson player_session_id_to_yojson x.player_session_id);
    ]

let matched_player_session_list_to_yojson tree =
  list_to_yojson matched_player_session_to_yojson tree

let game_session_connection_info_to_yojson (x : game_session_connection_info) =
  assoc_to_yojson
    [
      ("GameSessionArn", option_to_yojson arn_string_model_to_yojson x.game_session_arn);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("DnsName", option_to_yojson dns_name_to_yojson x.dns_name);
      ("Port", option_to_yojson positive_integer_to_yojson x.port);
      ( "MatchedPlayerSessions",
        option_to_yojson matched_player_session_list_to_yojson x.matched_player_sessions );
      ( "PlayerGatewayStatus",
        option_to_yojson player_gateway_status_to_yojson x.player_gateway_status );
    ]

let latency_map_to_yojson tree =
  map_to_yojson non_empty_string_to_yojson positive_integer_to_yojson tree

let player_attribute_map_to_yojson tree =
  map_to_yojson non_zero_and_max_string_to_yojson attribute_value_to_yojson tree

let player_to_yojson (x : player) =
  assoc_to_yojson
    [
      ("PlayerId", option_to_yojson player_id_to_yojson x.player_id);
      ("PlayerAttributes", option_to_yojson player_attribute_map_to_yojson x.player_attributes);
      ("Team", option_to_yojson non_zero_and_max_string_to_yojson x.team);
      ("LatencyInMs", option_to_yojson latency_map_to_yojson x.latency_in_ms);
    ]

let player_list_to_yojson tree = list_to_yojson player_to_yojson tree
let string_model_to_yojson = string_to_yojson

let matchmaking_configuration_status_to_yojson (x : matchmaking_configuration_status) =
  match x with
  | CANCELLED -> `String "CANCELLED"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | PLACING -> `String "PLACING"
  | QUEUED -> `String "QUEUED"
  | REQUIRES_ACCEPTANCE -> `String "REQUIRES_ACCEPTANCE"
  | SEARCHING -> `String "SEARCHING"
  | TIMED_OUT -> `String "TIMED_OUT"

let matchmaking_ticket_to_yojson (x : matchmaking_ticket) =
  assoc_to_yojson
    [
      ("TicketId", option_to_yojson matchmaking_id_string_model_to_yojson x.ticket_id);
      ( "ConfigurationName",
        option_to_yojson matchmaking_id_string_model_to_yojson x.configuration_name );
      ( "ConfigurationArn",
        option_to_yojson matchmaking_configuration_arn_to_yojson x.configuration_arn );
      ("Status", option_to_yojson matchmaking_configuration_status_to_yojson x.status);
      ("StatusReason", option_to_yojson string_model_to_yojson x.status_reason);
      ("StatusMessage", option_to_yojson string_model_to_yojson x.status_message);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("Players", option_to_yojson player_list_to_yojson x.players);
      ( "GameSessionConnectionInfo",
        option_to_yojson game_session_connection_info_to_yojson x.game_session_connection_info );
      ("EstimatedWaitTime", option_to_yojson whole_number_to_yojson x.estimated_wait_time);
    ]

let matchmaking_ticket_list_to_yojson tree = list_to_yojson matchmaking_ticket_to_yojson tree

let describe_matchmaking_output_to_yojson (x : describe_matchmaking_output) =
  assoc_to_yojson
    [ ("TicketList", option_to_yojson matchmaking_ticket_list_to_yojson x.ticket_list) ]

let matchmaking_id_list_to_yojson tree = list_to_yojson matchmaking_id_string_model_to_yojson tree

let describe_matchmaking_input_to_yojson (x : describe_matchmaking_input) =
  assoc_to_yojson [ ("TicketIds", Some (matchmaking_id_list_to_yojson x.ticket_ids)) ]

let matchmaking_configuration_list_to_yojson tree =
  list_to_yojson matchmaking_configuration_to_yojson tree

let describe_matchmaking_configurations_output_to_yojson
    (x : describe_matchmaking_configurations_output) =
  assoc_to_yojson
    [
      ("Configurations", option_to_yojson matchmaking_configuration_list_to_yojson x.configurations);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let matchmaking_configuration_name_list_to_yojson tree =
  list_to_yojson matchmaking_configuration_name_to_yojson tree

let describe_matchmaking_configurations_input_to_yojson
    (x : describe_matchmaking_configurations_input) =
  assoc_to_yojson
    [
      ("Names", option_to_yojson matchmaking_configuration_name_list_to_yojson x.names);
      ("RuleSetName", option_to_yojson matchmaking_rule_set_name_to_yojson x.rule_set_name);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let matchmaking_rule_set_list_to_yojson tree = list_to_yojson matchmaking_rule_set_to_yojson tree

let describe_matchmaking_rule_sets_output_to_yojson (x : describe_matchmaking_rule_sets_output) =
  assoc_to_yojson
    [
      ("RuleSets", Some (matchmaking_rule_set_list_to_yojson x.rule_sets));
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let rule_set_limit_to_yojson = int_to_yojson

let matchmaking_rule_set_name_list_to_yojson tree =
  list_to_yojson matchmaking_rule_set_name_to_yojson tree

let describe_matchmaking_rule_sets_input_to_yojson (x : describe_matchmaking_rule_sets_input) =
  assoc_to_yojson
    [
      ("Names", option_to_yojson matchmaking_rule_set_name_list_to_yojson x.names);
      ("Limit", option_to_yojson rule_set_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let describe_player_sessions_output_to_yojson (x : describe_player_sessions_output) =
  assoc_to_yojson
    [
      ("PlayerSessions", option_to_yojson player_session_list_to_yojson x.player_sessions);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let describe_player_sessions_input_to_yojson (x : describe_player_sessions_input) =
  assoc_to_yojson
    [
      ("GameSessionId", option_to_yojson arn_string_model_to_yojson x.game_session_id);
      ("PlayerId", option_to_yojson player_id_to_yojson x.player_id);
      ("PlayerSessionId", option_to_yojson player_session_id_to_yojson x.player_session_id);
      ( "PlayerSessionStatusFilter",
        option_to_yojson non_zero_and_max_string_to_yojson x.player_session_status_filter );
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let describe_runtime_configuration_output_to_yojson (x : describe_runtime_configuration_output) =
  assoc_to_yojson
    [
      ( "RuntimeConfiguration",
        option_to_yojson runtime_configuration_to_yojson x.runtime_configuration );
    ]

let describe_runtime_configuration_input_to_yojson (x : describe_runtime_configuration_input) =
  assoc_to_yojson [ ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id)) ]

let double_to_yojson = double_to_yojson

let target_configuration_to_yojson (x : target_configuration) =
  assoc_to_yojson [ ("TargetValue", Some (double_to_yojson x.target_value)) ]

let policy_type_to_yojson (x : policy_type) =
  match x with RuleBased -> `String "RuleBased" | TargetBased -> `String "TargetBased"

let metric_name_to_yojson (x : metric_name) =
  match x with
  | ActivatingGameSessions -> `String "ActivatingGameSessions"
  | ActiveGameSessions -> `String "ActiveGameSessions"
  | ActiveInstances -> `String "ActiveInstances"
  | AvailableGameSessions -> `String "AvailableGameSessions"
  | AvailablePlayerSessions -> `String "AvailablePlayerSessions"
  | CurrentPlayerSessions -> `String "CurrentPlayerSessions"
  | IdleInstances -> `String "IdleInstances"
  | PercentAvailableGameSessions -> `String "PercentAvailableGameSessions"
  | PercentIdleInstances -> `String "PercentIdleInstances"
  | QueueDepth -> `String "QueueDepth"
  | WaitTime -> `String "WaitTime"
  | ConcurrentActivatableGameSessions -> `String "ConcurrentActivatableGameSessions"

let scaling_adjustment_type_to_yojson (x : scaling_adjustment_type) =
  match x with
  | ChangeInCapacity -> `String "ChangeInCapacity"
  | ExactCapacity -> `String "ExactCapacity"
  | PercentChangeInCapacity -> `String "PercentChangeInCapacity"

let integer_to_yojson = int_to_yojson

let scaling_status_type_to_yojson (x : scaling_status_type) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | UPDATE_REQUESTED -> `String "UPDATE_REQUESTED"
  | UPDATING -> `String "UPDATING"
  | DELETE_REQUESTED -> `String "DELETE_REQUESTED"
  | DELETING -> `String "DELETING"
  | DELETED -> `String "DELETED"
  | ERROR -> `String "ERROR"

let scaling_policy_to_yojson (x : scaling_policy) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("Status", option_to_yojson scaling_status_type_to_yojson x.status);
      ("ScalingAdjustment", option_to_yojson integer_to_yojson x.scaling_adjustment);
      ( "ScalingAdjustmentType",
        option_to_yojson scaling_adjustment_type_to_yojson x.scaling_adjustment_type );
      ( "ComparisonOperator",
        option_to_yojson comparison_operator_type_to_yojson x.comparison_operator );
      ("Threshold", option_to_yojson double_to_yojson x.threshold);
      ("EvaluationPeriods", option_to_yojson positive_integer_to_yojson x.evaluation_periods);
      ("MetricName", option_to_yojson metric_name_to_yojson x.metric_name);
      ("PolicyType", option_to_yojson policy_type_to_yojson x.policy_type);
      ("TargetConfiguration", option_to_yojson target_configuration_to_yojson x.target_configuration);
      ("UpdateStatus", option_to_yojson location_update_status_to_yojson x.update_status);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
    ]

let scaling_policy_list_to_yojson tree = list_to_yojson scaling_policy_to_yojson tree

let describe_scaling_policies_output_to_yojson (x : describe_scaling_policies_output) =
  assoc_to_yojson
    [
      ("ScalingPolicies", option_to_yojson scaling_policy_list_to_yojson x.scaling_policies);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let describe_scaling_policies_input_to_yojson (x : describe_scaling_policies_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("StatusFilter", option_to_yojson scaling_status_type_to_yojson x.status_filter);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
    ]

let describe_script_output_to_yojson (x : describe_script_output) =
  assoc_to_yojson [ ("Script", option_to_yojson script_to_yojson x.script) ]

let describe_script_input_to_yojson (x : describe_script_input) =
  assoc_to_yojson [ ("ScriptId", Some (script_id_or_arn_to_yojson x.script_id)) ]

let vpc_peering_authorization_list_to_yojson tree =
  list_to_yojson vpc_peering_authorization_to_yojson tree

let describe_vpc_peering_authorizations_output_to_yojson
    (x : describe_vpc_peering_authorizations_output) =
  assoc_to_yojson
    [
      ( "VpcPeeringAuthorizations",
        option_to_yojson vpc_peering_authorization_list_to_yojson x.vpc_peering_authorizations );
    ]

let describe_vpc_peering_authorizations_input_to_yojson = unit_to_yojson

let vpc_peering_connection_status_to_yojson (x : vpc_peering_connection_status) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson non_zero_and_max_string_to_yojson x.code);
      ("Message", option_to_yojson non_zero_and_max_string_to_yojson x.message);
    ]

let vpc_peering_connection_to_yojson (x : vpc_peering_connection) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("IpV4CidrBlock", option_to_yojson non_zero_and_max_string_to_yojson x.ip_v4_cidr_block);
      ( "VpcPeeringConnectionId",
        option_to_yojson non_zero_and_max_string_to_yojson x.vpc_peering_connection_id );
      ("Status", option_to_yojson vpc_peering_connection_status_to_yojson x.status);
      ("PeerVpcId", option_to_yojson non_zero_and_max_string_to_yojson x.peer_vpc_id);
      ("GameLiftVpcId", option_to_yojson non_zero_and_max_string_to_yojson x.game_lift_vpc_id);
    ]

let vpc_peering_connection_list_to_yojson tree =
  list_to_yojson vpc_peering_connection_to_yojson tree

let describe_vpc_peering_connections_output_to_yojson (x : describe_vpc_peering_connections_output)
    =
  assoc_to_yojson
    [
      ( "VpcPeeringConnections",
        option_to_yojson vpc_peering_connection_list_to_yojson x.vpc_peering_connections );
    ]

let describe_vpc_peering_connections_input_to_yojson (x : describe_vpc_peering_connections_input) =
  assoc_to_yojson [ ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id) ]

let desired_player_session_to_yojson (x : desired_player_session) =
  assoc_to_yojson
    [
      ("PlayerId", option_to_yojson player_id_to_yojson x.player_id);
      ("PlayerData", option_to_yojson player_data_to_yojson x.player_data);
    ]

let desired_player_session_list_to_yojson tree =
  list_to_yojson desired_player_session_to_yojson tree

let dns_name_input_to_yojson = string_to_yojson
let fleet_deployments_to_yojson tree = list_to_yojson fleet_deployment_to_yojson tree
let fleet_id_list_to_yojson tree = list_to_yojson fleet_id_to_yojson tree

let validate_matchmaking_rule_set_output_to_yojson (x : validate_matchmaking_rule_set_output) =
  assoc_to_yojson [ ("Valid", option_to_yojson boolean_model_to_yojson x.valid) ]

let validate_matchmaking_rule_set_input_to_yojson (x : validate_matchmaking_rule_set_input) =
  assoc_to_yojson [ ("RuleSetBody", Some (rule_set_body_to_yojson x.rule_set_body)) ]

let update_script_output_to_yojson (x : update_script_output) =
  assoc_to_yojson [ ("Script", option_to_yojson script_to_yojson x.script) ]

let update_script_input_to_yojson (x : update_script_input) =
  assoc_to_yojson
    [
      ("ScriptId", Some (script_id_or_arn_to_yojson x.script_id));
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("Version", option_to_yojson non_zero_and_max_string_to_yojson x.version);
      ("StorageLocation", option_to_yojson s3_location_to_yojson x.storage_location);
      ("ZipFile", option_to_yojson zip_blob_to_yojson x.zip_file);
    ]

let update_runtime_configuration_output_to_yojson (x : update_runtime_configuration_output) =
  assoc_to_yojson
    [
      ( "RuntimeConfiguration",
        option_to_yojson runtime_configuration_to_yojson x.runtime_configuration );
    ]

let update_runtime_configuration_input_to_yojson (x : update_runtime_configuration_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("RuntimeConfiguration", Some (runtime_configuration_to_yojson x.runtime_configuration));
    ]

let update_matchmaking_configuration_output_to_yojson (x : update_matchmaking_configuration_output)
    =
  assoc_to_yojson
    [ ("Configuration", option_to_yojson matchmaking_configuration_to_yojson x.configuration) ]

let update_matchmaking_configuration_input_to_yojson (x : update_matchmaking_configuration_input) =
  assoc_to_yojson
    [
      ("Name", Some (matchmaking_configuration_name_to_yojson x.name));
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("GameSessionQueueArns", option_to_yojson queue_arns_list_to_yojson x.game_session_queue_arns);
      ( "RequestTimeoutSeconds",
        option_to_yojson matchmaking_request_timeout_integer_to_yojson x.request_timeout_seconds );
      ( "AcceptanceTimeoutSeconds",
        option_to_yojson matchmaking_acceptance_timeout_integer_to_yojson
          x.acceptance_timeout_seconds );
      ("AcceptanceRequired", option_to_yojson boolean_model_to_yojson x.acceptance_required);
      ("RuleSetName", option_to_yojson matchmaking_rule_set_name_to_yojson x.rule_set_name);
      ("NotificationTarget", option_to_yojson sns_arn_string_model_to_yojson x.notification_target);
      ("AdditionalPlayerCount", option_to_yojson whole_number_to_yojson x.additional_player_count);
      ("CustomEventData", option_to_yojson custom_event_data_to_yojson x.custom_event_data);
      ("GameProperties", option_to_yojson game_property_list_to_yojson x.game_properties);
      ("GameSessionData", option_to_yojson game_session_data_to_yojson x.game_session_data);
      ("BackfillMode", option_to_yojson backfill_mode_to_yojson x.backfill_mode);
      ("FlexMatchMode", option_to_yojson flex_match_mode_to_yojson x.flex_match_mode);
    ]

let update_game_session_queue_output_to_yojson (x : update_game_session_queue_output) =
  assoc_to_yojson
    [ ("GameSessionQueue", option_to_yojson game_session_queue_to_yojson x.game_session_queue) ]

let update_game_session_queue_input_to_yojson (x : update_game_session_queue_input) =
  assoc_to_yojson
    [
      ("Name", Some (game_session_queue_name_or_arn_to_yojson x.name));
      ("TimeoutInSeconds", option_to_yojson whole_number_to_yojson x.timeout_in_seconds);
      ( "PlayerLatencyPolicies",
        option_to_yojson player_latency_policy_list_to_yojson x.player_latency_policies );
      ("Destinations", option_to_yojson game_session_queue_destination_list_to_yojson x.destinations);
      ("FilterConfiguration", option_to_yojson filter_configuration_to_yojson x.filter_configuration);
      ( "PriorityConfiguration",
        option_to_yojson priority_configuration_to_yojson x.priority_configuration );
      ("CustomEventData", option_to_yojson queue_custom_event_data_to_yojson x.custom_event_data);
      ( "NotificationTarget",
        option_to_yojson queue_sns_arn_string_model_to_yojson x.notification_target );
    ]

let update_game_session_output_to_yojson (x : update_game_session_output) =
  assoc_to_yojson [ ("GameSession", option_to_yojson game_session_to_yojson x.game_session) ]

let update_game_session_input_to_yojson (x : update_game_session_input) =
  assoc_to_yojson
    [
      ("GameSessionId", Some (arn_string_model_to_yojson x.game_session_id));
      ( "MaximumPlayerSessionCount",
        option_to_yojson whole_number_to_yojson x.maximum_player_session_count );
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ( "PlayerSessionCreationPolicy",
        option_to_yojson player_session_creation_policy_to_yojson x.player_session_creation_policy
      );
      ("ProtectionPolicy", option_to_yojson protection_policy_to_yojson x.protection_policy);
      ("GameProperties", option_to_yojson game_property_list_to_yojson x.game_properties);
    ]

let update_game_server_group_output_to_yojson (x : update_game_server_group_output) =
  assoc_to_yojson
    [ ("GameServerGroup", option_to_yojson game_server_group_to_yojson x.game_server_group) ]

let update_game_server_group_input_to_yojson (x : update_game_server_group_input) =
  assoc_to_yojson
    [
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("InstanceDefinitions", option_to_yojson instance_definitions_to_yojson x.instance_definitions);
      ( "GameServerProtectionPolicy",
        option_to_yojson game_server_protection_policy_to_yojson x.game_server_protection_policy );
      ("BalancingStrategy", option_to_yojson balancing_strategy_to_yojson x.balancing_strategy);
    ]

let update_game_server_output_to_yojson (x : update_game_server_output) =
  assoc_to_yojson [ ("GameServer", option_to_yojson game_server_to_yojson x.game_server) ]

let game_server_health_check_to_yojson (x : game_server_health_check) =
  match x with HEALTHY -> `String "HEALTHY"

let update_game_server_input_to_yojson (x : update_game_server_input) =
  assoc_to_yojson
    [
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
      ("GameServerId", Some (game_server_id_to_yojson x.game_server_id));
      ("GameServerData", option_to_yojson game_server_data_to_yojson x.game_server_data);
      ( "UtilizationStatus",
        option_to_yojson game_server_utilization_status_to_yojson x.utilization_status );
      ("HealthCheck", option_to_yojson game_server_health_check_to_yojson x.health_check);
    ]

let update_fleet_port_settings_output_to_yojson (x : update_fleet_port_settings_output) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
    ]

let update_fleet_port_settings_input_to_yojson (x : update_fleet_port_settings_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ( "InboundPermissionAuthorizations",
        option_to_yojson ip_permissions_list_to_yojson x.inbound_permission_authorizations );
      ( "InboundPermissionRevocations",
        option_to_yojson ip_permissions_list_to_yojson x.inbound_permission_revocations );
    ]

let update_fleet_capacity_output_to_yojson (x : update_fleet_capacity_output) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ( "ManagedCapacityConfiguration",
        option_to_yojson managed_capacity_configuration_to_yojson x.managed_capacity_configuration
      );
    ]

let update_fleet_capacity_input_to_yojson (x : update_fleet_capacity_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("DesiredInstances", option_to_yojson whole_number_to_yojson x.desired_instances);
      ("MinSize", option_to_yojson whole_number_to_yojson x.min_size);
      ("MaxSize", option_to_yojson whole_number_to_yojson x.max_size);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ( "ManagedCapacityConfiguration",
        option_to_yojson managed_capacity_configuration_to_yojson x.managed_capacity_configuration
      );
    ]

let update_fleet_attributes_output_to_yojson (x : update_fleet_attributes_output) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
    ]

let update_fleet_attributes_input_to_yojson (x : update_fleet_attributes_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ( "NewGameSessionProtectionPolicy",
        option_to_yojson protection_policy_to_yojson x.new_game_session_protection_policy );
      ( "ResourceCreationLimitPolicy",
        option_to_yojson resource_creation_limit_policy_to_yojson x.resource_creation_limit_policy
      );
      ("MetricGroups", option_to_yojson metric_group_list_to_yojson x.metric_groups);
      ( "AnywhereConfiguration",
        option_to_yojson anywhere_configuration_to_yojson x.anywhere_configuration );
    ]

let update_container_group_definition_output_to_yojson
    (x : update_container_group_definition_output) =
  assoc_to_yojson
    [
      ( "ContainerGroupDefinition",
        option_to_yojson container_group_definition_to_yojson x.container_group_definition );
    ]

let update_container_group_definition_input_to_yojson (x : update_container_group_definition_input)
    =
  assoc_to_yojson
    [
      ("Name", Some (container_group_definition_name_or_arn_to_yojson x.name));
      ( "GameServerContainerDefinition",
        option_to_yojson game_server_container_definition_input_to_yojson
          x.game_server_container_definition );
      ( "SupportContainerDefinitions",
        option_to_yojson support_container_definition_input_list_to_yojson
          x.support_container_definitions );
      ( "TotalMemoryLimitMebibytes",
        option_to_yojson container_total_memory_limit_to_yojson x.total_memory_limit_mebibytes );
      ("TotalVcpuLimit", option_to_yojson container_total_vcpu_limit_to_yojson x.total_vcpu_limit);
      ( "VersionDescription",
        option_to_yojson non_zero_and_max_string_to_yojson x.version_description );
      ("SourceVersionNumber", option_to_yojson positive_integer_to_yojson x.source_version_number);
      ("OperatingSystem", option_to_yojson container_operating_system_to_yojson x.operating_system);
    ]

let update_container_fleet_output_to_yojson (x : update_container_fleet_output) =
  assoc_to_yojson
    [ ("ContainerFleet", option_to_yojson container_fleet_to_yojson x.container_fleet) ]

let update_container_fleet_input_to_yojson (x : update_container_fleet_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ( "GameServerContainerGroupDefinitionName",
        option_to_yojson container_group_definition_name_or_arn_to_yojson
          x.game_server_container_group_definition_name );
      ( "PerInstanceContainerGroupDefinitionName",
        option_to_yojson container_group_definition_name_or_arn_to_yojson
          x.per_instance_container_group_definition_name );
      ( "GameServerContainerGroupsPerInstance",
        option_to_yojson game_server_container_groups_per_instance_to_yojson
          x.game_server_container_groups_per_instance );
      ( "InstanceConnectionPortRange",
        option_to_yojson connection_port_range_to_yojson x.instance_connection_port_range );
      ( "InstanceInboundPermissionAuthorizations",
        option_to_yojson ip_permissions_list_to_yojson x.instance_inbound_permission_authorizations
      );
      ( "InstanceInboundPermissionRevocations",
        option_to_yojson ip_permissions_list_to_yojson x.instance_inbound_permission_revocations );
      ( "DeploymentConfiguration",
        option_to_yojson deployment_configuration_to_yojson x.deployment_configuration );
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("MetricGroups", option_to_yojson metric_group_list_to_yojson x.metric_groups);
      ( "NewGameSessionProtectionPolicy",
        option_to_yojson protection_policy_to_yojson x.new_game_session_protection_policy );
      ( "GameSessionCreationLimitPolicy",
        option_to_yojson game_session_creation_limit_policy_to_yojson
          x.game_session_creation_limit_policy );
      ("LogConfiguration", option_to_yojson log_configuration_to_yojson x.log_configuration);
      ( "RemoveAttributes",
        option_to_yojson container_fleet_remove_attribute_list_to_yojson x.remove_attributes );
    ]

let update_build_output_to_yojson (x : update_build_output) =
  assoc_to_yojson [ ("Build", option_to_yojson build_to_yojson x.build) ]

let update_build_input_to_yojson (x : update_build_input) =
  assoc_to_yojson
    [
      ("BuildId", Some (build_id_or_arn_to_yojson x.build_id));
      ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name);
      ("Version", option_to_yojson non_zero_and_max_string_to_yojson x.version);
    ]

let update_alias_output_to_yojson (x : update_alias_output) =
  assoc_to_yojson [ ("Alias", option_to_yojson alias_to_yojson x.alias) ]

let update_alias_input_to_yojson (x : update_alias_input) =
  assoc_to_yojson
    [
      ("AliasId", Some (alias_id_or_arn_to_yojson x.alias_id));
      ("Name", option_to_yojson non_blank_and_length_constraint_string_to_yojson x.name);
      ("Description", option_to_yojson non_zero_and_max_string_to_yojson x.description);
      ("RoutingStrategy", option_to_yojson routing_strategy_to_yojson x.routing_strategy);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let terminate_game_session_output_to_yojson (x : terminate_game_session_output) =
  assoc_to_yojson [ ("GameSession", option_to_yojson game_session_to_yojson x.game_session) ]

let termination_mode_to_yojson (x : termination_mode) =
  match x with
  | TRIGGER_ON_PROCESS_TERMINATE -> `String "TRIGGER_ON_PROCESS_TERMINATE"
  | FORCE_TERMINATE -> `String "FORCE_TERMINATE"

let terminate_game_session_input_to_yojson (x : terminate_game_session_input) =
  assoc_to_yojson
    [
      ("GameSessionId", Some (arn_string_model_to_yojson x.game_session_id));
      ("TerminationMode", Some (termination_mode_to_yojson x.termination_mode));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let suspend_game_server_group_output_to_yojson (x : suspend_game_server_group_output) =
  assoc_to_yojson
    [ ("GameServerGroup", option_to_yojson game_server_group_to_yojson x.game_server_group) ]

let suspend_game_server_group_input_to_yojson (x : suspend_game_server_group_input) =
  assoc_to_yojson
    [
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
      ("SuspendActions", Some (game_server_group_actions_to_yojson x.suspend_actions));
    ]

let stop_matchmaking_output_to_yojson = unit_to_yojson

let stop_matchmaking_input_to_yojson (x : stop_matchmaking_input) =
  assoc_to_yojson [ ("TicketId", Some (matchmaking_id_string_model_to_yojson x.ticket_id)) ]

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
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
    ]

let stop_fleet_actions_input_to_yojson (x : stop_fleet_actions_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("Actions", Some (fleet_action_list_to_yojson x.actions));
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
    ]

let start_matchmaking_output_to_yojson (x : start_matchmaking_output) =
  assoc_to_yojson
    [ ("MatchmakingTicket", option_to_yojson matchmaking_ticket_to_yojson x.matchmaking_ticket) ]

let start_matchmaking_input_to_yojson (x : start_matchmaking_input) =
  assoc_to_yojson
    [
      ("TicketId", option_to_yojson matchmaking_id_string_model_to_yojson x.ticket_id);
      ("ConfigurationName", Some (matchmaking_configuration_name_to_yojson x.configuration_name));
      ("Players", Some (player_list_to_yojson x.players));
    ]

let start_match_backfill_output_to_yojson (x : start_match_backfill_output) =
  assoc_to_yojson
    [ ("MatchmakingTicket", option_to_yojson matchmaking_ticket_to_yojson x.matchmaking_ticket) ]

let start_match_backfill_input_to_yojson (x : start_match_backfill_input) =
  assoc_to_yojson
    [
      ("TicketId", option_to_yojson matchmaking_id_string_model_to_yojson x.ticket_id);
      ("ConfigurationName", Some (matchmaking_configuration_name_to_yojson x.configuration_name));
      ("GameSessionArn", option_to_yojson arn_string_model_to_yojson x.game_session_arn);
      ("Players", Some (player_list_to_yojson x.players));
    ]

let start_game_session_placement_output_to_yojson (x : start_game_session_placement_output) =
  assoc_to_yojson
    [
      ( "GameSessionPlacement",
        option_to_yojson game_session_placement_to_yojson x.game_session_placement );
    ]

let start_game_session_placement_input_to_yojson (x : start_game_session_placement_input) =
  assoc_to_yojson
    [
      ("PlacementId", Some (id_string_model_to_yojson x.placement_id));
      ( "GameSessionQueueName",
        Some (game_session_queue_name_or_arn_to_yojson x.game_session_queue_name) );
      ("GameProperties", option_to_yojson game_property_list_to_yojson x.game_properties);
      ("MaximumPlayerSessionCount", Some (whole_number_to_yojson x.maximum_player_session_count));
      ("GameSessionName", option_to_yojson non_zero_and_max_string_to_yojson x.game_session_name);
      ("PlayerLatencies", option_to_yojson player_latency_list_to_yojson x.player_latencies);
      ( "DesiredPlayerSessions",
        option_to_yojson desired_player_session_list_to_yojson x.desired_player_sessions );
      ("GameSessionData", option_to_yojson large_game_session_data_to_yojson x.game_session_data);
      ( "PriorityConfigurationOverride",
        option_to_yojson priority_configuration_override_to_yojson x.priority_configuration_override
      );
    ]

let start_fleet_actions_output_to_yojson (x : start_fleet_actions_output) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
    ]

let start_fleet_actions_input_to_yojson (x : start_fleet_actions_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("Actions", Some (fleet_action_list_to_yojson x.actions));
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
    ]

let search_game_sessions_output_to_yojson (x : search_game_sessions_output) =
  assoc_to_yojson
    [
      ("GameSessions", option_to_yojson game_session_list_to_yojson x.game_sessions);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let search_game_sessions_input_to_yojson (x : search_game_sessions_input) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
      ("AliasId", option_to_yojson alias_id_or_arn_to_yojson x.alias_id);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ("FilterExpression", option_to_yojson non_zero_and_max_string_to_yojson x.filter_expression);
      ("SortExpression", option_to_yojson non_zero_and_max_string_to_yojson x.sort_expression);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let resume_game_server_group_output_to_yojson (x : resume_game_server_group_output) =
  assoc_to_yojson
    [ ("GameServerGroup", option_to_yojson game_server_group_to_yojson x.game_server_group) ]

let resume_game_server_group_input_to_yojson (x : resume_game_server_group_input) =
  assoc_to_yojson
    [
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
      ("ResumeActions", Some (game_server_group_actions_to_yojson x.resume_actions));
    ]

let resolve_alias_output_to_yojson (x : resolve_alias_output) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
    ]

let resolve_alias_input_to_yojson (x : resolve_alias_input) =
  assoc_to_yojson [ ("AliasId", Some (alias_id_or_arn_to_yojson x.alias_id)) ]

let request_upload_credentials_output_to_yojson (x : request_upload_credentials_output) =
  assoc_to_yojson
    [
      ("UploadCredentials", option_to_yojson aws_credentials_to_yojson x.upload_credentials);
      ("StorageLocation", option_to_yojson s3_location_to_yojson x.storage_location);
    ]

let request_upload_credentials_input_to_yojson (x : request_upload_credentials_input) =
  assoc_to_yojson [ ("BuildId", Some (build_id_or_arn_to_yojson x.build_id)) ]

let register_game_server_output_to_yojson (x : register_game_server_output) =
  assoc_to_yojson [ ("GameServer", option_to_yojson game_server_to_yojson x.game_server) ]

let register_game_server_input_to_yojson (x : register_game_server_input) =
  assoc_to_yojson
    [
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
      ("GameServerId", Some (game_server_id_to_yojson x.game_server_id));
      ("InstanceId", Some (game_server_instance_id_to_yojson x.instance_id));
      ("ConnectionInfo", option_to_yojson game_server_connection_info_to_yojson x.connection_info);
      ("GameServerData", option_to_yojson game_server_data_to_yojson x.game_server_data);
    ]

let register_compute_output_to_yojson (x : register_compute_output) =
  assoc_to_yojson [ ("Compute", option_to_yojson compute_to_yojson x.compute) ]

let register_compute_input_to_yojson (x : register_compute_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("ComputeName", Some (compute_name_to_yojson x.compute_name));
      ("CertificatePath", option_to_yojson non_zero_and_max_string_to_yojson x.certificate_path);
      ("DnsName", option_to_yojson dns_name_input_to_yojson x.dns_name);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
    ]

let put_scaling_policy_output_to_yojson (x : put_scaling_policy_output) =
  assoc_to_yojson [ ("Name", option_to_yojson non_zero_and_max_string_to_yojson x.name) ]

let put_scaling_policy_input_to_yojson (x : put_scaling_policy_input) =
  assoc_to_yojson
    [
      ("Name", Some (non_zero_and_max_string_to_yojson x.name));
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("ScalingAdjustment", option_to_yojson integer_to_yojson x.scaling_adjustment);
      ( "ScalingAdjustmentType",
        option_to_yojson scaling_adjustment_type_to_yojson x.scaling_adjustment_type );
      ("Threshold", option_to_yojson double_to_yojson x.threshold);
      ( "ComparisonOperator",
        option_to_yojson comparison_operator_type_to_yojson x.comparison_operator );
      ("EvaluationPeriods", option_to_yojson positive_integer_to_yojson x.evaluation_periods);
      ("MetricName", Some (metric_name_to_yojson x.metric_name));
      ("PolicyType", option_to_yojson policy_type_to_yojson x.policy_type);
      ("TargetConfiguration", option_to_yojson target_configuration_to_yojson x.target_configuration);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let script_list_to_yojson tree = list_to_yojson script_to_yojson tree

let list_scripts_output_to_yojson (x : list_scripts_output) =
  assoc_to_yojson
    [
      ("Scripts", option_to_yojson script_list_to_yojson x.scripts);
      ("NextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
    ]

let list_scripts_input_to_yojson (x : list_scripts_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
    ]

let location_model_list_to_yojson tree = list_to_yojson location_model_to_yojson tree

let list_locations_output_to_yojson (x : list_locations_output) =
  assoc_to_yojson
    [
      ("Locations", option_to_yojson location_model_list_to_yojson x.locations);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let list_locations_limit_to_yojson = int_to_yojson

let location_filter_to_yojson (x : location_filter) =
  match x with AWS -> `String "AWS" | CUSTOM -> `String "CUSTOM"

let location_filter_list_to_yojson tree = list_to_yojson location_filter_to_yojson tree

let list_locations_input_to_yojson (x : list_locations_input) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson location_filter_list_to_yojson x.filters);
      ("Limit", option_to_yojson list_locations_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let game_servers_to_yojson tree = list_to_yojson game_server_to_yojson tree

let list_game_servers_output_to_yojson (x : list_game_servers_output) =
  assoc_to_yojson
    [
      ("GameServers", option_to_yojson game_servers_to_yojson x.game_servers);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let sort_order_to_yojson (x : sort_order) =
  match x with ASCENDING -> `String "ASCENDING" | DESCENDING -> `String "DESCENDING"

let list_game_servers_input_to_yojson (x : list_game_servers_input) =
  assoc_to_yojson
    [
      ( "GameServerGroupName",
        Some (game_server_group_name_or_arn_to_yojson x.game_server_group_name) );
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let game_server_groups_to_yojson tree = list_to_yojson game_server_group_to_yojson tree

let list_game_server_groups_output_to_yojson (x : list_game_server_groups_output) =
  assoc_to_yojson
    [
      ("GameServerGroups", option_to_yojson game_server_groups_to_yojson x.game_server_groups);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let list_game_server_groups_input_to_yojson (x : list_game_server_groups_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let list_fleets_output_to_yojson (x : list_fleets_output) =
  assoc_to_yojson
    [
      ("FleetIds", option_to_yojson fleet_id_list_to_yojson x.fleet_ids);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let list_fleets_input_to_yojson (x : list_fleets_input) =
  assoc_to_yojson
    [
      ("BuildId", option_to_yojson build_id_or_arn_to_yojson x.build_id);
      ("ScriptId", option_to_yojson script_id_or_arn_to_yojson x.script_id);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let list_fleet_deployments_output_to_yojson (x : list_fleet_deployments_output) =
  assoc_to_yojson
    [
      ("FleetDeployments", option_to_yojson fleet_deployments_to_yojson x.fleet_deployments);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let list_fleet_deployments_input_to_yojson (x : list_fleet_deployments_input) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let list_container_group_definition_versions_output_to_yojson
    (x : list_container_group_definition_versions_output) =
  assoc_to_yojson
    [
      ( "ContainerGroupDefinitions",
        option_to_yojson container_group_definition_list_to_yojson x.container_group_definitions );
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let list_container_group_definition_versions_limit_to_yojson = int_to_yojson

let list_container_group_definition_versions_input_to_yojson
    (x : list_container_group_definition_versions_input) =
  assoc_to_yojson
    [
      ("Name", Some (container_group_definition_name_or_arn_to_yojson x.name));
      ("Limit", option_to_yojson list_container_group_definition_versions_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let list_container_group_definitions_output_to_yojson (x : list_container_group_definitions_output)
    =
  assoc_to_yojson
    [
      ( "ContainerGroupDefinitions",
        option_to_yojson container_group_definition_list_to_yojson x.container_group_definitions );
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let list_container_group_definitions_limit_to_yojson = int_to_yojson

let list_container_group_definitions_input_to_yojson (x : list_container_group_definitions_input) =
  assoc_to_yojson
    [
      ("ContainerGroupType", option_to_yojson container_group_type_to_yojson x.container_group_type);
      ("Limit", option_to_yojson list_container_group_definitions_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let list_container_fleets_output_to_yojson (x : list_container_fleets_output) =
  assoc_to_yojson
    [
      ("ContainerFleets", option_to_yojson container_fleet_list_to_yojson x.container_fleets);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let list_container_fleets_input_to_yojson (x : list_container_fleets_input) =
  assoc_to_yojson
    [
      ( "ContainerGroupDefinitionName",
        option_to_yojson container_group_definition_name_or_arn_to_yojson
          x.container_group_definition_name );
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let list_compute_output_to_yojson (x : list_compute_output) =
  assoc_to_yojson
    [
      ("ComputeList", option_to_yojson compute_list_to_yojson x.compute_list);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let list_compute_input_status_to_yojson (x : list_compute_input_status) =
  match x with ACTIVE -> `String "ACTIVE" | IMPAIRED -> `String "IMPAIRED"

let list_compute_input_to_yojson (x : list_compute_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("Location", option_to_yojson location_string_model_to_yojson x.location);
      ( "ContainerGroupDefinitionName",
        option_to_yojson container_group_definition_name_or_arn_to_yojson
          x.container_group_definition_name );
      ("ComputeStatus", option_to_yojson list_compute_input_status_to_yojson x.compute_status);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_zero_and_max_string_to_yojson x.next_token);
    ]

let list_builds_output_to_yojson (x : list_builds_output) =
  assoc_to_yojson
    [
      ("Builds", option_to_yojson build_list_to_yojson x.builds);
      ("NextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
    ]

let list_builds_input_to_yojson (x : list_builds_input) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson build_status_to_yojson x.status);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
    ]

let list_aliases_output_to_yojson (x : list_aliases_output) =
  assoc_to_yojson
    [
      ("Aliases", option_to_yojson alias_list_to_yojson x.aliases);
      ("NextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
    ]

let list_aliases_input_to_yojson (x : list_aliases_input) =
  assoc_to_yojson
    [
      ( "RoutingStrategyType",
        option_to_yojson routing_strategy_type_to_yojson x.routing_strategy_type );
      ("Name", option_to_yojson non_empty_string_to_yojson x.name);
      ("Limit", option_to_yojson positive_integer_to_yojson x.limit);
      ("NextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
    ]

let max_string_to_yojson = string_to_yojson

let player_connection_endpoint_to_yojson (x : player_connection_endpoint) =
  assoc_to_yojson
    [
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("Port", option_to_yojson port_number_to_yojson x.port);
    ]

let player_connection_endpoint_list_to_yojson tree =
  list_to_yojson player_connection_endpoint_to_yojson tree

let player_connection_detail_to_yojson (x : player_connection_detail) =
  assoc_to_yojson
    [
      ("PlayerId", option_to_yojson player_id_to_yojson x.player_id);
      ("Endpoints", option_to_yojson player_connection_endpoint_list_to_yojson x.endpoints);
      ("PlayerGatewayToken", option_to_yojson max_string_to_yojson x.player_gateway_token);
      ("Expiration", option_to_yojson timestamp_to_yojson x.expiration);
    ]

let player_connection_detail_list_to_yojson tree =
  list_to_yojson player_connection_detail_to_yojson tree

let get_player_connection_details_output_to_yojson (x : get_player_connection_details_output) =
  assoc_to_yojson
    [
      ("GameSessionId", option_to_yojson arn_string_model_to_yojson x.game_session_id);
      ( "PlayerConnectionDetails",
        option_to_yojson player_connection_detail_list_to_yojson x.player_connection_details );
    ]

let get_player_connection_details_input_to_yojson (x : get_player_connection_details_input) =
  assoc_to_yojson
    [
      ("GameSessionId", Some (arn_string_model_to_yojson x.game_session_id));
      ("PlayerIds", Some (player_id_list_to_yojson x.player_ids));
    ]

let instance_credentials_to_yojson (x : instance_credentials) =
  assoc_to_yojson
    [
      ("UserName", option_to_yojson non_empty_string_to_yojson x.user_name);
      ("Secret", option_to_yojson non_empty_string_to_yojson x.secret);
    ]

let instance_access_to_yojson (x : instance_access) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_to_yojson x.fleet_id);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("Credentials", option_to_yojson instance_credentials_to_yojson x.credentials);
    ]

let get_instance_access_output_to_yojson (x : get_instance_access_output) =
  assoc_to_yojson
    [ ("InstanceAccess", option_to_yojson instance_access_to_yojson x.instance_access) ]

let get_instance_access_input_to_yojson (x : get_instance_access_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("InstanceId", Some (instance_id_to_yojson x.instance_id));
    ]

let get_game_session_log_url_output_to_yojson (x : get_game_session_log_url_output) =
  assoc_to_yojson
    [ ("PreSignedUrl", option_to_yojson non_zero_and_max_string_to_yojson x.pre_signed_url) ]

let get_game_session_log_url_input_to_yojson (x : get_game_session_log_url_input) =
  assoc_to_yojson [ ("GameSessionId", Some (arn_string_model_to_yojson x.game_session_id)) ]

let get_compute_auth_token_output_to_yojson (x : get_compute_auth_token_output) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("ComputeName", option_to_yojson compute_name_or_arn_to_yojson x.compute_name);
      ("ComputeArn", option_to_yojson compute_arn_to_yojson x.compute_arn);
      ("AuthToken", option_to_yojson compute_auth_token_to_yojson x.auth_token);
      ("ExpirationTimestamp", option_to_yojson timestamp_to_yojson x.expiration_timestamp);
    ]

let get_compute_auth_token_input_to_yojson (x : get_compute_auth_token_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("ComputeName", Some (compute_name_or_arn_to_yojson x.compute_name));
    ]

let session_target_to_yojson = string_to_yojson

let get_compute_access_output_to_yojson (x : get_compute_access_output) =
  assoc_to_yojson
    [
      ("FleetId", option_to_yojson fleet_id_or_arn_to_yojson x.fleet_id);
      ("FleetArn", option_to_yojson fleet_arn_to_yojson x.fleet_arn);
      ("ComputeName", option_to_yojson compute_name_or_arn_to_yojson x.compute_name);
      ("ComputeArn", option_to_yojson compute_arn_to_yojson x.compute_arn);
      ("Credentials", option_to_yojson aws_credentials_to_yojson x.credentials);
      ("Target", option_to_yojson session_target_to_yojson x.target);
      ( "ContainerIdentifiers",
        option_to_yojson container_identifier_list_to_yojson x.container_identifiers );
    ]

let get_compute_access_input_to_yojson (x : get_compute_access_input) =
  assoc_to_yojson
    [
      ("FleetId", Some (fleet_id_or_arn_to_yojson x.fleet_id));
      ("ComputeName", Some (compute_name_or_arn_to_yojson x.compute_name));
    ]
