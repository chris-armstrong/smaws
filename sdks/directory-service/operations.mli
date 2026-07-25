open Types

module DisableCAEnrollmentPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `DisableAlreadyInProgressException of disable_already_in_progress_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_ca_enrollment_policy_request ->
    ( disable_ca_enrollment_policy_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `DisableAlreadyInProgressException of disable_already_in_progress_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_ca_enrollment_policy_request ->
    ( disable_ca_enrollment_policy_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `DisableAlreadyInProgressException of disable_already_in_progress_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables the certificate authority (CA) enrollment policy for the specified directory. This \
   stops automatic certificate enrollment and management for domain-joined clients, but does not \
   affect existing certificates.\n\n\
  \  Disabling the CA enrollment policy prevents new certificates from being automatically \
   enrolled, but existing certificates remain valid and functional until they expire.\n\
  \  \n\
  \   "]

module DisableClientAuthentication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_client_authentication_request ->
    ( disable_client_authentication_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_client_authentication_request ->
    ( disable_client_authentication_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disables alternative client authentication methods for the specified directory. \n"]

module DisableDirectoryDataAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryInDesiredStateException of directory_in_desired_state_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_directory_data_access_request ->
    ( disable_directory_data_access_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryInDesiredStateException of directory_in_desired_state_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_directory_data_access_request ->
    ( disable_directory_data_access_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryInDesiredStateException of directory_in_desired_state_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deactivates access to directory data via the Directory Service Data API for the specified \
   directory. For more information, see \
   {{:https://docs.aws.amazon.com/directoryservicedata/latest/DirectoryServiceDataAPIReference/Welcome.html}Directory \
   Service Data API Reference}.\n"]

module DisableLDAPS : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_ldaps_request ->
    ( disable_ldaps_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_ldaps_request ->
    ( disable_ldaps_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deactivates LDAP secure calls for the specified directory.\n"]

module DisableRadius : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_radius_request ->
    ( disable_radius_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_radius_request ->
    ( disable_radius_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables multi-factor authentication (MFA) with the Remote Authentication Dial In User Service \
   (RADIUS) server for an AD Connector or Microsoft AD directory.\n"]

module DisableSso : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthenticationFailedException of authentication_failed_exception
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InsufficientPermissionsException of insufficient_permissions_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_sso_request ->
    ( disable_sso_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthenticationFailedException of authentication_failed_exception
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_sso_request ->
    ( disable_sso_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthenticationFailedException of authentication_failed_exception
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disables single-sign on for a directory.\n"]

module EnableCAEnrollmentPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EnableAlreadyInProgressException of enable_already_in_progress_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_ca_enrollment_policy_request ->
    ( enable_ca_enrollment_policy_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EnableAlreadyInProgressException of enable_already_in_progress_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_ca_enrollment_policy_request ->
    ( enable_ca_enrollment_policy_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EnableAlreadyInProgressException of enable_already_in_progress_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables certificate authority (CA) enrollment policy for the specified directory. This allows \
   domain-joined clients to automatically request and receive certificates from the specified \
   Amazon Web Services Private Certificate Authority.\n\n\
  \  Before enabling CA enrollment, ensure that the PCA connector is properly configured and \
   accessible from the directory. The connector must be in an active state and have the necessary \
   permissions.\n\
  \  \n\
  \   "]

module EnableClientAuthentication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
    | `NoAvailableCertificateException of no_available_certificate_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_client_authentication_request ->
    ( enable_client_authentication_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
      | `NoAvailableCertificateException of no_available_certificate_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_client_authentication_request ->
    ( enable_client_authentication_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
      | `NoAvailableCertificateException of no_available_certificate_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Enables alternative client authentication methods for the specified directory.\n"]

module EnableDirectoryDataAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryInDesiredStateException of directory_in_desired_state_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_directory_data_access_request ->
    ( enable_directory_data_access_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryInDesiredStateException of directory_in_desired_state_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_directory_data_access_request ->
    ( enable_directory_data_access_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryInDesiredStateException of directory_in_desired_state_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables access to directory data via the Directory Service Data API for the specified \
   directory. For more information, see \
   {{:https://docs.aws.amazon.com/directoryservicedata/latest/DirectoryServiceDataAPIReference/Welcome.html}Directory \
   Service Data API Reference}.\n"]

module EnableLDAPS : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NoAvailableCertificateException of no_available_certificate_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_ldaps_request ->
    ( enable_ldaps_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoAvailableCertificateException of no_available_certificate_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_ldaps_request ->
    ( enable_ldaps_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoAvailableCertificateException of no_available_certificate_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Activates the switch for the specific directory to always use LDAP secure calls.\n"]

module EnableRadius : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_radius_request ->
    ( enable_radius_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_radius_request ->
    ( enable_radius_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables multi-factor authentication (MFA) with the Remote Authentication Dial In User Service \
   (RADIUS) server for an AD Connector or Microsoft AD directory.\n"]

module EnableSso : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthenticationFailedException of authentication_failed_exception
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InsufficientPermissionsException of insufficient_permissions_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_sso_request ->
    ( enable_sso_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthenticationFailedException of authentication_failed_exception
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_sso_request ->
    ( enable_sso_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthenticationFailedException of authentication_failed_exception
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables single sign-on for a directory. Single sign-on allows users in your directory to access \
   certain Amazon Web Services services from a computer joined to the directory without having to \
   enter their credentials separately.\n"]

module GetDirectoryLimits : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_directory_limits_request ->
    ( get_directory_limits_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_directory_limits_request ->
    ( get_directory_limits_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Obtains directory limit information for the current Region.\n"]

module GetSnapshotLimits : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_snapshot_limits_request ->
    ( get_snapshot_limits_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_snapshot_limits_request ->
    ( get_snapshot_limits_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Obtains the manual snapshot limits for a directory.\n"]

module ListADAssessments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_ad_assessments_request ->
    ( list_ad_assessments_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_ad_assessments_request ->
    ( list_ad_assessments_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of directory assessments for the specified directory or all assessments in \
   your account. Use this operation to monitor assessment status and manage multiple assessments.\n"]

module ListCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_certificates_request ->
    ( list_certificates_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_certificates_request ->
    ( list_certificates_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For the specified directory, lists all the certificates registered for a secure LDAP or client \
   certificate authentication.\n"]

module ListIpRoutes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_ip_routes_request ->
    ( list_ip_routes_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_ip_routes_request ->
    ( list_ip_routes_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the address blocks that you have added to a directory.\n"]

module ListLogSubscriptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_log_subscriptions_request ->
    ( list_log_subscriptions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_log_subscriptions_request ->
    ( list_log_subscriptions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the active log subscriptions for the Amazon Web Services account.\n"]

module ListSchemaExtensions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_schema_extensions_request ->
    ( list_schema_extensions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_schema_extensions_request ->
    ( list_schema_extensions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all schema extensions applied to a Microsoft AD Directory.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all tags on a directory.\n"]

module RegisterCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CertificateAlreadyExistsException of certificate_already_exists_exception
    | `CertificateLimitExceededException of certificate_limit_exceeded_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `InvalidCertificateException of invalid_certificate_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_certificate_request ->
    ( register_certificate_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CertificateAlreadyExistsException of certificate_already_exists_exception
      | `CertificateLimitExceededException of certificate_limit_exceeded_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidCertificateException of invalid_certificate_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_certificate_request ->
    ( register_certificate_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CertificateAlreadyExistsException of certificate_already_exists_exception
      | `CertificateLimitExceededException of certificate_limit_exceeded_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidCertificateException of invalid_certificate_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Registers a certificate for a secure LDAP or client certificate authentication.\n"]

module RegisterEventTopic : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_event_topic_request ->
    ( register_event_topic_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_event_topic_request ->
    ( register_event_topic_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a directory with an Amazon SNS topic. This establishes the directory as a publisher \
   to the specified Amazon SNS topic. You can then receive email or text (SMS) messages when the \
   status of your directory changes. You get notified if your directory goes from an Active status \
   to an Impaired or Inoperable status. You also receive a notification when the directory returns \
   to an Active status.\n"]

module RejectSharedDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryAlreadySharedException of directory_already_shared_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_shared_directory_request ->
    ( reject_shared_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryAlreadySharedException of directory_already_shared_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_shared_directory_request ->
    ( reject_shared_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryAlreadySharedException of directory_already_shared_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Rejects a directory sharing request that was sent from the directory owner account.\n"]

module RemoveIpRoutes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_ip_routes_request ->
    ( remove_ip_routes_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_ip_routes_request ->
    ( remove_ip_routes_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes IP address blocks from a directory.\n"]

module RemoveRegion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_region_request ->
    ( remove_region_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_region_request ->
    ( remove_region_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops all replication and removes the domain controllers from the specified Region. You cannot \
   remove the primary Region with this operation. Instead, use the [DeleteDirectory] API.\n"]

module RemoveTagsFromResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_request ->
    ( remove_tags_from_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_request ->
    ( remove_tags_from_resource_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes tags from a directory.\n"]

module ResetUserPassword : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidPasswordException of invalid_password_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception
    | `UserDoesNotExistException of user_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reset_user_password_request ->
    ( reset_user_password_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidPasswordException of invalid_password_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception
      | `UserDoesNotExistException of user_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reset_user_password_request ->
    ( reset_user_password_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidPasswordException of invalid_password_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception
      | `UserDoesNotExistException of user_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Resets the password for any user in your Managed Microsoft AD or Simple AD directory. Disabled \
   users will become enabled and can be authenticated following the API call.\n\n\
  \ You can reset the password for any user in your directory with the following exceptions:\n\
  \ \n\
  \  {ul\n\
  \        {-  For Simple AD, you cannot reset the password for any user that is a member of \
   either the {b Domain Admins} or {b Enterprise Admins} group except for the administrator user.\n\
  \            \n\
  \             }\n\
  \        {-  For Managed Microsoft AD, you can only reset the password for a user that is in an \
   OU based off of the NetBIOS name that you typed when you created your directory. For example, \
   you cannot reset the password for a user in the {b Amazon Web Services Reserved} OU. For more \
   information about the OU structure for an Managed Microsoft AD directory, see \
   {{:https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ms_ad_getting_started_what_gets_created.html}What \
   Gets Created} in the {i Directory Service Administration Guide}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module RestoreFromSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_from_snapshot_request ->
    ( restore_from_snapshot_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_from_snapshot_request ->
    ( restore_from_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Restores a directory using an existing directory snapshot.\n\n\
  \ When you restore a directory from a snapshot, any changes made to the directory after the \
   snapshot date are overwritten.\n\
  \ \n\
  \  This action returns as soon as the restore operation is initiated. You can monitor the \
   progress of the restore operation by calling the [DescribeDirectories] operation with the \
   directory identifier. When the {b DirectoryDescription.Stage} value changes to [Active], the \
   restore operation is complete.\n\
  \  "]

module ShareDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryAlreadySharedException of directory_already_shared_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidTargetException of invalid_target_exception
    | `OrganizationsException of organizations_exception
    | `ServiceException of service_exception
    | `ShareLimitExceededException of share_limit_exceeded_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    share_directory_request ->
    ( share_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryAlreadySharedException of directory_already_shared_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTargetException of invalid_target_exception
      | `OrganizationsException of organizations_exception
      | `ServiceException of service_exception
      | `ShareLimitExceededException of share_limit_exceeded_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    share_directory_request ->
    ( share_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryAlreadySharedException of directory_already_shared_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTargetException of invalid_target_exception
      | `OrganizationsException of organizations_exception
      | `ServiceException of service_exception
      | `ShareLimitExceededException of share_limit_exceeded_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Shares a specified directory ([DirectoryId]) in your Amazon Web Services account (directory \
   owner) with another Amazon Web Services account (directory consumer). With this operation you \
   can use your directory from any Amazon Web Services account and from any Amazon VPC within an \
   Amazon Web Services Region.\n\n\
  \ When you share your Managed Microsoft AD directory, Directory Service creates a shared \
   directory in the directory consumer account. This shared directory contains the metadata to \
   provide access to the directory within the directory owner account. The shared directory is \
   visible in all VPCs in the directory consumer account.\n\
  \ \n\
  \  The [ShareMethod] parameter determines whether the specified directory can be shared between \
   Amazon Web Services accounts inside the same Amazon Web Services organization \
   ([ORGANIZATIONS]). It also determines whether you can share the directory with any other Amazon \
   Web Services account either inside or outside of the organization ([HANDSHAKE]).\n\
  \  \n\
  \   The [ShareNotes] parameter is only used when [HANDSHAKE] is called, which sends a directory \
   sharing request to the directory consumer. \n\
  \   "]

module StartADAssessment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_ad_assessment_request ->
    ( start_ad_assessment_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_ad_assessment_request ->
    ( start_ad_assessment_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates a directory assessment to validate your self-managed AD environment for hybrid domain \
   join. The assessment checks compatibility and connectivity of the self-managed AD environment.\n\n\
  \ A directory assessment is automatically created when you create a hybrid directory. There are \
   two types of assessments: [CUSTOMER] and [SYSTEM]. Your Amazon Web Services account has a limit \
   of 100 [CUSTOMER] directory assessments.\n\
  \ \n\
  \  The assessment process typically takes 30 minutes or more to complete. The assessment process \
   is asynchronous and you can monitor it with [DescribeADAssessment].\n\
  \  \n\
  \   The [InstanceIds] must have a one-to-one correspondence with [CustomerDnsIps], meaning that \
   if the IP address for instance i-10243410 is 10.24.34.100 and the IP address for instance \
   i-10243420 is 10.24.34.200, then the input arrays must maintain the same order relationship, \
   either \\[10.24.34.100, 10.24.34.200\\] paired with \\[i-10243410, i-10243420\\] or \
   \\[10.24.34.200, 10.24.34.100\\] paired with \\[i-10243420, i-10243410\\].\n\
  \   \n\
  \    Note: You must provide exactly one [DirectoryId] or [AssessmentConfiguration].\n\
  \    "]

module StartSchemaExtension : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_schema_extension_request ->
    ( start_schema_extension_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_schema_extension_request ->
    ( start_schema_extension_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Applies a schema extension to a Microsoft AD directory.\n"]

module UnshareDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryNotSharedException of directory_not_shared_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidTargetException of invalid_target_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    unshare_directory_request ->
    ( unshare_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryNotSharedException of directory_not_shared_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidTargetException of invalid_target_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    unshare_directory_request ->
    ( unshare_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryNotSharedException of directory_not_shared_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidTargetException of invalid_target_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the directory sharing between the directory owner and consumer accounts. \n"]

module UpdateConditionalForwarder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_conditional_forwarder_request ->
    ( update_conditional_forwarder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_conditional_forwarder_request ->
    ( update_conditional_forwarder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a conditional forwarder that has been set up for your Amazon Web Services directory.\n"]

module UpdateDirectorySetup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryInDesiredStateException of directory_in_desired_state_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_directory_setup_request ->
    ( update_directory_setup_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryInDesiredStateException of directory_in_desired_state_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_directory_setup_request ->
    ( update_directory_setup_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryInDesiredStateException of directory_in_desired_state_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates directory configuration for the specified update type.\n"]

module UpdateHybridAD : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_hybrid_ad_request ->
    ( update_hybrid_ad_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_hybrid_ad_request ->
    ( update_hybrid_ad_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of an existing hybrid directory. You can recover hybrid directory \
   administrator account or modify self-managed instance settings.\n\n\
  \ Updates are applied asynchronously. Use [DescribeHybridADUpdate] to monitor the progress of \
   configuration changes.\n\
  \ \n\
  \  The [InstanceIds] must have a one-to-one correspondence with [CustomerDnsIps], meaning that \
   if the IP address for instance i-10243410 is 10.24.34.100 and the IP address for instance \
   i-10243420 is 10.24.34.200, then the input arrays must maintain the same order relationship, \
   either \\[10.24.34.100, 10.24.34.200\\] paired with \\[i-10243410, i-10243420\\] or \
   \\[10.24.34.200, 10.24.34.100\\] paired with \\[i-10243420, i-10243410\\].\n\
  \  \n\
  \    You must provide at least one update to \
   [UpdateHybridADRequest$HybridAdministratorAccountUpdate] or \
   [UpdateHybridADRequest$SelfManagedInstancesSettings].\n\
  \    \n\
  \     "]

module UpdateNumberOfDomainControllers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `DomainControllerLimitExceededException of domain_controller_limit_exceeded_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_number_of_domain_controllers_request ->
    ( update_number_of_domain_controllers_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `DomainControllerLimitExceededException of domain_controller_limit_exceeded_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_number_of_domain_controllers_request ->
    ( update_number_of_domain_controllers_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `DomainControllerLimitExceededException of domain_controller_limit_exceeded_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or removes domain controllers to or from the directory. Based on the difference between \
   current value and new value (provided through this API call), domain controllers will be added \
   or removed. It may take up to 45 minutes for any new domain controllers to become fully active \
   once the requested number of domain controllers is updated. During this time, you cannot make \
   another update request.\n"]

module UpdateRadius : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_radius_request ->
    ( update_radius_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_radius_request ->
    ( update_radius_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the Remote Authentication Dial In User Service (RADIUS) server information for an AD \
   Connector or Microsoft AD directory.\n"]

module UpdateSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `IncompatibleSettingsException of incompatible_settings_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception
    | `UnsupportedSettingsException of unsupported_settings_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_settings_request ->
    ( update_settings_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `IncompatibleSettingsException of incompatible_settings_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception
      | `UnsupportedSettingsException of unsupported_settings_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_settings_request ->
    ( update_settings_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `IncompatibleSettingsException of incompatible_settings_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception
      | `UnsupportedSettingsException of unsupported_settings_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the configurable settings for the specified directory.\n"]

module UpdateTrust : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_trust_request ->
    ( update_trust_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_trust_request ->
    ( update_trust_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the trust that has been set up between your Managed Microsoft AD directory and an \
   self-managed Active Directory.\n"]

module VerifyTrust : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    verify_trust_request ->
    ( verify_trust_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    verify_trust_request ->
    ( verify_trust_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Directory Service for Microsoft Active Directory allows you to configure and verify trust \
   relationships.\n\n\
  \ This action verifies a trust relationship between your Managed Microsoft AD directory and an \
   external domain.\n\
  \ "]

module DescribeUpdateDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_update_directory_request ->
    ( describe_update_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_update_directory_request ->
    ( describe_update_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Describes the updates of a directory for a particular update type. \n"]

module DescribeTrusts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_trusts_request ->
    ( describe_trusts_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_trusts_request ->
    ( describe_trusts_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Obtains information about the trust relationships for this account.\n\n\
  \ If no input parameters are provided, such as DirectoryId or TrustIds, this request describes \
   all the trust relationships belonging to the account.\n\
  \ "]

module DescribeSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshots_request ->
    ( describe_snapshots_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshots_request ->
    ( describe_snapshots_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Obtains information about the directory snapshots that belong to this account.\n\n\
  \ This operation supports pagination with the use of the {i NextToken} request and response \
   parameters. If more results are available, the {i DescribeSnapshots.NextToken} member contains \
   a token that you pass in the next call to [DescribeSnapshots] to retrieve the next set of items.\n\
  \ \n\
  \  You can also specify a maximum number of return results with the {i Limit} parameter.\n\
  \  "]

module DescribeSharedDirectories : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_shared_directories_request ->
    ( describe_shared_directories_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_shared_directories_request ->
    ( describe_shared_directories_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the shared directories in your account. \n"]

module DescribeSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_settings_request ->
    ( describe_settings_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_settings_request ->
    ( describe_settings_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about the configurable settings for the specified directory.\n"]

module DescribeRegions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_regions_request ->
    ( describe_regions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_regions_request ->
    ( describe_regions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides information about the Regions that are configured for multi-Region replication.\n"]

module DescribeLDAPSSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_ldaps_settings_request ->
    ( describe_ldaps_settings_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_ldaps_settings_request ->
    ( describe_ldaps_settings_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the status of LDAP security for the specified directory.\n"]

module DescribeHybridADUpdate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_hybrid_ad_update_request ->
    ( describe_hybrid_ad_update_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_hybrid_ad_update_request ->
    ( describe_hybrid_ad_update_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about update activities for a hybrid directory. This operation provides \
   details about configuration changes, administrator account updates, and self-managed instance \
   settings (IDs and DNS IPs).\n"]

module DescribeEventTopics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_topics_request ->
    ( describe_event_topics_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_topics_request ->
    ( describe_event_topics_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Obtains information about which Amazon SNS topics receive status messages from the specified \
   directory.\n\n\
  \ If no input parameters are provided, such as DirectoryId or TopicName, this request describes \
   all of the associations in the account.\n\
  \ "]

module DescribeDomainControllers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_domain_controllers_request ->
    ( describe_domain_controllers_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_domain_controllers_request ->
    ( describe_domain_controllers_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides information about any domain controllers in your directory.\n"]

module DescribeDirectoryDataAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_directory_data_access_request ->
    ( describe_directory_data_access_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_directory_data_access_request ->
    ( describe_directory_data_access_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Obtains status of directory data access enablement through the Directory Service Data API for \
   the specified directory.\n"]

module DescribeDirectories : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_directories_request ->
    ( describe_directories_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_directories_request ->
    ( describe_directories_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Obtains information about the directories that belong to this account.\n\n\
  \ You can retrieve information about specific directories by passing the directory identifiers \
   in the [DirectoryIds] parameter. Otherwise, all directories that belong to the current account \
   are returned.\n\
  \ \n\
  \  This operation supports pagination with the use of the [NextToken] request and response \
   parameters. If more results are available, the [DescribeDirectoriesResult.NextToken] member \
   contains a token that you pass in the next call to [DescribeDirectories] to retrieve the next \
   set of items.\n\
  \  \n\
  \   You can also specify a maximum number of return results with the [Limit] parameter.\n\
  \   "]

module DescribeConditionalForwarders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_conditional_forwarders_request ->
    ( describe_conditional_forwarders_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_conditional_forwarders_request ->
    ( describe_conditional_forwarders_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Obtains information about the conditional forwarders for this account.\n\n\
  \ If no input parameters are provided for RemoteDomainNames, this request describes all \
   conditional forwarders for the specified directory ID.\n\
  \ "]

module DescribeClientAuthenticationSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_client_authentication_settings_request ->
    ( describe_client_authentication_settings_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_client_authentication_settings_request ->
    ( describe_client_authentication_settings_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about the type of client authentication for the specified directory, if \
   the type is specified. If no type is specified, information about all client authentication \
   types that are supported for the specified directory is retrieved. Currently, only [SmartCard] \
   is supported. \n"]

module DescribeCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CertificateDoesNotExistException of certificate_does_not_exist_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_certificate_request ->
    ( describe_certificate_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CertificateDoesNotExistException of certificate_does_not_exist_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_certificate_request ->
    ( describe_certificate_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CertificateDoesNotExistException of certificate_does_not_exist_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Displays information about the certificate registered for secure LDAP or client certificate \
   authentication.\n"]

module DescribeCAEnrollmentPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_ca_enrollment_policy_request ->
    ( describe_ca_enrollment_policy_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_ca_enrollment_policy_request ->
    ( describe_ca_enrollment_policy_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about the certificate authority (CA) enrollment policy for the \
   specified directory. This policy determines how client certificates are automatically enrolled \
   and managed through Amazon Web Services Private Certificate Authority. \n"]

module DescribeADAssessment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_ad_assessment_request ->
    ( describe_ad_assessment_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_ad_assessment_request ->
    ( describe_ad_assessment_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about a directory assessment, including its current status, \
   validation results, and configuration details. Use this operation to monitor assessment \
   progress and review results.\n"]

module DeregisterEventTopic : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_event_topic_request ->
    ( deregister_event_topic_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_event_topic_request ->
    ( deregister_event_topic_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes the specified directory as a publisher to the specified Amazon SNS topic.\n"]

module DeregisterCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CertificateDoesNotExistException of certificate_does_not_exist_exception
    | `CertificateInUseException of certificate_in_use_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_certificate_request ->
    ( deregister_certificate_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CertificateDoesNotExistException of certificate_does_not_exist_exception
      | `CertificateInUseException of certificate_in_use_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_certificate_request ->
    ( deregister_certificate_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CertificateDoesNotExistException of certificate_does_not_exist_exception
      | `CertificateInUseException of certificate_in_use_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes from the system the certificate that was registered for secure LDAP or client \
   certificate authentication.\n"]

module DeleteTrust : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_trust_request ->
    ( delete_trust_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_trust_request ->
    ( delete_trust_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing trust relationship between your Managed Microsoft AD directory and an \
   external domain.\n"]

module DeleteSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_request ->
    ( delete_snapshot_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_request ->
    ( delete_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a directory snapshot.\n"]

module DeleteLogSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_log_subscription_request ->
    ( delete_log_subscription_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_log_subscription_request ->
    ( delete_log_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified log subscription.\n"]

module DeleteDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_directory_request ->
    ( delete_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_directory_request ->
    ( delete_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Directory Service directory.\n\n\
  \ Before you call [DeleteDirectory], ensure that all of the required permissions have been \
   explicitly granted through a policy. For details about what permissions are required to run the \
   [DeleteDirectory] operation, see \
   {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory \
   Service API Permissions: Actions, Resources, and Conditions Reference}.\n\
  \ "]

module DeleteConditionalForwarder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_conditional_forwarder_request ->
    ( delete_conditional_forwarder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_conditional_forwarder_request ->
    ( delete_conditional_forwarder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a conditional forwarder that has been set up for your Amazon Web Services directory.\n"]

module DeleteADAssessment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_ad_assessment_request ->
    ( delete_ad_assessment_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_ad_assessment_request ->
    ( delete_ad_assessment_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a directory assessment and all associated data. This operation permanently removes the \
   assessment results, validation reports, and configuration information.\n\n\
  \ You cannot delete system-initiated assessments. You can delete customer-created assessments \
   even if they are in progress.\n\
  \ "]

module CreateTrust : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_trust_request ->
    ( create_trust_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_trust_request ->
    ( create_trust_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Directory Service for Microsoft Active Directory allows you to configure trust relationships. \
   For example, you can establish a trust between your Managed Microsoft AD directory, and your \
   existing self-managed Microsoft Active Directory. This would allow you to provide users and \
   groups access to resources in either domain, with a single set of credentials.\n\n\
  \ This action initiates the creation of the Amazon Web Services side of a trust relationship \
   between an Managed Microsoft AD directory and an external domain. You can create either a \
   forest trust or an external trust.\n\
  \ "]

module CreateSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_request ->
    ( create_snapshot_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_request ->
    ( create_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a snapshot of a Simple AD or Microsoft AD directory in the Amazon Web Services cloud.\n\n\
  \  You cannot take snapshots of AD Connector directories.\n\
  \  \n\
  \   "]

module CreateMicrosoftAD : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryLimitExceededException of directory_limit_exceeded_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_microsoft_ad_request ->
    ( create_microsoft_ad_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryLimitExceededException of directory_limit_exceeded_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_microsoft_ad_request ->
    ( create_microsoft_ad_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryLimitExceededException of directory_limit_exceeded_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Microsoft AD directory in the Amazon Web Services Cloud. For more information, see \
   {{:https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_microsoft_ad.html}Managed \
   Microsoft AD} in the {i Directory Service Admin Guide}.\n\n\
  \ Before you call {i CreateMicrosoftAD}, ensure that all of the required permissions have been \
   explicitly granted through a policy. For details about what permissions are required to run the \
   {i CreateMicrosoftAD} operation, see \
   {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory \
   Service API Permissions: Actions, Resources, and Conditions Reference}.\n\
  \ "]

module CreateLogSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InsufficientPermissionsException of insufficient_permissions_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_log_subscription_request ->
    ( create_log_subscription_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_log_subscription_request ->
    ( create_log_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a subscription to forward real-time Directory Service domain controller security logs \
   to the specified Amazon CloudWatch log group in your Amazon Web Services account.\n"]

module CreateHybridAD : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
    | `ClientException of client_exception
    | `DirectoryLimitExceededException of directory_limit_exceeded_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_hybrid_ad_request ->
    ( create_hybrid_ad_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
      | `ClientException of client_exception
      | `DirectoryLimitExceededException of directory_limit_exceeded_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_hybrid_ad_request ->
    ( create_hybrid_ad_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
      | `ClientException of client_exception
      | `DirectoryLimitExceededException of directory_limit_exceeded_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a hybrid directory that connects your self-managed Active Directory (AD) infrastructure \
   and Amazon Web Services.\n\n\
  \ You must have a successful directory assessment using [StartADAssessment] to validate your \
   environment compatibility before you use this operation.\n\
  \ \n\
  \  Updates are applied asynchronously. Use [DescribeDirectories] to monitor the progress of \
   directory creation.\n\
  \  "]

module CreateDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryLimitExceededException of directory_limit_exceeded_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_directory_request ->
    ( create_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryLimitExceededException of directory_limit_exceeded_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_directory_request ->
    ( create_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryLimitExceededException of directory_limit_exceeded_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Simple AD directory. For more information, see \
   {{:https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_simple_ad.html}Simple \
   Active Directory} in the {i Directory Service Admin Guide}.\n\n\
  \ Before you call [CreateDirectory], ensure that all of the required permissions have been \
   explicitly granted through a policy. For details about what permissions are required to run the \
   [CreateDirectory] operation, see \
   {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory \
   Service API Permissions: Actions, Resources, and Conditions Reference}.\n\
  \ "]

module CreateConditionalForwarder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_conditional_forwarder_request ->
    ( create_conditional_forwarder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_conditional_forwarder_request ->
    ( create_conditional_forwarder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a conditional forwarder associated with your Amazon Web Services directory. Conditional \
   forwarders are required in order to set up a trust relationship with another domain. The \
   conditional forwarder points to the trusted domain.\n"]

module CreateComputer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthenticationFailedException of authentication_failed_exception
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_computer_request ->
    ( create_computer_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthenticationFailedException of authentication_failed_exception
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_computer_request ->
    ( create_computer_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthenticationFailedException of authentication_failed_exception
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an Active Directory computer object in the specified directory.\n"]

module CreateAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_alias_request ->
    ( create_alias_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_alias_request ->
    ( create_alias_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an alias for a directory and assigns the alias to the directory. The alias is used to \
   construct the access URL for the directory, such as \n\
   {[\n\
   http://.awsapps.com\n\
   ]}\n\
   .\n\n\
  \  After an alias has been created, it cannot be deleted or reused, so this operation should \
   only be used when absolutely necessary.\n\
  \  \n\
  \   "]

module ConnectDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryLimitExceededException of directory_limit_exceeded_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    connect_directory_request ->
    ( connect_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryLimitExceededException of directory_limit_exceeded_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    connect_directory_request ->
    ( connect_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryLimitExceededException of directory_limit_exceeded_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an AD Connector to connect to a self-managed directory.\n\n\
  \ Before you call [ConnectDirectory], ensure that all of the required permissions have been \
   explicitly granted through a policy. For details about what permissions are required to run the \
   [ConnectDirectory] operation, see \
   {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory \
   Service API Permissions: Actions, Resources, and Conditions Reference}.\n\
  \ "]

module CancelSchemaExtension : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_schema_extension_request ->
    ( cancel_schema_extension_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_schema_extension_request ->
    ( cancel_schema_extension_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels an in-progress schema extension to a Microsoft AD directory. Once a schema extension \
   has started replicating to all domain controllers, the task can no longer be canceled. A schema \
   extension can be canceled during any of the following states; [Initializing], \
   [CreatingSnapshot], and [UpdatingSchema].\n"]

module AddTagsToResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `TagLimitExceededException of tag_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_request ->
    ( add_tags_to_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `TagLimitExceededException of tag_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_request ->
    ( add_tags_to_resource_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `TagLimitExceededException of tag_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or overwrites one or more tags for the specified directory. Each directory can have a \
   maximum of 50 tags. Each tag consists of a key and optional value. Tag keys must be unique to \
   each resource.\n"]

module AddRegion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryAlreadyInRegionException of directory_already_in_region_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `RegionLimitExceededException of region_limit_exceeded_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_region_request ->
    ( add_region_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryAlreadyInRegionException of directory_already_in_region_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `RegionLimitExceededException of region_limit_exceeded_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_region_request ->
    ( add_region_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryAlreadyInRegionException of directory_already_in_region_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `RegionLimitExceededException of region_limit_exceeded_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds two domain controllers in the specified Region for the specified directory.\n"]

module AddIpRoutes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `IpRouteLimitExceededException of ip_route_limit_exceeded_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_ip_routes_request ->
    ( add_ip_routes_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `IpRouteLimitExceededException of ip_route_limit_exceeded_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_ip_routes_request ->
    ( add_ip_routes_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `IpRouteLimitExceededException of ip_route_limit_exceeded_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "If the DNS server for your self-managed domain uses a publicly addressable IP address, you must \
   add a CIDR address block to correctly route traffic to and from your Microsoft AD on Amazon Web \
   Services. {i AddIpRoutes} adds this address block. You can also use {i AddIpRoutes} to \
   facilitate routing traffic that uses public IP ranges from your Microsoft AD on Amazon Web \
   Services to a peer VPC. \n\n\
  \ Before you call {i AddIpRoutes}, ensure that all of the required permissions have been \
   explicitly granted through a policy. For details about what permissions are required to run the \
   {i AddIpRoutes} operation, see \
   {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory \
   Service API Permissions: Actions, Resources, and Conditions Reference}.\n\
  \ "]

module AcceptSharedDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryAlreadySharedException of directory_already_shared_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_shared_directory_request ->
    ( accept_shared_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryAlreadySharedException of directory_already_shared_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_shared_directory_request ->
    ( accept_shared_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryAlreadySharedException of directory_already_shared_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts a directory sharing request that was sent from the directory owner account.\n"]
