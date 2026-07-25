open Types

let make_business_validation_error ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~code:(code_ : business_validation_code) () =
  ({ message = message_; code = code_ } : business_validation_error)

let make_field_validation_error ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) ~code:(code_ : field_validation_code)
    () =
  ({ name = name_; message = message_; code = code_ } : field_validation_error)

let make_account_summary ~name:(name_ : unicode_string) () = ({ name = name_ } : account_summary)

let make_seller_profile_summary ~id:(id_ : seller_profile_id) ~name:(name_ : unicode_string) () =
  ({ id = id_; name = name_ } : seller_profile_summary)

let make_partner_profile_summary ~id:(id_ : partner_profile_id) ~name:(name_ : unicode_string) () =
  ({ id = id_; name = name_ } : partner_profile_summary)

let make_connection_type_detail ?canceled_at:(canceled_at_ : date_time option)
    ?canceled_by:(canceled_by_ : aws_account_id option) ~created_at:(created_at_ : date_time)
    ~inviter_email:(inviter_email_ : email) ~inviter_name:(inviter_name_ : sensitive_unicode_string)
    ~status:(status_ : connection_type_status) ~other_participant:(other_participant_ : participant)
    () =
  ({
     created_at = created_at_;
     inviter_email = inviter_email_;
     inviter_name = inviter_name_;
     status = status_;
     canceled_at = canceled_at_;
     canceled_by = canceled_by_;
     other_participant = other_participant_;
   }
    : connection_type_detail)

let make_connection ~catalog:(catalog_ : catalog) ~id:(id_ : connection_id)
    ~arn:(arn_ : connection_arn)
    ~other_participant_account_id:(other_participant_account_id_ : aws_account_id)
    ~updated_at:(updated_at_ : date_time)
    ~connection_types:(connection_types_ : connection_type_detail_map) () =
  ({
     catalog = catalog_;
     id = id_;
     arn = arn_;
     other_participant_account_id = other_participant_account_id_;
     updated_at = updated_at_;
     connection_types = connection_types_;
   }
    : connection)

let make_accept_connection_invitation_response ~connection:(connection_ : connection) () =
  ({ connection = connection_ } : accept_connection_invitation_response)

let make_accept_connection_invitation_request ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : connection_invitation_id)
    ~client_token:(client_token_ : client_token) () =
  ({ catalog = catalog_; identifier = identifier_; client_token = client_token_ }
    : accept_connection_invitation_request)

let make_alliance_lead_contact ~first_name:(first_name_ : sensitive_unicode_string)
    ~last_name:(last_name_ : sensitive_unicode_string) ~email:(email_ : email)
    ~business_title:(business_title_ : sensitive_unicode_string) () =
  ({
     first_name = first_name_;
     last_name = last_name_;
     email = email_;
     business_title = business_title_;
   }
    : alliance_lead_contact)

let make_associate_aws_training_certification_email_domain_response () = (() : unit)

let make_associate_aws_training_certification_email_domain_request
    ?client_token:(client_token_ : client_token option) ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : partner_identifier) ~email:(email_ : email)
    ~email_verification_code:(email_verification_code_ : email_verification_code) () =
  ({
     catalog = catalog_;
     identifier = identifier_;
     client_token = client_token_;
     email = email_;
     email_verification_code = email_verification_code_;
   }
    : associate_aws_training_certification_email_domain_request)

let make_business_verification_details
    ?jurisdiction_of_incorporation:(jurisdiction_of_incorporation_ : jurisdiction_code option)
    ~legal_name:(legal_name_ : legal_name) ~registration_id:(registration_id_ : registration_id)
    ~country_code:(country_code_ : country_code) () =
  ({
     legal_name = legal_name_;
     registration_id = registration_id_;
     country_code = country_code_;
     jurisdiction_of_incorporation = jurisdiction_of_incorporation_;
   }
    : business_verification_details)

let make_business_verification_response ?completion_url:(completion_url_ : completion_url option)
    ?completion_url_expires_at:(completion_url_expires_at_ : date_time option)
    ~business_verification_details:(business_verification_details_ : business_verification_details)
    () =
  ({
     business_verification_details = business_verification_details_;
     completion_url = completion_url_;
     completion_url_expires_at = completion_url_expires_at_;
   }
    : business_verification_response)

