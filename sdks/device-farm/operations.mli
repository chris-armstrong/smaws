open Types

module CreateDevicePool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_device_pool_request ->
    ( create_device_pool_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_device_pool_request ->
    ( create_device_pool_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a device pool.\n"]

module CreateInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_instance_profile_request ->
    ( create_instance_profile_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_instance_profile_request ->
    ( create_instance_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a profile that can be applied to one or more private fleet device instances.\n"]

module CreateNetworkProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_network_profile_request ->
    ( create_network_profile_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_network_profile_request ->
    ( create_network_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a network profile.\n"]

module CreateProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception
    | `TagOperationException of tag_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_project_request ->
    ( create_project_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception
      | `TagOperationException of tag_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_project_request ->
    ( create_project_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception
      | `TagOperationException of tag_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a project.\n"]

module CreateRemoteAccessSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_remote_access_session_request ->
    ( create_remote_access_session_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_remote_access_session_request ->
    ( create_remote_access_session_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Specifies and starts a remote access session.\n"]

module CreateTestGridProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_test_grid_project_request ->
    ( create_test_grid_project_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_test_grid_project_request ->
    ( create_test_grid_project_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Selenium testing project. Projects are used to track [TestGridSession] instances.\n"]

module CreateTestGridUrl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_test_grid_url_request ->
    ( create_test_grid_url_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_test_grid_url_request ->
    ( create_test_grid_url_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a signed, short-term URL that can be passed to a Selenium [RemoteWebDriver] constructor.\n"]

module CreateUpload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_upload_request ->
    ( create_upload_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_upload_request ->
    ( create_upload_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Uploads an app or test scripts.\n"]

module CreateVPCEConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_vpce_configuration_request ->
    ( create_vpce_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_vpce_configuration_request ->
    ( create_vpce_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a configuration record in Device Farm for your Amazon Virtual Private Cloud (VPC) \
   endpoint.\n"]

module DeleteDevicePool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_device_pool_request ->
    ( delete_device_pool_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_device_pool_request ->
    ( delete_device_pool_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a device pool given the pool ARN. Does not allow deletion of curated pools owned by the \
   system.\n"]

module DeleteInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_instance_profile_request ->
    ( delete_instance_profile_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_instance_profile_request ->
    ( delete_instance_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a profile that can be applied to one or more private device instances.\n"]

module DeleteNetworkProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_network_profile_request ->
    ( delete_network_profile_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_network_profile_request ->
    ( delete_network_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a network profile.\n"]

module DeleteProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_project_request ->
    ( delete_project_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_project_request ->
    ( delete_project_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an AWS Device Farm project, given the project ARN. You cannot delete a project if it \
   has an active run or session.\n\n\
  \  You cannot undo this operation.\n\
  \  \n\
  \   "]

module DeleteRemoteAccessSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_remote_access_session_request ->
    ( delete_remote_access_session_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_remote_access_session_request ->
    ( delete_remote_access_session_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a completed remote access session and its results. You cannot delete a remote access \
   session if it is still active.\n\n\
  \  You cannot undo this operation.\n\
  \  \n\
  \   "]

module DeleteRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_run_request ->
    ( delete_run_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_run_request ->
    ( delete_run_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the run, given the run ARN. You cannot delete a run if it is still active.\n\n\
  \  You cannot undo this operation.\n\
  \  \n\
  \   "]

module DeleteTestGridProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `CannotDeleteException of cannot_delete_exception
    | `InternalServiceException of internal_service_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_test_grid_project_request ->
    ( delete_test_grid_project_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `CannotDeleteException of cannot_delete_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_test_grid_project_request ->
    ( delete_test_grid_project_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `CannotDeleteException of cannot_delete_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deletes a Selenium testing project and all content generated under it. You cannot delete a \
   project if it has active sessions.\n\n\
  \  You cannot undo this operation.\n\
  \  \n\
  \   "]

module DeleteUpload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_upload_request ->
    ( delete_upload_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_upload_request ->
    ( delete_upload_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an upload given the upload ARN.\n"]

module DeleteVPCEConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InvalidOperationException of invalid_operation_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_vpce_configuration_request ->
    ( delete_vpce_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InvalidOperationException of invalid_operation_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_vpce_configuration_request ->
    ( delete_vpce_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InvalidOperationException of invalid_operation_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a configuration for your Amazon Virtual Private Cloud (VPC) endpoint.\n"]

module GetAccountSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_account_settings_request ->
    ( get_account_settings_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_account_settings_request ->
    ( get_account_settings_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the number of unmetered iOS or unmetered Android devices that have been purchased by \
   the account.\n"]

module GetDevice : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_device_request ->
    ( get_device_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_device_request ->
    ( get_device_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a unique device type.\n"]

module GetDeviceInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_device_instance_request ->
    ( get_device_instance_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_device_instance_request ->
    ( get_device_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a device instance that belongs to a private device fleet.\n"]

module GetDevicePool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_device_pool_request ->
    ( get_device_pool_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_device_pool_request ->
    ( get_device_pool_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a device pool.\n"]

module GetDevicePoolCompatibility : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_device_pool_compatibility_request ->
    ( get_device_pool_compatibility_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_device_pool_compatibility_request ->
    ( get_device_pool_compatibility_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about compatibility with a device pool.\n"]

module GetInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_instance_profile_request ->
    ( get_instance_profile_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_instance_profile_request ->
    ( get_instance_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the specified instance profile.\n"]

module GetJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_job_request ->
    ( get_job_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_job_request ->
    ( get_job_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a job.\n"]

module GetNetworkProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_network_profile_request ->
    ( get_network_profile_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_network_profile_request ->
    ( get_network_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a network profile.\n"]

module GetOfferingStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotEligibleException of not_eligible_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_offering_status_request ->
    ( get_offering_status_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_offering_status_request ->
    ( get_offering_status_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the current status and future status of all offerings purchased by an AWS account. The \
   response indicates how many offerings are currently available and the offerings that will be \
   available in the next period. The API returns a [NotEligible] error if the user is not \
   permitted to invoke the operation. If you must be able to invoke this operation, contact \
   {{:mailto:aws-devicefarm-support@amazon.com}aws-devicefarm-support\\@amazon.com}.\n"]

module GetProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_project_request ->
    ( get_project_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_project_request ->
    ( get_project_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a project.\n"]

module GetRemoteAccessSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_remote_access_session_request ->
    ( get_remote_access_session_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_remote_access_session_request ->
    ( get_remote_access_session_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a link to a currently running remote access session.\n"]

module GetRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_run_request ->
    ( get_run_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_run_request ->
    ( get_run_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a run.\n"]

module GetSuite : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_suite_request ->
    ( get_suite_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_suite_request ->
    ( get_suite_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a suite.\n"]

module GetTest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_test_request ->
    ( get_test_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_test_request ->
    ( get_test_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a test.\n"]

module GetTestGridProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_test_grid_project_request ->
    ( get_test_grid_project_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_test_grid_project_request ->
    ( get_test_grid_project_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about a Selenium testing project.\n"]

module GetTestGridSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_test_grid_session_request ->
    ( get_test_grid_session_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_test_grid_session_request ->
    ( get_test_grid_session_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "A session is an instance of a browser created through a [RemoteWebDriver] with the URL from \
   [CreateTestGridUrlResult$url]. You can use the following to look up sessions:\n\n\
  \ {ul\n\
  \       {-  The session ARN ([GetTestGridSessionRequest$sessionArn]).\n\
  \           \n\
  \            }\n\
  \       {-  The project ARN and a session ID ([GetTestGridSessionRequest$projectArn] and \
   [GetTestGridSessionRequest$sessionId]).\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   \n\
  \   "]

module GetUpload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_upload_request ->
    ( get_upload_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_upload_request ->
    ( get_upload_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about an upload.\n"]

module GetVPCEConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_vpce_configuration_request ->
    ( get_vpce_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_vpce_configuration_request ->
    ( get_vpce_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the configuration settings for your Amazon Virtual Private Cloud \
   (VPC) endpoint.\n"]

module InstallToRemoteAccessSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    install_to_remote_access_session_request ->
    ( install_to_remote_access_session_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    install_to_remote_access_session_request ->
    ( install_to_remote_access_session_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Installs an application to the device in a remote access session. For Android applications, the \
   file must be in .apk format. For iOS applications, the file must be in .ipa format.\n"]

module ListArtifacts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_artifacts_request ->
    ( list_artifacts_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_artifacts_request ->
    ( list_artifacts_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about artifacts.\n"]

module ListDeviceInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_device_instances_request ->
    ( list_device_instances_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_device_instances_request ->
    ( list_device_instances_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the private device instances associated with one or more AWS accounts.\n"]

module ListDevicePools : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_device_pools_request ->
    ( list_device_pools_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_device_pools_request ->
    ( list_device_pools_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about device pools.\n"]

module ListDevices : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_devices_request ->
    ( list_devices_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_devices_request ->
    ( list_devices_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about unique device types.\n"]

module ListInstanceProfiles : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_instance_profiles_request ->
    ( list_instance_profiles_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_instance_profiles_request ->
    ( list_instance_profiles_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about all the instance profiles in an AWS account.\n"]

module ListJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_jobs_request ->
    ( list_jobs_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_jobs_request ->
    ( list_jobs_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about jobs for a given test run.\n"]

module ListNetworkProfiles : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_network_profiles_request ->
    ( list_network_profiles_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_network_profiles_request ->
    ( list_network_profiles_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the list of available network profiles.\n"]

module ListOfferingPromotions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotEligibleException of not_eligible_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_offering_promotions_request ->
    ( list_offering_promotions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_offering_promotions_request ->
    ( list_offering_promotions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of offering promotions. Each offering promotion record contains the ID and \
   description of the promotion. The API returns a [NotEligible] error if the caller is not \
   permitted to invoke the operation. Contact \
   {{:mailto:aws-devicefarm-support@amazon.com}aws-devicefarm-support\\@amazon.com} if you must be \
   able to invoke this operation.\n"]

module ListOfferingTransactions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotEligibleException of not_eligible_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_offering_transactions_request ->
    ( list_offering_transactions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_offering_transactions_request ->
    ( list_offering_transactions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of all historical purchases, renewals, and system renewal transactions for an \
   AWS account. The list is paginated and ordered by a descending timestamp (most recent \
   transactions are first). The API returns a [NotEligible] error if the user is not permitted to \
   invoke the operation. If you must be able to invoke this operation, contact \
   {{:mailto:aws-devicefarm-support@amazon.com}aws-devicefarm-support\\@amazon.com}.\n"]

module ListOfferings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotEligibleException of not_eligible_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_offerings_request ->
    ( list_offerings_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_offerings_request ->
    ( list_offerings_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of products or offerings that the user can manage through the API. Each offering \
   record indicates the recurring price per unit and the frequency for that offering. The API \
   returns a [NotEligible] error if the user is not permitted to invoke the operation. If you must \
   be able to invoke this operation, contact \
   {{:mailto:aws-devicefarm-support@amazon.com}aws-devicefarm-support\\@amazon.com}.\n"]

module ListProjects : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_projects_request ->
    ( list_projects_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_projects_request ->
    ( list_projects_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about projects.\n"]

module ListRemoteAccessSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_remote_access_sessions_request ->
    ( list_remote_access_sessions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_remote_access_sessions_request ->
    ( list_remote_access_sessions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of all currently running remote access sessions.\n"]

module ListRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_runs_request ->
    ( list_runs_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_runs_request ->
    ( list_runs_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about runs, given an AWS Device Farm project ARN.\n"]

module ListSamples : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_samples_request ->
    ( list_samples_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_samples_request ->
    ( list_samples_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about samples, given an AWS Device Farm job ARN.\n"]

module ListSuites : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_suites_request ->
    ( list_suites_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_suites_request ->
    ( list_suites_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about test suites for a given job.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `NotFoundException of not_found_exception
    | `TagOperationException of tag_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `NotFoundException of not_found_exception
      | `TagOperationException of tag_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `NotFoundException of not_found_exception
      | `TagOperationException of tag_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the tags for an AWS Device Farm resource.\n"]

module ListTestGridProjects : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_test_grid_projects_request ->
    ( list_test_grid_projects_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_test_grid_projects_request ->
    ( list_test_grid_projects_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of all Selenium testing projects in your account.\n"]

module ListTestGridSessionActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_test_grid_session_actions_request ->
    ( list_test_grid_session_actions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_test_grid_session_actions_request ->
    ( list_test_grid_session_actions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of the actions taken in a [TestGridSession].\n"]

module ListTestGridSessionArtifacts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_test_grid_session_artifacts_request ->
    ( list_test_grid_session_artifacts_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_test_grid_session_artifacts_request ->
    ( list_test_grid_session_artifacts_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of artifacts created during the session.\n"]

module ListTestGridSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_test_grid_sessions_request ->
    ( list_test_grid_sessions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_test_grid_sessions_request ->
    ( list_test_grid_sessions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of sessions for a [TestGridProject].\n"]

module ListTests : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tests_request ->
    ( list_tests_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tests_request ->
    ( list_tests_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about tests in a given test suite.\n"]

module ListUniqueProblems : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_unique_problems_request ->
    ( list_unique_problems_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_unique_problems_request ->
    ( list_unique_problems_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about unique problems, such as exceptions or crashes.\n\n\
  \ Unique problems are defined as a single instance of an error across a run, job, or suite. For \
   example, if a call in your application consistently raises an exception ([OutOfBoundsException \
   in\n\
  \                MyActivity.java:386]), [ListUniqueProblems] returns a single entry instead of \
   many individual entries for that exception.\n\
  \ "]

module ListUploads : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_uploads_request ->
    ( list_uploads_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_uploads_request ->
    ( list_uploads_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about uploads, given an AWS Device Farm project ARN.\n"]

module ListVPCEConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_vpce_configurations_request ->
    ( list_vpce_configurations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_vpce_configurations_request ->
    ( list_vpce_configurations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about all Amazon Virtual Private Cloud (VPC) endpoint configurations in the \
   AWS account.\n"]

module PurchaseOffering : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotEligibleException of not_eligible_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    purchase_offering_request ->
    ( purchase_offering_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    purchase_offering_request ->
    ( purchase_offering_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Immediately purchases offerings for an AWS account. Offerings renew with the latest total \
   purchased quantity for an offering, unless the renewal was overridden. The API returns a \
   [NotEligible] error if the user is not permitted to invoke the operation. If you must be able \
   to invoke this operation, contact \
   {{:mailto:aws-devicefarm-support@amazon.com}aws-devicefarm-support\\@amazon.com}.\n"]

module RenewOffering : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotEligibleException of not_eligible_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    renew_offering_request ->
    ( renew_offering_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    renew_offering_request ->
    ( renew_offering_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Explicitly sets the quantity of devices to renew for an offering, starting from the \
   [effectiveDate] of the next period. The API returns a [NotEligible] error if the user is not \
   permitted to invoke the operation. If you must be able to invoke this operation, contact \
   {{:mailto:aws-devicefarm-support@amazon.com}aws-devicefarm-support\\@amazon.com}.\n"]

module ScheduleRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `IdempotencyException of idempotency_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    schedule_run_request ->
    ( schedule_run_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `IdempotencyException of idempotency_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    schedule_run_request ->
    ( schedule_run_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `IdempotencyException of idempotency_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Schedules a run.\n"]

module StopJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_job_request ->
    ( stop_job_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_job_request ->
    ( stop_job_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates a stop request for the current job. AWS Device Farm immediately stops the job on the \
   device where tests have not started. You are not billed for this device. On the device where \
   tests have started, setup suite and teardown suite tests run to completion on the device. You \
   are billed for setup, teardown, and any tests that were in progress or already completed.\n"]

module StopRemoteAccessSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_remote_access_session_request ->
    ( stop_remote_access_session_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_remote_access_session_request ->
    ( stop_remote_access_session_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Ends a specified remote access session.\n"]

module StopRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_run_request ->
    ( stop_run_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_run_request ->
    ( stop_run_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates a stop request for the current test run. AWS Device Farm immediately stops the run on \
   devices where tests have not started. You are not billed for these devices. On devices where \
   tests have started executing, setup suite and teardown suite tests run to completion on those \
   devices. You are billed for setup, teardown, and any tests that were in progress or already \
   completed.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `NotFoundException of not_found_exception
    | `TagOperationException of tag_operation_exception
    | `TagPolicyException of tag_policy_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `NotFoundException of not_found_exception
      | `TagOperationException of tag_operation_exception
      | `TagPolicyException of tag_policy_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `NotFoundException of not_found_exception
      | `TagOperationException of tag_operation_exception
      | `TagPolicyException of tag_policy_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified tags to a resource with the specified [resourceArn]. If existing tags \
   on a resource are not specified in the request parameters, they are not changed. When a \
   resource is deleted, the tags associated with that resource are also deleted.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `NotFoundException of not_found_exception
    | `TagOperationException of tag_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `NotFoundException of not_found_exception
      | `TagOperationException of tag_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `NotFoundException of not_found_exception
      | `TagOperationException of tag_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified tags from a resource.\n"]

module UpdateDeviceInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_device_instance_request ->
    ( update_device_instance_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_device_instance_request ->
    ( update_device_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates information about a private device instance.\n"]

module UpdateDevicePool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_device_pool_request ->
    ( update_device_pool_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_device_pool_request ->
    ( update_device_pool_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the name, description, and rules in a device pool given the attributes and the pool \
   ARN. Rule updates are all-or-nothing, meaning they can only be updated as a whole (or not at \
   all).\n"]

module UpdateInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_instance_profile_request ->
    ( update_instance_profile_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_instance_profile_request ->
    ( update_instance_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates information about an existing private device instance profile.\n"]

module UpdateNetworkProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_network_profile_request ->
    ( update_network_profile_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_network_profile_request ->
    ( update_network_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the network profile.\n"]

module UpdateProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_project_request ->
    ( update_project_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_project_request ->
    ( update_project_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the specified project name, given the project ARN and a new name.\n"]

module UpdateTestGridProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_test_grid_project_request ->
    ( update_test_grid_project_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_test_grid_project_request ->
    ( update_test_grid_project_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Change details of a project.\n"]

module UpdateUpload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_upload_request ->
    ( update_upload_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_upload_request ->
    ( update_upload_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an uploaded test spec.\n"]

module UpdateVPCEConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InvalidOperationException of invalid_operation_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_vpce_configuration_request ->
    ( update_vpce_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InvalidOperationException of invalid_operation_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_vpce_configuration_request ->
    ( update_vpce_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InvalidOperationException of invalid_operation_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates information about an Amazon Virtual Private Cloud (VPC) endpoint configuration.\n"]
