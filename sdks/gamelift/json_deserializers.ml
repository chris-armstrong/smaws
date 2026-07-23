open Smaws_Lib.Json.DeserializeHelpers
open Types

let non_empty_string_of_yojson = string_of_yojson

let unsupported_region_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path }
    : unsupported_region_exception)

let not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path }
    : not_found_exception)

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path }
    : invalid_request_exception)

let internal_service_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path }
    : internal_service_exception)

let accept_match_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let acceptance_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCEPT" -> ACCEPT
    | `String "REJECT" -> REJECT
    | `String value -> raise (deserialize_unknown_enum_value_error path "AcceptanceType" value)
    | _ -> raise (deserialize_wrong_type_error path "AcceptanceType")
     : acceptance_type)
    : acceptance_type)

let player_id_of_yojson = string_of_yojson
let player_ids_for_accept_match_of_yojson tree path = list_of_yojson player_id_of_yojson tree path
let matchmaking_id_string_model_of_yojson = string_of_yojson

let accept_match_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ticket_id = value_for_key matchmaking_id_string_model_of_yojson "TicketId" _list path;
     player_ids = value_for_key player_ids_for_accept_match_of_yojson "PlayerIds" _list path;
     acceptance_type = value_for_key acceptance_type_of_yojson "AcceptanceType" _list path;
   }
    : accept_match_input)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let free_text_of_yojson = string_of_yojson
let fleet_id_of_yojson = string_of_yojson

let routing_strategy_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SIMPLE" -> SIMPLE
    | `String "TERMINAL" -> TERMINAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "RoutingStrategyType" value)
    | _ -> raise (deserialize_wrong_type_error path "RoutingStrategyType")
     : routing_strategy_type)
    : routing_strategy_type)

let routing_strategy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key routing_strategy_type_of_yojson "Type") _list path;
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     message = option_of_yojson (value_for_key free_text_of_yojson "Message") _list path;
   }
    : routing_strategy)

let alias_arn_of_yojson = string_of_yojson
let non_blank_and_length_constraint_string_of_yojson = string_of_yojson
let alias_id_of_yojson = string_of_yojson

let alias_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alias_id = option_of_yojson (value_for_key alias_id_of_yojson "AliasId") _list path;
     name =
       option_of_yojson
         (value_for_key non_blank_and_length_constraint_string_of_yojson "Name")
         _list path;
     alias_arn = option_of_yojson (value_for_key alias_arn_of_yojson "AliasArn") _list path;
     description = option_of_yojson (value_for_key free_text_of_yojson "Description") _list path;
     routing_strategy =
       option_of_yojson (value_for_key routing_strategy_of_yojson "RoutingStrategy") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedTime") _list path;
   }
    : alias)

let alias_id_or_arn_of_yojson = string_of_yojson
let alias_list_of_yojson tree path = list_of_yojson alias_of_yojson tree path
let amazon_resource_name_of_yojson = string_of_yojson
let non_negative_limited_length_double_of_yojson = string_of_yojson

let anywhere_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cost = value_for_key non_negative_limited_length_double_of_yojson "Cost" _list path }
    : anywhere_configuration)

let arn_string_model_of_yojson = string_of_yojson
let double_object_of_yojson = double_of_yojson
let player_attribute_string_of_yojson = string_of_yojson

let player_attribute_string_double_map_of_yojson tree path =
  map_of_yojson player_attribute_string_of_yojson double_object_of_yojson tree path

let player_attribute_string_list_of_yojson tree path =
  list_of_yojson player_attribute_string_of_yojson tree path

let attribute_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s = option_of_yojson (value_for_key player_attribute_string_of_yojson "S") _list path;
     n = option_of_yojson (value_for_key double_object_of_yojson "N") _list path;
     s_l = option_of_yojson (value_for_key player_attribute_string_list_of_yojson "SL") _list path;
     sd_m =
       option_of_yojson
         (value_for_key player_attribute_string_double_map_of_yojson "SDM")
         _list path;
   }
    : attribute_value)

let auto_scaling_group_arn_of_yojson = string_of_yojson

let aws_credentials_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_key_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "AccessKeyId") _list path;
     secret_access_key =
       option_of_yojson (value_for_key non_empty_string_of_yojson "SecretAccessKey") _list path;
     session_token =
       option_of_yojson (value_for_key non_empty_string_of_yojson "SessionToken") _list path;
   }
    : aws_credentials)

let backfill_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTOMATIC" -> AUTOMATIC
    | `String "MANUAL" -> MANUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "BackfillMode" value)
    | _ -> raise (deserialize_wrong_type_error path "BackfillMode")
     : backfill_mode)
    : backfill_mode)

let balancing_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "SPOT_ONLY" -> SPOT_ONLY
    | `String "SPOT_PREFERRED" -> SPOT_PREFERRED
    | `String "ON_DEMAND_ONLY" -> ON_DEMAND_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "BalancingStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "BalancingStrategy")
     : balancing_strategy)
    : balancing_strategy)

let boolean_model_of_yojson = bool_of_yojson
let server_sdk_version_of_yojson = string_of_yojson

let operating_system_of_yojson (tree : t) path =
  ((match tree with
    | `String "WINDOWS_2012" -> WINDOWS_2012
    | `String "AMAZON_LINUX" -> AMAZON_LINUX
    | `String "AMAZON_LINUX_2" -> AMAZON_LINUX_2
    | `String "WINDOWS_2016" -> WINDOWS_2016
    | `String "AMAZON_LINUX_2023" -> AMAZON_LINUX_2023
    | `String "WINDOWS_2022" -> WINDOWS_2022
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperatingSystem" value)
    | _ -> raise (deserialize_wrong_type_error path "OperatingSystem")
     : operating_system)
    : operating_system)

let whole_number_long_of_yojson = long_of_yojson

let build_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "INITIALIZED" -> INITIALIZED
    | `String "READY" -> READY
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "BuildStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BuildStatus")
     : build_status)
    : build_status)

let build_arn_of_yojson = string_of_yojson
let build_id_of_yojson = string_of_yojson

let build_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     build_id = option_of_yojson (value_for_key build_id_of_yojson "BuildId") _list path;
     build_arn = option_of_yojson (value_for_key build_arn_of_yojson "BuildArn") _list path;
     name = option_of_yojson (value_for_key free_text_of_yojson "Name") _list path;
     version = option_of_yojson (value_for_key free_text_of_yojson "Version") _list path;
     status = option_of_yojson (value_for_key build_status_of_yojson "Status") _list path;
     size_on_disk =
       option_of_yojson (value_for_key whole_number_long_of_yojson "SizeOnDisk") _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     server_sdk_version =
       option_of_yojson (value_for_key server_sdk_version_of_yojson "ServerSdkVersion") _list path;
   }
    : build)

let build_id_or_arn_of_yojson = string_of_yojson
let build_list_of_yojson tree path = list_of_yojson build_of_yojson tree path

let certificate_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> Disabled
    | `String "GENERATED" -> Generated
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateType" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateType")
     : certificate_type)
    : certificate_type)

let certificate_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_type = value_for_key certificate_type_of_yojson "CertificateType" _list path }
    : certificate_configuration)

let filter_instance_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "DRAINING" -> DRAINING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FilterInstanceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterInstanceStatus")
     : filter_instance_status)
    : filter_instance_status)

let filter_instance_statuses_of_yojson tree path =
  list_of_yojson filter_instance_status_of_yojson tree path

let claim_filter_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_statuses =
       option_of_yojson
         (value_for_key filter_instance_statuses_of_yojson "InstanceStatuses")
         _list path;
   }
    : claim_filter_option)

let unauthorized_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path }
    : unauthorized_exception)

let out_of_capacity_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path }
    : out_of_capacity_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path }
    : conflict_exception)

let game_server_utilization_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "AVAILABLE" -> AVAILABLE
    | `String "UTILIZED" -> UTILIZED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GameServerUtilizationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "GameServerUtilizationStatus")
     : game_server_utilization_status)
    : game_server_utilization_status)

let game_server_claim_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CLAIMED" -> CLAIMED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GameServerClaimStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "GameServerClaimStatus")
     : game_server_claim_status)
    : game_server_claim_status)

let game_server_data_of_yojson = string_of_yojson
let game_server_connection_info_of_yojson = string_of_yojson
let game_server_instance_id_of_yojson = string_of_yojson
let game_server_id_of_yojson = string_of_yojson
let game_server_group_arn_of_yojson = string_of_yojson
let game_server_group_name_of_yojson = string_of_yojson

let game_server_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group_name =
       option_of_yojson
         (value_for_key game_server_group_name_of_yojson "GameServerGroupName")
         _list path;
     game_server_group_arn =
       option_of_yojson
         (value_for_key game_server_group_arn_of_yojson "GameServerGroupArn")
         _list path;
     game_server_id =
       option_of_yojson (value_for_key game_server_id_of_yojson "GameServerId") _list path;
     instance_id =
       option_of_yojson (value_for_key game_server_instance_id_of_yojson "InstanceId") _list path;
     connection_info =
       option_of_yojson
         (value_for_key game_server_connection_info_of_yojson "ConnectionInfo")
         _list path;
     game_server_data =
       option_of_yojson (value_for_key game_server_data_of_yojson "GameServerData") _list path;
     claim_status =
       option_of_yojson (value_for_key game_server_claim_status_of_yojson "ClaimStatus") _list path;
     utilization_status =
       option_of_yojson
         (value_for_key game_server_utilization_status_of_yojson "UtilizationStatus")
         _list path;
     registration_time =
       option_of_yojson (value_for_key timestamp_of_yojson "RegistrationTime") _list path;
     last_claim_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastClaimTime") _list path;
     last_health_check_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastHealthCheckTime") _list path;
   }
    : game_server)

let claim_game_server_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ game_server = option_of_yojson (value_for_key game_server_of_yojson "GameServer") _list path }
    : claim_game_server_output)

let game_server_group_name_or_arn_of_yojson = string_of_yojson

let claim_game_server_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group_name =
       value_for_key game_server_group_name_or_arn_of_yojson "GameServerGroupName" _list path;
     game_server_id =
       option_of_yojson (value_for_key game_server_id_of_yojson "GameServerId") _list path;
     game_server_data =
       option_of_yojson (value_for_key game_server_data_of_yojson "GameServerData") _list path;
     filter_option =
       option_of_yojson (value_for_key claim_filter_option_of_yojson "FilterOption") _list path;
   }
    : claim_game_server_input)

let comparison_operator_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GreaterThanOrEqualToThreshold" -> GreaterThanOrEqualToThreshold
    | `String "GreaterThanThreshold" -> GreaterThanThreshold
    | `String "LessThanThreshold" -> LessThanThreshold
    | `String "LessThanOrEqualToThreshold" -> LessThanOrEqualToThreshold
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ComparisonOperatorType" value)
    | _ -> raise (deserialize_wrong_type_error path "ComparisonOperatorType")
     : comparison_operator_type)
    : comparison_operator_type)

let container_group_definition_name_or_arn_of_yojson = string_of_yojson
let non_zero_and128_max_ascii_string_of_yojson = string_of_yojson

let container_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name =
       option_of_yojson
         (value_for_key non_zero_and128_max_ascii_string_of_yojson "ContainerName")
         _list path;
     container_runtime_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "ContainerRuntimeId") _list path;
   }
    : container_attribute)

let container_attributes_of_yojson tree path =
  list_of_yojson container_attribute_of_yojson tree path

let instance_id_of_yojson = string_of_yojson
let game_lift_agent_endpoint_output_of_yojson = string_of_yojson
let game_lift_service_sdk_endpoint_output_of_yojson = string_of_yojson

