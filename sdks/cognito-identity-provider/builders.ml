open Types

let make_web_authn_mfa_settings_type ?enabled:(enabled_ : boolean_type option) () =
  ({ enabled = enabled_ } : web_authn_mfa_settings_type)

let make_web_authn_credential_description
    ?authenticator_attachment:
      (authenticator_attachment_ : web_authn_authenticator_attachment_type option)
    ~created_at:(created_at_ : date_type)
    ~authenticator_transports:(authenticator_transports_ : web_authn_authenticator_transports_list)
    ~relying_party_id:(relying_party_id_ : string_type)
    ~friendly_credential_name:(friendly_credential_name_ : string_type)
    ~credential_id:(credential_id_ : string_type) () =
  ({
     created_at = created_at_;
     authenticator_transports = authenticator_transports_;
     authenticator_attachment = authenticator_attachment_;
     relying_party_id = relying_party_id_;
     friendly_credential_name = friendly_credential_name_;
     credential_id = credential_id_;
   }
    : web_authn_credential_description)

let make_web_authn_configuration_type
    ?factor_configuration:(factor_configuration_ : web_authn_factor_configuration_type option)
    ?user_verification:(user_verification_ : user_verification_type option)
    ?relying_party_id:(relying_party_id_ : relying_party_id_type option) () =
  ({
     factor_configuration = factor_configuration_;
     user_verification = user_verification_;
     relying_party_id = relying_party_id_;
   }
    : web_authn_configuration_type)

let make_verify_user_attribute_response () = (() : unit)

let make_verify_user_attribute_request ~code:(code_ : confirmation_code_type)
    ~attribute_name:(attribute_name_ : attribute_name_type)
    ~access_token:(access_token_ : token_model_type) () =
  ({ code = code_; attribute_name = attribute_name_; access_token = access_token_ }
    : verify_user_attribute_request)

let make_verify_software_token_response ?session:(session_ : session_type option)
    ?status:(status_ : verify_software_token_response_type option) () =
  ({ session = session_; status = status_ } : verify_software_token_response)

let make_verify_software_token_request
    ?friendly_device_name:(friendly_device_name_ : string_type option)
    ?session:(session_ : session_type option)
    ?access_token:(access_token_ : token_model_type option)
    ~user_code:(user_code_ : software_token_mfa_user_code_type) () =
  ({
     friendly_device_name = friendly_device_name_;
     user_code = user_code_;
     session = session_;
     access_token = access_token_;
   }
    : verify_software_token_request)

let make_verification_message_template_type
    ?default_email_option:(default_email_option_ : default_email_option_type option)
    ?email_subject_by_link:(email_subject_by_link_ : email_verification_subject_by_link_type option)
    ?email_message_by_link:(email_message_by_link_ : email_verification_message_by_link_type option)
    ?email_subject:(email_subject_ : email_verification_subject_type option)
    ?email_message:(email_message_ : email_verification_message_type option)
    ?sms_message:(sms_message_ : sms_verification_message_type option) () =
  ({
     default_email_option = default_email_option_;
     email_subject_by_link = email_subject_by_link_;
     email_message_by_link = email_message_by_link_;
     email_subject = email_subject_;
     email_message = email_message_;
     sms_message = sms_message_;
   }
    : verification_message_template_type)

let make_attribute_type ?value:(value_ : attribute_value_type option)
    ~name:(name_ : attribute_name_type) () =
  ({ value = value_; name = name_ } : attribute_type)

let make_mfa_option_type ?attribute_name:(attribute_name_ : attribute_name_type option)
    ?delivery_medium:(delivery_medium_ : delivery_medium_type option) () =
  ({ attribute_name = attribute_name_; delivery_medium = delivery_medium_ } : mfa_option_type)

let make_user_type ?mfa_options:(mfa_options_ : mfa_option_list_type option)
    ?user_status:(user_status_ : user_status_type option) ?enabled:(enabled_ : boolean_type option)
    ?user_last_modified_date:(user_last_modified_date_ : date_type option)
    ?user_create_date:(user_create_date_ : date_type option)
    ?attributes:(attributes_ : attribute_list_type option)
    ?username:(username_ : username_type option) () =
  ({
     mfa_options = mfa_options_;
     user_status = user_status_;
     enabled = enabled_;
     user_last_modified_date = user_last_modified_date_;
     user_create_date = user_create_date_;
     attributes = attributes_;
     username = username_;
   }
    : user_type)

let make_username_configuration_type ~case_sensitive:(case_sensitive_ : wrapped_boolean_type) () =
  ({ case_sensitive = case_sensitive_ } : username_configuration_type)

let make_password_policy_type
    ?temporary_password_validity_days:
      (temporary_password_validity_days_ : temporary_password_validity_days_type option)
    ?password_history_size:(password_history_size_ : password_history_size_type option)
    ?require_symbols:(require_symbols_ : boolean_type option)
    ?require_numbers:(require_numbers_ : boolean_type option)
    ?require_lowercase:(require_lowercase_ : boolean_type option)
    ?require_uppercase:(require_uppercase_ : boolean_type option)
    ?minimum_length:(minimum_length_ : password_policy_min_length_type option) () =
  ({
     temporary_password_validity_days = temporary_password_validity_days_;
     password_history_size = password_history_size_;
     require_symbols = require_symbols_;
     require_numbers = require_numbers_;
     require_lowercase = require_lowercase_;
     require_uppercase = require_uppercase_;
     minimum_length = minimum_length_;
   }
    : password_policy_type)

let make_sign_in_policy_type
    ?allowed_first_auth_factors:
      (allowed_first_auth_factors_ : allowed_first_auth_factors_list_type option) () =
  ({ allowed_first_auth_factors = allowed_first_auth_factors_ } : sign_in_policy_type)

let make_user_pool_policy_type ?sign_in_policy:(sign_in_policy_ : sign_in_policy_type option)
    ?password_policy:(password_policy_ : password_policy_type option) () =
  ({ sign_in_policy = sign_in_policy_; password_policy = password_policy_ } : user_pool_policy_type)

let make_pre_token_generation_version_config_type ~lambda_arn:(lambda_arn_ : arn_type)
    ~lambda_version:(lambda_version_ : pre_token_generation_lambda_version_type) () =
  ({ lambda_arn = lambda_arn_; lambda_version = lambda_version_ }
    : pre_token_generation_version_config_type)

let make_custom_sms_lambda_version_config_type ~lambda_arn:(lambda_arn_ : arn_type)
    ~lambda_version:(lambda_version_ : custom_sms_sender_lambda_version_type) () =
  ({ lambda_arn = lambda_arn_; lambda_version = lambda_version_ }
    : custom_sms_lambda_version_config_type)

let make_custom_email_lambda_version_config_type ~lambda_arn:(lambda_arn_ : arn_type)
    ~lambda_version:(lambda_version_ : custom_email_sender_lambda_version_type) () =
  ({ lambda_arn = lambda_arn_; lambda_version = lambda_version_ }
    : custom_email_lambda_version_config_type)

let make_inbound_federation_lambda_type ~lambda_arn:(lambda_arn_ : arn_type)
    ~lambda_version:(lambda_version_ : inbound_federation_lambda_version_type) () =
  ({ lambda_arn = lambda_arn_; lambda_version = lambda_version_ } : inbound_federation_lambda_type)

let make_lambda_config_type
    ?inbound_federation:(inbound_federation_ : inbound_federation_lambda_type option)
    ?kms_key_i_d:(kms_key_i_d_ : arn_type option)
    ?custom_email_sender:(custom_email_sender_ : custom_email_lambda_version_config_type option)
    ?custom_sms_sender:(custom_sms_sender_ : custom_sms_lambda_version_config_type option)
    ?pre_token_generation_config:
      (pre_token_generation_config_ : pre_token_generation_version_config_type option)
    ?user_migration:(user_migration_ : arn_type option)
    ?pre_token_generation:(pre_token_generation_ : arn_type option)
    ?verify_auth_challenge_response:(verify_auth_challenge_response_ : arn_type option)
    ?create_auth_challenge:(create_auth_challenge_ : arn_type option)
    ?define_auth_challenge:(define_auth_challenge_ : arn_type option)
    ?post_authentication:(post_authentication_ : arn_type option)
    ?pre_authentication:(pre_authentication_ : arn_type option)
    ?post_confirmation:(post_confirmation_ : arn_type option)
    ?custom_message:(custom_message_ : arn_type option)
    ?pre_sign_up:(pre_sign_up_ : arn_type option) () =
  ({
     inbound_federation = inbound_federation_;
     kms_key_i_d = kms_key_i_d_;
     custom_email_sender = custom_email_sender_;
     custom_sms_sender = custom_sms_sender_;
     pre_token_generation_config = pre_token_generation_config_;
     user_migration = user_migration_;
     pre_token_generation = pre_token_generation_;
     verify_auth_challenge_response = verify_auth_challenge_response_;
     create_auth_challenge = create_auth_challenge_;
     define_auth_challenge = define_auth_challenge_;
     post_authentication = post_authentication_;
     pre_authentication = pre_authentication_;
     post_confirmation = post_confirmation_;
     custom_message = custom_message_;
     pre_sign_up = pre_sign_up_;
   }
    : lambda_config_type)

let make_number_attribute_constraints_type ?max_value:(max_value_ : string_type option)
    ?min_value:(min_value_ : string_type option) () =
  ({ max_value = max_value_; min_value = min_value_ } : number_attribute_constraints_type)

let make_string_attribute_constraints_type ?max_length:(max_length_ : string_type option)
    ?min_length:(min_length_ : string_type option) () =
  ({ max_length = max_length_; min_length = min_length_ } : string_attribute_constraints_type)

let make_schema_attribute_type
    ?string_attribute_constraints:
      (string_attribute_constraints_ : string_attribute_constraints_type option)
    ?number_attribute_constraints:
      (number_attribute_constraints_ : number_attribute_constraints_type option)
    ?required:(required_ : boolean_type option) ?\#mutable:(mutable_ : boolean_type option)
    ?developer_only_attribute:(developer_only_attribute_ : boolean_type option)
    ?attribute_data_type:(attribute_data_type_ : attribute_data_type option)
    ?name:(name_ : custom_attribute_name_type option) () =
  ({
     string_attribute_constraints = string_attribute_constraints_;
     number_attribute_constraints = number_attribute_constraints_;
     required = required_;
     \#mutable = mutable_;
     developer_only_attribute = developer_only_attribute_;
     attribute_data_type = attribute_data_type_;
     name = name_;
   }
    : schema_attribute_type)

let make_user_attribute_update_settings_type
    ?attributes_require_verification_before_update:
      (attributes_require_verification_before_update_ :
         attributes_require_verification_before_update_type option) () =
  ({
     attributes_require_verification_before_update = attributes_require_verification_before_update_;
   }
    : user_attribute_update_settings_type)

let make_device_configuration_type
    ?device_only_remembered_on_user_prompt:
      (device_only_remembered_on_user_prompt_ : boolean_type option)
    ?challenge_required_on_new_device:(challenge_required_on_new_device_ : boolean_type option) () =
  ({
     device_only_remembered_on_user_prompt = device_only_remembered_on_user_prompt_;
     challenge_required_on_new_device = challenge_required_on_new_device_;
   }
    : device_configuration_type)

let make_email_configuration_type
    ?configuration_set:(configuration_set_ : ses_configuration_set option)
    ?from_:(from__ : string_type option)
    ?email_sending_account:(email_sending_account_ : email_sending_account_type option)
    ?reply_to_email_address:(reply_to_email_address_ : email_address_type option)
    ?source_arn:(source_arn_ : arn_type option) () =
  ({
     configuration_set = configuration_set_;
     from_ = from__;
     email_sending_account = email_sending_account_;
     reply_to_email_address = reply_to_email_address_;
     source_arn = source_arn_;
   }
    : email_configuration_type)

let make_sms_configuration_type ?sns_region:(sns_region_ : region_code_type option)
    ?external_id:(external_id_ : string_type option) ~sns_caller_arn:(sns_caller_arn_ : arn_type) ()
    =
  ({ sns_region = sns_region_; external_id = external_id_; sns_caller_arn = sns_caller_arn_ }
    : sms_configuration_type)

let make_message_template_type
    ?email_subject:(email_subject_ : email_verification_subject_type option)
    ?email_message:(email_message_ : email_invite_message_type option)
    ?sms_message:(sms_message_ : sms_invite_message_type option) () =
  ({ email_subject = email_subject_; email_message = email_message_; sms_message = sms_message_ }
    : message_template_type)

let make_admin_create_user_config_type
    ?invite_message_template:(invite_message_template_ : message_template_type option)
    ?unused_account_validity_days:
      (unused_account_validity_days_ : admin_create_user_unused_account_validity_days_type option)
    ?allow_admin_create_user_only:(allow_admin_create_user_only_ : boolean_type option) () =
  ({
     invite_message_template = invite_message_template_;
     unused_account_validity_days = unused_account_validity_days_;
     allow_admin_create_user_only = allow_admin_create_user_only_;
   }
    : admin_create_user_config_type)

let make_advanced_security_additional_flows_type
    ?custom_auth_mode:(custom_auth_mode_ : advanced_security_enabled_mode_type option) () =
  ({ custom_auth_mode = custom_auth_mode_ } : advanced_security_additional_flows_type)

let make_user_pool_add_ons_type
    ?advanced_security_additional_flows:
      (advanced_security_additional_flows_ : advanced_security_additional_flows_type option)
    ~advanced_security_mode:(advanced_security_mode_ : advanced_security_mode_type) () =
  ({
     advanced_security_additional_flows = advanced_security_additional_flows_;
     advanced_security_mode = advanced_security_mode_;
   }
    : user_pool_add_ons_type)

let make_recovery_option_type ~name:(name_ : recovery_option_name_type)
    ~priority:(priority_ : priority_type) () =
  ({ name = name_; priority = priority_ } : recovery_option_type)

let make_account_recovery_setting_type
    ?recovery_mechanisms:(recovery_mechanisms_ : recovery_mechanisms_type option) () =
  ({ recovery_mechanisms = recovery_mechanisms_ } : account_recovery_setting_type)

let make_key_configuration_type ?kms_key_arn:(kms_key_arn_ : encryption_key_arn_type option)
    ?key_type:(key_type_ : encryption_key_type option) () =
  ({ kms_key_arn = kms_key_arn_; key_type = key_type_ } : key_configuration_type)

let make_issuer_configuration_type ?type_:(type__ : issuer_type option) () =
  ({ type_ = type__ } : issuer_configuration_type)

