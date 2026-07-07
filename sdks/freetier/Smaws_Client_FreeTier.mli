(** FreeTier client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_upgrade_account_plan_response :
  account_plan_status:account_plan_status ->
  account_plan_type:account_plan_type ->
  account_id:account_id ->
  unit ->
  upgrade_account_plan_response

val make_upgrade_account_plan_request :
  account_plan_type:account_plan_type -> unit -> upgrade_account_plan_request

val make_monetary_amount : unit_:currency_code -> amount:generic_double -> unit -> monetary_amount

val make_activity_summary :
  status:activity_status ->
  reward:activity_reward ->
  title:generic_string ->
  activity_id:activity_id ->
  unit ->
  activity_summary

val make_list_account_activities_response :
  ?next_token:next_page_token -> activities:activities -> unit -> list_account_activities_response

val make_list_account_activities_request :
  ?language_code:language_code ->
  ?max_results:max_results ->
  ?next_token:next_page_token ->
  ?filter_activity_statuses:filter_activity_statuses ->
  unit ->
  list_account_activities_request

val make_free_tier_usage :
  ?free_tier_type:generic_string ->
  ?description:generic_string ->
  ?unit_:generic_string ->
  ?limit:generic_double ->
  ?forecasted_usage_amount:generic_double ->
  ?actual_usage_amount:generic_double ->
  ?region:generic_string ->
  ?usage_type:generic_string ->
  ?operation:generic_string ->
  ?service:generic_string ->
  unit ->
  free_tier_usage

val make_get_free_tier_usage_response :
  ?next_token:next_page_token ->
  free_tier_usages:free_tier_usages ->
  unit ->
  get_free_tier_usage_response

val make_dimension_values :
  match_options:match_options -> values:values -> key:dimension -> unit -> dimension_values

val make_expression :
  ?dimensions:dimension_values ->
  ?not:expression ->
  ?and_:expressions ->
  ?\#or:expressions ->
  unit ->
  expression

val make_get_free_tier_usage_request :
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  ?filter:expression ->
  unit ->
  get_free_tier_usage_request

val make_get_account_plan_state_response :
  ?account_plan_expiration_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?account_plan_remaining_credits:monetary_amount ->
  account_plan_status:account_plan_status ->
  account_plan_type:account_plan_type ->
  account_id:account_id ->
  unit ->
  get_account_plan_state_response

val make_get_account_plan_state_request : unit -> unit

val make_get_account_activity_response :
  ?completed_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?started_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?estimated_time_to_complete_in_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  reward:activity_reward ->
  instructions_url:generic_string ->
  status:activity_status ->
  description:generic_string ->
  title:generic_string ->
  activity_id:activity_id ->
  unit ->
  get_account_activity_response

val make_get_account_activity_request :
  ?language_code:language_code -> activity_id:activity_id -> unit -> get_account_activity_request
(** {1:operations Operations} *)

module GetAccountActivity : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_account_activity_request ->
    ( get_account_activity_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_account_activity_request ->
    ( get_account_activity_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Returns a specific activity record that is available to the customer. \n"]

module GetAccountPlanState : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_account_plan_state_request ->
    ( get_account_plan_state_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_account_plan_state_request ->
    ( get_account_plan_state_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This returns all of the information related to the state of the account plan related to Free \
   Tier. \n"]

module GetFreeTierUsage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_free_tier_usage_request ->
    ( get_free_tier_usage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_free_tier_usage_request ->
    ( get_free_tier_usage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of all Free Tier usage objects that match your filters.\n"]

module ListAccountActivities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_account_activities_request ->
    ( list_account_activities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_account_activities_request ->
    ( list_account_activities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Returns a list of activities that are available. This operation supports pagination and \
   filtering by status. \n"]

(** {1:Serialization and Deserialization} *)
module UpgradeAccountPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    upgrade_account_plan_request ->
    ( upgrade_account_plan_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    upgrade_account_plan_request ->
    ( upgrade_account_plan_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " The account plan type for the Amazon Web Services account. \n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