let ec2_instance_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "t2.micro" -> T2_micro
    | `String "t2.small" -> T2_small
    | `String "t2.medium" -> T2_medium
    | `String "t2.large" -> T2_large
    | `String "c3.large" -> C3_large
    | `String "c3.xlarge" -> C3_xlarge
    | `String "c3.2xlarge" -> C3_2xlarge
    | `String "c3.4xlarge" -> C3_4xlarge
    | `String "c3.8xlarge" -> C3_8xlarge
    | `String "c4.large" -> C4_large
    | `String "c4.xlarge" -> C4_xlarge
    | `String "c4.2xlarge" -> C4_2xlarge
    | `String "c4.4xlarge" -> C4_4xlarge
    | `String "c4.8xlarge" -> C4_8xlarge
    | `String "c5.large" -> C5_large
    | `String "c5.xlarge" -> C5_xlarge
    | `String "c5.2xlarge" -> C5_2xlarge
    | `String "c5.4xlarge" -> C5_4xlarge
    | `String "c5.9xlarge" -> C5_9xlarge
    | `String "c5.12xlarge" -> C5_12xlarge
    | `String "c5.18xlarge" -> C5_18xlarge
    | `String "c5.24xlarge" -> C5_24xlarge
    | `String "c5a.large" -> C5a_large
    | `String "c5a.xlarge" -> C5a_xlarge
    | `String "c5a.2xlarge" -> C5a_2xlarge
    | `String "c5a.4xlarge" -> C5a_4xlarge
    | `String "c5a.8xlarge" -> C5a_8xlarge
    | `String "c5a.12xlarge" -> C5a_12xlarge
    | `String "c5a.16xlarge" -> C5a_16xlarge
    | `String "c5a.24xlarge" -> C5a_24xlarge
    | `String "r3.large" -> R3_large
    | `String "r3.xlarge" -> R3_xlarge
    | `String "r3.2xlarge" -> R3_2xlarge
    | `String "r3.4xlarge" -> R3_4xlarge
    | `String "r3.8xlarge" -> R3_8xlarge
    | `String "r4.large" -> R4_large
    | `String "r4.xlarge" -> R4_xlarge
    | `String "r4.2xlarge" -> R4_2xlarge
    | `String "r4.4xlarge" -> R4_4xlarge
    | `String "r4.8xlarge" -> R4_8xlarge
    | `String "r4.16xlarge" -> R4_16xlarge
    | `String "r5.large" -> R5_large
    | `String "r5.xlarge" -> R5_xlarge
    | `String "r5.2xlarge" -> R5_2xlarge
    | `String "r5.4xlarge" -> R5_4xlarge
    | `String "r5.8xlarge" -> R5_8xlarge
    | `String "r5.12xlarge" -> R5_12xlarge
    | `String "r5.16xlarge" -> R5_16xlarge
    | `String "r5.24xlarge" -> R5_24xlarge
    | `String "r5a.large" -> R5a_large
    | `String "r5a.xlarge" -> R5a_xlarge
    | `String "r5a.2xlarge" -> R5a_2xlarge
    | `String "r5a.4xlarge" -> R5a_4xlarge
    | `String "r5a.8xlarge" -> R5a_8xlarge
    | `String "r5a.12xlarge" -> R5a_12xlarge
    | `String "r5a.16xlarge" -> R5a_16xlarge
    | `String "r5a.24xlarge" -> R5a_24xlarge
    | `String "m3.medium" -> M3_medium
    | `String "m3.large" -> M3_large
    | `String "m3.xlarge" -> M3_xlarge
    | `String "m3.2xlarge" -> M3_2xlarge
    | `String "m4.large" -> M4_large
    | `String "m4.xlarge" -> M4_xlarge
    | `String "m4.2xlarge" -> M4_2xlarge
    | `String "m4.4xlarge" -> M4_4xlarge
    | `String "m4.10xlarge" -> M4_10xlarge
    | `String "m5.large" -> M5_large
    | `String "m5.xlarge" -> M5_xlarge
    | `String "m5.2xlarge" -> M5_2xlarge
    | `String "m5.4xlarge" -> M5_4xlarge
    | `String "m5.8xlarge" -> M5_8xlarge
    | `String "m5.12xlarge" -> M5_12xlarge
    | `String "m5.16xlarge" -> M5_16xlarge
    | `String "m5.24xlarge" -> M5_24xlarge
    | `String "m5a.large" -> M5a_large
    | `String "m5a.xlarge" -> M5a_xlarge
    | `String "m5a.2xlarge" -> M5a_2xlarge
    | `String "m5a.4xlarge" -> M5a_4xlarge
    | `String "m5a.8xlarge" -> M5a_8xlarge
    | `String "m5a.12xlarge" -> M5a_12xlarge
    | `String "m5a.16xlarge" -> M5a_16xlarge
    | `String "m5a.24xlarge" -> M5a_24xlarge
    | `String "c5d.large" -> C5d_large
    | `String "c5d.xlarge" -> C5d_xlarge
    | `String "c5d.2xlarge" -> C5d_2xlarge
    | `String "c5d.4xlarge" -> C5d_4xlarge
    | `String "c5d.9xlarge" -> C5d_9xlarge
    | `String "c5d.12xlarge" -> C5d_12xlarge
    | `String "c5d.18xlarge" -> C5d_18xlarge
    | `String "c5d.24xlarge" -> C5d_24xlarge
    | `String "c6a.large" -> C6a_large
    | `String "c6a.xlarge" -> C6a_xlarge
    | `String "c6a.2xlarge" -> C6a_2xlarge
    | `String "c6a.4xlarge" -> C6a_4xlarge
    | `String "c6a.8xlarge" -> C6a_8xlarge
    | `String "c6a.12xlarge" -> C6a_12xlarge
    | `String "c6a.16xlarge" -> C6a_16xlarge
    | `String "c6a.24xlarge" -> C6a_24xlarge
    | `String "c6i.large" -> C6i_large
    | `String "c6i.xlarge" -> C6i_xlarge
    | `String "c6i.2xlarge" -> C6i_2xlarge
    | `String "c6i.4xlarge" -> C6i_4xlarge
    | `String "c6i.8xlarge" -> C6i_8xlarge
    | `String "c6i.12xlarge" -> C6i_12xlarge
    | `String "c6i.16xlarge" -> C6i_16xlarge
    | `String "c6i.24xlarge" -> C6i_24xlarge
    | `String "r5d.large" -> R5d_large
    | `String "r5d.xlarge" -> R5d_xlarge
    | `String "r5d.2xlarge" -> R5d_2xlarge
    | `String "r5d.4xlarge" -> R5d_4xlarge
    | `String "r5d.8xlarge" -> R5d_8xlarge
    | `String "r5d.12xlarge" -> R5d_12xlarge
    | `String "r5d.16xlarge" -> R5d_16xlarge
    | `String "r5d.24xlarge" -> R5d_24xlarge
    | `String "m6g.medium" -> M6g_medium
    | `String "m6g.large" -> M6g_large
    | `String "m6g.xlarge" -> M6g_xlarge
    | `String "m6g.2xlarge" -> M6g_2xlarge
    | `String "m6g.4xlarge" -> M6g_4xlarge
    | `String "m6g.8xlarge" -> M6g_8xlarge
    | `String "m6g.12xlarge" -> M6g_12xlarge
    | `String "m6g.16xlarge" -> M6g_16xlarge
    | `String "c6g.medium" -> C6g_medium
    | `String "c6g.large" -> C6g_large
    | `String "c6g.xlarge" -> C6g_xlarge
    | `String "c6g.2xlarge" -> C6g_2xlarge
    | `String "c6g.4xlarge" -> C6g_4xlarge
    | `String "c6g.8xlarge" -> C6g_8xlarge
    | `String "c6g.12xlarge" -> C6g_12xlarge
    | `String "c6g.16xlarge" -> C6g_16xlarge
    | `String "r6g.medium" -> R6g_medium
    | `String "r6g.large" -> R6g_large
    | `String "r6g.xlarge" -> R6g_xlarge
    | `String "r6g.2xlarge" -> R6g_2xlarge
    | `String "r6g.4xlarge" -> R6g_4xlarge
    | `String "r6g.8xlarge" -> R6g_8xlarge
    | `String "r6g.12xlarge" -> R6g_12xlarge
    | `String "r6g.16xlarge" -> R6g_16xlarge
    | `String "c6gn.medium" -> C6gn_medium
    | `String "c6gn.large" -> C6gn_large
    | `String "c6gn.xlarge" -> C6gn_xlarge
    | `String "c6gn.2xlarge" -> C6gn_2xlarge
    | `String "c6gn.4xlarge" -> C6gn_4xlarge
    | `String "c6gn.8xlarge" -> C6gn_8xlarge
    | `String "c6gn.12xlarge" -> C6gn_12xlarge
    | `String "c6gn.16xlarge" -> C6gn_16xlarge
    | `String "c7g.medium" -> C7g_medium
    | `String "c7g.large" -> C7g_large
    | `String "c7g.xlarge" -> C7g_xlarge
    | `String "c7g.2xlarge" -> C7g_2xlarge
    | `String "c7g.4xlarge" -> C7g_4xlarge
    | `String "c7g.8xlarge" -> C7g_8xlarge
    | `String "c7g.12xlarge" -> C7g_12xlarge
    | `String "c7g.16xlarge" -> C7g_16xlarge
    | `String "r7g.medium" -> R7g_medium
    | `String "r7g.large" -> R7g_large
    | `String "r7g.xlarge" -> R7g_xlarge
    | `String "r7g.2xlarge" -> R7g_2xlarge
    | `String "r7g.4xlarge" -> R7g_4xlarge
    | `String "r7g.8xlarge" -> R7g_8xlarge
    | `String "r7g.12xlarge" -> R7g_12xlarge
    | `String "r7g.16xlarge" -> R7g_16xlarge
    | `String "m7g.medium" -> M7g_medium
    | `String "m7g.large" -> M7g_large
    | `String "m7g.xlarge" -> M7g_xlarge
    | `String "m7g.2xlarge" -> M7g_2xlarge
    | `String "m7g.4xlarge" -> M7g_4xlarge
    | `String "m7g.8xlarge" -> M7g_8xlarge
    | `String "m7g.12xlarge" -> M7g_12xlarge
    | `String "m7g.16xlarge" -> M7g_16xlarge
    | `String "g5g.xlarge" -> G5g_xlarge
    | `String "g5g.2xlarge" -> G5g_2xlarge
    | `String "g5g.4xlarge" -> G5g_4xlarge
    | `String "g5g.8xlarge" -> G5g_8xlarge
    | `String "g5g.16xlarge" -> G5g_16xlarge
    | `String "r6i.large" -> R6i_large
    | `String "r6i.xlarge" -> R6i_xlarge
    | `String "r6i.2xlarge" -> R6i_2xlarge
    | `String "r6i.4xlarge" -> R6i_4xlarge
    | `String "r6i.8xlarge" -> R6i_8xlarge
    | `String "r6i.12xlarge" -> R6i_12xlarge
    | `String "r6i.16xlarge" -> R6i_16xlarge
    | `String "c6gd.medium" -> C6gd_medium
    | `String "c6gd.large" -> C6gd_large
    | `String "c6gd.xlarge" -> C6gd_xlarge
    | `String "c6gd.2xlarge" -> C6gd_2xlarge
    | `String "c6gd.4xlarge" -> C6gd_4xlarge
    | `String "c6gd.8xlarge" -> C6gd_8xlarge
    | `String "c6gd.12xlarge" -> C6gd_12xlarge
    | `String "c6gd.16xlarge" -> C6gd_16xlarge
    | `String "c6in.large" -> C6in_large
    | `String "c6in.xlarge" -> C6in_xlarge
    | `String "c6in.2xlarge" -> C6in_2xlarge
    | `String "c6in.4xlarge" -> C6in_4xlarge
    | `String "c6in.8xlarge" -> C6in_8xlarge
    | `String "c6in.12xlarge" -> C6in_12xlarge
    | `String "c6in.16xlarge" -> C6in_16xlarge
    | `String "c7a.medium" -> C7a_medium
    | `String "c7a.large" -> C7a_large
    | `String "c7a.xlarge" -> C7a_xlarge
    | `String "c7a.2xlarge" -> C7a_2xlarge
    | `String "c7a.4xlarge" -> C7a_4xlarge
    | `String "c7a.8xlarge" -> C7a_8xlarge
    | `String "c7a.12xlarge" -> C7a_12xlarge
    | `String "c7a.16xlarge" -> C7a_16xlarge
    | `String "c7gd.medium" -> C7gd_medium
    | `String "c7gd.large" -> C7gd_large
    | `String "c7gd.xlarge" -> C7gd_xlarge
    | `String "c7gd.2xlarge" -> C7gd_2xlarge
    | `String "c7gd.4xlarge" -> C7gd_4xlarge
    | `String "c7gd.8xlarge" -> C7gd_8xlarge
    | `String "c7gd.12xlarge" -> C7gd_12xlarge
    | `String "c7gd.16xlarge" -> C7gd_16xlarge
    | `String "c7gn.medium" -> C7gn_medium
    | `String "c7gn.large" -> C7gn_large
    | `String "c7gn.xlarge" -> C7gn_xlarge
    | `String "c7gn.2xlarge" -> C7gn_2xlarge
    | `String "c7gn.4xlarge" -> C7gn_4xlarge
    | `String "c7gn.8xlarge" -> C7gn_8xlarge
    | `String "c7gn.12xlarge" -> C7gn_12xlarge
    | `String "c7gn.16xlarge" -> C7gn_16xlarge
    | `String "c7i.large" -> C7i_large
    | `String "c7i.xlarge" -> C7i_xlarge
    | `String "c7i.2xlarge" -> C7i_2xlarge
    | `String "c7i.4xlarge" -> C7i_4xlarge
    | `String "c7i.8xlarge" -> C7i_8xlarge
    | `String "c7i.12xlarge" -> C7i_12xlarge
    | `String "c7i.16xlarge" -> C7i_16xlarge
    | `String "m6a.large" -> M6a_large
    | `String "m6a.xlarge" -> M6a_xlarge
    | `String "m6a.2xlarge" -> M6a_2xlarge
    | `String "m6a.4xlarge" -> M6a_4xlarge
    | `String "m6a.8xlarge" -> M6a_8xlarge
    | `String "m6a.12xlarge" -> M6a_12xlarge
    | `String "m6a.16xlarge" -> M6a_16xlarge
    | `String "m6gd.medium" -> M6gd_medium
    | `String "m6gd.large" -> M6gd_large
    | `String "m6gd.xlarge" -> M6gd_xlarge
    | `String "m6gd.2xlarge" -> M6gd_2xlarge
    | `String "m6gd.4xlarge" -> M6gd_4xlarge
    | `String "m6gd.8xlarge" -> M6gd_8xlarge
    | `String "m6gd.12xlarge" -> M6gd_12xlarge
    | `String "m6gd.16xlarge" -> M6gd_16xlarge
    | `String "m6i.large" -> M6i_large
    | `String "m6i.xlarge" -> M6i_xlarge
    | `String "m6i.2xlarge" -> M6i_2xlarge
    | `String "m6i.4xlarge" -> M6i_4xlarge
    | `String "m6i.8xlarge" -> M6i_8xlarge
    | `String "m6i.12xlarge" -> M6i_12xlarge
    | `String "m6i.16xlarge" -> M6i_16xlarge
    | `String "m7a.medium" -> M7a_medium
    | `String "m7a.large" -> M7a_large
    | `String "m7a.xlarge" -> M7a_xlarge
    | `String "m7a.2xlarge" -> M7a_2xlarge
    | `String "m7a.4xlarge" -> M7a_4xlarge
    | `String "m7a.8xlarge" -> M7a_8xlarge
    | `String "m7a.12xlarge" -> M7a_12xlarge
    | `String "m7a.16xlarge" -> M7a_16xlarge
    | `String "m7gd.medium" -> M7gd_medium
    | `String "m7gd.large" -> M7gd_large
    | `String "m7gd.xlarge" -> M7gd_xlarge
    | `String "m7gd.2xlarge" -> M7gd_2xlarge
    | `String "m7gd.4xlarge" -> M7gd_4xlarge
    | `String "m7gd.8xlarge" -> M7gd_8xlarge
    | `String "m7gd.12xlarge" -> M7gd_12xlarge
    | `String "m7gd.16xlarge" -> M7gd_16xlarge
    | `String "m7i.large" -> M7i_large
    | `String "m7i.xlarge" -> M7i_xlarge
    | `String "m7i.2xlarge" -> M7i_2xlarge
    | `String "m7i.4xlarge" -> M7i_4xlarge
    | `String "m7i.8xlarge" -> M7i_8xlarge
    | `String "m7i.12xlarge" -> M7i_12xlarge
    | `String "m7i.16xlarge" -> M7i_16xlarge
    | `String "r6gd.medium" -> R6gd_medium
    | `String "r6gd.large" -> R6gd_large
    | `String "r6gd.xlarge" -> R6gd_xlarge
    | `String "r6gd.2xlarge" -> R6gd_2xlarge
    | `String "r6gd.4xlarge" -> R6gd_4xlarge
    | `String "r6gd.8xlarge" -> R6gd_8xlarge
    | `String "r6gd.12xlarge" -> R6gd_12xlarge
    | `String "r6gd.16xlarge" -> R6gd_16xlarge
    | `String "r7a.medium" -> R7a_medium
    | `String "r7a.large" -> R7a_large
    | `String "r7a.xlarge" -> R7a_xlarge
    | `String "r7a.2xlarge" -> R7a_2xlarge
    | `String "r7a.4xlarge" -> R7a_4xlarge
    | `String "r7a.8xlarge" -> R7a_8xlarge
    | `String "r7a.12xlarge" -> R7a_12xlarge
    | `String "r7a.16xlarge" -> R7a_16xlarge
    | `String "r7gd.medium" -> R7gd_medium
    | `String "r7gd.large" -> R7gd_large
    | `String "r7gd.xlarge" -> R7gd_xlarge
    | `String "r7gd.2xlarge" -> R7gd_2xlarge
    | `String "r7gd.4xlarge" -> R7gd_4xlarge
    | `String "r7gd.8xlarge" -> R7gd_8xlarge
    | `String "r7gd.12xlarge" -> R7gd_12xlarge
    | `String "r7gd.16xlarge" -> R7gd_16xlarge
    | `String "r7i.large" -> R7i_large
    | `String "r7i.xlarge" -> R7i_xlarge
    | `String "r7i.2xlarge" -> R7i_2xlarge
    | `String "r7i.4xlarge" -> R7i_4xlarge
    | `String "r7i.8xlarge" -> R7i_8xlarge
    | `String "r7i.12xlarge" -> R7i_12xlarge
    | `String "r7i.16xlarge" -> R7i_16xlarge
    | `String "r7i.24xlarge" -> R7i_24xlarge
    | `String "r7i.48xlarge" -> R7i_48xlarge
    | `String "c5ad.large" -> C5ad_large
    | `String "c5ad.xlarge" -> C5ad_xlarge
    | `String "c5ad.2xlarge" -> C5ad_2xlarge
    | `String "c5ad.4xlarge" -> C5ad_4xlarge
    | `String "c5ad.8xlarge" -> C5ad_8xlarge
    | `String "c5ad.12xlarge" -> C5ad_12xlarge
    | `String "c5ad.16xlarge" -> C5ad_16xlarge
    | `String "c5ad.24xlarge" -> C5ad_24xlarge
    | `String "c5n.large" -> C5n_large
    | `String "c5n.xlarge" -> C5n_xlarge
    | `String "c5n.2xlarge" -> C5n_2xlarge
    | `String "c5n.4xlarge" -> C5n_4xlarge
    | `String "c5n.9xlarge" -> C5n_9xlarge
    | `String "c5n.18xlarge" -> C5n_18xlarge
    | `String "r5ad.large" -> R5ad_large
    | `String "r5ad.xlarge" -> R5ad_xlarge
    | `String "r5ad.2xlarge" -> R5ad_2xlarge
    | `String "r5ad.4xlarge" -> R5ad_4xlarge
    | `String "r5ad.8xlarge" -> R5ad_8xlarge
    | `String "r5ad.12xlarge" -> R5ad_12xlarge
    | `String "r5ad.16xlarge" -> R5ad_16xlarge
    | `String "r5ad.24xlarge" -> R5ad_24xlarge
    | `String "c6id.large" -> C6id_large
    | `String "c6id.xlarge" -> C6id_xlarge
    | `String "c6id.2xlarge" -> C6id_2xlarge
    | `String "c6id.4xlarge" -> C6id_4xlarge
    | `String "c6id.8xlarge" -> C6id_8xlarge
    | `String "c6id.12xlarge" -> C6id_12xlarge
    | `String "c6id.16xlarge" -> C6id_16xlarge
    | `String "c6id.24xlarge" -> C6id_24xlarge
    | `String "c6id.32xlarge" -> C6id_32xlarge
    | `String "c8g.medium" -> C8g_medium
    | `String "c8g.large" -> C8g_large
    | `String "c8g.xlarge" -> C8g_xlarge
    | `String "c8g.2xlarge" -> C8g_2xlarge
    | `String "c8g.4xlarge" -> C8g_4xlarge
    | `String "c8g.8xlarge" -> C8g_8xlarge
    | `String "c8g.12xlarge" -> C8g_12xlarge
    | `String "c8g.16xlarge" -> C8g_16xlarge
    | `String "c8g.24xlarge" -> C8g_24xlarge
    | `String "c8g.48xlarge" -> C8g_48xlarge
    | `String "m5ad.large" -> M5ad_large
    | `String "m5ad.xlarge" -> M5ad_xlarge
    | `String "m5ad.2xlarge" -> M5ad_2xlarge
    | `String "m5ad.4xlarge" -> M5ad_4xlarge
    | `String "m5ad.8xlarge" -> M5ad_8xlarge
    | `String "m5ad.12xlarge" -> M5ad_12xlarge
    | `String "m5ad.16xlarge" -> M5ad_16xlarge
    | `String "m5ad.24xlarge" -> M5ad_24xlarge
    | `String "m5d.large" -> M5d_large
    | `String "m5d.xlarge" -> M5d_xlarge
    | `String "m5d.2xlarge" -> M5d_2xlarge
    | `String "m5d.4xlarge" -> M5d_4xlarge
    | `String "m5d.8xlarge" -> M5d_8xlarge
    | `String "m5d.12xlarge" -> M5d_12xlarge
    | `String "m5d.16xlarge" -> M5d_16xlarge
    | `String "m5d.24xlarge" -> M5d_24xlarge
    | `String "m5dn.large" -> M5dn_large
    | `String "m5dn.xlarge" -> M5dn_xlarge
    | `String "m5dn.2xlarge" -> M5dn_2xlarge
    | `String "m5dn.4xlarge" -> M5dn_4xlarge
    | `String "m5dn.8xlarge" -> M5dn_8xlarge
    | `String "m5dn.12xlarge" -> M5dn_12xlarge
    | `String "m5dn.16xlarge" -> M5dn_16xlarge
    | `String "m5dn.24xlarge" -> M5dn_24xlarge
    | `String "m5n.large" -> M5n_large
    | `String "m5n.xlarge" -> M5n_xlarge
    | `String "m5n.2xlarge" -> M5n_2xlarge
    | `String "m5n.4xlarge" -> M5n_4xlarge
    | `String "m5n.8xlarge" -> M5n_8xlarge
    | `String "m5n.12xlarge" -> M5n_12xlarge
    | `String "m5n.16xlarge" -> M5n_16xlarge
    | `String "m5n.24xlarge" -> M5n_24xlarge
    | `String "m6id.large" -> M6id_large
    | `String "m6id.xlarge" -> M6id_xlarge
    | `String "m6id.2xlarge" -> M6id_2xlarge
    | `String "m6id.4xlarge" -> M6id_4xlarge
    | `String "m6id.8xlarge" -> M6id_8xlarge
    | `String "m6id.12xlarge" -> M6id_12xlarge
    | `String "m6id.16xlarge" -> M6id_16xlarge
    | `String "m6id.24xlarge" -> M6id_24xlarge
    | `String "m6id.32xlarge" -> M6id_32xlarge
    | `String "m6idn.large" -> M6idn_large
    | `String "m6idn.xlarge" -> M6idn_xlarge
    | `String "m6idn.2xlarge" -> M6idn_2xlarge
    | `String "m6idn.4xlarge" -> M6idn_4xlarge
    | `String "m6idn.8xlarge" -> M6idn_8xlarge
    | `String "m6idn.12xlarge" -> M6idn_12xlarge
    | `String "m6idn.16xlarge" -> M6idn_16xlarge
    | `String "m6idn.24xlarge" -> M6idn_24xlarge
    | `String "m6idn.32xlarge" -> M6idn_32xlarge
    | `String "m6in.large" -> M6in_large
    | `String "m6in.xlarge" -> M6in_xlarge
    | `String "m6in.2xlarge" -> M6in_2xlarge
    | `String "m6in.4xlarge" -> M6in_4xlarge
    | `String "m6in.8xlarge" -> M6in_8xlarge
    | `String "m6in.12xlarge" -> M6in_12xlarge
    | `String "m6in.16xlarge" -> M6in_16xlarge
    | `String "m6in.24xlarge" -> M6in_24xlarge
    | `String "m6in.32xlarge" -> M6in_32xlarge
    | `String "m8g.medium" -> M8g_medium
    | `String "m8g.large" -> M8g_large
    | `String "m8g.xlarge" -> M8g_xlarge
    | `String "m8g.2xlarge" -> M8g_2xlarge
    | `String "m8g.4xlarge" -> M8g_4xlarge
    | `String "m8g.8xlarge" -> M8g_8xlarge
    | `String "m8g.12xlarge" -> M8g_12xlarge
    | `String "m8g.16xlarge" -> M8g_16xlarge
    | `String "m8g.24xlarge" -> M8g_24xlarge
    | `String "m8g.48xlarge" -> M8g_48xlarge
    | `String "r5dn.large" -> R5dn_large
    | `String "r5dn.xlarge" -> R5dn_xlarge
    | `String "r5dn.2xlarge" -> R5dn_2xlarge
    | `String "r5dn.4xlarge" -> R5dn_4xlarge
    | `String "r5dn.8xlarge" -> R5dn_8xlarge
    | `String "r5dn.12xlarge" -> R5dn_12xlarge
    | `String "r5dn.16xlarge" -> R5dn_16xlarge
    | `String "r5dn.24xlarge" -> R5dn_24xlarge
    | `String "r5n.large" -> R5n_large
    | `String "r5n.xlarge" -> R5n_xlarge
    | `String "r5n.2xlarge" -> R5n_2xlarge
    | `String "r5n.4xlarge" -> R5n_4xlarge
    | `String "r5n.8xlarge" -> R5n_8xlarge
    | `String "r5n.12xlarge" -> R5n_12xlarge
    | `String "r5n.16xlarge" -> R5n_16xlarge
    | `String "r5n.24xlarge" -> R5n_24xlarge
    | `String "r6a.large" -> R6a_large
    | `String "r6a.xlarge" -> R6a_xlarge
    | `String "r6a.2xlarge" -> R6a_2xlarge
    | `String "r6a.4xlarge" -> R6a_4xlarge
    | `String "r6a.8xlarge" -> R6a_8xlarge
    | `String "r6a.12xlarge" -> R6a_12xlarge
    | `String "r6a.16xlarge" -> R6a_16xlarge
    | `String "r6a.24xlarge" -> R6a_24xlarge
    | `String "r6a.32xlarge" -> R6a_32xlarge
    | `String "r6a.48xlarge" -> R6a_48xlarge
    | `String "r6id.large" -> R6id_large
    | `String "r6id.xlarge" -> R6id_xlarge
    | `String "r6id.2xlarge" -> R6id_2xlarge
    | `String "r6id.4xlarge" -> R6id_4xlarge
    | `String "r6id.8xlarge" -> R6id_8xlarge
    | `String "r6id.12xlarge" -> R6id_12xlarge
    | `String "r6id.16xlarge" -> R6id_16xlarge
    | `String "r6id.24xlarge" -> R6id_24xlarge
    | `String "r6id.32xlarge" -> R6id_32xlarge
    | `String "r6idn.large" -> R6idn_large
    | `String "r6idn.xlarge" -> R6idn_xlarge
    | `String "r6idn.2xlarge" -> R6idn_2xlarge
    | `String "r6idn.4xlarge" -> R6idn_4xlarge
    | `String "r6idn.8xlarge" -> R6idn_8xlarge
    | `String "r6idn.12xlarge" -> R6idn_12xlarge
    | `String "r6idn.16xlarge" -> R6idn_16xlarge
    | `String "r6idn.24xlarge" -> R6idn_24xlarge
    | `String "r6idn.32xlarge" -> R6idn_32xlarge
    | `String "r6in.large" -> R6in_large
    | `String "r6in.xlarge" -> R6in_xlarge
    | `String "r6in.2xlarge" -> R6in_2xlarge
    | `String "r6in.4xlarge" -> R6in_4xlarge
    | `String "r6in.8xlarge" -> R6in_8xlarge
    | `String "r6in.12xlarge" -> R6in_12xlarge
    | `String "r6in.16xlarge" -> R6in_16xlarge
    | `String "r6in.24xlarge" -> R6in_24xlarge
    | `String "r6in.32xlarge" -> R6in_32xlarge
    | `String "r8g.medium" -> R8g_medium
    | `String "r8g.large" -> R8g_large
    | `String "r8g.xlarge" -> R8g_xlarge
    | `String "r8g.2xlarge" -> R8g_2xlarge
    | `String "r8g.4xlarge" -> R8g_4xlarge
    | `String "r8g.8xlarge" -> R8g_8xlarge
    | `String "r8g.12xlarge" -> R8g_12xlarge
    | `String "r8g.16xlarge" -> R8g_16xlarge
    | `String "r8g.24xlarge" -> R8g_24xlarge
    | `String "r8g.48xlarge" -> R8g_48xlarge
    | `String "m4.16xlarge" -> M4_16xlarge
    | `String "c6a.32xlarge" -> C6a_32xlarge
    | `String "c6a.48xlarge" -> C6a_48xlarge
    | `String "c6i.32xlarge" -> C6i_32xlarge
    | `String "r6i.24xlarge" -> R6i_24xlarge
    | `String "r6i.32xlarge" -> R6i_32xlarge
    | `String "c6in.24xlarge" -> C6in_24xlarge
    | `String "c6in.32xlarge" -> C6in_32xlarge
    | `String "c7a.24xlarge" -> C7a_24xlarge
    | `String "c7a.32xlarge" -> C7a_32xlarge
    | `String "c7a.48xlarge" -> C7a_48xlarge
    | `String "c7i.24xlarge" -> C7i_24xlarge
    | `String "c7i.48xlarge" -> C7i_48xlarge
    | `String "m6a.24xlarge" -> M6a_24xlarge
    | `String "m6a.32xlarge" -> M6a_32xlarge
    | `String "m6a.48xlarge" -> M6a_48xlarge
    | `String "m6i.24xlarge" -> M6i_24xlarge
    | `String "m6i.32xlarge" -> M6i_32xlarge
    | `String "m7a.24xlarge" -> M7a_24xlarge
    | `String "m7a.32xlarge" -> M7a_32xlarge
    | `String "m7a.48xlarge" -> M7a_48xlarge
    | `String "m7i.24xlarge" -> M7i_24xlarge
    | `String "m7i.48xlarge" -> M7i_48xlarge
    | `String "r7a.24xlarge" -> R7a_24xlarge
    | `String "r7a.32xlarge" -> R7a_32xlarge
    | `String "r7a.48xlarge" -> R7a_48xlarge
    | `String value -> raise (deserialize_unknown_enum_value_error path "EC2InstanceType" value)
    | _ -> raise (deserialize_wrong_type_error path "EC2InstanceType")
     : ec2_instance_type)
    : ec2_instance_type)

let location_string_model_of_yojson = string_of_yojson

let compute_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "ACTIVE" -> ACTIVE
    | `String "TERMINATING" -> TERMINATING
    | `String "IMPAIRED" -> IMPAIRED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComputeStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ComputeStatus")
     : compute_status)
    : compute_status)

let dns_name_of_yojson = string_of_yojson
let ip_address_of_yojson = string_of_yojson
let compute_arn_of_yojson = string_of_yojson
let compute_name_of_yojson = string_of_yojson
let fleet_arn_of_yojson = string_of_yojson

let compute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     compute_name = option_of_yojson (value_for_key compute_name_of_yojson "ComputeName") _list path;
     compute_arn = option_of_yojson (value_for_key compute_arn_of_yojson "ComputeArn") _list path;
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "IpAddress") _list path;
     dns_name = option_of_yojson (value_for_key dns_name_of_yojson "DnsName") _list path;
     compute_status =
       option_of_yojson (value_for_key compute_status_of_yojson "ComputeStatus") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
     type_ = option_of_yojson (value_for_key ec2_instance_type_of_yojson "Type") _list path;
     game_lift_service_sdk_endpoint =
       option_of_yojson
         (value_for_key game_lift_service_sdk_endpoint_output_of_yojson "GameLiftServiceSdkEndpoint")
         _list path;
     game_lift_agent_endpoint =
       option_of_yojson
         (value_for_key game_lift_agent_endpoint_output_of_yojson "GameLiftAgentEndpoint")
         _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     container_attributes =
       option_of_yojson
         (value_for_key container_attributes_of_yojson "ContainerAttributes")
         _list path;
     game_server_container_group_definition_arn =
       option_of_yojson
         (value_for_key container_group_definition_name_or_arn_of_yojson
            "GameServerContainerGroupDefinitionArn")
         _list path;
   }
    : compute)

let compute_auth_token_of_yojson = string_of_yojson
let compute_list_of_yojson tree path = list_of_yojson compute_of_yojson tree path
let compute_name_or_arn_of_yojson = string_of_yojson

let compute_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EC2" -> EC2
    | `String "ANYWHERE" -> ANYWHERE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComputeType" value)
    | _ -> raise (deserialize_wrong_type_error path "ComputeType")
     : compute_type)
    : compute_type)

let port_number_of_yojson = int_of_yojson

let connection_port_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     from_port = value_for_key port_number_of_yojson "FromPort" _list path;
     to_port = value_for_key port_number_of_yojson "ToPort" _list path;
   }
    : connection_port_range)

let non_zero_and255_max_string_of_yojson = string_of_yojson

let container_command_string_list_of_yojson tree path =
  list_of_yojson non_zero_and255_max_string_of_yojson tree path

let container_dependency_condition_of_yojson (tree : t) path =
  ((match tree with
    | `String "START" -> START
    | `String "COMPLETE" -> COMPLETE
    | `String "SUCCESS" -> SUCCESS
    | `String "HEALTHY" -> HEALTHY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerDependencyCondition" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerDependencyCondition")
     : container_dependency_condition)
    : container_dependency_condition)

let container_dependency_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name =
       value_for_key non_zero_and128_max_ascii_string_of_yojson "ContainerName" _list path;
     condition = value_for_key container_dependency_condition_of_yojson "Condition" _list path;
   }
    : container_dependency)

let container_dependency_list_of_yojson tree path =
  list_of_yojson container_dependency_of_yojson tree path

let container_environment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key non_zero_and255_max_string_of_yojson "Name" _list path;
     value = value_for_key non_zero_and255_max_string_of_yojson "Value" _list path;
   }
    : container_environment)

let container_environment_list_of_yojson tree path =
  list_of_yojson container_environment_of_yojson tree path

let player_gateway_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String "REQUIRED" -> REQUIRED
    | `String value -> raise (deserialize_unknown_enum_value_error path "PlayerGatewayMode" value)
    | _ -> raise (deserialize_wrong_type_error path "PlayerGatewayMode")
     : player_gateway_mode)
    : player_gateway_mode)

let player_gateway_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "PlayerGatewayStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PlayerGatewayStatus")
     : player_gateway_status)
    : player_gateway_status)

let container_fleet_location_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "CREATING" -> CREATING
    | `String "CREATED" -> CREATED
    | `String "ACTIVATING" -> ACTIVATING
    | `String "ACTIVE" -> ACTIVE
    | `String "UPDATING" -> UPDATING
    | `String "DELETING" -> DELETING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerFleetLocationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerFleetLocationStatus")
     : container_fleet_location_status)
    : container_fleet_location_status)

let container_fleet_location_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
     status =
       option_of_yojson
         (value_for_key container_fleet_location_status_of_yojson "Status")
         _list path;
     player_gateway_status =
       option_of_yojson
         (value_for_key player_gateway_status_of_yojson "PlayerGatewayStatus")
         _list path;
   }
    : container_fleet_location_attributes)

let container_fleet_location_attributes_list_of_yojson tree path =
  list_of_yojson container_fleet_location_attributes_of_yojson tree path

let log_group_arn_string_model_of_yojson = string_of_yojson

let log_destination_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "CLOUDWATCH" -> CLOUDWATCH
    | `String "S3" -> S3
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogDestination" value)
    | _ -> raise (deserialize_wrong_type_error path "LogDestination")
     : log_destination)
    : log_destination)

let log_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_destination =
       option_of_yojson (value_for_key log_destination_of_yojson "LogDestination") _list path;
     s3_bucket_name =
       option_of_yojson (value_for_key non_empty_string_of_yojson "S3BucketName") _list path;
     log_group_arn =
       option_of_yojson
         (value_for_key log_group_arn_string_model_of_yojson "LogGroupArn")
         _list path;
   }
    : log_configuration)

let deployment_id_of_yojson = string_of_yojson

let deployment_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latest_deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "LatestDeploymentId") _list path;
   }
    : deployment_details)

let container_fleet_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "CREATING" -> CREATING
    | `String "CREATED" -> CREATED
    | `String "ACTIVATING" -> ACTIVATING
    | `String "ACTIVE" -> ACTIVE
    | `String "UPDATING" -> UPDATING
    | `String "DELETING" -> DELETING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerFleetStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerFleetStatus")
     : container_fleet_status)
    : container_fleet_status)