let make_user_pool_type
    ?issuer_configuration:(issuer_configuration_ : issuer_configuration_type option)
    ?key_configuration:(key_configuration_ : key_configuration_type option)
    ?user_pool_tier:(user_pool_tier_ : user_pool_tier_type option)
    ?account_recovery_setting:(account_recovery_setting_ : account_recovery_setting_type option)
    ?arn:(arn_ : arn_type option)
    ?username_configuration:(username_configuration_ : username_configuration_type option)
    ?user_pool_add_ons:(user_pool_add_ons_ : user_pool_add_ons_type option)
    ?admin_create_user_config:(admin_create_user_config_ : admin_create_user_config_type option)
    ?custom_domain:(custom_domain_ : domain_type option) ?domain:(domain_ : domain_type option)
    ?email_configuration_failure:(email_configuration_failure_ : string_type option)
    ?sms_configuration_failure:(sms_configuration_failure_ : string_type option)
    ?user_pool_tags:(user_pool_tags_ : user_pool_tags_type option)
    ?sms_configuration:(sms_configuration_ : sms_configuration_type option)
    ?email_configuration:(email_configuration_ : email_configuration_type option)
    ?estimated_number_of_users:(estimated_number_of_users_ : integer_type option)
    ?device_configuration:(device_configuration_ : device_configuration_type option)
    ?mfa_configuration:(mfa_configuration_ : user_pool_mfa_type option)
    ?user_attribute_update_settings:
      (user_attribute_update_settings_ : user_attribute_update_settings_type option)
    ?sms_authentication_message:(sms_authentication_message_ : sms_verification_message_type option)
    ?verification_message_template:
      (verification_message_template_ : verification_message_template_type option)
    ?email_verification_subject:
      (email_verification_subject_ : email_verification_subject_type option)
    ?email_verification_message:
      (email_verification_message_ : email_verification_message_type option)
    ?sms_verification_message:(sms_verification_message_ : sms_verification_message_type option)
    ?username_attributes:(username_attributes_ : username_attributes_list_type option)
    ?alias_attributes:(alias_attributes_ : alias_attributes_list_type option)
    ?auto_verified_attributes:(auto_verified_attributes_ : verified_attributes_list_type option)
    ?schema_attributes:(schema_attributes_ : schema_attributes_list_type option)
    ?creation_date:(creation_date_ : date_type option)
    ?last_modified_date:(last_modified_date_ : date_type option)
    ?status:(status_ : status_type option)
    ?lambda_config:(lambda_config_ : lambda_config_type option)
    ?deletion_protection:(deletion_protection_ : deletion_protection_type option)
    ?policies:(policies_ : user_pool_policy_type option) ?name:(name_ : user_pool_name_type option)
    ?id:(id_ : user_pool_id_type option) () =
  ({
     issuer_configuration = issuer_configuration_;
     key_configuration = key_configuration_;
     user_pool_tier = user_pool_tier_;
     account_recovery_setting = account_recovery_setting_;
     arn = arn_;
     username_configuration = username_configuration_;
     user_pool_add_ons = user_pool_add_ons_;
     admin_create_user_config = admin_create_user_config_;
     custom_domain = custom_domain_;
     domain = domain_;
     email_configuration_failure = email_configuration_failure_;
     sms_configuration_failure = sms_configuration_failure_;
     user_pool_tags = user_pool_tags_;
     sms_configuration = sms_configuration_;
     email_configuration = email_configuration_;
     estimated_number_of_users = estimated_number_of_users_;
     device_configuration = device_configuration_;
     mfa_configuration = mfa_configuration_;
     user_attribute_update_settings = user_attribute_update_settings_;
     sms_authentication_message = sms_authentication_message_;
     verification_message_template = verification_message_template_;
     email_verification_subject = email_verification_subject_;
     email_verification_message = email_verification_message_;
     sms_verification_message = sms_verification_message_;
     username_attributes = username_attributes_;
     alias_attributes = alias_attributes_;
     auto_verified_attributes = auto_verified_attributes_;
     schema_attributes = schema_attributes_;
     creation_date = creation_date_;
     last_modified_date = last_modified_date_;
     status = status_;
     lambda_config = lambda_config_;
     deletion_protection = deletion_protection_;
     policies = policies_;
     name = name_;
     id = id_;
   }
    : user_pool_type)

let make_user_pool_replica_type ?user_pool_arn:(user_pool_arn_ : arn_type option)
    ?role:(role_ : replica_role_type option) ?status:(status_ : replica_status_type option)
    ?region_name:(region_name_ : region_name_type option) () =
  ({ user_pool_arn = user_pool_arn_; role = role_; status = status_; region_name = region_name_ }
    : user_pool_replica_type)

let make_user_pool_description_type
    ?replica_regions:(replica_regions_ : replica_regions_type option)
    ?creation_date:(creation_date_ : date_type option)
    ?last_modified_date:(last_modified_date_ : date_type option)
    ?status:(status_ : status_type option)
    ?lambda_config:(lambda_config_ : lambda_config_type option)
    ?name:(name_ : user_pool_name_type option) ?id:(id_ : user_pool_id_type option) () =
  ({
     replica_regions = replica_regions_;
     creation_date = creation_date_;
     last_modified_date = last_modified_date_;
     status = status_;
     lambda_config = lambda_config_;
     name = name_;
     id = id_;
   }
    : user_pool_description_type)

let make_token_validity_units_type ?refresh_token:(refresh_token_ : time_units_type option)
    ?id_token:(id_token_ : time_units_type option)
    ?access_token:(access_token_ : time_units_type option) () =
  ({ refresh_token = refresh_token_; id_token = id_token_; access_token = access_token_ }
    : token_validity_units_type)

let make_analytics_configuration_type ?user_data_shared:(user_data_shared_ : boolean_type option)
    ?external_id:(external_id_ : string_type option) ?role_arn:(role_arn_ : arn_type option)
    ?application_arn:(application_arn_ : arn_type option)
    ?application_id:(application_id_ : hex_string_type option) () =
  ({
     user_data_shared = user_data_shared_;
     external_id = external_id_;
     role_arn = role_arn_;
     application_arn = application_arn_;
     application_id = application_id_;
   }
    : analytics_configuration_type)

let make_refresh_token_rotation_type
    ?retry_grace_period_seconds:
      (retry_grace_period_seconds_ : retry_grace_period_seconds_type option)
    ~feature:(feature_ : feature_type) () =
  ({ retry_grace_period_seconds = retry_grace_period_seconds_; feature = feature_ }
    : refresh_token_rotation_type)

let make_user_pool_client_type
    ?refresh_token_rotation:(refresh_token_rotation_ : refresh_token_rotation_type option)
    ?auth_session_validity:(auth_session_validity_ : auth_session_validity_type option)
    ?enable_propagate_additional_user_context_data:
      (enable_propagate_additional_user_context_data_ : wrapped_boolean_type option)
    ?enable_token_revocation:(enable_token_revocation_ : wrapped_boolean_type option)
    ?prevent_user_existence_errors:
      (prevent_user_existence_errors_ : prevent_user_existence_error_types option)
    ?analytics_configuration:(analytics_configuration_ : analytics_configuration_type option)
    ?allowed_o_auth_flows_user_pool_client:
      (allowed_o_auth_flows_user_pool_client_ : boolean_type option)
    ?allowed_o_auth_scopes:(allowed_o_auth_scopes_ : scope_list_type option)
    ?allowed_o_auth_flows:(allowed_o_auth_flows_ : o_auth_flows_type option)
    ?default_redirect_ur_i:(default_redirect_ur_i_ : redirect_url_type option)
    ?logout_ur_ls:(logout_ur_ls_ : logout_ur_ls_list_type option)
    ?callback_ur_ls:(callback_ur_ls_ : callback_ur_ls_list_type option)
    ?supported_identity_providers:
      (supported_identity_providers_ : supported_identity_providers_list_type option)
    ?explicit_auth_flows:(explicit_auth_flows_ : explicit_auth_flows_list_type option)
    ?write_attributes:(write_attributes_ : client_permission_list_type option)
    ?read_attributes:(read_attributes_ : client_permission_list_type option)
    ?token_validity_units:(token_validity_units_ : token_validity_units_type option)
    ?id_token_validity:(id_token_validity_ : id_token_validity_type option)
    ?access_token_validity:(access_token_validity_ : access_token_validity_type option)
    ?refresh_token_validity:(refresh_token_validity_ : refresh_token_validity_type option)
    ?creation_date:(creation_date_ : date_type option)
    ?last_modified_date:(last_modified_date_ : date_type option)
    ?client_secret:(client_secret_ : client_secret_type option)
    ?client_id:(client_id_ : client_id_type option)
    ?client_name:(client_name_ : client_name_type option)
    ?user_pool_id:(user_pool_id_ : user_pool_id_type option) () =
  ({
     refresh_token_rotation = refresh_token_rotation_;
     auth_session_validity = auth_session_validity_;
     enable_propagate_additional_user_context_data = enable_propagate_additional_user_context_data_;
     enable_token_revocation = enable_token_revocation_;
     prevent_user_existence_errors = prevent_user_existence_errors_;
     analytics_configuration = analytics_configuration_;
     allowed_o_auth_flows_user_pool_client = allowed_o_auth_flows_user_pool_client_;
     allowed_o_auth_scopes = allowed_o_auth_scopes_;
     allowed_o_auth_flows = allowed_o_auth_flows_;
     default_redirect_ur_i = default_redirect_ur_i_;
     logout_ur_ls = logout_ur_ls_;
     callback_ur_ls = callback_ur_ls_;
     supported_identity_providers = supported_identity_providers_;
     explicit_auth_flows = explicit_auth_flows_;
     write_attributes = write_attributes_;
     read_attributes = read_attributes_;
     token_validity_units = token_validity_units_;
     id_token_validity = id_token_validity_;
     access_token_validity = access_token_validity_;
     refresh_token_validity = refresh_token_validity_;
     creation_date = creation_date_;
     last_modified_date = last_modified_date_;
     client_secret = client_secret_;
     client_id = client_id_;
     client_name = client_name_;
     user_pool_id = user_pool_id_;
   }
    : user_pool_client_type)

let make_user_pool_client_description ?client_name:(client_name_ : client_name_type option)
    ?user_pool_id:(user_pool_id_ : user_pool_id_type option)
    ?client_id:(client_id_ : client_id_type option) () =
  ({ client_name = client_name_; user_pool_id = user_pool_id_; client_id = client_id_ }
    : user_pool_client_description)

let make_user_import_job_type
    ?completion_message:(completion_message_ : completion_message_type option)
    ?failed_users:(failed_users_ : long_type option)
    ?skipped_users:(skipped_users_ : long_type option)
    ?imported_users:(imported_users_ : long_type option)
    ?cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : arn_type option)
    ?status:(status_ : user_import_job_status_type option)
    ?completion_date:(completion_date_ : date_type option)
    ?start_date:(start_date_ : date_type option) ?creation_date:(creation_date_ : date_type option)
    ?pre_signed_url:(pre_signed_url_ : pre_signed_url_type option)
    ?user_pool_id:(user_pool_id_ : user_pool_id_type option)
    ?job_id:(job_id_ : user_import_job_id_type option)
    ?job_name:(job_name_ : user_import_job_name_type option) () =
  ({
     completion_message = completion_message_;
     failed_users = failed_users_;
     skipped_users = skipped_users_;
     imported_users = imported_users_;
     cloud_watch_logs_role_arn = cloud_watch_logs_role_arn_;
     status = status_;
     completion_date = completion_date_;
     start_date = start_date_;
     creation_date = creation_date_;
     pre_signed_url = pre_signed_url_;
     user_pool_id = user_pool_id_;
     job_id = job_id_;
     job_name = job_name_;
   }
    : user_import_job_type)

let make_user_context_data_type ?encoded_data:(encoded_data_ : string_type option)
    ?ip_address:(ip_address_ : string_type option) () =
  ({ encoded_data = encoded_data_; ip_address = ip_address_ } : user_context_data_type)

let make_update_user_pool_response () = (() : unit)

let make_update_user_pool_request
    ?issuer_configuration:(issuer_configuration_ : issuer_configuration_type option)
    ?key_configuration:(key_configuration_ : key_configuration_type option)
    ?user_pool_tier:(user_pool_tier_ : user_pool_tier_type option)
    ?pool_name:(pool_name_ : user_pool_name_type option)
    ?account_recovery_setting:(account_recovery_setting_ : account_recovery_setting_type option)
    ?user_pool_add_ons:(user_pool_add_ons_ : user_pool_add_ons_type option)
    ?admin_create_user_config:(admin_create_user_config_ : admin_create_user_config_type option)
    ?user_pool_tags:(user_pool_tags_ : user_pool_tags_type option)
    ?sms_configuration:(sms_configuration_ : sms_configuration_type option)
    ?email_configuration:(email_configuration_ : email_configuration_type option)
    ?device_configuration:(device_configuration_ : device_configuration_type option)
    ?mfa_configuration:(mfa_configuration_ : user_pool_mfa_type option)
    ?user_attribute_update_settings:
      (user_attribute_update_settings_ : user_attribute_update_settings_type option)
    ?sms_authentication_message:(sms_authentication_message_ : sms_verification_message_type option)
    ?verification_message_template:
      (verification_message_template_ : verification_message_template_type option)
    ?email_verification_subject:
      (email_verification_subject_ : email_verification_subject_type option)
    ?email_verification_message:
      (email_verification_message_ : email_verification_message_type option)
    ?sms_verification_message:(sms_verification_message_ : sms_verification_message_type option)
    ?auto_verified_attributes:(auto_verified_attributes_ : verified_attributes_list_type option)
    ?lambda_config:(lambda_config_ : lambda_config_type option)
    ?deletion_protection:(deletion_protection_ : deletion_protection_type option)
    ?policies:(policies_ : user_pool_policy_type option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     issuer_configuration = issuer_configuration_;
     key_configuration = key_configuration_;
     user_pool_tier = user_pool_tier_;
     pool_name = pool_name_;
     account_recovery_setting = account_recovery_setting_;
     user_pool_add_ons = user_pool_add_ons_;
     admin_create_user_config = admin_create_user_config_;
     user_pool_tags = user_pool_tags_;
     sms_configuration = sms_configuration_;
     email_configuration = email_configuration_;
     device_configuration = device_configuration_;
     mfa_configuration = mfa_configuration_;
     user_attribute_update_settings = user_attribute_update_settings_;
     sms_authentication_message = sms_authentication_message_;
     verification_message_template = verification_message_template_;
     email_verification_subject = email_verification_subject_;
     email_verification_message = email_verification_message_;
     sms_verification_message = sms_verification_message_;
     auto_verified_attributes = auto_verified_attributes_;
     lambda_config = lambda_config_;
     deletion_protection = deletion_protection_;
     policies = policies_;
     user_pool_id = user_pool_id_;
   }
    : update_user_pool_request)

let make_update_user_pool_replica_response
    ?user_pool_replica:(user_pool_replica_ : user_pool_replica_type option) () =
  ({ user_pool_replica = user_pool_replica_ } : update_user_pool_replica_response)

let make_update_user_pool_replica_request ~status:(status_ : update_replica_status_type)
    ~region_name:(region_name_ : region_name_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type)
    () =
  ({ status = status_; region_name = region_name_; user_pool_id = user_pool_id_ }
    : update_user_pool_replica_request)

let make_failover_type
    ~primary_route53_health_check_id:(primary_route53_health_check_id_ : health_check_id_type)
    ~secondary_region:(secondary_region_ : region_name_type) () =
  ({
     primary_route53_health_check_id = primary_route53_health_check_id_;
     secondary_region = secondary_region_;
   }
    : failover_type)

let make_routing_type ?failover:(failover_ : failover_type option) () =
  ({ failover = failover_ } : routing_type)

let make_update_user_pool_domain_response ?routing:(routing_ : routing_type option)
    ?cloud_front_domain:(cloud_front_domain_ : domain_type option)
    ?managed_login_version:(managed_login_version_ : wrapped_integer_type option) () =
  ({
     routing = routing_;
     cloud_front_domain = cloud_front_domain_;
     managed_login_version = managed_login_version_;
   }
    : update_user_pool_domain_response)

let make_custom_domain_config_type ?security_policy:(security_policy_ : security_policy_type option)
    ~certificate_arn:(certificate_arn_ : arn_type) () =
  ({ security_policy = security_policy_; certificate_arn = certificate_arn_ }
    : custom_domain_config_type)