let make_cancel_connection_response ~catalog:(catalog_ : catalog) ~id:(id_ : connection_id)
    ~arn:(arn_ : connection_arn)
    ~other_participant_account_id:(other_participant_account_id_ : aws_account_id)
    ~updated_at:(updated_at_ : date_time)
    ~connection_types:(connection_types_ : connection_type_detail_map) () =
  ({
     catalog = catalog_;
     id = id_;
     arn = arn_;
     other_participant_account_id = other_participant_account_id_;
     updated_at = updated_at_;
     connection_types = connection_types_;
   }
    : cancel_connection_response)

let make_cancel_connection_request ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : connection_id) ~connection_type:(connection_type_ : connection_type)
    ~reason:(reason_ : Smaws_Lib.Smithy_api.Types.string_)
    ~client_token:(client_token_ : client_token) () =
  ({
     catalog = catalog_;
     identifier = identifier_;
     connection_type = connection_type_;
     reason = reason_;
     client_token = client_token_;
   }
    : cancel_connection_request)

let make_cancel_connection_invitation_response
    ?connection_id:(connection_id_ : connection_id option)
    ?expires_at:(expires_at_ : date_time option) ~catalog:(catalog_ : catalog)
    ~id:(id_ : connection_invitation_id) ~arn:(arn_ : connection_invitation_arn)
    ~connection_type:(connection_type_ : connection_type) ~created_at:(created_at_ : date_time)
    ~updated_at:(updated_at_ : date_time)
    ~other_participant_identifier:(other_participant_identifier_ : participant_identifier)
    ~participant_type:(participant_type_ : participant_type) ~status:(status_ : invitation_status)
    ~invitation_message:(invitation_message_ : unicode_string_including_new_line)
    ~inviter_email:(inviter_email_ : email) ~inviter_name:(inviter_name_ : sensitive_unicode_string)
    () =
  ({
     catalog = catalog_;
     id = id_;
     arn = arn_;
     connection_id = connection_id_;
     connection_type = connection_type_;
     created_at = created_at_;
     updated_at = updated_at_;
     expires_at = expires_at_;
     other_participant_identifier = other_participant_identifier_;
     participant_type = participant_type_;
     status = status_;
     invitation_message = invitation_message_;
     inviter_email = inviter_email_;
     inviter_name = inviter_name_;
   }
    : cancel_connection_invitation_response)

let make_cancel_connection_invitation_request ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : connection_invitation_id)
    ~client_token:(client_token_ : client_token) () =
  ({ catalog = catalog_; identifier = identifier_; client_token = client_token_ }
    : cancel_connection_invitation_request)