let whole_number_of_yojson = int_of_yojson

let game_session_creation_limit_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     new_game_sessions_per_creator =
       option_of_yojson
         (value_for_key whole_number_of_yojson "NewGameSessionsPerCreator")
         _list path;
     policy_period_in_minutes =
       option_of_yojson (value_for_key whole_number_of_yojson "PolicyPeriodInMinutes") _list path;
   }
    : game_session_creation_limit_policy)

let protection_policy_of_yojson (tree : t) path =
  ((match tree with
    | `String "NoProtection" -> NoProtection
    | `String "FullProtection" -> FullProtection
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProtectionPolicy" value)
    | _ -> raise (deserialize_wrong_type_error path "ProtectionPolicy")
     : protection_policy)
    : protection_policy)

let metric_group_of_yojson = string_of_yojson
let metric_group_list_of_yojson tree path = list_of_yojson metric_group_of_yojson tree path
let non_zero_and_max_string_of_yojson = string_of_yojson

let container_fleet_billing_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ON_DEMAND" -> ON_DEMAND
    | `String "SPOT" -> SPOT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerFleetBillingType" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerFleetBillingType")
     : container_fleet_billing_type)
    : container_fleet_billing_type)

let maximum_game_server_container_groups_per_instance_of_yojson = int_of_yojson
let game_server_container_groups_per_instance_of_yojson = int_of_yojson

let ip_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "TCP" -> TCP
    | `String "UDP" -> UDP
    | `String value -> raise (deserialize_unknown_enum_value_error path "IpProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "IpProtocol")
     : ip_protocol)
    : ip_protocol)

let ip_range_of_yojson = string_of_yojson

let ip_permission_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     from_port = value_for_key port_number_of_yojson "FromPort" _list path;
     to_port = value_for_key port_number_of_yojson "ToPort" _list path;
     ip_range = value_for_key ip_range_of_yojson "IpRange" _list path;
     protocol = value_for_key ip_protocol_of_yojson "Protocol" _list path;
   }
    : ip_permission)

let ip_permissions_list_of_yojson tree path = list_of_yojson ip_permission_of_yojson tree path
let container_group_definition_arn_of_yojson = string_of_yojson
let container_group_definition_name_of_yojson = string_of_yojson
let iam_role_arn_of_yojson = string_of_yojson

let container_fleet_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     fleet_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "FleetRoleArn") _list path;
     game_server_container_group_definition_name =
       option_of_yojson
         (value_for_key container_group_definition_name_of_yojson
            "GameServerContainerGroupDefinitionName")
         _list path;
     game_server_container_group_definition_arn =
       option_of_yojson
         (value_for_key container_group_definition_arn_of_yojson
            "GameServerContainerGroupDefinitionArn")
         _list path;
     per_instance_container_group_definition_name =
       option_of_yojson
         (value_for_key container_group_definition_name_of_yojson
            "PerInstanceContainerGroupDefinitionName")
         _list path;
     per_instance_container_group_definition_arn =
       option_of_yojson
         (value_for_key container_group_definition_arn_of_yojson
            "PerInstanceContainerGroupDefinitionArn")
         _list path;
     instance_connection_port_range =
       option_of_yojson
         (value_for_key connection_port_range_of_yojson "InstanceConnectionPortRange")
         _list path;
     instance_inbound_permissions =
       option_of_yojson
         (value_for_key ip_permissions_list_of_yojson "InstanceInboundPermissions")
         _list path;
     game_server_container_groups_per_instance =
       option_of_yojson
         (value_for_key game_server_container_groups_per_instance_of_yojson
            "GameServerContainerGroupsPerInstance")
         _list path;
     maximum_game_server_container_groups_per_instance =
       option_of_yojson
         (value_for_key maximum_game_server_container_groups_per_instance_of_yojson
            "MaximumGameServerContainerGroupsPerInstance")
         _list path;
     instance_type =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "InstanceType") _list path;
     billing_type =
       option_of_yojson
         (value_for_key container_fleet_billing_type_of_yojson "BillingType")
         _list path;
     description =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Description") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     metric_groups =
       option_of_yojson (value_for_key metric_group_list_of_yojson "MetricGroups") _list path;
     new_game_session_protection_policy =
       option_of_yojson
         (value_for_key protection_policy_of_yojson "NewGameSessionProtectionPolicy")
         _list path;
     game_session_creation_limit_policy =
       option_of_yojson
         (value_for_key game_session_creation_limit_policy_of_yojson
            "GameSessionCreationLimitPolicy")
         _list path;
     status = option_of_yojson (value_for_key container_fleet_status_of_yojson "Status") _list path;
     deployment_details =
       option_of_yojson (value_for_key deployment_details_of_yojson "DeploymentDetails") _list path;
     log_configuration =
       option_of_yojson (value_for_key log_configuration_of_yojson "LogConfiguration") _list path;
     location_attributes =
       option_of_yojson
         (value_for_key container_fleet_location_attributes_list_of_yojson "LocationAttributes")
         _list path;
     player_gateway_mode =
       option_of_yojson (value_for_key player_gateway_mode_of_yojson "PlayerGatewayMode") _list path;
   }
    : container_fleet)

let container_fleet_list_of_yojson tree path = list_of_yojson container_fleet_of_yojson tree path

let container_fleet_remove_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "PER_INSTANCE_CONTAINER_GROUP_DEFINITION" -> PER_INSTANCE_CONTAINER_GROUP_DEFINITION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerFleetRemoveAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerFleetRemoveAttribute")
     : container_fleet_remove_attribute)
    : container_fleet_remove_attribute)

let container_fleet_remove_attribute_list_of_yojson tree path =
  list_of_yojson container_fleet_remove_attribute_of_yojson tree path

let container_group_definition_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "READY" -> READY
    | `String "COPYING" -> COPYING
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerGroupDefinitionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerGroupDefinitionStatus")
     : container_group_definition_status)
    : container_group_definition_status)

let positive_integer_of_yojson = int_of_yojson

let linux_capability_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUDIT_CONTROL" -> AUDIT_CONTROL
    | `String "AUDIT_WRITE" -> AUDIT_WRITE
    | `String "BLOCK_SUSPEND" -> BLOCK_SUSPEND
    | `String "CHOWN" -> CHOWN
    | `String "DAC_OVERRIDE" -> DAC_OVERRIDE
    | `String "DAC_READ_SEARCH" -> DAC_READ_SEARCH
    | `String "FOWNER" -> FOWNER
    | `String "FSETID" -> FSETID
    | `String "IPC_LOCK" -> IPC_LOCK
    | `String "IPC_OWNER" -> IPC_OWNER
    | `String "KILL" -> KILL
    | `String "LEASE" -> LEASE
    | `String "LINUX_IMMUTABLE" -> LINUX_IMMUTABLE
    | `String "MAC_ADMIN" -> MAC_ADMIN
    | `String "MAC_OVERRIDE" -> MAC_OVERRIDE
    | `String "MKNOD" -> MKNOD
    | `String "NET_ADMIN" -> NET_ADMIN
    | `String "NET_BIND_SERVICE" -> NET_BIND_SERVICE
    | `String "NET_BROADCAST" -> NET_BROADCAST
    | `String "NET_RAW" -> NET_RAW
    | `String "SETFCAP" -> SETFCAP
    | `String "SETGID" -> SETGID
    | `String "SETPCAP" -> SETPCAP
    | `String "SETUID" -> SETUID
    | `String "SYS_ADMIN" -> SYS_ADMIN
    | `String "SYS_BOOT" -> SYS_BOOT
    | `String "SYS_CHROOT" -> SYS_CHROOT
    | `String "SYS_MODULE" -> SYS_MODULE
    | `String "SYS_NICE" -> SYS_NICE
    | `String "SYS_PACCT" -> SYS_PACCT
    | `String "SYS_PTRACE" -> SYS_PTRACE
    | `String "SYS_RAWIO" -> SYS_RAWIO
    | `String "SYS_RESOURCE" -> SYS_RESOURCE
    | `String "SYS_TIME" -> SYS_TIME
    | `String "SYS_TTY_CONFIG" -> SYS_TTY_CONFIG
    | `String "SYSLOG" -> SYSLOG
    | `String "WAKE_ALARM" -> WAKE_ALARM
    | `String value -> raise (deserialize_unknown_enum_value_error path "LinuxCapability" value)
    | _ -> raise (deserialize_wrong_type_error path "LinuxCapability")
     : linux_capability)
    : linux_capability)

let linux_capability_list_of_yojson tree path = list_of_yojson linux_capability_of_yojson tree path

let linux_capabilities_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_ =
       option_of_yojson (value_for_key linux_capability_list_of_yojson "Include") _list path;
   }
    : linux_capabilities)

let container_vcpu_of_yojson = double_of_yojson
let sha256_of_yojson = string_of_yojson

let container_port_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     from_port = value_for_key port_number_of_yojson "FromPort" _list path;
     to_port = value_for_key port_number_of_yojson "ToPort" _list path;
     protocol = value_for_key ip_protocol_of_yojson "Protocol" _list path;
   }
    : container_port_range)

let container_port_range_list_of_yojson tree path =
  list_of_yojson container_port_range_of_yojson tree path

let container_port_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_port_ranges =
       value_for_key container_port_range_list_of_yojson "ContainerPortRanges" _list path;
   }
    : container_port_configuration)

let container_memory_limit_of_yojson = int_of_yojson
let image_uri_string_of_yojson = string_of_yojson
let container_health_check_timeout_of_yojson = int_of_yojson
let container_health_check_start_period_of_yojson = int_of_yojson
let container_health_check_retries_of_yojson = int_of_yojson
let container_health_check_interval_of_yojson = int_of_yojson

let container_health_check_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     command = value_for_key container_command_string_list_of_yojson "Command" _list path;
     interval =
       option_of_yojson
         (value_for_key container_health_check_interval_of_yojson "Interval")
         _list path;
     retries =
       option_of_yojson
         (value_for_key container_health_check_retries_of_yojson "Retries")
         _list path;
     start_period =
       option_of_yojson
         (value_for_key container_health_check_start_period_of_yojson "StartPeriod")
         _list path;
     timeout =
       option_of_yojson
         (value_for_key container_health_check_timeout_of_yojson "Timeout")
         _list path;
   }
    : container_health_check)

let container_mount_point_access_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "READ_ONLY" -> READ_ONLY
    | `String "READ_AND_WRITE" -> READ_AND_WRITE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerMountPointAccessLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerMountPointAccessLevel")
     : container_mount_point_access_level)
    : container_mount_point_access_level)

let container_path_string_of_yojson = string_of_yojson
let instance_path_string_of_yojson = string_of_yojson

let container_mount_point_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_path = value_for_key instance_path_string_of_yojson "InstancePath" _list path;
     container_path =
       option_of_yojson (value_for_key container_path_string_of_yojson "ContainerPath") _list path;
     access_level =
       option_of_yojson
         (value_for_key container_mount_point_access_level_of_yojson "AccessLevel")
         _list path;
   }
    : container_mount_point)

let container_mount_point_list_of_yojson tree path =
  list_of_yojson container_mount_point_of_yojson tree path

let support_container_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name =
       option_of_yojson
         (value_for_key non_zero_and128_max_ascii_string_of_yojson "ContainerName")
         _list path;
     depends_on =
       option_of_yojson (value_for_key container_dependency_list_of_yojson "DependsOn") _list path;
     mount_points =
       option_of_yojson
         (value_for_key container_mount_point_list_of_yojson "MountPoints")
         _list path;
     environment_override =
       option_of_yojson
         (value_for_key container_environment_list_of_yojson "EnvironmentOverride")
         _list path;
     essential = option_of_yojson (value_for_key boolean_model_of_yojson "Essential") _list path;
     health_check =
       option_of_yojson (value_for_key container_health_check_of_yojson "HealthCheck") _list path;
     image_uri = option_of_yojson (value_for_key image_uri_string_of_yojson "ImageUri") _list path;
     memory_hard_limit_mebibytes =
       option_of_yojson
         (value_for_key container_memory_limit_of_yojson "MemoryHardLimitMebibytes")
         _list path;
     port_configuration =
       option_of_yojson
         (value_for_key container_port_configuration_of_yojson "PortConfiguration")
         _list path;
     resolved_image_digest =
       option_of_yojson (value_for_key sha256_of_yojson "ResolvedImageDigest") _list path;
     vcpu = option_of_yojson (value_for_key container_vcpu_of_yojson "Vcpu") _list path;
     linux_capabilities =
       option_of_yojson (value_for_key linux_capabilities_of_yojson "LinuxCapabilities") _list path;
   }
    : support_container_definition)

let support_container_definition_list_of_yojson tree path =
  list_of_yojson support_container_definition_of_yojson tree path

let game_server_container_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name =
       option_of_yojson
         (value_for_key non_zero_and128_max_ascii_string_of_yojson "ContainerName")
         _list path;
     depends_on =
       option_of_yojson (value_for_key container_dependency_list_of_yojson "DependsOn") _list path;
     mount_points =
       option_of_yojson
         (value_for_key container_mount_point_list_of_yojson "MountPoints")
         _list path;
     environment_override =
       option_of_yojson
         (value_for_key container_environment_list_of_yojson "EnvironmentOverride")
         _list path;
     image_uri = option_of_yojson (value_for_key image_uri_string_of_yojson "ImageUri") _list path;
     port_configuration =
       option_of_yojson
         (value_for_key container_port_configuration_of_yojson "PortConfiguration")
         _list path;
     resolved_image_digest =
       option_of_yojson (value_for_key sha256_of_yojson "ResolvedImageDigest") _list path;
     server_sdk_version =
       option_of_yojson (value_for_key server_sdk_version_of_yojson "ServerSdkVersion") _list path;
     linux_capabilities =
       option_of_yojson (value_for_key linux_capabilities_of_yojson "LinuxCapabilities") _list path;
   }
    : game_server_container_definition)

let container_total_vcpu_limit_of_yojson = double_of_yojson
let container_total_memory_limit_of_yojson = int_of_yojson

let container_group_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GAME_SERVER" -> GAME_SERVER
    | `String "PER_INSTANCE" -> PER_INSTANCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContainerGroupType" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerGroupType")
     : container_group_type)
    : container_group_type)

let container_operating_system_of_yojson (tree : t) path =
  ((match tree with
    | `String "AMAZON_LINUX_2023" -> AMAZON_LINUX_2023
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerOperatingSystem" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerOperatingSystem")
     : container_operating_system)
    : container_operating_system)

let container_group_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_group_definition_arn =
       option_of_yojson
         (value_for_key container_group_definition_arn_of_yojson "ContainerGroupDefinitionArn")
         _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     operating_system =
       option_of_yojson
         (value_for_key container_operating_system_of_yojson "OperatingSystem")
         _list path;
     name = value_for_key container_group_definition_name_of_yojson "Name" _list path;
     container_group_type =
       option_of_yojson
         (value_for_key container_group_type_of_yojson "ContainerGroupType")
         _list path;
     total_memory_limit_mebibytes =
       option_of_yojson
         (value_for_key container_total_memory_limit_of_yojson "TotalMemoryLimitMebibytes")
         _list path;
     total_vcpu_limit =
       option_of_yojson
         (value_for_key container_total_vcpu_limit_of_yojson "TotalVcpuLimit")
         _list path;
     game_server_container_definition =
       option_of_yojson
         (value_for_key game_server_container_definition_of_yojson "GameServerContainerDefinition")
         _list path;
     support_container_definitions =
       option_of_yojson
         (value_for_key support_container_definition_list_of_yojson "SupportContainerDefinitions")
         _list path;
     version_number =
       option_of_yojson (value_for_key positive_integer_of_yojson "VersionNumber") _list path;
     version_description =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "VersionDescription")
         _list path;
     status =
       option_of_yojson
         (value_for_key container_group_definition_status_of_yojson "Status")
         _list path;
     status_reason =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "StatusReason") _list path;
   }
    : container_group_definition)

let container_group_definition_list_of_yojson tree path =
  list_of_yojson container_group_definition_of_yojson tree path

let container_port_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_port =
       option_of_yojson (value_for_key port_number_of_yojson "ContainerPort") _list path;
     connection_port =
       option_of_yojson (value_for_key port_number_of_yojson "ConnectionPort") _list path;
     protocol = option_of_yojson (value_for_key ip_protocol_of_yojson "Protocol") _list path;
   }
    : container_port_mapping)

let container_port_mapping_list_of_yojson tree path =
  list_of_yojson container_port_mapping_of_yojson tree path

let container_group_port_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name =
       option_of_yojson
         (value_for_key non_zero_and128_max_ascii_string_of_yojson "ContainerName")
         _list path;
     container_runtime_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "ContainerRuntimeId") _list path;
     container_port_mappings =
       option_of_yojson
         (value_for_key container_port_mapping_list_of_yojson "ContainerPortMappings")
         _list path;
   }
    : container_group_port_mapping)

let container_group_port_mapping_list_of_yojson tree path =
  list_of_yojson container_group_port_mapping_of_yojson tree path

let container_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name =
       option_of_yojson
         (value_for_key non_zero_and128_max_ascii_string_of_yojson "ContainerName")
         _list path;
     container_runtime_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "ContainerRuntimeId") _list path;
   }
    : container_identifier)

let container_identifier_list_of_yojson tree path =
  list_of_yojson container_identifier_of_yojson tree path

let tagging_failed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path }
    : tagging_failed_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path }
    : limit_exceeded_exception)

let create_alias_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ alias = option_of_yojson (value_for_key alias_of_yojson "Alias") _list path }
    : create_alias_output)

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let create_alias_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key non_blank_and_length_constraint_string_of_yojson "Name" _list path;
     description =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Description") _list path;
     routing_strategy = value_for_key routing_strategy_of_yojson "RoutingStrategy" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_alias_input)

let s3_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket = option_of_yojson (value_for_key non_empty_string_of_yojson "Bucket") _list path;
     key = option_of_yojson (value_for_key non_empty_string_of_yojson "Key") _list path;
     role_arn = option_of_yojson (value_for_key non_empty_string_of_yojson "RoleArn") _list path;
     object_version =
       option_of_yojson (value_for_key non_empty_string_of_yojson "ObjectVersion") _list path;
   }
    : s3_location)

let create_build_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     build = option_of_yojson (value_for_key build_of_yojson "Build") _list path;
     upload_credentials =
       option_of_yojson (value_for_key aws_credentials_of_yojson "UploadCredentials") _list path;
     storage_location =
       option_of_yojson (value_for_key s3_location_of_yojson "StorageLocation") _list path;
   }
    : create_build_output)

let create_build_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Name") _list path;
     version =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Version") _list path;
     storage_location =
       option_of_yojson (value_for_key s3_location_of_yojson "StorageLocation") _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     server_sdk_version =
       option_of_yojson (value_for_key server_sdk_version_of_yojson "ServerSdkVersion") _list path;
   }
    : create_build_input)

let create_container_fleet_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_fleet =
       option_of_yojson (value_for_key container_fleet_of_yojson "ContainerFleet") _list path;
   }
    : create_container_fleet_output)

let location_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ location = value_for_key location_string_model_of_yojson "Location" _list path }
    : location_configuration)

let location_configuration_list_of_yojson tree path =
  list_of_yojson location_configuration_of_yojson tree path

let create_container_fleet_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_role_arn = value_for_key iam_role_arn_of_yojson "FleetRoleArn" _list path;
     description =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Description") _list path;
     game_server_container_group_definition_name =
       option_of_yojson
         (value_for_key container_group_definition_name_or_arn_of_yojson
            "GameServerContainerGroupDefinitionName")
         _list path;
     per_instance_container_group_definition_name =
       option_of_yojson
         (value_for_key container_group_definition_name_or_arn_of_yojson
            "PerInstanceContainerGroupDefinitionName")
         _list path;
     instance_connection_port_range =
       option_of_yojson
         (value_for_key connection_port_range_of_yojson "InstanceConnectionPortRange")
         _list path;
     instance_inbound_permissions =
       option_of_yojson
         (value_for_key ip_permissions_list_of_yojson "InstanceInboundPermissions")
         _list path;
     game_server_container_groups_per_instance =
       option_of_yojson
         (value_for_key game_server_container_groups_per_instance_of_yojson
            "GameServerContainerGroupsPerInstance")
         _list path;
     instance_type =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "InstanceType") _list path;
     billing_type =
       option_of_yojson
         (value_for_key container_fleet_billing_type_of_yojson "BillingType")
         _list path;
     locations =
       option_of_yojson (value_for_key location_configuration_list_of_yojson "Locations") _list path;
     metric_groups =
       option_of_yojson (value_for_key metric_group_list_of_yojson "MetricGroups") _list path;
     new_game_session_protection_policy =
       option_of_yojson
         (value_for_key protection_policy_of_yojson "NewGameSessionProtectionPolicy")
         _list path;
     game_session_creation_limit_policy =
       option_of_yojson
         (value_for_key game_session_creation_limit_policy_of_yojson
            "GameSessionCreationLimitPolicy")
         _list path;
     log_configuration =
       option_of_yojson (value_for_key log_configuration_of_yojson "LogConfiguration") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     player_gateway_mode =
       option_of_yojson (value_for_key player_gateway_mode_of_yojson "PlayerGatewayMode") _list path;
   }
    : create_container_fleet_input)

let create_container_group_definition_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_group_definition =
       option_of_yojson
         (value_for_key container_group_definition_of_yojson "ContainerGroupDefinition")
         _list path;
   }
    : create_container_group_definition_output)

let support_container_definition_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name =
       value_for_key non_zero_and128_max_ascii_string_of_yojson "ContainerName" _list path;
     depends_on =
       option_of_yojson (value_for_key container_dependency_list_of_yojson "DependsOn") _list path;
     mount_points =
       option_of_yojson
         (value_for_key container_mount_point_list_of_yojson "MountPoints")
         _list path;
     environment_override =
       option_of_yojson
         (value_for_key container_environment_list_of_yojson "EnvironmentOverride")
         _list path;
     essential = option_of_yojson (value_for_key boolean_model_of_yojson "Essential") _list path;
     health_check =
       option_of_yojson (value_for_key container_health_check_of_yojson "HealthCheck") _list path;
     image_uri = value_for_key image_uri_string_of_yojson "ImageUri" _list path;
     memory_hard_limit_mebibytes =
       option_of_yojson
         (value_for_key container_memory_limit_of_yojson "MemoryHardLimitMebibytes")
         _list path;
     port_configuration =
       option_of_yojson
         (value_for_key container_port_configuration_of_yojson "PortConfiguration")
         _list path;
     vcpu = option_of_yojson (value_for_key container_vcpu_of_yojson "Vcpu") _list path;
     linux_capabilities =
       option_of_yojson (value_for_key linux_capabilities_of_yojson "LinuxCapabilities") _list path;
   }
    : support_container_definition_input)

let support_container_definition_input_list_of_yojson tree path =
  list_of_yojson support_container_definition_input_of_yojson tree path

let game_server_container_definition_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name =
       value_for_key non_zero_and128_max_ascii_string_of_yojson "ContainerName" _list path;
     depends_on =
       option_of_yojson (value_for_key container_dependency_list_of_yojson "DependsOn") _list path;
     mount_points =
       option_of_yojson
         (value_for_key container_mount_point_list_of_yojson "MountPoints")
         _list path;
     environment_override =
       option_of_yojson
         (value_for_key container_environment_list_of_yojson "EnvironmentOverride")
         _list path;
     image_uri = value_for_key image_uri_string_of_yojson "ImageUri" _list path;
     port_configuration =
       value_for_key container_port_configuration_of_yojson "PortConfiguration" _list path;
     server_sdk_version = value_for_key server_sdk_version_of_yojson "ServerSdkVersion" _list path;
     linux_capabilities =
       option_of_yojson (value_for_key linux_capabilities_of_yojson "LinuxCapabilities") _list path;
   }
    : game_server_container_definition_input)

