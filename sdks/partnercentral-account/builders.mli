open Types

val make_business_validation_error :
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  code:business_validation_code ->
  unit ->
  business_validation_error

val make_field_validation_error :
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  code:field_validation_code ->
  unit ->
  field_validation_error

val make_account_summary : name:unicode_string -> unit -> account_summary

val make_seller_profile_summary :
  id:seller_profile_id -> name:unicode_string -> unit -> seller_profile_summary

val make_partner_profile_summary :
  id:partner_profile_id -> name:unicode_string -> unit -> partner_profile_summary

val make_connection_type_detail :
  ?canceled_at:date_time ->
  ?canceled_by:aws_account_id ->
  created_at:date_time ->
  inviter_email:email ->
  inviter_name:sensitive_unicode_string ->
  status:connection_type_status ->
  other_participant:participant ->
  unit ->
  connection_type_detail

val make_connection :
  catalog:catalog ->
  id:connection_id ->
  arn:connection_arn ->
  other_participant_account_id:aws_account_id ->
  updated_at:date_time ->
  connection_types:connection_type_detail_map ->
  unit ->
  connection

val make_accept_connection_invitation_response :
  connection:connection -> unit -> accept_connection_invitation_response

val make_accept_connection_invitation_request :
  catalog:catalog ->
  identifier:connection_invitation_id ->
  client_token:client_token ->
  unit ->
  accept_connection_invitation_request

val make_alliance_lead_contact :
  first_name:sensitive_unicode_string ->
  last_name:sensitive_unicode_string ->
  email:email ->
  business_title:sensitive_unicode_string ->
  unit ->
  alliance_lead_contact

val make_associate_aws_training_certification_email_domain_response : unit -> unit

val make_associate_aws_training_certification_email_domain_request :
  ?client_token:client_token ->
  catalog:catalog ->
  identifier:partner_identifier ->
  email:email ->
  email_verification_code:email_verification_code ->
  unit ->
  associate_aws_training_certification_email_domain_request

val make_business_verification_details :
  ?jurisdiction_of_incorporation:jurisdiction_code ->
  legal_name:legal_name ->
  registration_id:registration_id ->
  country_code:country_code ->
  unit ->
  business_verification_details

val make_business_verification_response :
  ?completion_url:completion_url ->
  ?completion_url_expires_at:date_time ->
  business_verification_details:business_verification_details ->
  unit ->
  business_verification_response

val make_cancel_connection_response :
  catalog:catalog ->
  id:connection_id ->
  arn:connection_arn ->
  other_participant_account_id:aws_account_id ->
  updated_at:date_time ->
  connection_types:connection_type_detail_map ->
  unit ->
  cancel_connection_response

val make_cancel_connection_request :
  catalog:catalog ->
  identifier:connection_id ->
  connection_type:connection_type ->
  reason:Smaws_Lib.Smithy_api.Types.string_ ->
  client_token:client_token ->
  unit ->
  cancel_connection_request

val make_cancel_connection_invitation_response :
  ?connection_id:connection_id ->
  ?expires_at:date_time ->
  catalog:catalog ->
  id:connection_invitation_id ->
  arn:connection_invitation_arn ->
  connection_type:connection_type ->
  created_at:date_time ->
  updated_at:date_time ->
  other_participant_identifier:participant_identifier ->
  participant_type:participant_type ->
  status:invitation_status ->
  invitation_message:unicode_string_including_new_line ->
  inviter_email:email ->
  inviter_name:sensitive_unicode_string ->
  unit ->
  cancel_connection_invitation_response

val make_cancel_connection_invitation_request :
  catalog:catalog ->
  identifier:connection_invitation_id ->
  client_token:client_token ->
  unit ->
  cancel_connection_invitation_request

val make_error_detail :
  locale:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  reason:profile_validation_error_reason ->
  unit ->
  error_detail

val make_localized_content :
  display_name:unicode_string ->
  description:unicode_string ->
  website_url:url ->
  logo_url:url ->
  locale:locale ->
  unit ->
  localized_content

val make_task_details :
  ?localized_contents:localized_content_list ->
  display_name:unicode_string ->
  description:unicode_string ->
  website_url:url ->
  logo_url:url ->
  primary_solution_type:primary_solution_type ->
  industry_segments:industry_segment_list ->
  translation_source_locale:locale ->
  unit ->
  task_details

