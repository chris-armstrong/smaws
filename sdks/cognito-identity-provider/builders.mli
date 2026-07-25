open Types

val make_verify_user_attribute_response : unit -> unit

val make_verify_user_attribute_request :
  access_token:token_model_type ->
  attribute_name:attribute_name_type ->
  code:confirmation_code_type ->
  unit ->
  verify_user_attribute_request

val make_verify_software_token_response :
  ?status:verify_software_token_response_type ->
  ?session:session_type ->
  unit ->
  verify_software_token_response

val make_verify_software_token_request :
  ?access_token:token_model_type ->
  ?session:session_type ->
  ?friendly_device_name:string_type ->
  user_code:software_token_mfa_user_code_type ->
  unit ->
  verify_software_token_request

val make_user_pool_replica_type :
  ?region_name:region_name_type ->
  ?status:replica_status_type ->
  ?role:replica_role_type ->
  ?user_pool_arn:arn_type ->
  unit ->
  user_pool_replica_type

val make_update_user_pool_replica_response :
  ?user_pool_replica:user_pool_replica_type -> unit -> update_user_pool_replica_response

val make_update_user_pool_replica_request :
  user_pool_id:user_pool_id_type ->
  region_name:region_name_type ->
  status:update_replica_status_type ->
  unit ->
  update_user_pool_replica_request

val make_failover_type :
  secondary_region:region_name_type ->
  primary_route53_health_check_id:health_check_id_type ->
  unit ->
  failover_type

val make_routing_type : ?failover:failover_type -> unit -> routing_type

val make_update_user_pool_domain_response :
  ?managed_login_version:wrapped_integer_type ->
  ?cloud_front_domain:domain_type ->
  ?routing:routing_type ->
  unit ->
  update_user_pool_domain_response

val make_custom_domain_config_type :
  ?security_policy:security_policy_type ->
  certificate_arn:arn_type ->
  unit ->
  custom_domain_config_type

val make_update_user_pool_domain_request :
  ?managed_login_version:wrapped_integer_type ->
  ?custom_domain_config:custom_domain_config_type ->
  ?routing:routing_type ->
  domain:domain_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  update_user_pool_domain_request

val make_refresh_token_rotation_type :
  ?retry_grace_period_seconds:retry_grace_period_seconds_type ->
  feature:feature_type ->
  unit ->
  refresh_token_rotation_type

val make_analytics_configuration_type :
  ?application_id:hex_string_type ->
  ?application_arn:arn_type ->
  ?role_arn:arn_type ->
  ?external_id:string_type ->
  ?user_data_shared:boolean_type ->
  unit ->
  analytics_configuration_type

val make_token_validity_units_type :
  ?access_token:time_units_type ->
  ?id_token:time_units_type ->
  ?refresh_token:time_units_type ->
  unit ->
  token_validity_units_type

val make_user_pool_client_type :
  ?user_pool_id:user_pool_id_type ->
  ?client_name:client_name_type ->
  ?client_id:client_id_type ->
  ?client_secret:client_secret_type ->
  ?last_modified_date:date_type ->
  ?creation_date:date_type ->
  ?refresh_token_validity:refresh_token_validity_type ->
  ?access_token_validity:access_token_validity_type ->
  ?id_token_validity:id_token_validity_type ->
  ?token_validity_units:token_validity_units_type ->
  ?read_attributes:client_permission_list_type ->
  ?write_attributes:client_permission_list_type ->
  ?explicit_auth_flows:explicit_auth_flows_list_type ->
  ?supported_identity_providers:supported_identity_providers_list_type ->
  ?callback_ur_ls:callback_ur_ls_list_type ->
  ?logout_ur_ls:logout_ur_ls_list_type ->
  ?default_redirect_ur_i:redirect_url_type ->
  ?allowed_o_auth_flows:o_auth_flows_type ->
  ?allowed_o_auth_scopes:scope_list_type ->
  ?allowed_o_auth_flows_user_pool_client:boolean_type ->
  ?analytics_configuration:analytics_configuration_type ->
  ?prevent_user_existence_errors:prevent_user_existence_error_types ->
  ?enable_token_revocation:wrapped_boolean_type ->
  ?enable_propagate_additional_user_context_data:wrapped_boolean_type ->
  ?auth_session_validity:auth_session_validity_type ->
  ?refresh_token_rotation:refresh_token_rotation_type ->
  unit ->
  user_pool_client_type

val make_update_user_pool_client_response :
  ?user_pool_client:user_pool_client_type -> unit -> update_user_pool_client_response

val make_update_user_pool_client_request :
  ?client_name:client_name_type ->
  ?refresh_token_validity:refresh_token_validity_type ->
  ?access_token_validity:access_token_validity_type ->
  ?id_token_validity:id_token_validity_type ->
  ?token_validity_units:token_validity_units_type ->
  ?read_attributes:client_permission_list_type ->
  ?write_attributes:client_permission_list_type ->
  ?explicit_auth_flows:explicit_auth_flows_list_type ->
  ?supported_identity_providers:supported_identity_providers_list_type ->
  ?callback_ur_ls:callback_ur_ls_list_type ->
  ?logout_ur_ls:logout_ur_ls_list_type ->
  ?default_redirect_ur_i:redirect_url_type ->
  ?allowed_o_auth_flows:o_auth_flows_type ->
  ?allowed_o_auth_scopes:scope_list_type ->
  ?allowed_o_auth_flows_user_pool_client:boolean_type ->
  ?analytics_configuration:analytics_configuration_type ->
  ?prevent_user_existence_errors:prevent_user_existence_error_types ->
  ?enable_token_revocation:wrapped_boolean_type ->
  ?enable_propagate_additional_user_context_data:wrapped_boolean_type ->
  ?auth_session_validity:auth_session_validity_type ->
  ?refresh_token_rotation:refresh_token_rotation_type ->
  user_pool_id:user_pool_id_type ->
  client_id:client_id_type ->
  unit ->
  update_user_pool_client_request

val make_update_user_pool_response : unit -> unit
val make_issuer_configuration_type : ?type_:issuer_type -> unit -> issuer_configuration_type

val make_key_configuration_type :
  ?key_type:encryption_key_type ->
  ?kms_key_arn:encryption_key_arn_type ->
  unit ->
  key_configuration_type

val make_recovery_option_type :
  priority:priority_type -> name:recovery_option_name_type -> unit -> recovery_option_type

val make_account_recovery_setting_type :
  ?recovery_mechanisms:recovery_mechanisms_type -> unit -> account_recovery_setting_type

val make_advanced_security_additional_flows_type :
  ?custom_auth_mode:advanced_security_enabled_mode_type ->
  unit ->
  advanced_security_additional_flows_type

val make_user_pool_add_ons_type :
  ?advanced_security_additional_flows:advanced_security_additional_flows_type ->
  advanced_security_mode:advanced_security_mode_type ->
  unit ->
  user_pool_add_ons_type

val make_message_template_type :
  ?sms_message:sms_invite_message_type ->
  ?email_message:email_invite_message_type ->
  ?email_subject:email_verification_subject_type ->
  unit ->
  message_template_type

val make_admin_create_user_config_type :
  ?allow_admin_create_user_only:boolean_type ->
  ?unused_account_validity_days:admin_create_user_unused_account_validity_days_type ->
  ?invite_message_template:message_template_type ->
  unit ->
  admin_create_user_config_type

val make_sms_configuration_type :
  ?external_id:string_type ->
  ?sns_region:region_code_type ->
  sns_caller_arn:arn_type ->
  unit ->
  sms_configuration_type

val make_email_configuration_type :
  ?source_arn:arn_type ->
  ?reply_to_email_address:email_address_type ->
  ?email_sending_account:email_sending_account_type ->
  ?from_:string_type ->
  ?configuration_set:ses_configuration_set ->
  unit ->
  email_configuration_type

val make_device_configuration_type :
  ?challenge_required_on_new_device:boolean_type ->
  ?device_only_remembered_on_user_prompt:boolean_type ->
  unit ->
  device_configuration_type

val make_user_attribute_update_settings_type :
  ?attributes_require_verification_before_update:attributes_require_verification_before_update_type ->
  unit ->
  user_attribute_update_settings_type

val make_verification_message_template_type :
  ?sms_message:sms_verification_message_type ->
  ?email_message:email_verification_message_type ->
  ?email_subject:email_verification_subject_type ->
  ?email_message_by_link:email_verification_message_by_link_type ->
  ?email_subject_by_link:email_verification_subject_by_link_type ->
  ?default_email_option:default_email_option_type ->
  unit ->
  verification_message_template_type

