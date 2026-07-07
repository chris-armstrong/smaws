open Types
open Service_metadata

module SendSSHPublicKey = struct
  let error_to_string = function
    | `AuthException _ -> "com.amazonaws.ec2instanceconnect#AuthException"
    | `EC2InstanceNotFoundException _ ->
        "com.amazonaws.ec2instanceconnect#EC2InstanceNotFoundException"
    | `EC2InstanceStateInvalidException _ ->
        "com.amazonaws.ec2instanceconnect#EC2InstanceStateInvalidException"
    | `EC2InstanceUnavailableException _ ->
        "com.amazonaws.ec2instanceconnect#EC2InstanceUnavailableException"
    | `InvalidArgsException _ -> "com.amazonaws.ec2instanceconnect#InvalidArgsException"
    | `ServiceException _ -> "com.amazonaws.ec2instanceconnect#ServiceException"
    | `ThrottlingException _ -> "com.amazonaws.ec2instanceconnect#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthException" -> `AuthException (Json_deserializers.auth_exception_of_yojson tree path)
      | _, "EC2InstanceNotFoundException" ->
          `EC2InstanceNotFoundException
            (Json_deserializers.ec2_instance_not_found_exception_of_yojson tree path)
      | _, "EC2InstanceStateInvalidException" ->
          `EC2InstanceStateInvalidException
            (Json_deserializers.ec2_instance_state_invalid_exception_of_yojson tree path)
      | _, "EC2InstanceUnavailableException" ->
          `EC2InstanceUnavailableException
            (Json_deserializers.ec2_instance_unavailable_exception_of_yojson tree path)
      | _, "InvalidArgsException" ->
          `InvalidArgsException (Json_deserializers.invalid_args_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : send_ssh_public_key_request) =
    let input = Json_serializers.send_ssh_public_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEC2InstanceConnectService.SendSSHPublicKey"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_ssh_public_key_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_ssh_public_key_request) =
    let input = Json_serializers.send_ssh_public_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSEC2InstanceConnectService.SendSSHPublicKey" ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_ssh_public_key_response_of_yojson
      ~error_deserializer
end

module SendSerialConsoleSSHPublicKey = struct
  let error_to_string = function
    | `AuthException _ -> "com.amazonaws.ec2instanceconnect#AuthException"
    | `EC2InstanceNotFoundException _ ->
        "com.amazonaws.ec2instanceconnect#EC2InstanceNotFoundException"
    | `EC2InstanceStateInvalidException _ ->
        "com.amazonaws.ec2instanceconnect#EC2InstanceStateInvalidException"
    | `EC2InstanceTypeInvalidException _ ->
        "com.amazonaws.ec2instanceconnect#EC2InstanceTypeInvalidException"
    | `EC2InstanceUnavailableException _ ->
        "com.amazonaws.ec2instanceconnect#EC2InstanceUnavailableException"
    | `InvalidArgsException _ -> "com.amazonaws.ec2instanceconnect#InvalidArgsException"
    | `SerialConsoleAccessDisabledException _ ->
        "com.amazonaws.ec2instanceconnect#SerialConsoleAccessDisabledException"
    | `SerialConsoleSessionLimitExceededException _ ->
        "com.amazonaws.ec2instanceconnect#SerialConsoleSessionLimitExceededException"
    | `SerialConsoleSessionUnavailableException _ ->
        "com.amazonaws.ec2instanceconnect#SerialConsoleSessionUnavailableException"
    | `SerialConsoleSessionUnsupportedException _ ->
        "com.amazonaws.ec2instanceconnect#SerialConsoleSessionUnsupportedException"
    | `ServiceException _ -> "com.amazonaws.ec2instanceconnect#ServiceException"
    | `ThrottlingException _ -> "com.amazonaws.ec2instanceconnect#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthException" -> `AuthException (Json_deserializers.auth_exception_of_yojson tree path)
      | _, "EC2InstanceNotFoundException" ->
          `EC2InstanceNotFoundException
            (Json_deserializers.ec2_instance_not_found_exception_of_yojson tree path)
      | _, "EC2InstanceStateInvalidException" ->
          `EC2InstanceStateInvalidException
            (Json_deserializers.ec2_instance_state_invalid_exception_of_yojson tree path)
      | _, "EC2InstanceTypeInvalidException" ->
          `EC2InstanceTypeInvalidException
            (Json_deserializers.ec2_instance_type_invalid_exception_of_yojson tree path)
      | _, "EC2InstanceUnavailableException" ->
          `EC2InstanceUnavailableException
            (Json_deserializers.ec2_instance_unavailable_exception_of_yojson tree path)
      | _, "InvalidArgsException" ->
          `InvalidArgsException (Json_deserializers.invalid_args_exception_of_yojson tree path)
      | _, "SerialConsoleAccessDisabledException" ->
          `SerialConsoleAccessDisabledException
            (Json_deserializers.serial_console_access_disabled_exception_of_yojson tree path)
      | _, "SerialConsoleSessionLimitExceededException" ->
          `SerialConsoleSessionLimitExceededException
            (Json_deserializers.serial_console_session_limit_exceeded_exception_of_yojson tree path)
      | _, "SerialConsoleSessionUnavailableException" ->
          `SerialConsoleSessionUnavailableException
            (Json_deserializers.serial_console_session_unavailable_exception_of_yojson tree path)
      | _, "SerialConsoleSessionUnsupportedException" ->
          `SerialConsoleSessionUnsupportedException
            (Json_deserializers.serial_console_session_unsupported_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : send_serial_console_ssh_public_key_request) =
    let input = Json_serializers.send_serial_console_ssh_public_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSEC2InstanceConnectService.SendSerialConsoleSSHPublicKey" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.send_serial_console_ssh_public_key_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_serial_console_ssh_public_key_request) =
    let input = Json_serializers.send_serial_console_ssh_public_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSEC2InstanceConnectService.SendSerialConsoleSSHPublicKey" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.send_serial_console_ssh_public_key_response_of_yojson
      ~error_deserializer
end