val make_cancel_profile_update_task_response :
  ?ended_at:date_time ->
  ?error_detail_list:error_detail_list ->
  catalog:catalog ->
  arn:partner_arn ->
  id:partner_id ->
  task_id:profile_task_id ->
  task_details:task_details ->
  started_at:date_time ->
  status:profile_task_status ->
  unit ->
  cancel_profile_update_task_response

val make_cancel_profile_update_task_request :
  ?client_token:client_token ->
  catalog:catalog ->
  identifier:partner_identifier ->
  task_id:profile_task_id ->
  unit ->
  cancel_profile_update_task_request

val make_connection_invitation_summary :
  ?connection_id:connection_id ->
  ?expires_at:date_time ->
  catalog:catalog ->
  id:connection_invitation_id ->
  arn:connection_invitation_arn ->
  connection_type:connection_type ->
  created_at:date_time ->
  updated_at:date_time ->
  other_participant_identifier:participant_identifier ->
  participant_type:participant_type ->
  status:invitation_status ->
  unit ->
  connection_invitation_summary

val make_connection_type_summary :
  status:connection_type_status -> other_participant:participant -> unit -> connection_type_summary

val make_connection_summary :
  catalog:catalog ->
  id:connection_id ->
  arn:connection_arn ->
  other_participant_account_id:aws_account_id ->
  updated_at:date_time ->
  connection_types:connection_type_summary_map ->
  unit ->
  connection_summary

val make_create_connection_invitation_response :
  ?connection_id:connection_id ->
  ?expires_at:date_time ->
  catalog:catalog ->
  id:connection_invitation_id ->
  arn:connection_invitation_arn ->
  connection_type:connection_type ->
  created_at:date_time ->
  updated_at:date_time ->
  other_participant_identifier:participant_identifier ->
  participant_type:participant_type ->
  status:invitation_status ->
  invitation_message:unicode_string_including_new_line ->
  inviter_email:email ->
  inviter_name:sensitive_unicode_string ->
  unit ->
  create_connection_invitation_response

val make_create_connection_invitation_request :
  catalog:catalog ->
  client_token:client_token ->
  connection_type:connection_type ->
  email:email ->
  message:unicode_string_including_new_line ->
  name:sensitive_unicode_string ->
  receiver_identifier:participant_identifier ->
  unit ->
  create_connection_invitation_request

val make_partner_domain :
  domain_name:domain_name -> registered_at:date_time -> unit -> partner_domain

val make_partner_profile :
  ?localized_contents:localized_content_list ->
  ?profile_id:partner_profile_id ->
  display_name:unicode_string ->
  description:unicode_string ->
  website_url:url ->
  logo_url:url ->
  primary_solution_type:primary_solution_type ->
  industry_segments:industry_segment_list ->
  translation_source_locale:locale ->
  unit ->
  partner_profile

val make_create_partner_response :
  ?aws_training_certification_email_domains:partner_domain_list ->
  catalog:catalog ->
  arn:partner_arn ->
  id:partner_id ->
  legal_name:sensitive_unicode_string ->
  created_at:date_time ->
  profile:partner_profile ->
  alliance_lead_contact:alliance_lead_contact ->
  unit ->
  create_partner_response

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_create_partner_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  catalog:catalog ->
  legal_name:sensitive_unicode_string ->
  primary_solution_type:primary_solution_type ->
  alliance_lead_contact:alliance_lead_contact ->
  email_verification_code:email_verification_code ->
  unit ->
  create_partner_request

val make_disassociate_aws_training_certification_email_domain_response : unit -> unit

val make_disassociate_aws_training_certification_email_domain_request :
  ?client_token:client_token ->
  catalog:catalog ->
  identifier:partner_identifier ->
  domain_name:domain_name ->
  unit ->
  disassociate_aws_training_certification_email_domain_request

val make_get_alliance_lead_contact_response :
  catalog:catalog ->
  arn:partner_arn ->
  id:partner_id ->
  alliance_lead_contact:alliance_lead_contact ->
  unit ->
  get_alliance_lead_contact_response

val make_get_alliance_lead_contact_request :
  catalog:catalog -> identifier:partner_identifier -> unit -> get_alliance_lead_contact_request