let make_update_user_pool_domain_request ?routing:(routing_ : routing_type option)
    ?custom_domain_config:(custom_domain_config_ : custom_domain_config_type option)
    ?managed_login_version:(managed_login_version_ : wrapped_integer_type option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) ~domain:(domain_ : domain_type) () =
  ({
     routing = routing_;
     custom_domain_config = custom_domain_config_;
     managed_login_version = managed_login_version_;
     user_pool_id = user_pool_id_;
     domain = domain_;
   }
    : update_user_pool_domain_request)

let make_update_user_pool_client_response
    ?user_pool_client:(user_pool_client_ : user_pool_client_type option) () =
  ({ user_pool_client = user_pool_client_ } : update_user_pool_client_response)

let make_update_user_pool_client_request
    ?refresh_token_rotation:(refresh_token_rotation_ : refresh_token_rotation_type option)
    ?auth_session_validity:(auth_session_validity_ : auth_session_validity_type option)
    ?enable_propagate_additional_user_context_data:
      (enable_propagate_additional_user_context_data_ : wrapped_boolean_type option)
    ?enable_token_revocation:(enable_token_revocation_ : wrapped_boolean_type option)
    ?prevent_user_existence_errors:
      (prevent_user_existence_errors_ : prevent_user_existence_error_types option)
    ?analytics_configuration:(analytics_configuration_ : analytics_configuration_type option)
    ?allowed_o_auth_flows_user_pool_client:
      (allowed_o_auth_flows_user_pool_client_ : boolean_type option)
    ?allowed_o_auth_scopes:(allowed_o_auth_scopes_ : scope_list_type option)
    ?allowed_o_auth_flows:(allowed_o_auth_flows_ : o_auth_flows_type option)
    ?default_redirect_ur_i:(default_redirect_ur_i_ : redirect_url_type option)
    ?logout_ur_ls:(logout_ur_ls_ : logout_ur_ls_list_type option)
    ?callback_ur_ls:(callback_ur_ls_ : callback_ur_ls_list_type option)
    ?supported_identity_providers:
      (supported_identity_providers_ : supported_identity_providers_list_type option)
    ?explicit_auth_flows:(explicit_auth_flows_ : explicit_auth_flows_list_type option)
    ?write_attributes:(write_attributes_ : client_permission_list_type option)
    ?read_attributes:(read_attributes_ : client_permission_list_type option)
    ?token_validity_units:(token_validity_units_ : token_validity_units_type option)
    ?id_token_validity:(id_token_validity_ : id_token_validity_type option)
    ?access_token_validity:(access_token_validity_ : access_token_validity_type option)
    ?refresh_token_validity:(refresh_token_validity_ : refresh_token_validity_type option)
    ?client_name:(client_name_ : client_name_type option) ~client_id:(client_id_ : client_id_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     refresh_token_rotation = refresh_token_rotation_;
     auth_session_validity = auth_session_validity_;
     enable_propagate_additional_user_context_data = enable_propagate_additional_user_context_data_;
     enable_token_revocation = enable_token_revocation_;
     prevent_user_existence_errors = prevent_user_existence_errors_;
     analytics_configuration = analytics_configuration_;
     allowed_o_auth_flows_user_pool_client = allowed_o_auth_flows_user_pool_client_;
     allowed_o_auth_scopes = allowed_o_auth_scopes_;
     allowed_o_auth_flows = allowed_o_auth_flows_;
     default_redirect_ur_i = default_redirect_ur_i_;
     logout_ur_ls = logout_ur_ls_;
     callback_ur_ls = callback_ur_ls_;
     supported_identity_providers = supported_identity_providers_;
     explicit_auth_flows = explicit_auth_flows_;
     write_attributes = write_attributes_;
     read_attributes = read_attributes_;
     token_validity_units = token_validity_units_;
     id_token_validity = id_token_validity_;
     access_token_validity = access_token_validity_;
     refresh_token_validity = refresh_token_validity_;
     client_name = client_name_;
     client_id = client_id_;
     user_pool_id = user_pool_id_;
   }
    : update_user_pool_client_request)

let make_code_delivery_details_type ?attribute_name:(attribute_name_ : attribute_name_type option)
    ?delivery_medium:(delivery_medium_ : delivery_medium_type option)
    ?destination:(destination_ : string_type option) () =
  ({
     attribute_name = attribute_name_;
     delivery_medium = delivery_medium_;
     destination = destination_;
   }
    : code_delivery_details_type)

let make_update_user_attributes_response
    ?code_delivery_details_list:
      (code_delivery_details_list_ : code_delivery_details_list_type option) () =
  ({ code_delivery_details_list = code_delivery_details_list_ } : update_user_attributes_response)

let make_update_user_attributes_request
    ?client_metadata:(client_metadata_ : client_metadata_type option)
    ~access_token:(access_token_ : token_model_type)
    ~user_attributes:(user_attributes_ : attribute_list_type) () =
  ({
     client_metadata = client_metadata_;
     access_token = access_token_;
     user_attributes = user_attributes_;
   }
    : update_user_attributes_request)

let make_terms_type ~last_modified_date:(last_modified_date_ : date_type)
    ~creation_date:(creation_date_ : date_type) ~links:(links_ : links_type)
    ~enforcement:(enforcement_ : terms_enforcement_type)
    ~terms_source:(terms_source_ : terms_source_type) ~terms_name:(terms_name_ : terms_name_type)
    ~client_id:(client_id_ : client_id_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type)
    ~terms_id:(terms_id_ : terms_id_type) () =
  ({
     last_modified_date = last_modified_date_;
     creation_date = creation_date_;
     links = links_;
     enforcement = enforcement_;
     terms_source = terms_source_;
     terms_name = terms_name_;
     client_id = client_id_;
     user_pool_id = user_pool_id_;
     terms_id = terms_id_;
   }
    : terms_type)

let make_update_terms_response ?terms:(terms_ : terms_type option) () =
  ({ terms = terms_ } : update_terms_response)

let make_update_terms_request ?links:(links_ : links_type option)
    ?enforcement:(enforcement_ : terms_enforcement_type option)
    ?terms_source:(terms_source_ : terms_source_type option)
    ?terms_name:(terms_name_ : terms_name_type option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) ~terms_id:(terms_id_ : terms_id_type) () =
  ({
     links = links_;
     enforcement = enforcement_;
     terms_source = terms_source_;
     terms_name = terms_name_;
     user_pool_id = user_pool_id_;
     terms_id = terms_id_;
   }
    : update_terms_request)

let make_resource_server_scope_type
    ~scope_description:(scope_description_ : resource_server_scope_description_type)
    ~scope_name:(scope_name_ : resource_server_scope_name_type) () =
  ({ scope_description = scope_description_; scope_name = scope_name_ }
    : resource_server_scope_type)

let make_resource_server_type ?scopes:(scopes_ : resource_server_scope_list_type option)
    ?name:(name_ : resource_server_name_type option)
    ?identifier:(identifier_ : resource_server_identifier_type option)
    ?user_pool_id:(user_pool_id_ : user_pool_id_type option) () =
  ({ scopes = scopes_; name = name_; identifier = identifier_; user_pool_id = user_pool_id_ }
    : resource_server_type)

let make_update_resource_server_response ~resource_server:(resource_server_ : resource_server_type)
    () =
  ({ resource_server = resource_server_ } : update_resource_server_response)

let make_update_resource_server_request ?scopes:(scopes_ : resource_server_scope_list_type option)
    ~name:(name_ : resource_server_name_type)
    ~identifier:(identifier_ : resource_server_identifier_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ scopes = scopes_; name = name_; identifier = identifier_; user_pool_id = user_pool_id_ }
    : update_resource_server_request)

let make_limit_definition_type ~attributes:(attributes_ : string_to_string_map_type)
    ~limit_class:(limit_class_ : limit_class) () =
  ({ attributes = attributes_; limit_class = limit_class_ } : limit_definition_type)

let make_limit_type ~free_limit_value:(free_limit_value_ : integer_type)
    ~provisioned_limit_value:(provisioned_limit_value_ : integer_type)
    ~limit_definition:(limit_definition_ : limit_definition_type) () =
  ({
     free_limit_value = free_limit_value_;
     provisioned_limit_value = provisioned_limit_value_;
     limit_definition = limit_definition_;
   }
    : limit_type)

let make_update_provisioned_limit_response ~limit:(limit_ : limit_type) () =
  ({ limit = limit_ } : update_provisioned_limit_response)

let make_update_provisioned_limit_request
    ~requested_limit_value:(requested_limit_value_ : integer_type)
    ~limit_definition:(limit_definition_ : limit_definition_type) () =
  ({ requested_limit_value = requested_limit_value_; limit_definition = limit_definition_ }
    : update_provisioned_limit_request)

let make_asset_type ?resource_id:(resource_id_ : resource_id_type option)
    ?bytes:(bytes_ : asset_bytes_type option) ~extension:(extension_ : asset_extension_type)
    ~color_mode:(color_mode_ : color_scheme_mode_type) ~category:(category_ : asset_category_type)
    () =
  ({
     resource_id = resource_id_;
     bytes = bytes_;
     extension = extension_;
     color_mode = color_mode_;
     category = category_;
   }
    : asset_type)

let make_managed_login_branding_type ?last_modified_date:(last_modified_date_ : date_type option)
    ?creation_date:(creation_date_ : date_type option) ?assets:(assets_ : asset_list_type option)
    ?settings:(settings_ : document option)
    ?use_cognito_provided_values:(use_cognito_provided_values_ : boolean_type option)
    ?user_pool_id:(user_pool_id_ : user_pool_id_type option)
    ?managed_login_branding_id:(managed_login_branding_id_ : managed_login_branding_id_type option)
    () =
  ({
     last_modified_date = last_modified_date_;
     creation_date = creation_date_;
     assets = assets_;
     settings = settings_;
     use_cognito_provided_values = use_cognito_provided_values_;
     user_pool_id = user_pool_id_;
     managed_login_branding_id = managed_login_branding_id_;
   }
    : managed_login_branding_type)

let make_update_managed_login_branding_response
    ?managed_login_branding:(managed_login_branding_ : managed_login_branding_type option) () =
  ({ managed_login_branding = managed_login_branding_ } : update_managed_login_branding_response)

let make_update_managed_login_branding_request ?assets:(assets_ : asset_list_type option)
    ?settings:(settings_ : document option)
    ?use_cognito_provided_values:(use_cognito_provided_values_ : boolean_type option)
    ?managed_login_branding_id:(managed_login_branding_id_ : managed_login_branding_id_type option)
    ?user_pool_id:(user_pool_id_ : user_pool_id_type option) () =
  ({
     assets = assets_;
     settings = settings_;
     use_cognito_provided_values = use_cognito_provided_values_;
     managed_login_branding_id = managed_login_branding_id_;
     user_pool_id = user_pool_id_;
   }
    : update_managed_login_branding_request)

let make_identity_provider_type ?creation_date:(creation_date_ : date_type option)
    ?last_modified_date:(last_modified_date_ : date_type option)
    ?idp_identifiers:(idp_identifiers_ : idp_identifiers_list_type option)
    ?attribute_mapping:(attribute_mapping_ : attribute_mapping_type option)
    ?provider_details:(provider_details_ : provider_details_type option)
    ?provider_type:(provider_type_ : identity_provider_type_type option)
    ?provider_name:(provider_name_ : provider_name_type option)
    ?user_pool_id:(user_pool_id_ : user_pool_id_type option) () =
  ({
     creation_date = creation_date_;
     last_modified_date = last_modified_date_;
     idp_identifiers = idp_identifiers_;
     attribute_mapping = attribute_mapping_;
     provider_details = provider_details_;
     provider_type = provider_type_;
     provider_name = provider_name_;
     user_pool_id = user_pool_id_;
   }
    : identity_provider_type)

let make_update_identity_provider_response
    ~identity_provider:(identity_provider_ : identity_provider_type) () =
  ({ identity_provider = identity_provider_ } : update_identity_provider_response)

let make_update_identity_provider_request
    ?idp_identifiers:(idp_identifiers_ : idp_identifiers_list_type option)
    ?attribute_mapping:(attribute_mapping_ : attribute_mapping_type option)
    ?provider_details:(provider_details_ : provider_details_type option)
    ~provider_name:(provider_name_ : provider_name_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     idp_identifiers = idp_identifiers_;
     attribute_mapping = attribute_mapping_;
     provider_details = provider_details_;
     provider_name = provider_name_;
     user_pool_id = user_pool_id_;
   }
    : update_identity_provider_request)

let make_group_type ?creation_date:(creation_date_ : date_type option)
    ?last_modified_date:(last_modified_date_ : date_type option)
    ?precedence:(precedence_ : precedence_type option) ?role_arn:(role_arn_ : arn_type option)
    ?description:(description_ : description_type option)
    ?user_pool_id:(user_pool_id_ : user_pool_id_type option)
    ?group_name:(group_name_ : group_name_type option) () =
  ({
     creation_date = creation_date_;
     last_modified_date = last_modified_date_;
     precedence = precedence_;
     role_arn = role_arn_;
     description = description_;
     user_pool_id = user_pool_id_;
     group_name = group_name_;
   }
    : group_type)

let make_update_group_response ?group:(group_ : group_type option) () =
  ({ group = group_ } : update_group_response)

let make_update_group_request ?precedence:(precedence_ : precedence_type option)
    ?role_arn:(role_arn_ : arn_type option) ?description:(description_ : description_type option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) ~group_name:(group_name_ : group_name_type) ()
    =
  ({
     precedence = precedence_;
     role_arn = role_arn_;
     description = description_;
     user_pool_id = user_pool_id_;
     group_name = group_name_;
   }
    : update_group_request)

let make_update_device_status_response () = (() : unit)

let make_update_device_status_request
    ?device_remembered_status:(device_remembered_status_ : device_remembered_status_type option)
    ~device_key:(device_key_ : device_key_type) ~access_token:(access_token_ : token_model_type) ()
    =
  ({
     device_remembered_status = device_remembered_status_;
     device_key = device_key_;
     access_token = access_token_;
   }
    : update_device_status_request)

let make_update_auth_event_feedback_response () = (() : unit)

let make_update_auth_event_feedback_request ~feedback_value:(feedback_value_ : feedback_value_type)
    ~feedback_token:(feedback_token_ : token_model_type) ~event_id:(event_id_ : event_id_type)
    ~username:(username_ : username_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     feedback_value = feedback_value_;
     feedback_token = feedback_token_;
     event_id = event_id_;
     username = username_;
     user_pool_id = user_pool_id_;
   }
    : update_auth_event_feedback_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : user_pool_tags_list_type)
    ~resource_arn:(resource_arn_ : arn_type) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_ui_customization_type ?creation_date:(creation_date_ : date_type option)
    ?last_modified_date:(last_modified_date_ : date_type option)
    ?css_version:(css_version_ : css_version_type option) ?cs_s:(cs_s_ : css_type option)
    ?image_url:(image_url_ : image_url_type option) ?client_id:(client_id_ : client_id_type option)
    ?user_pool_id:(user_pool_id_ : user_pool_id_type option) () =
  ({
     creation_date = creation_date_;
     last_modified_date = last_modified_date_;
     css_version = css_version_;
     cs_s = cs_s_;
     image_url = image_url_;
     client_id = client_id_;
     user_pool_id = user_pool_id_;
   }
    : ui_customization_type)

let make_terms_description_type ~last_modified_date:(last_modified_date_ : date_type)
    ~creation_date:(creation_date_ : date_type) ~enforcement:(enforcement_ : terms_enforcement_type)
    ~terms_name:(terms_name_ : terms_name_type) ~terms_id:(terms_id_ : terms_id_type) () =
  ({
     last_modified_date = last_modified_date_;
     creation_date = creation_date_;
     enforcement = enforcement_;
     terms_name = terms_name_;
     terms_id = terms_id_;
   }
    : terms_description_type)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : user_pool_tags_type)
    ~resource_arn:(resource_arn_ : arn_type) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_stop_user_import_job_response
    ?user_import_job:(user_import_job_ : user_import_job_type option) () =
  ({ user_import_job = user_import_job_ } : stop_user_import_job_response)

