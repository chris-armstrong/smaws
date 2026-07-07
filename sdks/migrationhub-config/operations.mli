open Types

module CreateHomeRegionControl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DryRunOperation of dry_run_operation
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_home_region_control_request ->
    ( create_home_region_control_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DryRunOperation of dry_run_operation
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_home_region_control_request ->
    ( create_home_region_control_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DryRunOperation of dry_run_operation
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "This API sets up the home region for the calling account only.\n"]

module DeleteHomeRegionControl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_home_region_control_request ->
    ( delete_home_region_control_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_home_region_control_request ->
    ( delete_home_region_control_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation deletes the home region configuration for the calling account. The operation \
   does not delete discovery or migration tracking data in the home region.\n"]

module DescribeHomeRegionControls : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_home_region_controls_request ->
    ( describe_home_region_controls_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_home_region_controls_request ->
    ( describe_home_region_controls_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "This API permits filtering on the [ControlId] and [HomeRegion] fields.\n"]

module GetHomeRegion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidInputException of invalid_input_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_home_region_request ->
    ( get_home_region_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_home_region_request ->
    ( get_home_region_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidInputException of invalid_input_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the calling account\226\128\153s home region, if configured. This API is used by other \
   AWS services to determine the regional endpoint for calling AWS Application Discovery Service \
   and Migration Hub. You must call [GetHomeRegion] at least once before you call any other AWS \
   Application Discovery Service and AWS Migration Hub APIs, to obtain the account's Migration Hub \
   home region.\n"]