val make_inbound_federation_lambda_type :
  lambda_version:inbound_federation_lambda_version_type ->
  lambda_arn:arn_type ->
  unit ->
  inbound_federation_lambda_type

val make_custom_email_lambda_version_config_type :
  lambda_version:custom_email_sender_lambda_version_type ->
  lambda_arn:arn_type ->
  unit ->
  custom_email_lambda_version_config_type

val make_custom_sms_lambda_version_config_type :
  lambda_version:custom_sms_sender_lambda_version_type ->
  lambda_arn:arn_type ->
  unit ->
  custom_sms_lambda_version_config_type

val make_pre_token_generation_version_config_type :
  lambda_version:pre_token_generation_lambda_version_type ->
  lambda_arn:arn_type ->
  unit ->
  pre_token_generation_version_config_type

val make_lambda_config_type :
  ?pre_sign_up:arn_type ->
  ?custom_message:arn_type ->
  ?post_confirmation:arn_type ->
  ?pre_authentication:arn_type ->
  ?post_authentication:arn_type ->
  ?define_auth_challenge:arn_type ->
  ?create_auth_challenge:arn_type ->
  ?verify_auth_challenge_response:arn_type ->
  ?pre_token_generation:arn_type ->
  ?user_migration:arn_type ->
  ?pre_token_generation_config:pre_token_generation_version_config_type ->
  ?custom_sms_sender:custom_sms_lambda_version_config_type ->
  ?custom_email_sender:custom_email_lambda_version_config_type ->
  ?kms_key_i_d:arn_type ->
  ?inbound_federation:inbound_federation_lambda_type ->
  unit ->
  lambda_config_type

val make_sign_in_policy_type :
  ?allowed_first_auth_factors:allowed_first_auth_factors_list_type -> unit -> sign_in_policy_type

val make_password_policy_type :
  ?minimum_length:password_policy_min_length_type ->
  ?require_uppercase:boolean_type ->
  ?require_lowercase:boolean_type ->
  ?require_numbers:boolean_type ->
  ?require_symbols:boolean_type ->
  ?password_history_size:password_history_size_type ->
  ?temporary_password_validity_days:temporary_password_validity_days_type ->
  unit ->
  password_policy_type

val make_user_pool_policy_type :
  ?password_policy:password_policy_type ->
  ?sign_in_policy:sign_in_policy_type ->
  unit ->
  user_pool_policy_type

val make_update_user_pool_request :
  ?policies:user_pool_policy_type ->
  ?deletion_protection:deletion_protection_type ->
  ?lambda_config:lambda_config_type ->
  ?auto_verified_attributes:verified_attributes_list_type ->
  ?sms_verification_message:sms_verification_message_type ->
  ?email_verification_message:email_verification_message_type ->
  ?email_verification_subject:email_verification_subject_type ->
  ?verification_message_template:verification_message_template_type ->
  ?sms_authentication_message:sms_verification_message_type ->
  ?user_attribute_update_settings:user_attribute_update_settings_type ->
  ?mfa_configuration:user_pool_mfa_type ->
  ?device_configuration:device_configuration_type ->
  ?email_configuration:email_configuration_type ->
  ?sms_configuration:sms_configuration_type ->
  ?user_pool_tags:user_pool_tags_type ->
  ?admin_create_user_config:admin_create_user_config_type ->
  ?user_pool_add_ons:user_pool_add_ons_type ->
  ?account_recovery_setting:account_recovery_setting_type ->
  ?pool_name:user_pool_name_type ->
  ?user_pool_tier:user_pool_tier_type ->
  ?key_configuration:key_configuration_type ->
  ?issuer_configuration:issuer_configuration_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  update_user_pool_request

val make_code_delivery_details_type :
  ?destination:string_type ->
  ?delivery_medium:delivery_medium_type ->
  ?attribute_name:attribute_name_type ->
  unit ->
  code_delivery_details_type

val make_update_user_attributes_response :
  ?code_delivery_details_list:code_delivery_details_list_type ->
  unit ->
  update_user_attributes_response

val make_attribute_type :
  ?value:attribute_value_type -> name:attribute_name_type -> unit -> attribute_type

val make_update_user_attributes_request :
  ?client_metadata:client_metadata_type ->
  user_attributes:attribute_list_type ->
  access_token:token_model_type ->
  unit ->
  update_user_attributes_request

val make_terms_type :
  terms_id:terms_id_type ->
  user_pool_id:user_pool_id_type ->
  client_id:client_id_type ->
  terms_name:terms_name_type ->
  terms_source:terms_source_type ->
  enforcement:terms_enforcement_type ->
  links:links_type ->
  creation_date:date_type ->
  last_modified_date:date_type ->
  unit ->
  terms_type

val make_update_terms_response : ?terms:terms_type -> unit -> update_terms_response

val make_update_terms_request :
  ?terms_name:terms_name_type ->
  ?terms_source:terms_source_type ->
  ?enforcement:terms_enforcement_type ->
  ?links:links_type ->
  terms_id:terms_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  update_terms_request

val make_resource_server_scope_type :
  scope_name:resource_server_scope_name_type ->
  scope_description:resource_server_scope_description_type ->
  unit ->
  resource_server_scope_type

val make_resource_server_type :
  ?user_pool_id:user_pool_id_type ->
  ?identifier:resource_server_identifier_type ->
  ?name:resource_server_name_type ->
  ?scopes:resource_server_scope_list_type ->
  unit ->
  resource_server_type

val make_update_resource_server_response :
  resource_server:resource_server_type -> unit -> update_resource_server_response

val make_update_resource_server_request :
  ?scopes:resource_server_scope_list_type ->
  user_pool_id:user_pool_id_type ->
  identifier:resource_server_identifier_type ->
  name:resource_server_name_type ->
  unit ->
  update_resource_server_request

val make_limit_definition_type :
  limit_class:limit_class -> attributes:string_to_string_map_type -> unit -> limit_definition_type

val make_limit_type :
  limit_definition:limit_definition_type ->
  provisioned_limit_value:integer_type ->
  free_limit_value:integer_type ->
  unit ->
  limit_type

val make_update_provisioned_limit_response :
  limit:limit_type -> unit -> update_provisioned_limit_response

val make_update_provisioned_limit_request :
  limit_definition:limit_definition_type ->
  requested_limit_value:integer_type ->
  unit ->
  update_provisioned_limit_request

val make_asset_type :
  ?bytes:asset_bytes_type ->
  ?resource_id:resource_id_type ->
  category:asset_category_type ->
  color_mode:color_scheme_mode_type ->
  extension:asset_extension_type ->
  unit ->
  asset_type

val make_managed_login_branding_type :
  ?managed_login_branding_id:managed_login_branding_id_type ->
  ?user_pool_id:user_pool_id_type ->
  ?use_cognito_provided_values:boolean_type ->
  ?settings:document ->
  ?assets:asset_list_type ->
  ?creation_date:date_type ->
  ?last_modified_date:date_type ->
  unit ->
  managed_login_branding_type

val make_update_managed_login_branding_response :
  ?managed_login_branding:managed_login_branding_type ->
  unit ->
  update_managed_login_branding_response

val make_update_managed_login_branding_request :
  ?user_pool_id:user_pool_id_type ->
  ?managed_login_branding_id:managed_login_branding_id_type ->
  ?use_cognito_provided_values:boolean_type ->
  ?settings:document ->
  ?assets:asset_list_type ->
  unit ->
  update_managed_login_branding_request

val make_identity_provider_type :
  ?user_pool_id:user_pool_id_type ->
  ?provider_name:provider_name_type ->
  ?provider_type:identity_provider_type_type ->
  ?provider_details:provider_details_type ->
  ?attribute_mapping:attribute_mapping_type ->
  ?idp_identifiers:idp_identifiers_list_type ->
  ?last_modified_date:date_type ->
  ?creation_date:date_type ->
  unit ->
  identity_provider_type

val make_update_identity_provider_response :
  identity_provider:identity_provider_type -> unit -> update_identity_provider_response

val make_update_identity_provider_request :
  ?provider_details:provider_details_type ->
  ?attribute_mapping:attribute_mapping_type ->
  ?idp_identifiers:idp_identifiers_list_type ->
  user_pool_id:user_pool_id_type ->
  provider_name:provider_name_type ->
  unit ->
  update_identity_provider_request