let make_error_detail ~locale:(locale_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~reason:(reason_ : profile_validation_error_reason) () =
  ({ locale = locale_; message = message_; reason = reason_ } : error_detail)

let make_localized_content ~display_name:(display_name_ : unicode_string)
    ~description:(description_ : unicode_string) ~website_url:(website_url_ : url)
    ~logo_url:(logo_url_ : url) ~locale:(locale_ : locale) () =
  ({
     display_name = display_name_;
     description = description_;
     website_url = website_url_;
     logo_url = logo_url_;
     locale = locale_;
   }
    : localized_content)

let make_task_details ?localized_contents:(localized_contents_ : localized_content_list option)
    ~display_name:(display_name_ : unicode_string) ~description:(description_ : unicode_string)
    ~website_url:(website_url_ : url) ~logo_url:(logo_url_ : url)
    ~primary_solution_type:(primary_solution_type_ : primary_solution_type)
    ~industry_segments:(industry_segments_ : industry_segment_list)
    ~translation_source_locale:(translation_source_locale_ : locale) () =
  ({
     display_name = display_name_;
     description = description_;
     website_url = website_url_;
     logo_url = logo_url_;
     primary_solution_type = primary_solution_type_;
     industry_segments = industry_segments_;
     translation_source_locale = translation_source_locale_;
     localized_contents = localized_contents_;
   }
    : task_details)

let make_cancel_profile_update_task_response ?ended_at:(ended_at_ : date_time option)
    ?error_detail_list:(error_detail_list_ : error_detail_list option) ~catalog:(catalog_ : catalog)
    ~arn:(arn_ : partner_arn) ~id:(id_ : partner_id) ~task_id:(task_id_ : profile_task_id)
    ~task_details:(task_details_ : task_details) ~started_at:(started_at_ : date_time)
    ~status:(status_ : profile_task_status) () =
  ({
     catalog = catalog_;
     arn = arn_;
     id = id_;
     task_id = task_id_;
     task_details = task_details_;
     started_at = started_at_;
     status = status_;
     ended_at = ended_at_;
     error_detail_list = error_detail_list_;
   }
    : cancel_profile_update_task_response)

let make_cancel_profile_update_task_request ?client_token:(client_token_ : client_token option)
    ~catalog:(catalog_ : catalog) ~identifier:(identifier_ : partner_identifier)
    ~task_id:(task_id_ : profile_task_id) () =
  ({
     catalog = catalog_;
     identifier = identifier_;
     client_token = client_token_;
     task_id = task_id_;
   }
    : cancel_profile_update_task_request)

let make_connection_invitation_summary ?connection_id:(connection_id_ : connection_id option)
    ?expires_at:(expires_at_ : date_time option) ~catalog:(catalog_ : catalog)
    ~id:(id_ : connection_invitation_id) ~arn:(arn_ : connection_invitation_arn)
    ~connection_type:(connection_type_ : connection_type) ~created_at:(created_at_ : date_time)
    ~updated_at:(updated_at_ : date_time)
    ~other_participant_identifier:(other_participant_identifier_ : participant_identifier)
    ~participant_type:(participant_type_ : participant_type) ~status:(status_ : invitation_status)
    () =
  ({
     catalog = catalog_;
     id = id_;
     arn = arn_;
     connection_id = connection_id_;
     connection_type = connection_type_;
     created_at = created_at_;
     updated_at = updated_at_;
     expires_at = expires_at_;
     other_participant_identifier = other_participant_identifier_;
     participant_type = participant_type_;
     status = status_;
   }
    : connection_invitation_summary)

let make_connection_type_summary ~status:(status_ : connection_type_status)
    ~other_participant:(other_participant_ : participant) () =
  ({ status = status_; other_participant = other_participant_ } : connection_type_summary)

let make_connection_summary ~catalog:(catalog_ : catalog) ~id:(id_ : connection_id)
    ~arn:(arn_ : connection_arn)
    ~other_participant_account_id:(other_participant_account_id_ : aws_account_id)
    ~updated_at:(updated_at_ : date_time)
    ~connection_types:(connection_types_ : connection_type_summary_map) () =
  ({
     catalog = catalog_;
     id = id_;
     arn = arn_;
     other_participant_account_id = other_participant_account_id_;
     updated_at = updated_at_;
     connection_types = connection_types_;
   }
    : connection_summary)

let make_create_connection_invitation_response
    ?connection_id:(connection_id_ : connection_id option)
    ?expires_at:(expires_at_ : date_time option) ~catalog:(catalog_ : catalog)
    ~id:(id_ : connection_invitation_id) ~arn:(arn_ : connection_invitation_arn)
    ~connection_type:(connection_type_ : connection_type) ~created_at:(created_at_ : date_time)
    ~updated_at:(updated_at_ : date_time)
    ~other_participant_identifier:(other_participant_identifier_ : participant_identifier)
    ~participant_type:(participant_type_ : participant_type) ~status:(status_ : invitation_status)
    ~invitation_message:(invitation_message_ : unicode_string_including_new_line)
    ~inviter_email:(inviter_email_ : email) ~inviter_name:(inviter_name_ : sensitive_unicode_string)
    () =
  ({
     catalog = catalog_;
     id = id_;
     arn = arn_;
     connection_id = connection_id_;
     connection_type = connection_type_;
     created_at = created_at_;
     updated_at = updated_at_;
     expires_at = expires_at_;
     other_participant_identifier = other_participant_identifier_;
     participant_type = participant_type_;
     status = status_;
     invitation_message = invitation_message_;
     inviter_email = inviter_email_;
     inviter_name = inviter_name_;
   }
    : create_connection_invitation_response)

let make_create_connection_invitation_request ~catalog:(catalog_ : catalog)
    ~client_token:(client_token_ : client_token)
    ~connection_type:(connection_type_ : connection_type) ~email:(email_ : email)
    ~message:(message_ : unicode_string_including_new_line) ~name:(name_ : sensitive_unicode_string)
    ~receiver_identifier:(receiver_identifier_ : participant_identifier) () =
  ({
     catalog = catalog_;
     client_token = client_token_;
     connection_type = connection_type_;
     email = email_;
     message = message_;
     name = name_;
     receiver_identifier = receiver_identifier_;
   }
    : create_connection_invitation_request)

let make_partner_domain ~domain_name:(domain_name_ : domain_name)
    ~registered_at:(registered_at_ : date_time) () =
  ({ domain_name = domain_name_; registered_at = registered_at_ } : partner_domain)

let make_partner_profile ?localized_contents:(localized_contents_ : localized_content_list option)
    ?profile_id:(profile_id_ : partner_profile_id option)
    ~display_name:(display_name_ : unicode_string) ~description:(description_ : unicode_string)
    ~website_url:(website_url_ : url) ~logo_url:(logo_url_ : url)
    ~primary_solution_type:(primary_solution_type_ : primary_solution_type)
    ~industry_segments:(industry_segments_ : industry_segment_list)
    ~translation_source_locale:(translation_source_locale_ : locale) () =
  ({
     display_name = display_name_;
     description = description_;
     website_url = website_url_;
     logo_url = logo_url_;
     primary_solution_type = primary_solution_type_;
     industry_segments = industry_segments_;
     translation_source_locale = translation_source_locale_;
     localized_contents = localized_contents_;
     profile_id = profile_id_;
   }
    : partner_profile)

let make_create_partner_response
    ?aws_training_certification_email_domains:
      (aws_training_certification_email_domains_ : partner_domain_list option)
    ~catalog:(catalog_ : catalog) ~arn:(arn_ : partner_arn) ~id:(id_ : partner_id)
    ~legal_name:(legal_name_ : sensitive_unicode_string) ~created_at:(created_at_ : date_time)
    ~profile:(profile_ : partner_profile)
    ~alliance_lead_contact:(alliance_lead_contact_ : alliance_lead_contact) () =
  ({
     catalog = catalog_;
     arn = arn_;
     id = id_;
     legal_name = legal_name_;
     created_at = created_at_;
     profile = profile_;
     aws_training_certification_email_domains = aws_training_certification_email_domains_;
     alliance_lead_contact = alliance_lead_contact_;
   }
    : create_partner_response)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_create_partner_request ?client_token:(client_token_ : client_token option)
    ?tags:(tags_ : tag_list option) ~catalog:(catalog_ : catalog)
    ~legal_name:(legal_name_ : sensitive_unicode_string)
    ~primary_solution_type:(primary_solution_type_ : primary_solution_type)
    ~alliance_lead_contact:(alliance_lead_contact_ : alliance_lead_contact)
    ~email_verification_code:(email_verification_code_ : email_verification_code) () =
  ({
     catalog = catalog_;
     client_token = client_token_;
     legal_name = legal_name_;
     primary_solution_type = primary_solution_type_;
     alliance_lead_contact = alliance_lead_contact_;
     email_verification_code = email_verification_code_;
     tags = tags_;
   }
    : create_partner_request)

let make_disassociate_aws_training_certification_email_domain_response () = (() : unit)

let make_disassociate_aws_training_certification_email_domain_request
    ?client_token:(client_token_ : client_token option) ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : partner_identifier) ~domain_name:(domain_name_ : domain_name) () =
  ({
     catalog = catalog_;
     identifier = identifier_;
     client_token = client_token_;
     domain_name = domain_name_;
   }
    : disassociate_aws_training_certification_email_domain_request)

