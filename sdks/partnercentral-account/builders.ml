open Types

let make_business_verification_details
    ?jurisdiction_of_incorporation:(jurisdiction_of_incorporation_ : jurisdiction_code option)
    ~country_code:(country_code_ : country_code)
    ~registration_id:(registration_id_ : registration_id) ~legal_name:(legal_name_ : legal_name) ()
    =
  ({
     jurisdiction_of_incorporation = jurisdiction_of_incorporation_;
     country_code = country_code_;
     registration_id = registration_id_;
     legal_name = legal_name_;
   }
    : business_verification_details)

let make_business_verification_response
    ?completion_url_expires_at:(completion_url_expires_at_ : date_time option)
    ?completion_url:(completion_url_ : completion_url option)
    ~business_verification_details:(business_verification_details_ : business_verification_details)
    () =
  ({
     completion_url_expires_at = completion_url_expires_at_;
     completion_url = completion_url_;
     business_verification_details = business_verification_details_;
   }
    : business_verification_response)

let make_registrant_verification_response
    ~completion_url_expires_at:(completion_url_expires_at_ : date_time)
    ~completion_url:(completion_url_ : completion_url) () =
  ({ completion_url_expires_at = completion_url_expires_at_; completion_url = completion_url_ }
    : registrant_verification_response)

let make_registrant_verification_details () = (() : unit)

let make_field_validation_error ~code:(code_ : field_validation_code)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ code = code_; message = message_; name = name_ } : field_validation_error)

let make_business_validation_error ~code:(code_ : business_validation_code)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ code = code_; message = message_ } : business_validation_error)

let make_update_connection_preferences_response
    ?excluded_participant_ids:(excluded_participant_ids_ : participant_identifier_list option)
    ~revision:(revision_ : revision) ~updated_at:(updated_at_ : date_time)
    ~access_type:(access_type_ : access_type) ~arn:(arn_ : connection_preferences_arn)
    ~catalog:(catalog_ : catalog) () =
  ({
     revision = revision_;
     updated_at = updated_at_;
     excluded_participant_ids = excluded_participant_ids_;
     access_type = access_type_;
     arn = arn_;
     catalog = catalog_;
   }
    : update_connection_preferences_response)

let make_update_connection_preferences_request
    ?excluded_participant_identifiers:
      (excluded_participant_identifiers_ : participant_identifier_list option)
    ~access_type:(access_type_ : access_type) ~revision:(revision_ : revision)
    ~catalog:(catalog_ : catalog) () =
  ({
     excluded_participant_identifiers = excluded_participant_identifiers_;
     access_type = access_type_;
     revision = revision_;
     catalog = catalog_;
   }
    : update_connection_preferences_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_localized_content ~locale:(locale_ : locale) ~logo_url:(logo_url_ : url)
    ~website_url:(website_url_ : url) ~description:(description_ : unicode_string)
    ~display_name:(display_name_ : unicode_string) () =
  ({
     locale = locale_;
     logo_url = logo_url_;
     website_url = website_url_;
     description = description_;
     display_name = display_name_;
   }
    : localized_content)

let make_task_details ?localized_contents:(localized_contents_ : localized_content_list option)
    ~translation_source_locale:(translation_source_locale_ : locale)
    ~industry_segments:(industry_segments_ : industry_segment_list)
    ~primary_solution_type:(primary_solution_type_ : primary_solution_type)
    ~logo_url:(logo_url_ : url) ~website_url:(website_url_ : url)
    ~description:(description_ : unicode_string) ~display_name:(display_name_ : unicode_string) () =
  ({
     localized_contents = localized_contents_;
     translation_source_locale = translation_source_locale_;
     industry_segments = industry_segments_;
     primary_solution_type = primary_solution_type_;
     logo_url = logo_url_;
     website_url = website_url_;
     description = description_;
     display_name = display_name_;
   }
    : task_details)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_start_verification_response ?completed_at:(completed_at_ : date_time option)
    ?verification_status_reason:(verification_status_reason_ : verification_status_reason option)
    ~started_at:(started_at_ : date_time)
    ~verification_response_details:(verification_response_details_ : verification_response_details)
    ~verification_status:(verification_status_ : verification_status)
    ~verification_type:(verification_type_ : verification_type) () =
  ({
     completed_at = completed_at_;
     started_at = started_at_;
     verification_response_details = verification_response_details_;
     verification_status_reason = verification_status_reason_;
     verification_status = verification_status_;
     verification_type = verification_type_;
   }
    : start_verification_response)

let make_start_verification_request
    ?verification_details:(verification_details_ : verification_details option)
    ?client_token:(client_token_ : client_token option) () =
  ({ verification_details = verification_details_; client_token = client_token_ }
    : start_verification_request)

let make_error_detail ~reason:(reason_ : profile_validation_error_reason)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~locale:(locale_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ reason = reason_; message = message_; locale = locale_ } : error_detail)