val make_group_type :
  ?group_name:group_name_type ->
  ?user_pool_id:user_pool_id_type ->
  ?description:description_type ->
  ?role_arn:arn_type ->
  ?precedence:precedence_type ->
  ?last_modified_date:date_type ->
  ?creation_date:date_type ->
  unit ->
  group_type

val make_update_group_response : ?group:group_type -> unit -> update_group_response

val make_update_group_request :
  ?description:description_type ->
  ?role_arn:arn_type ->
  ?precedence:precedence_type ->
  group_name:group_name_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  update_group_request

val make_update_device_status_response : unit -> unit

val make_update_device_status_request :
  ?device_remembered_status:device_remembered_status_type ->
  access_token:token_model_type ->
  device_key:device_key_type ->
  unit ->
  update_device_status_request

val make_update_auth_event_feedback_response : unit -> unit

val make_update_auth_event_feedback_request :
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  event_id:event_id_type ->
  feedback_token:token_model_type ->
  feedback_value:feedback_value_type ->
  unit ->
  update_auth_event_feedback_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:arn_type -> tag_keys:user_pool_tags_list_type -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:arn_type -> tags:user_pool_tags_type -> unit -> tag_resource_request

val make_user_import_job_type :
  ?job_name:user_import_job_name_type ->
  ?job_id:user_import_job_id_type ->
  ?user_pool_id:user_pool_id_type ->
  ?pre_signed_url:pre_signed_url_type ->
  ?creation_date:date_type ->
  ?start_date:date_type ->
  ?completion_date:date_type ->
  ?status:user_import_job_status_type ->
  ?cloud_watch_logs_role_arn:arn_type ->
  ?imported_users:long_type ->
  ?skipped_users:long_type ->
  ?failed_users:long_type ->
  ?completion_message:completion_message_type ->
  unit ->
  user_import_job_type

val make_stop_user_import_job_response :
  ?user_import_job:user_import_job_type -> unit -> stop_user_import_job_response

val make_stop_user_import_job_request :
  user_pool_id:user_pool_id_type ->
  job_id:user_import_job_id_type ->
  unit ->
  stop_user_import_job_request

val make_start_web_authn_registration_response :
  credential_creation_options:document -> unit -> start_web_authn_registration_response

val make_start_web_authn_registration_request :
  access_token:token_model_type -> unit -> start_web_authn_registration_request

val make_start_user_import_job_response :
  ?user_import_job:user_import_job_type -> unit -> start_user_import_job_response

val make_start_user_import_job_request :
  user_pool_id:user_pool_id_type ->
  job_id:user_import_job_id_type ->
  unit ->
  start_user_import_job_request

val make_sign_up_response :
  ?code_delivery_details:code_delivery_details_type ->
  ?session:session_type ->
  user_confirmed:boolean_type ->
  user_sub:string_type ->
  unit ->
  sign_up_response

val make_user_context_data_type :
  ?ip_address:string_type -> ?encoded_data:string_type -> unit -> user_context_data_type

val make_analytics_metadata_type :
  ?analytics_endpoint_id:string_type -> unit -> analytics_metadata_type

val make_sign_up_request :
  ?secret_hash:secret_hash_type ->
  ?password:password_type ->
  ?user_attributes:attribute_list_type ->
  ?validation_data:attribute_list_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?user_context_data:user_context_data_type ->
  ?client_metadata:client_metadata_type ->
  client_id:client_id_type ->
  username:username_type ->
  unit ->
  sign_up_request

val make_set_user_settings_response : unit -> unit

val make_mfa_option_type :
  ?delivery_medium:delivery_medium_type ->
  ?attribute_name:attribute_name_type ->
  unit ->
  mfa_option_type

val make_set_user_settings_request :
  access_token:token_model_type ->
  mfa_options:mfa_option_list_type ->
  unit ->
  set_user_settings_request

val make_web_authn_configuration_type :
  ?relying_party_id:relying_party_id_type ->
  ?user_verification:user_verification_type ->
  ?factor_configuration:web_authn_factor_configuration_type ->
  unit ->
  web_authn_configuration_type

val make_email_mfa_config_type :
  ?message:email_mfa_message_type ->
  ?subject:email_mfa_subject_type ->
  unit ->
  email_mfa_config_type

val make_software_token_mfa_config_type :
  ?enabled:boolean_type -> unit -> software_token_mfa_config_type

val make_sms_mfa_config_type :
  ?sms_authentication_message:sms_verification_message_type ->
  ?sms_configuration:sms_configuration_type ->
  unit ->
  sms_mfa_config_type

val make_set_user_pool_mfa_config_response :
  ?sms_mfa_configuration:sms_mfa_config_type ->
  ?software_token_mfa_configuration:software_token_mfa_config_type ->
  ?email_mfa_configuration:email_mfa_config_type ->
  ?mfa_configuration:user_pool_mfa_type ->
  ?web_authn_configuration:web_authn_configuration_type ->
  unit ->
  set_user_pool_mfa_config_response

val make_set_user_pool_mfa_config_request :
  ?sms_mfa_configuration:sms_mfa_config_type ->
  ?software_token_mfa_configuration:software_token_mfa_config_type ->
  ?email_mfa_configuration:email_mfa_config_type ->
  ?mfa_configuration:user_pool_mfa_type ->
  ?web_authn_configuration:web_authn_configuration_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  set_user_pool_mfa_config_request

val make_set_user_mfa_preference_response : unit -> unit
val make_web_authn_mfa_settings_type : ?enabled:boolean_type -> unit -> web_authn_mfa_settings_type

val make_email_mfa_settings_type :
  ?enabled:boolean_type -> ?preferred_mfa:boolean_type -> unit -> email_mfa_settings_type

val make_software_token_mfa_settings_type :
  ?enabled:boolean_type -> ?preferred_mfa:boolean_type -> unit -> software_token_mfa_settings_type

val make_sms_mfa_settings_type :
  ?enabled:boolean_type -> ?preferred_mfa:boolean_type -> unit -> sms_mfa_settings_type

val make_set_user_mfa_preference_request :
  ?sms_mfa_settings:sms_mfa_settings_type ->
  ?software_token_mfa_settings:software_token_mfa_settings_type ->
  ?email_mfa_settings:email_mfa_settings_type ->
  ?web_authn_mfa_settings:web_authn_mfa_settings_type ->
  access_token:token_model_type ->
  unit ->
  set_user_mfa_preference_request

val make_ui_customization_type :
  ?user_pool_id:user_pool_id_type ->
  ?client_id:client_id_type ->
  ?image_url:image_url_type ->
  ?cs_s:css_type ->
  ?css_version:css_version_type ->
  ?last_modified_date:date_type ->
  ?creation_date:date_type ->
  unit ->
  ui_customization_type

val make_set_ui_customization_response :
  ui_customization:ui_customization_type -> unit -> set_ui_customization_response

val make_set_ui_customization_request :
  ?client_id:client_id_type ->
  ?cs_s:css_type ->
  ?image_file:image_file_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  set_ui_customization_request

val make_risk_exception_configuration_type :
  ?blocked_ip_range_list:blocked_ip_range_list_type ->
  ?skipped_ip_range_list:skipped_ip_range_list_type ->
  unit ->
  risk_exception_configuration_type

val make_account_takeover_action_type :
  notify:account_takeover_action_notify_type ->
  event_action:account_takeover_event_action_type ->
  unit ->
  account_takeover_action_type

val make_account_takeover_actions_type :
  ?low_action:account_takeover_action_type ->
  ?medium_action:account_takeover_action_type ->
  ?high_action:account_takeover_action_type ->
  unit ->
  account_takeover_actions_type

val make_notify_email_type :
  ?html_body:email_notification_body_type ->
  ?text_body:email_notification_body_type ->
  subject:email_notification_subject_type ->
  unit ->
  notify_email_type

val make_notify_configuration_type :
  ?from_:string_type ->
  ?reply_to:string_type ->
  ?block_email:notify_email_type ->
  ?no_action_email:notify_email_type ->
  ?mfa_email:notify_email_type ->
  source_arn:arn_type ->
  unit ->
  notify_configuration_type

val make_account_takeover_risk_configuration_type :
  ?notify_configuration:notify_configuration_type ->
  actions:account_takeover_actions_type ->
  unit ->
  account_takeover_risk_configuration_type

val make_compromised_credentials_actions_type :
  event_action:compromised_credentials_event_action_type ->
  unit ->
  compromised_credentials_actions_type