let make_get_alliance_lead_contact_response ~catalog:(catalog_ : catalog) ~arn:(arn_ : partner_arn)
    ~id:(id_ : partner_id) ~alliance_lead_contact:(alliance_lead_contact_ : alliance_lead_contact)
    () =
  ({ catalog = catalog_; arn = arn_; id = id_; alliance_lead_contact = alliance_lead_contact_ }
    : get_alliance_lead_contact_response)

let make_get_alliance_lead_contact_request ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : partner_identifier) () =
  ({ catalog = catalog_; identifier = identifier_ } : get_alliance_lead_contact_request)

let make_get_connection_response ~catalog:(catalog_ : catalog) ~id:(id_ : connection_id)
    ~arn:(arn_ : connection_arn)
    ~other_participant_account_id:(other_participant_account_id_ : aws_account_id)
    ~updated_at:(updated_at_ : date_time)
    ~connection_types:(connection_types_ : connection_type_detail_map) () =
  ({
     catalog = catalog_;
     id = id_;
     arn = arn_;
     other_participant_account_id = other_participant_account_id_;
     updated_at = updated_at_;
     connection_types = connection_types_;
   }
    : get_connection_response)

let make_get_connection_request ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : connection_id) () =
  ({ catalog = catalog_; identifier = identifier_ } : get_connection_request)

