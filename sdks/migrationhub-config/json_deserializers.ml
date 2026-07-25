open Smaws_Lib.Json.DeserializeHelpers
open Types

let retry_after_seconds_of_yojson = int_of_yojson
let error_message_of_yojson = string_of_yojson

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key error_message_of_yojson "Message" _list path;
     retry_after_seconds =
       option_of_yojson (value_for_key retry_after_seconds_of_yojson "RetryAfterSeconds") _list path;
   }
    : throttling_exception)

let service_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : service_unavailable_exception)

let invalid_input_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_input_exception)

let internal_server_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_server_error)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : access_denied_exception)

let home_region_of_yojson = string_of_yojson

let get_home_region_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ home_region = option_of_yojson (value_for_key home_region_of_yojson "HomeRegion") _list path }
    : get_home_region_result)

let get_home_region_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let token_of_yojson = string_of_yojson
let requested_time_of_yojson = timestamp_epoch_seconds_of_yojson
let target_id_of_yojson = string_of_yojson

let target_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT" -> ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetType" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetType")
     : target_type)
    : target_type)

let target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key target_type_of_yojson "Type" _list path;
     id = option_of_yojson (value_for_key target_id_of_yojson "Id") _list path;
   }
    : target)

let control_id_of_yojson = string_of_yojson

let home_region_control_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     control_id = option_of_yojson (value_for_key control_id_of_yojson "ControlId") _list path;
     home_region = option_of_yojson (value_for_key home_region_of_yojson "HomeRegion") _list path;
     target = option_of_yojson (value_for_key target_of_yojson "Target") _list path;
     requested_time =
       option_of_yojson (value_for_key requested_time_of_yojson "RequestedTime") _list path;
   }
    : home_region_control)

let home_region_controls_of_yojson tree path =
  list_of_yojson home_region_control_of_yojson tree path

let describe_home_region_controls_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     home_region_controls =
       option_of_yojson
         (value_for_key home_region_controls_of_yojson "HomeRegionControls")
         _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : describe_home_region_controls_result)

let describe_home_region_controls_max_results_of_yojson = int_of_yojson

let describe_home_region_controls_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     control_id = option_of_yojson (value_for_key control_id_of_yojson "ControlId") _list path;
     home_region = option_of_yojson (value_for_key home_region_of_yojson "HomeRegion") _list path;
     target = option_of_yojson (value_for_key target_of_yojson "Target") _list path;
     max_results =
       option_of_yojson
         (value_for_key describe_home_region_controls_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : describe_home_region_controls_request)

let delete_home_region_control_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_home_region_control_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ control_id = value_for_key control_id_of_yojson "ControlId" _list path }
    : delete_home_region_control_request)

let dry_run_operation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : dry_run_operation)

let create_home_region_control_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     home_region_control =
       option_of_yojson (value_for_key home_region_control_of_yojson "HomeRegionControl") _list path;
   }
    : create_home_region_control_result)

let dry_run_of_yojson = bool_of_yojson

let create_home_region_control_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     home_region = value_for_key home_region_of_yojson "HomeRegion" _list path;
     target = value_for_key target_of_yojson "Target" _list path;
     dry_run = option_of_yojson (value_for_key dry_run_of_yojson "DryRun") _list path;
   }
    : create_home_region_control_request)