let create_container_group_definition_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key container_group_definition_name_of_yojson "Name" _list path;
     container_group_type =
       option_of_yojson
         (value_for_key container_group_type_of_yojson "ContainerGroupType")
         _list path;
     total_memory_limit_mebibytes =
       value_for_key container_total_memory_limit_of_yojson "TotalMemoryLimitMebibytes" _list path;
     total_vcpu_limit =
       value_for_key container_total_vcpu_limit_of_yojson "TotalVcpuLimit" _list path;
     game_server_container_definition =
       option_of_yojson
         (value_for_key game_server_container_definition_input_of_yojson
            "GameServerContainerDefinition")
         _list path;
     support_container_definitions =
       option_of_yojson
         (value_for_key support_container_definition_input_list_of_yojson
            "SupportContainerDefinitions")
         _list path;
     operating_system =
       value_for_key container_operating_system_of_yojson "OperatingSystem" _list path;
     version_description =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "VersionDescription")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_container_group_definition_input)

let not_ready_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path }
    : not_ready_exception)

let fleet_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "NEW" -> NEW
    | `String "DOWNLOADING" -> DOWNLOADING
    | `String "VALIDATING" -> VALIDATING
    | `String "BUILDING" -> BUILDING
    | `String "ACTIVATING" -> ACTIVATING
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETING" -> DELETING
    | `String "ERROR" -> ERROR
    | `String "TERMINATED" -> TERMINATED
    | `String "NOT_FOUND" -> NOT_FOUND
    | `String value -> raise (deserialize_unknown_enum_value_error path "FleetStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "FleetStatus")
     : fleet_status)
    : fleet_status)

let location_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
     status = option_of_yojson (value_for_key fleet_status_of_yojson "Status") _list path;
     player_gateway_status =
       option_of_yojson
         (value_for_key player_gateway_status_of_yojson "PlayerGatewayStatus")
         _list path;
   }
    : location_state)

let location_state_list_of_yojson tree path = list_of_yojson location_state_of_yojson tree path

let game_server_ip_protocol_supported_of_yojson (tree : t) path =
  ((match tree with
    | `String "IPv4" -> IPv4
    | `String "DUAL_STACK" -> DUAL_STACK
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GameServerIpProtocolSupported" value)
    | _ -> raise (deserialize_wrong_type_error path "GameServerIpProtocolSupported")
     : game_server_ip_protocol_supported)
    : game_server_ip_protocol_supported)

let player_gateway_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_ip_protocol_supported =
       option_of_yojson
         (value_for_key game_server_ip_protocol_supported_of_yojson "GameServerIpProtocolSupported")
         _list path;
   }
    : player_gateway_configuration)

let instance_role_credentials_provider_of_yojson (tree : t) path =
  ((match tree with
    | `String "SHARED_CREDENTIAL_FILE" -> SHARED_CREDENTIAL_FILE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstanceRoleCredentialsProvider" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceRoleCredentialsProvider")
     : instance_role_credentials_provider)
    : instance_role_credentials_provider)

let fleet_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTO_SCALING" -> AutoScaling
    | `String value -> raise (deserialize_unknown_enum_value_error path "FleetAction" value)
    | _ -> raise (deserialize_wrong_type_error path "FleetAction")
     : fleet_action)
    : fleet_action)

let fleet_action_list_of_yojson tree path = list_of_yojson fleet_action_of_yojson tree path

let resource_creation_limit_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     new_game_sessions_per_creator =
       option_of_yojson
         (value_for_key whole_number_of_yojson "NewGameSessionsPerCreator")
         _list path;
     policy_period_in_minutes =
       option_of_yojson (value_for_key whole_number_of_yojson "PolicyPeriodInMinutes") _list path;
   }
    : resource_creation_limit_policy)

let string_list_of_yojson tree path = list_of_yojson non_zero_and_max_string_of_yojson tree path
let launch_parameters_string_model_of_yojson = string_of_yojson
let launch_path_string_model_of_yojson = string_of_yojson
let script_arn_of_yojson = string_of_yojson
let script_id_of_yojson = string_of_yojson

let fleet_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ON_DEMAND" -> OnDemand
    | `String "SPOT" -> Spot
    | `String value -> raise (deserialize_unknown_enum_value_error path "FleetType" value)
    | _ -> raise (deserialize_wrong_type_error path "FleetType")
     : fleet_type)
    : fleet_type)

let fleet_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     fleet_type = option_of_yojson (value_for_key fleet_type_of_yojson "FleetType") _list path;
     instance_type =
       option_of_yojson (value_for_key ec2_instance_type_of_yojson "InstanceType") _list path;
     description =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Name") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     termination_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TerminationTime") _list path;
     status = option_of_yojson (value_for_key fleet_status_of_yojson "Status") _list path;
     build_id = option_of_yojson (value_for_key build_id_of_yojson "BuildId") _list path;
     build_arn = option_of_yojson (value_for_key build_arn_of_yojson "BuildArn") _list path;
     script_id = option_of_yojson (value_for_key script_id_of_yojson "ScriptId") _list path;
     script_arn = option_of_yojson (value_for_key script_arn_of_yojson "ScriptArn") _list path;
     server_launch_path =
       option_of_yojson
         (value_for_key launch_path_string_model_of_yojson "ServerLaunchPath")
         _list path;
     server_launch_parameters =
       option_of_yojson
         (value_for_key launch_parameters_string_model_of_yojson "ServerLaunchParameters")
         _list path;
     log_paths = option_of_yojson (value_for_key string_list_of_yojson "LogPaths") _list path;
     new_game_session_protection_policy =
       option_of_yojson
         (value_for_key protection_policy_of_yojson "NewGameSessionProtectionPolicy")
         _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
     resource_creation_limit_policy =
       option_of_yojson
         (value_for_key resource_creation_limit_policy_of_yojson "ResourceCreationLimitPolicy")
         _list path;
     metric_groups =
       option_of_yojson (value_for_key metric_group_list_of_yojson "MetricGroups") _list path;
     stopped_actions =
       option_of_yojson (value_for_key fleet_action_list_of_yojson "StoppedActions") _list path;
     instance_role_arn =
       option_of_yojson (value_for_key non_empty_string_of_yojson "InstanceRoleArn") _list path;
     certificate_configuration =
       option_of_yojson
         (value_for_key certificate_configuration_of_yojson "CertificateConfiguration")
         _list path;
     compute_type = option_of_yojson (value_for_key compute_type_of_yojson "ComputeType") _list path;
     anywhere_configuration =
       option_of_yojson
         (value_for_key anywhere_configuration_of_yojson "AnywhereConfiguration")
         _list path;
     instance_role_credentials_provider =
       option_of_yojson
         (value_for_key instance_role_credentials_provider_of_yojson
            "InstanceRoleCredentialsProvider")
         _list path;
     player_gateway_mode =
       option_of_yojson (value_for_key player_gateway_mode_of_yojson "PlayerGatewayMode") _list path;
     player_gateway_configuration =
       option_of_yojson
         (value_for_key player_gateway_configuration_of_yojson "PlayerGatewayConfiguration")
         _list path;
   }
    : fleet_attributes)

let create_fleet_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_attributes =
       option_of_yojson (value_for_key fleet_attributes_of_yojson "FleetAttributes") _list path;
     location_states =
       option_of_yojson (value_for_key location_state_list_of_yojson "LocationStates") _list path;
   }
    : create_fleet_output)

let game_session_activation_timeout_seconds_of_yojson = int_of_yojson
let max_concurrent_game_session_activations_of_yojson = int_of_yojson

let server_process_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     launch_path = value_for_key launch_path_string_model_of_yojson "LaunchPath" _list path;
     parameters =
       option_of_yojson
         (value_for_key launch_parameters_string_model_of_yojson "Parameters")
         _list path;
     concurrent_executions =
       value_for_key positive_integer_of_yojson "ConcurrentExecutions" _list path;
   }
    : server_process)

let server_process_list_of_yojson tree path = list_of_yojson server_process_of_yojson tree path

let runtime_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_processes =
       option_of_yojson (value_for_key server_process_list_of_yojson "ServerProcesses") _list path;
     max_concurrent_game_session_activations =
       option_of_yojson
         (value_for_key max_concurrent_game_session_activations_of_yojson
            "MaxConcurrentGameSessionActivations")
         _list path;
     game_session_activation_timeout_seconds =
       option_of_yojson
         (value_for_key game_session_activation_timeout_seconds_of_yojson
            "GameSessionActivationTimeoutSeconds")
         _list path;
   }
    : runtime_configuration)

let script_id_or_arn_of_yojson = string_of_yojson

let create_fleet_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key non_zero_and_max_string_of_yojson "Name" _list path;
     description =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Description") _list path;
     build_id = option_of_yojson (value_for_key build_id_or_arn_of_yojson "BuildId") _list path;
     script_id = option_of_yojson (value_for_key script_id_or_arn_of_yojson "ScriptId") _list path;
     server_launch_path =
       option_of_yojson
         (value_for_key launch_path_string_model_of_yojson "ServerLaunchPath")
         _list path;
     server_launch_parameters =
       option_of_yojson
         (value_for_key launch_parameters_string_model_of_yojson "ServerLaunchParameters")
         _list path;
     log_paths = option_of_yojson (value_for_key string_list_of_yojson "LogPaths") _list path;
     ec2_instance_type =
       option_of_yojson (value_for_key ec2_instance_type_of_yojson "EC2InstanceType") _list path;
     ec2_inbound_permissions =
       option_of_yojson
         (value_for_key ip_permissions_list_of_yojson "EC2InboundPermissions")
         _list path;
     new_game_session_protection_policy =
       option_of_yojson
         (value_for_key protection_policy_of_yojson "NewGameSessionProtectionPolicy")
         _list path;
     runtime_configuration =
       option_of_yojson
         (value_for_key runtime_configuration_of_yojson "RuntimeConfiguration")
         _list path;
     resource_creation_limit_policy =
       option_of_yojson
         (value_for_key resource_creation_limit_policy_of_yojson "ResourceCreationLimitPolicy")
         _list path;
     metric_groups =
       option_of_yojson (value_for_key metric_group_list_of_yojson "MetricGroups") _list path;
     peer_vpc_aws_account_id =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "PeerVpcAwsAccountId")
         _list path;
     peer_vpc_id =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "PeerVpcId") _list path;
     fleet_type = option_of_yojson (value_for_key fleet_type_of_yojson "FleetType") _list path;
     instance_role_arn =
       option_of_yojson (value_for_key non_empty_string_of_yojson "InstanceRoleArn") _list path;
     certificate_configuration =
       option_of_yojson
         (value_for_key certificate_configuration_of_yojson "CertificateConfiguration")
         _list path;
     locations =
       option_of_yojson (value_for_key location_configuration_list_of_yojson "Locations") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     compute_type = option_of_yojson (value_for_key compute_type_of_yojson "ComputeType") _list path;
     anywhere_configuration =
       option_of_yojson
         (value_for_key anywhere_configuration_of_yojson "AnywhereConfiguration")
         _list path;
     instance_role_credentials_provider =
       option_of_yojson
         (value_for_key instance_role_credentials_provider_of_yojson
            "InstanceRoleCredentialsProvider")
         _list path;
     player_gateway_mode =
       option_of_yojson (value_for_key player_gateway_mode_of_yojson "PlayerGatewayMode") _list path;
     player_gateway_configuration =
       option_of_yojson
         (value_for_key player_gateway_configuration_of_yojson "PlayerGatewayConfiguration")
         _list path;
   }
    : create_fleet_input)

let invalid_fleet_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path }
    : invalid_fleet_status_exception)

let fleet_id_or_arn_of_yojson = string_of_yojson

let create_fleet_locations_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_or_arn_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     location_states =
       option_of_yojson (value_for_key location_state_list_of_yojson "LocationStates") _list path;
   }
    : create_fleet_locations_output)

let create_fleet_locations_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     locations = value_for_key location_configuration_list_of_yojson "Locations" _list path;
   }
    : create_fleet_locations_input)

let game_server_group_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "REPLACE_INSTANCE_TYPES" -> REPLACE_INSTANCE_TYPES
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GameServerGroupAction" value)
    | _ -> raise (deserialize_wrong_type_error path "GameServerGroupAction")
     : game_server_group_action)
    : game_server_group_action)

let game_server_group_actions_of_yojson tree path =
  list_of_yojson game_server_group_action_of_yojson tree path

let game_server_group_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "NEW" -> NEW
    | `String "ACTIVATING" -> ACTIVATING
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETE_SCHEDULED" -> DELETE_SCHEDULED
    | `String "DELETING" -> DELETING
    | `String "DELETED" -> DELETED
    | `String "ERROR" -> ERROR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GameServerGroupStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "GameServerGroupStatus")
     : game_server_group_status)
    : game_server_group_status)

let game_server_protection_policy_of_yojson (tree : t) path =
  ((match tree with
    | `String "NO_PROTECTION" -> NO_PROTECTION
    | `String "FULL_PROTECTION" -> FULL_PROTECTION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GameServerProtectionPolicy" value)
    | _ -> raise (deserialize_wrong_type_error path "GameServerProtectionPolicy")
     : game_server_protection_policy)
    : game_server_protection_policy)

let weighted_capacity_of_yojson = string_of_yojson

let game_server_group_instance_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "c4.large" -> C4_large
    | `String "c4.xlarge" -> C4_xlarge
    | `String "c4.2xlarge" -> C4_2xlarge
    | `String "c4.4xlarge" -> C4_4xlarge
    | `String "c4.8xlarge" -> C4_8xlarge
    | `String "c5.large" -> C5_large
    | `String "c5.xlarge" -> C5_xlarge
    | `String "c5.2xlarge" -> C5_2xlarge
    | `String "c5.4xlarge" -> C5_4xlarge
    | `String "c5.9xlarge" -> C5_9xlarge
    | `String "c5.12xlarge" -> C5_12xlarge
    | `String "c5.18xlarge" -> C5_18xlarge
    | `String "c5.24xlarge" -> C5_24xlarge
    | `String "c5a.large" -> C5a_large
    | `String "c5a.xlarge" -> C5a_xlarge
    | `String "c5a.2xlarge" -> C5a_2xlarge
    | `String "c5a.4xlarge" -> C5a_4xlarge
    | `String "c5a.8xlarge" -> C5a_8xlarge
    | `String "c5a.12xlarge" -> C5a_12xlarge
    | `String "c5a.16xlarge" -> C5a_16xlarge
    | `String "c5a.24xlarge" -> C5a_24xlarge
    | `String "c6g.medium" -> C6g_medium
    | `String "c6g.large" -> C6g_large
    | `String "c6g.xlarge" -> C6g_xlarge
    | `String "c6g.2xlarge" -> C6g_2xlarge
    | `String "c6g.4xlarge" -> C6g_4xlarge
    | `String "c6g.8xlarge" -> C6g_8xlarge
    | `String "c6g.12xlarge" -> C6g_12xlarge
    | `String "c6g.16xlarge" -> C6g_16xlarge
    | `String "r4.large" -> R4_large
    | `String "r4.xlarge" -> R4_xlarge
    | `String "r4.2xlarge" -> R4_2xlarge
    | `String "r4.4xlarge" -> R4_4xlarge
    | `String "r4.8xlarge" -> R4_8xlarge
    | `String "r4.16xlarge" -> R4_16xlarge
    | `String "r5.large" -> R5_large
    | `String "r5.xlarge" -> R5_xlarge
    | `String "r5.2xlarge" -> R5_2xlarge
    | `String "r5.4xlarge" -> R5_4xlarge
    | `String "r5.8xlarge" -> R5_8xlarge
    | `String "r5.12xlarge" -> R5_12xlarge
    | `String "r5.16xlarge" -> R5_16xlarge
    | `String "r5.24xlarge" -> R5_24xlarge
    | `String "r5a.large" -> R5a_large
    | `String "r5a.xlarge" -> R5a_xlarge
    | `String "r5a.2xlarge" -> R5a_2xlarge
    | `String "r5a.4xlarge" -> R5a_4xlarge
    | `String "r5a.8xlarge" -> R5a_8xlarge
    | `String "r5a.12xlarge" -> R5a_12xlarge
    | `String "r5a.16xlarge" -> R5a_16xlarge
    | `String "r5a.24xlarge" -> R5a_24xlarge
    | `String "r6g.medium" -> R6g_medium
    | `String "r6g.large" -> R6g_large
    | `String "r6g.xlarge" -> R6g_xlarge
    | `String "r6g.2xlarge" -> R6g_2xlarge
    | `String "r6g.4xlarge" -> R6g_4xlarge
    | `String "r6g.8xlarge" -> R6g_8xlarge
    | `String "r6g.12xlarge" -> R6g_12xlarge
    | `String "r6g.16xlarge" -> R6g_16xlarge
    | `String "m4.large" -> M4_large
    | `String "m4.xlarge" -> M4_xlarge
    | `String "m4.2xlarge" -> M4_2xlarge
    | `String "m4.4xlarge" -> M4_4xlarge
    | `String "m4.10xlarge" -> M4_10xlarge
    | `String "m5.large" -> M5_large
    | `String "m5.xlarge" -> M5_xlarge
    | `String "m5.2xlarge" -> M5_2xlarge
    | `String "m5.4xlarge" -> M5_4xlarge
    | `String "m5.8xlarge" -> M5_8xlarge
    | `String "m5.12xlarge" -> M5_12xlarge
    | `String "m5.16xlarge" -> M5_16xlarge
    | `String "m5.24xlarge" -> M5_24xlarge
    | `String "m5a.large" -> M5a_large
    | `String "m5a.xlarge" -> M5a_xlarge
    | `String "m5a.2xlarge" -> M5a_2xlarge
    | `String "m5a.4xlarge" -> M5a_4xlarge
    | `String "m5a.8xlarge" -> M5a_8xlarge
    | `String "m5a.12xlarge" -> M5a_12xlarge
    | `String "m5a.16xlarge" -> M5a_16xlarge
    | `String "m5a.24xlarge" -> M5a_24xlarge
    | `String "m6g.medium" -> M6g_medium
    | `String "m6g.large" -> M6g_large
    | `String "m6g.xlarge" -> M6g_xlarge
    | `String "m6g.2xlarge" -> M6g_2xlarge
    | `String "m6g.4xlarge" -> M6g_4xlarge
    | `String "m6g.8xlarge" -> M6g_8xlarge
    | `String "m6g.12xlarge" -> M6g_12xlarge
    | `String "m6g.16xlarge" -> M6g_16xlarge
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GameServerGroupInstanceType" value)
    | _ -> raise (deserialize_wrong_type_error path "GameServerGroupInstanceType")
     : game_server_group_instance_type)
    : game_server_group_instance_type)

let instance_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_type =
       value_for_key game_server_group_instance_type_of_yojson "InstanceType" _list path;
     weighted_capacity =
       option_of_yojson (value_for_key weighted_capacity_of_yojson "WeightedCapacity") _list path;
   }
    : instance_definition)

let instance_definitions_of_yojson tree path =
  list_of_yojson instance_definition_of_yojson tree path

let game_server_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group_name =
       option_of_yojson
         (value_for_key game_server_group_name_of_yojson "GameServerGroupName")
         _list path;
     game_server_group_arn =
       option_of_yojson
         (value_for_key game_server_group_arn_of_yojson "GameServerGroupArn")
         _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     instance_definitions =
       option_of_yojson
         (value_for_key instance_definitions_of_yojson "InstanceDefinitions")
         _list path;
     balancing_strategy =
       option_of_yojson (value_for_key balancing_strategy_of_yojson "BalancingStrategy") _list path;
     game_server_protection_policy =
       option_of_yojson
         (value_for_key game_server_protection_policy_of_yojson "GameServerProtectionPolicy")
         _list path;
     auto_scaling_group_arn =
       option_of_yojson
         (value_for_key auto_scaling_group_arn_of_yojson "AutoScalingGroupArn")
         _list path;
     status =
       option_of_yojson (value_for_key game_server_group_status_of_yojson "Status") _list path;
     status_reason =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "StatusReason") _list path;
     suspended_actions =
       option_of_yojson
         (value_for_key game_server_group_actions_of_yojson "SuspendedActions")
         _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedTime") _list path;
   }
    : game_server_group)

let create_game_server_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group =
       option_of_yojson (value_for_key game_server_group_of_yojson "GameServerGroup") _list path;
   }
    : create_game_server_group_output)

let vpc_subnet_of_yojson = string_of_yojson
let vpc_subnets_of_yojson tree path = list_of_yojson vpc_subnet_of_yojson tree path
let non_negative_double_of_yojson = double_of_yojson

let target_tracking_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ target_value = value_for_key non_negative_double_of_yojson "TargetValue" _list path }
    : target_tracking_configuration)

let game_server_group_auto_scaling_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     estimated_instance_warmup =
       option_of_yojson
         (value_for_key positive_integer_of_yojson "EstimatedInstanceWarmup")
         _list path;
     target_tracking_configuration =
       value_for_key target_tracking_configuration_of_yojson "TargetTrackingConfiguration" _list
         path;
   }
    : game_server_group_auto_scaling_policy)

let launch_template_version_of_yojson = string_of_yojson
let launch_template_name_of_yojson = string_of_yojson
let launch_template_id_of_yojson = string_of_yojson

let launch_template_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     launch_template_id =
       option_of_yojson (value_for_key launch_template_id_of_yojson "LaunchTemplateId") _list path;
     launch_template_name =
       option_of_yojson
         (value_for_key launch_template_name_of_yojson "LaunchTemplateName")
         _list path;
     version =
       option_of_yojson (value_for_key launch_template_version_of_yojson "Version") _list path;
   }
    : launch_template_specification)

let create_game_server_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group_name =
       value_for_key game_server_group_name_of_yojson "GameServerGroupName" _list path;
     role_arn = value_for_key iam_role_arn_of_yojson "RoleArn" _list path;
     min_size = value_for_key whole_number_of_yojson "MinSize" _list path;
     max_size = value_for_key positive_integer_of_yojson "MaxSize" _list path;
     launch_template =
       value_for_key launch_template_specification_of_yojson "LaunchTemplate" _list path;
     instance_definitions =
       value_for_key instance_definitions_of_yojson "InstanceDefinitions" _list path;
     auto_scaling_policy =
       option_of_yojson
         (value_for_key game_server_group_auto_scaling_policy_of_yojson "AutoScalingPolicy")
         _list path;
     balancing_strategy =
       option_of_yojson (value_for_key balancing_strategy_of_yojson "BalancingStrategy") _list path;
     game_server_protection_policy =
       option_of_yojson
         (value_for_key game_server_protection_policy_of_yojson "GameServerProtectionPolicy")
         _list path;
     vpc_subnets = option_of_yojson (value_for_key vpc_subnets_of_yojson "VpcSubnets") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_game_server_group_input)

let terminal_routing_strategy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path }
    : terminal_routing_strategy_exception)

let idempotent_parameter_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path }
    : idempotent_parameter_mismatch_exception)

let fleet_capacity_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path }
    : fleet_capacity_exceeded_exception)

let matchmaker_data_of_yojson = string_of_yojson
let large_game_session_data_of_yojson = string_of_yojson

let player_session_creation_policy_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCEPT_ALL" -> ACCEPT_ALL
    | `String "DENY_ALL" -> DENY_ALL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PlayerSessionCreationPolicy" value)
    | _ -> raise (deserialize_wrong_type_error path "PlayerSessionCreationPolicy")
     : player_session_creation_policy)
    : player_session_creation_policy)

let game_property_value_of_yojson = string_of_yojson
let game_property_key_of_yojson = string_of_yojson

let game_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key game_property_key_of_yojson "Key" _list path;
     value = value_for_key game_property_value_of_yojson "Value" _list path;
   }
    : game_property)

let game_property_list_of_yojson tree path = list_of_yojson game_property_of_yojson tree path

let game_session_status_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERRUPTED" -> INTERRUPTED
    | `String "TRIGGERED_ON_PROCESS_TERMINATE" -> TRIGGERED_ON_PROCESS_TERMINATE
    | `String "FORCE_TERMINATED" -> FORCE_TERMINATED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GameSessionStatusReason" value)
    | _ -> raise (deserialize_wrong_type_error path "GameSessionStatusReason")
     : game_session_status_reason)
    : game_session_status_reason)

let game_session_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "ACTIVATING" -> ACTIVATING
    | `String "TERMINATED" -> TERMINATED
    | `String "TERMINATING" -> TERMINATING
    | `String "ERROR" -> ERROR
    | `String value -> raise (deserialize_unknown_enum_value_error path "GameSessionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "GameSessionStatus")
     : game_session_status)
    : game_session_status)

