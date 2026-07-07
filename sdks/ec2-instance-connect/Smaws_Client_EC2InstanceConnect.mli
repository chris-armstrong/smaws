(** EC2 Instance Connect client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_send_serial_console_ssh_public_key_response :
  ?success:success -> ?request_id:request_id -> unit -> send_serial_console_ssh_public_key_response

val make_send_serial_console_ssh_public_key_request :
  ?serial_port:serial_port ->
  ssh_public_key:ssh_public_key ->
  instance_id:instance_id ->
  unit ->
  send_serial_console_ssh_public_key_request

val make_send_ssh_public_key_response :
  ?success:success -> ?request_id:request_id -> unit -> send_ssh_public_key_response

val make_send_ssh_public_key_request :
  ?availability_zone:availability_zone ->
  ssh_public_key:ssh_public_key ->
  instance_os_user:instance_os_user ->
  instance_id:instance_id ->
  unit ->
  send_ssh_public_key_request
(** {1:operations Operations} *)

module SendSSHPublicKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthException of auth_exception
    | `EC2InstanceNotFoundException of ec2_instance_not_found_exception
    | `EC2InstanceStateInvalidException of ec2_instance_state_invalid_exception
    | `EC2InstanceUnavailableException of ec2_instance_unavailable_exception
    | `InvalidArgsException of invalid_args_exception
    | `ServiceException of service_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_ssh_public_key_request ->
    ( send_ssh_public_key_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthException of auth_exception
      | `EC2InstanceNotFoundException of ec2_instance_not_found_exception
      | `EC2InstanceStateInvalidException of ec2_instance_state_invalid_exception
      | `EC2InstanceUnavailableException of ec2_instance_unavailable_exception
      | `InvalidArgsException of invalid_args_exception
      | `ServiceException of service_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_ssh_public_key_request ->
    ( send_ssh_public_key_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthException of auth_exception
      | `EC2InstanceNotFoundException of ec2_instance_not_found_exception
      | `EC2InstanceStateInvalidException of ec2_instance_state_invalid_exception
      | `EC2InstanceUnavailableException of ec2_instance_unavailable_exception
      | `InvalidArgsException of invalid_args_exception
      | `ServiceException of service_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Pushes an SSH public key to the specified EC2 instance for use by the specified user. The key \
   remains for 60 seconds. For more information, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Connect-using-EC2-Instance-Connect.html}Connect \
   to your Linux instance using EC2 Instance Connect} in the {i Amazon EC2 User Guide}.\n"]

(** {1:Serialization and Deserialization} *)
module SendSerialConsoleSSHPublicKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthException of auth_exception
    | `EC2InstanceNotFoundException of ec2_instance_not_found_exception
    | `EC2InstanceStateInvalidException of ec2_instance_state_invalid_exception
    | `EC2InstanceTypeInvalidException of ec2_instance_type_invalid_exception
    | `EC2InstanceUnavailableException of ec2_instance_unavailable_exception
    | `InvalidArgsException of invalid_args_exception
    | `SerialConsoleAccessDisabledException of serial_console_access_disabled_exception
    | `SerialConsoleSessionLimitExceededException of serial_console_session_limit_exceeded_exception
    | `SerialConsoleSessionUnavailableException of serial_console_session_unavailable_exception
    | `SerialConsoleSessionUnsupportedException of serial_console_session_unsupported_exception
    | `ServiceException of service_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_serial_console_ssh_public_key_request ->
    ( send_serial_console_ssh_public_key_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthException of auth_exception
      | `EC2InstanceNotFoundException of ec2_instance_not_found_exception
      | `EC2InstanceStateInvalidException of ec2_instance_state_invalid_exception
      | `EC2InstanceTypeInvalidException of ec2_instance_type_invalid_exception
      | `EC2InstanceUnavailableException of ec2_instance_unavailable_exception
      | `InvalidArgsException of invalid_args_exception
      | `SerialConsoleAccessDisabledException of serial_console_access_disabled_exception
      | `SerialConsoleSessionLimitExceededException of
        serial_console_session_limit_exceeded_exception
      | `SerialConsoleSessionUnavailableException of serial_console_session_unavailable_exception
      | `SerialConsoleSessionUnsupportedException of serial_console_session_unsupported_exception
      | `ServiceException of service_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_serial_console_ssh_public_key_request ->
    ( send_serial_console_ssh_public_key_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthException of auth_exception
      | `EC2InstanceNotFoundException of ec2_instance_not_found_exception
      | `EC2InstanceStateInvalidException of ec2_instance_state_invalid_exception
      | `EC2InstanceTypeInvalidException of ec2_instance_type_invalid_exception
      | `EC2InstanceUnavailableException of ec2_instance_unavailable_exception
      | `InvalidArgsException of invalid_args_exception
      | `SerialConsoleAccessDisabledException of serial_console_access_disabled_exception
      | `SerialConsoleSessionLimitExceededException of
        serial_console_session_limit_exceeded_exception
      | `SerialConsoleSessionUnavailableException of serial_console_session_unavailable_exception
      | `SerialConsoleSessionUnsupportedException of serial_console_session_unsupported_exception
      | `ServiceException of service_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Pushes an SSH public key to the specified EC2 instance. The key remains for 60 seconds, which \
   gives you 60 seconds to establish a serial console connection to the instance using SSH. For \
   more information, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-serial-console.html}EC2 Serial \
   Console} in the {i Amazon EC2 User Guide}.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