let make_start_profile_update_task_response
    ?error_detail_list:(error_detail_list_ : error_detail_list option)
    ?ended_at:(ended_at_ : date_time option) ~status:(status_ : profile_task_status)
    ~started_at:(started_at_ : date_time) ~task_details:(task_details_ : task_details)
    ~task_id:(task_id_ : profile_task_id) ~id:(id_ : partner_id) ~arn:(arn_ : partner_arn)
    ~catalog:(catalog_ : catalog) () =
  ({
     error_detail_list = error_detail_list_;
     ended_at = ended_at_;
     status = status_;
     started_at = started_at_;
     task_details = task_details_;
     task_id = task_id_;
     id = id_;
     arn = arn_;
     catalog = catalog_;
   }
    : start_profile_update_task_response)

let make_start_profile_update_task_request ?client_token:(client_token_ : client_token option)
    ~task_details:(task_details_ : task_details) ~identifier:(identifier_ : partner_identifier)
    ~catalog:(catalog_ : catalog) () =
  ({
     task_details = task_details_;
     client_token = client_token_;
     identifier = identifier_;
     catalog = catalog_;
   }
    : start_profile_update_task_request)

let make_send_email_verification_code_response () = (() : unit)

let make_send_email_verification_code_request ~email:(email_ : email) ~catalog:(catalog_ : catalog)
    () =
  ({ email = email_; catalog = catalog_ } : send_email_verification_code_request)

let make_seller_profile_summary ~name:(name_ : unicode_string) ~id:(id_ : seller_profile_id) () =
  ({ name = name_; id = id_ } : seller_profile_summary)

let make_reject_connection_invitation_response ?expires_at:(expires_at_ : date_time option)
    ?connection_id:(connection_id_ : connection_id option)
    ~inviter_name:(inviter_name_ : sensitive_unicode_string) ~inviter_email:(inviter_email_ : email)
    ~invitation_message:(invitation_message_ : unicode_string_including_new_line)
    ~status:(status_ : invitation_status) ~participant_type:(participant_type_ : participant_type)
    ~other_participant_identifier:(other_participant_identifier_ : participant_identifier)
    ~updated_at:(updated_at_ : date_time) ~created_at:(created_at_ : date_time)
    ~connection_type:(connection_type_ : connection_type) ~arn:(arn_ : connection_invitation_arn)
    ~id:(id_ : connection_invitation_id) ~catalog:(catalog_ : catalog) () =
  ({
     inviter_name = inviter_name_;
     inviter_email = inviter_email_;
     invitation_message = invitation_message_;
     status = status_;
     participant_type = participant_type_;
     other_participant_identifier = other_participant_identifier_;
     expires_at = expires_at_;
     updated_at = updated_at_;
     created_at = created_at_;
     connection_type = connection_type_;
     connection_id = connection_id_;
     arn = arn_;
     id = id_;
     catalog = catalog_;
   }
    : reject_connection_invitation_response)