let game_session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session_id =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "GameSessionId") _list path;
     name = option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Name") _list path;
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     termination_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TerminationTime") _list path;
     current_player_session_count =
       option_of_yojson
         (value_for_key whole_number_of_yojson "CurrentPlayerSessionCount")
         _list path;
     maximum_player_session_count =
       option_of_yojson
         (value_for_key whole_number_of_yojson "MaximumPlayerSessionCount")
         _list path;
     status = option_of_yojson (value_for_key game_session_status_of_yojson "Status") _list path;
     status_reason =
       option_of_yojson
         (value_for_key game_session_status_reason_of_yojson "StatusReason")
         _list path;
     game_properties =
       option_of_yojson (value_for_key game_property_list_of_yojson "GameProperties") _list path;
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "IpAddress") _list path;
     dns_name = option_of_yojson (value_for_key dns_name_of_yojson "DnsName") _list path;
     port = option_of_yojson (value_for_key port_number_of_yojson "Port") _list path;
     player_session_creation_policy =
       option_of_yojson
         (value_for_key player_session_creation_policy_of_yojson "PlayerSessionCreationPolicy")
         _list path;
     creator_id =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "CreatorId") _list path;
     game_session_data =
       option_of_yojson
         (value_for_key large_game_session_data_of_yojson "GameSessionData")
         _list path;
     matchmaker_data =
       option_of_yojson (value_for_key matchmaker_data_of_yojson "MatchmakerData") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
     compute_name = option_of_yojson (value_for_key compute_name_of_yojson "ComputeName") _list path;
     player_gateway_status =
       option_of_yojson
         (value_for_key player_gateway_status_of_yojson "PlayerGatewayStatus")
         _list path;
   }
    : game_session)

let create_game_session_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session = option_of_yojson (value_for_key game_session_of_yojson "GameSession") _list path;
   }
    : create_game_session_output)

let id_string_model_of_yojson = string_of_yojson

let create_game_session_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_or_arn_of_yojson "FleetId") _list path;
     alias_id = option_of_yojson (value_for_key alias_id_or_arn_of_yojson "AliasId") _list path;
     maximum_player_session_count =
       value_for_key whole_number_of_yojson "MaximumPlayerSessionCount" _list path;
     name = option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Name") _list path;
     game_properties =
       option_of_yojson (value_for_key game_property_list_of_yojson "GameProperties") _list path;
     creator_id =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "CreatorId") _list path;
     game_session_id =
       option_of_yojson (value_for_key id_string_model_of_yojson "GameSessionId") _list path;
     idempotency_token =
       option_of_yojson (value_for_key id_string_model_of_yojson "IdempotencyToken") _list path;
     game_session_data =
       option_of_yojson
         (value_for_key large_game_session_data_of_yojson "GameSessionData")
         _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
   }
    : create_game_session_input)

let queue_sns_arn_string_model_of_yojson = string_of_yojson
let queue_custom_event_data_of_yojson = string_of_yojson
let location_list_of_yojson tree path = list_of_yojson location_string_model_of_yojson tree path

let priority_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "LATENCY" -> LATENCY
    | `String "COST" -> COST
    | `String "DESTINATION" -> DESTINATION
    | `String "LOCATION" -> LOCATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "PriorityType" value)
    | _ -> raise (deserialize_wrong_type_error path "PriorityType")
     : priority_type)
    : priority_type)

let priority_type_list_of_yojson tree path = list_of_yojson priority_type_of_yojson tree path

let priority_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     priority_order =
       option_of_yojson (value_for_key priority_type_list_of_yojson "PriorityOrder") _list path;
     location_order =
       option_of_yojson (value_for_key location_list_of_yojson "LocationOrder") _list path;
   }
    : priority_configuration)

let filter_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allowed_locations =
       option_of_yojson (value_for_key location_list_of_yojson "AllowedLocations") _list path;
   }
    : filter_configuration)

let game_session_queue_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_arn =
       option_of_yojson (value_for_key arn_string_model_of_yojson "DestinationArn") _list path;
   }
    : game_session_queue_destination)

let game_session_queue_destination_list_of_yojson tree path =
  list_of_yojson game_session_queue_destination_of_yojson tree path

let player_latency_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     maximum_individual_player_latency_milliseconds =
       option_of_yojson
         (value_for_key whole_number_of_yojson "MaximumIndividualPlayerLatencyMilliseconds")
         _list path;
     policy_duration_seconds =
       option_of_yojson (value_for_key whole_number_of_yojson "PolicyDurationSeconds") _list path;
   }
    : player_latency_policy)

let player_latency_policy_list_of_yojson tree path =
  list_of_yojson player_latency_policy_of_yojson tree path

let game_session_queue_arn_of_yojson = string_of_yojson
let game_session_queue_name_of_yojson = string_of_yojson

let game_session_queue_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key game_session_queue_name_of_yojson "Name") _list path;
     game_session_queue_arn =
       option_of_yojson
         (value_for_key game_session_queue_arn_of_yojson "GameSessionQueueArn")
         _list path;
     timeout_in_seconds =
       option_of_yojson (value_for_key whole_number_of_yojson "TimeoutInSeconds") _list path;
     player_latency_policies =
       option_of_yojson
         (value_for_key player_latency_policy_list_of_yojson "PlayerLatencyPolicies")
         _list path;
     destinations =
       option_of_yojson
         (value_for_key game_session_queue_destination_list_of_yojson "Destinations")
         _list path;
     filter_configuration =
       option_of_yojson
         (value_for_key filter_configuration_of_yojson "FilterConfiguration")
         _list path;
     priority_configuration =
       option_of_yojson
         (value_for_key priority_configuration_of_yojson "PriorityConfiguration")
         _list path;
     custom_event_data =
       option_of_yojson
         (value_for_key queue_custom_event_data_of_yojson "CustomEventData")
         _list path;
     notification_target =
       option_of_yojson
         (value_for_key queue_sns_arn_string_model_of_yojson "NotificationTarget")
         _list path;
   }
    : game_session_queue)

let create_game_session_queue_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session_queue =
       option_of_yojson (value_for_key game_session_queue_of_yojson "GameSessionQueue") _list path;
   }
    : create_game_session_queue_output)

let create_game_session_queue_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key game_session_queue_name_of_yojson "Name" _list path;
     timeout_in_seconds =
       option_of_yojson (value_for_key whole_number_of_yojson "TimeoutInSeconds") _list path;
     player_latency_policies =
       option_of_yojson
         (value_for_key player_latency_policy_list_of_yojson "PlayerLatencyPolicies")
         _list path;
     destinations =
       option_of_yojson
         (value_for_key game_session_queue_destination_list_of_yojson "Destinations")
         _list path;
     filter_configuration =
       option_of_yojson
         (value_for_key filter_configuration_of_yojson "FilterConfiguration")
         _list path;
     priority_configuration =
       option_of_yojson
         (value_for_key priority_configuration_of_yojson "PriorityConfiguration")
         _list path;
     custom_event_data =
       option_of_yojson
         (value_for_key queue_custom_event_data_of_yojson "CustomEventData")
         _list path;
     notification_target =
       option_of_yojson
         (value_for_key queue_sns_arn_string_model_of_yojson "NotificationTarget")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_game_session_queue_input)

let udp_endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Domain") _list path;
     port = option_of_yojson (value_for_key positive_integer_of_yojson "Port") _list path;
   }
    : udp_endpoint)

let ping_beacon_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     udp_endpoint = option_of_yojson (value_for_key udp_endpoint_of_yojson "UDPEndpoint") _list path;
   }
    : ping_beacon)

let location_arn_model_of_yojson = string_of_yojson

let location_model_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_name =
       option_of_yojson (value_for_key location_string_model_of_yojson "LocationName") _list path;
     location_arn =
       option_of_yojson (value_for_key location_arn_model_of_yojson "LocationArn") _list path;
     ping_beacon = option_of_yojson (value_for_key ping_beacon_of_yojson "PingBeacon") _list path;
   }
    : location_model)

let create_location_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ location = option_of_yojson (value_for_key location_model_of_yojson "Location") _list path }
    : create_location_output)

let custom_input_location_string_model_of_yojson = string_of_yojson

let create_location_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_name =
       value_for_key custom_input_location_string_model_of_yojson "LocationName" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_location_input)

let flex_match_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDALONE" -> STANDALONE
    | `String "WITH_QUEUE" -> WITH_QUEUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "FlexMatchMode" value)
    | _ -> raise (deserialize_wrong_type_error path "FlexMatchMode")
     : flex_match_mode)
    : flex_match_mode)

let game_session_data_of_yojson = string_of_yojson
let custom_event_data_of_yojson = string_of_yojson
let sns_arn_string_model_of_yojson = string_of_yojson
let matchmaking_rule_set_arn_of_yojson = string_of_yojson
let matchmaking_acceptance_timeout_integer_of_yojson = int_of_yojson
let matchmaking_request_timeout_integer_of_yojson = int_of_yojson
let queue_arns_list_of_yojson tree path = list_of_yojson arn_string_model_of_yojson tree path
let matchmaking_configuration_arn_of_yojson = string_of_yojson

let matchmaking_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key matchmaking_id_string_model_of_yojson "Name") _list path;
     configuration_arn =
       option_of_yojson
         (value_for_key matchmaking_configuration_arn_of_yojson "ConfigurationArn")
         _list path;
     description =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Description") _list path;
     game_session_queue_arns =
       option_of_yojson (value_for_key queue_arns_list_of_yojson "GameSessionQueueArns") _list path;
     request_timeout_seconds =
       option_of_yojson
         (value_for_key matchmaking_request_timeout_integer_of_yojson "RequestTimeoutSeconds")
         _list path;
     acceptance_timeout_seconds =
       option_of_yojson
         (value_for_key matchmaking_acceptance_timeout_integer_of_yojson "AcceptanceTimeoutSeconds")
         _list path;
     acceptance_required =
       option_of_yojson (value_for_key boolean_model_of_yojson "AcceptanceRequired") _list path;
     rule_set_name =
       option_of_yojson
         (value_for_key matchmaking_id_string_model_of_yojson "RuleSetName")
         _list path;
     rule_set_arn =
       option_of_yojson (value_for_key matchmaking_rule_set_arn_of_yojson "RuleSetArn") _list path;
     notification_target =
       option_of_yojson
         (value_for_key sns_arn_string_model_of_yojson "NotificationTarget")
         _list path;
     additional_player_count =
       option_of_yojson (value_for_key whole_number_of_yojson "AdditionalPlayerCount") _list path;
     custom_event_data =
       option_of_yojson (value_for_key custom_event_data_of_yojson "CustomEventData") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     game_properties =
       option_of_yojson (value_for_key game_property_list_of_yojson "GameProperties") _list path;
     game_session_data =
       option_of_yojson (value_for_key game_session_data_of_yojson "GameSessionData") _list path;
     backfill_mode =
       option_of_yojson (value_for_key backfill_mode_of_yojson "BackfillMode") _list path;
     flex_match_mode =
       option_of_yojson (value_for_key flex_match_mode_of_yojson "FlexMatchMode") _list path;
   }
    : matchmaking_configuration)

let create_matchmaking_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key matchmaking_configuration_of_yojson "Configuration")
         _list path;
   }
    : create_matchmaking_configuration_output)

let matchmaking_rule_set_name_of_yojson = string_of_yojson

let create_matchmaking_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key matchmaking_id_string_model_of_yojson "Name" _list path;
     description =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Description") _list path;
     game_session_queue_arns =
       option_of_yojson (value_for_key queue_arns_list_of_yojson "GameSessionQueueArns") _list path;
     request_timeout_seconds =
       value_for_key matchmaking_request_timeout_integer_of_yojson "RequestTimeoutSeconds" _list
         path;
     acceptance_timeout_seconds =
       option_of_yojson
         (value_for_key matchmaking_acceptance_timeout_integer_of_yojson "AcceptanceTimeoutSeconds")
         _list path;
     acceptance_required = value_for_key boolean_model_of_yojson "AcceptanceRequired" _list path;
     rule_set_name = value_for_key matchmaking_rule_set_name_of_yojson "RuleSetName" _list path;
     notification_target =
       option_of_yojson
         (value_for_key sns_arn_string_model_of_yojson "NotificationTarget")
         _list path;
     additional_player_count =
       option_of_yojson (value_for_key whole_number_of_yojson "AdditionalPlayerCount") _list path;
     custom_event_data =
       option_of_yojson (value_for_key custom_event_data_of_yojson "CustomEventData") _list path;
     game_properties =
       option_of_yojson (value_for_key game_property_list_of_yojson "GameProperties") _list path;
     game_session_data =
       option_of_yojson (value_for_key game_session_data_of_yojson "GameSessionData") _list path;
     backfill_mode =
       option_of_yojson (value_for_key backfill_mode_of_yojson "BackfillMode") _list path;
     flex_match_mode =
       option_of_yojson (value_for_key flex_match_mode_of_yojson "FlexMatchMode") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_matchmaking_configuration_input)

let rule_set_body_of_yojson = string_of_yojson

let matchmaking_rule_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_set_name =
       option_of_yojson
         (value_for_key matchmaking_id_string_model_of_yojson "RuleSetName")
         _list path;
     rule_set_arn =
       option_of_yojson (value_for_key matchmaking_rule_set_arn_of_yojson "RuleSetArn") _list path;
     rule_set_body = value_for_key rule_set_body_of_yojson "RuleSetBody" _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
   }
    : matchmaking_rule_set)

let create_matchmaking_rule_set_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule_set = value_for_key matchmaking_rule_set_of_yojson "RuleSet" _list path }
    : create_matchmaking_rule_set_output)

let create_matchmaking_rule_set_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key matchmaking_id_string_model_of_yojson "Name" _list path;
     rule_set_body = value_for_key rule_set_body_of_yojson "RuleSetBody" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_matchmaking_rule_set_input)

let invalid_game_session_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path }
    : invalid_game_session_status_exception)

let game_session_full_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path }
    : game_session_full_exception)

let player_data_of_yojson = string_of_yojson

let player_session_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "RESERVED" -> RESERVED
    | `String "ACTIVE" -> ACTIVE
    | `String "COMPLETED" -> COMPLETED
    | `String "TIMEDOUT" -> TIMEDOUT
    | `String value -> raise (deserialize_unknown_enum_value_error path "PlayerSessionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PlayerSessionStatus")
     : player_session_status)
    : player_session_status)

let player_session_id_of_yojson = string_of_yojson

let player_session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     player_session_id =
       option_of_yojson (value_for_key player_session_id_of_yojson "PlayerSessionId") _list path;
     player_id = option_of_yojson (value_for_key player_id_of_yojson "PlayerId") _list path;
     game_session_id =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "GameSessionId") _list path;
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     termination_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TerminationTime") _list path;
     status = option_of_yojson (value_for_key player_session_status_of_yojson "Status") _list path;
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "IpAddress") _list path;
     dns_name = option_of_yojson (value_for_key dns_name_of_yojson "DnsName") _list path;
     port = option_of_yojson (value_for_key port_number_of_yojson "Port") _list path;
     player_data = option_of_yojson (value_for_key player_data_of_yojson "PlayerData") _list path;
   }
    : player_session)

let create_player_session_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     player_session =
       option_of_yojson (value_for_key player_session_of_yojson "PlayerSession") _list path;
   }
    : create_player_session_output)

let create_player_session_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session_id = value_for_key arn_string_model_of_yojson "GameSessionId" _list path;
     player_id = value_for_key player_id_of_yojson "PlayerId" _list path;
     player_data = option_of_yojson (value_for_key player_data_of_yojson "PlayerData") _list path;
   }
    : create_player_session_input)

let player_session_list_of_yojson tree path = list_of_yojson player_session_of_yojson tree path

let create_player_sessions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     player_sessions =
       option_of_yojson (value_for_key player_session_list_of_yojson "PlayerSessions") _list path;
   }
    : create_player_sessions_output)

let player_data_map_of_yojson tree path =
  map_of_yojson non_zero_and_max_string_of_yojson player_data_of_yojson tree path

let player_id_list_of_yojson tree path = list_of_yojson player_id_of_yojson tree path

let create_player_sessions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session_id = value_for_key arn_string_model_of_yojson "GameSessionId" _list path;
     player_ids = value_for_key player_id_list_of_yojson "PlayerIds" _list path;
     player_data_map =
       option_of_yojson (value_for_key player_data_map_of_yojson "PlayerDataMap") _list path;
   }
    : create_player_sessions_input)

let node_js_version_of_yojson = string_of_yojson

let script_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     script_id = option_of_yojson (value_for_key script_id_of_yojson "ScriptId") _list path;
     script_arn = option_of_yojson (value_for_key script_arn_of_yojson "ScriptArn") _list path;
     name = option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Name") _list path;
     version =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Version") _list path;
     size_on_disk =
       option_of_yojson (value_for_key whole_number_long_of_yojson "SizeOnDisk") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     storage_location =
       option_of_yojson (value_for_key s3_location_of_yojson "StorageLocation") _list path;
     node_js_version =
       option_of_yojson (value_for_key node_js_version_of_yojson "NodeJsVersion") _list path;
   }
    : script)

let create_script_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ script = option_of_yojson (value_for_key script_of_yojson "Script") _list path }
    : create_script_output)

let zip_blob_of_yojson = blob_of_yojson

let create_script_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Name") _list path;
     version =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Version") _list path;
     storage_location =
       option_of_yojson (value_for_key s3_location_of_yojson "StorageLocation") _list path;
     zip_file = option_of_yojson (value_for_key zip_blob_of_yojson "ZipFile") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     node_js_version =
       option_of_yojson (value_for_key node_js_version_of_yojson "NodeJsVersion") _list path;
   }
    : create_script_input)

let vpc_peering_authorization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_lift_aws_account_id =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "GameLiftAwsAccountId")
         _list path;
     peer_vpc_aws_account_id =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "PeerVpcAwsAccountId")
         _list path;
     peer_vpc_id =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "PeerVpcId") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     expiration_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ExpirationTime") _list path;
   }
    : vpc_peering_authorization)

let create_vpc_peering_authorization_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_peering_authorization =
       option_of_yojson
         (value_for_key vpc_peering_authorization_of_yojson "VpcPeeringAuthorization")
         _list path;
   }
    : create_vpc_peering_authorization_output)

let create_vpc_peering_authorization_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_lift_aws_account_id =
       value_for_key non_zero_and_max_string_of_yojson "GameLiftAwsAccountId" _list path;
     peer_vpc_id = value_for_key non_zero_and_max_string_of_yojson "PeerVpcId" _list path;
   }
    : create_vpc_peering_authorization_input)

let create_vpc_peering_connection_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_vpc_peering_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_of_yojson "FleetId" _list path;
     peer_vpc_aws_account_id =
       value_for_key non_zero_and_max_string_of_yojson "PeerVpcAwsAccountId" _list path;
     peer_vpc_id = value_for_key non_zero_and_max_string_of_yojson "PeerVpcId" _list path;
   }
    : create_vpc_peering_connection_input)

let custom_location_name_or_arn_model_of_yojson = string_of_yojson

let delete_alias_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ alias_id = value_for_key alias_id_or_arn_of_yojson "AliasId" _list path } : delete_alias_input)

let delete_build_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ build_id = value_for_key build_id_or_arn_of_yojson "BuildId" _list path } : delete_build_input)

let delete_container_fleet_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_container_fleet_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path }
    : delete_container_fleet_input)

let delete_container_group_definition_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_container_group_definition_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key container_group_definition_name_or_arn_of_yojson "Name" _list path;
     version_number =
       option_of_yojson (value_for_key positive_integer_of_yojson "VersionNumber") _list path;
     version_count_to_retain =
       option_of_yojson (value_for_key whole_number_of_yojson "VersionCountToRetain") _list path;
   }
    : delete_container_group_definition_input)

let delete_fleet_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path } : delete_fleet_input)

let delete_fleet_locations_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_or_arn_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     location_states =
       option_of_yojson (value_for_key location_state_list_of_yojson "LocationStates") _list path;
   }
    : delete_fleet_locations_output)

let delete_fleet_locations_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     locations = value_for_key location_list_of_yojson "Locations" _list path;
   }
    : delete_fleet_locations_input)

let delete_game_server_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group =
       option_of_yojson (value_for_key game_server_group_of_yojson "GameServerGroup") _list path;
   }
    : delete_game_server_group_output)

let game_server_group_delete_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "SAFE_DELETE" -> SAFE_DELETE
    | `String "FORCE_DELETE" -> FORCE_DELETE
    | `String "RETAIN" -> RETAIN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GameServerGroupDeleteOption" value)
    | _ -> raise (deserialize_wrong_type_error path "GameServerGroupDeleteOption")
     : game_server_group_delete_option)
    : game_server_group_delete_option)

let delete_game_server_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group_name =
       value_for_key game_server_group_name_or_arn_of_yojson "GameServerGroupName" _list path;
     delete_option =
       option_of_yojson
         (value_for_key game_server_group_delete_option_of_yojson "DeleteOption")
         _list path;
   }
    : delete_game_server_group_input)

let delete_game_session_queue_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let game_session_queue_name_or_arn_of_yojson = string_of_yojson

let delete_game_session_queue_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key game_session_queue_name_or_arn_of_yojson "Name" _list path }
    : delete_game_session_queue_input)

let delete_location_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_location_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_name =
       value_for_key custom_location_name_or_arn_model_of_yojson "LocationName" _list path;
   }
    : delete_location_input)

let delete_matchmaking_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let matchmaking_configuration_name_of_yojson = string_of_yojson

let delete_matchmaking_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key matchmaking_configuration_name_of_yojson "Name" _list path }
    : delete_matchmaking_configuration_input)

let delete_matchmaking_rule_set_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_matchmaking_rule_set_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key matchmaking_rule_set_name_of_yojson "Name" _list path }
    : delete_matchmaking_rule_set_input)

let delete_scaling_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key non_zero_and_max_string_of_yojson "Name" _list path;
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
   }
    : delete_scaling_policy_input)

let delete_script_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ script_id = value_for_key script_id_or_arn_of_yojson "ScriptId" _list path }
    : delete_script_input)

let delete_vpc_peering_authorization_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_vpc_peering_authorization_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_lift_aws_account_id =
       value_for_key non_zero_and_max_string_of_yojson "GameLiftAwsAccountId" _list path;
     peer_vpc_id = value_for_key non_zero_and_max_string_of_yojson "PeerVpcId" _list path;
   }
    : delete_vpc_peering_authorization_input)

let delete_vpc_peering_connection_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_vpc_peering_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_of_yojson "FleetId" _list path;
     vpc_peering_connection_id =
       value_for_key non_zero_and_max_string_of_yojson "VpcPeeringConnectionId" _list path;
   }
    : delete_vpc_peering_connection_input)

let deployment_impairment_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "MAINTAIN" -> MAINTAIN
    | `String "ROLLBACK" -> ROLLBACK
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeploymentImpairmentStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentImpairmentStrategy")
     : deployment_impairment_strategy)
    : deployment_impairment_strategy)

let minimum_healthy_percentage_of_yojson = int_of_yojson

let deployment_protection_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "WITH_PROTECTION" -> WITH_PROTECTION
    | `String "IGNORE_PROTECTION" -> IGNORE_PROTECTION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeploymentProtectionStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentProtectionStrategy")
     : deployment_protection_strategy)
    : deployment_protection_strategy)

let deployment_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protection_strategy =
       option_of_yojson
         (value_for_key deployment_protection_strategy_of_yojson "ProtectionStrategy")
         _list path;
     minimum_healthy_percentage =
       option_of_yojson
         (value_for_key minimum_healthy_percentage_of_yojson "MinimumHealthyPercentage")
         _list path;
     impairment_strategy =
       option_of_yojson
         (value_for_key deployment_impairment_strategy_of_yojson "ImpairmentStrategy")
         _list path;
   }
    : deployment_configuration)

let deployment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "IMPAIRED" -> IMPAIRED
    | `String "COMPLETE" -> COMPLETE
    | `String "ROLLBACK_IN_PROGRESS" -> ROLLBACK_IN_PROGRESS
    | `String "ROLLBACK_COMPLETE" -> ROLLBACK_COMPLETE
    | `String "CANCELLED" -> CANCELLED
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeploymentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentStatus")
     : deployment_status)
    : deployment_status)

let deregister_compute_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let deregister_compute_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     compute_name = value_for_key compute_name_or_arn_of_yojson "ComputeName" _list path;
   }
    : deregister_compute_input)

let deregister_game_server_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group_name =
       value_for_key game_server_group_name_or_arn_of_yojson "GameServerGroupName" _list path;
     game_server_id = value_for_key game_server_id_of_yojson "GameServerId" _list path;
   }
    : deregister_game_server_input)