let make_get_connection_invitation_response ?connection_id:(connection_id_ : connection_id option)
    ?expires_at:(expires_at_ : date_time option) ~catalog:(catalog_ : catalog)
    ~id:(id_ : connection_invitation_id) ~arn:(arn_ : connection_invitation_arn)
    ~connection_type:(connection_type_ : connection_type) ~created_at:(created_at_ : date_time)
    ~updated_at:(updated_at_ : date_time)
    ~other_participant_identifier:(other_participant_identifier_ : participant_identifier)
    ~participant_type:(participant_type_ : participant_type) ~status:(status_ : invitation_status)
    ~invitation_message:(invitation_message_ : unicode_string_including_new_line)
    ~inviter_email:(inviter_email_ : email) ~inviter_name:(inviter_name_ : sensitive_unicode_string)
    () =
  ({
     catalog = catalog_;
     id = id_;
     arn = arn_;
     connection_id = connection_id_;
     connection_type = connection_type_;
     created_at = created_at_;
     updated_at = updated_at_;
     expires_at = expires_at_;
     other_participant_identifier = other_participant_identifier_;
     participant_type = participant_type_;
     status = status_;
     invitation_message = invitation_message_;
     inviter_email = inviter_email_;
     inviter_name = inviter_name_;
   }
    : get_connection_invitation_response)

let make_get_connection_invitation_request ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : connection_invitation_id) () =
  ({ catalog = catalog_; identifier = identifier_ } : get_connection_invitation_request)

let make_get_connection_preferences_response
    ?excluded_participant_ids:(excluded_participant_ids_ : participant_identifier_list option)
    ~catalog:(catalog_ : catalog) ~arn:(arn_ : connection_preferences_arn)
    ~access_type:(access_type_ : access_type) ~updated_at:(updated_at_ : date_time)
    ~revision:(revision_ : revision) () =
  ({
     catalog = catalog_;
     arn = arn_;
     access_type = access_type_;
     excluded_participant_ids = excluded_participant_ids_;
     updated_at = updated_at_;
     revision = revision_;
   }
    : get_connection_preferences_response)

let make_get_connection_preferences_request ~catalog:(catalog_ : catalog) () =
  ({ catalog = catalog_ } : get_connection_preferences_request)

let make_get_partner_response
    ?aws_training_certification_email_domains:
      (aws_training_certification_email_domains_ : partner_domain_list option)
    ~catalog:(catalog_ : catalog) ~arn:(arn_ : partner_arn) ~id:(id_ : partner_id)
    ~legal_name:(legal_name_ : sensitive_unicode_string) ~created_at:(created_at_ : date_time)
    ~profile:(profile_ : partner_profile) () =
  ({
     catalog = catalog_;
     arn = arn_;
     id = id_;
     legal_name = legal_name_;
     created_at = created_at_;
     profile = profile_;
     aws_training_certification_email_domains = aws_training_certification_email_domains_;
   }
    : get_partner_response)