val make_get_connection_response :
  catalog:catalog ->
  id:connection_id ->
  arn:connection_arn ->
  other_participant_account_id:aws_account_id ->
  updated_at:date_time ->
  connection_types:connection_type_detail_map ->
  unit ->
  get_connection_response

val make_get_connection_request :
  catalog:catalog -> identifier:connection_id -> unit -> get_connection_request

val make_get_connection_invitation_response :
  ?connection_id:connection_id ->
  ?expires_at:date_time ->
  catalog:catalog ->
  id:connection_invitation_id ->
  arn:connection_invitation_arn ->
  connection_type:connection_type ->
  created_at:date_time ->
  updated_at:date_time ->
  other_participant_identifier:participant_identifier ->
  participant_type:participant_type ->
  status:invitation_status ->
  invitation_message:unicode_string_including_new_line ->
  inviter_email:email ->
  inviter_name:sensitive_unicode_string ->
  unit ->
  get_connection_invitation_response

val make_get_connection_invitation_request :
  catalog:catalog ->
  identifier:connection_invitation_id ->
  unit ->
  get_connection_invitation_request

val make_get_connection_preferences_response :
  ?excluded_participant_ids:participant_identifier_list ->
  catalog:catalog ->
  arn:connection_preferences_arn ->
  access_type:access_type ->
  updated_at:date_time ->
  revision:revision ->
  unit ->
  get_connection_preferences_response

val make_get_connection_preferences_request :
  catalog:catalog -> unit -> get_connection_preferences_request

val make_get_partner_response :
  ?aws_training_certification_email_domains:partner_domain_list ->
  catalog:catalog ->
  arn:partner_arn ->
  id:partner_id ->
  legal_name:sensitive_unicode_string ->
  created_at:date_time ->
  profile:partner_profile ->
  unit ->
  get_partner_response

val make_get_partner_request :
  catalog:catalog -> identifier:partner_identifier -> unit -> get_partner_request

val make_get_profile_update_task_response :
  ?ended_at:date_time ->
  ?error_detail_list:error_detail_list ->
  catalog:catalog ->
  arn:partner_arn ->
  id:partner_id ->
  task_id:profile_task_id ->
  task_details:task_details ->
  started_at:date_time ->
  status:profile_task_status ->
  unit ->
  get_profile_update_task_response

val make_get_profile_update_task_request :
  catalog:catalog -> identifier:partner_identifier -> unit -> get_profile_update_task_request

val make_get_profile_visibility_response :
  catalog:catalog ->
  arn:partner_arn ->
  id:partner_id ->
  visibility:profile_visibility ->
  profile_id:partner_profile_id ->
  unit ->
  get_profile_visibility_response

val make_get_profile_visibility_request :
  catalog:catalog -> identifier:partner_identifier -> unit -> get_profile_visibility_request

val make_registrant_verification_response :
  completion_url:completion_url ->
  completion_url_expires_at:date_time ->
  unit ->
  registrant_verification_response

val make_get_verification_response :
  ?verification_status_reason:verification_status_reason ->
  ?completed_at:date_time ->
  verification_type:verification_type ->
  verification_status:verification_status ->
  verification_response_details:verification_response_details ->
  started_at:date_time ->
  unit ->
  get_verification_response

val make_get_verification_request :
  verification_type:verification_type -> unit -> get_verification_request

val make_list_connection_invitations_response :
  ?next_token:next_token ->
  connection_invitation_summaries:connection_invitation_summary_list ->
  unit ->
  list_connection_invitations_response

val make_list_connection_invitations_request :
  ?next_token:next_token ->
  ?connection_type:connection_type ->
  ?max_results:max_results ->
  ?other_participant_identifiers:participant_identifier_list ->
  ?participant_type:participant_type ->
  ?status:invitation_status ->
  catalog:catalog ->
  unit ->
  list_connection_invitations_request

val make_list_connections_response :
  ?next_token:next_token ->
  connection_summaries:connection_summary_list ->
  unit ->
  list_connections_response

val make_list_connections_request :
  ?next_token:next_token ->
  ?connection_type:connection_type_filter ->
  ?max_results:max_results ->
  ?other_participant_identifiers:participant_identifier_list ->
  catalog:catalog ->
  unit ->
  list_connections_request