let make_reject_connection_invitation_request
    ?reason:(reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~client_token:(client_token_ : client_token)
    ~identifier:(identifier_ : connection_invitation_id) ~catalog:(catalog_ : catalog) () =
  ({ reason = reason_; client_token = client_token_; identifier = identifier_; catalog = catalog_ }
    : reject_connection_invitation_request)

let make_put_profile_visibility_response ~profile_id:(profile_id_ : partner_profile_id)
    ~visibility:(visibility_ : profile_visibility) ~id:(id_ : partner_id) ~arn:(arn_ : partner_arn)
    ~catalog:(catalog_ : catalog) () =
  ({ profile_id = profile_id_; visibility = visibility_; id = id_; arn = arn_; catalog = catalog_ }
    : put_profile_visibility_response)

let make_put_profile_visibility_request ~visibility:(visibility_ : profile_visibility)
    ~identifier:(identifier_ : partner_identifier) ~catalog:(catalog_ : catalog) () =
  ({ visibility = visibility_; identifier = identifier_; catalog = catalog_ }
    : put_profile_visibility_request)

let make_alliance_lead_contact ~business_title:(business_title_ : sensitive_unicode_string)
    ~email:(email_ : email) ~last_name:(last_name_ : sensitive_unicode_string)
    ~first_name:(first_name_ : sensitive_unicode_string) () =
  ({
     business_title = business_title_;
     email = email_;
     last_name = last_name_;
     first_name = first_name_;
   }
    : alliance_lead_contact)

let make_put_alliance_lead_contact_response
    ~alliance_lead_contact:(alliance_lead_contact_ : alliance_lead_contact) ~id:(id_ : partner_id)
    ~arn:(arn_ : partner_arn) ~catalog:(catalog_ : catalog) () =
  ({ alliance_lead_contact = alliance_lead_contact_; id = id_; arn = arn_; catalog = catalog_ }
    : put_alliance_lead_contact_response)

let make_put_alliance_lead_contact_request
    ?email_verification_code:(email_verification_code_ : email_verification_code option)
    ~alliance_lead_contact:(alliance_lead_contact_ : alliance_lead_contact)
    ~identifier:(identifier_ : partner_identifier) ~catalog:(catalog_ : catalog) () =
  ({
     email_verification_code = email_verification_code_;
     alliance_lead_contact = alliance_lead_contact_;
     identifier = identifier_;
     catalog = catalog_;
   }
    : put_alliance_lead_contact_request)

let make_partner_summary ~created_at:(created_at_ : date_time)
    ~legal_name:(legal_name_ : sensitive_unicode_string) ~id:(id_ : partner_id)
    ~arn:(arn_ : partner_arn) ~catalog:(catalog_ : catalog) () =
  ({ created_at = created_at_; legal_name = legal_name_; id = id_; arn = arn_; catalog = catalog_ }
    : partner_summary)

let make_partner_profile_summary ~name:(name_ : unicode_string) ~id:(id_ : partner_profile_id) () =
  ({ name = name_; id = id_ } : partner_profile_summary)

let make_partner_profile ?profile_id:(profile_id_ : partner_profile_id option)
    ?localized_contents:(localized_contents_ : localized_content_list option)
    ~translation_source_locale:(translation_source_locale_ : locale)
    ~industry_segments:(industry_segments_ : industry_segment_list)
    ~primary_solution_type:(primary_solution_type_ : primary_solution_type)
    ~logo_url:(logo_url_ : url) ~website_url:(website_url_ : url)
    ~description:(description_ : unicode_string) ~display_name:(display_name_ : unicode_string) () =
  ({
     profile_id = profile_id_;
     localized_contents = localized_contents_;
     translation_source_locale = translation_source_locale_;
     industry_segments = industry_segments_;
     primary_solution_type = primary_solution_type_;
     logo_url = logo_url_;
     website_url = website_url_;
     description = description_;
     display_name = display_name_;
   }
    : partner_profile)

let make_partner_domain ~registered_at:(registered_at_ : date_time)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ registered_at = registered_at_; domain_name = domain_name_ } : partner_domain)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_get_verification_response ?completed_at:(completed_at_ : date_time option)
    ?verification_status_reason:(verification_status_reason_ : verification_status_reason option)
    ~started_at:(started_at_ : date_time)
    ~verification_response_details:(verification_response_details_ : verification_response_details)
    ~verification_status:(verification_status_ : verification_status)
    ~verification_type:(verification_type_ : verification_type) () =
  ({
     completed_at = completed_at_;
     started_at = started_at_;
     verification_response_details = verification_response_details_;
     verification_status_reason = verification_status_reason_;
     verification_status = verification_status_;
     verification_type = verification_type_;
   }
    : get_verification_response)