let make_get_partner_request ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : partner_identifier) () =
  ({ catalog = catalog_; identifier = identifier_ } : get_partner_request)

let make_get_profile_update_task_response ?ended_at:(ended_at_ : date_time option)
    ?error_detail_list:(error_detail_list_ : error_detail_list option) ~catalog:(catalog_ : catalog)
    ~arn:(arn_ : partner_arn) ~id:(id_ : partner_id) ~task_id:(task_id_ : profile_task_id)
    ~task_details:(task_details_ : task_details) ~started_at:(started_at_ : date_time)
    ~status:(status_ : profile_task_status) () =
  ({
     catalog = catalog_;
     arn = arn_;
     id = id_;
     task_id = task_id_;
     task_details = task_details_;
     started_at = started_at_;
     status = status_;
     ended_at = ended_at_;
     error_detail_list = error_detail_list_;
   }
    : get_profile_update_task_response)

let make_get_profile_update_task_request ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : partner_identifier) () =
  ({ catalog = catalog_; identifier = identifier_ } : get_profile_update_task_request)

let make_get_profile_visibility_response ~catalog:(catalog_ : catalog) ~arn:(arn_ : partner_arn)
    ~id:(id_ : partner_id) ~visibility:(visibility_ : profile_visibility)
    ~profile_id:(profile_id_ : partner_profile_id) () =
  ({ catalog = catalog_; arn = arn_; id = id_; visibility = visibility_; profile_id = profile_id_ }
    : get_profile_visibility_response)

let make_get_profile_visibility_request ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : partner_identifier) () =
  ({ catalog = catalog_; identifier = identifier_ } : get_profile_visibility_request)

let make_registrant_verification_response ~completion_url:(completion_url_ : completion_url)
    ~completion_url_expires_at:(completion_url_expires_at_ : date_time) () =
  ({ completion_url = completion_url_; completion_url_expires_at = completion_url_expires_at_ }
    : registrant_verification_response)

let make_get_verification_response
    ?verification_status_reason:(verification_status_reason_ : verification_status_reason option)
    ?completed_at:(completed_at_ : date_time option)
    ~verification_type:(verification_type_ : verification_type)
    ~verification_status:(verification_status_ : verification_status)
    ~verification_response_details:(verification_response_details_ : verification_response_details)
    ~started_at:(started_at_ : date_time) () =
  ({
     verification_type = verification_type_;
     verification_status = verification_status_;
     verification_status_reason = verification_status_reason_;
     verification_response_details = verification_response_details_;
     started_at = started_at_;
     completed_at = completed_at_;
   }
    : get_verification_response)

let make_get_verification_request ~verification_type:(verification_type_ : verification_type) () =
  ({ verification_type = verification_type_ } : get_verification_request)

let make_list_connection_invitations_response ?next_token:(next_token_ : next_token option)
    ~connection_invitation_summaries:
      (connection_invitation_summaries_ : connection_invitation_summary_list) () =
  ({ connection_invitation_summaries = connection_invitation_summaries_; next_token = next_token_ }
    : list_connection_invitations_response)

let make_list_connection_invitations_request ?next_token:(next_token_ : next_token option)
    ?connection_type:(connection_type_ : connection_type option)
    ?max_results:(max_results_ : max_results option)
    ?other_participant_identifiers:
      (other_participant_identifiers_ : participant_identifier_list option)
    ?participant_type:(participant_type_ : participant_type option)
    ?status:(status_ : invitation_status option) ~catalog:(catalog_ : catalog) () =
  ({
     catalog = catalog_;
     next_token = next_token_;
     connection_type = connection_type_;
     max_results = max_results_;
     other_participant_identifiers = other_participant_identifiers_;
     participant_type = participant_type_;
     status = status_;
   }
    : list_connection_invitations_request)

let make_list_connections_response ?next_token:(next_token_ : next_token option)
    ~connection_summaries:(connection_summaries_ : connection_summary_list) () =
  ({ connection_summaries = connection_summaries_; next_token = next_token_ }
    : list_connections_response)