val make_compromised_credentials_risk_configuration_type :
  ?event_filter:event_filters_type ->
  actions:compromised_credentials_actions_type ->
  unit ->
  compromised_credentials_risk_configuration_type

val make_risk_configuration_type :
  ?user_pool_id:user_pool_id_type ->
  ?client_id:client_id_type ->
  ?compromised_credentials_risk_configuration:compromised_credentials_risk_configuration_type ->
  ?account_takeover_risk_configuration:account_takeover_risk_configuration_type ->
  ?risk_exception_configuration:risk_exception_configuration_type ->
  ?last_modified_date:date_type ->
  unit ->
  risk_configuration_type

val make_set_risk_configuration_response :
  risk_configuration:risk_configuration_type -> unit -> set_risk_configuration_response

val make_set_risk_configuration_request :
  ?client_id:client_id_type ->
  ?compromised_credentials_risk_configuration:compromised_credentials_risk_configuration_type ->
  ?account_takeover_risk_configuration:account_takeover_risk_configuration_type ->
  ?risk_exception_configuration:risk_exception_configuration_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  set_risk_configuration_request

val make_firehose_configuration_type : ?stream_arn:arn_type -> unit -> firehose_configuration_type
val make_s3_configuration_type : ?bucket_arn:s3_arn_type -> unit -> s3_configuration_type

val make_cloud_watch_logs_configuration_type :
  ?log_group_arn:arn_type -> unit -> cloud_watch_logs_configuration_type

val make_log_configuration_type :
  ?cloud_watch_logs_configuration:cloud_watch_logs_configuration_type ->
  ?s3_configuration:s3_configuration_type ->
  ?firehose_configuration:firehose_configuration_type ->
  log_level:log_level ->
  event_source:event_source_name ->
  unit ->
  log_configuration_type

val make_log_delivery_configuration_type :
  user_pool_id:user_pool_id_type ->
  log_configurations:log_configuration_list_type ->
  unit ->
  log_delivery_configuration_type

val make_set_log_delivery_configuration_response :
  ?log_delivery_configuration:log_delivery_configuration_type ->
  unit ->
  set_log_delivery_configuration_response

val make_set_log_delivery_configuration_request :
  user_pool_id:user_pool_id_type ->
  log_configurations:log_configuration_list_type ->
  unit ->
  set_log_delivery_configuration_request

val make_revoke_token_response : unit -> unit

val make_revoke_token_request :
  ?client_secret:client_secret_type ->
  token:token_model_type ->
  client_id:client_id_type ->
  unit ->
  revoke_token_request

val make_new_device_metadata_type :
  ?device_key:device_key_type -> ?device_group_key:string_type -> unit -> new_device_metadata_type

val make_authentication_result_type :
  ?access_token:token_model_type ->
  ?expires_in:integer_type ->
  ?token_type:string_type ->
  ?refresh_token:token_model_type ->
  ?id_token:token_model_type ->
  ?new_device_metadata:new_device_metadata_type ->
  unit ->
  authentication_result_type

val make_respond_to_auth_challenge_response :
  ?challenge_name:challenge_name_type ->
  ?session:session_type ->
  ?challenge_parameters:challenge_parameters_type ->
  ?authentication_result:authentication_result_type ->
  unit ->
  respond_to_auth_challenge_response

val make_respond_to_auth_challenge_request :
  ?session:session_type ->
  ?challenge_responses:challenge_responses_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?user_context_data:user_context_data_type ->
  ?client_metadata:client_metadata_type ->
  client_id:client_id_type ->
  challenge_name:challenge_name_type ->
  unit ->
  respond_to_auth_challenge_request

val make_resend_confirmation_code_response :
  ?code_delivery_details:code_delivery_details_type -> unit -> resend_confirmation_code_response

val make_resend_confirmation_code_request :
  ?secret_hash:secret_hash_type ->
  ?user_context_data:user_context_data_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?client_metadata:client_metadata_type ->
  client_id:client_id_type ->
  username:username_type ->
  unit ->
  resend_confirmation_code_request

val make_web_authn_credential_description :
  ?authenticator_attachment:web_authn_authenticator_attachment_type ->
  credential_id:string_type ->
  friendly_credential_name:string_type ->
  relying_party_id:string_type ->
  authenticator_transports:web_authn_authenticator_transports_list ->
  created_at:date_type ->
  unit ->
  web_authn_credential_description

val make_list_web_authn_credentials_response :
  ?next_token:pagination_key ->
  credentials:web_authn_credential_description_list_type ->
  unit ->
  list_web_authn_credentials_response

val make_list_web_authn_credentials_request :
  ?next_token:pagination_key ->
  ?max_results:web_authn_credentials_query_limit_type ->
  access_token:token_model_type ->
  unit ->
  list_web_authn_credentials_request

val make_user_type :
  ?username:username_type ->
  ?attributes:attribute_list_type ->
  ?user_create_date:date_type ->
  ?user_last_modified_date:date_type ->
  ?enabled:boolean_type ->
  ?user_status:user_status_type ->
  ?mfa_options:mfa_option_list_type ->
  unit ->
  user_type

val make_list_users_in_group_response :
  ?users:users_list_type -> ?next_token:pagination_key -> unit -> list_users_in_group_response

val make_list_users_in_group_request :
  ?limit:query_limit_type ->
  ?next_token:pagination_key ->
  user_pool_id:user_pool_id_type ->
  group_name:group_name_type ->
  unit ->
  list_users_in_group_request

val make_list_users_response :
  ?users:users_list_type ->
  ?pagination_token:search_pagination_token_type ->
  unit ->
  list_users_response

val make_list_users_request :
  ?attributes_to_get:searched_attribute_names_list_type ->
  ?limit:query_limit_type ->
  ?pagination_token:search_pagination_token_type ->
  ?filter:user_filter_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  list_users_request

val make_user_pool_description_type :
  ?id:user_pool_id_type ->
  ?name:user_pool_name_type ->
  ?lambda_config:lambda_config_type ->
  ?status:status_type ->
  ?last_modified_date:date_type ->
  ?creation_date:date_type ->
  ?replica_regions:replica_regions_type ->
  unit ->
  user_pool_description_type

val make_list_user_pools_response :
  ?user_pools:user_pool_list_type ->
  ?next_token:pagination_key_type ->
  unit ->
  list_user_pools_response

val make_list_user_pools_request :
  ?next_token:pagination_key_type ->
  max_results:pool_query_limit_type ->
  unit ->
  list_user_pools_request

val make_list_user_pool_replicas_response :
  ?user_pool_replicas:user_pool_replica_list_type ->
  ?next_token:pagination_key_type ->
  unit ->
  list_user_pool_replicas_response

val make_list_user_pool_replicas_request :
  ?next_token:pagination_key_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  list_user_pool_replicas_request

val make_client_secret_descriptor_type :
  ?client_secret_id:client_secret_id_type ->
  ?client_secret_value:client_secret_type ->
  ?client_secret_create_date:date_type ->
  unit ->
  client_secret_descriptor_type

val make_list_user_pool_client_secrets_response :
  ?client_secrets:client_secret_descriptor_list_type ->
  ?next_token:pagination_key ->
  unit ->
  list_user_pool_client_secrets_response

val make_list_user_pool_client_secrets_request :
  ?next_token:pagination_key ->
  user_pool_id:user_pool_id_type ->
  client_id:client_id_type ->
  unit ->
  list_user_pool_client_secrets_request

val make_user_pool_client_description :
  ?client_id:client_id_type ->
  ?user_pool_id:user_pool_id_type ->
  ?client_name:client_name_type ->
  unit ->
  user_pool_client_description

val make_list_user_pool_clients_response :
  ?user_pool_clients:user_pool_client_list_type ->
  ?next_token:pagination_key ->
  unit ->
  list_user_pool_clients_response

val make_list_user_pool_clients_request :
  ?max_results:query_limit ->
  ?next_token:pagination_key ->
  user_pool_id:user_pool_id_type ->
  unit ->
  list_user_pool_clients_request

val make_list_user_import_jobs_response :
  ?user_import_jobs:user_import_jobs_list_type ->
  ?pagination_token:pagination_key_type ->
  unit ->
  list_user_import_jobs_response

val make_list_user_import_jobs_request :
  ?pagination_token:pagination_key_type ->
  user_pool_id:user_pool_id_type ->
  max_results:pool_query_limit_type ->
  unit ->
  list_user_import_jobs_request