let make_get_verification_request ~verification_type:(verification_type_ : verification_type) () =
  ({ verification_type = verification_type_ } : get_verification_request)

let make_account_summary ~name:(name_ : unicode_string) () = ({ name = name_ } : account_summary)

let make_list_partners_response ?next_token:(next_token_ : next_token option)
    ~partner_summary_list:(partner_summary_list_ : partner_summary_list) () =
  ({ next_token = next_token_; partner_summary_list = partner_summary_list_ }
    : list_partners_response)

let make_list_partners_request ?next_token:(next_token_ : next_token option)
    ~catalog:(catalog_ : catalog) () =
  ({ next_token = next_token_; catalog = catalog_ } : list_partners_request)

let make_connection_type_summary ~other_participant:(other_participant_ : participant)
    ~status:(status_ : connection_type_status) () =
  ({ other_participant = other_participant_; status = status_ } : connection_type_summary)

let make_connection_summary ~connection_types:(connection_types_ : connection_type_summary_map)
    ~updated_at:(updated_at_ : date_time)
    ~other_participant_account_id:(other_participant_account_id_ : aws_account_id)
    ~arn:(arn_ : connection_arn) ~id:(id_ : connection_id) ~catalog:(catalog_ : catalog) () =
  ({
     connection_types = connection_types_;
     updated_at = updated_at_;
     other_participant_account_id = other_participant_account_id_;
     arn = arn_;
     id = id_;
     catalog = catalog_;
   }
    : connection_summary)

let make_list_connections_response ?next_token:(next_token_ : next_token option)
    ~connection_summaries:(connection_summaries_ : connection_summary_list) () =
  ({ next_token = next_token_; connection_summaries = connection_summaries_ }
    : list_connections_response)

let make_list_connections_request
    ?other_participant_identifiers:
      (other_participant_identifiers_ : participant_identifier_list option)
    ?max_results:(max_results_ : max_results option)
    ?connection_type:(connection_type_ : connection_type_filter option)
    ?next_token:(next_token_ : next_token option) ~catalog:(catalog_ : catalog) () =
  ({
     other_participant_identifiers = other_participant_identifiers_;
     max_results = max_results_;
     connection_type = connection_type_;
     next_token = next_token_;
     catalog = catalog_;
   }
    : list_connections_request)

let make_connection_invitation_summary ?expires_at:(expires_at_ : date_time option)
    ?connection_id:(connection_id_ : connection_id option) ~status:(status_ : invitation_status)
    ~participant_type:(participant_type_ : participant_type)
    ~other_participant_identifier:(other_participant_identifier_ : participant_identifier)
    ~updated_at:(updated_at_ : date_time) ~created_at:(created_at_ : date_time)
    ~connection_type:(connection_type_ : connection_type) ~arn:(arn_ : connection_invitation_arn)
    ~id:(id_ : connection_invitation_id) ~catalog:(catalog_ : catalog) () =
  ({
     status = status_;
     participant_type = participant_type_;
     other_participant_identifier = other_participant_identifier_;
     expires_at = expires_at_;
     updated_at = updated_at_;
     created_at = created_at_;
     connection_type = connection_type_;
     connection_id = connection_id_;
     arn = arn_;
     id = id_;
     catalog = catalog_;
   }
    : connection_invitation_summary)

let make_list_connection_invitations_response ?next_token:(next_token_ : next_token option)
    ~connection_invitation_summaries:
      (connection_invitation_summaries_ : connection_invitation_summary_list) () =
  ({ next_token = next_token_; connection_invitation_summaries = connection_invitation_summaries_ }
    : list_connection_invitations_response)

let make_list_connection_invitations_request ?status:(status_ : invitation_status option)
    ?participant_type:(participant_type_ : participant_type option)
    ?other_participant_identifiers:
      (other_participant_identifiers_ : participant_identifier_list option)
    ?max_results:(max_results_ : max_results option)
    ?connection_type:(connection_type_ : connection_type option)
    ?next_token:(next_token_ : next_token option) ~catalog:(catalog_ : catalog) () =
  ({
     status = status_;
     participant_type = participant_type_;
     other_participant_identifiers = other_participant_identifiers_;
     max_results = max_results_;
     connection_type = connection_type_;
     next_token = next_token_;
     catalog = catalog_;
   }
    : list_connection_invitations_request)