let make_stop_user_import_job_request ~job_id:(job_id_ : user_import_job_id_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ job_id = job_id_; user_pool_id = user_pool_id_ } : stop_user_import_job_request)

let make_start_web_authn_registration_response
    ~credential_creation_options:(credential_creation_options_ : document) () =
  ({ credential_creation_options = credential_creation_options_ }
    : start_web_authn_registration_response)

let make_start_web_authn_registration_request ~access_token:(access_token_ : token_model_type) () =
  ({ access_token = access_token_ } : start_web_authn_registration_request)

let make_start_user_import_job_response
    ?user_import_job:(user_import_job_ : user_import_job_type option) () =
  ({ user_import_job = user_import_job_ } : start_user_import_job_response)

let make_start_user_import_job_request ~job_id:(job_id_ : user_import_job_id_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ job_id = job_id_; user_pool_id = user_pool_id_ } : start_user_import_job_request)

let make_software_token_mfa_settings_type ?preferred_mfa:(preferred_mfa_ : boolean_type option)
    ?enabled:(enabled_ : boolean_type option) () =
  ({ preferred_mfa = preferred_mfa_; enabled = enabled_ } : software_token_mfa_settings_type)

let make_software_token_mfa_config_type ?enabled:(enabled_ : boolean_type option) () =
  ({ enabled = enabled_ } : software_token_mfa_config_type)

let make_sms_mfa_config_type ?sms_configuration:(sms_configuration_ : sms_configuration_type option)
    ?sms_authentication_message:(sms_authentication_message_ : sms_verification_message_type option)
    () =
  ({
     sms_configuration = sms_configuration_;
     sms_authentication_message = sms_authentication_message_;
   }
    : sms_mfa_config_type)

let make_sign_up_response ?session:(session_ : session_type option)
    ?code_delivery_details:(code_delivery_details_ : code_delivery_details_type option)
    ~user_sub:(user_sub_ : string_type) ~user_confirmed:(user_confirmed_ : boolean_type) () =
  ({
     session = session_;
     user_sub = user_sub_;
     code_delivery_details = code_delivery_details_;
     user_confirmed = user_confirmed_;
   }
    : sign_up_response)

let make_analytics_metadata_type
    ?analytics_endpoint_id:(analytics_endpoint_id_ : string_type option) () =
  ({ analytics_endpoint_id = analytics_endpoint_id_ } : analytics_metadata_type)

let make_sign_up_request ?client_metadata:(client_metadata_ : client_metadata_type option)
    ?user_context_data:(user_context_data_ : user_context_data_type option)
    ?analytics_metadata:(analytics_metadata_ : analytics_metadata_type option)
    ?validation_data:(validation_data_ : attribute_list_type option)
    ?user_attributes:(user_attributes_ : attribute_list_type option)
    ?password:(password_ : password_type option)
    ?secret_hash:(secret_hash_ : secret_hash_type option) ~username:(username_ : username_type)
    ~client_id:(client_id_ : client_id_type) () =
  ({
     client_metadata = client_metadata_;
     user_context_data = user_context_data_;
     analytics_metadata = analytics_metadata_;
     validation_data = validation_data_;
     user_attributes = user_attributes_;
     password = password_;
     username = username_;
     secret_hash = secret_hash_;
     client_id = client_id_;
   }
    : sign_up_request)

let make_set_user_settings_response () = (() : unit)

let make_set_user_settings_request ~mfa_options:(mfa_options_ : mfa_option_list_type)
    ~access_token:(access_token_ : token_model_type) () =
  ({ mfa_options = mfa_options_; access_token = access_token_ } : set_user_settings_request)

let make_email_mfa_config_type ?subject:(subject_ : email_mfa_subject_type option)
    ?message:(message_ : email_mfa_message_type option) () =
  ({ subject = subject_; message = message_ } : email_mfa_config_type)

let make_set_user_pool_mfa_config_response
    ?web_authn_configuration:(web_authn_configuration_ : web_authn_configuration_type option)
    ?mfa_configuration:(mfa_configuration_ : user_pool_mfa_type option)
    ?email_mfa_configuration:(email_mfa_configuration_ : email_mfa_config_type option)
    ?software_token_mfa_configuration:
      (software_token_mfa_configuration_ : software_token_mfa_config_type option)
    ?sms_mfa_configuration:(sms_mfa_configuration_ : sms_mfa_config_type option) () =
  ({
     web_authn_configuration = web_authn_configuration_;
     mfa_configuration = mfa_configuration_;
     email_mfa_configuration = email_mfa_configuration_;
     software_token_mfa_configuration = software_token_mfa_configuration_;
     sms_mfa_configuration = sms_mfa_configuration_;
   }
    : set_user_pool_mfa_config_response)

let make_set_user_pool_mfa_config_request
    ?web_authn_configuration:(web_authn_configuration_ : web_authn_configuration_type option)
    ?mfa_configuration:(mfa_configuration_ : user_pool_mfa_type option)
    ?email_mfa_configuration:(email_mfa_configuration_ : email_mfa_config_type option)
    ?software_token_mfa_configuration:
      (software_token_mfa_configuration_ : software_token_mfa_config_type option)
    ?sms_mfa_configuration:(sms_mfa_configuration_ : sms_mfa_config_type option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     web_authn_configuration = web_authn_configuration_;
     mfa_configuration = mfa_configuration_;
     email_mfa_configuration = email_mfa_configuration_;
     software_token_mfa_configuration = software_token_mfa_configuration_;
     sms_mfa_configuration = sms_mfa_configuration_;
     user_pool_id = user_pool_id_;
   }
    : set_user_pool_mfa_config_request)

let make_set_user_mfa_preference_response () = (() : unit)

let make_sms_mfa_settings_type ?preferred_mfa:(preferred_mfa_ : boolean_type option)
    ?enabled:(enabled_ : boolean_type option) () =
  ({ preferred_mfa = preferred_mfa_; enabled = enabled_ } : sms_mfa_settings_type)

let make_email_mfa_settings_type ?preferred_mfa:(preferred_mfa_ : boolean_type option)
    ?enabled:(enabled_ : boolean_type option) () =
  ({ preferred_mfa = preferred_mfa_; enabled = enabled_ } : email_mfa_settings_type)

let make_set_user_mfa_preference_request
    ?web_authn_mfa_settings:(web_authn_mfa_settings_ : web_authn_mfa_settings_type option)
    ?email_mfa_settings:(email_mfa_settings_ : email_mfa_settings_type option)
    ?software_token_mfa_settings:
      (software_token_mfa_settings_ : software_token_mfa_settings_type option)
    ?sms_mfa_settings:(sms_mfa_settings_ : sms_mfa_settings_type option)
    ~access_token:(access_token_ : token_model_type) () =
  ({
     access_token = access_token_;
     web_authn_mfa_settings = web_authn_mfa_settings_;
     email_mfa_settings = email_mfa_settings_;
     software_token_mfa_settings = software_token_mfa_settings_;
     sms_mfa_settings = sms_mfa_settings_;
   }
    : set_user_mfa_preference_request)

let make_set_ui_customization_response ~ui_customization:(ui_customization_ : ui_customization_type)
    () =
  ({ ui_customization = ui_customization_ } : set_ui_customization_response)

let make_set_ui_customization_request ?image_file:(image_file_ : image_file_type option)
    ?cs_s:(cs_s_ : css_type option) ?client_id:(client_id_ : client_id_type option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ image_file = image_file_; cs_s = cs_s_; client_id = client_id_; user_pool_id = user_pool_id_ }
    : set_ui_customization_request)

let make_compromised_credentials_actions_type
    ~event_action:(event_action_ : compromised_credentials_event_action_type) () =
  ({ event_action = event_action_ } : compromised_credentials_actions_type)

let make_compromised_credentials_risk_configuration_type
    ?event_filter:(event_filter_ : event_filters_type option)
    ~actions:(actions_ : compromised_credentials_actions_type) () =
  ({ actions = actions_; event_filter = event_filter_ }
    : compromised_credentials_risk_configuration_type)

let make_notify_email_type ?text_body:(text_body_ : email_notification_body_type option)
    ?html_body:(html_body_ : email_notification_body_type option)
    ~subject:(subject_ : email_notification_subject_type) () =
  ({ text_body = text_body_; html_body = html_body_; subject = subject_ } : notify_email_type)

let make_notify_configuration_type ?mfa_email:(mfa_email_ : notify_email_type option)
    ?no_action_email:(no_action_email_ : notify_email_type option)
    ?block_email:(block_email_ : notify_email_type option)
    ?reply_to:(reply_to_ : string_type option) ?from_:(from__ : string_type option)
    ~source_arn:(source_arn_ : arn_type) () =
  ({
     mfa_email = mfa_email_;
     no_action_email = no_action_email_;
     block_email = block_email_;
     source_arn = source_arn_;
     reply_to = reply_to_;
     from_ = from__;
   }
    : notify_configuration_type)

let make_account_takeover_action_type
    ~event_action:(event_action_ : account_takeover_event_action_type)
    ~notify:(notify_ : account_takeover_action_notify_type) () =
  ({ event_action = event_action_; notify = notify_ } : account_takeover_action_type)

let make_account_takeover_actions_type
    ?high_action:(high_action_ : account_takeover_action_type option)
    ?medium_action:(medium_action_ : account_takeover_action_type option)
    ?low_action:(low_action_ : account_takeover_action_type option) () =
  ({ high_action = high_action_; medium_action = medium_action_; low_action = low_action_ }
    : account_takeover_actions_type)

let make_account_takeover_risk_configuration_type
    ?notify_configuration:(notify_configuration_ : notify_configuration_type option)
    ~actions:(actions_ : account_takeover_actions_type) () =
  ({ actions = actions_; notify_configuration = notify_configuration_ }
    : account_takeover_risk_configuration_type)

let make_risk_exception_configuration_type
    ?skipped_ip_range_list:(skipped_ip_range_list_ : skipped_ip_range_list_type option)
    ?blocked_ip_range_list:(blocked_ip_range_list_ : blocked_ip_range_list_type option) () =
  ({
     skipped_ip_range_list = skipped_ip_range_list_;
     blocked_ip_range_list = blocked_ip_range_list_;
   }
    : risk_exception_configuration_type)

let make_risk_configuration_type ?last_modified_date:(last_modified_date_ : date_type option)
    ?risk_exception_configuration:
      (risk_exception_configuration_ : risk_exception_configuration_type option)
    ?account_takeover_risk_configuration:
      (account_takeover_risk_configuration_ : account_takeover_risk_configuration_type option)
    ?compromised_credentials_risk_configuration:
      (compromised_credentials_risk_configuration_ :
         compromised_credentials_risk_configuration_type option)
    ?client_id:(client_id_ : client_id_type option)
    ?user_pool_id:(user_pool_id_ : user_pool_id_type option) () =
  ({
     last_modified_date = last_modified_date_;
     risk_exception_configuration = risk_exception_configuration_;
     account_takeover_risk_configuration = account_takeover_risk_configuration_;
     compromised_credentials_risk_configuration = compromised_credentials_risk_configuration_;
     client_id = client_id_;
     user_pool_id = user_pool_id_;
   }
    : risk_configuration_type)

let make_set_risk_configuration_response
    ~risk_configuration:(risk_configuration_ : risk_configuration_type) () =
  ({ risk_configuration = risk_configuration_ } : set_risk_configuration_response)

let make_set_risk_configuration_request
    ?risk_exception_configuration:
      (risk_exception_configuration_ : risk_exception_configuration_type option)
    ?account_takeover_risk_configuration:
      (account_takeover_risk_configuration_ : account_takeover_risk_configuration_type option)
    ?compromised_credentials_risk_configuration:
      (compromised_credentials_risk_configuration_ :
         compromised_credentials_risk_configuration_type option)
    ?client_id:(client_id_ : client_id_type option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     risk_exception_configuration = risk_exception_configuration_;
     account_takeover_risk_configuration = account_takeover_risk_configuration_;
     compromised_credentials_risk_configuration = compromised_credentials_risk_configuration_;
     client_id = client_id_;
     user_pool_id = user_pool_id_;
   }
    : set_risk_configuration_request)

let make_cloud_watch_logs_configuration_type ?log_group_arn:(log_group_arn_ : arn_type option) () =
  ({ log_group_arn = log_group_arn_ } : cloud_watch_logs_configuration_type)

let make_s3_configuration_type ?bucket_arn:(bucket_arn_ : s3_arn_type option) () =
  ({ bucket_arn = bucket_arn_ } : s3_configuration_type)

let make_firehose_configuration_type ?stream_arn:(stream_arn_ : arn_type option) () =
  ({ stream_arn = stream_arn_ } : firehose_configuration_type)

let make_log_configuration_type
    ?firehose_configuration:(firehose_configuration_ : firehose_configuration_type option)
    ?s3_configuration:(s3_configuration_ : s3_configuration_type option)
    ?cloud_watch_logs_configuration:
      (cloud_watch_logs_configuration_ : cloud_watch_logs_configuration_type option)
    ~event_source:(event_source_ : event_source_name) ~log_level:(log_level_ : log_level) () =
  ({
     firehose_configuration = firehose_configuration_;
     s3_configuration = s3_configuration_;
     cloud_watch_logs_configuration = cloud_watch_logs_configuration_;
     event_source = event_source_;
     log_level = log_level_;
   }
    : log_configuration_type)

let make_log_delivery_configuration_type
    ~log_configurations:(log_configurations_ : log_configuration_list_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ log_configurations = log_configurations_; user_pool_id = user_pool_id_ }
    : log_delivery_configuration_type)

let make_set_log_delivery_configuration_response
    ?log_delivery_configuration:
      (log_delivery_configuration_ : log_delivery_configuration_type option) () =
  ({ log_delivery_configuration = log_delivery_configuration_ }
    : set_log_delivery_configuration_response)

let make_set_log_delivery_configuration_request
    ~log_configurations:(log_configurations_ : log_configuration_list_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ log_configurations = log_configurations_; user_pool_id = user_pool_id_ }
    : set_log_delivery_configuration_request)

let make_revoke_token_response () = (() : unit)

let make_revoke_token_request ?client_secret:(client_secret_ : client_secret_type option)
    ~client_id:(client_id_ : client_id_type) ~token:(token_ : token_model_type) () =
  ({ client_secret = client_secret_; client_id = client_id_; token = token_ }
    : revoke_token_request)

let make_new_device_metadata_type ?device_group_key:(device_group_key_ : string_type option)
    ?device_key:(device_key_ : device_key_type option) () =
  ({ device_group_key = device_group_key_; device_key = device_key_ } : new_device_metadata_type)

let make_authentication_result_type
    ?new_device_metadata:(new_device_metadata_ : new_device_metadata_type option)
    ?id_token:(id_token_ : token_model_type option)
    ?refresh_token:(refresh_token_ : token_model_type option)
    ?token_type:(token_type_ : string_type option) ?expires_in:(expires_in_ : integer_type option)
    ?access_token:(access_token_ : token_model_type option) () =
  ({
     new_device_metadata = new_device_metadata_;
     id_token = id_token_;
     refresh_token = refresh_token_;
     token_type = token_type_;
     expires_in = expires_in_;
     access_token = access_token_;
   }
    : authentication_result_type)