val make_partner_summary :
  catalog:catalog ->
  arn:partner_arn ->
  id:partner_id ->
  legal_name:sensitive_unicode_string ->
  created_at:date_time ->
  unit ->
  partner_summary

val make_list_partners_response :
  ?next_token:next_token ->
  partner_summary_list:partner_summary_list ->
  unit ->
  list_partners_response

val make_list_partners_request :
  ?next_token:next_token -> catalog:catalog -> unit -> list_partners_request

val make_list_tags_for_resource_response :
  ?tags:tag_list -> resource_arn:taggable_resource_arn -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:taggable_resource_arn -> unit -> list_tags_for_resource_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:taggable_resource_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:taggable_resource_arn -> tags:tag_list -> unit -> tag_resource_request

val make_start_verification_response :
  ?verification_status_reason:verification_status_reason ->
  ?completed_at:date_time ->
  verification_type:verification_type ->
  verification_status:verification_status ->
  verification_response_details:verification_response_details ->
  started_at:date_time ->
  unit ->
  start_verification_response

val make_registrant_verification_details : unit -> unit

val make_start_verification_request :
  ?client_token:client_token ->
  ?verification_details:verification_details ->
  unit ->
  start_verification_request

val make_send_email_verification_code_response : unit -> unit

val make_send_email_verification_code_request :
  catalog:catalog -> email:email -> unit -> send_email_verification_code_request

val make_put_alliance_lead_contact_response :
  catalog:catalog ->
  arn:partner_arn ->
  id:partner_id ->
  alliance_lead_contact:alliance_lead_contact ->
  unit ->
  put_alliance_lead_contact_response

val make_put_alliance_lead_contact_request :
  ?email_verification_code:email_verification_code ->
  catalog:catalog ->
  identifier:partner_identifier ->
  alliance_lead_contact:alliance_lead_contact ->
  unit ->
  put_alliance_lead_contact_request

val make_put_profile_visibility_response :
  catalog:catalog ->
  arn:partner_arn ->
  id:partner_id ->
  visibility:profile_visibility ->
  profile_id:partner_profile_id ->
  unit ->
  put_profile_visibility_response

val make_put_profile_visibility_request :
  catalog:catalog ->
  identifier:partner_identifier ->
  visibility:profile_visibility ->
  unit ->
  put_profile_visibility_request

val make_reject_connection_invitation_response :
  ?connection_id:connection_id ->
  ?expires_at:date_time ->
  catalog:catalog ->
  id:connection_invitation_id ->
  arn:connection_invitation_arn ->
  connection_type:connection_type ->
  created_at:date_time ->
  updated_at:date_time ->
  other_participant_identifier:participant_identifier ->
  participant_type:participant_type ->
  status:invitation_status ->
  invitation_message:unicode_string_including_new_line ->
  inviter_email:email ->
  inviter_name:sensitive_unicode_string ->
  unit ->
  reject_connection_invitation_response

val make_reject_connection_invitation_request :
  ?reason:Smaws_Lib.Smithy_api.Types.string_ ->
  catalog:catalog ->
  identifier:connection_invitation_id ->
  client_token:client_token ->
  unit ->
  reject_connection_invitation_request

val make_start_profile_update_task_response :
  ?ended_at:date_time ->
  ?error_detail_list:error_detail_list ->
  catalog:catalog ->
  arn:partner_arn ->
  id:partner_id ->
  task_id:profile_task_id ->
  task_details:task_details ->
  started_at:date_time ->
  status:profile_task_status ->
  unit ->
  start_profile_update_task_response

val make_start_profile_update_task_request :
  ?client_token:client_token ->
  catalog:catalog ->
  identifier:partner_identifier ->
  task_details:task_details ->
  unit ->
  start_profile_update_task_request

val make_update_connection_preferences_response :
  ?excluded_participant_ids:participant_identifier_list ->
  catalog:catalog ->
  arn:connection_preferences_arn ->
  access_type:access_type ->
  updated_at:date_time ->
  revision:revision ->
  unit ->
  update_connection_preferences_response

val make_update_connection_preferences_request :
  ?excluded_participant_identifiers:participant_identifier_list ->
  catalog:catalog ->
  revision:revision ->
  access_type:access_type ->
  unit ->
  update_connection_preferences_request