let make_get_profile_visibility_response ~profile_id:(profile_id_ : partner_profile_id)
    ~visibility:(visibility_ : profile_visibility) ~id:(id_ : partner_id) ~arn:(arn_ : partner_arn)
    ~catalog:(catalog_ : catalog) () =
  ({ profile_id = profile_id_; visibility = visibility_; id = id_; arn = arn_; catalog = catalog_ }
    : get_profile_visibility_response)

let make_get_profile_visibility_request ~identifier:(identifier_ : partner_identifier)
    ~catalog:(catalog_ : catalog) () =
  ({ identifier = identifier_; catalog = catalog_ } : get_profile_visibility_request)

let make_get_profile_update_task_response
    ?error_detail_list:(error_detail_list_ : error_detail_list option)
    ?ended_at:(ended_at_ : date_time option) ~status:(status_ : profile_task_status)
    ~started_at:(started_at_ : date_time) ~task_details:(task_details_ : task_details)
    ~task_id:(task_id_ : profile_task_id) ~id:(id_ : partner_id) ~arn:(arn_ : partner_arn)
    ~catalog:(catalog_ : catalog) () =
  ({
     error_detail_list = error_detail_list_;
     ended_at = ended_at_;
     status = status_;
     started_at = started_at_;
     task_details = task_details_;
     task_id = task_id_;
     id = id_;
     arn = arn_;
     catalog = catalog_;
   }
    : get_profile_update_task_response)

let make_get_profile_update_task_request ~identifier:(identifier_ : partner_identifier)
    ~catalog:(catalog_ : catalog) () =
  ({ identifier = identifier_; catalog = catalog_ } : get_profile_update_task_request)

let make_get_partner_response
    ?aws_training_certification_email_domains:
      (aws_training_certification_email_domains_ : partner_domain_list option)
    ~profile:(profile_ : partner_profile) ~created_at:(created_at_ : date_time)
    ~legal_name:(legal_name_ : sensitive_unicode_string) ~id:(id_ : partner_id)
    ~arn:(arn_ : partner_arn) ~catalog:(catalog_ : catalog) () =
  ({
     aws_training_certification_email_domains = aws_training_certification_email_domains_;
     profile = profile_;
     created_at = created_at_;
     legal_name = legal_name_;
     id = id_;
     arn = arn_;
     catalog = catalog_;
   }
    : get_partner_response)

let make_get_partner_request ~identifier:(identifier_ : partner_identifier)
    ~catalog:(catalog_ : catalog) () =
  ({ identifier = identifier_; catalog = catalog_ } : get_partner_request)

let make_connection_type_detail ?canceled_by:(canceled_by_ : aws_account_id option)
    ?canceled_at:(canceled_at_ : date_time option)
    ~other_participant:(other_participant_ : participant) ~status:(status_ : connection_type_status)
    ~inviter_name:(inviter_name_ : sensitive_unicode_string) ~inviter_email:(inviter_email_ : email)
    ~created_at:(created_at_ : date_time) () =
  ({
     other_participant = other_participant_;
     canceled_by = canceled_by_;
     canceled_at = canceled_at_;
     status = status_;
     inviter_name = inviter_name_;
     inviter_email = inviter_email_;
     created_at = created_at_;
   }
    : connection_type_detail)

let make_get_connection_response ~connection_types:(connection_types_ : connection_type_detail_map)
    ~updated_at:(updated_at_ : date_time)
    ~other_participant_account_id:(other_participant_account_id_ : aws_account_id)
    ~arn:(arn_ : connection_arn) ~id:(id_ : connection_id) ~catalog:(catalog_ : catalog) () =
  ({
     connection_types = connection_types_;
     updated_at = updated_at_;
     other_participant_account_id = other_participant_account_id_;
     arn = arn_;
     id = id_;
     catalog = catalog_;
   }
    : get_connection_response)

let make_get_connection_request ~identifier:(identifier_ : connection_id)
    ~catalog:(catalog_ : catalog) () =
  ({ identifier = identifier_; catalog = catalog_ } : get_connection_request)