let make_list_connections_request ?next_token:(next_token_ : next_token option)
    ?connection_type:(connection_type_ : connection_type_filter option)
    ?max_results:(max_results_ : max_results option)
    ?other_participant_identifiers:
      (other_participant_identifiers_ : participant_identifier_list option)
    ~catalog:(catalog_ : catalog) () =
  ({
     catalog = catalog_;
     next_token = next_token_;
     connection_type = connection_type_;
     max_results = max_results_;
     other_participant_identifiers = other_participant_identifiers_;
   }
    : list_connections_request)

let make_partner_summary ~catalog:(catalog_ : catalog) ~arn:(arn_ : partner_arn)
    ~id:(id_ : partner_id) ~legal_name:(legal_name_ : sensitive_unicode_string)
    ~created_at:(created_at_ : date_time) () =
  ({ catalog = catalog_; arn = arn_; id = id_; legal_name = legal_name_; created_at = created_at_ }
    : partner_summary)

let make_list_partners_response ?next_token:(next_token_ : next_token option)
    ~partner_summary_list:(partner_summary_list_ : partner_summary_list) () =
  ({ partner_summary_list = partner_summary_list_; next_token = next_token_ }
    : list_partners_response)

let make_list_partners_request ?next_token:(next_token_ : next_token option)
    ~catalog:(catalog_ : catalog) () =
  ({ catalog = catalog_; next_token = next_token_ } : list_partners_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn)
    ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_start_verification_response
    ?verification_status_reason:(verification_status_reason_ : verification_status_reason option)
    ?completed_at:(completed_at_ : date_time option)
    ~verification_type:(verification_type_ : verification_type)
    ~verification_status:(verification_status_ : verification_status)
    ~verification_response_details:(verification_response_details_ : verification_response_details)
    ~started_at:(started_at_ : date_time) () =
  ({
     verification_type = verification_type_;
     verification_status = verification_status_;
     verification_status_reason = verification_status_reason_;
     verification_response_details = verification_response_details_;
     started_at = started_at_;
     completed_at = completed_at_;
   }
    : start_verification_response)

let make_registrant_verification_details () = (() : unit)

let make_start_verification_request ?client_token:(client_token_ : client_token option)
    ?verification_details:(verification_details_ : verification_details option) () =
  ({ client_token = client_token_; verification_details = verification_details_ }
    : start_verification_request)

let make_send_email_verification_code_response () = (() : unit)

let make_send_email_verification_code_request ~catalog:(catalog_ : catalog) ~email:(email_ : email)
    () =
  ({ catalog = catalog_; email = email_ } : send_email_verification_code_request)

let make_put_alliance_lead_contact_response ~catalog:(catalog_ : catalog) ~arn:(arn_ : partner_arn)
    ~id:(id_ : partner_id) ~alliance_lead_contact:(alliance_lead_contact_ : alliance_lead_contact)
    () =
  ({ catalog = catalog_; arn = arn_; id = id_; alliance_lead_contact = alliance_lead_contact_ }
    : put_alliance_lead_contact_response)

let make_put_alliance_lead_contact_request
    ?email_verification_code:(email_verification_code_ : email_verification_code option)
    ~catalog:(catalog_ : catalog) ~identifier:(identifier_ : partner_identifier)
    ~alliance_lead_contact:(alliance_lead_contact_ : alliance_lead_contact) () =
  ({
     catalog = catalog_;
     identifier = identifier_;
     alliance_lead_contact = alliance_lead_contact_;
     email_verification_code = email_verification_code_;
   }
    : put_alliance_lead_contact_request)

let make_put_profile_visibility_response ~catalog:(catalog_ : catalog) ~arn:(arn_ : partner_arn)
    ~id:(id_ : partner_id) ~visibility:(visibility_ : profile_visibility)
    ~profile_id:(profile_id_ : partner_profile_id) () =
  ({ catalog = catalog_; arn = arn_; id = id_; visibility = visibility_; profile_id = profile_id_ }
    : put_profile_visibility_response)