val make_terms_description_type :
  terms_id:terms_id_type ->
  terms_name:terms_name_type ->
  enforcement:terms_enforcement_type ->
  creation_date:date_type ->
  last_modified_date:date_type ->
  unit ->
  terms_description_type

val make_list_terms_response :
  ?next_token:string_type -> terms:terms_description_list_type -> unit -> list_terms_response

val make_list_terms_request :
  ?max_results:list_terms_request_max_results_integer ->
  ?next_token:string_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  list_terms_request

val make_list_tags_for_resource_response :
  ?tags:user_pool_tags_type -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:arn_type -> unit -> list_tags_for_resource_request

val make_list_resource_servers_response :
  ?next_token:pagination_key_type ->
  resource_servers:resource_servers_list_type ->
  unit ->
  list_resource_servers_response

val make_list_resource_servers_request :
  ?max_results:list_resource_servers_limit_type ->
  ?next_token:pagination_key_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  list_resource_servers_request

val make_provider_description :
  ?provider_name:provider_name_type ->
  ?provider_type:identity_provider_type_type ->
  ?last_modified_date:date_type ->
  ?creation_date:date_type ->
  unit ->
  provider_description

val make_list_identity_providers_response :
  ?next_token:pagination_key_type ->
  providers:providers_list_type ->
  unit ->
  list_identity_providers_response

val make_list_identity_providers_request :
  ?max_results:list_providers_limit_type ->
  ?next_token:pagination_key_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  list_identity_providers_request

val make_list_groups_response :
  ?groups:group_list_type -> ?next_token:pagination_key -> unit -> list_groups_response

val make_list_groups_request :
  ?limit:query_limit_type ->
  ?next_token:pagination_key ->
  user_pool_id:user_pool_id_type ->
  unit ->
  list_groups_request

val make_device_type :
  ?device_key:device_key_type ->
  ?device_attributes:attribute_list_type ->
  ?device_create_date:date_type ->
  ?device_last_modified_date:date_type ->
  ?device_last_authenticated_date:date_type ->
  unit ->
  device_type

val make_list_devices_response :
  ?devices:device_list_type ->
  ?pagination_token:search_pagination_token_type ->
  unit ->
  list_devices_response

val make_list_devices_request :
  ?limit:query_limit_type ->
  ?pagination_token:search_pagination_token_type ->
  access_token:token_model_type ->
  unit ->
  list_devices_request

val make_initiate_auth_response :
  ?challenge_name:challenge_name_type ->
  ?session:session_type ->
  ?challenge_parameters:challenge_parameters_type ->
  ?authentication_result:authentication_result_type ->
  ?available_challenges:available_challenge_list_type ->
  unit ->
  initiate_auth_response

val make_initiate_auth_request :
  ?auth_parameters:auth_parameters_type ->
  ?client_metadata:client_metadata_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?user_context_data:user_context_data_type ->
  ?session:session_type ->
  auth_flow:auth_flow_type ->
  client_id:client_id_type ->
  unit ->
  initiate_auth_request

val make_global_sign_out_response : unit -> unit
val make_global_sign_out_request : access_token:token_model_type -> unit -> global_sign_out_request

val make_get_user_pool_mfa_config_response :
  ?sms_mfa_configuration:sms_mfa_config_type ->
  ?software_token_mfa_configuration:software_token_mfa_config_type ->
  ?email_mfa_configuration:email_mfa_config_type ->
  ?mfa_configuration:user_pool_mfa_type ->
  ?web_authn_configuration:web_authn_configuration_type ->
  unit ->
  get_user_pool_mfa_config_response

val make_get_user_pool_mfa_config_request :
  user_pool_id:user_pool_id_type -> unit -> get_user_pool_mfa_config_request

val make_get_user_auth_factors_response :
  ?preferred_mfa_setting:string_type ->
  ?user_mfa_setting_list:user_mfa_setting_list_type ->
  ?configured_user_auth_factors:configured_user_auth_factors_list_type ->
  username:username_type ->
  unit ->
  get_user_auth_factors_response

val make_get_user_auth_factors_request :
  access_token:token_model_type -> unit -> get_user_auth_factors_request

val make_get_user_attribute_verification_code_response :
  ?code_delivery_details:code_delivery_details_type ->
  unit ->
  get_user_attribute_verification_code_response

val make_get_user_attribute_verification_code_request :
  ?client_metadata:client_metadata_type ->
  access_token:token_model_type ->
  attribute_name:attribute_name_type ->
  unit ->
  get_user_attribute_verification_code_request

val make_get_user_response :
  ?mfa_options:mfa_option_list_type ->
  ?preferred_mfa_setting:string_type ->
  ?user_mfa_setting_list:user_mfa_setting_list_type ->
  username:username_type ->
  user_attributes:attribute_list_type ->
  unit ->
  get_user_response

val make_get_user_request : access_token:token_model_type -> unit -> get_user_request

val make_get_ui_customization_response :
  ui_customization:ui_customization_type -> unit -> get_ui_customization_response

val make_get_ui_customization_request :
  ?client_id:client_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  get_ui_customization_request

val make_get_tokens_from_refresh_token_response :
  ?authentication_result:authentication_result_type ->
  unit ->
  get_tokens_from_refresh_token_response

val make_get_tokens_from_refresh_token_request :
  ?client_secret:client_secret_type ->
  ?device_key:device_key_type ->
  ?client_metadata:client_metadata_type ->
  refresh_token:token_model_type ->
  client_id:client_id_type ->
  unit ->
  get_tokens_from_refresh_token_request

val make_get_signing_certificate_response :
  ?certificate:string_type -> unit -> get_signing_certificate_response

val make_get_signing_certificate_request :
  user_pool_id:user_pool_id_type -> unit -> get_signing_certificate_request

val make_get_provisioned_limit_response : limit:limit_type -> unit -> get_provisioned_limit_response

val make_get_provisioned_limit_request :
  limit_definition:limit_definition_type -> unit -> get_provisioned_limit_request

val make_get_log_delivery_configuration_response :
  ?log_delivery_configuration:log_delivery_configuration_type ->
  unit ->
  get_log_delivery_configuration_response

val make_get_log_delivery_configuration_request :
  user_pool_id:user_pool_id_type -> unit -> get_log_delivery_configuration_request

val make_get_identity_provider_by_identifier_response :
  identity_provider:identity_provider_type -> unit -> get_identity_provider_by_identifier_response

val make_get_identity_provider_by_identifier_request :
  user_pool_id:user_pool_id_type ->
  idp_identifier:idp_identifier_type ->
  unit ->
  get_identity_provider_by_identifier_request

val make_get_group_response : ?group:group_type -> unit -> get_group_response

val make_get_group_request :
  group_name:group_name_type -> user_pool_id:user_pool_id_type -> unit -> get_group_request

val make_get_device_response : device:device_type -> unit -> get_device_response

val make_get_device_request :
  ?access_token:token_model_type -> device_key:device_key_type -> unit -> get_device_request

val make_get_csv_header_response :
  ?user_pool_id:user_pool_id_type ->
  ?csv_header:list_of_string_types ->
  unit ->
  get_csv_header_response

val make_get_csv_header_request : user_pool_id:user_pool_id_type -> unit -> get_csv_header_request

val make_forgot_password_response :
  ?code_delivery_details:code_delivery_details_type -> unit -> forgot_password_response

val make_forgot_password_request :
  ?secret_hash:secret_hash_type ->
  ?user_context_data:user_context_data_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?client_metadata:client_metadata_type ->
  client_id:client_id_type ->
  username:username_type ->
  unit ->
  forgot_password_request

val make_forget_device_request :
  ?access_token:token_model_type -> device_key:device_key_type -> unit -> forget_device_request

val make_domain_description_type :
  ?user_pool_id:user_pool_id_type ->
  ?aws_account_id:aws_account_id_type ->
  ?domain:domain_type ->
  ?s3_bucket:s3_bucket_type ->
  ?cloud_front_distribution:string_type ->
  ?version:domain_version_type ->
  ?status:domain_status_type ->
  ?custom_domain_config:custom_domain_config_type ->
  ?managed_login_version:wrapped_integer_type ->
  ?routing:routing_type ->
  unit ->
  domain_description_type

val make_describe_user_pool_domain_response :
  ?domain_description:domain_description_type -> unit -> describe_user_pool_domain_response

val make_describe_user_pool_domain_request :
  domain:domain_type -> unit -> describe_user_pool_domain_request

val make_describe_user_pool_client_response :
  ?user_pool_client:user_pool_client_type -> unit -> describe_user_pool_client_response

