(** PartnerCentral Account client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_business_verification_details :
  ?jurisdiction_of_incorporation:jurisdiction_code ->
  country_code:country_code ->
  registration_id:registration_id ->
  legal_name:legal_name ->
  unit ->
  business_verification_details

val make_business_verification_response :
  ?completion_url_expires_at:date_time ->
  ?completion_url:completion_url ->
  business_verification_details:business_verification_details ->
  unit ->
  business_verification_response

val make_registrant_verification_response :
  completion_url_expires_at:date_time ->
  completion_url:completion_url ->
  unit ->
  registrant_verification_response

val make_registrant_verification_details : unit -> unit

val make_field_validation_error :
  code:field_validation_code ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  field_validation_error

val make_business_validation_error :
  code:business_validation_code ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  business_validation_error

val make_update_connection_preferences_response :
  ?excluded_participant_ids:participant_identifier_list ->
  revision:revision ->
  updated_at:date_time ->
  access_type:access_type ->
  arn:connection_preferences_arn ->
  catalog:catalog ->
  unit ->
  update_connection_preferences_response

val make_update_connection_preferences_request :
  ?excluded_participant_identifiers:participant_identifier_list ->
  access_type:access_type ->
  revision:revision ->
  catalog:catalog ->
  unit ->
  update_connection_preferences_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:taggable_resource_arn -> unit -> untag_resource_request

val make_localized_content :
  locale:locale ->
  logo_url:url ->
  website_url:url ->
  description:unicode_string ->
  display_name:unicode_string ->
  unit ->
  localized_content

val make_task_details :
  ?localized_contents:localized_content_list ->
  translation_source_locale:locale ->
  industry_segments:industry_segment_list ->
  primary_solution_type:primary_solution_type ->
  logo_url:url ->
  website_url:url ->
  description:unicode_string ->
  display_name:unicode_string ->
  unit ->
  task_details

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_arn:taggable_resource_arn -> unit -> tag_resource_request

val make_start_verification_response :
  ?completed_at:date_time ->
  ?verification_status_reason:verification_status_reason ->
  started_at:date_time ->
  verification_response_details:verification_response_details ->
  verification_status:verification_status ->
  verification_type:verification_type ->
  unit ->
  start_verification_response

val make_start_verification_request :
  ?verification_details:verification_details ->
  ?client_token:client_token ->
  unit ->
  start_verification_request

val make_error_detail :
  reason:profile_validation_error_reason ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  locale:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  error_detail

val make_start_profile_update_task_response :
  ?error_detail_list:error_detail_list ->
  ?ended_at:date_time ->
  status:profile_task_status ->
  started_at:date_time ->
  task_details:task_details ->
  task_id:profile_task_id ->
  id:partner_id ->
  arn:partner_arn ->
  catalog:catalog ->
  unit ->
  start_profile_update_task_response

val make_start_profile_update_task_request :
  ?client_token:client_token ->
  task_details:task_details ->
  identifier:partner_identifier ->
  catalog:catalog ->
  unit ->
  start_profile_update_task_request

val make_send_email_verification_code_response : unit -> unit

val make_send_email_verification_code_request :
  email:email -> catalog:catalog -> unit -> send_email_verification_code_request

val make_seller_profile_summary :
  name:unicode_string -> id:seller_profile_id -> unit -> seller_profile_summary

val make_reject_connection_invitation_response :
  ?expires_at:date_time ->
  ?connection_id:connection_id ->
  inviter_name:sensitive_unicode_string ->
  inviter_email:email ->
  invitation_message:unicode_string_including_new_line ->
  status:invitation_status ->
  participant_type:participant_type ->
  other_participant_identifier:participant_identifier ->
  updated_at:date_time ->
  created_at:date_time ->
  connection_type:connection_type ->
  arn:connection_invitation_arn ->
  id:connection_invitation_id ->
  catalog:catalog ->
  unit ->
  reject_connection_invitation_response

val make_reject_connection_invitation_request :
  ?reason:Smaws_Lib.Smithy_api.Types.string_ ->
  client_token:client_token ->
  identifier:connection_invitation_id ->
  catalog:catalog ->
  unit ->
  reject_connection_invitation_request

val make_put_profile_visibility_response :
  profile_id:partner_profile_id ->
  visibility:profile_visibility ->
  id:partner_id ->
  arn:partner_arn ->
  catalog:catalog ->
  unit ->
  put_profile_visibility_response

val make_put_profile_visibility_request :
  visibility:profile_visibility ->
  identifier:partner_identifier ->
  catalog:catalog ->
  unit ->
  put_profile_visibility_request

val make_alliance_lead_contact :
  business_title:sensitive_unicode_string ->
  email:email ->
  last_name:sensitive_unicode_string ->
  first_name:sensitive_unicode_string ->
  unit ->
  alliance_lead_contact

val make_put_alliance_lead_contact_response :
  alliance_lead_contact:alliance_lead_contact ->
  id:partner_id ->
  arn:partner_arn ->
  catalog:catalog ->
  unit ->
  put_alliance_lead_contact_response

val make_put_alliance_lead_contact_request :
  ?email_verification_code:email_verification_code ->
  alliance_lead_contact:alliance_lead_contact ->
  identifier:partner_identifier ->
  catalog:catalog ->
  unit ->
  put_alliance_lead_contact_request

val make_partner_summary :
  created_at:date_time ->
  legal_name:sensitive_unicode_string ->
  id:partner_id ->
  arn:partner_arn ->
  catalog:catalog ->
  unit ->
  partner_summary

val make_partner_profile_summary :
  name:unicode_string -> id:partner_profile_id -> unit -> partner_profile_summary

val make_partner_profile :
  ?profile_id:partner_profile_id ->
  ?localized_contents:localized_content_list ->
  translation_source_locale:locale ->
  industry_segments:industry_segment_list ->
  primary_solution_type:primary_solution_type ->
  logo_url:url ->
  website_url:url ->
  description:unicode_string ->
  display_name:unicode_string ->
  unit ->
  partner_profile

val make_partner_domain :
  registered_at:date_time -> domain_name:domain_name -> unit -> partner_domain

val make_list_tags_for_resource_response :
  ?tags:tag_list -> resource_arn:taggable_resource_arn -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:taggable_resource_arn -> unit -> list_tags_for_resource_request

val make_get_verification_response :
  ?completed_at:date_time ->
  ?verification_status_reason:verification_status_reason ->
  started_at:date_time ->
  verification_response_details:verification_response_details ->
  verification_status:verification_status ->
  verification_type:verification_type ->
  unit ->
  get_verification_response

val make_get_verification_request :
  verification_type:verification_type -> unit -> get_verification_request

val make_account_summary : name:unicode_string -> unit -> account_summary

val make_list_partners_response :
  ?next_token:next_token ->
  partner_summary_list:partner_summary_list ->
  unit ->
  list_partners_response

val make_list_partners_request :
  ?next_token:next_token -> catalog:catalog -> unit -> list_partners_request

val make_connection_type_summary :
  other_participant:participant -> status:connection_type_status -> unit -> connection_type_summary

val make_connection_summary :
  connection_types:connection_type_summary_map ->
  updated_at:date_time ->
  other_participant_account_id:aws_account_id ->
  arn:connection_arn ->
  id:connection_id ->
  catalog:catalog ->
  unit ->
  connection_summary

val make_list_connections_response :
  ?next_token:next_token ->
  connection_summaries:connection_summary_list ->
  unit ->
  list_connections_response

val make_list_connections_request :
  ?other_participant_identifiers:participant_identifier_list ->
  ?max_results:max_results ->
  ?connection_type:connection_type_filter ->
  ?next_token:next_token ->
  catalog:catalog ->
  unit ->
  list_connections_request

val make_connection_invitation_summary :
  ?expires_at:date_time ->
  ?connection_id:connection_id ->
  status:invitation_status ->
  participant_type:participant_type ->
  other_participant_identifier:participant_identifier ->
  updated_at:date_time ->
  created_at:date_time ->
  connection_type:connection_type ->
  arn:connection_invitation_arn ->
  id:connection_invitation_id ->
  catalog:catalog ->
  unit ->
  connection_invitation_summary

val make_list_connection_invitations_response :
  ?next_token:next_token ->
  connection_invitation_summaries:connection_invitation_summary_list ->
  unit ->
  list_connection_invitations_response

val make_list_connection_invitations_request :
  ?status:invitation_status ->
  ?participant_type:participant_type ->
  ?other_participant_identifiers:participant_identifier_list ->
  ?max_results:max_results ->
  ?connection_type:connection_type ->
  ?next_token:next_token ->
  catalog:catalog ->
  unit ->
  list_connection_invitations_request

val make_get_profile_visibility_response :
  profile_id:partner_profile_id ->
  visibility:profile_visibility ->
  id:partner_id ->
  arn:partner_arn ->
  catalog:catalog ->
  unit ->
  get_profile_visibility_response

val make_get_profile_visibility_request :
  identifier:partner_identifier -> catalog:catalog -> unit -> get_profile_visibility_request

val make_get_profile_update_task_response :
  ?error_detail_list:error_detail_list ->
  ?ended_at:date_time ->
  status:profile_task_status ->
  started_at:date_time ->
  task_details:task_details ->
  task_id:profile_task_id ->
  id:partner_id ->
  arn:partner_arn ->
  catalog:catalog ->
  unit ->
  get_profile_update_task_response

val make_get_profile_update_task_request :
  identifier:partner_identifier -> catalog:catalog -> unit -> get_profile_update_task_request

val make_get_partner_response :
  ?aws_training_certification_email_domains:partner_domain_list ->
  profile:partner_profile ->
  created_at:date_time ->
  legal_name:sensitive_unicode_string ->
  id:partner_id ->
  arn:partner_arn ->
  catalog:catalog ->
  unit ->
  get_partner_response

val make_get_partner_request :
  identifier:partner_identifier -> catalog:catalog -> unit -> get_partner_request

val make_connection_type_detail :
  ?canceled_by:aws_account_id ->
  ?canceled_at:date_time ->
  other_participant:participant ->
  status:connection_type_status ->
  inviter_name:sensitive_unicode_string ->
  inviter_email:email ->
  created_at:date_time ->
  unit ->
  connection_type_detail

val make_get_connection_response :
  connection_types:connection_type_detail_map ->
  updated_at:date_time ->
  other_participant_account_id:aws_account_id ->
  arn:connection_arn ->
  id:connection_id ->
  catalog:catalog ->
  unit ->
  get_connection_response

val make_get_connection_request :
  identifier:connection_id -> catalog:catalog -> unit -> get_connection_request

val make_get_connection_preferences_response :
  ?excluded_participant_ids:participant_identifier_list ->
  revision:revision ->
  updated_at:date_time ->
  access_type:access_type ->
  arn:connection_preferences_arn ->
  catalog:catalog ->
  unit ->
  get_connection_preferences_response

val make_get_connection_preferences_request :
  catalog:catalog -> unit -> get_connection_preferences_request

val make_get_connection_invitation_response :
  ?expires_at:date_time ->
  ?connection_id:connection_id ->
  inviter_name:sensitive_unicode_string ->
  inviter_email:email ->
  invitation_message:unicode_string_including_new_line ->
  status:invitation_status ->
  participant_type:participant_type ->
  other_participant_identifier:participant_identifier ->
  updated_at:date_time ->
  created_at:date_time ->
  connection_type:connection_type ->
  arn:connection_invitation_arn ->
  id:connection_invitation_id ->
  catalog:catalog ->
  unit ->
  get_connection_invitation_response

val make_get_connection_invitation_request :
  identifier:connection_invitation_id ->
  catalog:catalog ->
  unit ->
  get_connection_invitation_request

val make_get_alliance_lead_contact_response :
  alliance_lead_contact:alliance_lead_contact ->
  id:partner_id ->
  arn:partner_arn ->
  catalog:catalog ->
  unit ->
  get_alliance_lead_contact_response

val make_get_alliance_lead_contact_request :
  identifier:partner_identifier -> catalog:catalog -> unit -> get_alliance_lead_contact_request

val make_disassociate_aws_training_certification_email_domain_response : unit -> unit

val make_disassociate_aws_training_certification_email_domain_request :
  ?client_token:client_token ->
  domain_name:domain_name ->
  identifier:partner_identifier ->
  catalog:catalog ->
  unit ->
  disassociate_aws_training_certification_email_domain_request

val make_create_partner_response :
  ?aws_training_certification_email_domains:partner_domain_list ->
  alliance_lead_contact:alliance_lead_contact ->
  profile:partner_profile ->
  created_at:date_time ->
  legal_name:sensitive_unicode_string ->
  id:partner_id ->
  arn:partner_arn ->
  catalog:catalog ->
  unit ->
  create_partner_response

val make_create_partner_request :
  ?tags:tag_list ->
  ?client_token:client_token ->
  email_verification_code:email_verification_code ->
  alliance_lead_contact:alliance_lead_contact ->
  primary_solution_type:primary_solution_type ->
  legal_name:sensitive_unicode_string ->
  catalog:catalog ->
  unit ->
  create_partner_request

val make_create_connection_invitation_response :
  ?expires_at:date_time ->
  ?connection_id:connection_id ->
  inviter_name:sensitive_unicode_string ->
  inviter_email:email ->
  invitation_message:unicode_string_including_new_line ->
  status:invitation_status ->
  participant_type:participant_type ->
  other_participant_identifier:participant_identifier ->
  updated_at:date_time ->
  created_at:date_time ->
  connection_type:connection_type ->
  arn:connection_invitation_arn ->
  id:connection_invitation_id ->
  catalog:catalog ->
  unit ->
  create_connection_invitation_response

val make_create_connection_invitation_request :
  receiver_identifier:participant_identifier ->
  name:sensitive_unicode_string ->
  message:unicode_string_including_new_line ->
  email:email ->
  connection_type:connection_type ->
  client_token:client_token ->
  catalog:catalog ->
  unit ->
  create_connection_invitation_request

val make_connection :
  connection_types:connection_type_detail_map ->
  updated_at:date_time ->
  other_participant_account_id:aws_account_id ->
  arn:connection_arn ->
  id:connection_id ->
  catalog:catalog ->
  unit ->
  connection

val make_cancel_profile_update_task_response :
  ?error_detail_list:error_detail_list ->
  ?ended_at:date_time ->
  status:profile_task_status ->
  started_at:date_time ->
  task_details:task_details ->
  task_id:profile_task_id ->
  id:partner_id ->
  arn:partner_arn ->
  catalog:catalog ->
  unit ->
  cancel_profile_update_task_response

val make_cancel_profile_update_task_request :
  ?client_token:client_token ->
  task_id:profile_task_id ->
  identifier:partner_identifier ->
  catalog:catalog ->
  unit ->
  cancel_profile_update_task_request

val make_cancel_connection_response :
  connection_types:connection_type_detail_map ->
  updated_at:date_time ->
  other_participant_account_id:aws_account_id ->
  arn:connection_arn ->
  id:connection_id ->
  catalog:catalog ->
  unit ->
  cancel_connection_response

val make_cancel_connection_request :
  client_token:client_token ->
  reason:Smaws_Lib.Smithy_api.Types.string_ ->
  connection_type:connection_type ->
  identifier:connection_id ->
  catalog:catalog ->
  unit ->
  cancel_connection_request

val make_cancel_connection_invitation_response :
  ?expires_at:date_time ->
  ?connection_id:connection_id ->
  inviter_name:sensitive_unicode_string ->
  inviter_email:email ->
  invitation_message:unicode_string_including_new_line ->
  status:invitation_status ->
  participant_type:participant_type ->
  other_participant_identifier:participant_identifier ->
  updated_at:date_time ->
  created_at:date_time ->
  connection_type:connection_type ->
  arn:connection_invitation_arn ->
  id:connection_invitation_id ->
  catalog:catalog ->
  unit ->
  cancel_connection_invitation_response

val make_cancel_connection_invitation_request :
  client_token:client_token ->
  identifier:connection_invitation_id ->
  catalog:catalog ->
  unit ->
  cancel_connection_invitation_request

val make_associate_aws_training_certification_email_domain_response : unit -> unit

val make_associate_aws_training_certification_email_domain_request :
  ?client_token:client_token ->
  email_verification_code:email_verification_code ->
  email:email ->
  identifier:partner_identifier ->
  catalog:catalog ->
  unit ->
  associate_aws_training_certification_email_domain_request

val make_accept_connection_invitation_response :
  connection:connection -> unit -> accept_connection_invitation_response

val make_accept_connection_invitation_request :
  client_token:client_token ->
  identifier:connection_invitation_id ->
  catalog:catalog ->
  unit ->
  accept_connection_invitation_request
(** {1:operations Operations} *)

module AcceptConnectionInvitation : sig
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
    accept_connection_invitation_request ->
    ( accept_connection_invitation_response,
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
    accept_connection_invitation_request ->
    ( accept_connection_invitation_response Smaws_Lib.Response.t,
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
  "Accepts a connection invitation from another partner, establishing a formal partnership \
   connection between the two parties.\n"]

module AssociateAwsTrainingCertificationEmailDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_aws_training_certification_email_domain_request ->
    ( associate_aws_training_certification_email_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_aws_training_certification_email_domain_request ->
    ( associate_aws_training_certification_email_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates an email domain with AWS training and certification for the partner account, \
   enabling automatic verification of employee certifications.\n"]

module CancelConnection : sig
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
    cancel_connection_request ->
    ( cancel_connection_response,
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
    cancel_connection_request ->
    ( cancel_connection_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Cancels an existing connection between partners, terminating the partnership relationship.\n"]

module CancelConnectionInvitation : sig
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
    cancel_connection_invitation_request ->
    ( cancel_connection_invitation_response,
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
    cancel_connection_invitation_request ->
    ( cancel_connection_invitation_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Cancels a pending connection invitation before it has been accepted or rejected.\n"]

module CancelProfileUpdateTask : sig
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
    cancel_profile_update_task_request ->
    ( cancel_profile_update_task_response,
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
    cancel_profile_update_task_request ->
    ( cancel_profile_update_task_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Cancels an in-progress profile update task, stopping any pending changes to the partner profile.\n"]

module CreateConnectionInvitation : sig
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
    create_connection_invitation_request ->
    ( create_connection_invitation_response,
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
    create_connection_invitation_request ->
    ( create_connection_invitation_response Smaws_Lib.Response.t,
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
  "Creates a new connection invitation to establish a partnership with another organization.\n"]

module CreatePartner : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_partner_request ->
    ( create_partner_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_partner_request ->
    ( create_partner_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new partner account in the AWS Partner Network with the specified details and \
   configuration.\n"]

module DisassociateAwsTrainingCertificationEmailDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_aws_training_certification_email_domain_request ->
    ( disassociate_aws_training_certification_email_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_aws_training_certification_email_domain_request ->
    ( disassociate_aws_training_certification_email_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the association between an email domain and AWS training and certification for the \
   partner account.\n"]

module GetAllianceLeadContact : sig
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
    get_alliance_lead_contact_request ->
    ( get_alliance_lead_contact_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_alliance_lead_contact_request ->
    ( get_alliance_lead_contact_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the alliance lead contact information for a partner account.\n"]

module GetConnection : sig
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
    get_connection_request ->
    ( get_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_connection_request ->
    ( get_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves detailed information about a specific connection between partners.\n"]

module GetConnectionInvitation : sig
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
    get_connection_invitation_request ->
    ( get_connection_invitation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_connection_invitation_request ->
    ( get_connection_invitation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves detailed information about a specific connection invitation.\n"]

module GetConnectionPreferences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_connection_preferences_request ->
    ( get_connection_preferences_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_connection_preferences_request ->
    ( get_connection_preferences_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the connection preferences for a partner account, including access settings and \
   exclusions.\n"]

module GetPartner : sig
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
    get_partner_request ->
    ( get_partner_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_partner_request ->
    ( get_partner_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves detailed information about a specific partner account.\n"]

module GetProfileUpdateTask : sig
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
    get_profile_update_task_request ->
    ( get_profile_update_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_profile_update_task_request ->
    ( get_profile_update_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about a specific profile update task.\n"]

module GetProfileVisibility : sig
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
    get_profile_visibility_request ->
    ( get_profile_visibility_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_profile_visibility_request ->
    ( get_profile_visibility_response Smaws_Lib.Response.t,
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
  "Retrieves the visibility settings for a partner profile, determining who can see the profile \
   information.\n"]

module ListConnectionInvitations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_connection_invitations_request ->
    ( list_connection_invitations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_connection_invitations_request ->
    ( list_connection_invitations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists connection invitations for the partner account, with optional filtering by status, type, \
   and other criteria.\n"]

module ListConnections : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_connections_request ->
    ( list_connections_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_connections_request ->
    ( list_connections_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists active connections for the partner account, with optional filtering by connection type \
   and participant.\n"]

module ListPartners : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_partners_request ->
    ( list_partners_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_partners_request ->
    ( list_partners_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists partner accounts in the catalog, providing a summary view of all partners.\n"]

module GetVerification : sig
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
    get_verification_request ->
    ( get_verification_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_verification_request ->
    ( get_verification_response Smaws_Lib.Response.t,
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
  "Retrieves the current status and details of a verification process for a partner account. This \
   operation allows partners to check the progress and results of business or registrant \
   verification processes.\n"]

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
[@@ocaml.doc "Lists all tags associated with a specific AWS Partner Central Account resource.\n"]

module PutAllianceLeadContact : sig
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
    put_alliance_lead_contact_request ->
    ( put_alliance_lead_contact_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_alliance_lead_contact_request ->
    ( put_alliance_lead_contact_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates or updates the alliance lead contact information for a partner account.\n"]

module PutProfileVisibility : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_profile_visibility_request ->
    ( put_profile_visibility_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_profile_visibility_request ->
    ( put_profile_visibility_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the visibility level for a partner profile, controlling who can view the profile \
   information.\n"]

module RejectConnectionInvitation : sig
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
    reject_connection_invitation_request ->
    ( reject_connection_invitation_response,
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
    reject_connection_invitation_request ->
    ( reject_connection_invitation_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Rejects a connection invitation from another partner, declining the partnership request.\n"]

module SendEmailVerificationCode : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_email_verification_code_request ->
    ( send_email_verification_code_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_email_verification_code_request ->
    ( send_email_verification_code_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sends an email verification code to the specified email address for account verification \
   purposes.\n"]

module StartProfileUpdateTask : sig
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
    start_profile_update_task_request ->
    ( start_profile_update_task_response,
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
    start_profile_update_task_request ->
    ( start_profile_update_task_response Smaws_Lib.Response.t,
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
  "Initiates a profile update task to modify partner profile information asynchronously.\n"]

module StartVerification : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_verification_request ->
    ( start_verification_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_verification_request ->
    ( start_verification_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates a new verification process for a partner account. This operation begins the \
   verification workflow for either business registration or individual registrant identity \
   verification as required by AWS Partner Central.\n"]

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
[@@ocaml.doc "Adds or updates tags for a specified AWS Partner Central Account resource.\n"]

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
[@@ocaml.doc "Removes specified tags from an AWS Partner Central Account resource.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateConnectionPreferences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_connection_preferences_request ->
    ( update_connection_preferences_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_connection_preferences_request ->
    ( update_connection_preferences_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the connection preferences for a partner account, modifying access settings and \
   exclusions.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