let make_respond_to_auth_challenge_response
    ?authentication_result:(authentication_result_ : authentication_result_type option)
    ?challenge_parameters:(challenge_parameters_ : challenge_parameters_type option)
    ?session:(session_ : session_type option)
    ?challenge_name:(challenge_name_ : challenge_name_type option) () =
  ({
     authentication_result = authentication_result_;
     challenge_parameters = challenge_parameters_;
     session = session_;
     challenge_name = challenge_name_;
   }
    : respond_to_auth_challenge_response)

let make_respond_to_auth_challenge_request
    ?client_metadata:(client_metadata_ : client_metadata_type option)
    ?user_context_data:(user_context_data_ : user_context_data_type option)
    ?analytics_metadata:(analytics_metadata_ : analytics_metadata_type option)
    ?challenge_responses:(challenge_responses_ : challenge_responses_type option)
    ?session:(session_ : session_type option)
    ~challenge_name:(challenge_name_ : challenge_name_type) ~client_id:(client_id_ : client_id_type)
    () =
  ({
     client_metadata = client_metadata_;
     user_context_data = user_context_data_;
     analytics_metadata = analytics_metadata_;
     challenge_responses = challenge_responses_;
     session = session_;
     challenge_name = challenge_name_;
     client_id = client_id_;
   }
    : respond_to_auth_challenge_request)

let make_resend_confirmation_code_response
    ?code_delivery_details:(code_delivery_details_ : code_delivery_details_type option) () =
  ({ code_delivery_details = code_delivery_details_ } : resend_confirmation_code_response)

let make_resend_confirmation_code_request
    ?client_metadata:(client_metadata_ : client_metadata_type option)
    ?analytics_metadata:(analytics_metadata_ : analytics_metadata_type option)
    ?user_context_data:(user_context_data_ : user_context_data_type option)
    ?secret_hash:(secret_hash_ : secret_hash_type option) ~username:(username_ : username_type)
    ~client_id:(client_id_ : client_id_type) () =
  ({
     client_metadata = client_metadata_;
     analytics_metadata = analytics_metadata_;
     username = username_;
     user_context_data = user_context_data_;
     secret_hash = secret_hash_;
     client_id = client_id_;
   }
    : resend_confirmation_code_request)

let make_provider_description ?creation_date:(creation_date_ : date_type option)
    ?last_modified_date:(last_modified_date_ : date_type option)
    ?provider_type:(provider_type_ : identity_provider_type_type option)
    ?provider_name:(provider_name_ : provider_name_type option) () =
  ({
     creation_date = creation_date_;
     last_modified_date = last_modified_date_;
     provider_type = provider_type_;
     provider_name = provider_name_;
   }
    : provider_description)

let make_provider_user_identifier_type
    ?provider_attribute_value:(provider_attribute_value_ : string_type option)
    ?provider_attribute_name:(provider_attribute_name_ : string_type option)
    ?provider_name:(provider_name_ : provider_name_type option) () =
  ({
     provider_attribute_value = provider_attribute_value_;
     provider_attribute_name = provider_attribute_name_;
     provider_name = provider_name_;
   }
    : provider_user_identifier_type)

let make_list_web_authn_credentials_response ?next_token:(next_token_ : pagination_key option)
    ~credentials:(credentials_ : web_authn_credential_description_list_type) () =
  ({ next_token = next_token_; credentials = credentials_ } : list_web_authn_credentials_response)

let make_list_web_authn_credentials_request
    ?max_results:(max_results_ : web_authn_credentials_query_limit_type option)
    ?next_token:(next_token_ : pagination_key option)
    ~access_token:(access_token_ : token_model_type) () =
  ({ max_results = max_results_; next_token = next_token_; access_token = access_token_ }
    : list_web_authn_credentials_request)

let make_list_users_response
    ?pagination_token:(pagination_token_ : search_pagination_token_type option)
    ?users:(users_ : users_list_type option) () =
  ({ pagination_token = pagination_token_; users = users_ } : list_users_response)

let make_list_users_request ?filter:(filter_ : user_filter_type option)
    ?pagination_token:(pagination_token_ : search_pagination_token_type option)
    ?limit:(limit_ : query_limit_type option)
    ?attributes_to_get:(attributes_to_get_ : searched_attribute_names_list_type option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     filter = filter_;
     pagination_token = pagination_token_;
     limit = limit_;
     attributes_to_get = attributes_to_get_;
     user_pool_id = user_pool_id_;
   }
    : list_users_request)

let make_list_users_in_group_response ?next_token:(next_token_ : pagination_key option)
    ?users:(users_ : users_list_type option) () =
  ({ next_token = next_token_; users = users_ } : list_users_in_group_response)

let make_list_users_in_group_request ?next_token:(next_token_ : pagination_key option)
    ?limit:(limit_ : query_limit_type option) ~group_name:(group_name_ : group_name_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     next_token = next_token_;
     limit = limit_;
     group_name = group_name_;
     user_pool_id = user_pool_id_;
   }
    : list_users_in_group_request)

let make_list_user_pools_response ?next_token:(next_token_ : pagination_key_type option)
    ?user_pools:(user_pools_ : user_pool_list_type option) () =
  ({ next_token = next_token_; user_pools = user_pools_ } : list_user_pools_response)

let make_list_user_pools_request ?next_token:(next_token_ : pagination_key_type option)
    ~max_results:(max_results_ : pool_query_limit_type) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_user_pools_request)

let make_list_user_pool_replicas_response ?next_token:(next_token_ : pagination_key_type option)
    ?user_pool_replicas:(user_pool_replicas_ : user_pool_replica_list_type option) () =
  ({ next_token = next_token_; user_pool_replicas = user_pool_replicas_ }
    : list_user_pool_replicas_response)

let make_list_user_pool_replicas_request ?next_token:(next_token_ : pagination_key_type option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ next_token = next_token_; user_pool_id = user_pool_id_ } : list_user_pool_replicas_request)

let make_list_user_pool_clients_response ?next_token:(next_token_ : pagination_key option)
    ?user_pool_clients:(user_pool_clients_ : user_pool_client_list_type option) () =
  ({ next_token = next_token_; user_pool_clients = user_pool_clients_ }
    : list_user_pool_clients_response)

let make_list_user_pool_clients_request ?next_token:(next_token_ : pagination_key option)
    ?max_results:(max_results_ : query_limit option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ next_token = next_token_; max_results = max_results_; user_pool_id = user_pool_id_ }
    : list_user_pool_clients_request)

let make_client_secret_descriptor_type
    ?client_secret_create_date:(client_secret_create_date_ : date_type option)
    ?client_secret_value:(client_secret_value_ : client_secret_type option)
    ?client_secret_id:(client_secret_id_ : client_secret_id_type option) () =
  ({
     client_secret_create_date = client_secret_create_date_;
     client_secret_value = client_secret_value_;
     client_secret_id = client_secret_id_;
   }
    : client_secret_descriptor_type)

let make_list_user_pool_client_secrets_response ?next_token:(next_token_ : pagination_key option)
    ?client_secrets:(client_secrets_ : client_secret_descriptor_list_type option) () =
  ({ next_token = next_token_; client_secrets = client_secrets_ }
    : list_user_pool_client_secrets_response)

let make_list_user_pool_client_secrets_request ?next_token:(next_token_ : pagination_key option)
    ~client_id:(client_id_ : client_id_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ next_token = next_token_; client_id = client_id_; user_pool_id = user_pool_id_ }
    : list_user_pool_client_secrets_request)

let make_list_user_import_jobs_response
    ?pagination_token:(pagination_token_ : pagination_key_type option)
    ?user_import_jobs:(user_import_jobs_ : user_import_jobs_list_type option) () =
  ({ pagination_token = pagination_token_; user_import_jobs = user_import_jobs_ }
    : list_user_import_jobs_response)

let make_list_user_import_jobs_request
    ?pagination_token:(pagination_token_ : pagination_key_type option)
    ~max_results:(max_results_ : pool_query_limit_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     pagination_token = pagination_token_;
     max_results = max_results_;
     user_pool_id = user_pool_id_;
   }
    : list_user_import_jobs_request)

let make_list_terms_response ?next_token:(next_token_ : string_type option)
    ~terms:(terms_ : terms_description_list_type) () =
  ({ next_token = next_token_; terms = terms_ } : list_terms_response)

let make_list_terms_request ?next_token:(next_token_ : string_type option)
    ?max_results:(max_results_ : list_terms_request_max_results_integer option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ next_token = next_token_; max_results = max_results_; user_pool_id = user_pool_id_ }
    : list_terms_request)

let make_list_tags_for_resource_response ?tags:(tags_ : user_pool_tags_type option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn_type) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_resource_servers_response ?next_token:(next_token_ : pagination_key_type option)
    ~resource_servers:(resource_servers_ : resource_servers_list_type) () =
  ({ next_token = next_token_; resource_servers = resource_servers_ }
    : list_resource_servers_response)

let make_list_resource_servers_request ?next_token:(next_token_ : pagination_key_type option)
    ?max_results:(max_results_ : list_resource_servers_limit_type option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ next_token = next_token_; max_results = max_results_; user_pool_id = user_pool_id_ }
    : list_resource_servers_request)

let make_list_identity_providers_response ?next_token:(next_token_ : pagination_key_type option)
    ~providers:(providers_ : providers_list_type) () =
  ({ next_token = next_token_; providers = providers_ } : list_identity_providers_response)

let make_list_identity_providers_request ?next_token:(next_token_ : pagination_key_type option)
    ?max_results:(max_results_ : list_providers_limit_type option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ next_token = next_token_; max_results = max_results_; user_pool_id = user_pool_id_ }
    : list_identity_providers_request)

let make_list_groups_response ?next_token:(next_token_ : pagination_key option)
    ?groups:(groups_ : group_list_type option) () =
  ({ next_token = next_token_; groups = groups_ } : list_groups_response)

let make_list_groups_request ?next_token:(next_token_ : pagination_key option)
    ?limit:(limit_ : query_limit_type option) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ next_token = next_token_; limit = limit_; user_pool_id = user_pool_id_ } : list_groups_request)

let make_device_type
    ?device_last_authenticated_date:(device_last_authenticated_date_ : date_type option)
    ?device_last_modified_date:(device_last_modified_date_ : date_type option)
    ?device_create_date:(device_create_date_ : date_type option)
    ?device_attributes:(device_attributes_ : attribute_list_type option)
    ?device_key:(device_key_ : device_key_type option) () =
  ({
     device_last_authenticated_date = device_last_authenticated_date_;
     device_last_modified_date = device_last_modified_date_;
     device_create_date = device_create_date_;
     device_attributes = device_attributes_;
     device_key = device_key_;
   }
    : device_type)

let make_list_devices_response
    ?pagination_token:(pagination_token_ : search_pagination_token_type option)
    ?devices:(devices_ : device_list_type option) () =
  ({ pagination_token = pagination_token_; devices = devices_ } : list_devices_response)

let make_list_devices_request
    ?pagination_token:(pagination_token_ : search_pagination_token_type option)
    ?limit:(limit_ : query_limit_type option) ~access_token:(access_token_ : token_model_type) () =
  ({ pagination_token = pagination_token_; limit = limit_; access_token = access_token_ }
    : list_devices_request)

let make_initiate_auth_response
    ?available_challenges:(available_challenges_ : available_challenge_list_type option)
    ?authentication_result:(authentication_result_ : authentication_result_type option)
    ?challenge_parameters:(challenge_parameters_ : challenge_parameters_type option)
    ?session:(session_ : session_type option)
    ?challenge_name:(challenge_name_ : challenge_name_type option) () =
  ({
     available_challenges = available_challenges_;
     authentication_result = authentication_result_;
     challenge_parameters = challenge_parameters_;
     session = session_;
     challenge_name = challenge_name_;
   }
    : initiate_auth_response)

let make_initiate_auth_request ?session:(session_ : session_type option)
    ?user_context_data:(user_context_data_ : user_context_data_type option)
    ?analytics_metadata:(analytics_metadata_ : analytics_metadata_type option)
    ?client_metadata:(client_metadata_ : client_metadata_type option)
    ?auth_parameters:(auth_parameters_ : auth_parameters_type option)
    ~client_id:(client_id_ : client_id_type) ~auth_flow:(auth_flow_ : auth_flow_type) () =
  ({
     session = session_;
     user_context_data = user_context_data_;
     analytics_metadata = analytics_metadata_;
     client_id = client_id_;
     client_metadata = client_metadata_;
     auth_parameters = auth_parameters_;
     auth_flow = auth_flow_;
   }
    : initiate_auth_request)

let make_http_header ?header_value:(header_value_ : string_type option)
    ?header_name:(header_name_ : string_type option) () =
  ({ header_value = header_value_; header_name = header_name_ } : http_header)

let make_global_sign_out_response () = (() : unit)

let make_global_sign_out_request ~access_token:(access_token_ : token_model_type) () =
  ({ access_token = access_token_ } : global_sign_out_request)

let make_get_user_response
    ?user_mfa_setting_list:(user_mfa_setting_list_ : user_mfa_setting_list_type option)
    ?preferred_mfa_setting:(preferred_mfa_setting_ : string_type option)
    ?mfa_options:(mfa_options_ : mfa_option_list_type option)
    ~user_attributes:(user_attributes_ : attribute_list_type) ~username:(username_ : username_type)
    () =
  ({
     user_mfa_setting_list = user_mfa_setting_list_;
     preferred_mfa_setting = preferred_mfa_setting_;
     mfa_options = mfa_options_;
     user_attributes = user_attributes_;
     username = username_;
   }
    : get_user_response)

let make_get_user_request ~access_token:(access_token_ : token_model_type) () =
  ({ access_token = access_token_ } : get_user_request)

let make_get_user_pool_mfa_config_response
    ?web_authn_configuration:(web_authn_configuration_ : web_authn_configuration_type option)
    ?mfa_configuration:(mfa_configuration_ : user_pool_mfa_type option)
    ?email_mfa_configuration:(email_mfa_configuration_ : email_mfa_config_type option)
    ?software_token_mfa_configuration:
      (software_token_mfa_configuration_ : software_token_mfa_config_type option)
    ?sms_mfa_configuration:(sms_mfa_configuration_ : sms_mfa_config_type option) () =
  ({
     web_authn_configuration = web_authn_configuration_;
     mfa_configuration = mfa_configuration_;
     email_mfa_configuration = email_mfa_configuration_;
     software_token_mfa_configuration = software_token_mfa_configuration_;
     sms_mfa_configuration = sms_mfa_configuration_;
   }
    : get_user_pool_mfa_config_response)

let make_get_user_pool_mfa_config_request ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ user_pool_id = user_pool_id_ } : get_user_pool_mfa_config_request)

let make_get_user_auth_factors_response
    ?configured_user_auth_factors:
      (configured_user_auth_factors_ : configured_user_auth_factors_list_type option)
    ?user_mfa_setting_list:(user_mfa_setting_list_ : user_mfa_setting_list_type option)
    ?preferred_mfa_setting:(preferred_mfa_setting_ : string_type option)
    ~username:(username_ : username_type) () =
  ({
     configured_user_auth_factors = configured_user_auth_factors_;
     user_mfa_setting_list = user_mfa_setting_list_;
     preferred_mfa_setting = preferred_mfa_setting_;
     username = username_;
   }
    : get_user_auth_factors_response)

let make_get_user_auth_factors_request ~access_token:(access_token_ : token_model_type) () =
  ({ access_token = access_token_ } : get_user_auth_factors_request)