let make_get_connection_preferences_response
    ?excluded_participant_ids:(excluded_participant_ids_ : participant_identifier_list option)
    ~revision:(revision_ : revision) ~updated_at:(updated_at_ : date_time)
    ~access_type:(access_type_ : access_type) ~arn:(arn_ : connection_preferences_arn)
    ~catalog:(catalog_ : catalog) () =
  ({
     revision = revision_;
     updated_at = updated_at_;
     excluded_participant_ids = excluded_participant_ids_;
     access_type = access_type_;
     arn = arn_;
     catalog = catalog_;
   }
    : get_connection_preferences_response)

let make_get_connection_preferences_request ~catalog:(catalog_ : catalog) () =
  ({ catalog = catalog_ } : get_connection_preferences_request)

let make_get_connection_invitation_response ?expires_at:(expires_at_ : date_time option)
    ?connection_id:(connection_id_ : connection_id option)
    ~inviter_name:(inviter_name_ : sensitive_unicode_string) ~inviter_email:(inviter_email_ : email)
    ~invitation_message:(invitation_message_ : unicode_string_including_new_line)
    ~status:(status_ : invitation_status) ~participant_type:(participant_type_ : participant_type)
    ~other_participant_identifier:(other_participant_identifier_ : participant_identifier)
    ~updated_at:(updated_at_ : date_time) ~created_at:(created_at_ : date_time)
    ~connection_type:(connection_type_ : connection_type) ~arn:(arn_ : connection_invitation_arn)
    ~id:(id_ : connection_invitation_id) ~catalog:(catalog_ : catalog) () =
  ({
     inviter_name = inviter_name_;
     inviter_email = inviter_email_;
     invitation_message = invitation_message_;
     status = status_;
     participant_type = participant_type_;
     other_participant_identifier = other_participant_identifier_;
     expires_at = expires_at_;
     updated_at = updated_at_;
     created_at = created_at_;
     connection_type = connection_type_;
     connection_id = connection_id_;
     arn = arn_;
     id = id_;
     catalog = catalog_;
   }
    : get_connection_invitation_response)

let make_get_connection_invitation_request ~identifier:(identifier_ : connection_invitation_id)
    ~catalog:(catalog_ : catalog) () =
  ({ identifier = identifier_; catalog = catalog_ } : get_connection_invitation_request)

let make_get_alliance_lead_contact_response
    ~alliance_lead_contact:(alliance_lead_contact_ : alliance_lead_contact) ~id:(id_ : partner_id)
    ~arn:(arn_ : partner_arn) ~catalog:(catalog_ : catalog) () =
  ({ alliance_lead_contact = alliance_lead_contact_; id = id_; arn = arn_; catalog = catalog_ }
    : get_alliance_lead_contact_response)

let make_get_alliance_lead_contact_request ~identifier:(identifier_ : partner_identifier)
    ~catalog:(catalog_ : catalog) () =
  ({ identifier = identifier_; catalog = catalog_ } : get_alliance_lead_contact_request)

let make_disassociate_aws_training_certification_email_domain_response () = (() : unit)

let make_disassociate_aws_training_certification_email_domain_request
    ?client_token:(client_token_ : client_token option) ~domain_name:(domain_name_ : domain_name)
    ~identifier:(identifier_ : partner_identifier) ~catalog:(catalog_ : catalog) () =
  ({
     domain_name = domain_name_;
     client_token = client_token_;
     identifier = identifier_;
     catalog = catalog_;
   }
    : disassociate_aws_training_certification_email_domain_request)

let make_create_partner_response
    ?aws_training_certification_email_domains:
      (aws_training_certification_email_domains_ : partner_domain_list option)
    ~alliance_lead_contact:(alliance_lead_contact_ : alliance_lead_contact)
    ~profile:(profile_ : partner_profile) ~created_at:(created_at_ : date_time)
    ~legal_name:(legal_name_ : sensitive_unicode_string) ~id:(id_ : partner_id)
    ~arn:(arn_ : partner_arn) ~catalog:(catalog_ : catalog) () =
  ({
     alliance_lead_contact = alliance_lead_contact_;
     aws_training_certification_email_domains = aws_training_certification_email_domains_;
     profile = profile_;
     created_at = created_at_;
     legal_name = legal_name_;
     id = id_;
     arn = arn_;
     catalog = catalog_;
   }
    : create_partner_response)