let describe_alias_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ alias = option_of_yojson (value_for_key alias_of_yojson "Alias") _list path }
    : describe_alias_output)

let describe_alias_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ alias_id = value_for_key alias_id_or_arn_of_yojson "AliasId" _list path }
    : describe_alias_input)

let describe_build_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ build = option_of_yojson (value_for_key build_of_yojson "Build") _list path }
    : describe_build_output)

let describe_build_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ build_id = value_for_key build_id_or_arn_of_yojson "BuildId" _list path }
    : describe_build_input)

let describe_compute_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ compute = option_of_yojson (value_for_key compute_of_yojson "Compute") _list path }
    : describe_compute_output)

let describe_compute_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     compute_name = value_for_key compute_name_or_arn_of_yojson "ComputeName" _list path;
   }
    : describe_compute_input)

let describe_container_fleet_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_fleet =
       option_of_yojson (value_for_key container_fleet_of_yojson "ContainerFleet") _list path;
   }
    : describe_container_fleet_output)

let describe_container_fleet_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path }
    : describe_container_fleet_input)

let describe_container_group_definition_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_group_definition =
       option_of_yojson
         (value_for_key container_group_definition_of_yojson "ContainerGroupDefinition")
         _list path;
   }
    : describe_container_group_definition_output)

let describe_container_group_definition_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key container_group_definition_name_or_arn_of_yojson "Name" _list path;
     version_number =
       option_of_yojson (value_for_key positive_integer_of_yojson "VersionNumber") _list path;
   }
    : describe_container_group_definition_input)

let describe_container_group_port_mappings_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
     container_group_definition_arn =
       option_of_yojson
         (value_for_key container_group_definition_arn_of_yojson "ContainerGroupDefinitionArn")
         _list path;
     container_group_type =
       option_of_yojson
         (value_for_key container_group_type_of_yojson "ContainerGroupType")
         _list path;
     compute_name = option_of_yojson (value_for_key compute_name_of_yojson "ComputeName") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     container_group_port_mappings =
       option_of_yojson
         (value_for_key container_group_port_mapping_list_of_yojson "ContainerGroupPortMappings")
         _list path;
   }
    : describe_container_group_port_mappings_output)

let describe_container_group_port_mappings_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     container_group_type =
       value_for_key container_group_type_of_yojson "ContainerGroupType" _list path;
     compute_name =
       option_of_yojson (value_for_key compute_name_or_arn_of_yojson "ComputeName") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     container_name =
       option_of_yojson
         (value_for_key non_zero_and128_max_ascii_string_of_yojson "ContainerName")
         _list path;
   }
    : describe_container_group_port_mappings_input)

let ec2_instance_limit_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ec2_instance_type =
       option_of_yojson (value_for_key ec2_instance_type_of_yojson "EC2InstanceType") _list path;
     current_instances =
       option_of_yojson (value_for_key whole_number_of_yojson "CurrentInstances") _list path;
     instance_limit =
       option_of_yojson (value_for_key whole_number_of_yojson "InstanceLimit") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
   }
    : ec2_instance_limit)

let ec2_instance_limit_list_of_yojson tree path =
  list_of_yojson ec2_instance_limit_of_yojson tree path

let describe_ec2_instance_limits_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ec2_instance_limits =
       option_of_yojson
         (value_for_key ec2_instance_limit_list_of_yojson "EC2InstanceLimits")
         _list path;
   }
    : describe_ec2_instance_limits_output)

let describe_ec2_instance_limits_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ec2_instance_type =
       option_of_yojson (value_for_key ec2_instance_type_of_yojson "EC2InstanceType") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
   }
    : describe_ec2_instance_limits_input)

let fleet_attributes_list_of_yojson tree path = list_of_yojson fleet_attributes_of_yojson tree path

let describe_fleet_attributes_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_attributes =
       option_of_yojson (value_for_key fleet_attributes_list_of_yojson "FleetAttributes") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_fleet_attributes_output)

let fleet_id_or_arn_list_of_yojson tree path = list_of_yojson fleet_id_or_arn_of_yojson tree path

let describe_fleet_attributes_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_ids =
       option_of_yojson (value_for_key fleet_id_or_arn_list_of_yojson "FleetIds") _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_fleet_attributes_input)

let scale_in_after_inactivity_minutes_of_yojson = int_of_yojson

let zero_capacity_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "MANUAL" -> MANUAL
    | `String "SCALE_TO_AND_FROM_ZERO" -> SCALE_TO_AND_FROM_ZERO
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ZeroCapacityStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "ZeroCapacityStrategy")
     : zero_capacity_strategy)
    : zero_capacity_strategy)

let managed_capacity_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     zero_capacity_strategy =
       option_of_yojson
         (value_for_key zero_capacity_strategy_of_yojson "ZeroCapacityStrategy")
         _list path;
     scale_in_after_inactivity_minutes =
       option_of_yojson
         (value_for_key scale_in_after_inactivity_minutes_of_yojson "ScaleInAfterInactivityMinutes")
         _list path;
   }
    : managed_capacity_configuration)

let game_server_container_group_counts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pendin_g = option_of_yojson (value_for_key whole_number_of_yojson "PENDING") _list path;
     activ_e = option_of_yojson (value_for_key whole_number_of_yojson "ACTIVE") _list path;
     idl_e = option_of_yojson (value_for_key whole_number_of_yojson "IDLE") _list path;
     terminatin_g = option_of_yojson (value_for_key whole_number_of_yojson "TERMINATING") _list path;
   }
    : game_server_container_group_counts)

let ec2_instance_counts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     desire_d = option_of_yojson (value_for_key whole_number_of_yojson "DESIRED") _list path;
     minimu_m = option_of_yojson (value_for_key whole_number_of_yojson "MINIMUM") _list path;
     maximu_m = option_of_yojson (value_for_key whole_number_of_yojson "MAXIMUM") _list path;
     pendin_g = option_of_yojson (value_for_key whole_number_of_yojson "PENDING") _list path;
     activ_e = option_of_yojson (value_for_key whole_number_of_yojson "ACTIVE") _list path;
     idl_e = option_of_yojson (value_for_key whole_number_of_yojson "IDLE") _list path;
     terminatin_g = option_of_yojson (value_for_key whole_number_of_yojson "TERMINATING") _list path;
   }
    : ec2_instance_counts)

let fleet_capacity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     instance_type =
       option_of_yojson (value_for_key ec2_instance_type_of_yojson "InstanceType") _list path;
     instance_counts =
       option_of_yojson (value_for_key ec2_instance_counts_of_yojson "InstanceCounts") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
     game_server_container_group_counts =
       option_of_yojson
         (value_for_key game_server_container_group_counts_of_yojson
            "GameServerContainerGroupCounts")
         _list path;
     managed_capacity_configuration =
       option_of_yojson
         (value_for_key managed_capacity_configuration_of_yojson "ManagedCapacityConfiguration")
         _list path;
   }
    : fleet_capacity)

let fleet_capacity_list_of_yojson tree path = list_of_yojson fleet_capacity_of_yojson tree path

let describe_fleet_capacity_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_capacity =
       option_of_yojson (value_for_key fleet_capacity_list_of_yojson "FleetCapacity") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_fleet_capacity_output)

let describe_fleet_capacity_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_ids =
       option_of_yojson (value_for_key fleet_id_or_arn_list_of_yojson "FleetIds") _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_fleet_capacity_input)

let locational_deployment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_status =
       option_of_yojson (value_for_key deployment_status_of_yojson "DeploymentStatus") _list path;
   }
    : locational_deployment)

let locational_deployments_of_yojson tree path =
  map_of_yojson non_zero_and128_max_ascii_string_of_yojson locational_deployment_of_yojson tree path

let fleet_binary_arn_of_yojson = string_of_yojson

let fleet_deployment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "DeploymentId") _list path;
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     game_server_binary_arn =
       option_of_yojson (value_for_key fleet_binary_arn_of_yojson "GameServerBinaryArn") _list path;
     rollback_game_server_binary_arn =
       option_of_yojson
         (value_for_key fleet_binary_arn_of_yojson "RollbackGameServerBinaryArn")
         _list path;
     per_instance_binary_arn =
       option_of_yojson (value_for_key fleet_binary_arn_of_yojson "PerInstanceBinaryArn") _list path;
     rollback_per_instance_binary_arn =
       option_of_yojson
         (value_for_key fleet_binary_arn_of_yojson "RollbackPerInstanceBinaryArn")
         _list path;
     deployment_status =
       option_of_yojson (value_for_key deployment_status_of_yojson "DeploymentStatus") _list path;
     deployment_configuration =
       option_of_yojson
         (value_for_key deployment_configuration_of_yojson "DeploymentConfiguration")
         _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
   }
    : fleet_deployment)

let describe_fleet_deployment_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_deployment =
       option_of_yojson (value_for_key fleet_deployment_of_yojson "FleetDeployment") _list path;
     locational_deployments =
       option_of_yojson
         (value_for_key locational_deployments_of_yojson "LocationalDeployments")
         _list path;
   }
    : describe_fleet_deployment_output)

let describe_fleet_deployment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "DeploymentId") _list path;
   }
    : describe_fleet_deployment_input)

let event_count_of_yojson = long_of_yojson

let event_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "GENERIC_EVENT" -> GENERIC_EVENT
    | `String "FLEET_CREATED" -> FLEET_CREATED
    | `String "FLEET_DELETED" -> FLEET_DELETED
    | `String "FLEET_SCALING_EVENT" -> FLEET_SCALING_EVENT
    | `String "FLEET_STATE_DOWNLOADING" -> FLEET_STATE_DOWNLOADING
    | `String "FLEET_STATE_VALIDATING" -> FLEET_STATE_VALIDATING
    | `String "FLEET_STATE_BUILDING" -> FLEET_STATE_BUILDING
    | `String "FLEET_STATE_ACTIVATING" -> FLEET_STATE_ACTIVATING
    | `String "FLEET_STATE_ACTIVE" -> FLEET_STATE_ACTIVE
    | `String "FLEET_STATE_ERROR" -> FLEET_STATE_ERROR
    | `String "FLEET_STATE_PENDING" -> FLEET_STATE_PENDING
    | `String "FLEET_STATE_CREATING" -> FLEET_STATE_CREATING
    | `String "FLEET_STATE_CREATED" -> FLEET_STATE_CREATED
    | `String "FLEET_STATE_UPDATING" -> FLEET_STATE_UPDATING
    | `String "FLEET_INITIALIZATION_FAILED" -> FLEET_INITIALIZATION_FAILED
    | `String "FLEET_BINARY_DOWNLOAD_FAILED" -> FLEET_BINARY_DOWNLOAD_FAILED
    | `String "FLEET_VALIDATION_LAUNCH_PATH_NOT_FOUND" -> FLEET_VALIDATION_LAUNCH_PATH_NOT_FOUND
    | `String "FLEET_VALIDATION_EXECUTABLE_RUNTIME_FAILURE" ->
        FLEET_VALIDATION_EXECUTABLE_RUNTIME_FAILURE
    | `String "FLEET_VALIDATION_TIMED_OUT" -> FLEET_VALIDATION_TIMED_OUT
    | `String "FLEET_ACTIVATION_FAILED" -> FLEET_ACTIVATION_FAILED
    | `String "FLEET_ACTIVATION_FAILED_NO_INSTANCES" -> FLEET_ACTIVATION_FAILED_NO_INSTANCES
    | `String "FLEET_NEW_GAME_SESSION_PROTECTION_POLICY_UPDATED" ->
        FLEET_NEW_GAME_SESSION_PROTECTION_POLICY_UPDATED
    | `String "SERVER_PROCESS_INVALID_PATH" -> SERVER_PROCESS_INVALID_PATH
    | `String "SERVER_PROCESS_SDK_INITIALIZATION_TIMEOUT" ->
        SERVER_PROCESS_SDK_INITIALIZATION_TIMEOUT
    | `String "SERVER_PROCESS_PROCESS_READY_TIMEOUT" -> SERVER_PROCESS_PROCESS_READY_TIMEOUT
    | `String "SERVER_PROCESS_CRASHED" -> SERVER_PROCESS_CRASHED
    | `String "SERVER_PROCESS_TERMINATED_UNHEALTHY" -> SERVER_PROCESS_TERMINATED_UNHEALTHY
    | `String "SERVER_PROCESS_FORCE_TERMINATED" -> SERVER_PROCESS_FORCE_TERMINATED
    | `String "SERVER_PROCESS_PROCESS_EXIT_TIMEOUT" -> SERVER_PROCESS_PROCESS_EXIT_TIMEOUT
    | `String "SERVER_PROCESS_SDK_INITIALIZATION_FAILED" -> SERVER_PROCESS_SDK_INITIALIZATION_FAILED
    | `String "SERVER_PROCESS_MISCONFIGURED_CONTAINER_PORT" ->
        SERVER_PROCESS_MISCONFIGURED_CONTAINER_PORT
    | `String "GAME_SESSION_ACTIVATION_TIMEOUT" -> GAME_SESSION_ACTIVATION_TIMEOUT
    | `String "FLEET_CREATION_EXTRACTING_BUILD" -> FLEET_CREATION_EXTRACTING_BUILD
    | `String "FLEET_CREATION_RUNNING_INSTALLER" -> FLEET_CREATION_RUNNING_INSTALLER
    | `String "FLEET_CREATION_VALIDATING_RUNTIME_CONFIG" -> FLEET_CREATION_VALIDATING_RUNTIME_CONFIG
    | `String "FLEET_VPC_PEERING_SUCCEEDED" -> FLEET_VPC_PEERING_SUCCEEDED
    | `String "FLEET_VPC_PEERING_FAILED" -> FLEET_VPC_PEERING_FAILED
    | `String "FLEET_VPC_PEERING_DELETED" -> FLEET_VPC_PEERING_DELETED
    | `String "INSTANCE_INTERRUPTED" -> INSTANCE_INTERRUPTED
    | `String "INSTANCE_RECYCLED" -> INSTANCE_RECYCLED
    | `String "INSTANCE_REPLACED_UNHEALTHY" -> INSTANCE_REPLACED_UNHEALTHY
    | `String "FLEET_CREATION_COMPLETED_INSTALLER" -> FLEET_CREATION_COMPLETED_INSTALLER
    | `String "FLEET_CREATION_FAILED_INSTALLER" -> FLEET_CREATION_FAILED_INSTALLER
    | `String "COMPUTE_LOG_UPLOAD_FAILED" -> COMPUTE_LOG_UPLOAD_FAILED
    | `String "GAME_SERVER_CONTAINER_GROUP_CRASHED" -> GAME_SERVER_CONTAINER_GROUP_CRASHED
    | `String "PER_INSTANCE_CONTAINER_GROUP_CRASHED" -> PER_INSTANCE_CONTAINER_GROUP_CRASHED
    | `String "GAME_SERVER_CONTAINER_GROUP_REPLACED_UNHEALTHY" ->
        GAME_SERVER_CONTAINER_GROUP_REPLACED_UNHEALTHY
    | `String "LOCATION_STATE_PENDING" -> LOCATION_STATE_PENDING
    | `String "LOCATION_STATE_CREATING" -> LOCATION_STATE_CREATING
    | `String "LOCATION_STATE_CREATED" -> LOCATION_STATE_CREATED
    | `String "LOCATION_STATE_ACTIVATING" -> LOCATION_STATE_ACTIVATING
    | `String "LOCATION_STATE_ACTIVE" -> LOCATION_STATE_ACTIVE
    | `String "LOCATION_STATE_UPDATING" -> LOCATION_STATE_UPDATING
    | `String "LOCATION_STATE_ERROR" -> LOCATION_STATE_ERROR
    | `String "LOCATION_STATE_DELETING" -> LOCATION_STATE_DELETING
    | `String "LOCATION_STATE_DELETED" -> LOCATION_STATE_DELETED
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventCode" value)
    | _ -> raise (deserialize_wrong_type_error path "EventCode")
     : event_code)
    : event_code)

let event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_id =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "EventId") _list path;
     resource_id =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "ResourceId") _list path;
     event_code = option_of_yojson (value_for_key event_code_of_yojson "EventCode") _list path;
     message = option_of_yojson (value_for_key non_empty_string_of_yojson "Message") _list path;
     event_time = option_of_yojson (value_for_key timestamp_of_yojson "EventTime") _list path;
     pre_signed_log_url =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "PreSignedLogUrl")
         _list path;
     count = option_of_yojson (value_for_key event_count_of_yojson "Count") _list path;
   }
    : event)

let event_list_of_yojson tree path = list_of_yojson event_of_yojson tree path

let describe_fleet_events_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     events = option_of_yojson (value_for_key event_list_of_yojson "Events") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_fleet_events_output)

let describe_fleet_events_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_fleet_events_input)

let location_update_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_UPDATE" -> PENDING_UPDATE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LocationUpdateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LocationUpdateStatus")
     : location_update_status)
    : location_update_status)

let location_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_state =
       option_of_yojson (value_for_key location_state_of_yojson "LocationState") _list path;
     stopped_actions =
       option_of_yojson (value_for_key fleet_action_list_of_yojson "StoppedActions") _list path;
     update_status =
       option_of_yojson (value_for_key location_update_status_of_yojson "UpdateStatus") _list path;
   }
    : location_attributes)

let location_attributes_list_of_yojson tree path =
  list_of_yojson location_attributes_of_yojson tree path

let describe_fleet_location_attributes_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_or_arn_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     location_attributes =
       option_of_yojson
         (value_for_key location_attributes_list_of_yojson "LocationAttributes")
         _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_fleet_location_attributes_output)

let describe_fleet_location_attributes_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     locations = option_of_yojson (value_for_key location_list_of_yojson "Locations") _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_fleet_location_attributes_input)

let describe_fleet_location_capacity_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_capacity =
       option_of_yojson (value_for_key fleet_capacity_of_yojson "FleetCapacity") _list path;
   }
    : describe_fleet_location_capacity_output)

let describe_fleet_location_capacity_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     location = value_for_key location_string_model_of_yojson "Location" _list path;
   }
    : describe_fleet_location_capacity_input)

let fleet_utilization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     active_server_process_count =
       option_of_yojson (value_for_key whole_number_of_yojson "ActiveServerProcessCount") _list path;
     active_game_session_count =
       option_of_yojson (value_for_key whole_number_of_yojson "ActiveGameSessionCount") _list path;
     current_player_session_count =
       option_of_yojson
         (value_for_key whole_number_of_yojson "CurrentPlayerSessionCount")
         _list path;
     maximum_player_session_count =
       option_of_yojson
         (value_for_key whole_number_of_yojson "MaximumPlayerSessionCount")
         _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
   }
    : fleet_utilization)

let describe_fleet_location_utilization_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_utilization =
       option_of_yojson (value_for_key fleet_utilization_of_yojson "FleetUtilization") _list path;
   }
    : describe_fleet_location_utilization_output)

let describe_fleet_location_utilization_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     location = value_for_key location_string_model_of_yojson "Location" _list path;
   }
    : describe_fleet_location_utilization_input)

let describe_fleet_port_settings_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     inbound_permissions =
       option_of_yojson
         (value_for_key ip_permissions_list_of_yojson "InboundPermissions")
         _list path;
     update_status =
       option_of_yojson (value_for_key location_update_status_of_yojson "UpdateStatus") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
   }
    : describe_fleet_port_settings_output)

let describe_fleet_port_settings_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
   }
    : describe_fleet_port_settings_input)

let fleet_utilization_list_of_yojson tree path =
  list_of_yojson fleet_utilization_of_yojson tree path

let describe_fleet_utilization_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_utilization =
       option_of_yojson
         (value_for_key fleet_utilization_list_of_yojson "FleetUtilization")
         _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_fleet_utilization_output)

let describe_fleet_utilization_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_ids =
       option_of_yojson (value_for_key fleet_id_or_arn_list_of_yojson "FleetIds") _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_fleet_utilization_input)

let describe_game_server_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ game_server = option_of_yojson (value_for_key game_server_of_yojson "GameServer") _list path }
    : describe_game_server_output)

let describe_game_server_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group_name =
       value_for_key game_server_group_name_or_arn_of_yojson "GameServerGroupName" _list path;
     game_server_id = value_for_key game_server_id_of_yojson "GameServerId" _list path;
   }
    : describe_game_server_input)

let describe_game_server_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group =
       option_of_yojson (value_for_key game_server_group_of_yojson "GameServerGroup") _list path;
   }
    : describe_game_server_group_output)

let describe_game_server_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group_name =
       value_for_key game_server_group_name_or_arn_of_yojson "GameServerGroupName" _list path;
   }
    : describe_game_server_group_input)

let game_server_instance_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "DRAINING" -> DRAINING
    | `String "SPOT_TERMINATING" -> SPOT_TERMINATING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GameServerInstanceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "GameServerInstanceStatus")
     : game_server_instance_status)
    : game_server_instance_status)

let game_server_instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group_name =
       option_of_yojson
         (value_for_key game_server_group_name_of_yojson "GameServerGroupName")
         _list path;
     game_server_group_arn =
       option_of_yojson
         (value_for_key game_server_group_arn_of_yojson "GameServerGroupArn")
         _list path;
     instance_id =
       option_of_yojson (value_for_key game_server_instance_id_of_yojson "InstanceId") _list path;
     instance_status =
       option_of_yojson
         (value_for_key game_server_instance_status_of_yojson "InstanceStatus")
         _list path;
   }
    : game_server_instance)

let game_server_instances_of_yojson tree path =
  list_of_yojson game_server_instance_of_yojson tree path

let describe_game_server_instances_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_instances =
       option_of_yojson
         (value_for_key game_server_instances_of_yojson "GameServerInstances")
         _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_game_server_instances_output)

let game_server_instance_ids_of_yojson tree path =
  list_of_yojson game_server_instance_id_of_yojson tree path

let describe_game_server_instances_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group_name =
       value_for_key game_server_group_name_or_arn_of_yojson "GameServerGroupName" _list path;
     instance_ids =
       option_of_yojson (value_for_key game_server_instance_ids_of_yojson "InstanceIds") _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_game_server_instances_input)

let game_session_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session = option_of_yojson (value_for_key game_session_of_yojson "GameSession") _list path;
     protection_policy =
       option_of_yojson (value_for_key protection_policy_of_yojson "ProtectionPolicy") _list path;
   }
    : game_session_detail)

let game_session_detail_list_of_yojson tree path =
  list_of_yojson game_session_detail_of_yojson tree path

let describe_game_session_details_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session_details =
       option_of_yojson
         (value_for_key game_session_detail_list_of_yojson "GameSessionDetails")
         _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_game_session_details_output)

let describe_game_session_details_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_or_arn_of_yojson "FleetId") _list path;
     game_session_id =
       option_of_yojson (value_for_key arn_string_model_of_yojson "GameSessionId") _list path;
     alias_id = option_of_yojson (value_for_key alias_id_or_arn_of_yojson "AliasId") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
     status_filter =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "StatusFilter") _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_game_session_details_input)

let location_order_override_list_of_yojson tree path =
  list_of_yojson location_string_model_of_yojson tree path

let placement_fallback_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEFAULT_AFTER_SINGLE_PASS" -> DEFAULT_AFTER_SINGLE_PASS
    | `String "NONE" -> NONE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PlacementFallbackStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "PlacementFallbackStrategy")
     : placement_fallback_strategy)
    : placement_fallback_strategy)

let priority_configuration_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     placement_fallback_strategy =
       option_of_yojson
         (value_for_key placement_fallback_strategy_of_yojson "PlacementFallbackStrategy")
         _list path;
     location_order =
       value_for_key location_order_override_list_of_yojson "LocationOrder" _list path;
   }
    : priority_configuration_override)

let placed_player_session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     player_id = option_of_yojson (value_for_key player_id_of_yojson "PlayerId") _list path;
     player_session_id =
       option_of_yojson (value_for_key player_session_id_of_yojson "PlayerSessionId") _list path;
   }
    : placed_player_session)

let placed_player_session_list_of_yojson tree path =
  list_of_yojson placed_player_session_of_yojson tree path

let float__of_yojson = float_of_yojson

let player_latency_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     player_id = option_of_yojson (value_for_key player_id_of_yojson "PlayerId") _list path;
     region_identifier =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "RegionIdentifier")
         _list path;
     latency_in_milliseconds =
       option_of_yojson (value_for_key float__of_yojson "LatencyInMilliseconds") _list path;
   }
    : player_latency)

let player_latency_list_of_yojson tree path = list_of_yojson player_latency_of_yojson tree path

