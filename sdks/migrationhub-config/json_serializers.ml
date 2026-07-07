open Smaws_Lib.Json.SerializeHelpers
open Types

let token_to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson
let retry_after_seconds_to_yojson = int_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("RetryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds);
      ("Message", Some (error_message_to_yojson x.message));
    ]

let target_type_to_yojson (x : target_type) = match x with ACCOUNT -> `String "ACCOUNT"
let target_id_to_yojson = string_to_yojson

let target_to_yojson (x : target) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson target_id_to_yojson x.id);
      ("Type", Some (target_type_to_yojson x.type_));
    ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let requested_time_to_yojson = timestamp_epoch_seconds_to_yojson

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let control_id_to_yojson = string_to_yojson
let home_region_to_yojson = string_to_yojson

let home_region_control_to_yojson (x : home_region_control) =
  assoc_to_yojson
    [
      ("RequestedTime", option_to_yojson requested_time_to_yojson x.requested_time);
      ("Target", option_to_yojson target_to_yojson x.target);
      ("HomeRegion", option_to_yojson home_region_to_yojson x.home_region);
      ("ControlId", option_to_yojson control_id_to_yojson x.control_id);
    ]

let home_region_controls_to_yojson tree = list_to_yojson home_region_control_to_yojson tree

let get_home_region_result_to_yojson (x : get_home_region_result) =
  assoc_to_yojson [ ("HomeRegion", option_to_yojson home_region_to_yojson x.home_region) ]

let get_home_region_request_to_yojson = unit_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let dry_run_operation_to_yojson (x : dry_run_operation) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let dry_run_to_yojson = bool_to_yojson

let describe_home_region_controls_result_to_yojson (x : describe_home_region_controls_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("HomeRegionControls", option_to_yojson home_region_controls_to_yojson x.home_region_controls);
    ]

let describe_home_region_controls_max_results_to_yojson = int_to_yojson

let describe_home_region_controls_request_to_yojson (x : describe_home_region_controls_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "MaxResults",
        option_to_yojson describe_home_region_controls_max_results_to_yojson x.max_results );
      ("Target", option_to_yojson target_to_yojson x.target);
      ("HomeRegion", option_to_yojson home_region_to_yojson x.home_region);
      ("ControlId", option_to_yojson control_id_to_yojson x.control_id);
    ]

let delete_home_region_control_result_to_yojson = unit_to_yojson

let delete_home_region_control_request_to_yojson (x : delete_home_region_control_request) =
  assoc_to_yojson [ ("ControlId", Some (control_id_to_yojson x.control_id)) ]

let create_home_region_control_result_to_yojson (x : create_home_region_control_result) =
  assoc_to_yojson
    [ ("HomeRegionControl", option_to_yojson home_region_control_to_yojson x.home_region_control) ]

let create_home_region_control_request_to_yojson (x : create_home_region_control_request) =
  assoc_to_yojson
    [
      ("DryRun", option_to_yojson dry_run_to_yojson x.dry_run);
      ("Target", Some (target_to_yojson x.target));
      ("HomeRegion", Some (home_region_to_yojson x.home_region));
    ]