val make_describe_user_pool_client_request :
  user_pool_id:user_pool_id_type ->
  client_id:client_id_type ->
  unit ->
  describe_user_pool_client_request

val make_username_configuration_type :
  case_sensitive:wrapped_boolean_type -> unit -> username_configuration_type

val make_string_attribute_constraints_type :
  ?min_length:string_type -> ?max_length:string_type -> unit -> string_attribute_constraints_type

val make_number_attribute_constraints_type :
  ?min_value:string_type -> ?max_value:string_type -> unit -> number_attribute_constraints_type

val make_schema_attribute_type :
  ?name:custom_attribute_name_type ->
  ?attribute_data_type:attribute_data_type ->
  ?developer_only_attribute:boolean_type ->
  ?\#mutable:boolean_type ->
  ?required:boolean_type ->
  ?number_attribute_constraints:number_attribute_constraints_type ->
  ?string_attribute_constraints:string_attribute_constraints_type ->
  unit ->
  schema_attribute_type

val make_user_pool_type :
  ?id:user_pool_id_type ->
  ?name:user_pool_name_type ->
  ?policies:user_pool_policy_type ->
  ?deletion_protection:deletion_protection_type ->
  ?lambda_config:lambda_config_type ->
  ?status:status_type ->
  ?last_modified_date:date_type ->
  ?creation_date:date_type ->
  ?schema_attributes:schema_attributes_list_type ->
  ?auto_verified_attributes:verified_attributes_list_type ->
  ?alias_attributes:alias_attributes_list_type ->
  ?username_attributes:username_attributes_list_type ->
  ?sms_verification_message:sms_verification_message_type ->
  ?email_verification_message:email_verification_message_type ->
  ?email_verification_subject:email_verification_subject_type ->
  ?verification_message_template:verification_message_template_type ->
  ?sms_authentication_message:sms_verification_message_type ->
  ?user_attribute_update_settings:user_attribute_update_settings_type ->
  ?mfa_configuration:user_pool_mfa_type ->
  ?device_configuration:device_configuration_type ->
  ?estimated_number_of_users:integer_type ->
  ?email_configuration:email_configuration_type ->
  ?sms_configuration:sms_configuration_type ->
  ?user_pool_tags:user_pool_tags_type ->
  ?sms_configuration_failure:string_type ->
  ?email_configuration_failure:string_type ->
  ?domain:domain_type ->
  ?custom_domain:domain_type ->
  ?admin_create_user_config:admin_create_user_config_type ->
  ?user_pool_add_ons:user_pool_add_ons_type ->
  ?username_configuration:username_configuration_type ->
  ?arn:arn_type ->
  ?account_recovery_setting:account_recovery_setting_type ->
  ?user_pool_tier:user_pool_tier_type ->
  ?key_configuration:key_configuration_type ->
  ?issuer_configuration:issuer_configuration_type ->
  unit ->
  user_pool_type

val make_describe_user_pool_response :
  ?user_pool:user_pool_type -> unit -> describe_user_pool_response

val make_describe_user_pool_request :
  user_pool_id:user_pool_id_type -> unit -> describe_user_pool_request

val make_describe_user_import_job_response :
  ?user_import_job:user_import_job_type -> unit -> describe_user_import_job_response

val make_describe_user_import_job_request :
  user_pool_id:user_pool_id_type ->
  job_id:user_import_job_id_type ->
  unit ->
  describe_user_import_job_request

val make_describe_terms_response : ?terms:terms_type -> unit -> describe_terms_response

val make_describe_terms_request :
  terms_id:terms_id_type -> user_pool_id:user_pool_id_type -> unit -> describe_terms_request

val make_describe_risk_configuration_response :
  risk_configuration:risk_configuration_type -> unit -> describe_risk_configuration_response

val make_describe_risk_configuration_request :
  ?client_id:client_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  describe_risk_configuration_request

val make_describe_resource_server_response :
  resource_server:resource_server_type -> unit -> describe_resource_server_response

val make_describe_resource_server_request :
  user_pool_id:user_pool_id_type ->
  identifier:resource_server_identifier_type ->
  unit ->
  describe_resource_server_request

val make_describe_managed_login_branding_by_client_response :
  ?managed_login_branding:managed_login_branding_type ->
  unit ->
  describe_managed_login_branding_by_client_response

val make_describe_managed_login_branding_by_client_request :
  ?return_merged_resources:boolean_type ->
  user_pool_id:user_pool_id_type ->
  client_id:client_id_type ->
  unit ->
  describe_managed_login_branding_by_client_request

val make_describe_managed_login_branding_response :
  ?managed_login_branding:managed_login_branding_type ->
  unit ->
  describe_managed_login_branding_response

val make_describe_managed_login_branding_request :
  ?return_merged_resources:boolean_type ->
  user_pool_id:user_pool_id_type ->
  managed_login_branding_id:managed_login_branding_id_type ->
  unit ->
  describe_managed_login_branding_request

val make_describe_identity_provider_response :
  identity_provider:identity_provider_type -> unit -> describe_identity_provider_response

val make_describe_identity_provider_request :
  user_pool_id:user_pool_id_type ->
  provider_name:provider_name_type ->
  unit ->
  describe_identity_provider_request

val make_delete_web_authn_credential_response : unit -> unit

val make_delete_web_authn_credential_request :
  access_token:token_model_type ->
  credential_id:string_type ->
  unit ->
  delete_web_authn_credential_request

val make_delete_user_pool_replica_response :
  ?user_pool_replica:user_pool_replica_type -> unit -> delete_user_pool_replica_response

val make_delete_user_pool_replica_request :
  user_pool_id:user_pool_id_type ->
  region_name:region_name_type ->
  unit ->
  delete_user_pool_replica_request

val make_delete_user_pool_domain_response : unit -> unit

val make_delete_user_pool_domain_request :
  domain:domain_type -> user_pool_id:user_pool_id_type -> unit -> delete_user_pool_domain_request

val make_delete_user_pool_client_secret_response : unit -> unit

val make_delete_user_pool_client_secret_request :
  user_pool_id:user_pool_id_type ->
  client_id:client_id_type ->
  client_secret_id:client_secret_id_type ->
  unit ->
  delete_user_pool_client_secret_request

val make_delete_user_pool_client_request :
  user_pool_id:user_pool_id_type ->
  client_id:client_id_type ->
  unit ->
  delete_user_pool_client_request

val make_delete_user_pool_request :
  user_pool_id:user_pool_id_type -> unit -> delete_user_pool_request

val make_delete_user_attributes_response : unit -> unit

val make_delete_user_attributes_request :
  user_attribute_names:attribute_name_list_type ->
  access_token:token_model_type ->
  unit ->
  delete_user_attributes_request

val make_delete_user_request : access_token:token_model_type -> unit -> delete_user_request

val make_delete_terms_request :
  terms_id:terms_id_type -> user_pool_id:user_pool_id_type -> unit -> delete_terms_request

val make_delete_resource_server_request :
  user_pool_id:user_pool_id_type ->
  identifier:resource_server_identifier_type ->
  unit ->
  delete_resource_server_request

val make_delete_managed_login_branding_request :
  managed_login_branding_id:managed_login_branding_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  delete_managed_login_branding_request

val make_delete_identity_provider_request :
  user_pool_id:user_pool_id_type ->
  provider_name:provider_name_type ->
  unit ->
  delete_identity_provider_request

val make_delete_group_request :
  group_name:group_name_type -> user_pool_id:user_pool_id_type -> unit -> delete_group_request

val make_create_user_pool_replica_response :
  ?user_pool_replica:user_pool_replica_type -> unit -> create_user_pool_replica_response

val make_create_user_pool_replica_request :
  ?user_pool_tags:user_pool_tags_type ->
  user_pool_id:user_pool_id_type ->
  region_name:region_name_type ->
  unit ->
  create_user_pool_replica_request

val make_create_user_pool_domain_response :
  ?managed_login_version:wrapped_integer_type ->
  ?cloud_front_domain:domain_type ->
  ?routing:routing_type ->
  unit ->
  create_user_pool_domain_response

val make_create_user_pool_domain_request :
  ?managed_login_version:wrapped_integer_type ->
  ?custom_domain_config:custom_domain_config_type ->
  ?routing:routing_type ->
  domain:domain_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  create_user_pool_domain_request

val make_create_user_pool_client_response :
  ?user_pool_client:user_pool_client_type -> unit -> create_user_pool_client_response