let game_session_placement_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "FULFILLED" -> FULFILLED
    | `String "CANCELLED" -> CANCELLED
    | `String "TIMED_OUT" -> TIMED_OUT
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GameSessionPlacementState" value)
    | _ -> raise (deserialize_wrong_type_error path "GameSessionPlacementState")
     : game_session_placement_state)
    : game_session_placement_state)

let game_session_placement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     placement_id =
       option_of_yojson (value_for_key id_string_model_of_yojson "PlacementId") _list path;
     game_session_queue_name =
       option_of_yojson
         (value_for_key game_session_queue_name_of_yojson "GameSessionQueueName")
         _list path;
     status =
       option_of_yojson (value_for_key game_session_placement_state_of_yojson "Status") _list path;
     game_properties =
       option_of_yojson (value_for_key game_property_list_of_yojson "GameProperties") _list path;
     maximum_player_session_count =
       option_of_yojson
         (value_for_key whole_number_of_yojson "MaximumPlayerSessionCount")
         _list path;
     game_session_name =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "GameSessionName")
         _list path;
     game_session_id =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "GameSessionId") _list path;
     game_session_arn =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "GameSessionArn")
         _list path;
     game_session_region =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "GameSessionRegion")
         _list path;
     player_latencies =
       option_of_yojson (value_for_key player_latency_list_of_yojson "PlayerLatencies") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "IpAddress") _list path;
     dns_name = option_of_yojson (value_for_key dns_name_of_yojson "DnsName") _list path;
     port = option_of_yojson (value_for_key port_number_of_yojson "Port") _list path;
     placed_player_sessions =
       option_of_yojson
         (value_for_key placed_player_session_list_of_yojson "PlacedPlayerSessions")
         _list path;
     game_session_data =
       option_of_yojson
         (value_for_key large_game_session_data_of_yojson "GameSessionData")
         _list path;
     matchmaker_data =
       option_of_yojson (value_for_key matchmaker_data_of_yojson "MatchmakerData") _list path;
     priority_configuration_override =
       option_of_yojson
         (value_for_key priority_configuration_override_of_yojson "PriorityConfigurationOverride")
         _list path;
     player_gateway_status =
       option_of_yojson
         (value_for_key player_gateway_status_of_yojson "PlayerGatewayStatus")
         _list path;
   }
    : game_session_placement)

let describe_game_session_placement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session_placement =
       option_of_yojson
         (value_for_key game_session_placement_of_yojson "GameSessionPlacement")
         _list path;
   }
    : describe_game_session_placement_output)

let describe_game_session_placement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ placement_id = value_for_key id_string_model_of_yojson "PlacementId" _list path }
    : describe_game_session_placement_input)

let game_session_queue_list_of_yojson tree path =
  list_of_yojson game_session_queue_of_yojson tree path

let describe_game_session_queues_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session_queues =
       option_of_yojson
         (value_for_key game_session_queue_list_of_yojson "GameSessionQueues")
         _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_game_session_queues_output)

let game_session_queue_name_or_arn_list_of_yojson tree path =
  list_of_yojson game_session_queue_name_or_arn_of_yojson tree path

let describe_game_session_queues_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     names =
       option_of_yojson
         (value_for_key game_session_queue_name_or_arn_list_of_yojson "Names")
         _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_game_session_queues_input)

let game_session_list_of_yojson tree path = list_of_yojson game_session_of_yojson tree path

let describe_game_sessions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_sessions =
       option_of_yojson (value_for_key game_session_list_of_yojson "GameSessions") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_game_sessions_output)

let describe_game_sessions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_or_arn_of_yojson "FleetId") _list path;
     game_session_id =
       option_of_yojson (value_for_key arn_string_model_of_yojson "GameSessionId") _list path;
     alias_id = option_of_yojson (value_for_key alias_id_or_arn_of_yojson "AliasId") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
     status_filter =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "StatusFilter") _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_game_sessions_input)

let instance_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "ACTIVE" -> ACTIVE
    | `String "TERMINATING" -> TERMINATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceStatus")
     : instance_status)
    : instance_status)

let instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "IpAddress") _list path;
     dns_name = option_of_yojson (value_for_key dns_name_of_yojson "DnsName") _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
     type_ = option_of_yojson (value_for_key ec2_instance_type_of_yojson "Type") _list path;
     status = option_of_yojson (value_for_key instance_status_of_yojson "Status") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
   }
    : instance)

let instance_list_of_yojson tree path = list_of_yojson instance_of_yojson tree path

let describe_instances_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instances = option_of_yojson (value_for_key instance_list_of_yojson "Instances") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_instances_output)

let describe_instances_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
   }
    : describe_instances_input)

let matched_player_session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     player_id = option_of_yojson (value_for_key player_id_of_yojson "PlayerId") _list path;
     player_session_id =
       option_of_yojson (value_for_key player_session_id_of_yojson "PlayerSessionId") _list path;
   }
    : matched_player_session)

let matched_player_session_list_of_yojson tree path =
  list_of_yojson matched_player_session_of_yojson tree path

let game_session_connection_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session_arn =
       option_of_yojson (value_for_key arn_string_model_of_yojson "GameSessionArn") _list path;
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "IpAddress") _list path;
     dns_name = option_of_yojson (value_for_key dns_name_of_yojson "DnsName") _list path;
     port = option_of_yojson (value_for_key positive_integer_of_yojson "Port") _list path;
     matched_player_sessions =
       option_of_yojson
         (value_for_key matched_player_session_list_of_yojson "MatchedPlayerSessions")
         _list path;
     player_gateway_status =
       option_of_yojson
         (value_for_key player_gateway_status_of_yojson "PlayerGatewayStatus")
         _list path;
   }
    : game_session_connection_info)

let latency_map_of_yojson tree path =
  map_of_yojson non_empty_string_of_yojson positive_integer_of_yojson tree path

let player_attribute_map_of_yojson tree path =
  map_of_yojson non_zero_and_max_string_of_yojson attribute_value_of_yojson tree path

let player_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     player_id = option_of_yojson (value_for_key player_id_of_yojson "PlayerId") _list path;
     player_attributes =
       option_of_yojson (value_for_key player_attribute_map_of_yojson "PlayerAttributes") _list path;
     team = option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Team") _list path;
     latency_in_ms = option_of_yojson (value_for_key latency_map_of_yojson "LatencyInMs") _list path;
   }
    : player)

let player_list_of_yojson tree path = list_of_yojson player_of_yojson tree path
let string_model_of_yojson = string_of_yojson

let matchmaking_configuration_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CANCELLED" -> CANCELLED
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String "PLACING" -> PLACING
    | `String "QUEUED" -> QUEUED
    | `String "REQUIRES_ACCEPTANCE" -> REQUIRES_ACCEPTANCE
    | `String "SEARCHING" -> SEARCHING
    | `String "TIMED_OUT" -> TIMED_OUT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MatchmakingConfigurationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "MatchmakingConfigurationStatus")
     : matchmaking_configuration_status)
    : matchmaking_configuration_status)

let matchmaking_ticket_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ticket_id =
       option_of_yojson (value_for_key matchmaking_id_string_model_of_yojson "TicketId") _list path;
     configuration_name =
       option_of_yojson
         (value_for_key matchmaking_id_string_model_of_yojson "ConfigurationName")
         _list path;
     configuration_arn =
       option_of_yojson
         (value_for_key matchmaking_configuration_arn_of_yojson "ConfigurationArn")
         _list path;
     status =
       option_of_yojson
         (value_for_key matchmaking_configuration_status_of_yojson "Status")
         _list path;
     status_reason =
       option_of_yojson (value_for_key string_model_of_yojson "StatusReason") _list path;
     status_message =
       option_of_yojson (value_for_key string_model_of_yojson "StatusMessage") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     players = option_of_yojson (value_for_key player_list_of_yojson "Players") _list path;
     game_session_connection_info =
       option_of_yojson
         (value_for_key game_session_connection_info_of_yojson "GameSessionConnectionInfo")
         _list path;
     estimated_wait_time =
       option_of_yojson (value_for_key whole_number_of_yojson "EstimatedWaitTime") _list path;
   }
    : matchmaking_ticket)

let matchmaking_ticket_list_of_yojson tree path =
  list_of_yojson matchmaking_ticket_of_yojson tree path

let describe_matchmaking_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ticket_list =
       option_of_yojson (value_for_key matchmaking_ticket_list_of_yojson "TicketList") _list path;
   }
    : describe_matchmaking_output)

let matchmaking_id_list_of_yojson tree path =
  list_of_yojson matchmaking_id_string_model_of_yojson tree path

let describe_matchmaking_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ticket_ids = value_for_key matchmaking_id_list_of_yojson "TicketIds" _list path }
    : describe_matchmaking_input)

let matchmaking_configuration_list_of_yojson tree path =
  list_of_yojson matchmaking_configuration_of_yojson tree path

let describe_matchmaking_configurations_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configurations =
       option_of_yojson
         (value_for_key matchmaking_configuration_list_of_yojson "Configurations")
         _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_matchmaking_configurations_output)

let matchmaking_configuration_name_list_of_yojson tree path =
  list_of_yojson matchmaking_configuration_name_of_yojson tree path

let describe_matchmaking_configurations_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     names =
       option_of_yojson
         (value_for_key matchmaking_configuration_name_list_of_yojson "Names")
         _list path;
     rule_set_name =
       option_of_yojson (value_for_key matchmaking_rule_set_name_of_yojson "RuleSetName") _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_matchmaking_configurations_input)

let matchmaking_rule_set_list_of_yojson tree path =
  list_of_yojson matchmaking_rule_set_of_yojson tree path

let describe_matchmaking_rule_sets_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_sets = value_for_key matchmaking_rule_set_list_of_yojson "RuleSets" _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_matchmaking_rule_sets_output)

let rule_set_limit_of_yojson = int_of_yojson

let matchmaking_rule_set_name_list_of_yojson tree path =
  list_of_yojson matchmaking_rule_set_name_of_yojson tree path

let describe_matchmaking_rule_sets_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     names =
       option_of_yojson (value_for_key matchmaking_rule_set_name_list_of_yojson "Names") _list path;
     limit = option_of_yojson (value_for_key rule_set_limit_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_matchmaking_rule_sets_input)

let describe_player_sessions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     player_sessions =
       option_of_yojson (value_for_key player_session_list_of_yojson "PlayerSessions") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_player_sessions_output)

let describe_player_sessions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session_id =
       option_of_yojson (value_for_key arn_string_model_of_yojson "GameSessionId") _list path;
     player_id = option_of_yojson (value_for_key player_id_of_yojson "PlayerId") _list path;
     player_session_id =
       option_of_yojson (value_for_key player_session_id_of_yojson "PlayerSessionId") _list path;
     player_session_status_filter =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "PlayerSessionStatusFilter")
         _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_player_sessions_input)

let describe_runtime_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     runtime_configuration =
       option_of_yojson
         (value_for_key runtime_configuration_of_yojson "RuntimeConfiguration")
         _list path;
   }
    : describe_runtime_configuration_output)

let describe_runtime_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path }
    : describe_runtime_configuration_input)

let double_of_yojson = double_of_yojson

let target_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ target_value = value_for_key double_of_yojson "TargetValue" _list path }
    : target_configuration)

let policy_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RuleBased" -> RuleBased
    | `String "TargetBased" -> TargetBased
    | `String value -> raise (deserialize_unknown_enum_value_error path "PolicyType" value)
    | _ -> raise (deserialize_wrong_type_error path "PolicyType")
     : policy_type)
    : policy_type)

let metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "ActivatingGameSessions" -> ActivatingGameSessions
    | `String "ActiveGameSessions" -> ActiveGameSessions
    | `String "ActiveInstances" -> ActiveInstances
    | `String "AvailableGameSessions" -> AvailableGameSessions
    | `String "AvailablePlayerSessions" -> AvailablePlayerSessions
    | `String "CurrentPlayerSessions" -> CurrentPlayerSessions
    | `String "IdleInstances" -> IdleInstances
    | `String "PercentAvailableGameSessions" -> PercentAvailableGameSessions
    | `String "PercentIdleInstances" -> PercentIdleInstances
    | `String "QueueDepth" -> QueueDepth
    | `String "WaitTime" -> WaitTime
    | `String "ConcurrentActivatableGameSessions" -> ConcurrentActivatableGameSessions
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricName")
     : metric_name)
    : metric_name)

let scaling_adjustment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ChangeInCapacity" -> ChangeInCapacity
    | `String "ExactCapacity" -> ExactCapacity
    | `String "PercentChangeInCapacity" -> PercentChangeInCapacity
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ScalingAdjustmentType" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalingAdjustmentType")
     : scaling_adjustment_type)
    : scaling_adjustment_type)

let integer_of_yojson = int_of_yojson

let scaling_status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "UPDATE_REQUESTED" -> UPDATE_REQUESTED
    | `String "UPDATING" -> UPDATING
    | `String "DELETE_REQUESTED" -> DELETE_REQUESTED
    | `String "DELETING" -> DELETING
    | `String "DELETED" -> DELETED
    | `String "ERROR" -> ERROR
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScalingStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalingStatusType")
     : scaling_status_type)
    : scaling_status_type)

let scaling_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     name = option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key scaling_status_type_of_yojson "Status") _list path;
     scaling_adjustment =
       option_of_yojson (value_for_key integer_of_yojson "ScalingAdjustment") _list path;
     scaling_adjustment_type =
       option_of_yojson
         (value_for_key scaling_adjustment_type_of_yojson "ScalingAdjustmentType")
         _list path;
     comparison_operator =
       option_of_yojson
         (value_for_key comparison_operator_type_of_yojson "ComparisonOperator")
         _list path;
     threshold = option_of_yojson (value_for_key double_of_yojson "Threshold") _list path;
     evaluation_periods =
       option_of_yojson (value_for_key positive_integer_of_yojson "EvaluationPeriods") _list path;
     metric_name = option_of_yojson (value_for_key metric_name_of_yojson "MetricName") _list path;
     policy_type = option_of_yojson (value_for_key policy_type_of_yojson "PolicyType") _list path;
     target_configuration =
       option_of_yojson
         (value_for_key target_configuration_of_yojson "TargetConfiguration")
         _list path;
     update_status =
       option_of_yojson (value_for_key location_update_status_of_yojson "UpdateStatus") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
   }
    : scaling_policy)

let scaling_policy_list_of_yojson tree path = list_of_yojson scaling_policy_of_yojson tree path

let describe_scaling_policies_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_policies =
       option_of_yojson (value_for_key scaling_policy_list_of_yojson "ScalingPolicies") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : describe_scaling_policies_output)

let describe_scaling_policies_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     status_filter =
       option_of_yojson (value_for_key scaling_status_type_of_yojson "StatusFilter") _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
   }
    : describe_scaling_policies_input)

let describe_script_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ script = option_of_yojson (value_for_key script_of_yojson "Script") _list path }
    : describe_script_output)

let describe_script_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ script_id = value_for_key script_id_or_arn_of_yojson "ScriptId" _list path }
    : describe_script_input)

let vpc_peering_authorization_list_of_yojson tree path =
  list_of_yojson vpc_peering_authorization_of_yojson tree path

let describe_vpc_peering_authorizations_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_peering_authorizations =
       option_of_yojson
         (value_for_key vpc_peering_authorization_list_of_yojson "VpcPeeringAuthorizations")
         _list path;
   }
    : describe_vpc_peering_authorizations_output)

let describe_vpc_peering_authorizations_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let vpc_peering_connection_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Code") _list path;
     message =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Message") _list path;
   }
    : vpc_peering_connection_status)

let vpc_peering_connection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     ip_v4_cidr_block =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "IpV4CidrBlock") _list path;
     vpc_peering_connection_id =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "VpcPeeringConnectionId")
         _list path;
     status =
       option_of_yojson (value_for_key vpc_peering_connection_status_of_yojson "Status") _list path;
     peer_vpc_id =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "PeerVpcId") _list path;
     game_lift_vpc_id =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "GameLiftVpcId") _list path;
   }
    : vpc_peering_connection)

let vpc_peering_connection_list_of_yojson tree path =
  list_of_yojson vpc_peering_connection_of_yojson tree path

let describe_vpc_peering_connections_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_peering_connections =
       option_of_yojson
         (value_for_key vpc_peering_connection_list_of_yojson "VpcPeeringConnections")
         _list path;
   }
    : describe_vpc_peering_connections_output)

let describe_vpc_peering_connections_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path }
    : describe_vpc_peering_connections_input)

let desired_player_session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     player_id = option_of_yojson (value_for_key player_id_of_yojson "PlayerId") _list path;
     player_data = option_of_yojson (value_for_key player_data_of_yojson "PlayerData") _list path;
   }
    : desired_player_session)

let desired_player_session_list_of_yojson tree path =
  list_of_yojson desired_player_session_of_yojson tree path

let dns_name_input_of_yojson = string_of_yojson
let fleet_deployments_of_yojson tree path = list_of_yojson fleet_deployment_of_yojson tree path
let fleet_id_list_of_yojson tree path = list_of_yojson fleet_id_of_yojson tree path

let validate_matchmaking_rule_set_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ valid = option_of_yojson (value_for_key boolean_model_of_yojson "Valid") _list path }
    : validate_matchmaking_rule_set_output)

let validate_matchmaking_rule_set_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule_set_body = value_for_key rule_set_body_of_yojson "RuleSetBody" _list path }
    : validate_matchmaking_rule_set_input)

let update_script_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ script = option_of_yojson (value_for_key script_of_yojson "Script") _list path }
    : update_script_output)

let update_script_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     script_id = value_for_key script_id_or_arn_of_yojson "ScriptId" _list path;
     name = option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Name") _list path;
     version =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Version") _list path;
     storage_location =
       option_of_yojson (value_for_key s3_location_of_yojson "StorageLocation") _list path;
     zip_file = option_of_yojson (value_for_key zip_blob_of_yojson "ZipFile") _list path;
   }
    : update_script_input)

let update_runtime_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     runtime_configuration =
       option_of_yojson
         (value_for_key runtime_configuration_of_yojson "RuntimeConfiguration")
         _list path;
   }
    : update_runtime_configuration_output)

let update_runtime_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     runtime_configuration =
       value_for_key runtime_configuration_of_yojson "RuntimeConfiguration" _list path;
   }
    : update_runtime_configuration_input)

let update_matchmaking_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key matchmaking_configuration_of_yojson "Configuration")
         _list path;
   }
    : update_matchmaking_configuration_output)

let update_matchmaking_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key matchmaking_configuration_name_of_yojson "Name" _list path;
     description =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Description") _list path;
     game_session_queue_arns =
       option_of_yojson (value_for_key queue_arns_list_of_yojson "GameSessionQueueArns") _list path;
     request_timeout_seconds =
       option_of_yojson
         (value_for_key matchmaking_request_timeout_integer_of_yojson "RequestTimeoutSeconds")
         _list path;
     acceptance_timeout_seconds =
       option_of_yojson
         (value_for_key matchmaking_acceptance_timeout_integer_of_yojson "AcceptanceTimeoutSeconds")
         _list path;
     acceptance_required =
       option_of_yojson (value_for_key boolean_model_of_yojson "AcceptanceRequired") _list path;
     rule_set_name =
       option_of_yojson (value_for_key matchmaking_rule_set_name_of_yojson "RuleSetName") _list path;
     notification_target =
       option_of_yojson
         (value_for_key sns_arn_string_model_of_yojson "NotificationTarget")
         _list path;
     additional_player_count =
       option_of_yojson (value_for_key whole_number_of_yojson "AdditionalPlayerCount") _list path;
     custom_event_data =
       option_of_yojson (value_for_key custom_event_data_of_yojson "CustomEventData") _list path;
     game_properties =
       option_of_yojson (value_for_key game_property_list_of_yojson "GameProperties") _list path;
     game_session_data =
       option_of_yojson (value_for_key game_session_data_of_yojson "GameSessionData") _list path;
     backfill_mode =
       option_of_yojson (value_for_key backfill_mode_of_yojson "BackfillMode") _list path;
     flex_match_mode =
       option_of_yojson (value_for_key flex_match_mode_of_yojson "FlexMatchMode") _list path;
   }
    : update_matchmaking_configuration_input)

let update_game_session_queue_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session_queue =
       option_of_yojson (value_for_key game_session_queue_of_yojson "GameSessionQueue") _list path;
   }
    : update_game_session_queue_output)

let update_game_session_queue_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key game_session_queue_name_or_arn_of_yojson "Name" _list path;
     timeout_in_seconds =
       option_of_yojson (value_for_key whole_number_of_yojson "TimeoutInSeconds") _list path;
     player_latency_policies =
       option_of_yojson
         (value_for_key player_latency_policy_list_of_yojson "PlayerLatencyPolicies")
         _list path;
     destinations =
       option_of_yojson
         (value_for_key game_session_queue_destination_list_of_yojson "Destinations")
         _list path;
     filter_configuration =
       option_of_yojson
         (value_for_key filter_configuration_of_yojson "FilterConfiguration")
         _list path;
     priority_configuration =
       option_of_yojson
         (value_for_key priority_configuration_of_yojson "PriorityConfiguration")
         _list path;
     custom_event_data =
       option_of_yojson
         (value_for_key queue_custom_event_data_of_yojson "CustomEventData")
         _list path;
     notification_target =
       option_of_yojson
         (value_for_key queue_sns_arn_string_model_of_yojson "NotificationTarget")
         _list path;
   }
    : update_game_session_queue_input)

let update_game_session_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session = option_of_yojson (value_for_key game_session_of_yojson "GameSession") _list path;
   }
    : update_game_session_output)

let update_game_session_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session_id = value_for_key arn_string_model_of_yojson "GameSessionId" _list path;
     maximum_player_session_count =
       option_of_yojson
         (value_for_key whole_number_of_yojson "MaximumPlayerSessionCount")
         _list path;
     name = option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Name") _list path;
     player_session_creation_policy =
       option_of_yojson
         (value_for_key player_session_creation_policy_of_yojson "PlayerSessionCreationPolicy")
         _list path;
     protection_policy =
       option_of_yojson (value_for_key protection_policy_of_yojson "ProtectionPolicy") _list path;
     game_properties =
       option_of_yojson (value_for_key game_property_list_of_yojson "GameProperties") _list path;
   }
    : update_game_session_input)

let update_game_server_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group =
       option_of_yojson (value_for_key game_server_group_of_yojson "GameServerGroup") _list path;
   }
    : update_game_server_group_output)

let update_game_server_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group_name =
       value_for_key game_server_group_name_or_arn_of_yojson "GameServerGroupName" _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     instance_definitions =
       option_of_yojson
         (value_for_key instance_definitions_of_yojson "InstanceDefinitions")
         _list path;
     game_server_protection_policy =
       option_of_yojson
         (value_for_key game_server_protection_policy_of_yojson "GameServerProtectionPolicy")
         _list path;
     balancing_strategy =
       option_of_yojson (value_for_key balancing_strategy_of_yojson "BalancingStrategy") _list path;
   }
    : update_game_server_group_input)

let update_game_server_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ game_server = option_of_yojson (value_for_key game_server_of_yojson "GameServer") _list path }
    : update_game_server_output)

let game_server_health_check_of_yojson (tree : t) path =
  ((match tree with
    | `String "HEALTHY" -> HEALTHY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GameServerHealthCheck" value)
    | _ -> raise (deserialize_wrong_type_error path "GameServerHealthCheck")
     : game_server_health_check)
    : game_server_health_check)

let update_game_server_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group_name =
       value_for_key game_server_group_name_or_arn_of_yojson "GameServerGroupName" _list path;
     game_server_id = value_for_key game_server_id_of_yojson "GameServerId" _list path;
     game_server_data =
       option_of_yojson (value_for_key game_server_data_of_yojson "GameServerData") _list path;
     utilization_status =
       option_of_yojson
         (value_for_key game_server_utilization_status_of_yojson "UtilizationStatus")
         _list path;
     health_check =
       option_of_yojson (value_for_key game_server_health_check_of_yojson "HealthCheck") _list path;
   }
    : update_game_server_input)

let update_fleet_port_settings_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
   }
    : update_fleet_port_settings_output)

let update_fleet_port_settings_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     inbound_permission_authorizations =
       option_of_yojson
         (value_for_key ip_permissions_list_of_yojson "InboundPermissionAuthorizations")
         _list path;
     inbound_permission_revocations =
       option_of_yojson
         (value_for_key ip_permissions_list_of_yojson "InboundPermissionRevocations")
         _list path;
   }
    : update_fleet_port_settings_input)

let update_fleet_capacity_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
     managed_capacity_configuration =
       option_of_yojson
         (value_for_key managed_capacity_configuration_of_yojson "ManagedCapacityConfiguration")
         _list path;
   }
    : update_fleet_capacity_output)

