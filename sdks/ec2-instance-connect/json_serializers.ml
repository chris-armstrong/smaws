open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let service_exception_to_yojson (x : service_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_args_exception_to_yojson (x : invalid_args_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let ec2_instance_unavailable_exception_to_yojson (x : ec2_instance_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let ec2_instance_state_invalid_exception_to_yojson (x : ec2_instance_state_invalid_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let ec2_instance_not_found_exception_to_yojson (x : ec2_instance_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let auth_exception_to_yojson (x : auth_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let success_to_yojson = bool_to_yojson
let request_id_to_yojson = string_to_yojson

let send_ssh_public_key_response_to_yojson (x : send_ssh_public_key_response) =
  assoc_to_yojson
    [
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
      ("Success", option_to_yojson success_to_yojson x.success);
    ]

let availability_zone_to_yojson = string_to_yojson
let ssh_public_key_to_yojson = string_to_yojson
let instance_os_user_to_yojson = string_to_yojson
let instance_id_to_yojson = string_to_yojson

let send_ssh_public_key_request_to_yojson (x : send_ssh_public_key_request) =
  assoc_to_yojson
    [
      ("InstanceId", Some (instance_id_to_yojson x.instance_id));
      ("InstanceOSUser", Some (instance_os_user_to_yojson x.instance_os_user));
      ("SSHPublicKey", Some (ssh_public_key_to_yojson x.ssh_public_key));
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
    ]

let serial_console_session_unsupported_exception_to_yojson
    (x : serial_console_session_unsupported_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let serial_console_session_unavailable_exception_to_yojson
    (x : serial_console_session_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let serial_console_session_limit_exceeded_exception_to_yojson
    (x : serial_console_session_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let serial_console_access_disabled_exception_to_yojson
    (x : serial_console_access_disabled_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let ec2_instance_type_invalid_exception_to_yojson (x : ec2_instance_type_invalid_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let send_serial_console_ssh_public_key_response_to_yojson
    (x : send_serial_console_ssh_public_key_response) =
  assoc_to_yojson
    [
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
      ("Success", option_to_yojson success_to_yojson x.success);
    ]

let serial_port_to_yojson = int_to_yojson

let send_serial_console_ssh_public_key_request_to_yojson
    (x : send_serial_console_ssh_public_key_request) =
  assoc_to_yojson
    [
      ("InstanceId", Some (instance_id_to_yojson x.instance_id));
      ("SerialPort", option_to_yojson serial_port_to_yojson x.serial_port);
      ("SSHPublicKey", Some (ssh_public_key_to_yojson x.ssh_public_key));
    ]
