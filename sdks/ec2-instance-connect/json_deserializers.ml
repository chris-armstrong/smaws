open Smaws_Lib.Json.DeserializeHelpers
open Types

let string__of_yojson = string_of_yojson

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : throttling_exception)

let service_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : service_exception)

let invalid_args_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_args_exception)

let ec2_instance_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : ec2_instance_unavailable_exception)

let ec2_instance_state_invalid_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : ec2_instance_state_invalid_exception)

let ec2_instance_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : ec2_instance_not_found_exception)

let auth_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : auth_exception)

let success_of_yojson = bool_of_yojson
let request_id_of_yojson = string_of_yojson

let send_ssh_public_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
     success = option_of_yojson (value_for_key success_of_yojson "Success") _list path;
   }
    : send_ssh_public_key_response)

let availability_zone_of_yojson = string_of_yojson
let ssh_public_key_of_yojson = string_of_yojson
let instance_os_user_of_yojson = string_of_yojson
let instance_id_of_yojson = string_of_yojson

let send_ssh_public_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_id = value_for_key instance_id_of_yojson "InstanceId" _list path;
     instance_os_user = value_for_key instance_os_user_of_yojson "InstanceOSUser" _list path;
     ssh_public_key = value_for_key ssh_public_key_of_yojson "SSHPublicKey" _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "AvailabilityZone") _list path;
   }
    : send_ssh_public_key_request)

let serial_console_session_unsupported_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : serial_console_session_unsupported_exception)

let serial_console_session_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : serial_console_session_unavailable_exception)

let serial_console_session_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : serial_console_session_limit_exceeded_exception)

let serial_console_access_disabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : serial_console_access_disabled_exception)

let ec2_instance_type_invalid_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : ec2_instance_type_invalid_exception)

let send_serial_console_ssh_public_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
     success = option_of_yojson (value_for_key success_of_yojson "Success") _list path;
   }
    : send_serial_console_ssh_public_key_response)

let serial_port_of_yojson = int_of_yojson

let send_serial_console_ssh_public_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_id = value_for_key instance_id_of_yojson "InstanceId" _list path;
     serial_port = option_of_yojson (value_for_key serial_port_of_yojson "SerialPort") _list path;
     ssh_public_key = value_for_key ssh_public_key_of_yojson "SSHPublicKey" _list path;
   }
    : send_serial_console_ssh_public_key_request)