let make_get_user_attribute_verification_code_response
    ?code_delivery_details:(code_delivery_details_ : code_delivery_details_type option) () =
  ({ code_delivery_details = code_delivery_details_ }
    : get_user_attribute_verification_code_response)

let make_get_user_attribute_verification_code_request
    ?client_metadata:(client_metadata_ : client_metadata_type option)
    ~attribute_name:(attribute_name_ : attribute_name_type)
    ~access_token:(access_token_ : token_model_type) () =
  ({
     client_metadata = client_metadata_;
     attribute_name = attribute_name_;
     access_token = access_token_;
   }
    : get_user_attribute_verification_code_request)

let make_get_ui_customization_response ~ui_customization:(ui_customization_ : ui_customization_type)
    () =
  ({ ui_customization = ui_customization_ } : get_ui_customization_response)

let make_get_ui_customization_request ?client_id:(client_id_ : client_id_type option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ client_id = client_id_; user_pool_id = user_pool_id_ } : get_ui_customization_request)

let make_get_tokens_from_refresh_token_response
    ?authentication_result:(authentication_result_ : authentication_result_type option) () =
  ({ authentication_result = authentication_result_ } : get_tokens_from_refresh_token_response)

let make_get_tokens_from_refresh_token_request
    ?client_metadata:(client_metadata_ : client_metadata_type option)
    ?device_key:(device_key_ : device_key_type option)
    ?client_secret:(client_secret_ : client_secret_type option)
    ~client_id:(client_id_ : client_id_type) ~refresh_token:(refresh_token_ : token_model_type) () =
  ({
     client_metadata = client_metadata_;
     device_key = device_key_;
     client_secret = client_secret_;
     client_id = client_id_;
     refresh_token = refresh_token_;
   }
    : get_tokens_from_refresh_token_request)

let make_get_signing_certificate_response ?certificate:(certificate_ : string_type option) () =
  ({ certificate = certificate_ } : get_signing_certificate_response)

let make_get_signing_certificate_request ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ user_pool_id = user_pool_id_ } : get_signing_certificate_request)

let make_get_provisioned_limit_response ~limit:(limit_ : limit_type) () =
  ({ limit = limit_ } : get_provisioned_limit_response)

let make_get_provisioned_limit_request ~limit_definition:(limit_definition_ : limit_definition_type)
    () =
  ({ limit_definition = limit_definition_ } : get_provisioned_limit_request)

let make_get_log_delivery_configuration_response
    ?log_delivery_configuration:
      (log_delivery_configuration_ : log_delivery_configuration_type option) () =
  ({ log_delivery_configuration = log_delivery_configuration_ }
    : get_log_delivery_configuration_response)

let make_get_log_delivery_configuration_request ~user_pool_id:(user_pool_id_ : user_pool_id_type) ()
    =
  ({ user_pool_id = user_pool_id_ } : get_log_delivery_configuration_request)

let make_get_identity_provider_by_identifier_response
    ~identity_provider:(identity_provider_ : identity_provider_type) () =
  ({ identity_provider = identity_provider_ } : get_identity_provider_by_identifier_response)

let make_get_identity_provider_by_identifier_request
    ~idp_identifier:(idp_identifier_ : idp_identifier_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ idp_identifier = idp_identifier_; user_pool_id = user_pool_id_ }
    : get_identity_provider_by_identifier_request)

let make_get_group_response ?group:(group_ : group_type option) () =
  ({ group = group_ } : get_group_response)

let make_get_group_request ~user_pool_id:(user_pool_id_ : user_pool_id_type)
    ~group_name:(group_name_ : group_name_type) () =
  ({ user_pool_id = user_pool_id_; group_name = group_name_ } : get_group_request)

let make_get_device_response ~device:(device_ : device_type) () =
  ({ device = device_ } : get_device_response)

let make_get_device_request ?access_token:(access_token_ : token_model_type option)
    ~device_key:(device_key_ : device_key_type) () =
  ({ access_token = access_token_; device_key = device_key_ } : get_device_request)

let make_get_csv_header_response ?csv_header:(csv_header_ : list_of_string_types option)
    ?user_pool_id:(user_pool_id_ : user_pool_id_type option) () =
  ({ csv_header = csv_header_; user_pool_id = user_pool_id_ } : get_csv_header_response)

let make_get_csv_header_request ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ user_pool_id = user_pool_id_ } : get_csv_header_request)

let make_forgot_password_response
    ?code_delivery_details:(code_delivery_details_ : code_delivery_details_type option) () =
  ({ code_delivery_details = code_delivery_details_ } : forgot_password_response)

let make_forgot_password_request ?client_metadata:(client_metadata_ : client_metadata_type option)
    ?analytics_metadata:(analytics_metadata_ : analytics_metadata_type option)
    ?user_context_data:(user_context_data_ : user_context_data_type option)
    ?secret_hash:(secret_hash_ : secret_hash_type option) ~username:(username_ : username_type)
    ~client_id:(client_id_ : client_id_type) () =
  ({
     client_metadata = client_metadata_;
     analytics_metadata = analytics_metadata_;
     username = username_;
     user_context_data = user_context_data_;
     secret_hash = secret_hash_;
     client_id = client_id_;
   }
    : forgot_password_request)

let make_forget_device_request ?access_token:(access_token_ : token_model_type option)
    ~device_key:(device_key_ : device_key_type) () =
  ({ device_key = device_key_; access_token = access_token_ } : forget_device_request)

let make_event_risk_type
    ?compromised_credentials_detected:
      (compromised_credentials_detected_ : wrapped_boolean_type option)
    ?risk_level:(risk_level_ : risk_level_type option)
    ?risk_decision:(risk_decision_ : risk_decision_type option) () =
  ({
     compromised_credentials_detected = compromised_credentials_detected_;
     risk_level = risk_level_;
     risk_decision = risk_decision_;
   }
    : event_risk_type)

let make_event_feedback_type ?feedback_date:(feedback_date_ : date_type option)
    ~provider:(provider_ : string_type) ~feedback_value:(feedback_value_ : feedback_value_type) () =
  ({ feedback_date = feedback_date_; provider = provider_; feedback_value = feedback_value_ }
    : event_feedback_type)

let make_event_context_data_type ?country:(country_ : string_type option)
    ?city:(city_ : string_type option) ?timezone:(timezone_ : string_type option)
    ?device_name:(device_name_ : string_type option) ?ip_address:(ip_address_ : string_type option)
    () =
  ({
     country = country_;
     city = city_;
     timezone = timezone_;
     device_name = device_name_;
     ip_address = ip_address_;
   }
    : event_context_data_type)

let make_domain_description_type ?routing:(routing_ : routing_type option)
    ?managed_login_version:(managed_login_version_ : wrapped_integer_type option)
    ?custom_domain_config:(custom_domain_config_ : custom_domain_config_type option)
    ?status:(status_ : domain_status_type option) ?version:(version_ : domain_version_type option)
    ?cloud_front_distribution:(cloud_front_distribution_ : string_type option)
    ?s3_bucket:(s3_bucket_ : s3_bucket_type option) ?domain:(domain_ : domain_type option)
    ?aws_account_id:(aws_account_id_ : aws_account_id_type option)
    ?user_pool_id:(user_pool_id_ : user_pool_id_type option) () =
  ({
     routing = routing_;
     managed_login_version = managed_login_version_;
     custom_domain_config = custom_domain_config_;
     status = status_;
     version = version_;
     cloud_front_distribution = cloud_front_distribution_;
     s3_bucket = s3_bucket_;
     domain = domain_;
     aws_account_id = aws_account_id_;
     user_pool_id = user_pool_id_;
   }
    : domain_description_type)

let make_device_secret_verifier_config_type ?salt:(salt_ : string_type option)
    ?password_verifier:(password_verifier_ : string_type option) () =
  ({ salt = salt_; password_verifier = password_verifier_ } : device_secret_verifier_config_type)

let make_describe_user_pool_response ?user_pool:(user_pool_ : user_pool_type option) () =
  ({ user_pool = user_pool_ } : describe_user_pool_response)

let make_describe_user_pool_request ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ user_pool_id = user_pool_id_ } : describe_user_pool_request)

let make_describe_user_pool_domain_response
    ?domain_description:(domain_description_ : domain_description_type option) () =
  ({ domain_description = domain_description_ } : describe_user_pool_domain_response)

let make_describe_user_pool_domain_request ~domain:(domain_ : domain_type) () =
  ({ domain = domain_ } : describe_user_pool_domain_request)

let make_describe_user_pool_client_response
    ?user_pool_client:(user_pool_client_ : user_pool_client_type option) () =
  ({ user_pool_client = user_pool_client_ } : describe_user_pool_client_response)

let make_describe_user_pool_client_request ~client_id:(client_id_ : client_id_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ client_id = client_id_; user_pool_id = user_pool_id_ } : describe_user_pool_client_request)

let make_describe_user_import_job_response
    ?user_import_job:(user_import_job_ : user_import_job_type option) () =
  ({ user_import_job = user_import_job_ } : describe_user_import_job_response)

let make_describe_user_import_job_request ~job_id:(job_id_ : user_import_job_id_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ job_id = job_id_; user_pool_id = user_pool_id_ } : describe_user_import_job_request)

let make_describe_terms_response ?terms:(terms_ : terms_type option) () =
  ({ terms = terms_ } : describe_terms_response)

let make_describe_terms_request ~user_pool_id:(user_pool_id_ : user_pool_id_type)
    ~terms_id:(terms_id_ : terms_id_type) () =
  ({ user_pool_id = user_pool_id_; terms_id = terms_id_ } : describe_terms_request)

let make_describe_risk_configuration_response
    ~risk_configuration:(risk_configuration_ : risk_configuration_type) () =
  ({ risk_configuration = risk_configuration_ } : describe_risk_configuration_response)

let make_describe_risk_configuration_request ?client_id:(client_id_ : client_id_type option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ client_id = client_id_; user_pool_id = user_pool_id_ } : describe_risk_configuration_request)

let make_describe_resource_server_response
    ~resource_server:(resource_server_ : resource_server_type) () =
  ({ resource_server = resource_server_ } : describe_resource_server_response)

let make_describe_resource_server_request
    ~identifier:(identifier_ : resource_server_identifier_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ identifier = identifier_; user_pool_id = user_pool_id_ } : describe_resource_server_request)

let make_describe_managed_login_branding_response
    ?managed_login_branding:(managed_login_branding_ : managed_login_branding_type option) () =
  ({ managed_login_branding = managed_login_branding_ } : describe_managed_login_branding_response)

let make_describe_managed_login_branding_request
    ?return_merged_resources:(return_merged_resources_ : boolean_type option)
    ~managed_login_branding_id:(managed_login_branding_id_ : managed_login_branding_id_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     return_merged_resources = return_merged_resources_;
     managed_login_branding_id = managed_login_branding_id_;
     user_pool_id = user_pool_id_;
   }
    : describe_managed_login_branding_request)

let make_describe_managed_login_branding_by_client_response
    ?managed_login_branding:(managed_login_branding_ : managed_login_branding_type option) () =
  ({ managed_login_branding = managed_login_branding_ }
    : describe_managed_login_branding_by_client_response)

let make_describe_managed_login_branding_by_client_request
    ?return_merged_resources:(return_merged_resources_ : boolean_type option)
    ~client_id:(client_id_ : client_id_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     return_merged_resources = return_merged_resources_;
     client_id = client_id_;
     user_pool_id = user_pool_id_;
   }
    : describe_managed_login_branding_by_client_request)

let make_describe_identity_provider_response
    ~identity_provider:(identity_provider_ : identity_provider_type) () =
  ({ identity_provider = identity_provider_ } : describe_identity_provider_response)

let make_describe_identity_provider_request ~provider_name:(provider_name_ : provider_name_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ provider_name = provider_name_; user_pool_id = user_pool_id_ }
    : describe_identity_provider_request)

let make_delete_web_authn_credential_response () = (() : unit)

let make_delete_web_authn_credential_request ~credential_id:(credential_id_ : string_type)
    ~access_token:(access_token_ : token_model_type) () =
  ({ credential_id = credential_id_; access_token = access_token_ }
    : delete_web_authn_credential_request)

let make_delete_user_request ~access_token:(access_token_ : token_model_type) () =
  ({ access_token = access_token_ } : delete_user_request)

let make_delete_user_pool_request ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ user_pool_id = user_pool_id_ } : delete_user_pool_request)

let make_delete_user_pool_replica_response
    ?user_pool_replica:(user_pool_replica_ : user_pool_replica_type option) () =
  ({ user_pool_replica = user_pool_replica_ } : delete_user_pool_replica_response)

let make_delete_user_pool_replica_request ~region_name:(region_name_ : region_name_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ region_name = region_name_; user_pool_id = user_pool_id_ } : delete_user_pool_replica_request)

let make_delete_user_pool_domain_response () = (() : unit)

let make_delete_user_pool_domain_request ~user_pool_id:(user_pool_id_ : user_pool_id_type)
    ~domain:(domain_ : domain_type) () =
  ({ user_pool_id = user_pool_id_; domain = domain_ } : delete_user_pool_domain_request)

let make_delete_user_pool_client_secret_response () = (() : unit)

let make_delete_user_pool_client_secret_request
    ~client_secret_id:(client_secret_id_ : client_secret_id_type)
    ~client_id:(client_id_ : client_id_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ client_secret_id = client_secret_id_; client_id = client_id_; user_pool_id = user_pool_id_ }
    : delete_user_pool_client_secret_request)

let make_delete_user_pool_client_request ~client_id:(client_id_ : client_id_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ client_id = client_id_; user_pool_id = user_pool_id_ } : delete_user_pool_client_request)

let make_delete_user_attributes_response () = (() : unit)

let make_delete_user_attributes_request ~access_token:(access_token_ : token_model_type)
    ~user_attribute_names:(user_attribute_names_ : attribute_name_list_type) () =
  ({ access_token = access_token_; user_attribute_names = user_attribute_names_ }
    : delete_user_attributes_request)

let make_delete_terms_request ~user_pool_id:(user_pool_id_ : user_pool_id_type)
    ~terms_id:(terms_id_ : terms_id_type) () =
  ({ user_pool_id = user_pool_id_; terms_id = terms_id_ } : delete_terms_request)

let make_delete_resource_server_request ~identifier:(identifier_ : resource_server_identifier_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ identifier = identifier_; user_pool_id = user_pool_id_ } : delete_resource_server_request)

let make_delete_managed_login_branding_request ~user_pool_id:(user_pool_id_ : user_pool_id_type)
    ~managed_login_branding_id:(managed_login_branding_id_ : managed_login_branding_id_type) () =
  ({ user_pool_id = user_pool_id_; managed_login_branding_id = managed_login_branding_id_ }
    : delete_managed_login_branding_request)

let make_delete_identity_provider_request ~provider_name:(provider_name_ : provider_name_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ provider_name = provider_name_; user_pool_id = user_pool_id_ }
    : delete_identity_provider_request)

let make_delete_group_request ~user_pool_id:(user_pool_id_ : user_pool_id_type)
    ~group_name:(group_name_ : group_name_type) () =
  ({ user_pool_id = user_pool_id_; group_name = group_name_ } : delete_group_request)

let make_create_user_pool_response ?user_pool:(user_pool_ : user_pool_type option) () =
  ({ user_pool = user_pool_ } : create_user_pool_response)

