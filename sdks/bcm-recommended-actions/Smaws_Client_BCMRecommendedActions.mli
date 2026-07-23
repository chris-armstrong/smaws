(** BCM Recommended Actions client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_validation_exception_field :
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_recommended_action :
  ?id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?type_:action_type ->
  ?account_id:account_id ->
  ?severity:severity ->
  ?feature:feature ->
  ?context:context ->
  ?next_steps:next_steps ->
  ?last_updated_time_stamp:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  recommended_action

val make_list_recommended_actions_response :
  ?next_token:next_token ->
  recommended_actions:recommended_actions ->
  unit ->
  list_recommended_actions_response

val make_action_filter :
  key:filter_name -> match_option:match_option -> values:filter_values -> unit -> action_filter

val make_request_filter : ?actions:action_filter_list -> unit -> request_filter

val make_list_recommended_actions_request :
  ?filter:request_filter ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_recommended_actions_request
(** {1:operations Operations} *)

(** {1:Serialization and Deserialization} *)
module ListRecommendedActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_recommended_actions_request ->
    ( list_recommended_actions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_recommended_actions_request ->
    ( list_recommended_actions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of recommended actions that match the filter criteria.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
