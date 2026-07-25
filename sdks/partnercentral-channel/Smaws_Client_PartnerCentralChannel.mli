(** PartnerCentral Channel client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_validation_exception_field :
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  code:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_accept_channel_handshake_detail :
  ?id:channel_handshake_id ->
  ?arn:arn ->
  ?status:handshake_status ->
  unit ->
  accept_channel_handshake_detail

val make_accept_channel_handshake_response :
  ?channel_handshake_detail:accept_channel_handshake_detail ->
  unit ->
  accept_channel_handshake_response

val make_accept_channel_handshake_request :
  catalog:catalog ->
  identifier:channel_handshake_identifier ->
  unit ->
  accept_channel_handshake_request

val make_cancel_channel_handshake_detail :
  ?id:channel_handshake_id ->
  ?arn:arn ->
  ?status:handshake_status ->
  unit ->
  cancel_channel_handshake_detail

val make_cancel_channel_handshake_response :
  ?channel_handshake_detail:cancel_channel_handshake_detail ->
  unit ->
  cancel_channel_handshake_response

val make_cancel_channel_handshake_request :
  catalog:catalog ->
  identifier:channel_handshake_identifier ->
  unit ->
  cancel_channel_handshake_request

val make_revoke_service_period_payload :
  ?note:note ->
  program_management_account_identifier:program_management_account_identifier ->
  unit ->
  revoke_service_period_payload

val make_start_service_period_payload :
  ?note:note ->
  ?minimum_notice_days:minimum_notice_days ->
  ?end_date:date_time ->
  program_management_account_identifier:program_management_account_identifier ->
  service_period_type:service_period_type ->
  unit ->
  start_service_period_payload

val make_program_management_account_handshake_detail :
  ?program:program -> unit -> program_management_account_handshake_detail

val make_revoke_service_period_handshake_detail :
  ?note:note ->
  ?service_period_type:service_period_type ->
  ?minimum_notice_days:minimum_notice_days ->
  ?start_date:date_time ->
  ?end_date:date_time ->
  unit ->
  revoke_service_period_handshake_detail

val make_start_service_period_handshake_detail :
  ?note:note ->
  ?service_period_type:service_period_type ->
  ?minimum_notice_days:minimum_notice_days ->
  ?start_date:date_time ->
  ?end_date:date_time ->
  unit ->
  start_service_period_handshake_detail

val make_channel_handshake_summary :
  ?id:channel_handshake_id ->
  ?arn:arn ->
  ?catalog:catalog ->
  ?handshake_type:handshake_type ->
  ?owner_account_id:account_id ->
  ?sender_account_id:account_id ->
  ?sender_display_name:partner_profile_display_name ->
  ?receiver_account_id:account_id ->
  ?associated_resource_id:associated_resource_id ->
  ?detail:handshake_detail ->
  ?created_at:date_time ->
  ?updated_at:date_time ->
  ?status:handshake_status ->
  unit ->
  channel_handshake_summary

val make_create_channel_handshake_detail :
  ?id:channel_handshake_id -> ?arn:arn -> unit -> create_channel_handshake_detail

val make_create_channel_handshake_response :
  ?channel_handshake_detail:create_channel_handshake_detail ->
  unit ->
  create_channel_handshake_response

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_create_channel_handshake_request :
  ?payload:channel_handshake_payload ->
  ?client_token:client_token ->
  ?tags:tag_list ->
  handshake_type:handshake_type ->
  catalog:catalog ->
  associated_resource_identifier:associated_resource_identifier ->
  unit ->
  create_channel_handshake_request

val make_create_program_management_account_detail :
  ?id:program_management_account_id -> ?arn:arn -> unit -> create_program_management_account_detail

val make_create_program_management_account_response :
  ?program_management_account_detail:create_program_management_account_detail ->
  unit ->
  create_program_management_account_response

val make_create_program_management_account_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  catalog:catalog ->
  program:program ->
  display_name:program_management_account_display_name ->
  account_id:account_id ->
  unit ->
  create_program_management_account_request

val make_create_relationship_detail :
  ?arn:arn -> ?id:relationship_id -> unit -> create_relationship_detail

val make_create_relationship_response :
  ?relationship_detail:create_relationship_detail -> unit -> create_relationship_response

val make_resold_unified_operations :
  ?charge_account_id:account_id ->
  coverage:coverage ->
  tam_location:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  resold_unified_operations

val make_partner_led_support :
  ?provider:provider ->
  coverage:coverage ->
  tam_location:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  partner_led_support

val make_resold_enterprise :
  ?charge_account_id:account_id ->
  coverage:coverage ->
  tam_location:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  resold_enterprise

val make_create_relationship_request :
  ?resale_account_model:resale_account_model ->
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?requested_support_plan:support_plan ->
  catalog:catalog ->
  association_type:association_type ->
  program_management_account_identifier:program_management_account_identifier ->
  associated_account_id:account_id ->
  display_name:relationship_display_name ->
  sector:sector ->
  unit ->
  create_relationship_request

val make_delete_program_management_account_response : unit -> unit

val make_delete_program_management_account_request :
  ?client_token:client_token ->
  catalog:catalog ->
  identifier:program_management_account_identifier ->
  unit ->
  delete_program_management_account_request

val make_delete_relationship_response : unit -> unit

val make_delete_relationship_request :
  ?client_token:client_token ->
  catalog:catalog ->
  identifier:relationship_identifier ->
  program_management_account_identifier:program_management_account_identifier ->
  unit ->
  delete_relationship_request

val make_relationship_detail :
  ?arn:arn ->
  ?id:relationship_id ->
  ?revision:revision ->
  ?catalog:catalog ->
  ?association_type:association_type ->
  ?program_management_account_id:program_management_account_id ->
  ?associated_account_id:account_id ->
  ?display_name:relationship_display_name ->
  ?resale_account_model:resale_account_model ->
  ?sector:sector ->
  ?created_at:date_time ->
  ?updated_at:date_time ->
  ?start_date:date_time ->
  unit ->
  relationship_detail

val make_get_relationship_response :
  ?relationship_detail:relationship_detail -> unit -> get_relationship_response

val make_get_relationship_request :
  catalog:catalog ->
  program_management_account_identifier:program_management_account_identifier ->
  identifier:relationship_identifier ->
  unit ->
  get_relationship_request

val make_list_channel_handshakes_response :
  ?items:channel_handshake_summaries ->
  ?next_token:next_token ->
  unit ->
  list_channel_handshakes_response

val make_program_management_account_type_sort :
  sort_order:sort_order ->
  sort_by:program_management_account_type_sort_name ->
  unit ->
  program_management_account_type_sort

val make_revoke_service_period_type_sort :
  sort_order:sort_order ->
  sort_by:revoke_service_period_type_sort_name ->
  unit ->
  revoke_service_period_type_sort

val make_start_service_period_type_sort :
  sort_order:sort_order ->
  sort_by:start_service_period_type_sort_name ->
  unit ->
  start_service_period_type_sort

val make_program_management_account_type_filters :
  ?programs:program_list -> unit -> program_management_account_type_filters

val make_revoke_service_period_type_filters :
  ?service_period_types:service_period_type_list -> unit -> revoke_service_period_type_filters

val make_start_service_period_type_filters :
  ?service_period_types:service_period_type_list -> unit -> start_service_period_type_filters

val make_list_channel_handshakes_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?statuses:handshake_status_list ->
  ?associated_resource_identifiers:associated_resource_identifier_list ->
  ?handshake_type_filters:list_channel_handshakes_type_filters ->
  ?handshake_type_sort:list_channel_handshakes_type_sort ->
  ?next_token:next_token ->
  handshake_type:handshake_type ->
  catalog:catalog ->
  participant_type:participant_type ->
  unit ->
  list_channel_handshakes_request

val make_program_management_account_summary :
  ?id:program_management_account_id ->
  ?revision:revision ->
  ?catalog:catalog ->
  ?program:program ->
  ?display_name:program_management_account_display_name ->
  ?account_id:account_id ->
  ?arn:arn ->
  ?created_at:date_time ->
  ?updated_at:date_time ->
  ?start_date:date_time ->
  ?status:program_management_account_status ->
  unit ->
  program_management_account_summary

val make_list_program_management_accounts_response :
  ?items:program_management_account_summaries ->
  ?next_token:next_token ->
  unit ->
  list_program_management_accounts_response

val make_list_program_management_accounts_sort_base :
  sort_order:sort_order ->
  sort_by:list_program_management_accounts_sort_name ->
  unit ->
  list_program_management_accounts_sort_base

val make_list_program_management_accounts_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?display_names:program_management_account_display_name_list ->
  ?programs:program_list ->
  ?account_ids:account_id_list ->
  ?statuses:program_management_account_status_list ->
  ?sort:list_program_management_accounts_sort_base ->
  ?next_token:next_token ->
  catalog:catalog ->
  unit ->
  list_program_management_accounts_request

val make_relationship_summary :
  ?arn:arn ->
  ?id:relationship_id ->
  ?revision:revision ->
  ?catalog:catalog ->
  ?association_type:association_type ->
  ?program_management_account_id:program_management_account_id ->
  ?associated_account_id:account_id ->
  ?display_name:relationship_display_name ->
  ?sector:sector ->
  ?created_at:date_time ->
  ?updated_at:date_time ->
  ?start_date:date_time ->
  unit ->
  relationship_summary

val make_list_relationships_response :
  ?items:relationship_summaries -> ?next_token:next_token -> unit -> list_relationships_response

val make_list_relationships_sort_base :
  sort_order:sort_order ->
  sort_by:list_relationships_sort_name ->
  unit ->
  list_relationships_sort_base

val make_list_relationships_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?associated_account_ids:account_id_list ->
  ?association_types:association_type_list ->
  ?display_names:relationship_display_name_list ->
  ?program_management_account_identifiers:program_management_account_identifier_list ->
  ?sort:list_relationships_sort_base ->
  ?next_token:next_token ->
  catalog:catalog ->
  unit ->
  list_relationships_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:taggable_arn -> unit -> list_tags_for_resource_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:taggable_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:taggable_arn -> tags:tag_list -> unit -> tag_resource_request

val make_reject_channel_handshake_detail :
  ?id:channel_handshake_id ->
  ?arn:arn ->
  ?status:handshake_status ->
  unit ->
  reject_channel_handshake_detail

val make_reject_channel_handshake_response :
  ?channel_handshake_detail:reject_channel_handshake_detail ->
  unit ->
  reject_channel_handshake_response

val make_reject_channel_handshake_request :
  catalog:catalog ->
  identifier:channel_handshake_identifier ->
  unit ->
  reject_channel_handshake_request

val make_update_program_management_account_detail :
  ?id:program_management_account_id ->
  ?arn:arn ->
  ?revision:revision ->
  ?display_name:program_management_account_display_name ->
  unit ->
  update_program_management_account_detail

val make_update_program_management_account_response :
  ?program_management_account_detail:update_program_management_account_detail ->
  unit ->
  update_program_management_account_response

val make_update_program_management_account_request :
  ?revision:revision ->
  ?display_name:program_management_account_display_name ->
  catalog:catalog ->
  identifier:program_management_account_identifier ->
  unit ->
  update_program_management_account_request

val make_update_relationship_detail :
  ?arn:arn ->
  ?id:relationship_id ->
  ?revision:revision ->
  ?display_name:relationship_display_name ->
  unit ->
  update_relationship_detail

val make_update_relationship_response :
  ?relationship_detail:update_relationship_detail -> unit -> update_relationship_response

val make_update_relationship_request :
  ?revision:revision ->
  ?display_name:relationship_display_name ->
  ?requested_support_plan:support_plan ->
  catalog:catalog ->
  identifier:relationship_identifier ->
  program_management_account_identifier:program_management_account_identifier ->
  unit ->
  update_relationship_request
(** {1:operations Operations} *)

module UpdateRelationship : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_relationship_request ->
    ( update_relationship_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_relationship_request ->
    ( update_relationship_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the properties of a partner relationship.\n"]

module UpdateProgramManagementAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_program_management_account_request ->
    ( update_program_management_account_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_program_management_account_request ->
    ( update_program_management_account_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the properties of a program management account.\n"]

module RejectChannelHandshake : sig
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
    reject_channel_handshake_request ->
    ( reject_channel_handshake_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_channel_handshake_request ->
    ( reject_channel_handshake_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Rejects a pending channel handshake request.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds or updates tags for a specified resource.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes tags from a specified resource.\n"]

module ListTagsForResource : sig
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
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists tags associated with a specific resource.\n"]

module ListRelationships : sig
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
    list_relationships_request ->
    ( list_relationships_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_relationships_request ->
    ( list_relationships_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists partner relationships based on specified criteria.\n"]

module ListProgramManagementAccounts : sig
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
    list_program_management_accounts_request ->
    ( list_program_management_accounts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_program_management_accounts_request ->
    ( list_program_management_accounts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists program management accounts based on specified criteria.\n"]

module ListChannelHandshakes : sig
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
    list_channel_handshakes_request ->
    ( list_channel_handshakes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_channel_handshakes_request ->
    ( list_channel_handshakes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists channel handshakes based on specified criteria.\n"]

module GetRelationship : sig
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
    get_relationship_request ->
    ( get_relationship_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_relationship_request ->
    ( get_relationship_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves details of a specific partner relationship.\n"]

module DeleteRelationship : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_relationship_request ->
    ( delete_relationship_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_relationship_request ->
    ( delete_relationship_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a partner relationship.\n"]

module DeleteProgramManagementAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_program_management_account_request ->
    ( delete_program_management_account_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_program_management_account_request ->
    ( delete_program_management_account_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a program management account.\n"]

module CreateRelationship : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_relationship_request ->
    ( create_relationship_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_relationship_request ->
    ( create_relationship_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new partner relationship between accounts.\n"]

module CreateProgramManagementAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_program_management_account_request ->
    ( create_program_management_account_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_program_management_account_request ->
    ( create_program_management_account_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new program management account for managing partner relationships.\n"]

module CreateChannelHandshake : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_channel_handshake_request ->
    ( create_channel_handshake_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_channel_handshake_request ->
    ( create_channel_handshake_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new channel handshake request to establish a partnership with another AWS account.\n"]

module CancelChannelHandshake : sig
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
    cancel_channel_handshake_request ->
    ( cancel_channel_handshake_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_channel_handshake_request ->
    ( cancel_channel_handshake_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Cancels a pending channel handshake request.\n"]

(** {1:Serialization and Deserialization} *)
module AcceptChannelHandshake : sig
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
    accept_channel_handshake_request ->
    ( accept_channel_handshake_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_channel_handshake_request ->
    ( accept_channel_handshake_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Accepts a pending channel handshake request from another AWS account.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