let make_create_partner_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : client_token option)
    ~email_verification_code:(email_verification_code_ : email_verification_code)
    ~alliance_lead_contact:(alliance_lead_contact_ : alliance_lead_contact)
    ~primary_solution_type:(primary_solution_type_ : primary_solution_type)
    ~legal_name:(legal_name_ : sensitive_unicode_string) ~catalog:(catalog_ : catalog) () =
  ({
     tags = tags_;
     email_verification_code = email_verification_code_;
     alliance_lead_contact = alliance_lead_contact_;
     primary_solution_type = primary_solution_type_;
     legal_name = legal_name_;
     client_token = client_token_;
     catalog = catalog_;
   }
    : create_partner_request)

let make_create_connection_invitation_response ?expires_at:(expires_at_ : date_time option)
    ?connection_id:(connection_id_ : connection_id option)
    ~inviter_name:(inviter_name_ : sensitive_unicode_string) ~inviter_email:(inviter_email_ : email)
    ~invitation_message:(invitation_message_ : unicode_string_including_new_line)
    ~status:(status_ : invitation_status) ~participant_type:(participant_type_ : participant_type)
    ~other_participant_identifier:(other_participant_identifier_ : participant_identifier)
    ~updated_at:(updated_at_ : date_time) ~created_at:(created_at_ : date_time)
    ~connection_type:(connection_type_ : connection_type) ~arn:(arn_ : connection_invitation_arn)
    ~id:(id_ : connection_invitation_id) ~catalog:(catalog_ : catalog) () =
  ({
     inviter_name = inviter_name_;
     inviter_email = inviter_email_;
     invitation_message = invitation_message_;
     status = status_;
     participant_type = participant_type_;
     other_participant_identifier = other_participant_identifier_;
     expires_at = expires_at_;
     updated_at = updated_at_;
     created_at = created_at_;
     connection_type = connection_type_;
     connection_id = connection_id_;
     arn = arn_;
     id = id_;
     catalog = catalog_;
   }
    : create_connection_invitation_response)

let make_create_connection_invitation_request
    ~receiver_identifier:(receiver_identifier_ : participant_identifier)
    ~name:(name_ : sensitive_unicode_string) ~message:(message_ : unicode_string_including_new_line)
    ~email:(email_ : email) ~connection_type:(connection_type_ : connection_type)
    ~client_token:(client_token_ : client_token) ~catalog:(catalog_ : catalog) () =
  ({
     receiver_identifier = receiver_identifier_;
     name = name_;
     message = message_;
     email = email_;
     connection_type = connection_type_;
     client_token = client_token_;
     catalog = catalog_;
   }
    : create_connection_invitation_request)

let make_connection ~connection_types:(connection_types_ : connection_type_detail_map)
    ~updated_at:(updated_at_ : date_time)
    ~other_participant_account_id:(other_participant_account_id_ : aws_account_id)
    ~arn:(arn_ : connection_arn) ~id:(id_ : connection_id) ~catalog:(catalog_ : catalog) () =
  ({
     connection_types = connection_types_;
     updated_at = updated_at_;
     other_participant_account_id = other_participant_account_id_;
     arn = arn_;
     id = id_;
     catalog = catalog_;
   }
    : connection)

let make_cancel_profile_update_task_response
    ?error_detail_list:(error_detail_list_ : error_detail_list option)
    ?ended_at:(ended_at_ : date_time option) ~status:(status_ : profile_task_status)
    ~started_at:(started_at_ : date_time) ~task_details:(task_details_ : task_details)
    ~task_id:(task_id_ : profile_task_id) ~id:(id_ : partner_id) ~arn:(arn_ : partner_arn)
    ~catalog:(catalog_ : catalog) () =
  ({
     error_detail_list = error_detail_list_;
     ended_at = ended_at_;
     status = status_;
     started_at = started_at_;
     task_details = task_details_;
     task_id = task_id_;
     id = id_;
     arn = arn_;
     catalog = catalog_;
   }
    : cancel_profile_update_task_response)