let update_fleet_capacity_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     desired_instances =
       option_of_yojson (value_for_key whole_number_of_yojson "DesiredInstances") _list path;
     min_size = option_of_yojson (value_for_key whole_number_of_yojson "MinSize") _list path;
     max_size = option_of_yojson (value_for_key whole_number_of_yojson "MaxSize") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
     managed_capacity_configuration =
       option_of_yojson
         (value_for_key managed_capacity_configuration_of_yojson "ManagedCapacityConfiguration")
         _list path;
   }
    : update_fleet_capacity_input)

let update_fleet_attributes_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
   }
    : update_fleet_attributes_output)

let update_fleet_attributes_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     name = option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Name") _list path;
     description =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Description") _list path;
     new_game_session_protection_policy =
       option_of_yojson
         (value_for_key protection_policy_of_yojson "NewGameSessionProtectionPolicy")
         _list path;
     resource_creation_limit_policy =
       option_of_yojson
         (value_for_key resource_creation_limit_policy_of_yojson "ResourceCreationLimitPolicy")
         _list path;
     metric_groups =
       option_of_yojson (value_for_key metric_group_list_of_yojson "MetricGroups") _list path;
     anywhere_configuration =
       option_of_yojson
         (value_for_key anywhere_configuration_of_yojson "AnywhereConfiguration")
         _list path;
   }
    : update_fleet_attributes_input)

let update_container_group_definition_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_group_definition =
       option_of_yojson
         (value_for_key container_group_definition_of_yojson "ContainerGroupDefinition")
         _list path;
   }
    : update_container_group_definition_output)

let update_container_group_definition_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key container_group_definition_name_or_arn_of_yojson "Name" _list path;
     game_server_container_definition =
       option_of_yojson
         (value_for_key game_server_container_definition_input_of_yojson
            "GameServerContainerDefinition")
         _list path;
     support_container_definitions =
       option_of_yojson
         (value_for_key support_container_definition_input_list_of_yojson
            "SupportContainerDefinitions")
         _list path;
     total_memory_limit_mebibytes =
       option_of_yojson
         (value_for_key container_total_memory_limit_of_yojson "TotalMemoryLimitMebibytes")
         _list path;
     total_vcpu_limit =
       option_of_yojson
         (value_for_key container_total_vcpu_limit_of_yojson "TotalVcpuLimit")
         _list path;
     version_description =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "VersionDescription")
         _list path;
     source_version_number =
       option_of_yojson (value_for_key positive_integer_of_yojson "SourceVersionNumber") _list path;
     operating_system =
       option_of_yojson
         (value_for_key container_operating_system_of_yojson "OperatingSystem")
         _list path;
   }
    : update_container_group_definition_input)

let update_container_fleet_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_fleet =
       option_of_yojson (value_for_key container_fleet_of_yojson "ContainerFleet") _list path;
   }
    : update_container_fleet_output)

let update_container_fleet_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     game_server_container_group_definition_name =
       option_of_yojson
         (value_for_key container_group_definition_name_or_arn_of_yojson
            "GameServerContainerGroupDefinitionName")
         _list path;
     per_instance_container_group_definition_name =
       option_of_yojson
         (value_for_key container_group_definition_name_or_arn_of_yojson
            "PerInstanceContainerGroupDefinitionName")
         _list path;
     game_server_container_groups_per_instance =
       option_of_yojson
         (value_for_key game_server_container_groups_per_instance_of_yojson
            "GameServerContainerGroupsPerInstance")
         _list path;
     instance_connection_port_range =
       option_of_yojson
         (value_for_key connection_port_range_of_yojson "InstanceConnectionPortRange")
         _list path;
     instance_inbound_permission_authorizations =
       option_of_yojson
         (value_for_key ip_permissions_list_of_yojson "InstanceInboundPermissionAuthorizations")
         _list path;
     instance_inbound_permission_revocations =
       option_of_yojson
         (value_for_key ip_permissions_list_of_yojson "InstanceInboundPermissionRevocations")
         _list path;
     deployment_configuration =
       option_of_yojson
         (value_for_key deployment_configuration_of_yojson "DeploymentConfiguration")
         _list path;
     description =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Description") _list path;
     metric_groups =
       option_of_yojson (value_for_key metric_group_list_of_yojson "MetricGroups") _list path;
     new_game_session_protection_policy =
       option_of_yojson
         (value_for_key protection_policy_of_yojson "NewGameSessionProtectionPolicy")
         _list path;
     game_session_creation_limit_policy =
       option_of_yojson
         (value_for_key game_session_creation_limit_policy_of_yojson
            "GameSessionCreationLimitPolicy")
         _list path;
     log_configuration =
       option_of_yojson (value_for_key log_configuration_of_yojson "LogConfiguration") _list path;
     remove_attributes =
       option_of_yojson
         (value_for_key container_fleet_remove_attribute_list_of_yojson "RemoveAttributes")
         _list path;
   }
    : update_container_fleet_input)

let update_build_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ build = option_of_yojson (value_for_key build_of_yojson "Build") _list path }
    : update_build_output)

let update_build_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     build_id = value_for_key build_id_or_arn_of_yojson "BuildId" _list path;
     name = option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Name") _list path;
     version =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Version") _list path;
   }
    : update_build_input)

let update_alias_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ alias = option_of_yojson (value_for_key alias_of_yojson "Alias") _list path }
    : update_alias_output)

let update_alias_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alias_id = value_for_key alias_id_or_arn_of_yojson "AliasId" _list path;
     name =
       option_of_yojson
         (value_for_key non_blank_and_length_constraint_string_of_yojson "Name")
         _list path;
     description =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Description") _list path;
     routing_strategy =
       option_of_yojson (value_for_key routing_strategy_of_yojson "RoutingStrategy") _list path;
   }
    : update_alias_input)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let terminate_game_session_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session = option_of_yojson (value_for_key game_session_of_yojson "GameSession") _list path;
   }
    : terminate_game_session_output)

let termination_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "TRIGGER_ON_PROCESS_TERMINATE" -> TRIGGER_ON_PROCESS_TERMINATE
    | `String "FORCE_TERMINATE" -> FORCE_TERMINATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TerminationMode" value)
    | _ -> raise (deserialize_wrong_type_error path "TerminationMode")
     : termination_mode)
    : termination_mode)

let terminate_game_session_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session_id = value_for_key arn_string_model_of_yojson "GameSessionId" _list path;
     termination_mode = value_for_key termination_mode_of_yojson "TerminationMode" _list path;
   }
    : terminate_game_session_input)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let suspend_game_server_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group =
       option_of_yojson (value_for_key game_server_group_of_yojson "GameServerGroup") _list path;
   }
    : suspend_game_server_group_output)

let suspend_game_server_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group_name =
       value_for_key game_server_group_name_or_arn_of_yojson "GameServerGroupName" _list path;
     suspend_actions = value_for_key game_server_group_actions_of_yojson "SuspendActions" _list path;
   }
    : suspend_game_server_group_input)

let stop_matchmaking_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_matchmaking_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ticket_id = value_for_key matchmaking_id_string_model_of_yojson "TicketId" _list path }
    : stop_matchmaking_input)

let stop_game_session_placement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session_placement =
       option_of_yojson
         (value_for_key game_session_placement_of_yojson "GameSessionPlacement")
         _list path;
   }
    : stop_game_session_placement_output)

let stop_game_session_placement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ placement_id = value_for_key id_string_model_of_yojson "PlacementId" _list path }
    : stop_game_session_placement_input)

let stop_fleet_actions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
   }
    : stop_fleet_actions_output)

let stop_fleet_actions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     actions = value_for_key fleet_action_list_of_yojson "Actions" _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
   }
    : stop_fleet_actions_input)

let start_matchmaking_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     matchmaking_ticket =
       option_of_yojson (value_for_key matchmaking_ticket_of_yojson "MatchmakingTicket") _list path;
   }
    : start_matchmaking_output)

let start_matchmaking_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ticket_id =
       option_of_yojson (value_for_key matchmaking_id_string_model_of_yojson "TicketId") _list path;
     configuration_name =
       value_for_key matchmaking_configuration_name_of_yojson "ConfigurationName" _list path;
     players = value_for_key player_list_of_yojson "Players" _list path;
   }
    : start_matchmaking_input)

let start_match_backfill_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     matchmaking_ticket =
       option_of_yojson (value_for_key matchmaking_ticket_of_yojson "MatchmakingTicket") _list path;
   }
    : start_match_backfill_output)

let start_match_backfill_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ticket_id =
       option_of_yojson (value_for_key matchmaking_id_string_model_of_yojson "TicketId") _list path;
     configuration_name =
       value_for_key matchmaking_configuration_name_of_yojson "ConfigurationName" _list path;
     game_session_arn =
       option_of_yojson (value_for_key arn_string_model_of_yojson "GameSessionArn") _list path;
     players = value_for_key player_list_of_yojson "Players" _list path;
   }
    : start_match_backfill_input)

let start_game_session_placement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session_placement =
       option_of_yojson
         (value_for_key game_session_placement_of_yojson "GameSessionPlacement")
         _list path;
   }
    : start_game_session_placement_output)

let start_game_session_placement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     placement_id = value_for_key id_string_model_of_yojson "PlacementId" _list path;
     game_session_queue_name =
       value_for_key game_session_queue_name_or_arn_of_yojson "GameSessionQueueName" _list path;
     game_properties =
       option_of_yojson (value_for_key game_property_list_of_yojson "GameProperties") _list path;
     maximum_player_session_count =
       value_for_key whole_number_of_yojson "MaximumPlayerSessionCount" _list path;
     game_session_name =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "GameSessionName")
         _list path;
     player_latencies =
       option_of_yojson (value_for_key player_latency_list_of_yojson "PlayerLatencies") _list path;
     desired_player_sessions =
       option_of_yojson
         (value_for_key desired_player_session_list_of_yojson "DesiredPlayerSessions")
         _list path;
     game_session_data =
       option_of_yojson
         (value_for_key large_game_session_data_of_yojson "GameSessionData")
         _list path;
     priority_configuration_override =
       option_of_yojson
         (value_for_key priority_configuration_override_of_yojson "PriorityConfigurationOverride")
         _list path;
   }
    : start_game_session_placement_input)

let start_fleet_actions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
   }
    : start_fleet_actions_output)

let start_fleet_actions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     actions = value_for_key fleet_action_list_of_yojson "Actions" _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
   }
    : start_fleet_actions_input)

let search_game_sessions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_sessions =
       option_of_yojson (value_for_key game_session_list_of_yojson "GameSessions") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : search_game_sessions_output)

let search_game_sessions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_or_arn_of_yojson "FleetId") _list path;
     alias_id = option_of_yojson (value_for_key alias_id_or_arn_of_yojson "AliasId") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
     filter_expression =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "FilterExpression")
         _list path;
     sort_expression =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "SortExpression")
         _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : search_game_sessions_input)

let resume_game_server_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group =
       option_of_yojson (value_for_key game_server_group_of_yojson "GameServerGroup") _list path;
   }
    : resume_game_server_group_output)

let resume_game_server_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group_name =
       value_for_key game_server_group_name_or_arn_of_yojson "GameServerGroupName" _list path;
     resume_actions = value_for_key game_server_group_actions_of_yojson "ResumeActions" _list path;
   }
    : resume_game_server_group_input)

let resolve_alias_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
   }
    : resolve_alias_output)

let resolve_alias_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ alias_id = value_for_key alias_id_or_arn_of_yojson "AliasId" _list path }
    : resolve_alias_input)

let request_upload_credentials_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     upload_credentials =
       option_of_yojson (value_for_key aws_credentials_of_yojson "UploadCredentials") _list path;
     storage_location =
       option_of_yojson (value_for_key s3_location_of_yojson "StorageLocation") _list path;
   }
    : request_upload_credentials_output)

let request_upload_credentials_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ build_id = value_for_key build_id_or_arn_of_yojson "BuildId" _list path }
    : request_upload_credentials_input)

let register_game_server_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ game_server = option_of_yojson (value_for_key game_server_of_yojson "GameServer") _list path }
    : register_game_server_output)

let register_game_server_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group_name =
       value_for_key game_server_group_name_or_arn_of_yojson "GameServerGroupName" _list path;
     game_server_id = value_for_key game_server_id_of_yojson "GameServerId" _list path;
     instance_id = value_for_key game_server_instance_id_of_yojson "InstanceId" _list path;
     connection_info =
       option_of_yojson
         (value_for_key game_server_connection_info_of_yojson "ConnectionInfo")
         _list path;
     game_server_data =
       option_of_yojson (value_for_key game_server_data_of_yojson "GameServerData") _list path;
   }
    : register_game_server_input)

let register_compute_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ compute = option_of_yojson (value_for_key compute_of_yojson "Compute") _list path }
    : register_compute_output)

let register_compute_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     compute_name = value_for_key compute_name_of_yojson "ComputeName" _list path;
     certificate_path =
       option_of_yojson
         (value_for_key non_zero_and_max_string_of_yojson "CertificatePath")
         _list path;
     dns_name = option_of_yojson (value_for_key dns_name_input_of_yojson "DnsName") _list path;
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "IpAddress") _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
   }
    : register_compute_input)

let put_scaling_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "Name") _list path }
    : put_scaling_policy_output)

let put_scaling_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key non_zero_and_max_string_of_yojson "Name" _list path;
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     scaling_adjustment =
       option_of_yojson (value_for_key integer_of_yojson "ScalingAdjustment") _list path;
     scaling_adjustment_type =
       option_of_yojson
         (value_for_key scaling_adjustment_type_of_yojson "ScalingAdjustmentType")
         _list path;
     threshold = option_of_yojson (value_for_key double_of_yojson "Threshold") _list path;
     comparison_operator =
       option_of_yojson
         (value_for_key comparison_operator_type_of_yojson "ComparisonOperator")
         _list path;
     evaluation_periods =
       option_of_yojson (value_for_key positive_integer_of_yojson "EvaluationPeriods") _list path;
     metric_name = value_for_key metric_name_of_yojson "MetricName" _list path;
     policy_type = option_of_yojson (value_for_key policy_type_of_yojson "PolicyType") _list path;
     target_configuration =
       option_of_yojson
         (value_for_key target_configuration_of_yojson "TargetConfiguration")
         _list path;
   }
    : put_scaling_policy_input)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let script_list_of_yojson tree path = list_of_yojson script_of_yojson tree path

let list_scripts_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scripts = option_of_yojson (value_for_key script_list_of_yojson "Scripts") _list path;
     next_token = option_of_yojson (value_for_key non_empty_string_of_yojson "NextToken") _list path;
   }
    : list_scripts_output)

let list_scripts_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key non_empty_string_of_yojson "NextToken") _list path;
   }
    : list_scripts_input)

let location_model_list_of_yojson tree path = list_of_yojson location_model_of_yojson tree path

let list_locations_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     locations =
       option_of_yojson (value_for_key location_model_list_of_yojson "Locations") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_locations_output)

let list_locations_limit_of_yojson = int_of_yojson

let location_filter_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS" -> AWS
    | `String "CUSTOM" -> CUSTOM
    | `String value -> raise (deserialize_unknown_enum_value_error path "LocationFilter" value)
    | _ -> raise (deserialize_wrong_type_error path "LocationFilter")
     : location_filter)
    : location_filter)

let location_filter_list_of_yojson tree path = list_of_yojson location_filter_of_yojson tree path

let list_locations_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key location_filter_list_of_yojson "Filters") _list path;
     limit = option_of_yojson (value_for_key list_locations_limit_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_locations_input)

let game_servers_of_yojson tree path = list_of_yojson game_server_of_yojson tree path

let list_game_servers_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_servers = option_of_yojson (value_for_key game_servers_of_yojson "GameServers") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_game_servers_output)

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASCENDING" -> ASCENDING
    | `String "DESCENDING" -> DESCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let list_game_servers_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_group_name =
       value_for_key game_server_group_name_or_arn_of_yojson "GameServerGroupName" _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_game_servers_input)

let game_server_groups_of_yojson tree path = list_of_yojson game_server_group_of_yojson tree path

let list_game_server_groups_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_server_groups =
       option_of_yojson (value_for_key game_server_groups_of_yojson "GameServerGroups") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_game_server_groups_output)

let list_game_server_groups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_game_server_groups_input)

let list_fleets_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_ids = option_of_yojson (value_for_key fleet_id_list_of_yojson "FleetIds") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_fleets_output)

let list_fleets_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     build_id = option_of_yojson (value_for_key build_id_or_arn_of_yojson "BuildId") _list path;
     script_id = option_of_yojson (value_for_key script_id_or_arn_of_yojson "ScriptId") _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_fleets_input)

let list_fleet_deployments_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_deployments =
       option_of_yojson (value_for_key fleet_deployments_of_yojson "FleetDeployments") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_fleet_deployments_output)

let list_fleet_deployments_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_or_arn_of_yojson "FleetId") _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_fleet_deployments_input)

let list_container_group_definition_versions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_group_definitions =
       option_of_yojson
         (value_for_key container_group_definition_list_of_yojson "ContainerGroupDefinitions")
         _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_container_group_definition_versions_output)

let list_container_group_definition_versions_limit_of_yojson = int_of_yojson

let list_container_group_definition_versions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key container_group_definition_name_or_arn_of_yojson "Name" _list path;
     limit =
       option_of_yojson
         (value_for_key list_container_group_definition_versions_limit_of_yojson "Limit")
         _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_container_group_definition_versions_input)

let list_container_group_definitions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_group_definitions =
       option_of_yojson
         (value_for_key container_group_definition_list_of_yojson "ContainerGroupDefinitions")
         _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_container_group_definitions_output)

let list_container_group_definitions_limit_of_yojson = int_of_yojson

let list_container_group_definitions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_group_type =
       option_of_yojson
         (value_for_key container_group_type_of_yojson "ContainerGroupType")
         _list path;
     limit =
       option_of_yojson
         (value_for_key list_container_group_definitions_limit_of_yojson "Limit")
         _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_container_group_definitions_input)

let list_container_fleets_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_fleets =
       option_of_yojson (value_for_key container_fleet_list_of_yojson "ContainerFleets") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_container_fleets_output)

let list_container_fleets_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_group_definition_name =
       option_of_yojson
         (value_for_key container_group_definition_name_or_arn_of_yojson
            "ContainerGroupDefinitionName")
         _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_container_fleets_input)

let list_compute_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compute_list = option_of_yojson (value_for_key compute_list_of_yojson "ComputeList") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_compute_output)

let list_compute_input_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "IMPAIRED" -> IMPAIRED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ListComputeInputStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ListComputeInputStatus")
     : list_compute_input_status)
    : list_compute_input_status)

let list_compute_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     location =
       option_of_yojson (value_for_key location_string_model_of_yojson "Location") _list path;
     container_group_definition_name =
       option_of_yojson
         (value_for_key container_group_definition_name_or_arn_of_yojson
            "ContainerGroupDefinitionName")
         _list path;
     compute_status =
       option_of_yojson
         (value_for_key list_compute_input_status_of_yojson "ComputeStatus")
         _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "NextToken") _list path;
   }
    : list_compute_input)

let list_builds_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     builds = option_of_yojson (value_for_key build_list_of_yojson "Builds") _list path;
     next_token = option_of_yojson (value_for_key non_empty_string_of_yojson "NextToken") _list path;
   }
    : list_builds_output)

let list_builds_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key build_status_of_yojson "Status") _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key non_empty_string_of_yojson "NextToken") _list path;
   }
    : list_builds_input)

let list_aliases_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aliases = option_of_yojson (value_for_key alias_list_of_yojson "Aliases") _list path;
     next_token = option_of_yojson (value_for_key non_empty_string_of_yojson "NextToken") _list path;
   }
    : list_aliases_output)

let list_aliases_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     routing_strategy_type =
       option_of_yojson
         (value_for_key routing_strategy_type_of_yojson "RoutingStrategyType")
         _list path;
     name = option_of_yojson (value_for_key non_empty_string_of_yojson "Name") _list path;
     limit = option_of_yojson (value_for_key positive_integer_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key non_empty_string_of_yojson "NextToken") _list path;
   }
    : list_aliases_input)

let max_string_of_yojson = string_of_yojson

let player_connection_endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "IpAddress") _list path;
     port = option_of_yojson (value_for_key port_number_of_yojson "Port") _list path;
   }
    : player_connection_endpoint)

let player_connection_endpoint_list_of_yojson tree path =
  list_of_yojson player_connection_endpoint_of_yojson tree path

let player_connection_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     player_id = option_of_yojson (value_for_key player_id_of_yojson "PlayerId") _list path;
     endpoints =
       option_of_yojson
         (value_for_key player_connection_endpoint_list_of_yojson "Endpoints")
         _list path;
     player_gateway_token =
       option_of_yojson (value_for_key max_string_of_yojson "PlayerGatewayToken") _list path;
     expiration = option_of_yojson (value_for_key timestamp_of_yojson "Expiration") _list path;
   }
    : player_connection_detail)

let player_connection_detail_list_of_yojson tree path =
  list_of_yojson player_connection_detail_of_yojson tree path

let get_player_connection_details_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session_id =
       option_of_yojson (value_for_key arn_string_model_of_yojson "GameSessionId") _list path;
     player_connection_details =
       option_of_yojson
         (value_for_key player_connection_detail_list_of_yojson "PlayerConnectionDetails")
         _list path;
   }
    : get_player_connection_details_output)

let get_player_connection_details_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     game_session_id = value_for_key arn_string_model_of_yojson "GameSessionId" _list path;
     player_ids = value_for_key player_id_list_of_yojson "PlayerIds" _list path;
   }
    : get_player_connection_details_input)

let instance_credentials_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_name = option_of_yojson (value_for_key non_empty_string_of_yojson "UserName") _list path;
     secret = option_of_yojson (value_for_key non_empty_string_of_yojson "Secret") _list path;
   }
    : instance_credentials)

let instance_access_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_of_yojson "FleetId") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "IpAddress") _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
     credentials =
       option_of_yojson (value_for_key instance_credentials_of_yojson "Credentials") _list path;
   }
    : instance_access)

let get_instance_access_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_access =
       option_of_yojson (value_for_key instance_access_of_yojson "InstanceAccess") _list path;
   }
    : get_instance_access_output)

let get_instance_access_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     instance_id = value_for_key instance_id_of_yojson "InstanceId" _list path;
   }
    : get_instance_access_input)

let get_game_session_log_url_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pre_signed_url =
       option_of_yojson (value_for_key non_zero_and_max_string_of_yojson "PreSignedUrl") _list path;
   }
    : get_game_session_log_url_output)

let get_game_session_log_url_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ game_session_id = value_for_key arn_string_model_of_yojson "GameSessionId" _list path }
    : get_game_session_log_url_input)

let get_compute_auth_token_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_or_arn_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     compute_name =
       option_of_yojson (value_for_key compute_name_or_arn_of_yojson "ComputeName") _list path;
     compute_arn = option_of_yojson (value_for_key compute_arn_of_yojson "ComputeArn") _list path;
     auth_token =
       option_of_yojson (value_for_key compute_auth_token_of_yojson "AuthToken") _list path;
     expiration_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "ExpirationTimestamp") _list path;
   }
    : get_compute_auth_token_output)

let get_compute_auth_token_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     compute_name = value_for_key compute_name_or_arn_of_yojson "ComputeName" _list path;
   }
    : get_compute_auth_token_input)

let session_target_of_yojson = string_of_yojson

let get_compute_access_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = option_of_yojson (value_for_key fleet_id_or_arn_of_yojson "FleetId") _list path;
     fleet_arn = option_of_yojson (value_for_key fleet_arn_of_yojson "FleetArn") _list path;
     compute_name =
       option_of_yojson (value_for_key compute_name_or_arn_of_yojson "ComputeName") _list path;
     compute_arn = option_of_yojson (value_for_key compute_arn_of_yojson "ComputeArn") _list path;
     credentials =
       option_of_yojson (value_for_key aws_credentials_of_yojson "Credentials") _list path;
     target = option_of_yojson (value_for_key session_target_of_yojson "Target") _list path;
     container_identifiers =
       option_of_yojson
         (value_for_key container_identifier_list_of_yojson "ContainerIdentifiers")
         _list path;
   }
    : get_compute_access_output)

let get_compute_access_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_id = value_for_key fleet_id_or_arn_of_yojson "FleetId" _list path;
     compute_name = value_for_key compute_name_or_arn_of_yojson "ComputeName" _list path;
   }
    : get_compute_access_input)
