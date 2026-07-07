(** MigrationHub Config client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_target : ?id:target_id -> type_:target_type -> unit -> target

val make_home_region_control :
  ?requested_time:requested_time ->
  ?target:target ->
  ?home_region:home_region ->
  ?control_id:control_id ->
  unit ->
  home_region_control

val make_get_home_region_request : unit -> unit

val make_describe_home_region_controls_request :
  ?next_token:token ->
  ?max_results:describe_home_region_controls_max_results ->
  ?target:target ->
  ?home_region:home_region ->
  ?control_id:control_id ->
  unit ->
  describe_home_region_controls_request

val make_delete_home_region_control_request :
  control_id:control_id -> unit -> delete_home_region_control_request

val make_create_home_region_control_request :
  ?dry_run:dry_run ->
  target:target ->
  home_region:home_region ->
  unit ->
  create_home_region_control_request
(** {1:operations Operations} *)

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

(** {1:Serialization and Deserialization} *)
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

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