let make_put_profile_visibility_request ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : partner_identifier) ~visibility:(visibility_ : profile_visibility) ()
    =
  ({ catalog = catalog_; identifier = identifier_; visibility = visibility_ }
    : put_profile_visibility_request)

let make_reject_connection_invitation_response
    ?connection_id:(connection_id_ : connection_id option)
    ?expires_at:(expires_at_ : date_time option) ~catalog:(catalog_ : catalog)
    ~id:(id_ : connection_invitation_id) ~arn:(arn_ : connection_invitation_arn)
    ~connection_type:(connection_type_ : connection_type) ~created_at:(created_at_ : date_time)
    ~updated_at:(updated_at_ : date_time)
    ~other_participant_identifier:(other_participant_identifier_ : participant_identifier)
    ~participant_type:(participant_type_ : participant_type) ~status:(status_ : invitation_status)
    ~invitation_message:(invitation_message_ : unicode_string_including_new_line)
    ~inviter_email:(inviter_email_ : email) ~inviter_name:(inviter_name_ : sensitive_unicode_string)
    () =
  ({
     catalog = catalog_;
     id = id_;
     arn = arn_;
     connection_id = connection_id_;
     connection_type = connection_type_;
     created_at = created_at_;
     updated_at = updated_at_;
     expires_at = expires_at_;
     other_participant_identifier = other_participant_identifier_;
     participant_type = participant_type_;
     status = status_;
     invitation_message = invitation_message_;
     inviter_email = inviter_email_;
     inviter_name = inviter_name_;
   }
    : reject_connection_invitation_response)

let make_reject_connection_invitation_request
    ?reason:(reason_ : Smaws_Lib.Smithy_api.Types.string_ option) ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : connection_invitation_id)
    ~client_token:(client_token_ : client_token) () =
  ({ catalog = catalog_; identifier = identifier_; client_token = client_token_; reason = reason_ }
    : reject_connection_invitation_request)

let make_start_profile_update_task_response ?ended_at:(ended_at_ : date_time option)
    ?error_detail_list:(error_detail_list_ : error_detail_list option) ~catalog:(catalog_ : catalog)
    ~arn:(arn_ : partner_arn) ~id:(id_ : partner_id) ~task_id:(task_id_ : profile_task_id)
    ~task_details:(task_details_ : task_details) ~started_at:(started_at_ : date_time)
    ~status:(status_ : profile_task_status) () =
  ({
     catalog = catalog_;
     arn = arn_;
     id = id_;
     task_id = task_id_;
     task_details = task_details_;
     started_at = started_at_;
     status = status_;
     ended_at = ended_at_;
     error_detail_list = error_detail_list_;
   }
    : start_profile_update_task_response)

let make_start_profile_update_task_request ?client_token:(client_token_ : client_token option)
    ~catalog:(catalog_ : catalog) ~identifier:(identifier_ : partner_identifier)
    ~task_details:(task_details_ : task_details) () =
  ({
     catalog = catalog_;
     identifier = identifier_;
     client_token = client_token_;
     task_details = task_details_;
   }
    : start_profile_update_task_request)

let make_update_connection_preferences_response
    ?excluded_participant_ids:(excluded_participant_ids_ : participant_identifier_list option)
    ~catalog:(catalog_ : catalog) ~arn:(arn_ : connection_preferences_arn)
    ~access_type:(access_type_ : access_type) ~updated_at:(updated_at_ : date_time)
    ~revision:(revision_ : revision) () =
  ({
     catalog = catalog_;
     arn = arn_;
     access_type = access_type_;
     excluded_participant_ids = excluded_participant_ids_;
     updated_at = updated_at_;
     revision = revision_;
   }
    : update_connection_preferences_response)

let make_update_connection_preferences_request
    ?excluded_participant_identifiers:
      (excluded_participant_identifiers_ : participant_identifier_list option)
    ~catalog:(catalog_ : catalog) ~revision:(revision_ : revision)
    ~access_type:(access_type_ : access_type) () =
  ({
     catalog = catalog_;
     revision = revision_;
     access_type = access_type_;
     excluded_participant_identifiers = excluded_participant_identifiers_;
   }
    : update_connection_preferences_request)
