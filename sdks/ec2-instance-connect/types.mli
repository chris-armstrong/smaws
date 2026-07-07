type nonrec string_ = string [@@ocaml.doc ""]

type nonrec throttling_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The requests were made too frequently and have been throttled. Wait a while and try again. To \
   increase the limit on your request frequency, contact AWS Support.\n"]

type nonrec success = bool [@@ocaml.doc ""]

type nonrec service_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The service encountered an error. Follow the instructions in the error message and try again.\n"]

type nonrec serial_port = int [@@ocaml.doc ""]

type nonrec serial_console_session_unsupported_exception = {
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Your instance's BIOS version is unsupported for serial console connection. Reboot your instance \
   to update its BIOS, and then try again to connect.\n"]

type nonrec serial_console_session_unavailable_exception = {
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "Unable to start a serial console session. Please try again.\n"]

type nonrec serial_console_session_limit_exceeded_exception = {
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The instance currently has 1 active serial console session. Only 1 session is supported at a \
   time.\n"]

type nonrec serial_console_access_disabled_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "Your account is not authorized to use the EC2 Serial Console. To authorize your account, run \
   the EnableSerialConsoleAccess API. For more information, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_EnableSerialConsoleAccess.html}EnableSerialConsoleAccess} \
   in the {i Amazon EC2 API Reference}.\n"]

type nonrec request_id = string [@@ocaml.doc ""]

type nonrec send_serial_console_ssh_public_key_response = {
  success : success option; [@ocaml.doc "Is true if the request succeeds and an error otherwise.\n"]
  request_id : request_id option;
      [@ocaml.doc
        "The ID of the request. Please provide this ID when contacting AWS Support for assistance.\n"]
}
[@@ocaml.doc ""]

type nonrec instance_id = string [@@ocaml.doc ""]

type nonrec ssh_public_key = string [@@ocaml.doc ""]

type nonrec send_serial_console_ssh_public_key_request = {
  ssh_public_key : ssh_public_key;
      [@ocaml.doc
        "The public key material. To use the public key, you must have the matching private key. \
         For information about the supported key formats and lengths, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#how-to-generate-your-own-key-and-import-it-to-aws}Requirements \
         for key pairs} in the {i Amazon EC2 User Guide}.\n"]
  serial_port : serial_port option;
      [@ocaml.doc
        "The serial port of the EC2 instance. Currently only port 0 is supported.\n\n Default: 0\n "]
  instance_id : instance_id; [@ocaml.doc "The ID of the EC2 instance.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_args_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "One of the parameters is not valid.\n"]

type nonrec ec2_instance_unavailable_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The instance is currently unavailable. Wait a few minutes and try again.\n"]

type nonrec ec2_instance_type_invalid_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The instance type is not supported for connecting via the serial console. Only Nitro instance \
   types are currently supported.\n"]

type nonrec ec2_instance_state_invalid_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "Unable to connect because the instance is not in a valid state. Connecting to a stopped or \
   terminated instance is not supported. If the instance is stopped, start your instance, and try \
   to connect again.\n"]

type nonrec ec2_instance_not_found_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The specified instance was not found.\n"]

type nonrec auth_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "Either your AWS credentials are not valid or you do not have access to the EC2 instance.\n"]

type nonrec send_ssh_public_key_response = {
  success : success option; [@ocaml.doc "Is true if the request succeeds and an error otherwise.\n"]
  request_id : request_id option;
      [@ocaml.doc
        "The ID of the request. Please provide this ID when contacting AWS Support for assistance.\n"]
}
[@@ocaml.doc ""]

type nonrec instance_os_user = string [@@ocaml.doc ""]

type nonrec availability_zone = string [@@ocaml.doc ""]

type nonrec send_ssh_public_key_request = {
  availability_zone : availability_zone option;
      [@ocaml.doc "The Availability Zone in which the EC2 instance was launched.\n"]
  ssh_public_key : ssh_public_key;
      [@ocaml.doc
        "The public key material. To use the public key, you must have the matching private key.\n"]
  instance_os_user : instance_os_user;
      [@ocaml.doc "The OS user on the EC2 instance for whom the key can be used to authenticate.\n"]
  instance_id : instance_id; [@ocaml.doc "The ID of the EC2 instance.\n"]
}
[@@ocaml.doc ""]