let make_create_user_pool_request
    ?issuer_configuration:(issuer_configuration_ : issuer_configuration_type option)
    ?key_configuration:(key_configuration_ : key_configuration_type option)
    ?user_pool_tier:(user_pool_tier_ : user_pool_tier_type option)
    ?account_recovery_setting:(account_recovery_setting_ : account_recovery_setting_type option)
    ?username_configuration:(username_configuration_ : username_configuration_type option)
    ?user_pool_add_ons:(user_pool_add_ons_ : user_pool_add_ons_type option)
    ?schema:(schema_ : schema_attributes_list_type option)
    ?admin_create_user_config:(admin_create_user_config_ : admin_create_user_config_type option)
    ?user_pool_tags:(user_pool_tags_ : user_pool_tags_type option)
    ?sms_configuration:(sms_configuration_ : sms_configuration_type option)
    ?email_configuration:(email_configuration_ : email_configuration_type option)
    ?device_configuration:(device_configuration_ : device_configuration_type option)
    ?user_attribute_update_settings:
      (user_attribute_update_settings_ : user_attribute_update_settings_type option)
    ?mfa_configuration:(mfa_configuration_ : user_pool_mfa_type option)
    ?sms_authentication_message:(sms_authentication_message_ : sms_verification_message_type option)
    ?verification_message_template:
      (verification_message_template_ : verification_message_template_type option)
    ?email_verification_subject:
      (email_verification_subject_ : email_verification_subject_type option)
    ?email_verification_message:
      (email_verification_message_ : email_verification_message_type option)
    ?sms_verification_message:(sms_verification_message_ : sms_verification_message_type option)
    ?username_attributes:(username_attributes_ : username_attributes_list_type option)
    ?alias_attributes:(alias_attributes_ : alias_attributes_list_type option)
    ?auto_verified_attributes:(auto_verified_attributes_ : verified_attributes_list_type option)
    ?lambda_config:(lambda_config_ : lambda_config_type option)
    ?deletion_protection:(deletion_protection_ : deletion_protection_type option)
    ?policies:(policies_ : user_pool_policy_type option)
    ~pool_name:(pool_name_ : user_pool_name_type) () =
  ({
     issuer_configuration = issuer_configuration_;
     key_configuration = key_configuration_;
     user_pool_tier = user_pool_tier_;
     account_recovery_setting = account_recovery_setting_;
     username_configuration = username_configuration_;
     user_pool_add_ons = user_pool_add_ons_;
     schema = schema_;
     admin_create_user_config = admin_create_user_config_;
     user_pool_tags = user_pool_tags_;
     sms_configuration = sms_configuration_;
     email_configuration = email_configuration_;
     device_configuration = device_configuration_;
     user_attribute_update_settings = user_attribute_update_settings_;
     mfa_configuration = mfa_configuration_;
     sms_authentication_message = sms_authentication_message_;
     verification_message_template = verification_message_template_;
     email_verification_subject = email_verification_subject_;
     email_verification_message = email_verification_message_;
     sms_verification_message = sms_verification_message_;
     username_attributes = username_attributes_;
     alias_attributes = alias_attributes_;
     auto_verified_attributes = auto_verified_attributes_;
     lambda_config = lambda_config_;
     deletion_protection = deletion_protection_;
     policies = policies_;
     pool_name = pool_name_;
   }
    : create_user_pool_request)

let make_create_user_pool_replica_response
    ?user_pool_replica:(user_pool_replica_ : user_pool_replica_type option) () =
  ({ user_pool_replica = user_pool_replica_ } : create_user_pool_replica_response)

let make_create_user_pool_replica_request
    ?user_pool_tags:(user_pool_tags_ : user_pool_tags_type option)
    ~region_name:(region_name_ : region_name_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type)
    () =
  ({ user_pool_tags = user_pool_tags_; region_name = region_name_; user_pool_id = user_pool_id_ }
    : create_user_pool_replica_request)

let make_create_user_pool_domain_response ?routing:(routing_ : routing_type option)
    ?cloud_front_domain:(cloud_front_domain_ : domain_type option)
    ?managed_login_version:(managed_login_version_ : wrapped_integer_type option) () =
  ({
     routing = routing_;
     cloud_front_domain = cloud_front_domain_;
     managed_login_version = managed_login_version_;
   }
    : create_user_pool_domain_response)

let make_create_user_pool_domain_request ?routing:(routing_ : routing_type option)
    ?custom_domain_config:(custom_domain_config_ : custom_domain_config_type option)
    ?managed_login_version:(managed_login_version_ : wrapped_integer_type option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) ~domain:(domain_ : domain_type) () =
  ({
     routing = routing_;
     custom_domain_config = custom_domain_config_;
     managed_login_version = managed_login_version_;
     user_pool_id = user_pool_id_;
     domain = domain_;
   }
    : create_user_pool_domain_request)

let make_create_user_pool_client_response
    ?user_pool_client:(user_pool_client_ : user_pool_client_type option) () =
  ({ user_pool_client = user_pool_client_ } : create_user_pool_client_response)

let make_create_user_pool_client_request
    ?refresh_token_rotation:(refresh_token_rotation_ : refresh_token_rotation_type option)
    ?auth_session_validity:(auth_session_validity_ : auth_session_validity_type option)
    ?enable_propagate_additional_user_context_data:
      (enable_propagate_additional_user_context_data_ : wrapped_boolean_type option)
    ?enable_token_revocation:(enable_token_revocation_ : wrapped_boolean_type option)
    ?prevent_user_existence_errors:
      (prevent_user_existence_errors_ : prevent_user_existence_error_types option)
    ?analytics_configuration:(analytics_configuration_ : analytics_configuration_type option)
    ?allowed_o_auth_flows_user_pool_client:
      (allowed_o_auth_flows_user_pool_client_ : boolean_type option)
    ?allowed_o_auth_scopes:(allowed_o_auth_scopes_ : scope_list_type option)
    ?allowed_o_auth_flows:(allowed_o_auth_flows_ : o_auth_flows_type option)
    ?default_redirect_ur_i:(default_redirect_ur_i_ : redirect_url_type option)
    ?logout_ur_ls:(logout_ur_ls_ : logout_ur_ls_list_type option)
    ?callback_ur_ls:(callback_ur_ls_ : callback_ur_ls_list_type option)
    ?supported_identity_providers:
      (supported_identity_providers_ : supported_identity_providers_list_type option)
    ?explicit_auth_flows:(explicit_auth_flows_ : explicit_auth_flows_list_type option)
    ?write_attributes:(write_attributes_ : client_permission_list_type option)
    ?read_attributes:(read_attributes_ : client_permission_list_type option)
    ?token_validity_units:(token_validity_units_ : token_validity_units_type option)
    ?id_token_validity:(id_token_validity_ : id_token_validity_type option)
    ?access_token_validity:(access_token_validity_ : access_token_validity_type option)
    ?refresh_token_validity:(refresh_token_validity_ : refresh_token_validity_type option)
    ?client_secret:(client_secret_ : client_secret_type option)
    ?generate_secret:(generate_secret_ : generate_secret option)
    ~client_name:(client_name_ : client_name_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type)
    () =
  ({
     refresh_token_rotation = refresh_token_rotation_;
     auth_session_validity = auth_session_validity_;
     enable_propagate_additional_user_context_data = enable_propagate_additional_user_context_data_;
     enable_token_revocation = enable_token_revocation_;
     prevent_user_existence_errors = prevent_user_existence_errors_;
     analytics_configuration = analytics_configuration_;
     allowed_o_auth_flows_user_pool_client = allowed_o_auth_flows_user_pool_client_;
     allowed_o_auth_scopes = allowed_o_auth_scopes_;
     allowed_o_auth_flows = allowed_o_auth_flows_;
     default_redirect_ur_i = default_redirect_ur_i_;
     logout_ur_ls = logout_ur_ls_;
     callback_ur_ls = callback_ur_ls_;
     supported_identity_providers = supported_identity_providers_;
     explicit_auth_flows = explicit_auth_flows_;
     write_attributes = write_attributes_;
     read_attributes = read_attributes_;
     token_validity_units = token_validity_units_;
     id_token_validity = id_token_validity_;
     access_token_validity = access_token_validity_;
     refresh_token_validity = refresh_token_validity_;
     client_secret = client_secret_;
     generate_secret = generate_secret_;
     client_name = client_name_;
     user_pool_id = user_pool_id_;
   }
    : create_user_pool_client_request)

let make_create_user_import_job_response
    ?user_import_job:(user_import_job_ : user_import_job_type option) () =
  ({ user_import_job = user_import_job_ } : create_user_import_job_response)

let make_create_user_import_job_request
    ~cloud_watch_logs_role_arn:(cloud_watch_logs_role_arn_ : arn_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type)
    ~job_name:(job_name_ : user_import_job_name_type) () =
  ({
     cloud_watch_logs_role_arn = cloud_watch_logs_role_arn_;
     user_pool_id = user_pool_id_;
     job_name = job_name_;
   }
    : create_user_import_job_request)

let make_create_terms_response ?terms:(terms_ : terms_type option) () =
  ({ terms = terms_ } : create_terms_response)

let make_create_terms_request ?links:(links_ : links_type option)
    ~enforcement:(enforcement_ : terms_enforcement_type)
    ~terms_source:(terms_source_ : terms_source_type) ~terms_name:(terms_name_ : terms_name_type)
    ~client_id:(client_id_ : client_id_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     links = links_;
     enforcement = enforcement_;
     terms_source = terms_source_;
     terms_name = terms_name_;
     client_id = client_id_;
     user_pool_id = user_pool_id_;
   }
    : create_terms_request)

let make_create_resource_server_response ~resource_server:(resource_server_ : resource_server_type)
    () =
  ({ resource_server = resource_server_ } : create_resource_server_response)

let make_create_resource_server_request ?scopes:(scopes_ : resource_server_scope_list_type option)
    ~name:(name_ : resource_server_name_type)
    ~identifier:(identifier_ : resource_server_identifier_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ scopes = scopes_; name = name_; identifier = identifier_; user_pool_id = user_pool_id_ }
    : create_resource_server_request)

let make_create_managed_login_branding_response
    ?managed_login_branding:(managed_login_branding_ : managed_login_branding_type option) () =
  ({ managed_login_branding = managed_login_branding_ } : create_managed_login_branding_response)

let make_create_managed_login_branding_request ?assets:(assets_ : asset_list_type option)
    ?settings:(settings_ : document option)
    ?use_cognito_provided_values:(use_cognito_provided_values_ : boolean_type option)
    ~client_id:(client_id_ : client_id_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     assets = assets_;
     settings = settings_;
     use_cognito_provided_values = use_cognito_provided_values_;
     client_id = client_id_;
     user_pool_id = user_pool_id_;
   }
    : create_managed_login_branding_request)

let make_create_identity_provider_response
    ~identity_provider:(identity_provider_ : identity_provider_type) () =
  ({ identity_provider = identity_provider_ } : create_identity_provider_response)

let make_create_identity_provider_request
    ?idp_identifiers:(idp_identifiers_ : idp_identifiers_list_type option)
    ?attribute_mapping:(attribute_mapping_ : attribute_mapping_type option)
    ~provider_details:(provider_details_ : provider_details_type)
    ~provider_type:(provider_type_ : identity_provider_type_type)
    ~provider_name:(provider_name_ : provider_name_type_v2)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     idp_identifiers = idp_identifiers_;
     attribute_mapping = attribute_mapping_;
     provider_details = provider_details_;
     provider_type = provider_type_;
     provider_name = provider_name_;
     user_pool_id = user_pool_id_;
   }
    : create_identity_provider_request)

let make_create_group_response ?group:(group_ : group_type option) () =
  ({ group = group_ } : create_group_response)

let make_create_group_request ?precedence:(precedence_ : precedence_type option)
    ?role_arn:(role_arn_ : arn_type option) ?description:(description_ : description_type option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) ~group_name:(group_name_ : group_name_type) ()
    =
  ({
     precedence = precedence_;
     role_arn = role_arn_;
     description = description_;
     user_pool_id = user_pool_id_;
     group_name = group_name_;
   }
    : create_group_request)

let make_context_data_type ?encoded_data:(encoded_data_ : string_type option)
    ~http_headers:(http_headers_ : http_header_list) ~server_path:(server_path_ : string_type)
    ~server_name:(server_name_ : string_type) ~ip_address:(ip_address_ : string_type) () =
  ({
     encoded_data = encoded_data_;
     http_headers = http_headers_;
     server_path = server_path_;
     server_name = server_name_;
     ip_address = ip_address_;
   }
    : context_data_type)

let make_confirm_sign_up_response ?session:(session_ : session_type option) () =
  ({ session = session_ } : confirm_sign_up_response)

let make_confirm_sign_up_request ?session:(session_ : session_type option)
    ?client_metadata:(client_metadata_ : client_metadata_type option)
    ?user_context_data:(user_context_data_ : user_context_data_type option)
    ?analytics_metadata:(analytics_metadata_ : analytics_metadata_type option)
    ?force_alias_creation:(force_alias_creation_ : force_alias_creation option)
    ?secret_hash:(secret_hash_ : secret_hash_type option)
    ~confirmation_code:(confirmation_code_ : confirmation_code_type)
    ~username:(username_ : username_type) ~client_id:(client_id_ : client_id_type) () =
  ({
     session = session_;
     client_metadata = client_metadata_;
     user_context_data = user_context_data_;
     analytics_metadata = analytics_metadata_;
     force_alias_creation = force_alias_creation_;
     confirmation_code = confirmation_code_;
     username = username_;
     secret_hash = secret_hash_;
     client_id = client_id_;
   }
    : confirm_sign_up_request)

let make_confirm_forgot_password_response () = (() : unit)

let make_confirm_forgot_password_request
    ?client_metadata:(client_metadata_ : client_metadata_type option)
    ?user_context_data:(user_context_data_ : user_context_data_type option)
    ?analytics_metadata:(analytics_metadata_ : analytics_metadata_type option)
    ?secret_hash:(secret_hash_ : secret_hash_type option) ~password:(password_ : password_type)
    ~confirmation_code:(confirmation_code_ : confirmation_code_type)
    ~username:(username_ : username_type) ~client_id:(client_id_ : client_id_type) () =
  ({
     client_metadata = client_metadata_;
     user_context_data = user_context_data_;
     analytics_metadata = analytics_metadata_;
     password = password_;
     confirmation_code = confirmation_code_;
     username = username_;
     secret_hash = secret_hash_;
     client_id = client_id_;
   }
    : confirm_forgot_password_request)

let make_confirm_device_response
    ?user_confirmation_necessary:(user_confirmation_necessary_ : boolean_type option) () =
  ({ user_confirmation_necessary = user_confirmation_necessary_ } : confirm_device_response)

let make_confirm_device_request ?device_name:(device_name_ : device_name_type option)
    ?device_secret_verifier_config:
      (device_secret_verifier_config_ : device_secret_verifier_config_type option)
    ~device_key:(device_key_ : device_key_type) ~access_token:(access_token_ : token_model_type) ()
    =
  ({
     device_name = device_name_;
     device_secret_verifier_config = device_secret_verifier_config_;
     device_key = device_key_;
     access_token = access_token_;
   }
    : confirm_device_request)

let make_complete_web_authn_registration_response () = (() : unit)

let make_complete_web_authn_registration_request ~credential:(credential_ : document)
    ~access_token:(access_token_ : token_model_type) () =
  ({ credential = credential_; access_token = access_token_ }
    : complete_web_authn_registration_request)

let make_change_password_response () = (() : unit)

let make_change_password_request ?previous_password:(previous_password_ : password_type option)
    ~access_token:(access_token_ : token_model_type)
    ~proposed_password:(proposed_password_ : password_type) () =
  ({
     access_token = access_token_;
     proposed_password = proposed_password_;
     previous_password = previous_password_;
   }
    : change_password_request)