val make_create_user_pool_client_request :
  ?generate_secret:generate_secret ->
  ?client_secret:client_secret_type ->
  ?refresh_token_validity:refresh_token_validity_type ->
  ?access_token_validity:access_token_validity_type ->
  ?id_token_validity:id_token_validity_type ->
  ?token_validity_units:token_validity_units_type ->
  ?read_attributes:client_permission_list_type ->
  ?write_attributes:client_permission_list_type ->
  ?explicit_auth_flows:explicit_auth_flows_list_type ->
  ?supported_identity_providers:supported_identity_providers_list_type ->
  ?callback_ur_ls:callback_ur_ls_list_type ->
  ?logout_ur_ls:logout_ur_ls_list_type ->
  ?default_redirect_ur_i:redirect_url_type ->
  ?allowed_o_auth_flows:o_auth_flows_type ->
  ?allowed_o_auth_scopes:scope_list_type ->
  ?allowed_o_auth_flows_user_pool_client:boolean_type ->
  ?analytics_configuration:analytics_configuration_type ->
  ?prevent_user_existence_errors:prevent_user_existence_error_types ->
  ?enable_token_revocation:wrapped_boolean_type ->
  ?enable_propagate_additional_user_context_data:wrapped_boolean_type ->
  ?auth_session_validity:auth_session_validity_type ->
  ?refresh_token_rotation:refresh_token_rotation_type ->
  user_pool_id:user_pool_id_type ->
  client_name:client_name_type ->
  unit ->
  create_user_pool_client_request

val make_create_user_pool_response : ?user_pool:user_pool_type -> unit -> create_user_pool_response

val make_create_user_pool_request :
  ?policies:user_pool_policy_type ->
  ?deletion_protection:deletion_protection_type ->
  ?lambda_config:lambda_config_type ->
  ?auto_verified_attributes:verified_attributes_list_type ->
  ?alias_attributes:alias_attributes_list_type ->
  ?username_attributes:username_attributes_list_type ->
  ?sms_verification_message:sms_verification_message_type ->
  ?email_verification_message:email_verification_message_type ->
  ?email_verification_subject:email_verification_subject_type ->
  ?verification_message_template:verification_message_template_type ->
  ?sms_authentication_message:sms_verification_message_type ->
  ?mfa_configuration:user_pool_mfa_type ->
  ?user_attribute_update_settings:user_attribute_update_settings_type ->
  ?device_configuration:device_configuration_type ->
  ?email_configuration:email_configuration_type ->
  ?sms_configuration:sms_configuration_type ->
  ?user_pool_tags:user_pool_tags_type ->
  ?admin_create_user_config:admin_create_user_config_type ->
  ?schema:schema_attributes_list_type ->
  ?user_pool_add_ons:user_pool_add_ons_type ->
  ?username_configuration:username_configuration_type ->
  ?account_recovery_setting:account_recovery_setting_type ->
  ?user_pool_tier:user_pool_tier_type ->
  ?key_configuration:key_configuration_type ->
  ?issuer_configuration:issuer_configuration_type ->
  pool_name:user_pool_name_type ->
  unit ->
  create_user_pool_request

val make_create_user_import_job_response :
  ?user_import_job:user_import_job_type -> unit -> create_user_import_job_response

val make_create_user_import_job_request :
  job_name:user_import_job_name_type ->
  user_pool_id:user_pool_id_type ->
  cloud_watch_logs_role_arn:arn_type ->
  unit ->
  create_user_import_job_request

val make_create_terms_response : ?terms:terms_type -> unit -> create_terms_response

val make_create_terms_request :
  ?links:links_type ->
  user_pool_id:user_pool_id_type ->
  client_id:client_id_type ->
  terms_name:terms_name_type ->
  terms_source:terms_source_type ->
  enforcement:terms_enforcement_type ->
  unit ->
  create_terms_request

val make_create_resource_server_response :
  resource_server:resource_server_type -> unit -> create_resource_server_response

val make_create_resource_server_request :
  ?scopes:resource_server_scope_list_type ->
  user_pool_id:user_pool_id_type ->
  identifier:resource_server_identifier_type ->
  name:resource_server_name_type ->
  unit ->
  create_resource_server_request

val make_create_managed_login_branding_response :
  ?managed_login_branding:managed_login_branding_type ->
  unit ->
  create_managed_login_branding_response

val make_create_managed_login_branding_request :
  ?use_cognito_provided_values:boolean_type ->
  ?settings:document ->
  ?assets:asset_list_type ->
  user_pool_id:user_pool_id_type ->
  client_id:client_id_type ->
  unit ->
  create_managed_login_branding_request

val make_create_identity_provider_response :
  identity_provider:identity_provider_type -> unit -> create_identity_provider_response

val make_create_identity_provider_request :
  ?attribute_mapping:attribute_mapping_type ->
  ?idp_identifiers:idp_identifiers_list_type ->
  user_pool_id:user_pool_id_type ->
  provider_name:provider_name_type_v2 ->
  provider_type:identity_provider_type_type ->
  provider_details:provider_details_type ->
  unit ->
  create_identity_provider_request

val make_create_group_response : ?group:group_type -> unit -> create_group_response

val make_create_group_request :
  ?description:description_type ->
  ?role_arn:arn_type ->
  ?precedence:precedence_type ->
  group_name:group_name_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  create_group_request

val make_confirm_sign_up_response : ?session:session_type -> unit -> confirm_sign_up_response

val make_confirm_sign_up_request :
  ?secret_hash:secret_hash_type ->
  ?force_alias_creation:force_alias_creation ->
  ?analytics_metadata:analytics_metadata_type ->
  ?user_context_data:user_context_data_type ->
  ?client_metadata:client_metadata_type ->
  ?session:session_type ->
  client_id:client_id_type ->
  username:username_type ->
  confirmation_code:confirmation_code_type ->
  unit ->
  confirm_sign_up_request

val make_confirm_forgot_password_response : unit -> unit

val make_confirm_forgot_password_request :
  ?secret_hash:secret_hash_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?user_context_data:user_context_data_type ->
  ?client_metadata:client_metadata_type ->
  client_id:client_id_type ->
  username:username_type ->
  confirmation_code:confirmation_code_type ->
  password:password_type ->
  unit ->
  confirm_forgot_password_request

val make_confirm_device_response :
  ?user_confirmation_necessary:boolean_type -> unit -> confirm_device_response

val make_device_secret_verifier_config_type :
  ?password_verifier:string_type -> ?salt:string_type -> unit -> device_secret_verifier_config_type

val make_confirm_device_request :
  ?device_secret_verifier_config:device_secret_verifier_config_type ->
  ?device_name:device_name_type ->
  access_token:token_model_type ->
  device_key:device_key_type ->
  unit ->
  confirm_device_request

val make_complete_web_authn_registration_response : unit -> unit

val make_complete_web_authn_registration_request :
  access_token:token_model_type ->
  credential:document ->
  unit ->
  complete_web_authn_registration_request

val make_change_password_response : unit -> unit

val make_change_password_request :
  ?previous_password:password_type ->
  proposed_password:password_type ->
  access_token:token_model_type ->
  unit ->
  change_password_request

val make_associate_software_token_response :
  ?secret_code:secret_code_type ->
  ?session:session_type ->
  unit ->
  associate_software_token_response

val make_associate_software_token_request :
  ?access_token:token_model_type ->
  ?session:session_type ->
  unit ->
  associate_software_token_request

val make_admin_user_global_sign_out_response : unit -> unit

val make_admin_user_global_sign_out_request :
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  unit ->
  admin_user_global_sign_out_request

val make_admin_update_user_attributes_response : unit -> unit

val make_admin_update_user_attributes_request :
  ?client_metadata:client_metadata_type ->
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  user_attributes:attribute_list_type ->
  unit ->
  admin_update_user_attributes_request

val make_admin_update_device_status_response : unit -> unit

val make_admin_update_device_status_request :
  ?device_remembered_status:device_remembered_status_type ->
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  device_key:device_key_type ->
  unit ->
  admin_update_device_status_request

val make_admin_update_auth_event_feedback_response : unit -> unit

val make_admin_update_auth_event_feedback_request :
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  event_id:event_id_type ->
  feedback_value:feedback_value_type ->
  unit ->
  admin_update_auth_event_feedback_request

val make_admin_set_user_settings_response : unit -> unit

val make_admin_set_user_settings_request :
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  mfa_options:mfa_option_list_type ->
  unit ->
  admin_set_user_settings_request

val make_admin_set_user_password_response : unit -> unit