let make_cancel_profile_update_task_request ?client_token:(client_token_ : client_token option)
    ~task_id:(task_id_ : profile_task_id) ~identifier:(identifier_ : partner_identifier)
    ~catalog:(catalog_ : catalog) () =
  ({
     task_id = task_id_;
     client_token = client_token_;
     identifier = identifier_;
     catalog = catalog_;
   }
    : cancel_profile_update_task_request)

let make_cancel_connection_response
    ~connection_types:(connection_types_ : connection_type_detail_map)
    ~updated_at:(updated_at_ : date_time)
    ~other_participant_account_id:(other_participant_account_id_ : aws_account_id)
    ~arn:(arn_ : connection_arn) ~id:(id_ : connection_id) ~catalog:(catalog_ : catalog) () =
  ({
     connection_types = connection_types_;
     updated_at = updated_at_;
     other_participant_account_id = other_participant_account_id_;
     arn = arn_;
     id = id_;
     catalog = catalog_;
   }
    : cancel_connection_response)

let make_cancel_connection_request ~client_token:(client_token_ : client_token)
    ~reason:(reason_ : Smaws_Lib.Smithy_api.Types.string_)
    ~connection_type:(connection_type_ : connection_type) ~identifier:(identifier_ : connection_id)
    ~catalog:(catalog_ : catalog) () =
  ({
     client_token = client_token_;
     reason = reason_;
     connection_type = connection_type_;
     identifier = identifier_;
     catalog = catalog_;
   }
    : cancel_connection_request)

let make_cancel_connection_invitation_response ?expires_at:(expires_at_ : date_time option)
    ?connection_id:(connection_id_ : connection_id option)
    ~inviter_name:(inviter_name_ : sensitive_unicode_string) ~inviter_email:(inviter_email_ : email)
    ~invitation_message:(invitation_message_ : unicode_string_including_new_line)
    ~status:(status_ : invitation_status) ~participant_type:(participant_type_ : participant_type)
    ~other_participant_identifier:(other_participant_identifier_ : participant_identifier)
    ~updated_at:(updated_at_ : date_time) ~created_at:(created_at_ : date_time)
    ~connection_type:(connection_type_ : connection_type) ~arn:(arn_ : connection_invitation_arn)
    ~id:(id_ : connection_invitation_id) ~catalog:(catalog_ : catalog) () =
  ({
     inviter_name = inviter_name_;
     inviter_email = inviter_email_;
     invitation_message = invitation_message_;
     status = status_;
     participant_type = participant_type_;
     other_participant_identifier = other_participant_identifier_;
     expires_at = expires_at_;
     updated_at = updated_at_;
     created_at = created_at_;
     connection_type = connection_type_;
     connection_id = connection_id_;
     arn = arn_;
     id = id_;
     catalog = catalog_;
   }
    : cancel_connection_invitation_response)

let make_cancel_connection_invitation_request ~client_token:(client_token_ : client_token)
    ~identifier:(identifier_ : connection_invitation_id) ~catalog:(catalog_ : catalog) () =
  ({ client_token = client_token_; identifier = identifier_; catalog = catalog_ }
    : cancel_connection_invitation_request)

let make_associate_aws_training_certification_email_domain_response () = (() : unit)

let make_associate_aws_training_certification_email_domain_request
    ?client_token:(client_token_ : client_token option)
    ~email_verification_code:(email_verification_code_ : email_verification_code)
    ~email:(email_ : email) ~identifier:(identifier_ : partner_identifier)
    ~catalog:(catalog_ : catalog) () =
  ({
     email_verification_code = email_verification_code_;
     email = email_;
     client_token = client_token_;
     identifier = identifier_;
     catalog = catalog_;
   }
    : associate_aws_training_certification_email_domain_request)

let make_accept_connection_invitation_response ~connection:(connection_ : connection) () =
  ({ connection = connection_ } : accept_connection_invitation_response)

let make_accept_connection_invitation_request ~client_token:(client_token_ : client_token)
    ~identifier:(identifier_ : connection_invitation_id) ~catalog:(catalog_ : catalog) () =
  ({ client_token = client_token_; identifier = identifier_; catalog = catalog_ }
    : accept_connection_invitation_request)