let make_challenge_response_type
    ?challenge_response:(challenge_response_ : challenge_response option)
    ?challenge_name:(challenge_name_ : challenge_name option) () =
  ({ challenge_response = challenge_response_; challenge_name = challenge_name_ }
    : challenge_response_type)

let make_auth_event_type ?event_feedback:(event_feedback_ : event_feedback_type option)
    ?event_context_data:(event_context_data_ : event_context_data_type option)
    ?challenge_responses:(challenge_responses_ : challenge_response_list_type option)
    ?event_risk:(event_risk_ : event_risk_type option)
    ?event_response:(event_response_ : event_response_type option)
    ?creation_date:(creation_date_ : date_type option) ?event_type:(event_type_ : event_type option)
    ?event_id:(event_id_ : string_type option) () =
  ({
     event_feedback = event_feedback_;
     event_context_data = event_context_data_;
     challenge_responses = challenge_responses_;
     event_risk = event_risk_;
     event_response = event_response_;
     creation_date = creation_date_;
     event_type = event_type_;
     event_id = event_id_;
   }
    : auth_event_type)

let make_associate_software_token_response ?session:(session_ : session_type option)
    ?secret_code:(secret_code_ : secret_code_type option) () =
  ({ session = session_; secret_code = secret_code_ } : associate_software_token_response)

let make_associate_software_token_request ?session:(session_ : session_type option)
    ?access_token:(access_token_ : token_model_type option) () =
  ({ session = session_; access_token = access_token_ } : associate_software_token_request)

let make_admin_user_global_sign_out_response () = (() : unit)

let make_admin_user_global_sign_out_request ~username:(username_ : username_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ username = username_; user_pool_id = user_pool_id_ } : admin_user_global_sign_out_request)

let make_admin_update_user_attributes_response () = (() : unit)

let make_admin_update_user_attributes_request
    ?client_metadata:(client_metadata_ : client_metadata_type option)
    ~user_attributes:(user_attributes_ : attribute_list_type) ~username:(username_ : username_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     client_metadata = client_metadata_;
     user_attributes = user_attributes_;
     username = username_;
     user_pool_id = user_pool_id_;
   }
    : admin_update_user_attributes_request)

let make_admin_update_device_status_response () = (() : unit)

let make_admin_update_device_status_request
    ?device_remembered_status:(device_remembered_status_ : device_remembered_status_type option)
    ~device_key:(device_key_ : device_key_type) ~username:(username_ : username_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     device_remembered_status = device_remembered_status_;
     device_key = device_key_;
     username = username_;
     user_pool_id = user_pool_id_;
   }
    : admin_update_device_status_request)

let make_admin_update_auth_event_feedback_response () = (() : unit)

let make_admin_update_auth_event_feedback_request
    ~feedback_value:(feedback_value_ : feedback_value_type) ~event_id:(event_id_ : event_id_type)
    ~username:(username_ : username_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     feedback_value = feedback_value_;
     event_id = event_id_;
     username = username_;
     user_pool_id = user_pool_id_;
   }
    : admin_update_auth_event_feedback_request)

let make_admin_set_user_settings_response () = (() : unit)

let make_admin_set_user_settings_request ~mfa_options:(mfa_options_ : mfa_option_list_type)
    ~username:(username_ : username_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ mfa_options = mfa_options_; username = username_; user_pool_id = user_pool_id_ }
    : admin_set_user_settings_request)

let make_admin_set_user_password_response () = (() : unit)

let make_admin_set_user_password_request ?permanent:(permanent_ : boolean_type option)
    ~password:(password_ : password_type) ~username:(username_ : username_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     permanent = permanent_;
     password = password_;
     username = username_;
     user_pool_id = user_pool_id_;
   }
    : admin_set_user_password_request)

let make_admin_set_user_mfa_preference_response () = (() : unit)

let make_admin_set_user_mfa_preference_request
    ?web_authn_mfa_settings:(web_authn_mfa_settings_ : web_authn_mfa_settings_type option)
    ?email_mfa_settings:(email_mfa_settings_ : email_mfa_settings_type option)
    ?software_token_mfa_settings:
      (software_token_mfa_settings_ : software_token_mfa_settings_type option)
    ?sms_mfa_settings:(sms_mfa_settings_ : sms_mfa_settings_type option)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) ~username:(username_ : username_type) () =
  ({
     user_pool_id = user_pool_id_;
     username = username_;
     web_authn_mfa_settings = web_authn_mfa_settings_;
     email_mfa_settings = email_mfa_settings_;
     software_token_mfa_settings = software_token_mfa_settings_;
     sms_mfa_settings = sms_mfa_settings_;
   }
    : admin_set_user_mfa_preference_request)

let make_admin_respond_to_auth_challenge_response
    ?authentication_result:(authentication_result_ : authentication_result_type option)
    ?challenge_parameters:(challenge_parameters_ : challenge_parameters_type option)
    ?session:(session_ : session_type option)
    ?challenge_name:(challenge_name_ : challenge_name_type option) () =
  ({
     authentication_result = authentication_result_;
     challenge_parameters = challenge_parameters_;
     session = session_;
     challenge_name = challenge_name_;
   }
    : admin_respond_to_auth_challenge_response)

let make_admin_respond_to_auth_challenge_request
    ?client_metadata:(client_metadata_ : client_metadata_type option)
    ?context_data:(context_data_ : context_data_type option)
    ?analytics_metadata:(analytics_metadata_ : analytics_metadata_type option)
    ?session:(session_ : session_type option)
    ?challenge_responses:(challenge_responses_ : challenge_responses_type option)
    ~challenge_name:(challenge_name_ : challenge_name_type) ~client_id:(client_id_ : client_id_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     client_metadata = client_metadata_;
     context_data = context_data_;
     analytics_metadata = analytics_metadata_;
     session = session_;
     challenge_responses = challenge_responses_;
     challenge_name = challenge_name_;
     client_id = client_id_;
     user_pool_id = user_pool_id_;
   }
    : admin_respond_to_auth_challenge_request)

let make_admin_reset_user_password_response () = (() : unit)

let make_admin_reset_user_password_request
    ?client_metadata:(client_metadata_ : client_metadata_type option)
    ~username:(username_ : username_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ client_metadata = client_metadata_; username = username_; user_pool_id = user_pool_id_ }
    : admin_reset_user_password_request)

let make_admin_remove_user_from_group_request ~group_name:(group_name_ : group_name_type)
    ~username:(username_ : username_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ group_name = group_name_; username = username_; user_pool_id = user_pool_id_ }
    : admin_remove_user_from_group_request)

let make_admin_list_user_auth_events_response ?next_token:(next_token_ : pagination_key option)
    ?auth_events:(auth_events_ : auth_events_type option) () =
  ({ next_token = next_token_; auth_events = auth_events_ } : admin_list_user_auth_events_response)

let make_admin_list_user_auth_events_request ?next_token:(next_token_ : pagination_key option)
    ?max_results:(max_results_ : query_limit_type option) ~username:(username_ : username_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     username = username_;
     user_pool_id = user_pool_id_;
   }
    : admin_list_user_auth_events_request)

let make_admin_list_groups_for_user_response ?next_token:(next_token_ : pagination_key option)
    ?groups:(groups_ : group_list_type option) () =
  ({ next_token = next_token_; groups = groups_ } : admin_list_groups_for_user_response)

let make_admin_list_groups_for_user_request ?next_token:(next_token_ : pagination_key option)
    ?limit:(limit_ : query_limit_type option) ~user_pool_id:(user_pool_id_ : user_pool_id_type)
    ~username:(username_ : username_type) () =
  ({ next_token = next_token_; limit = limit_; user_pool_id = user_pool_id_; username = username_ }
    : admin_list_groups_for_user_request)

let make_admin_list_devices_response
    ?pagination_token:(pagination_token_ : search_pagination_token_type option)
    ?devices:(devices_ : device_list_type option) () =
  ({ pagination_token = pagination_token_; devices = devices_ } : admin_list_devices_response)

let make_admin_list_devices_request
    ?pagination_token:(pagination_token_ : search_pagination_token_type option)
    ?limit:(limit_ : query_limit_type option) ~username:(username_ : username_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     pagination_token = pagination_token_;
     limit = limit_;
     username = username_;
     user_pool_id = user_pool_id_;
   }
    : admin_list_devices_request)

let make_admin_link_provider_for_user_response () = (() : unit)

let make_admin_link_provider_for_user_request
    ~source_user:(source_user_ : provider_user_identifier_type)
    ~destination_user:(destination_user_ : provider_user_identifier_type)
    ~user_pool_id:(user_pool_id_ : string_type) () =
  ({
     source_user = source_user_;
     destination_user = destination_user_;
     user_pool_id = user_pool_id_;
   }
    : admin_link_provider_for_user_request)

let make_admin_initiate_auth_response
    ?available_challenges:(available_challenges_ : available_challenge_list_type option)
    ?authentication_result:(authentication_result_ : authentication_result_type option)
    ?challenge_parameters:(challenge_parameters_ : challenge_parameters_type option)
    ?session:(session_ : session_type option)
    ?challenge_name:(challenge_name_ : challenge_name_type option) () =
  ({
     available_challenges = available_challenges_;
     authentication_result = authentication_result_;
     challenge_parameters = challenge_parameters_;
     session = session_;
     challenge_name = challenge_name_;
   }
    : admin_initiate_auth_response)

let make_admin_initiate_auth_request ?session:(session_ : session_type option)
    ?context_data:(context_data_ : context_data_type option)
    ?analytics_metadata:(analytics_metadata_ : analytics_metadata_type option)
    ?client_metadata:(client_metadata_ : client_metadata_type option)
    ?auth_parameters:(auth_parameters_ : auth_parameters_type option)
    ~auth_flow:(auth_flow_ : auth_flow_type) ~client_id:(client_id_ : client_id_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     session = session_;
     context_data = context_data_;
     analytics_metadata = analytics_metadata_;
     client_metadata = client_metadata_;
     auth_parameters = auth_parameters_;
     auth_flow = auth_flow_;
     client_id = client_id_;
     user_pool_id = user_pool_id_;
   }
    : admin_initiate_auth_request)

let make_admin_get_user_response
    ?user_mfa_setting_list:(user_mfa_setting_list_ : user_mfa_setting_list_type option)
    ?preferred_mfa_setting:(preferred_mfa_setting_ : string_type option)
    ?mfa_options:(mfa_options_ : mfa_option_list_type option)
    ?user_status:(user_status_ : user_status_type option) ?enabled:(enabled_ : boolean_type option)
    ?user_last_modified_date:(user_last_modified_date_ : date_type option)
    ?user_create_date:(user_create_date_ : date_type option)
    ?user_attributes:(user_attributes_ : attribute_list_type option)
    ~username:(username_ : username_type) () =
  ({
     user_mfa_setting_list = user_mfa_setting_list_;
     preferred_mfa_setting = preferred_mfa_setting_;
     mfa_options = mfa_options_;
     user_status = user_status_;
     enabled = enabled_;
     user_last_modified_date = user_last_modified_date_;
     user_create_date = user_create_date_;
     user_attributes = user_attributes_;
     username = username_;
   }
    : admin_get_user_response)

let make_admin_get_user_request ~username:(username_ : username_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ username = username_; user_pool_id = user_pool_id_ } : admin_get_user_request)

let make_admin_get_device_response ~device:(device_ : device_type) () =
  ({ device = device_ } : admin_get_device_response)

let make_admin_get_device_request ~username:(username_ : username_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) ~device_key:(device_key_ : device_key_type) ()
    =
  ({ username = username_; user_pool_id = user_pool_id_; device_key = device_key_ }
    : admin_get_device_request)

let make_admin_forget_device_request ~device_key:(device_key_ : device_key_type)
    ~username:(username_ : username_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ device_key = device_key_; username = username_; user_pool_id = user_pool_id_ }
    : admin_forget_device_request)

let make_admin_enable_user_response () = (() : unit)

let make_admin_enable_user_request ~username:(username_ : username_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ username = username_; user_pool_id = user_pool_id_ } : admin_enable_user_request)

let make_admin_disable_user_response () = (() : unit)

let make_admin_disable_user_request ~username:(username_ : username_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ username = username_; user_pool_id = user_pool_id_ } : admin_disable_user_request)

let make_admin_disable_provider_for_user_response () = (() : unit)

let make_admin_disable_provider_for_user_request ~user:(user_ : provider_user_identifier_type)
    ~user_pool_id:(user_pool_id_ : string_type) () =
  ({ user = user_; user_pool_id = user_pool_id_ } : admin_disable_provider_for_user_request)

let make_admin_delete_user_request ~username:(username_ : username_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ username = username_; user_pool_id = user_pool_id_ } : admin_delete_user_request)

let make_admin_delete_user_attributes_response () = (() : unit)

let make_admin_delete_user_attributes_request
    ~user_attribute_names:(user_attribute_names_ : attribute_name_list_type)
    ~username:(username_ : username_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     user_attribute_names = user_attribute_names_;
     username = username_;
     user_pool_id = user_pool_id_;
   }
    : admin_delete_user_attributes_request)

let make_admin_create_user_response ?user:(user_ : user_type option) () =
  ({ user = user_ } : admin_create_user_response)

let make_admin_create_user_request ?client_metadata:(client_metadata_ : client_metadata_type option)
    ?desired_delivery_mediums:(desired_delivery_mediums_ : delivery_medium_list_type option)
    ?message_action:(message_action_ : message_action_type option)
    ?force_alias_creation:(force_alias_creation_ : force_alias_creation option)
    ?temporary_password:(temporary_password_ : password_type option)
    ?validation_data:(validation_data_ : attribute_list_type option)
    ?user_attributes:(user_attributes_ : attribute_list_type option)
    ~username:(username_ : username_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({
     client_metadata = client_metadata_;
     desired_delivery_mediums = desired_delivery_mediums_;
     message_action = message_action_;
     force_alias_creation = force_alias_creation_;
     temporary_password = temporary_password_;
     validation_data = validation_data_;
     user_attributes = user_attributes_;
     username = username_;
     user_pool_id = user_pool_id_;
   }
    : admin_create_user_request)

let make_admin_confirm_sign_up_response () = (() : unit)

let make_admin_confirm_sign_up_request
    ?client_metadata:(client_metadata_ : client_metadata_type option)
    ~username:(username_ : username_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ client_metadata = client_metadata_; username = username_; user_pool_id = user_pool_id_ }
    : admin_confirm_sign_up_request)

let make_admin_add_user_to_group_request ~group_name:(group_name_ : group_name_type)
    ~username:(username_ : username_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ group_name = group_name_; username = username_; user_pool_id = user_pool_id_ }
    : admin_add_user_to_group_request)

let make_add_user_pool_client_secret_response
    ?client_secret_descriptor:(client_secret_descriptor_ : client_secret_descriptor_type option) ()
    =
  ({ client_secret_descriptor = client_secret_descriptor_ } : add_user_pool_client_secret_response)

let make_add_user_pool_client_secret_request
    ?client_secret:(client_secret_ : client_secret_type option)
    ~client_id:(client_id_ : client_id_type) ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ client_secret = client_secret_; client_id = client_id_; user_pool_id = user_pool_id_ }
    : add_user_pool_client_secret_request)

let make_add_custom_attributes_response () = (() : unit)

let make_add_custom_attributes_request
    ~custom_attributes:(custom_attributes_ : custom_attributes_list_type)
    ~user_pool_id:(user_pool_id_ : user_pool_id_type) () =
  ({ custom_attributes = custom_attributes_; user_pool_id = user_pool_id_ }
    : add_custom_attributes_request)