val make_admin_set_user_password_request :
  ?permanent:boolean_type ->
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  password:password_type ->
  unit ->
  admin_set_user_password_request

val make_admin_set_user_mfa_preference_response : unit -> unit

val make_admin_set_user_mfa_preference_request :
  ?sms_mfa_settings:sms_mfa_settings_type ->
  ?software_token_mfa_settings:software_token_mfa_settings_type ->
  ?email_mfa_settings:email_mfa_settings_type ->
  ?web_authn_mfa_settings:web_authn_mfa_settings_type ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_set_user_mfa_preference_request

val make_admin_respond_to_auth_challenge_response :
  ?challenge_name:challenge_name_type ->
  ?session:session_type ->
  ?challenge_parameters:challenge_parameters_type ->
  ?authentication_result:authentication_result_type ->
  unit ->
  admin_respond_to_auth_challenge_response

val make_http_header : ?header_name:string_type -> ?header_value:string_type -> unit -> http_header

val make_context_data_type :
  ?encoded_data:string_type ->
  ip_address:string_type ->
  server_name:string_type ->
  server_path:string_type ->
  http_headers:http_header_list ->
  unit ->
  context_data_type

val make_admin_respond_to_auth_challenge_request :
  ?challenge_responses:challenge_responses_type ->
  ?session:session_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?context_data:context_data_type ->
  ?client_metadata:client_metadata_type ->
  user_pool_id:user_pool_id_type ->
  client_id:client_id_type ->
  challenge_name:challenge_name_type ->
  unit ->
  admin_respond_to_auth_challenge_request

val make_admin_reset_user_password_response : unit -> unit

val make_admin_reset_user_password_request :
  ?client_metadata:client_metadata_type ->
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  unit ->
  admin_reset_user_password_request

val make_admin_remove_user_from_group_request :
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  group_name:group_name_type ->
  unit ->
  admin_remove_user_from_group_request

val make_event_feedback_type :
  ?feedback_date:date_type ->
  feedback_value:feedback_value_type ->
  provider:string_type ->
  unit ->
  event_feedback_type

val make_event_context_data_type :
  ?ip_address:string_type ->
  ?device_name:string_type ->
  ?timezone:string_type ->
  ?city:string_type ->
  ?country:string_type ->
  unit ->
  event_context_data_type

val make_challenge_response_type :
  ?challenge_name:challenge_name ->
  ?challenge_response:challenge_response ->
  unit ->
  challenge_response_type

val make_event_risk_type :
  ?risk_decision:risk_decision_type ->
  ?risk_level:risk_level_type ->
  ?compromised_credentials_detected:wrapped_boolean_type ->
  unit ->
  event_risk_type

val make_auth_event_type :
  ?event_id:string_type ->
  ?event_type:event_type ->
  ?creation_date:date_type ->
  ?event_response:event_response_type ->
  ?event_risk:event_risk_type ->
  ?challenge_responses:challenge_response_list_type ->
  ?event_context_data:event_context_data_type ->
  ?event_feedback:event_feedback_type ->
  unit ->
  auth_event_type

val make_admin_list_user_auth_events_response :
  ?auth_events:auth_events_type ->
  ?next_token:pagination_key ->
  unit ->
  admin_list_user_auth_events_response

val make_admin_list_user_auth_events_request :
  ?max_results:query_limit_type ->
  ?next_token:pagination_key ->
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  unit ->
  admin_list_user_auth_events_request

val make_admin_list_groups_for_user_response :
  ?groups:group_list_type ->
  ?next_token:pagination_key ->
  unit ->
  admin_list_groups_for_user_response

val make_admin_list_groups_for_user_request :
  ?limit:query_limit_type ->
  ?next_token:pagination_key ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_list_groups_for_user_request

val make_admin_list_devices_response :
  ?devices:device_list_type ->
  ?pagination_token:search_pagination_token_type ->
  unit ->
  admin_list_devices_response

val make_admin_list_devices_request :
  ?limit:query_limit_type ->
  ?pagination_token:search_pagination_token_type ->
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  unit ->
  admin_list_devices_request

val make_admin_link_provider_for_user_response : unit -> unit

val make_provider_user_identifier_type :
  ?provider_name:provider_name_type ->
  ?provider_attribute_name:string_type ->
  ?provider_attribute_value:string_type ->
  unit ->
  provider_user_identifier_type

val make_admin_link_provider_for_user_request :
  user_pool_id:string_type ->
  destination_user:provider_user_identifier_type ->
  source_user:provider_user_identifier_type ->
  unit ->
  admin_link_provider_for_user_request

val make_admin_initiate_auth_response :
  ?challenge_name:challenge_name_type ->
  ?session:session_type ->
  ?challenge_parameters:challenge_parameters_type ->
  ?authentication_result:authentication_result_type ->
  ?available_challenges:available_challenge_list_type ->
  unit ->
  admin_initiate_auth_response

val make_admin_initiate_auth_request :
  ?auth_parameters:auth_parameters_type ->
  ?client_metadata:client_metadata_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?context_data:context_data_type ->
  ?session:session_type ->
  user_pool_id:user_pool_id_type ->
  client_id:client_id_type ->
  auth_flow:auth_flow_type ->
  unit ->
  admin_initiate_auth_request

val make_admin_get_user_response :
  ?user_attributes:attribute_list_type ->
  ?user_create_date:date_type ->
  ?user_last_modified_date:date_type ->
  ?enabled:boolean_type ->
  ?user_status:user_status_type ->
  ?mfa_options:mfa_option_list_type ->
  ?preferred_mfa_setting:string_type ->
  ?user_mfa_setting_list:user_mfa_setting_list_type ->
  username:username_type ->
  unit ->
  admin_get_user_response

val make_admin_get_user_request :
  user_pool_id:user_pool_id_type -> username:username_type -> unit -> admin_get_user_request

val make_admin_get_device_response : device:device_type -> unit -> admin_get_device_response

val make_admin_get_device_request :
  device_key:device_key_type ->
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  unit ->
  admin_get_device_request

val make_admin_forget_device_request :
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  device_key:device_key_type ->
  unit ->
  admin_forget_device_request

val make_admin_enable_user_response : unit -> unit

val make_admin_enable_user_request :
  user_pool_id:user_pool_id_type -> username:username_type -> unit -> admin_enable_user_request

val make_admin_disable_user_response : unit -> unit

val make_admin_disable_user_request :
  user_pool_id:user_pool_id_type -> username:username_type -> unit -> admin_disable_user_request

val make_admin_disable_provider_for_user_response : unit -> unit

val make_admin_disable_provider_for_user_request :
  user_pool_id:string_type ->
  user:provider_user_identifier_type ->
  unit ->
  admin_disable_provider_for_user_request

val make_admin_delete_user_attributes_response : unit -> unit

val make_admin_delete_user_attributes_request :
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  user_attribute_names:attribute_name_list_type ->
  unit ->
  admin_delete_user_attributes_request

val make_admin_delete_user_request :
  user_pool_id:user_pool_id_type -> username:username_type -> unit -> admin_delete_user_request

val make_admin_create_user_response : ?user:user_type -> unit -> admin_create_user_response

val make_admin_create_user_request :
  ?user_attributes:attribute_list_type ->
  ?validation_data:attribute_list_type ->
  ?temporary_password:password_type ->
  ?force_alias_creation:force_alias_creation ->
  ?message_action:message_action_type ->
  ?desired_delivery_mediums:delivery_medium_list_type ->
  ?client_metadata:client_metadata_type ->
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  unit ->
  admin_create_user_request

val make_admin_confirm_sign_up_response : unit -> unit

val make_admin_confirm_sign_up_request :
  ?client_metadata:client_metadata_type ->
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  unit ->
  admin_confirm_sign_up_request

val make_admin_add_user_to_group_request :
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  group_name:group_name_type ->
  unit ->
  admin_add_user_to_group_request

val make_add_user_pool_client_secret_response :
  ?client_secret_descriptor:client_secret_descriptor_type ->
  unit ->
  add_user_pool_client_secret_response

val make_add_user_pool_client_secret_request :
  ?client_secret:client_secret_type ->
  user_pool_id:user_pool_id_type ->
  client_id:client_id_type ->
  unit ->
  add_user_pool_client_secret_request

val make_add_custom_attributes_response : unit -> unit

val make_add_custom_attributes_request :
  user_pool_id:user_pool_id_type ->
  custom_attributes:custom_attributes_list_type ->
  unit ->
  add_custom_attributes_request
