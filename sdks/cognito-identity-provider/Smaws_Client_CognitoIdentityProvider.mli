(** Cognito Identity Provider client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_web_authn_mfa_settings_type : ?enabled:boolean_type -> unit -> web_authn_mfa_settings_type

val make_web_authn_credential_description :
  ?authenticator_attachment:web_authn_authenticator_attachment_type ->
  created_at:date_type ->
  authenticator_transports:web_authn_authenticator_transports_list ->
  relying_party_id:string_type ->
  friendly_credential_name:string_type ->
  credential_id:string_type ->
  unit ->
  web_authn_credential_description

val make_web_authn_configuration_type :
  ?factor_configuration:web_authn_factor_configuration_type ->
  ?user_verification:user_verification_type ->
  ?relying_party_id:relying_party_id_type ->
  unit ->
  web_authn_configuration_type

val make_verify_user_attribute_response : unit -> unit

val make_verify_user_attribute_request :
  code:confirmation_code_type ->
  attribute_name:attribute_name_type ->
  access_token:token_model_type ->
  unit ->
  verify_user_attribute_request

val make_verify_software_token_response :
  ?session:session_type ->
  ?status:verify_software_token_response_type ->
  unit ->
  verify_software_token_response

val make_verify_software_token_request :
  ?friendly_device_name:string_type ->
  ?session:session_type ->
  ?access_token:token_model_type ->
  user_code:software_token_mfa_user_code_type ->
  unit ->
  verify_software_token_request

val make_verification_message_template_type :
  ?default_email_option:default_email_option_type ->
  ?email_subject_by_link:email_verification_subject_by_link_type ->
  ?email_message_by_link:email_verification_message_by_link_type ->
  ?email_subject:email_verification_subject_type ->
  ?email_message:email_verification_message_type ->
  ?sms_message:sms_verification_message_type ->
  unit ->
  verification_message_template_type

val make_attribute_type :
  ?value:attribute_value_type -> name:attribute_name_type -> unit -> attribute_type

val make_mfa_option_type :
  ?attribute_name:attribute_name_type ->
  ?delivery_medium:delivery_medium_type ->
  unit ->
  mfa_option_type

val make_user_type :
  ?mfa_options:mfa_option_list_type ->
  ?user_status:user_status_type ->
  ?enabled:boolean_type ->
  ?user_last_modified_date:date_type ->
  ?user_create_date:date_type ->
  ?attributes:attribute_list_type ->
  ?username:username_type ->
  unit ->
  user_type

val make_username_configuration_type :
  case_sensitive:wrapped_boolean_type -> unit -> username_configuration_type

val make_password_policy_type :
  ?temporary_password_validity_days:temporary_password_validity_days_type ->
  ?password_history_size:password_history_size_type ->
  ?require_symbols:boolean_type ->
  ?require_numbers:boolean_type ->
  ?require_lowercase:boolean_type ->
  ?require_uppercase:boolean_type ->
  ?minimum_length:password_policy_min_length_type ->
  unit ->
  password_policy_type

val make_sign_in_policy_type :
  ?allowed_first_auth_factors:allowed_first_auth_factors_list_type -> unit -> sign_in_policy_type

val make_user_pool_policy_type :
  ?sign_in_policy:sign_in_policy_type ->
  ?password_policy:password_policy_type ->
  unit ->
  user_pool_policy_type

val make_pre_token_generation_version_config_type :
  lambda_arn:arn_type ->
  lambda_version:pre_token_generation_lambda_version_type ->
  unit ->
  pre_token_generation_version_config_type

val make_custom_sms_lambda_version_config_type :
  lambda_arn:arn_type ->
  lambda_version:custom_sms_sender_lambda_version_type ->
  unit ->
  custom_sms_lambda_version_config_type

val make_custom_email_lambda_version_config_type :
  lambda_arn:arn_type ->
  lambda_version:custom_email_sender_lambda_version_type ->
  unit ->
  custom_email_lambda_version_config_type

val make_inbound_federation_lambda_type :
  lambda_arn:arn_type ->
  lambda_version:inbound_federation_lambda_version_type ->
  unit ->
  inbound_federation_lambda_type

val make_lambda_config_type :
  ?inbound_federation:inbound_federation_lambda_type ->
  ?kms_key_i_d:arn_type ->
  ?custom_email_sender:custom_email_lambda_version_config_type ->
  ?custom_sms_sender:custom_sms_lambda_version_config_type ->
  ?pre_token_generation_config:pre_token_generation_version_config_type ->
  ?user_migration:arn_type ->
  ?pre_token_generation:arn_type ->
  ?verify_auth_challenge_response:arn_type ->
  ?create_auth_challenge:arn_type ->
  ?define_auth_challenge:arn_type ->
  ?post_authentication:arn_type ->
  ?pre_authentication:arn_type ->
  ?post_confirmation:arn_type ->
  ?custom_message:arn_type ->
  ?pre_sign_up:arn_type ->
  unit ->
  lambda_config_type

val make_number_attribute_constraints_type :
  ?max_value:string_type -> ?min_value:string_type -> unit -> number_attribute_constraints_type

val make_string_attribute_constraints_type :
  ?max_length:string_type -> ?min_length:string_type -> unit -> string_attribute_constraints_type

val make_schema_attribute_type :
  ?string_attribute_constraints:string_attribute_constraints_type ->
  ?number_attribute_constraints:number_attribute_constraints_type ->
  ?required:boolean_type ->
  ?\#mutable:boolean_type ->
  ?developer_only_attribute:boolean_type ->
  ?attribute_data_type:attribute_data_type ->
  ?name:custom_attribute_name_type ->
  unit ->
  schema_attribute_type

val make_user_attribute_update_settings_type :
  ?attributes_require_verification_before_update:attributes_require_verification_before_update_type ->
  unit ->
  user_attribute_update_settings_type

val make_device_configuration_type :
  ?device_only_remembered_on_user_prompt:boolean_type ->
  ?challenge_required_on_new_device:boolean_type ->
  unit ->
  device_configuration_type

val make_email_configuration_type :
  ?configuration_set:ses_configuration_set ->
  ?from_:string_type ->
  ?email_sending_account:email_sending_account_type ->
  ?reply_to_email_address:email_address_type ->
  ?source_arn:arn_type ->
  unit ->
  email_configuration_type

val make_sms_configuration_type :
  ?sns_region:region_code_type ->
  ?external_id:string_type ->
  sns_caller_arn:arn_type ->
  unit ->
  sms_configuration_type

val make_message_template_type :
  ?email_subject:email_verification_subject_type ->
  ?email_message:email_invite_message_type ->
  ?sms_message:sms_invite_message_type ->
  unit ->
  message_template_type

val make_admin_create_user_config_type :
  ?invite_message_template:message_template_type ->
  ?unused_account_validity_days:admin_create_user_unused_account_validity_days_type ->
  ?allow_admin_create_user_only:boolean_type ->
  unit ->
  admin_create_user_config_type

val make_advanced_security_additional_flows_type :
  ?custom_auth_mode:advanced_security_enabled_mode_type ->
  unit ->
  advanced_security_additional_flows_type

val make_user_pool_add_ons_type :
  ?advanced_security_additional_flows:advanced_security_additional_flows_type ->
  advanced_security_mode:advanced_security_mode_type ->
  unit ->
  user_pool_add_ons_type

val make_recovery_option_type :
  name:recovery_option_name_type -> priority:priority_type -> unit -> recovery_option_type

val make_account_recovery_setting_type :
  ?recovery_mechanisms:recovery_mechanisms_type -> unit -> account_recovery_setting_type

val make_key_configuration_type :
  ?kms_key_arn:encryption_key_arn_type ->
  ?key_type:encryption_key_type ->
  unit ->
  key_configuration_type

val make_issuer_configuration_type : ?type_:issuer_type -> unit -> issuer_configuration_type

val make_user_pool_type :
  ?issuer_configuration:issuer_configuration_type ->
  ?key_configuration:key_configuration_type ->
  ?user_pool_tier:user_pool_tier_type ->
  ?account_recovery_setting:account_recovery_setting_type ->
  ?arn:arn_type ->
  ?username_configuration:username_configuration_type ->
  ?user_pool_add_ons:user_pool_add_ons_type ->
  ?admin_create_user_config:admin_create_user_config_type ->
  ?custom_domain:domain_type ->
  ?domain:domain_type ->
  ?email_configuration_failure:string_type ->
  ?sms_configuration_failure:string_type ->
  ?user_pool_tags:user_pool_tags_type ->
  ?sms_configuration:sms_configuration_type ->
  ?email_configuration:email_configuration_type ->
  ?estimated_number_of_users:integer_type ->
  ?device_configuration:device_configuration_type ->
  ?mfa_configuration:user_pool_mfa_type ->
  ?user_attribute_update_settings:user_attribute_update_settings_type ->
  ?sms_authentication_message:sms_verification_message_type ->
  ?verification_message_template:verification_message_template_type ->
  ?email_verification_subject:email_verification_subject_type ->
  ?email_verification_message:email_verification_message_type ->
  ?sms_verification_message:sms_verification_message_type ->
  ?username_attributes:username_attributes_list_type ->
  ?alias_attributes:alias_attributes_list_type ->
  ?auto_verified_attributes:verified_attributes_list_type ->
  ?schema_attributes:schema_attributes_list_type ->
  ?creation_date:date_type ->
  ?last_modified_date:date_type ->
  ?status:status_type ->
  ?lambda_config:lambda_config_type ->
  ?deletion_protection:deletion_protection_type ->
  ?policies:user_pool_policy_type ->
  ?name:user_pool_name_type ->
  ?id:user_pool_id_type ->
  unit ->
  user_pool_type

val make_user_pool_replica_type :
  ?user_pool_arn:arn_type ->
  ?role:replica_role_type ->
  ?status:replica_status_type ->
  ?region_name:region_name_type ->
  unit ->
  user_pool_replica_type

val make_user_pool_description_type :
  ?replica_regions:replica_regions_type ->
  ?creation_date:date_type ->
  ?last_modified_date:date_type ->
  ?status:status_type ->
  ?lambda_config:lambda_config_type ->
  ?name:user_pool_name_type ->
  ?id:user_pool_id_type ->
  unit ->
  user_pool_description_type

val make_token_validity_units_type :
  ?refresh_token:time_units_type ->
  ?id_token:time_units_type ->
  ?access_token:time_units_type ->
  unit ->
  token_validity_units_type

val make_analytics_configuration_type :
  ?user_data_shared:boolean_type ->
  ?external_id:string_type ->
  ?role_arn:arn_type ->
  ?application_arn:arn_type ->
  ?application_id:hex_string_type ->
  unit ->
  analytics_configuration_type

val make_refresh_token_rotation_type :
  ?retry_grace_period_seconds:retry_grace_period_seconds_type ->
  feature:feature_type ->
  unit ->
  refresh_token_rotation_type

val make_user_pool_client_type :
  ?refresh_token_rotation:refresh_token_rotation_type ->
  ?auth_session_validity:auth_session_validity_type ->
  ?enable_propagate_additional_user_context_data:wrapped_boolean_type ->
  ?enable_token_revocation:wrapped_boolean_type ->
  ?prevent_user_existence_errors:prevent_user_existence_error_types ->
  ?analytics_configuration:analytics_configuration_type ->
  ?allowed_o_auth_flows_user_pool_client:boolean_type ->
  ?allowed_o_auth_scopes:scope_list_type ->
  ?allowed_o_auth_flows:o_auth_flows_type ->
  ?default_redirect_ur_i:redirect_url_type ->
  ?logout_ur_ls:logout_ur_ls_list_type ->
  ?callback_ur_ls:callback_ur_ls_list_type ->
  ?supported_identity_providers:supported_identity_providers_list_type ->
  ?explicit_auth_flows:explicit_auth_flows_list_type ->
  ?write_attributes:client_permission_list_type ->
  ?read_attributes:client_permission_list_type ->
  ?token_validity_units:token_validity_units_type ->
  ?id_token_validity:id_token_validity_type ->
  ?access_token_validity:access_token_validity_type ->
  ?refresh_token_validity:refresh_token_validity_type ->
  ?creation_date:date_type ->
  ?last_modified_date:date_type ->
  ?client_secret:client_secret_type ->
  ?client_id:client_id_type ->
  ?client_name:client_name_type ->
  ?user_pool_id:user_pool_id_type ->
  unit ->
  user_pool_client_type

val make_user_pool_client_description :
  ?client_name:client_name_type ->
  ?user_pool_id:user_pool_id_type ->
  ?client_id:client_id_type ->
  unit ->
  user_pool_client_description

val make_user_import_job_type :
  ?completion_message:completion_message_type ->
  ?failed_users:long_type ->
  ?skipped_users:long_type ->
  ?imported_users:long_type ->
  ?cloud_watch_logs_role_arn:arn_type ->
  ?status:user_import_job_status_type ->
  ?completion_date:date_type ->
  ?start_date:date_type ->
  ?creation_date:date_type ->
  ?pre_signed_url:pre_signed_url_type ->
  ?user_pool_id:user_pool_id_type ->
  ?job_id:user_import_job_id_type ->
  ?job_name:user_import_job_name_type ->
  unit ->
  user_import_job_type

val make_user_context_data_type :
  ?encoded_data:string_type -> ?ip_address:string_type -> unit -> user_context_data_type

val make_update_user_pool_response : unit -> unit

val make_update_user_pool_request :
  ?issuer_configuration:issuer_configuration_type ->
  ?key_configuration:key_configuration_type ->
  ?user_pool_tier:user_pool_tier_type ->
  ?pool_name:user_pool_name_type ->
  ?account_recovery_setting:account_recovery_setting_type ->
  ?user_pool_add_ons:user_pool_add_ons_type ->
  ?admin_create_user_config:admin_create_user_config_type ->
  ?user_pool_tags:user_pool_tags_type ->
  ?sms_configuration:sms_configuration_type ->
  ?email_configuration:email_configuration_type ->
  ?device_configuration:device_configuration_type ->
  ?mfa_configuration:user_pool_mfa_type ->
  ?user_attribute_update_settings:user_attribute_update_settings_type ->
  ?sms_authentication_message:sms_verification_message_type ->
  ?verification_message_template:verification_message_template_type ->
  ?email_verification_subject:email_verification_subject_type ->
  ?email_verification_message:email_verification_message_type ->
  ?sms_verification_message:sms_verification_message_type ->
  ?auto_verified_attributes:verified_attributes_list_type ->
  ?lambda_config:lambda_config_type ->
  ?deletion_protection:deletion_protection_type ->
  ?policies:user_pool_policy_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  update_user_pool_request

val make_update_user_pool_replica_response :
  ?user_pool_replica:user_pool_replica_type -> unit -> update_user_pool_replica_response

val make_update_user_pool_replica_request :
  status:update_replica_status_type ->
  region_name:region_name_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  update_user_pool_replica_request

val make_failover_type :
  primary_route53_health_check_id:health_check_id_type ->
  secondary_region:region_name_type ->
  unit ->
  failover_type

val make_routing_type : ?failover:failover_type -> unit -> routing_type

val make_update_user_pool_domain_response :
  ?routing:routing_type ->
  ?cloud_front_domain:domain_type ->
  ?managed_login_version:wrapped_integer_type ->
  unit ->
  update_user_pool_domain_response

val make_custom_domain_config_type :
  ?security_policy:security_policy_type ->
  certificate_arn:arn_type ->
  unit ->
  custom_domain_config_type

val make_update_user_pool_domain_request :
  ?routing:routing_type ->
  ?custom_domain_config:custom_domain_config_type ->
  ?managed_login_version:wrapped_integer_type ->
  user_pool_id:user_pool_id_type ->
  domain:domain_type ->
  unit ->
  update_user_pool_domain_request

val make_update_user_pool_client_response :
  ?user_pool_client:user_pool_client_type -> unit -> update_user_pool_client_response

val make_update_user_pool_client_request :
  ?refresh_token_rotation:refresh_token_rotation_type ->
  ?auth_session_validity:auth_session_validity_type ->
  ?enable_propagate_additional_user_context_data:wrapped_boolean_type ->
  ?enable_token_revocation:wrapped_boolean_type ->
  ?prevent_user_existence_errors:prevent_user_existence_error_types ->
  ?analytics_configuration:analytics_configuration_type ->
  ?allowed_o_auth_flows_user_pool_client:boolean_type ->
  ?allowed_o_auth_scopes:scope_list_type ->
  ?allowed_o_auth_flows:o_auth_flows_type ->
  ?default_redirect_ur_i:redirect_url_type ->
  ?logout_ur_ls:logout_ur_ls_list_type ->
  ?callback_ur_ls:callback_ur_ls_list_type ->
  ?supported_identity_providers:supported_identity_providers_list_type ->
  ?explicit_auth_flows:explicit_auth_flows_list_type ->
  ?write_attributes:client_permission_list_type ->
  ?read_attributes:client_permission_list_type ->
  ?token_validity_units:token_validity_units_type ->
  ?id_token_validity:id_token_validity_type ->
  ?access_token_validity:access_token_validity_type ->
  ?refresh_token_validity:refresh_token_validity_type ->
  ?client_name:client_name_type ->
  client_id:client_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  update_user_pool_client_request

val make_code_delivery_details_type :
  ?attribute_name:attribute_name_type ->
  ?delivery_medium:delivery_medium_type ->
  ?destination:string_type ->
  unit ->
  code_delivery_details_type

val make_update_user_attributes_response :
  ?code_delivery_details_list:code_delivery_details_list_type ->
  unit ->
  update_user_attributes_response

val make_update_user_attributes_request :
  ?client_metadata:client_metadata_type ->
  access_token:token_model_type ->
  user_attributes:attribute_list_type ->
  unit ->
  update_user_attributes_request

val make_terms_type :
  last_modified_date:date_type ->
  creation_date:date_type ->
  links:links_type ->
  enforcement:terms_enforcement_type ->
  terms_source:terms_source_type ->
  terms_name:terms_name_type ->
  client_id:client_id_type ->
  user_pool_id:user_pool_id_type ->
  terms_id:terms_id_type ->
  unit ->
  terms_type

val make_update_terms_response : ?terms:terms_type -> unit -> update_terms_response

val make_update_terms_request :
  ?links:links_type ->
  ?enforcement:terms_enforcement_type ->
  ?terms_source:terms_source_type ->
  ?terms_name:terms_name_type ->
  user_pool_id:user_pool_id_type ->
  terms_id:terms_id_type ->
  unit ->
  update_terms_request

val make_resource_server_scope_type :
  scope_description:resource_server_scope_description_type ->
  scope_name:resource_server_scope_name_type ->
  unit ->
  resource_server_scope_type

val make_resource_server_type :
  ?scopes:resource_server_scope_list_type ->
  ?name:resource_server_name_type ->
  ?identifier:resource_server_identifier_type ->
  ?user_pool_id:user_pool_id_type ->
  unit ->
  resource_server_type

val make_update_resource_server_response :
  resource_server:resource_server_type -> unit -> update_resource_server_response

val make_update_resource_server_request :
  ?scopes:resource_server_scope_list_type ->
  name:resource_server_name_type ->
  identifier:resource_server_identifier_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  update_resource_server_request

val make_limit_definition_type :
  attributes:string_to_string_map_type -> limit_class:limit_class -> unit -> limit_definition_type

val make_limit_type :
  free_limit_value:integer_type ->
  provisioned_limit_value:integer_type ->
  limit_definition:limit_definition_type ->
  unit ->
  limit_type

val make_update_provisioned_limit_response :
  limit:limit_type -> unit -> update_provisioned_limit_response

val make_update_provisioned_limit_request :
  requested_limit_value:integer_type ->
  limit_definition:limit_definition_type ->
  unit ->
  update_provisioned_limit_request

val make_asset_type :
  ?resource_id:resource_id_type ->
  ?bytes:asset_bytes_type ->
  extension:asset_extension_type ->
  color_mode:color_scheme_mode_type ->
  category:asset_category_type ->
  unit ->
  asset_type

val make_managed_login_branding_type :
  ?last_modified_date:date_type ->
  ?creation_date:date_type ->
  ?assets:asset_list_type ->
  ?settings:document ->
  ?use_cognito_provided_values:boolean_type ->
  ?user_pool_id:user_pool_id_type ->
  ?managed_login_branding_id:managed_login_branding_id_type ->
  unit ->
  managed_login_branding_type

val make_update_managed_login_branding_response :
  ?managed_login_branding:managed_login_branding_type ->
  unit ->
  update_managed_login_branding_response

val make_update_managed_login_branding_request :
  ?assets:asset_list_type ->
  ?settings:document ->
  ?use_cognito_provided_values:boolean_type ->
  ?managed_login_branding_id:managed_login_branding_id_type ->
  ?user_pool_id:user_pool_id_type ->
  unit ->
  update_managed_login_branding_request

val make_identity_provider_type :
  ?creation_date:date_type ->
  ?last_modified_date:date_type ->
  ?idp_identifiers:idp_identifiers_list_type ->
  ?attribute_mapping:attribute_mapping_type ->
  ?provider_details:provider_details_type ->
  ?provider_type:identity_provider_type_type ->
  ?provider_name:provider_name_type ->
  ?user_pool_id:user_pool_id_type ->
  unit ->
  identity_provider_type

val make_update_identity_provider_response :
  identity_provider:identity_provider_type -> unit -> update_identity_provider_response

val make_update_identity_provider_request :
  ?idp_identifiers:idp_identifiers_list_type ->
  ?attribute_mapping:attribute_mapping_type ->
  ?provider_details:provider_details_type ->
  provider_name:provider_name_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  update_identity_provider_request

val make_group_type :
  ?creation_date:date_type ->
  ?last_modified_date:date_type ->
  ?precedence:precedence_type ->
  ?role_arn:arn_type ->
  ?description:description_type ->
  ?user_pool_id:user_pool_id_type ->
  ?group_name:group_name_type ->
  unit ->
  group_type

val make_update_group_response : ?group:group_type -> unit -> update_group_response

val make_update_group_request :
  ?precedence:precedence_type ->
  ?role_arn:arn_type ->
  ?description:description_type ->
  user_pool_id:user_pool_id_type ->
  group_name:group_name_type ->
  unit ->
  update_group_request

val make_update_device_status_response : unit -> unit

val make_update_device_status_request :
  ?device_remembered_status:device_remembered_status_type ->
  device_key:device_key_type ->
  access_token:token_model_type ->
  unit ->
  update_device_status_request

val make_update_auth_event_feedback_response : unit -> unit

val make_update_auth_event_feedback_request :
  feedback_value:feedback_value_type ->
  feedback_token:token_model_type ->
  event_id:event_id_type ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  update_auth_event_feedback_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:user_pool_tags_list_type -> resource_arn:arn_type -> unit -> untag_resource_request

val make_ui_customization_type :
  ?creation_date:date_type ->
  ?last_modified_date:date_type ->
  ?css_version:css_version_type ->
  ?cs_s:css_type ->
  ?image_url:image_url_type ->
  ?client_id:client_id_type ->
  ?user_pool_id:user_pool_id_type ->
  unit ->
  ui_customization_type

val make_terms_description_type :
  last_modified_date:date_type ->
  creation_date:date_type ->
  enforcement:terms_enforcement_type ->
  terms_name:terms_name_type ->
  terms_id:terms_id_type ->
  unit ->
  terms_description_type

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:user_pool_tags_type -> resource_arn:arn_type -> unit -> tag_resource_request

val make_stop_user_import_job_response :
  ?user_import_job:user_import_job_type -> unit -> stop_user_import_job_response

val make_stop_user_import_job_request :
  job_id:user_import_job_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  stop_user_import_job_request

val make_start_web_authn_registration_response :
  credential_creation_options:document -> unit -> start_web_authn_registration_response

val make_start_web_authn_registration_request :
  access_token:token_model_type -> unit -> start_web_authn_registration_request

val make_start_user_import_job_response :
  ?user_import_job:user_import_job_type -> unit -> start_user_import_job_response

val make_start_user_import_job_request :
  job_id:user_import_job_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  start_user_import_job_request

val make_software_token_mfa_settings_type :
  ?preferred_mfa:boolean_type -> ?enabled:boolean_type -> unit -> software_token_mfa_settings_type

val make_software_token_mfa_config_type :
  ?enabled:boolean_type -> unit -> software_token_mfa_config_type

val make_sms_mfa_config_type :
  ?sms_configuration:sms_configuration_type ->
  ?sms_authentication_message:sms_verification_message_type ->
  unit ->
  sms_mfa_config_type

val make_sign_up_response :
  ?session:session_type ->
  ?code_delivery_details:code_delivery_details_type ->
  user_sub:string_type ->
  user_confirmed:boolean_type ->
  unit ->
  sign_up_response

val make_analytics_metadata_type :
  ?analytics_endpoint_id:string_type -> unit -> analytics_metadata_type

val make_sign_up_request :
  ?client_metadata:client_metadata_type ->
  ?user_context_data:user_context_data_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?validation_data:attribute_list_type ->
  ?user_attributes:attribute_list_type ->
  ?password:password_type ->
  ?secret_hash:secret_hash_type ->
  username:username_type ->
  client_id:client_id_type ->
  unit ->
  sign_up_request

val make_set_user_settings_response : unit -> unit

val make_set_user_settings_request :
  mfa_options:mfa_option_list_type ->
  access_token:token_model_type ->
  unit ->
  set_user_settings_request

val make_email_mfa_config_type :
  ?subject:email_mfa_subject_type ->
  ?message:email_mfa_message_type ->
  unit ->
  email_mfa_config_type

val make_set_user_pool_mfa_config_response :
  ?web_authn_configuration:web_authn_configuration_type ->
  ?mfa_configuration:user_pool_mfa_type ->
  ?email_mfa_configuration:email_mfa_config_type ->
  ?software_token_mfa_configuration:software_token_mfa_config_type ->
  ?sms_mfa_configuration:sms_mfa_config_type ->
  unit ->
  set_user_pool_mfa_config_response

val make_set_user_pool_mfa_config_request :
  ?web_authn_configuration:web_authn_configuration_type ->
  ?mfa_configuration:user_pool_mfa_type ->
  ?email_mfa_configuration:email_mfa_config_type ->
  ?software_token_mfa_configuration:software_token_mfa_config_type ->
  ?sms_mfa_configuration:sms_mfa_config_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  set_user_pool_mfa_config_request

val make_set_user_mfa_preference_response : unit -> unit

val make_sms_mfa_settings_type :
  ?preferred_mfa:boolean_type -> ?enabled:boolean_type -> unit -> sms_mfa_settings_type

val make_email_mfa_settings_type :
  ?preferred_mfa:boolean_type -> ?enabled:boolean_type -> unit -> email_mfa_settings_type

val make_set_user_mfa_preference_request :
  ?web_authn_mfa_settings:web_authn_mfa_settings_type ->
  ?email_mfa_settings:email_mfa_settings_type ->
  ?software_token_mfa_settings:software_token_mfa_settings_type ->
  ?sms_mfa_settings:sms_mfa_settings_type ->
  access_token:token_model_type ->
  unit ->
  set_user_mfa_preference_request

val make_set_ui_customization_response :
  ui_customization:ui_customization_type -> unit -> set_ui_customization_response

val make_set_ui_customization_request :
  ?image_file:image_file_type ->
  ?cs_s:css_type ->
  ?client_id:client_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  set_ui_customization_request

val make_compromised_credentials_actions_type :
  event_action:compromised_credentials_event_action_type ->
  unit ->
  compromised_credentials_actions_type

val make_compromised_credentials_risk_configuration_type :
  ?event_filter:event_filters_type ->
  actions:compromised_credentials_actions_type ->
  unit ->
  compromised_credentials_risk_configuration_type

val make_notify_email_type :
  ?text_body:email_notification_body_type ->
  ?html_body:email_notification_body_type ->
  subject:email_notification_subject_type ->
  unit ->
  notify_email_type

val make_notify_configuration_type :
  ?mfa_email:notify_email_type ->
  ?no_action_email:notify_email_type ->
  ?block_email:notify_email_type ->
  ?reply_to:string_type ->
  ?from_:string_type ->
  source_arn:arn_type ->
  unit ->
  notify_configuration_type

val make_account_takeover_action_type :
  event_action:account_takeover_event_action_type ->
  notify:account_takeover_action_notify_type ->
  unit ->
  account_takeover_action_type

val make_account_takeover_actions_type :
  ?high_action:account_takeover_action_type ->
  ?medium_action:account_takeover_action_type ->
  ?low_action:account_takeover_action_type ->
  unit ->
  account_takeover_actions_type

val make_account_takeover_risk_configuration_type :
  ?notify_configuration:notify_configuration_type ->
  actions:account_takeover_actions_type ->
  unit ->
  account_takeover_risk_configuration_type

val make_risk_exception_configuration_type :
  ?skipped_ip_range_list:skipped_ip_range_list_type ->
  ?blocked_ip_range_list:blocked_ip_range_list_type ->
  unit ->
  risk_exception_configuration_type

val make_risk_configuration_type :
  ?last_modified_date:date_type ->
  ?risk_exception_configuration:risk_exception_configuration_type ->
  ?account_takeover_risk_configuration:account_takeover_risk_configuration_type ->
  ?compromised_credentials_risk_configuration:compromised_credentials_risk_configuration_type ->
  ?client_id:client_id_type ->
  ?user_pool_id:user_pool_id_type ->
  unit ->
  risk_configuration_type

val make_set_risk_configuration_response :
  risk_configuration:risk_configuration_type -> unit -> set_risk_configuration_response

val make_set_risk_configuration_request :
  ?risk_exception_configuration:risk_exception_configuration_type ->
  ?account_takeover_risk_configuration:account_takeover_risk_configuration_type ->
  ?compromised_credentials_risk_configuration:compromised_credentials_risk_configuration_type ->
  ?client_id:client_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  set_risk_configuration_request

val make_cloud_watch_logs_configuration_type :
  ?log_group_arn:arn_type -> unit -> cloud_watch_logs_configuration_type

val make_s3_configuration_type : ?bucket_arn:s3_arn_type -> unit -> s3_configuration_type
val make_firehose_configuration_type : ?stream_arn:arn_type -> unit -> firehose_configuration_type

val make_log_configuration_type :
  ?firehose_configuration:firehose_configuration_type ->
  ?s3_configuration:s3_configuration_type ->
  ?cloud_watch_logs_configuration:cloud_watch_logs_configuration_type ->
  event_source:event_source_name ->
  log_level:log_level ->
  unit ->
  log_configuration_type

val make_log_delivery_configuration_type :
  log_configurations:log_configuration_list_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  log_delivery_configuration_type

val make_set_log_delivery_configuration_response :
  ?log_delivery_configuration:log_delivery_configuration_type ->
  unit ->
  set_log_delivery_configuration_response

val make_set_log_delivery_configuration_request :
  log_configurations:log_configuration_list_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  set_log_delivery_configuration_request

val make_revoke_token_response : unit -> unit

val make_revoke_token_request :
  ?client_secret:client_secret_type ->
  client_id:client_id_type ->
  token:token_model_type ->
  unit ->
  revoke_token_request

val make_new_device_metadata_type :
  ?device_group_key:string_type -> ?device_key:device_key_type -> unit -> new_device_metadata_type

val make_authentication_result_type :
  ?new_device_metadata:new_device_metadata_type ->
  ?id_token:token_model_type ->
  ?refresh_token:token_model_type ->
  ?token_type:string_type ->
  ?expires_in:integer_type ->
  ?access_token:token_model_type ->
  unit ->
  authentication_result_type

val make_respond_to_auth_challenge_response :
  ?authentication_result:authentication_result_type ->
  ?challenge_parameters:challenge_parameters_type ->
  ?session:session_type ->
  ?challenge_name:challenge_name_type ->
  unit ->
  respond_to_auth_challenge_response

val make_respond_to_auth_challenge_request :
  ?client_metadata:client_metadata_type ->
  ?user_context_data:user_context_data_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?challenge_responses:challenge_responses_type ->
  ?session:session_type ->
  challenge_name:challenge_name_type ->
  client_id:client_id_type ->
  unit ->
  respond_to_auth_challenge_request

val make_resend_confirmation_code_response :
  ?code_delivery_details:code_delivery_details_type -> unit -> resend_confirmation_code_response

val make_resend_confirmation_code_request :
  ?client_metadata:client_metadata_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?user_context_data:user_context_data_type ->
  ?secret_hash:secret_hash_type ->
  username:username_type ->
  client_id:client_id_type ->
  unit ->
  resend_confirmation_code_request

val make_provider_description :
  ?creation_date:date_type ->
  ?last_modified_date:date_type ->
  ?provider_type:identity_provider_type_type ->
  ?provider_name:provider_name_type ->
  unit ->
  provider_description

val make_provider_user_identifier_type :
  ?provider_attribute_value:string_type ->
  ?provider_attribute_name:string_type ->
  ?provider_name:provider_name_type ->
  unit ->
  provider_user_identifier_type

val make_list_web_authn_credentials_response :
  ?next_token:pagination_key ->
  credentials:web_authn_credential_description_list_type ->
  unit ->
  list_web_authn_credentials_response

val make_list_web_authn_credentials_request :
  ?max_results:web_authn_credentials_query_limit_type ->
  ?next_token:pagination_key ->
  access_token:token_model_type ->
  unit ->
  list_web_authn_credentials_request

val make_list_users_response :
  ?pagination_token:search_pagination_token_type ->
  ?users:users_list_type ->
  unit ->
  list_users_response

val make_list_users_request :
  ?filter:user_filter_type ->
  ?pagination_token:search_pagination_token_type ->
  ?limit:query_limit_type ->
  ?attributes_to_get:searched_attribute_names_list_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  list_users_request

val make_list_users_in_group_response :
  ?next_token:pagination_key -> ?users:users_list_type -> unit -> list_users_in_group_response

val make_list_users_in_group_request :
  ?next_token:pagination_key ->
  ?limit:query_limit_type ->
  group_name:group_name_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  list_users_in_group_request

val make_list_user_pools_response :
  ?next_token:pagination_key_type ->
  ?user_pools:user_pool_list_type ->
  unit ->
  list_user_pools_response

val make_list_user_pools_request :
  ?next_token:pagination_key_type ->
  max_results:pool_query_limit_type ->
  unit ->
  list_user_pools_request

val make_list_user_pool_replicas_response :
  ?next_token:pagination_key_type ->
  ?user_pool_replicas:user_pool_replica_list_type ->
  unit ->
  list_user_pool_replicas_response

val make_list_user_pool_replicas_request :
  ?next_token:pagination_key_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  list_user_pool_replicas_request

val make_list_user_pool_clients_response :
  ?next_token:pagination_key ->
  ?user_pool_clients:user_pool_client_list_type ->
  unit ->
  list_user_pool_clients_response

val make_list_user_pool_clients_request :
  ?next_token:pagination_key ->
  ?max_results:query_limit ->
  user_pool_id:user_pool_id_type ->
  unit ->
  list_user_pool_clients_request

val make_client_secret_descriptor_type :
  ?client_secret_create_date:date_type ->
  ?client_secret_value:client_secret_type ->
  ?client_secret_id:client_secret_id_type ->
  unit ->
  client_secret_descriptor_type

val make_list_user_pool_client_secrets_response :
  ?next_token:pagination_key ->
  ?client_secrets:client_secret_descriptor_list_type ->
  unit ->
  list_user_pool_client_secrets_response

val make_list_user_pool_client_secrets_request :
  ?next_token:pagination_key ->
  client_id:client_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  list_user_pool_client_secrets_request

val make_list_user_import_jobs_response :
  ?pagination_token:pagination_key_type ->
  ?user_import_jobs:user_import_jobs_list_type ->
  unit ->
  list_user_import_jobs_response

val make_list_user_import_jobs_request :
  ?pagination_token:pagination_key_type ->
  max_results:pool_query_limit_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  list_user_import_jobs_request

val make_list_terms_response :
  ?next_token:string_type -> terms:terms_description_list_type -> unit -> list_terms_response

val make_list_terms_request :
  ?next_token:string_type ->
  ?max_results:list_terms_request_max_results_integer ->
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
  ?next_token:pagination_key_type ->
  ?max_results:list_resource_servers_limit_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  list_resource_servers_request

val make_list_identity_providers_response :
  ?next_token:pagination_key_type ->
  providers:providers_list_type ->
  unit ->
  list_identity_providers_response

val make_list_identity_providers_request :
  ?next_token:pagination_key_type ->
  ?max_results:list_providers_limit_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  list_identity_providers_request

val make_list_groups_response :
  ?next_token:pagination_key -> ?groups:group_list_type -> unit -> list_groups_response

val make_list_groups_request :
  ?next_token:pagination_key ->
  ?limit:query_limit_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  list_groups_request

val make_device_type :
  ?device_last_authenticated_date:date_type ->
  ?device_last_modified_date:date_type ->
  ?device_create_date:date_type ->
  ?device_attributes:attribute_list_type ->
  ?device_key:device_key_type ->
  unit ->
  device_type

val make_list_devices_response :
  ?pagination_token:search_pagination_token_type ->
  ?devices:device_list_type ->
  unit ->
  list_devices_response

val make_list_devices_request :
  ?pagination_token:search_pagination_token_type ->
  ?limit:query_limit_type ->
  access_token:token_model_type ->
  unit ->
  list_devices_request

val make_initiate_auth_response :
  ?available_challenges:available_challenge_list_type ->
  ?authentication_result:authentication_result_type ->
  ?challenge_parameters:challenge_parameters_type ->
  ?session:session_type ->
  ?challenge_name:challenge_name_type ->
  unit ->
  initiate_auth_response

val make_initiate_auth_request :
  ?session:session_type ->
  ?user_context_data:user_context_data_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?client_metadata:client_metadata_type ->
  ?auth_parameters:auth_parameters_type ->
  client_id:client_id_type ->
  auth_flow:auth_flow_type ->
  unit ->
  initiate_auth_request

val make_http_header : ?header_value:string_type -> ?header_name:string_type -> unit -> http_header
val make_global_sign_out_response : unit -> unit
val make_global_sign_out_request : access_token:token_model_type -> unit -> global_sign_out_request

val make_get_user_response :
  ?user_mfa_setting_list:user_mfa_setting_list_type ->
  ?preferred_mfa_setting:string_type ->
  ?mfa_options:mfa_option_list_type ->
  user_attributes:attribute_list_type ->
  username:username_type ->
  unit ->
  get_user_response

val make_get_user_request : access_token:token_model_type -> unit -> get_user_request

val make_get_user_pool_mfa_config_response :
  ?web_authn_configuration:web_authn_configuration_type ->
  ?mfa_configuration:user_pool_mfa_type ->
  ?email_mfa_configuration:email_mfa_config_type ->
  ?software_token_mfa_configuration:software_token_mfa_config_type ->
  ?sms_mfa_configuration:sms_mfa_config_type ->
  unit ->
  get_user_pool_mfa_config_response

val make_get_user_pool_mfa_config_request :
  user_pool_id:user_pool_id_type -> unit -> get_user_pool_mfa_config_request

val make_get_user_auth_factors_response :
  ?configured_user_auth_factors:configured_user_auth_factors_list_type ->
  ?user_mfa_setting_list:user_mfa_setting_list_type ->
  ?preferred_mfa_setting:string_type ->
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
  attribute_name:attribute_name_type ->
  access_token:token_model_type ->
  unit ->
  get_user_attribute_verification_code_request

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
  ?client_metadata:client_metadata_type ->
  ?device_key:device_key_type ->
  ?client_secret:client_secret_type ->
  client_id:client_id_type ->
  refresh_token:token_model_type ->
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
  idp_identifier:idp_identifier_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  get_identity_provider_by_identifier_request

val make_get_group_response : ?group:group_type -> unit -> get_group_response

val make_get_group_request :
  user_pool_id:user_pool_id_type -> group_name:group_name_type -> unit -> get_group_request

val make_get_device_response : device:device_type -> unit -> get_device_response

val make_get_device_request :
  ?access_token:token_model_type -> device_key:device_key_type -> unit -> get_device_request

val make_get_csv_header_response :
  ?csv_header:list_of_string_types ->
  ?user_pool_id:user_pool_id_type ->
  unit ->
  get_csv_header_response

val make_get_csv_header_request : user_pool_id:user_pool_id_type -> unit -> get_csv_header_request

val make_forgot_password_response :
  ?code_delivery_details:code_delivery_details_type -> unit -> forgot_password_response

val make_forgot_password_request :
  ?client_metadata:client_metadata_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?user_context_data:user_context_data_type ->
  ?secret_hash:secret_hash_type ->
  username:username_type ->
  client_id:client_id_type ->
  unit ->
  forgot_password_request

val make_forget_device_request :
  ?access_token:token_model_type -> device_key:device_key_type -> unit -> forget_device_request

val make_event_risk_type :
  ?compromised_credentials_detected:wrapped_boolean_type ->
  ?risk_level:risk_level_type ->
  ?risk_decision:risk_decision_type ->
  unit ->
  event_risk_type

val make_event_feedback_type :
  ?feedback_date:date_type ->
  provider:string_type ->
  feedback_value:feedback_value_type ->
  unit ->
  event_feedback_type

val make_event_context_data_type :
  ?country:string_type ->
  ?city:string_type ->
  ?timezone:string_type ->
  ?device_name:string_type ->
  ?ip_address:string_type ->
  unit ->
  event_context_data_type

val make_domain_description_type :
  ?routing:routing_type ->
  ?managed_login_version:wrapped_integer_type ->
  ?custom_domain_config:custom_domain_config_type ->
  ?status:domain_status_type ->
  ?version:domain_version_type ->
  ?cloud_front_distribution:string_type ->
  ?s3_bucket:s3_bucket_type ->
  ?domain:domain_type ->
  ?aws_account_id:aws_account_id_type ->
  ?user_pool_id:user_pool_id_type ->
  unit ->
  domain_description_type

val make_device_secret_verifier_config_type :
  ?salt:string_type -> ?password_verifier:string_type -> unit -> device_secret_verifier_config_type

val make_describe_user_pool_response :
  ?user_pool:user_pool_type -> unit -> describe_user_pool_response

val make_describe_user_pool_request :
  user_pool_id:user_pool_id_type -> unit -> describe_user_pool_request

val make_describe_user_pool_domain_response :
  ?domain_description:domain_description_type -> unit -> describe_user_pool_domain_response

val make_describe_user_pool_domain_request :
  domain:domain_type -> unit -> describe_user_pool_domain_request

val make_describe_user_pool_client_response :
  ?user_pool_client:user_pool_client_type -> unit -> describe_user_pool_client_response

val make_describe_user_pool_client_request :
  client_id:client_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  describe_user_pool_client_request

val make_describe_user_import_job_response :
  ?user_import_job:user_import_job_type -> unit -> describe_user_import_job_response

val make_describe_user_import_job_request :
  job_id:user_import_job_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  describe_user_import_job_request

val make_describe_terms_response : ?terms:terms_type -> unit -> describe_terms_response

val make_describe_terms_request :
  user_pool_id:user_pool_id_type -> terms_id:terms_id_type -> unit -> describe_terms_request

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
  identifier:resource_server_identifier_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  describe_resource_server_request

val make_describe_managed_login_branding_response :
  ?managed_login_branding:managed_login_branding_type ->
  unit ->
  describe_managed_login_branding_response

val make_describe_managed_login_branding_request :
  ?return_merged_resources:boolean_type ->
  managed_login_branding_id:managed_login_branding_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  describe_managed_login_branding_request

val make_describe_managed_login_branding_by_client_response :
  ?managed_login_branding:managed_login_branding_type ->
  unit ->
  describe_managed_login_branding_by_client_response

val make_describe_managed_login_branding_by_client_request :
  ?return_merged_resources:boolean_type ->
  client_id:client_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  describe_managed_login_branding_by_client_request

val make_describe_identity_provider_response :
  identity_provider:identity_provider_type -> unit -> describe_identity_provider_response

val make_describe_identity_provider_request :
  provider_name:provider_name_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  describe_identity_provider_request

val make_delete_web_authn_credential_response : unit -> unit

val make_delete_web_authn_credential_request :
  credential_id:string_type ->
  access_token:token_model_type ->
  unit ->
  delete_web_authn_credential_request

val make_delete_user_request : access_token:token_model_type -> unit -> delete_user_request

val make_delete_user_pool_request :
  user_pool_id:user_pool_id_type -> unit -> delete_user_pool_request

val make_delete_user_pool_replica_response :
  ?user_pool_replica:user_pool_replica_type -> unit -> delete_user_pool_replica_response

val make_delete_user_pool_replica_request :
  region_name:region_name_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  delete_user_pool_replica_request

val make_delete_user_pool_domain_response : unit -> unit

val make_delete_user_pool_domain_request :
  user_pool_id:user_pool_id_type -> domain:domain_type -> unit -> delete_user_pool_domain_request

val make_delete_user_pool_client_secret_response : unit -> unit

val make_delete_user_pool_client_secret_request :
  client_secret_id:client_secret_id_type ->
  client_id:client_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  delete_user_pool_client_secret_request

val make_delete_user_pool_client_request :
  client_id:client_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  delete_user_pool_client_request

val make_delete_user_attributes_response : unit -> unit

val make_delete_user_attributes_request :
  access_token:token_model_type ->
  user_attribute_names:attribute_name_list_type ->
  unit ->
  delete_user_attributes_request

val make_delete_terms_request :
  user_pool_id:user_pool_id_type -> terms_id:terms_id_type -> unit -> delete_terms_request

val make_delete_resource_server_request :
  identifier:resource_server_identifier_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  delete_resource_server_request

val make_delete_managed_login_branding_request :
  user_pool_id:user_pool_id_type ->
  managed_login_branding_id:managed_login_branding_id_type ->
  unit ->
  delete_managed_login_branding_request

val make_delete_identity_provider_request :
  provider_name:provider_name_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  delete_identity_provider_request

val make_delete_group_request :
  user_pool_id:user_pool_id_type -> group_name:group_name_type -> unit -> delete_group_request

val make_create_user_pool_response : ?user_pool:user_pool_type -> unit -> create_user_pool_response

val make_create_user_pool_request :
  ?issuer_configuration:issuer_configuration_type ->
  ?key_configuration:key_configuration_type ->
  ?user_pool_tier:user_pool_tier_type ->
  ?account_recovery_setting:account_recovery_setting_type ->
  ?username_configuration:username_configuration_type ->
  ?user_pool_add_ons:user_pool_add_ons_type ->
  ?schema:schema_attributes_list_type ->
  ?admin_create_user_config:admin_create_user_config_type ->
  ?user_pool_tags:user_pool_tags_type ->
  ?sms_configuration:sms_configuration_type ->
  ?email_configuration:email_configuration_type ->
  ?device_configuration:device_configuration_type ->
  ?user_attribute_update_settings:user_attribute_update_settings_type ->
  ?mfa_configuration:user_pool_mfa_type ->
  ?sms_authentication_message:sms_verification_message_type ->
  ?verification_message_template:verification_message_template_type ->
  ?email_verification_subject:email_verification_subject_type ->
  ?email_verification_message:email_verification_message_type ->
  ?sms_verification_message:sms_verification_message_type ->
  ?username_attributes:username_attributes_list_type ->
  ?alias_attributes:alias_attributes_list_type ->
  ?auto_verified_attributes:verified_attributes_list_type ->
  ?lambda_config:lambda_config_type ->
  ?deletion_protection:deletion_protection_type ->
  ?policies:user_pool_policy_type ->
  pool_name:user_pool_name_type ->
  unit ->
  create_user_pool_request

val make_create_user_pool_replica_response :
  ?user_pool_replica:user_pool_replica_type -> unit -> create_user_pool_replica_response

val make_create_user_pool_replica_request :
  ?user_pool_tags:user_pool_tags_type ->
  region_name:region_name_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  create_user_pool_replica_request

val make_create_user_pool_domain_response :
  ?routing:routing_type ->
  ?cloud_front_domain:domain_type ->
  ?managed_login_version:wrapped_integer_type ->
  unit ->
  create_user_pool_domain_response

val make_create_user_pool_domain_request :
  ?routing:routing_type ->
  ?custom_domain_config:custom_domain_config_type ->
  ?managed_login_version:wrapped_integer_type ->
  user_pool_id:user_pool_id_type ->
  domain:domain_type ->
  unit ->
  create_user_pool_domain_request

val make_create_user_pool_client_response :
  ?user_pool_client:user_pool_client_type -> unit -> create_user_pool_client_response

val make_create_user_pool_client_request :
  ?refresh_token_rotation:refresh_token_rotation_type ->
  ?auth_session_validity:auth_session_validity_type ->
  ?enable_propagate_additional_user_context_data:wrapped_boolean_type ->
  ?enable_token_revocation:wrapped_boolean_type ->
  ?prevent_user_existence_errors:prevent_user_existence_error_types ->
  ?analytics_configuration:analytics_configuration_type ->
  ?allowed_o_auth_flows_user_pool_client:boolean_type ->
  ?allowed_o_auth_scopes:scope_list_type ->
  ?allowed_o_auth_flows:o_auth_flows_type ->
  ?default_redirect_ur_i:redirect_url_type ->
  ?logout_ur_ls:logout_ur_ls_list_type ->
  ?callback_ur_ls:callback_ur_ls_list_type ->
  ?supported_identity_providers:supported_identity_providers_list_type ->
  ?explicit_auth_flows:explicit_auth_flows_list_type ->
  ?write_attributes:client_permission_list_type ->
  ?read_attributes:client_permission_list_type ->
  ?token_validity_units:token_validity_units_type ->
  ?id_token_validity:id_token_validity_type ->
  ?access_token_validity:access_token_validity_type ->
  ?refresh_token_validity:refresh_token_validity_type ->
  ?client_secret:client_secret_type ->
  ?generate_secret:generate_secret ->
  client_name:client_name_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  create_user_pool_client_request

val make_create_user_import_job_response :
  ?user_import_job:user_import_job_type -> unit -> create_user_import_job_response

val make_create_user_import_job_request :
  cloud_watch_logs_role_arn:arn_type ->
  user_pool_id:user_pool_id_type ->
  job_name:user_import_job_name_type ->
  unit ->
  create_user_import_job_request

val make_create_terms_response : ?terms:terms_type -> unit -> create_terms_response

val make_create_terms_request :
  ?links:links_type ->
  enforcement:terms_enforcement_type ->
  terms_source:terms_source_type ->
  terms_name:terms_name_type ->
  client_id:client_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  create_terms_request

val make_create_resource_server_response :
  resource_server:resource_server_type -> unit -> create_resource_server_response

val make_create_resource_server_request :
  ?scopes:resource_server_scope_list_type ->
  name:resource_server_name_type ->
  identifier:resource_server_identifier_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  create_resource_server_request

val make_create_managed_login_branding_response :
  ?managed_login_branding:managed_login_branding_type ->
  unit ->
  create_managed_login_branding_response

val make_create_managed_login_branding_request :
  ?assets:asset_list_type ->
  ?settings:document ->
  ?use_cognito_provided_values:boolean_type ->
  client_id:client_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  create_managed_login_branding_request

val make_create_identity_provider_response :
  identity_provider:identity_provider_type -> unit -> create_identity_provider_response

val make_create_identity_provider_request :
  ?idp_identifiers:idp_identifiers_list_type ->
  ?attribute_mapping:attribute_mapping_type ->
  provider_details:provider_details_type ->
  provider_type:identity_provider_type_type ->
  provider_name:provider_name_type_v2 ->
  user_pool_id:user_pool_id_type ->
  unit ->
  create_identity_provider_request

val make_create_group_response : ?group:group_type -> unit -> create_group_response

val make_create_group_request :
  ?precedence:precedence_type ->
  ?role_arn:arn_type ->
  ?description:description_type ->
  user_pool_id:user_pool_id_type ->
  group_name:group_name_type ->
  unit ->
  create_group_request

val make_context_data_type :
  ?encoded_data:string_type ->
  http_headers:http_header_list ->
  server_path:string_type ->
  server_name:string_type ->
  ip_address:string_type ->
  unit ->
  context_data_type

val make_confirm_sign_up_response : ?session:session_type -> unit -> confirm_sign_up_response

val make_confirm_sign_up_request :
  ?session:session_type ->
  ?client_metadata:client_metadata_type ->
  ?user_context_data:user_context_data_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?force_alias_creation:force_alias_creation ->
  ?secret_hash:secret_hash_type ->
  confirmation_code:confirmation_code_type ->
  username:username_type ->
  client_id:client_id_type ->
  unit ->
  confirm_sign_up_request

val make_confirm_forgot_password_response : unit -> unit

val make_confirm_forgot_password_request :
  ?client_metadata:client_metadata_type ->
  ?user_context_data:user_context_data_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?secret_hash:secret_hash_type ->
  password:password_type ->
  confirmation_code:confirmation_code_type ->
  username:username_type ->
  client_id:client_id_type ->
  unit ->
  confirm_forgot_password_request

val make_confirm_device_response :
  ?user_confirmation_necessary:boolean_type -> unit -> confirm_device_response

val make_confirm_device_request :
  ?device_name:device_name_type ->
  ?device_secret_verifier_config:device_secret_verifier_config_type ->
  device_key:device_key_type ->
  access_token:token_model_type ->
  unit ->
  confirm_device_request

val make_complete_web_authn_registration_response : unit -> unit

val make_complete_web_authn_registration_request :
  credential:document ->
  access_token:token_model_type ->
  unit ->
  complete_web_authn_registration_request

val make_change_password_response : unit -> unit

val make_change_password_request :
  ?previous_password:password_type ->
  access_token:token_model_type ->
  proposed_password:password_type ->
  unit ->
  change_password_request

val make_challenge_response_type :
  ?challenge_response:challenge_response ->
  ?challenge_name:challenge_name ->
  unit ->
  challenge_response_type

val make_auth_event_type :
  ?event_feedback:event_feedback_type ->
  ?event_context_data:event_context_data_type ->
  ?challenge_responses:challenge_response_list_type ->
  ?event_risk:event_risk_type ->
  ?event_response:event_response_type ->
  ?creation_date:date_type ->
  ?event_type:event_type ->
  ?event_id:string_type ->
  unit ->
  auth_event_type

val make_associate_software_token_response :
  ?session:session_type ->
  ?secret_code:secret_code_type ->
  unit ->
  associate_software_token_response

val make_associate_software_token_request :
  ?session:session_type ->
  ?access_token:token_model_type ->
  unit ->
  associate_software_token_request

val make_admin_user_global_sign_out_response : unit -> unit

val make_admin_user_global_sign_out_request :
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_user_global_sign_out_request

val make_admin_update_user_attributes_response : unit -> unit

val make_admin_update_user_attributes_request :
  ?client_metadata:client_metadata_type ->
  user_attributes:attribute_list_type ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_update_user_attributes_request

val make_admin_update_device_status_response : unit -> unit

val make_admin_update_device_status_request :
  ?device_remembered_status:device_remembered_status_type ->
  device_key:device_key_type ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_update_device_status_request

val make_admin_update_auth_event_feedback_response : unit -> unit

val make_admin_update_auth_event_feedback_request :
  feedback_value:feedback_value_type ->
  event_id:event_id_type ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_update_auth_event_feedback_request

val make_admin_set_user_settings_response : unit -> unit

val make_admin_set_user_settings_request :
  mfa_options:mfa_option_list_type ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_set_user_settings_request

val make_admin_set_user_password_response : unit -> unit

val make_admin_set_user_password_request :
  ?permanent:boolean_type ->
  password:password_type ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_set_user_password_request

val make_admin_set_user_mfa_preference_response : unit -> unit

val make_admin_set_user_mfa_preference_request :
  ?web_authn_mfa_settings:web_authn_mfa_settings_type ->
  ?email_mfa_settings:email_mfa_settings_type ->
  ?software_token_mfa_settings:software_token_mfa_settings_type ->
  ?sms_mfa_settings:sms_mfa_settings_type ->
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  unit ->
  admin_set_user_mfa_preference_request

val make_admin_respond_to_auth_challenge_response :
  ?authentication_result:authentication_result_type ->
  ?challenge_parameters:challenge_parameters_type ->
  ?session:session_type ->
  ?challenge_name:challenge_name_type ->
  unit ->
  admin_respond_to_auth_challenge_response

val make_admin_respond_to_auth_challenge_request :
  ?client_metadata:client_metadata_type ->
  ?context_data:context_data_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?session:session_type ->
  ?challenge_responses:challenge_responses_type ->
  challenge_name:challenge_name_type ->
  client_id:client_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_respond_to_auth_challenge_request

val make_admin_reset_user_password_response : unit -> unit

val make_admin_reset_user_password_request :
  ?client_metadata:client_metadata_type ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_reset_user_password_request

val make_admin_remove_user_from_group_request :
  group_name:group_name_type ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_remove_user_from_group_request

val make_admin_list_user_auth_events_response :
  ?next_token:pagination_key ->
  ?auth_events:auth_events_type ->
  unit ->
  admin_list_user_auth_events_response

val make_admin_list_user_auth_events_request :
  ?next_token:pagination_key ->
  ?max_results:query_limit_type ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_list_user_auth_events_request

val make_admin_list_groups_for_user_response :
  ?next_token:pagination_key ->
  ?groups:group_list_type ->
  unit ->
  admin_list_groups_for_user_response

val make_admin_list_groups_for_user_request :
  ?next_token:pagination_key ->
  ?limit:query_limit_type ->
  user_pool_id:user_pool_id_type ->
  username:username_type ->
  unit ->
  admin_list_groups_for_user_request

val make_admin_list_devices_response :
  ?pagination_token:search_pagination_token_type ->
  ?devices:device_list_type ->
  unit ->
  admin_list_devices_response

val make_admin_list_devices_request :
  ?pagination_token:search_pagination_token_type ->
  ?limit:query_limit_type ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_list_devices_request

val make_admin_link_provider_for_user_response : unit -> unit

val make_admin_link_provider_for_user_request :
  source_user:provider_user_identifier_type ->
  destination_user:provider_user_identifier_type ->
  user_pool_id:string_type ->
  unit ->
  admin_link_provider_for_user_request

val make_admin_initiate_auth_response :
  ?available_challenges:available_challenge_list_type ->
  ?authentication_result:authentication_result_type ->
  ?challenge_parameters:challenge_parameters_type ->
  ?session:session_type ->
  ?challenge_name:challenge_name_type ->
  unit ->
  admin_initiate_auth_response

val make_admin_initiate_auth_request :
  ?session:session_type ->
  ?context_data:context_data_type ->
  ?analytics_metadata:analytics_metadata_type ->
  ?client_metadata:client_metadata_type ->
  ?auth_parameters:auth_parameters_type ->
  auth_flow:auth_flow_type ->
  client_id:client_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_initiate_auth_request

val make_admin_get_user_response :
  ?user_mfa_setting_list:user_mfa_setting_list_type ->
  ?preferred_mfa_setting:string_type ->
  ?mfa_options:mfa_option_list_type ->
  ?user_status:user_status_type ->
  ?enabled:boolean_type ->
  ?user_last_modified_date:date_type ->
  ?user_create_date:date_type ->
  ?user_attributes:attribute_list_type ->
  username:username_type ->
  unit ->
  admin_get_user_response

val make_admin_get_user_request :
  username:username_type -> user_pool_id:user_pool_id_type -> unit -> admin_get_user_request

val make_admin_get_device_response : device:device_type -> unit -> admin_get_device_response

val make_admin_get_device_request :
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  device_key:device_key_type ->
  unit ->
  admin_get_device_request

val make_admin_forget_device_request :
  device_key:device_key_type ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_forget_device_request

val make_admin_enable_user_response : unit -> unit

val make_admin_enable_user_request :
  username:username_type -> user_pool_id:user_pool_id_type -> unit -> admin_enable_user_request

val make_admin_disable_user_response : unit -> unit

val make_admin_disable_user_request :
  username:username_type -> user_pool_id:user_pool_id_type -> unit -> admin_disable_user_request

val make_admin_disable_provider_for_user_response : unit -> unit

val make_admin_disable_provider_for_user_request :
  user:provider_user_identifier_type ->
  user_pool_id:string_type ->
  unit ->
  admin_disable_provider_for_user_request

val make_admin_delete_user_request :
  username:username_type -> user_pool_id:user_pool_id_type -> unit -> admin_delete_user_request

val make_admin_delete_user_attributes_response : unit -> unit

val make_admin_delete_user_attributes_request :
  user_attribute_names:attribute_name_list_type ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_delete_user_attributes_request

val make_admin_create_user_response : ?user:user_type -> unit -> admin_create_user_response

val make_admin_create_user_request :
  ?client_metadata:client_metadata_type ->
  ?desired_delivery_mediums:delivery_medium_list_type ->
  ?message_action:message_action_type ->
  ?force_alias_creation:force_alias_creation ->
  ?temporary_password:password_type ->
  ?validation_data:attribute_list_type ->
  ?user_attributes:attribute_list_type ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_create_user_request

val make_admin_confirm_sign_up_response : unit -> unit

val make_admin_confirm_sign_up_request :
  ?client_metadata:client_metadata_type ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_confirm_sign_up_request

val make_admin_add_user_to_group_request :
  group_name:group_name_type ->
  username:username_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  admin_add_user_to_group_request

val make_add_user_pool_client_secret_response :
  ?client_secret_descriptor:client_secret_descriptor_type ->
  unit ->
  add_user_pool_client_secret_response

val make_add_user_pool_client_secret_request :
  ?client_secret:client_secret_type ->
  client_id:client_id_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  add_user_pool_client_secret_request

val make_add_custom_attributes_response : unit -> unit

val make_add_custom_attributes_request :
  custom_attributes:custom_attributes_list_type ->
  user_pool_id:user_pool_id_type ->
  unit ->
  add_custom_attributes_request
(** {1:operations Operations} *)

module AddCustomAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserImportInProgressException of user_import_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_custom_attributes_request ->
    ( add_custom_attributes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserImportInProgressException of user_import_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_custom_attributes_request ->
    ( add_custom_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserImportInProgressException of user_import_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds additional user attributes to the user pool schema. Custom attributes can be mutable or \
   immutable and have a [custom:] or [dev:] prefix. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-attributes.html#user-pool-settings-custom-attributes}Custom \
   attributes}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module AddUserPoolClientSecret : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_user_pool_client_secret_request ->
    ( add_user_pool_client_secret_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_user_pool_client_secret_request ->
    ( add_user_pool_client_secret_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new client secret for an existing confidential user pool app client. Supports up to 2 \
   active secrets per app client for zero-downtime credential rotation workflows.\n"]

module AdminAddUserToGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_add_user_to_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_add_user_to_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds a user to a group. A user who is in a group can present a preferred-role claim to an \
   identity pool, and populates a [cognito:groups] claim to their access and identity tokens.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module AdminConfirmSignUp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyFailedAttemptsException of too_many_failed_attempts_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnexpectedLambdaException of unexpected_lambda_exception
    | `UserLambdaValidationException of user_lambda_validation_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_confirm_sign_up_request ->
    ( admin_confirm_sign_up_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyFailedAttemptsException of too_many_failed_attempts_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_confirm_sign_up_request ->
    ( admin_confirm_sign_up_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyFailedAttemptsException of too_many_failed_attempts_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Confirms user sign-up as an administrator. \n\n\
  \ This request sets a user account active in a user pool that \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#signing-up-users-in-your-app-and-confirming-them-as-admin}requires \
   confirmation of new user accounts} before they can sign in. You can configure your user pool to \
   not send confirmation codes to new users and instead confirm them with this API operation on \
   the back end.\n\
  \ \n\
  \   Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \    To configure your user pool to require administrative confirmation of users, set \
   [AllowAdminCreateUserOnly] to [true] in a [CreateUserPool] or [UpdateUserPool] request.\n\
  \    "]

module AdminCreateUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeDeliveryFailureException of code_delivery_failure_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidPasswordException of invalid_password_exception
    | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
    | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PreconditionNotMetException of precondition_not_met_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnexpectedLambdaException of unexpected_lambda_exception
    | `UnsupportedUserStateException of unsupported_user_state_exception
    | `UserLambdaValidationException of user_lambda_validation_exception
    | `UsernameExistsException of username_exists_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_create_user_request ->
    ( admin_create_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeDeliveryFailureException of code_delivery_failure_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPasswordException of invalid_password_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PreconditionNotMetException of precondition_not_met_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UnsupportedUserStateException of unsupported_user_state_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UsernameExistsException of username_exists_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_create_user_request ->
    ( admin_create_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeDeliveryFailureException of code_delivery_failure_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPasswordException of invalid_password_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PreconditionNotMetException of precondition_not_met_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UnsupportedUserStateException of unsupported_user_state_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UsernameExistsException of username_exists_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new user in the specified user pool.\n\n\
  \ If [MessageAction] isn't set, the default is to send a welcome message via email or phone (SMS).\n\
  \ \n\
  \  This message is based on a template that you configured in your call to create or update a \
   user pool. This template includes your custom sign-up instructions and placeholders for user \
   name and temporary password.\n\
  \  \n\
  \   Alternatively, you can call [AdminCreateUser] with [SUPPRESS] for the [MessageAction] \
   parameter, and Amazon Cognito won't send any email. \n\
  \   \n\
  \    In either case, if the user has a password, they will be in the [FORCE_CHANGE_PASSWORD] \
   state until they sign in and set their password. Your invitation message template must have the \
   [{####}] password placeholder if your users have passwords. If your template doesn't have this \
   placeholder, Amazon Cognito doesn't deliver the invitation message. In this case, you must \
   update your message template and resend the password with a new [AdminCreateUser] request with \
   a [MessageAction] value of [RESEND].\n\
  \    \n\
  \      This action might generate an SMS text message. Starting June 1, 2021, US telecom \
   carriers require you to register an origination phone number before you can send SMS messages \
   to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone \
   number with {{:https://console.aws.amazon.com/pinpoint/home/}Amazon Pinpoint}. Amazon Cognito \
   uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS \
   messages might not be able to sign up, activate their accounts, or sign in.\n\
  \      \n\
  \       If you have never used SMS text messages with Amazon Cognito or any other Amazon Web \
   Services service, Amazon Simple Notification Service might place your account in the SMS \
   sandbox. In {i  {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}sandbox mode} \
   }, you can send messages only to verified phone numbers. After you test your app while in the \
   sandbox environment, you can move out of the sandbox and into production. For more information, \
   see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html} \
   SMS message settings for Amazon Cognito user pools} in the {i Amazon Cognito Developer Guide}.\n\
  \       \n\
  \          Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you must use IAM credentials to authorize requests, \
   and you must grant yourself the corresponding IAM permission in a policy.\n\
  \          \n\
  \            {b Learn more} \n\
  \           \n\
  \            {ul\n\
  \                  {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                      \n\
  \                       }\n\
  \                  {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                      \n\
  \                       }\n\
  \                  }\n\
  \   "]

module AdminDeleteUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_delete_user_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_delete_user_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a user profile in your user pool.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module AdminDeleteUserAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_delete_user_attributes_request ->
    ( admin_delete_user_attributes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_delete_user_attributes_request ->
    ( admin_delete_user_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes attribute values from a user. This operation doesn't affect tokens for existing user \
   sessions. The next ID token that the user receives will no longer have the deleted attributes.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module AdminDisableProviderForUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AliasExistsException of alias_exists_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_disable_provider_for_user_request ->
    ( admin_disable_provider_for_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AliasExistsException of alias_exists_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_disable_provider_for_user_request ->
    ( admin_disable_provider_for_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AliasExistsException of alias_exists_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Prevents the user from signing in with the specified external (SAML or social) identity \
   provider (IdP). If the user that you want to deactivate is a Amazon Cognito user pools native \
   username + password user, they can't use their password to sign in. If the user to deactivate \
   is a linked external IdP user, any link between that user and an existing user is removed. When \
   the external user signs in again, and the user is no longer attached to the previously linked \
   [DestinationUser], the user must create a new user account.\n\n\
  \ The value of [ProviderName] must match the name of a user pool IdP.\n\
  \ \n\
  \  To deactivate a local user, set [ProviderName] to [Cognito] and the [ProviderAttributeName] \
   to [Cognito_Subject]. The [ProviderAttributeValue] must be user's local username.\n\
  \  \n\
  \   The [ProviderAttributeName] must always be [Cognito_Subject] for social IdPs. The \
   [ProviderAttributeValue] must always be the exact subject that was used when the user was \
   originally linked as a source user.\n\
  \   \n\
  \    For de-linking a SAML identity, there are two scenarios. If the linked identity has not yet \
   been used to sign in, the [ProviderAttributeName] and [ProviderAttributeValue] must be the same \
   values that were used for the [SourceUser] when the identities were originally linked using [\n\
  \                AdminLinkProviderForUser] call. This is also true if the linking was done with \
   [ProviderAttributeName] set to [Cognito_Subject]. If the user has already signed in, the \
   [ProviderAttributeName] must be [Cognito_Subject] and [ProviderAttributeValue] must be the \
   [NameID] from their SAML assertion.\n\
  \    \n\
  \      Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you must use IAM credentials to authorize requests, and \
   you must grant yourself the corresponding IAM permission in a policy.\n\
  \      \n\
  \        {b Learn more} \n\
  \       \n\
  \        {ul\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \   "]

module AdminDisableUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_disable_user_request ->
    ( admin_disable_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_disable_user_request ->
    ( admin_disable_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deactivates a user profile and revokes all access tokens for the user. A deactivated user can't \
   sign in, but still appears in the responses to [ListUsers] API requests.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module AdminEnableUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_enable_user_request ->
    ( admin_enable_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_enable_user_request ->
    ( admin_enable_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Activates sign-in for a user profile that previously had sign-in access disabled.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module AdminForgetDevice : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_forget_device_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_forget_device_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Forgets, or deletes, a remembered device from a user's profile. After you forget the device, \
   the user can no longer complete device authentication with that device and when applicable, \
   must submit MFA codes again. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
   with devices}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module AdminGetDevice : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_get_device_request ->
    ( admin_get_device_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_get_device_request ->
    ( admin_get_device_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given the device key, returns details for a user's device. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
   with devices}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module AdminGetUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_get_user_request ->
    ( admin_get_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_get_user_request ->
    ( admin_get_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a username, returns details about a user profile in a user pool. You can specify alias \
   attributes in the [Username] request parameter.\n\n\
  \ This operation contributes to your monthly active user (MAU) count for the purpose of billing.\n\
  \ \n\
  \   Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \   "]

module AdminInitiateAuth : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
    | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
    | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
    | `MFAMethodNotFoundException of mfa_method_not_found_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnexpectedLambdaException of unexpected_lambda_exception
    | `UnsupportedOperationException of unsupported_operation_exception
    | `UserLambdaValidationException of user_lambda_validation_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_initiate_auth_request ->
    ( admin_initiate_auth_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `MFAMethodNotFoundException of mfa_method_not_found_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UnsupportedOperationException of unsupported_operation_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_initiate_auth_request ->
    ( admin_initiate_auth_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `MFAMethodNotFoundException of mfa_method_not_found_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UnsupportedOperationException of unsupported_operation_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts sign-in for applications with a server-side component, for example a traditional web \
   application. This operation specifies the authentication flow that you'd like to begin. The \
   authentication flow that you specify must be supported in your app client configuration. For \
   more information about authentication flows, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-authentication-flow-methods.html}Authentication \
   flows}.\n\n\
  \  This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers \
   require you to register an origination phone number before you can send SMS messages to US \
   phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number \
   with {{:https://console.aws.amazon.com/pinpoint/home/}Amazon Pinpoint}. Amazon Cognito uses the \
   registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages \
   might not be able to sign up, activate their accounts, or sign in.\n\
  \  \n\
  \   If you have never used SMS text messages with Amazon Cognito or any other Amazon Web \
   Services service, Amazon Simple Notification Service might place your account in the SMS \
   sandbox. In {i  {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}sandbox mode} \
   }, you can send messages only to verified phone numbers. After you test your app while in the \
   sandbox environment, you can move out of the sandbox and into production. For more information, \
   see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html} \
   SMS message settings for Amazon Cognito user pools} in the {i Amazon Cognito Developer Guide}.\n\
  \   \n\
  \      Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you must use IAM credentials to authorize requests, and \
   you must grant yourself the corresponding IAM permission in a policy.\n\
  \      \n\
  \        {b Learn more} \n\
  \       \n\
  \        {ul\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \   "]

module AdminLinkProviderForUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AliasExistsException of alias_exists_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_link_provider_for_user_request ->
    ( admin_link_provider_for_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AliasExistsException of alias_exists_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_link_provider_for_user_request ->
    ( admin_link_provider_for_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AliasExistsException of alias_exists_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Links an existing user account in a user pool, or [DestinationUser], to an identity from an \
   external IdP, or [SourceUser], based on a specified attribute name and value from the external \
   IdP.\n\n\
  \ This operation connects a local user profile with a user identity who hasn't yet signed in \
   from their third-party IdP. When the user signs in with their IdP, they get access-control \
   configuration from the local user profile. Linked local users can also sign in with SDK-based \
   API operations like [InitiateAuth] after they sign in at least once through their IdP. For more \
   information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-identity-federation-consolidate-users.html}Linking \
   federated users}.\n\
  \ \n\
  \   The maximum number of federated identities linked to a user is five.\n\
  \   \n\
  \      Because this API allows a user with an external federated identity to sign in as a local \
   user, it is critical that it only be used with external IdPs and linked attributes that you \
   trust.\n\
  \      \n\
  \         Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you must use IAM credentials to authorize requests, and \
   you must grant yourself the corresponding IAM permission in a policy.\n\
  \         \n\
  \           {b Learn more} \n\
  \          \n\
  \           {ul\n\
  \                 {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                     \n\
  \                      }\n\
  \                 {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                     \n\
  \                      }\n\
  \                 }\n\
  \   "]

module AdminListDevices : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_list_devices_request ->
    ( admin_list_devices_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_list_devices_request ->
    ( admin_list_devices_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists a user's registered devices. Remembered devices are used in authentication services where \
   you offer a \"Remember me\" option for users who you want to permit to sign in without MFA from \
   a trusted device. Users can bypass MFA while your application performs device SRP \
   authentication on the back end. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
   with devices}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module AdminListGroupsForUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_list_groups_for_user_request ->
    ( admin_list_groups_for_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_list_groups_for_user_request ->
    ( admin_list_groups_for_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the groups that a user belongs to. User pool groups are identifiers that you can \
   reference from the contents of ID and access tokens, and set preferred IAM roles for \
   identity-pool authentication. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-user-groups.html}Adding \
   groups to a user pool}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module AdminListUserAuthEvents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception
    | `UserPoolAddOnNotEnabledException of user_pool_add_on_not_enabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_list_user_auth_events_request ->
    ( admin_list_user_auth_events_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception
      | `UserPoolAddOnNotEnabledException of user_pool_add_on_not_enabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_list_user_auth_events_request ->
    ( admin_list_user_auth_events_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception
      | `UserPoolAddOnNotEnabledException of user_pool_add_on_not_enabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Requests a history of user activity and any risks detected as part of Amazon Cognito threat \
   protection. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-adaptive-authentication.html#user-pool-settings-adaptive-authentication-event-user-history}Viewing \
   user event history}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module AdminRemoveUserFromGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_remove_user_from_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_remove_user_from_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a username and a group name, removes them from the group. User pool groups are \
   identifiers that you can reference from the contents of ID and access tokens, and set preferred \
   IAM roles for identity-pool authentication. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-user-groups.html}Adding \
   groups to a user pool}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module AdminResetUserPassword : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
    | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnexpectedLambdaException of unexpected_lambda_exception
    | `UserLambdaValidationException of user_lambda_validation_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_reset_user_password_request ->
    ( admin_reset_user_password_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_reset_user_password_request ->
    ( admin_reset_user_password_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Begins the password reset process. Sets the requested user\226\128\153s account into a \
   [RESET_REQUIRED] status, and sends them a password-reset code. Your user pool also sends the \
   user a notification with a reset code and the information that their password has been reset. \
   At sign-in, your application or the managed login session receives a challenge to complete the \
   reset by confirming the code and setting a new password.\n\n\
  \ To use this API operation, your user pool must have self-service account recovery configured.\n\
  \ \n\
  \   This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers \
   require you to register an origination phone number before you can send SMS messages to US \
   phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number \
   with {{:https://console.aws.amazon.com/pinpoint/home/}Amazon Pinpoint}. Amazon Cognito uses the \
   registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages \
   might not be able to sign up, activate their accounts, or sign in.\n\
  \   \n\
  \    If you have never used SMS text messages with Amazon Cognito or any other Amazon Web \
   Services service, Amazon Simple Notification Service might place your account in the SMS \
   sandbox. In {i  {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}sandbox mode} \
   }, you can send messages only to verified phone numbers. After you test your app while in the \
   sandbox environment, you can move out of the sandbox and into production. For more information, \
   see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html} \
   SMS message settings for Amazon Cognito user pools} in the {i Amazon Cognito Developer Guide}.\n\
  \    \n\
  \       Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you must use IAM credentials to authorize requests, and \
   you must grant yourself the corresponding IAM permission in a policy.\n\
  \       \n\
  \         {b Learn more} \n\
  \        \n\
  \         {ul\n\
  \               {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                   \n\
  \                    }\n\
  \               {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                   \n\
  \                    }\n\
  \               }\n\
  \   "]

module AdminRespondToAuthChallenge : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AliasExistsException of alias_exists_exception
    | `CodeMismatchException of code_mismatch_exception
    | `ExpiredCodeException of expired_code_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidPasswordException of invalid_password_exception
    | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
    | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
    | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
    | `MFAMethodNotFoundException of mfa_method_not_found_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordHistoryPolicyViolationException of password_history_policy_violation_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `SoftwareTokenMFANotFoundException of software_token_mfa_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnexpectedLambdaException of unexpected_lambda_exception
    | `UserLambdaValidationException of user_lambda_validation_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_respond_to_auth_challenge_request ->
    ( admin_respond_to_auth_challenge_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AliasExistsException of alias_exists_exception
      | `CodeMismatchException of code_mismatch_exception
      | `ExpiredCodeException of expired_code_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPasswordException of invalid_password_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `MFAMethodNotFoundException of mfa_method_not_found_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordHistoryPolicyViolationException of password_history_policy_violation_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `SoftwareTokenMFANotFoundException of software_token_mfa_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_respond_to_auth_challenge_request ->
    ( admin_respond_to_auth_challenge_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AliasExistsException of alias_exists_exception
      | `CodeMismatchException of code_mismatch_exception
      | `ExpiredCodeException of expired_code_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPasswordException of invalid_password_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `MFAMethodNotFoundException of mfa_method_not_found_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordHistoryPolicyViolationException of password_history_policy_violation_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `SoftwareTokenMFANotFoundException of software_token_mfa_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Some API operations in a user pool generate a challenge, like a prompt for an MFA code, for \
   device authentication that bypasses MFA, or for a custom authentication challenge. An \
   [AdminRespondToAuthChallenge] API request provides the answer to that challenge, like a code or \
   a secure remote password (SRP). The parameters of a response to an authentication challenge \
   vary with the type of challenge.\n\n\
  \ For more information about custom authentication challenges, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-challenge.html}Custom \
   authentication challenge Lambda triggers}.\n\
  \ \n\
  \   This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers \
   require you to register an origination phone number before you can send SMS messages to US \
   phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number \
   with {{:https://console.aws.amazon.com/pinpoint/home/}Amazon Pinpoint}. Amazon Cognito uses the \
   registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages \
   might not be able to sign up, activate their accounts, or sign in.\n\
  \   \n\
  \    If you have never used SMS text messages with Amazon Cognito or any other Amazon Web \
   Services service, Amazon Simple Notification Service might place your account in the SMS \
   sandbox. In {i  {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}sandbox mode} \
   }, you can send messages only to verified phone numbers. After you test your app while in the \
   sandbox environment, you can move out of the sandbox and into production. For more information, \
   see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html} \
   SMS message settings for Amazon Cognito user pools} in the {i Amazon Cognito Developer Guide}.\n\
  \    \n\
  \       Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you must use IAM credentials to authorize requests, and \
   you must grant yourself the corresponding IAM permission in a policy.\n\
  \       \n\
  \         {b Learn more} \n\
  \        \n\
  \         {ul\n\
  \               {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                   \n\
  \                    }\n\
  \               {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                   \n\
  \                    }\n\
  \               }\n\
  \   "]

module AdminSetUserMFAPreference : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_set_user_mfa_preference_request ->
    ( admin_set_user_mfa_preference_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_set_user_mfa_preference_request ->
    ( admin_set_user_mfa_preference_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the user's multi-factor authentication (MFA) preference, including which MFA options are \
   activated, and if any are preferred. Only one factor can be set as preferred. The preferred MFA \
   factor will be used to authenticate a user if multiple factors are activated. If multiple \
   options are activated and no preference is set, a challenge to choose an MFA option will be \
   returned during sign-in.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module AdminSetUserPassword : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidPasswordException of invalid_password_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordHistoryPolicyViolationException of password_history_policy_violation_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_set_user_password_request ->
    ( admin_set_user_password_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPasswordException of invalid_password_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordHistoryPolicyViolationException of password_history_policy_violation_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_set_user_password_request ->
    ( admin_set_user_password_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPasswordException of invalid_password_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordHistoryPolicyViolationException of password_history_policy_violation_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the specified user's password in a user pool. This operation administratively sets a \
   temporary or permanent password for a user. With this operation, you can bypass self-service \
   password changes and permit immediate sign-in with the password that you set. To do this, set \
   [Permanent] to [true].\n\n\
  \ You can also set a new temporary password in this request, send it to a user, and require them \
   to choose a new password on their next sign-in. To do this, set [Permanent] to [false].\n\
  \ \n\
  \  If the password is temporary, the user's [Status] becomes [FORCE_CHANGE_PASSWORD]. When the \
   user next tries to sign in, the [InitiateAuth] or [AdminInitiateAuth] response includes the \
   [NEW_PASSWORD_REQUIRED] challenge. If the user doesn't sign in before the temporary password \
   expires, they can no longer sign in and you must repeat this operation to set a temporary or \
   permanent password for them.\n\
  \  \n\
  \   After the user sets a new password, or if you set a permanent password, their status becomes \
   [Confirmed].\n\
  \   \n\
  \     [AdminSetUserPassword] can set a password for the user profile that Amazon Cognito creates \
   for third-party federated users. When you set a password, the federated user's status changes \
   from [EXTERNAL_PROVIDER] to [CONFIRMED]. A user in this state can sign in as a federated user, \
   and initiate authentication flows in the API like a linked native user. They can also modify \
   their password and attributes in token-authenticated API requests like [ChangePassword] and \
   [UpdateUserAttributes]. As a best security practice and to keep users in sync with your \
   external IdP, don't set passwords on federated user profiles. To set up a federated user for \
   native sign-in with a linked native user, refer to \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-identity-federation-consolidate-users.html}Linking \
   federated users to an existing user profile}.\n\
  \    \n\
  \      Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you must use IAM credentials to authorize requests, and \
   you must grant yourself the corresponding IAM permission in a policy.\n\
  \      \n\
  \        {b Learn more} \n\
  \       \n\
  \        {ul\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \   "]

module AdminSetUserSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_set_user_settings_request ->
    ( admin_set_user_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_set_user_settings_request ->
    ( admin_set_user_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {i This action is no longer supported.} You can use it to configure only SMS MFA. You can't \
   use it to configure time-based one-time password (TOTP) software token MFA.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module AdminUpdateAuthEventFeedback : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception
    | `UserPoolAddOnNotEnabledException of user_pool_add_on_not_enabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_update_auth_event_feedback_request ->
    ( admin_update_auth_event_feedback_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception
      | `UserPoolAddOnNotEnabledException of user_pool_add_on_not_enabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_update_auth_event_feedback_request ->
    ( admin_update_auth_event_feedback_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception
      | `UserPoolAddOnNotEnabledException of user_pool_add_on_not_enabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides the feedback for an authentication event generated by threat protection features. Your \
   response indicates that you think that the event either was from a valid user or was an \
   unwanted authentication attempt. This feedback improves the risk evaluation decision for the \
   user pool as part of Amazon Cognito threat protection. To activate this setting, your user pool \
   must be on the \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-plus.html} \
   Plus tier}.\n\n\
  \ To train the threat-protection model to recognize trusted and untrusted sign-in \
   characteristics, configure threat protection in audit-only mode and provide a mechanism for \
   users or administrators to submit feedback. Your feedback can tell Amazon Cognito that a risk \
   rating was assigned at a level you don't agree with.\n\
  \ \n\
  \   Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \   "]

module AdminUpdateDeviceStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_update_device_status_request ->
    ( admin_update_device_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_update_device_status_request ->
    ( admin_update_device_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the status of a user's device so that it is marked as remembered or not remembered for \
   the purpose of device authentication. Device authentication is a \"remember me\" mechanism that \
   silently completes sign-in from trusted devices with a device key instead of a user-provided \
   MFA code. This operation changes the status of a device without deleting it, so you can enable \
   it again later. For more information about device authentication, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
   with devices}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module AdminUpdateUserAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AliasExistsException of alias_exists_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
    | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnexpectedLambdaException of unexpected_lambda_exception
    | `UserLambdaValidationException of user_lambda_validation_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_update_user_attributes_request ->
    ( admin_update_user_attributes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AliasExistsException of alias_exists_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_update_user_attributes_request ->
    ( admin_update_user_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AliasExistsException of alias_exists_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified user's attributes. To delete an attribute from your user, submit the \
   attribute in your API request with a blank value.\n\n\
  \ For custom attributes, you must add a [custom:] prefix to the attribute name, for example \
   [custom:department].\n\
  \ \n\
  \  This operation can set a user's email address or phone number as verified and permit \
   immediate sign-in in user pools that require verification of these attributes. To do this, set \
   the [email_verified] or [phone_number_verified] attribute to [true].\n\
  \  \n\
  \    Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \      {ul\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \     This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers \
   require you to register an origination phone number before you can send SMS messages to US \
   phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number \
   with {{:https://console.aws.amazon.com/pinpoint/home/}Amazon Pinpoint}. Amazon Cognito uses the \
   registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages \
   might not be able to sign up, activate their accounts, or sign in.\n\
  \     \n\
  \      If you have never used SMS text messages with Amazon Cognito or any other Amazon Web \
   Services service, Amazon Simple Notification Service might place your account in the SMS \
   sandbox. In {i  {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}sandbox mode} \
   }, you can send messages only to verified phone numbers. After you test your app while in the \
   sandbox environment, you can move out of the sandbox and into production. For more information, \
   see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html} \
   SMS message settings for Amazon Cognito user pools} in the {i Amazon Cognito Developer Guide}.\n\
  \      \n\
  \       "]

module AdminUserGlobalSignOut : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    admin_user_global_sign_out_request ->
    ( admin_user_global_sign_out_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    admin_user_global_sign_out_request ->
    ( admin_user_global_sign_out_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Invalidates the identity, access, and refresh tokens that Amazon Cognito issued to a user. Call \
   this operation with your administrative credentials when your user signs out of your app. This \
   results in the following behavior.\n\n\
  \ {ul\n\
  \       {-  Amazon Cognito no longer accepts {i token-authorized} user operations that you \
   authorize with a signed-out user's access tokens. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \           \n\
  \            Amazon Cognito returns an [Access Token has been revoked] error when your app \
   attempts to authorize a user pools API request with a revoked access token that contains the \
   scope [aws.cognito.signin.user.admin].\n\
  \            \n\
  \             }\n\
  \       {-  Amazon Cognito no longer accepts a signed-out user's ID token in a \
   {{:https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetId.html}GetId } \
   request to an identity pool with [ServerSideTokenCheck] enabled for its user pool IdP \
   configuration in \
   {{:https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_CognitoIdentityProvider.html}CognitoIdentityProvider}.\n\
  \           \n\
  \            }\n\
  \       {-  Amazon Cognito no longer accepts a signed-out user's refresh tokens in refresh \
   requests.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   Other requests might be valid until your user's token expires. This operation doesn't clear \
   the \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html}managed \
   login} session cookie. To clear the session for a user who signed in with managed login or the \
   classic hosted UI, direct their browser session to the \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/logout-endpoint.html}logout \
   endpoint}.\n\
  \   \n\
  \     Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you must use IAM credentials to authorize requests, and \
   you must grant yourself the corresponding IAM permission in a policy.\n\
  \     \n\
  \       {b Learn more} \n\
  \      \n\
  \       {ul\n\
  \             {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                 \n\
  \                  }\n\
  \             {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \   "]

module AssociateSoftwareToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `SoftwareTokenMFANotFoundException of software_token_mfa_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_software_token_request ->
    ( associate_software_token_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `SoftwareTokenMFANotFoundException of software_token_mfa_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_software_token_request ->
    ( associate_software_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `SoftwareTokenMFANotFoundException of software_token_mfa_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Begins setup of time-based one-time password (TOTP) multi-factor authentication (MFA) for a \
   user, with a unique private key that Amazon Cognito generates and returns in the API response. \
   You can authorize an [AssociateSoftwareToken] request with either the user's access token, or a \
   session string from a challenge response that you received from Amazon Cognito.\n\n\
  \  Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you can't use IAM credentials to authorize requests, \
   and you can't grant IAM permissions in policies. For more information about authorization \
   models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \  \n\
  \    Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \    "]

module ChangePassword : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidPasswordException of invalid_password_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordHistoryPolicyViolationException of password_history_policy_violation_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    change_password_request ->
    ( change_password_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPasswordException of invalid_password_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordHistoryPolicyViolationException of password_history_policy_violation_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    change_password_request ->
    ( change_password_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPasswordException of invalid_password_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordHistoryPolicyViolationException of password_history_policy_violation_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Changes the password for the currently signed-in user.\n\n\
  \ Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \    "]

module CompleteWebAuthnRegistration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `WebAuthnChallengeNotFoundException of web_authn_challenge_not_found_exception
    | `WebAuthnClientMismatchException of web_authn_client_mismatch_exception
    | `WebAuthnCredentialNotSupportedException of web_authn_credential_not_supported_exception
    | `WebAuthnNotEnabledException of web_authn_not_enabled_exception
    | `WebAuthnOriginNotAllowedException of web_authn_origin_not_allowed_exception
    | `WebAuthnRelyingPartyMismatchException of web_authn_relying_party_mismatch_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    complete_web_authn_registration_request ->
    ( complete_web_authn_registration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `WebAuthnChallengeNotFoundException of web_authn_challenge_not_found_exception
      | `WebAuthnClientMismatchException of web_authn_client_mismatch_exception
      | `WebAuthnCredentialNotSupportedException of web_authn_credential_not_supported_exception
      | `WebAuthnNotEnabledException of web_authn_not_enabled_exception
      | `WebAuthnOriginNotAllowedException of web_authn_origin_not_allowed_exception
      | `WebAuthnRelyingPartyMismatchException of web_authn_relying_party_mismatch_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    complete_web_authn_registration_request ->
    ( complete_web_authn_registration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `WebAuthnChallengeNotFoundException of web_authn_challenge_not_found_exception
      | `WebAuthnClientMismatchException of web_authn_client_mismatch_exception
      | `WebAuthnCredentialNotSupportedException of web_authn_credential_not_supported_exception
      | `WebAuthnNotEnabledException of web_authn_not_enabled_exception
      | `WebAuthnOriginNotAllowedException of web_authn_origin_not_allowed_exception
      | `WebAuthnRelyingPartyMismatchException of web_authn_relying_party_mismatch_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Completes registration of a passkey authenticator for the currently signed-in user.\n\n\
  \ Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \ "]

module ConfirmDevice : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DeviceKeyExistsException of device_key_exists_exception
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidPasswordException of invalid_password_exception
    | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UsernameExistsException of username_exists_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    confirm_device_request ->
    ( confirm_device_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeviceKeyExistsException of device_key_exists_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPasswordException of invalid_password_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UsernameExistsException of username_exists_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    confirm_device_request ->
    ( confirm_device_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeviceKeyExistsException of device_key_exists_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPasswordException of invalid_password_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UsernameExistsException of username_exists_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Confirms a device that a user wants to remember. A remembered device is a \"Remember me on this \
   device\" option for user pools that perform authentication with the device key of a trusted \
   device in the back end, instead of a user-provided MFA code. For more information about device \
   authentication, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
   with user devices in your user pool}.\n\n\
  \ Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \    "]

module ConfirmForgotPassword : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeMismatchException of code_mismatch_exception
    | `ExpiredCodeException of expired_code_exception
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidPasswordException of invalid_password_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordHistoryPolicyViolationException of password_history_policy_violation_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyFailedAttemptsException of too_many_failed_attempts_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnexpectedLambdaException of unexpected_lambda_exception
    | `UserLambdaValidationException of user_lambda_validation_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    confirm_forgot_password_request ->
    ( confirm_forgot_password_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeMismatchException of code_mismatch_exception
      | `ExpiredCodeException of expired_code_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPasswordException of invalid_password_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordHistoryPolicyViolationException of password_history_policy_violation_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyFailedAttemptsException of too_many_failed_attempts_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    confirm_forgot_password_request ->
    ( confirm_forgot_password_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeMismatchException of code_mismatch_exception
      | `ExpiredCodeException of expired_code_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPasswordException of invalid_password_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordHistoryPolicyViolationException of password_history_policy_violation_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyFailedAttemptsException of too_many_failed_attempts_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This public API operation accepts a confirmation code that Amazon Cognito sent to a user and \
   accepts a new password for that user.\n\n\
  \  Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you can't use IAM credentials to authorize requests, \
   and you can't grant IAM permissions in policies. For more information about authorization \
   models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \  \n\
  \   "]

module ConfirmSignUp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AliasExistsException of alias_exists_exception
    | `CodeMismatchException of code_mismatch_exception
    | `ExpiredCodeException of expired_code_exception
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyFailedAttemptsException of too_many_failed_attempts_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnexpectedLambdaException of unexpected_lambda_exception
    | `UserLambdaValidationException of user_lambda_validation_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    confirm_sign_up_request ->
    ( confirm_sign_up_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AliasExistsException of alias_exists_exception
      | `CodeMismatchException of code_mismatch_exception
      | `ExpiredCodeException of expired_code_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyFailedAttemptsException of too_many_failed_attempts_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    confirm_sign_up_request ->
    ( confirm_sign_up_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AliasExistsException of alias_exists_exception
      | `CodeMismatchException of code_mismatch_exception
      | `ExpiredCodeException of expired_code_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyFailedAttemptsException of too_many_failed_attempts_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Confirms the account of a new user. This public API operation submits a code that Amazon \
   Cognito sent to your user when they signed up in your user pool. After your user enters their \
   code, they confirm ownership of the email address or phone number that they provided, and their \
   user account becomes active. Depending on your user pool configuration, your users will receive \
   their confirmation code in an email or SMS message.\n\n\
  \ Local users who signed up in your user pool are the only type of user who can confirm sign-up \
   with a code. Users who federate through an external identity provider (IdP) have already been \
   confirmed by their IdP.\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \    "]

module CreateGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `GroupExistsException of group_exists_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_group_request ->
    ( create_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `GroupExistsException of group_exists_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_group_request ->
    ( create_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `GroupExistsException of group_exists_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new group in the specified user pool. For more information about user pool groups, \
   see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-user-groups.html}Adding \
   groups to a user pool}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module CreateIdentityProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateProviderException of duplicate_provider_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_identity_provider_request ->
    ( create_identity_provider_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateProviderException of duplicate_provider_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_identity_provider_request ->
    ( create_identity_provider_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateProviderException of duplicate_provider_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds a configuration and trust relationship between a third-party identity provider (IdP) and a \
   user pool. Amazon Cognito accepts sign-in with third-party identity providers through managed \
   login and OIDC relying-party libraries. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-identity-federation.html}Third-party \
   IdP sign-in}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module CreateManagedLoginBranding : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ManagedLoginBrandingExistsException of managed_login_branding_exists_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_managed_login_branding_request ->
    ( create_managed_login_branding_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ManagedLoginBrandingExistsException of managed_login_branding_exists_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_managed_login_branding_request ->
    ( create_managed_login_branding_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ManagedLoginBrandingExistsException of managed_login_branding_exists_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new set of branding settings for a user pool style and associates it with an app \
   client. This operation is the programmatic option for the creation of a new style in the \
   branding editor.\n\n\
  \ Provides values for UI customization in a [Settings] JSON object and image files in an \
   [Assets] array. To send the JSON object [Document] type parameter in [Settings], you might need \
   to update to the most recent version of your Amazon Web Services SDK. To create a new style \
   with default settings, set [UseCognitoProvidedValues] to [true] and don't provide values for \
   any other options.\n\
  \ \n\
  \   This operation has a 2-megabyte request-size limit and include the CSS settings and image \
   assets for your app client. Your branding settings might exceed 2MB in size. Amazon Cognito \
   doesn't require that you pass all parameters in one request and preserves existing style \
   settings that you don't specify. If your request is larger than 2MB, separate it into multiple \
   requests, each with a size smaller than the limit. \n\
  \  \n\
  \    Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \      {ul\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   "]

module CreateResourceServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_resource_server_request ->
    ( create_resource_server_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_resource_server_request ->
    ( create_resource_server_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new OAuth2.0 resource server and defines custom scopes within it. Resource servers \
   are associated with custom scopes and machine-to-machine (M2M) authorization. For more \
   information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-define-resource-servers.html}Access \
   control with resource servers}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module CreateTerms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TermsExistsException of terms_exists_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_terms_request ->
    ( create_terms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TermsExistsException of terms_exists_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_terms_request ->
    ( create_terms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TermsExistsException of terms_exists_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates terms documents for the requested app client. When Terms and conditions and Privacy \
   policy documents are configured, the app client displays links to them in the sign-up page of \
   managed login for the app client.\n\n\
  \ You can provide URLs for terms documents in the languages that are supported by \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html#managed-login-localization}managed \
   login localization}. Amazon Cognito directs users to the terms documents for their current \
   language, with fallback to [default] if no document exists for the language.\n\
  \ \n\
  \  Each request accepts one type of terms document and a map of language-to-link for that \
   document type. You must provide both types of terms documents in at least one language before \
   Amazon Cognito displays your terms documents. Supply each type in separate requests.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html#managed-login-terms-documents}Terms \
   documents}.\n\
  \   \n\
  \     Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you must use IAM credentials to authorize requests, and \
   you must grant yourself the corresponding IAM permission in a policy.\n\
  \     \n\
  \       {b Learn more} \n\
  \      \n\
  \       {ul\n\
  \             {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                 \n\
  \                  }\n\
  \             {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \   "]

module CreateUserImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PreconditionNotMetException of precondition_not_met_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_import_job_request ->
    ( create_user_import_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PreconditionNotMetException of precondition_not_met_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_import_job_request ->
    ( create_user_import_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PreconditionNotMetException of precondition_not_met_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a user import job. You can import users into user pools from a comma-separated values \
   (CSV) file without adding Amazon Cognito MAU costs to your Amazon Web Services bill.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module CreateUserPool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
    | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `TierChangeNotAllowedException of tier_change_not_allowed_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserPoolTaggingException of user_pool_tagging_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_pool_request ->
    ( create_user_pool_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `TierChangeNotAllowedException of tier_change_not_allowed_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserPoolTaggingException of user_pool_tagging_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_pool_request ->
    ( create_user_pool_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `TierChangeNotAllowedException of tier_change_not_allowed_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserPoolTaggingException of user_pool_tagging_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Amazon Cognito user pool. This operation sets basic and advanced configuration \
   options.\n\n\
  \  If you don't provide a value for an attribute, Amazon Cognito sets it to its default value.\n\
  \  \n\
  \     This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers \
   require you to register an origination phone number before you can send SMS messages to US \
   phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number \
   with {{:https://console.aws.amazon.com/pinpoint/home/}Amazon Pinpoint}. Amazon Cognito uses the \
   registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages \
   might not be able to sign up, activate their accounts, or sign in.\n\
  \     \n\
  \      If you have never used SMS text messages with Amazon Cognito or any other Amazon Web \
   Services service, Amazon Simple Notification Service might place your account in the SMS \
   sandbox. In {i  {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}sandbox mode} \
   }, you can send messages only to verified phone numbers. After you test your app while in the \
   sandbox environment, you can move out of the sandbox and into production. For more information, \
   see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html} \
   SMS message settings for Amazon Cognito user pools} in the {i Amazon Cognito Developer Guide}.\n\
  \      \n\
  \         Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you must use IAM credentials to authorize requests, and \
   you must grant yourself the corresponding IAM permission in a policy.\n\
  \         \n\
  \           {b Learn more} \n\
  \          \n\
  \           {ul\n\
  \                 {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                     \n\
  \                      }\n\
  \                 {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                     \n\
  \                      }\n\
  \                 }\n\
  \   "]

module CreateUserPoolClient : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidOAuthFlowException of invalid_o_auth_flow_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ScopeDoesNotExistException of scope_does_not_exist_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_pool_client_request ->
    ( create_user_pool_client_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidOAuthFlowException of invalid_o_auth_flow_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ScopeDoesNotExistException of scope_does_not_exist_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_pool_client_request ->
    ( create_user_pool_client_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidOAuthFlowException of invalid_o_auth_flow_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ScopeDoesNotExistException of scope_does_not_exist_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an app client in a user pool. This operation sets basic and advanced configuration \
   options.\n\n\
  \ Unlike app clients created in the console, Amazon Cognito doesn't automatically assign a \
   branding style to app clients that you configure with this API operation. Managed login and \
   classic hosted UI pages aren't available for your client until after you apply a branding style.\n\
  \ \n\
  \   If you don't provide a value for an attribute, Amazon Cognito sets it to its default value.\n\
  \   \n\
  \      Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you must use IAM credentials to authorize requests, and \
   you must grant yourself the corresponding IAM permission in a policy.\n\
  \      \n\
  \        {b Learn more} \n\
  \       \n\
  \        {ul\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \   "]

module CreateUserPoolDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_pool_domain_request ->
    ( create_user_pool_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_pool_domain_request ->
    ( create_user_pool_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "A user pool domain hosts managed login, an authorization server and web server for \
   authentication in your application. This operation creates a new user pool prefix domain or \
   custom domain and sets the managed login branding version. Set the branding version to [1] for \
   hosted UI (classic) or [2] for managed login. When you choose a custom domain, you must provide \
   an SSL certificate in the US East (N. Virginia) Amazon Web Services Region in your request.\n\n\
  \ Your prefix domain might take up to one minute to take effect. Your custom domain is online \
   within five minutes, but it can take up to one hour to distribute your SSL certificate.\n\
  \ \n\
  \  For more information about adding a custom domain to your user pool, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html}Configuring \
   a user pool domain}.\n\
  \  \n\
  \    Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \      {ul\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   "]

module CreateUserPoolReplica : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserPoolTaggingException of user_pool_tagging_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_pool_replica_request ->
    ( create_user_pool_replica_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserPoolTaggingException of user_pool_tagging_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_pool_replica_request ->
    ( create_user_pool_replica_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserPoolTaggingException of user_pool_tagging_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a replica of an existing user pool in a specified Amazon Web Services Region. The \
   replica enables multi-region replication for high availability and disaster recovery. To create \
   a replica, you must have permissions to create user pools in the target Region.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module DeleteGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a group from the specified user pool. When you delete a group, that group no longer \
   contributes to users' [cognito:preferred_group] or [cognito:groups] claims, and no longer \
   influence access-control decision that are based on group membership. For more information \
   about user pool groups, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-user-groups.html}Adding \
   groups to a user pool}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module DeleteIdentityProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedIdentityProviderException of unsupported_identity_provider_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_identity_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedIdentityProviderException of unsupported_identity_provider_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_identity_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedIdentityProviderException of unsupported_identity_provider_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a user pool identity provider (IdP). After you delete an IdP, users can no longer sign \
   in to your user pool through that IdP. For more information about user pool IdPs, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-identity-federation.html}Third-party \
   IdP sign-in}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module DeleteManagedLoginBranding : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_managed_login_branding_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_managed_login_branding_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a managed login branding style. When you delete a style, you delete the branding \
   association for an app client. When an app client doesn't have a style assigned, your managed \
   login pages for that app client are nonfunctional until you create a new style or switch the \
   domain branding version.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module DeleteResourceServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_server_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_server_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a resource server. After you delete a resource server, users can no longer generate \
   access tokens with scopes that are associate with that resource server.\n\n\
  \ Resource servers are associated with custom scopes and machine-to-machine (M2M) authorization. \
   For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-define-resource-servers.html}Access \
   control with resource servers}.\n\
  \ \n\
  \   Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \   "]

module DeleteTerms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_terms_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_terms_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the terms documents with the requested ID from your app client.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module DeleteUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the profile of the currently signed-in user. A deleted user profile can no longer be \
   used to sign in and can't be restored.\n\n\
  \ Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \    "]

module DeleteUserAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_attributes_request ->
    ( delete_user_attributes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_attributes_request ->
    ( delete_user_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes attributes from the currently signed-in user. For example, your application can submit \
   a request to this operation when a user wants to remove their [birthdate] attribute value.\n\n\
  \ Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \    "]

module DeleteUserPool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserImportInProgressException of user_import_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_pool_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserImportInProgressException of user_import_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_pool_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserImportInProgressException of user_import_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a user pool. After you delete a user pool, users can no longer sign in to any \
   associated applications. \n\n\
  \ When you delete a user pool, it's no longer visible or operational in your Amazon Web Services \
   account. Amazon Cognito retains deleted user pools in an inactive state for 14 days, then \
   begins a cleanup process that fully removes them from Amazon Web Services systems. In case of \
   accidental deletion, contact Amazon Web Services Support within 14 days for restoration \
   assistance.\n\
  \ \n\
  \  Amazon Cognito begins full deletion of all resources from deleted user pools after 14 days. \
   In the case of large user pools, the cleanup process might take significant additional time \
   before all user data is permanently deleted.\n\
  \  "]

module DeleteUserPoolClient : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_pool_client_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_pool_client_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a user pool app client. After you delete an app client, users can no longer sign in to \
   the associated application.\n"]

module DeleteUserPoolClientSecret : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_pool_client_secret_request ->
    ( delete_user_pool_client_secret_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_pool_client_secret_request ->
    ( delete_user_pool_client_secret_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a specific client secret from a user pool app client. You cannot delete the last \
   remaining secret for an app client.\n"]

module DeleteUserPoolDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_pool_domain_request ->
    ( delete_user_pool_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_pool_domain_request ->
    ( delete_user_pool_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool ID and domain identifier, deletes a user pool domain. After you delete a user \
   pool domain, your managed login pages and authorization server are no longer available.\n"]

module DeleteUserPoolReplica : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_pool_replica_request ->
    ( delete_user_pool_replica_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_pool_replica_request ->
    ( delete_user_pool_replica_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a secondary replica user pool. You can only delete replicas that are in the INACTIVE \
   status. This operation must be called from the primary Region.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module DeleteWebAuthnCredential : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_web_authn_credential_request ->
    ( delete_web_authn_credential_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_web_authn_credential_request ->
    ( delete_web_authn_credential_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a registered passkey, or WebAuthn, authenticator for the currently signed-in user.\n\n\
  \ Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \    "]

module DescribeIdentityProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_identity_provider_request ->
    ( describe_identity_provider_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_identity_provider_request ->
    ( describe_identity_provider_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool ID and identity provider (IdP) name, returns details about the IdP.\n"]

module DescribeManagedLoginBranding : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_managed_login_branding_request ->
    ( describe_managed_login_branding_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_managed_login_branding_request ->
    ( describe_managed_login_branding_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given the ID of a managed login branding style, returns detailed information about the style.\n"]

module DescribeManagedLoginBrandingByClient : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_managed_login_branding_by_client_request ->
    ( describe_managed_login_branding_by_client_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_managed_login_branding_by_client_request ->
    ( describe_managed_login_branding_by_client_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given the ID of a user pool app client, returns detailed information about the style assigned \
   to the app client.\n"]

module DescribeResourceServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_server_request ->
    ( describe_resource_server_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_server_request ->
    ( describe_resource_server_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a resource server. For more information about resource servers, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-define-resource-servers.html}Access \
   control with resource servers}.\n"]

module DescribeRiskConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserPoolAddOnNotEnabledException of user_pool_add_on_not_enabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_risk_configuration_request ->
    ( describe_risk_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserPoolAddOnNotEnabledException of user_pool_add_on_not_enabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_risk_configuration_request ->
    ( describe_risk_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserPoolAddOnNotEnabledException of user_pool_add_on_not_enabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given an app client or user pool ID where threat protection is configured, describes the risk \
   configuration. This operation returns details about adaptive authentication, compromised \
   credentials, and IP-address allow- and denylists. For more information about threat protection, \
   see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-threat-protection.html}Threat \
   protection}.\n"]

module DescribeTerms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_terms_request ->
    ( describe_terms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_terms_request ->
    ( describe_terms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns details for the requested terms documents ID. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html#managed-login-terms-documents}Terms \
   documents}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module DescribeUserImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_user_import_job_request ->
    ( describe_user_import_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_user_import_job_request ->
    ( describe_user_import_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a user import job. For more information about user CSV import, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-using-import-tool.html}Importing \
   users from a CSV file}.\n"]

module DescribeUserPool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserPoolTaggingException of user_pool_tagging_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_user_pool_request ->
    ( describe_user_pool_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserPoolTaggingException of user_pool_tagging_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_user_pool_request ->
    ( describe_user_pool_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserPoolTaggingException of user_pool_tagging_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool ID, returns configuration information. This operation is useful when you want \
   to inspect an existing user pool and programmatically replicate the configuration to another \
   user pool.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module DescribeUserPoolClient : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_user_pool_client_request ->
    ( describe_user_pool_client_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_user_pool_client_request ->
    ( describe_user_pool_client_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given an app client ID, returns configuration information. This operation is useful when you \
   want to inspect an existing app client and programmatically replicate the configuration to \
   another app client. For more information about app clients, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-client-apps.html}App \
   clients}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module DescribeUserPoolDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_user_pool_domain_request ->
    ( describe_user_pool_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_user_pool_domain_request ->
    ( describe_user_pool_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool domain name, returns information about the domain configuration.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module ForgetDevice : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    forget_device_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    forget_device_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a device key, deletes a remembered device as the currently signed-in user. For more \
   information about device authentication, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
   with user devices in your user pool}.\n\n\
  \ Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \    "]

module ForgotPassword : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeDeliveryFailureException of code_delivery_failure_exception
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
    | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnexpectedLambdaException of unexpected_lambda_exception
    | `UserLambdaValidationException of user_lambda_validation_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    forgot_password_request ->
    ( forgot_password_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeDeliveryFailureException of code_delivery_failure_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    forgot_password_request ->
    ( forgot_password_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeDeliveryFailureException of code_delivery_failure_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sends a password-reset confirmation code to the email address or phone number of the requested \
   username. The message delivery method is determined by the user's available attributes and the \
   [AccountRecoverySetting] configuration of the user pool.\n\n\
  \ For the [Username] parameter, you can use the username or an email, phone, or preferred \
   username alias.\n\
  \ \n\
  \  If neither a verified phone number nor a verified email exists, Amazon Cognito responds with \
   an [InvalidParameterException] error . If your app client has a client secret and you don't \
   provide a [SECRET_HASH] parameter, this API returns [NotAuthorizedException].\n\
  \  \n\
  \    Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \    \n\
  \       This action might generate an SMS text message. Starting June 1, 2021, US telecom \
   carriers require you to register an origination phone number before you can send SMS messages \
   to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone \
   number with {{:https://console.aws.amazon.com/pinpoint/home/}Amazon Pinpoint}. Amazon Cognito \
   uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS \
   messages might not be able to sign up, activate their accounts, or sign in.\n\
  \       \n\
  \        If you have never used SMS text messages with Amazon Cognito or any other Amazon Web \
   Services service, Amazon Simple Notification Service might place your account in the SMS \
   sandbox. In {i  {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}sandbox mode} \
   }, you can send messages only to verified phone numbers. After you test your app while in the \
   sandbox environment, you can move out of the sandbox and into production. For more information, \
   see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html} \
   SMS message settings for Amazon Cognito user pools} in the {i Amazon Cognito Developer Guide}.\n\
  \        \n\
  \         "]

module GetCSVHeader : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_csv_header_request ->
    ( get_csv_header_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_csv_header_request ->
    ( get_csv_header_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool ID, generates a comma-separated value (CSV) list populated with available \
   user attributes in the user pool. This list is the header for the CSV file that determines the \
   users in a user import job. Save the content of [CSVHeader] in the response as a [.csv] file \
   and populate it with the usernames and attributes of users that you want to import. For more \
   information about CSV user import, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-using-import-tool.html}Importing \
   users from a CSV file}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module GetDevice : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_device_request ->
    ( get_device_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_device_request ->
    ( get_device_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a device key, returns information about a remembered device for the current user. For \
   more information about device authentication, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
   with user devices in your user pool}.\n\n\
  \ Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \    "]

module GetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_group_request ->
    ( get_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_group_request ->
    ( get_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool ID and a group name, returns information about the user group.\n\n\
  \  For more information about user pool groups, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-user-groups.html}Adding \
   groups to a user pool}.\n\
  \ \n\
  \   Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \   "]

module GetIdentityProviderByIdentifier : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_identity_provider_by_identifier_request ->
    ( get_identity_provider_by_identifier_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_identity_provider_by_identifier_request ->
    ( get_identity_provider_by_identifier_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given the identifier of an identity provider (IdP), for example [examplecorp], returns \
   information about the user pool configuration for that IdP. For more information about IdPs, \
   see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-identity-federation.html}Third-party \
   IdP sign-in}.\n"]

module GetLogDeliveryConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_log_delivery_configuration_request ->
    ( get_log_delivery_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_log_delivery_configuration_request ->
    ( get_log_delivery_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool ID, returns the logging configuration. User pools can export message-delivery \
   error and threat-protection activity logs to external Amazon Web Services services. For more \
   information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/exporting-quotas-and-usage.html}Exporting \
   user pool logs}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module GetProvisionedLimit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_provisioned_limit_request ->
    ( get_provisioned_limit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_provisioned_limit_request ->
    ( get_provisioned_limit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the current provisioned limit for a specific API category.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module GetSigningCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_signing_certificate_request ->
    ( get_signing_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_signing_certificate_request ->
    ( get_signing_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool ID, returns the signing certificate for SAML 2.0 federation.\n\n\
  \ Issued certificates are valid for 10 years from the date of issue. Amazon Cognito issues and \
   assigns a new signing certificate annually. This renewal process returns a new value in the \
   response to [GetSigningCertificate], but doesn't invalidate the original certificate.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-SAML-signing-encryption.html#cognito-user-pools-SAML-signing}Signing \
   SAML requests}.\n\
  \  \n\
  \    Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \      {ul\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   "]

module GetTokensFromRefreshToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `RefreshTokenReuseException of refresh_token_reuse_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnexpectedLambdaException of unexpected_lambda_exception
    | `UserLambdaValidationException of user_lambda_validation_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_tokens_from_refresh_token_request ->
    ( get_tokens_from_refresh_token_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `RefreshTokenReuseException of refresh_token_reuse_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_tokens_from_refresh_token_request ->
    ( get_tokens_from_refresh_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `RefreshTokenReuseException of refresh_token_reuse_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a refresh token, issues new ID, access, and optionally refresh tokens for the user who \
   owns the submitted token. This operation issues a new refresh token and invalidates the \
   original refresh token after an optional grace period when refresh token rotation is enabled. \
   If refresh token rotation is disabled, issues new ID and access tokens only.\n"]

module GetUICustomization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ui_customization_request ->
    ( get_ui_customization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ui_customization_request ->
    ( get_ui_customization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool ID or app client, returns information about classic hosted UI branding that \
   you applied, if any. Returns user-pool level branding information if no app client branding is \
   applied, or if you don't specify an app client ID. Returns an empty object if you haven't \
   applied hosted UI branding to either the client or the user pool. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/hosted-ui-classic-branding.html}Hosted \
   UI (classic) branding}.\n"]

module GetUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_user_request ->
    ( get_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_user_request ->
    ( get_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets user attributes and and MFA settings for the currently signed-in user.\n\n\
  \ Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \    "]

module GetUserAttributeVerificationCode : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeDeliveryFailureException of code_delivery_failure_exception
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
    | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnexpectedLambdaException of unexpected_lambda_exception
    | `UserLambdaValidationException of user_lambda_validation_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_user_attribute_verification_code_request ->
    ( get_user_attribute_verification_code_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeDeliveryFailureException of code_delivery_failure_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_user_attribute_verification_code_request ->
    ( get_user_attribute_verification_code_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeDeliveryFailureException of code_delivery_failure_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given an attribute name, sends a user attribute verification code for the specified attribute \
   name to the currently signed-in user.\n\n\
  \ Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \      This action might generate an SMS text message. Starting June 1, 2021, US telecom \
   carriers require you to register an origination phone number before you can send SMS messages \
   to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone \
   number with {{:https://console.aws.amazon.com/pinpoint/home/}Amazon Pinpoint}. Amazon Cognito \
   uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS \
   messages might not be able to sign up, activate their accounts, or sign in.\n\
  \      \n\
  \       If you have never used SMS text messages with Amazon Cognito or any other Amazon Web \
   Services service, Amazon Simple Notification Service might place your account in the SMS \
   sandbox. In {i  {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}sandbox mode} \
   }, you can send messages only to verified phone numbers. After you test your app while in the \
   sandbox environment, you can move out of the sandbox and into production. For more information, \
   see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html} \
   SMS message settings for Amazon Cognito user pools} in the {i Amazon Cognito Developer Guide}.\n\
  \       \n\
  \        "]

module GetUserAuthFactors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_user_auth_factors_request ->
    ( get_user_auth_factors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_user_auth_factors_request ->
    ( get_user_auth_factors_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the authentication options for the currently signed-in user. Returns the following:\n\n\
  \ {ol\n\
  \       {-  The user's multi-factor authentication (MFA) preferences.\n\
  \           \n\
  \            }\n\
  \       {-  The user's options for choice-based authentication with the [USER_AUTH] flow.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \   \n\
  \     Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \     \n\
  \      "]

module GetUserPoolMfaConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_user_pool_mfa_config_request ->
    ( get_user_pool_mfa_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_user_pool_mfa_config_request ->
    ( get_user_pool_mfa_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool ID, returns configuration for sign-in with WebAuthn authenticators and for \
   multi-factor authentication (MFA). This operation describes the following:\n\n\
  \ {ul\n\
  \       {-  The WebAuthn relying party (RP) ID and user-verification settings.\n\
  \           \n\
  \            }\n\
  \       {-  The required, optional, or disabled state of MFA for all user pool users.\n\
  \           \n\
  \            }\n\
  \       {-  The message templates for email and SMS MFA.\n\
  \           \n\
  \            }\n\
  \       {-  The enabled or disabled state of time-based one-time password (TOTP) MFA.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \      {ul\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   "]

module GlobalSignOut : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotConfirmedException of user_not_confirmed_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    global_sign_out_request ->
    ( global_sign_out_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    global_sign_out_request ->
    ( global_sign_out_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Invalidates the identity, access, and refresh tokens that Amazon Cognito issued to a user. Call \
   this operation when your user signs out of your app. This results in the following behavior. \n\n\
  \ {ul\n\
  \       {-  Amazon Cognito no longer accepts {i token-authorized} user operations that you \
   authorize with a signed-out user's access tokens. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \           \n\
  \            Amazon Cognito returns an [Access Token has been revoked] error when your app \
   attempts to authorize a user pools API request with a revoked access token that contains the \
   scope [aws.cognito.signin.user.admin].\n\
  \            \n\
  \             }\n\
  \       {-  Amazon Cognito no longer accepts a signed-out user's ID token in a \
   {{:https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetId.html}GetId } \
   request to an identity pool with [ServerSideTokenCheck] enabled for its user pool IdP \
   configuration in \
   {{:https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_CognitoIdentityProvider.html}CognitoIdentityProvider}.\n\
  \           \n\
  \            }\n\
  \       {-  Amazon Cognito no longer accepts a signed-out user's refresh tokens in refresh \
   requests.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   Other requests might be valid until your user's token expires. This operation doesn't clear \
   the \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html}managed \
   login} session cookie. To clear the session for a user who signed in with managed login or the \
   classic hosted UI, direct their browser session to the \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/logout-endpoint.html}logout \
   endpoint}.\n\
  \   \n\
  \    Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \    \n\
  \      Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \      \n\
  \       "]

module InitiateAuth : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
    | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
    | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnexpectedLambdaException of unexpected_lambda_exception
    | `UnsupportedOperationException of unsupported_operation_exception
    | `UserLambdaValidationException of user_lambda_validation_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    initiate_auth_request ->
    ( initiate_auth_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UnsupportedOperationException of unsupported_operation_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    initiate_auth_request ->
    ( initiate_auth_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UnsupportedOperationException of unsupported_operation_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Declares an authentication flow and initiates sign-in for a user in the Amazon Cognito user \
   directory. Amazon Cognito might respond with an additional challenge or an \
   [AuthenticationResult] that contains the outcome of a successful authentication. You can't sign \
   in a user with a federated IdP with [InitiateAuth]. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/authentication.html}Authentication}.\n\n\
  \  Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you can't use IAM credentials to authorize requests, \
   and you can't grant IAM permissions in policies. For more information about authorization \
   models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \  \n\
  \     This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers \
   require you to register an origination phone number before you can send SMS messages to US \
   phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number \
   with {{:https://console.aws.amazon.com/pinpoint/home/}Amazon Pinpoint}. Amazon Cognito uses the \
   registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages \
   might not be able to sign up, activate their accounts, or sign in.\n\
  \     \n\
  \      If you have never used SMS text messages with Amazon Cognito or any other Amazon Web \
   Services service, Amazon Simple Notification Service might place your account in the SMS \
   sandbox. In {i  {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}sandbox mode} \
   }, you can send messages only to verified phone numbers. After you test your app while in the \
   sandbox environment, you can move out of the sandbox and into production. For more information, \
   see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html} \
   SMS message settings for Amazon Cognito user pools} in the {i Amazon Cognito Developer Guide}.\n\
  \      \n\
  \       "]

module ListDevices : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_devices_request ->
    ( list_devices_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_devices_request ->
    ( list_devices_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the devices that Amazon Cognito has registered to the currently signed-in user. For more \
   information about device authentication, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
   with user devices in your user pool}.\n\n\
  \ Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \    "]

module ListGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_groups_request ->
    ( list_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_groups_request ->
    ( list_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool ID, returns user pool groups and their details.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module ListIdentityProviders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_identity_providers_request ->
    ( list_identity_providers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_identity_providers_request ->
    ( list_identity_providers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool ID, returns information about configured identity providers (IdPs). For more \
   information about IdPs, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-identity-federation.html}Third-party \
   IdP sign-in}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module ListResourceServers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resource_servers_request ->
    ( list_resource_servers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resource_servers_request ->
    ( list_resource_servers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool ID, returns all resource servers and their details. For more information \
   about resource servers, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-define-resource-servers.html}Access \
   control with resource servers}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags that are assigned to an Amazon Cognito user pool. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/tagging.html}Tagging resources}.\n"]

module ListTerms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_terms_request ->
    ( list_terms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_terms_request ->
    ( list_terms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns details about all terms documents for the requested user pool.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module ListUserImportJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_user_import_jobs_request ->
    ( list_user_import_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_user_import_jobs_request ->
    ( list_user_import_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool ID, returns user import jobs and their details. Import jobs are retained in \
   user pool configuration so that you can stage, stop, start, review, and delete them. For more \
   information about user import, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-using-import-tool.html}Importing \
   users from a CSV file}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module ListUserPoolClientSecrets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_user_pool_client_secrets_request ->
    ( list_user_pool_client_secrets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_user_pool_client_secrets_request ->
    ( list_user_pool_client_secrets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all client secrets associated with a user pool app client. Returns metadata about the \
   secrets. The response does not include pagination tokens as there are only 2 secrets at any \
   given time and we return both with every ListUserPoolClientSecrets call. For security reasons, \
   the response never reveals the actual secret value in ClientSecretValue.\n"]

module ListUserPoolClients : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_user_pool_clients_request ->
    ( list_user_pool_clients_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_user_pool_clients_request ->
    ( list_user_pool_clients_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool ID, lists app clients. App clients are sets of rules for the access that you \
   want a user pool to grant to one application. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-client-apps.html}App \
   clients}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module ListUserPoolReplicas : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_user_pool_replicas_request ->
    ( list_user_pool_replicas_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_user_pool_replicas_request ->
    ( list_user_pool_replicas_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all replicas for a user pool, including both primary and secondary replicas. We recommend \
   using pagination to ensure that the operation returns quickly and successfully.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module ListUserPools : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_user_pools_request ->
    ( list_user_pools_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_user_pools_request ->
    ( list_user_pools_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists user pools and their details in the current Amazon Web Services account.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module ListUsers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_users_request ->
    ( list_users_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_users_request ->
    ( list_users_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool ID, returns a list of users and their basic details in a user pool.\n\n\
  \ This operation is eventually consistent. You might experience a delay before results are \
   up-to-date. To validate the existence or configuration of an individual user, use \
   [AdminGetUser].\n\
  \ \n\
  \   Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \   "]

module ListUsersInGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_users_in_group_request ->
    ( list_users_in_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_users_in_group_request ->
    ( list_users_in_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool ID and a group name, returns a list of users in the group. For more \
   information about user pool groups, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-user-groups.html}Adding \
   groups to a user pool}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module ListWebAuthnCredentials : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_web_authn_credentials_request ->
    ( list_web_authn_credentials_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_web_authn_credentials_request ->
    ( list_web_authn_credentials_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates a list of the currently signed-in user's registered passkey, or WebAuthn, \
   credentials.\n\n\
  \ Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \    "]

module ResendConfirmationCode : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeDeliveryFailureException of code_delivery_failure_exception
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
    | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnexpectedLambdaException of unexpected_lambda_exception
    | `UserLambdaValidationException of user_lambda_validation_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resend_confirmation_code_request ->
    ( resend_confirmation_code_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeDeliveryFailureException of code_delivery_failure_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    resend_confirmation_code_request ->
    ( resend_confirmation_code_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeDeliveryFailureException of code_delivery_failure_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Resends the code that confirms a new account for a user who has signed up in your user pool. \
   Amazon Cognito sends confirmation codes to the user attribute in the [AutoVerifiedAttributes] \
   property of your user pool. When you prompt new users for the confirmation code, include a \
   \"Resend code\" option that generates a call to this API operation.\n\n\
  \  Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you can't use IAM credentials to authorize requests, \
   and you can't grant IAM permissions in policies. For more information about authorization \
   models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \  \n\
  \     This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers \
   require you to register an origination phone number before you can send SMS messages to US \
   phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number \
   with {{:https://console.aws.amazon.com/pinpoint/home/}Amazon Pinpoint}. Amazon Cognito uses the \
   registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages \
   might not be able to sign up, activate their accounts, or sign in.\n\
  \     \n\
  \      If you have never used SMS text messages with Amazon Cognito or any other Amazon Web \
   Services service, Amazon Simple Notification Service might place your account in the SMS \
   sandbox. In {i  {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}sandbox mode} \
   }, you can send messages only to verified phone numbers. After you test your app while in the \
   sandbox environment, you can move out of the sandbox and into production. For more information, \
   see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html} \
   SMS message settings for Amazon Cognito user pools} in the {i Amazon Cognito Developer Guide}.\n\
  \      \n\
  \       "]

module RespondToAuthChallenge : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AliasExistsException of alias_exists_exception
    | `CodeMismatchException of code_mismatch_exception
    | `ExpiredCodeException of expired_code_exception
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidPasswordException of invalid_password_exception
    | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
    | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
    | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
    | `MFAMethodNotFoundException of mfa_method_not_found_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordHistoryPolicyViolationException of password_history_policy_violation_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `SoftwareTokenMFANotFoundException of software_token_mfa_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnexpectedLambdaException of unexpected_lambda_exception
    | `UserLambdaValidationException of user_lambda_validation_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    respond_to_auth_challenge_request ->
    ( respond_to_auth_challenge_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AliasExistsException of alias_exists_exception
      | `CodeMismatchException of code_mismatch_exception
      | `ExpiredCodeException of expired_code_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPasswordException of invalid_password_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `MFAMethodNotFoundException of mfa_method_not_found_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordHistoryPolicyViolationException of password_history_policy_violation_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `SoftwareTokenMFANotFoundException of software_token_mfa_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    respond_to_auth_challenge_request ->
    ( respond_to_auth_challenge_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AliasExistsException of alias_exists_exception
      | `CodeMismatchException of code_mismatch_exception
      | `ExpiredCodeException of expired_code_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPasswordException of invalid_password_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `MFAMethodNotFoundException of mfa_method_not_found_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordHistoryPolicyViolationException of password_history_policy_violation_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `SoftwareTokenMFANotFoundException of software_token_mfa_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Some API operations in a user pool generate a challenge, like a prompt for an MFA code, for \
   device authentication that bypasses MFA, or for a custom authentication challenge. A \
   [RespondToAuthChallenge] API request provides the answer to that challenge, like a code or a \
   secure remote password (SRP). The parameters of a response to an authentication challenge vary \
   with the type of challenge.\n\n\
  \ For more information about custom authentication challenges, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-challenge.html}Custom \
   authentication challenge Lambda triggers}.\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \      This action might generate an SMS text message. Starting June 1, 2021, US telecom \
   carriers require you to register an origination phone number before you can send SMS messages \
   to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone \
   number with {{:https://console.aws.amazon.com/pinpoint/home/}Amazon Pinpoint}. Amazon Cognito \
   uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS \
   messages might not be able to sign up, activate their accounts, or sign in.\n\
  \      \n\
  \       If you have never used SMS text messages with Amazon Cognito or any other Amazon Web \
   Services service, Amazon Simple Notification Service might place your account in the SMS \
   sandbox. In {i  {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}sandbox mode} \
   }, you can send messages only to verified phone numbers. After you test your app while in the \
   sandbox environment, you can move out of the sandbox and into production. For more information, \
   see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html} \
   SMS message settings for Amazon Cognito user pools} in the {i Amazon Cognito Developer Guide}.\n\
  \       \n\
  \        "]

module RevokeToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnauthorizedException of unauthorized_exception
    | `UnsupportedOperationException of unsupported_operation_exception
    | `UnsupportedTokenTypeException of unsupported_token_type_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    revoke_token_request ->
    ( revoke_token_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedOperationException of unsupported_operation_exception
      | `UnsupportedTokenTypeException of unsupported_token_type_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    revoke_token_request ->
    ( revoke_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnauthorizedException of unauthorized_exception
      | `UnsupportedOperationException of unsupported_operation_exception
      | `UnsupportedTokenTypeException of unsupported_token_type_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Revokes all of the access tokens generated by, and at the same time as, the specified refresh \
   token. After a token is revoked, you can't use the revoked token to access Amazon Cognito user \
   APIs, or to authorize access to your resource server.\n\n\
  \  Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you can't use IAM credentials to authorize requests, \
   and you can't grant IAM permissions in policies. For more information about authorization \
   models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \  \n\
  \   "]

module SetLogDeliveryConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_log_delivery_configuration_request ->
    ( set_log_delivery_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_log_delivery_configuration_request ->
    ( set_log_delivery_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets up or modifies the logging configuration of a user pool. User pools can export user \
   notification logs and, when threat protection is active, user-activity logs. For more \
   information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/exporting-quotas-and-usage.html}Exporting \
   user pool logs}.\n"]

module SetRiskConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeDeliveryFailureException of code_delivery_failure_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserPoolAddOnNotEnabledException of user_pool_add_on_not_enabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_risk_configuration_request ->
    ( set_risk_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeDeliveryFailureException of code_delivery_failure_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserPoolAddOnNotEnabledException of user_pool_add_on_not_enabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_risk_configuration_request ->
    ( set_risk_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeDeliveryFailureException of code_delivery_failure_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserPoolAddOnNotEnabledException of user_pool_add_on_not_enabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures threat protection for a user pool or app client. Sets configuration for the \
   following.\n\n\
  \ {ul\n\
  \       {-  Responses to risks with adaptive authentication\n\
  \           \n\
  \            }\n\
  \       {-  Responses to vulnerable passwords with compromised-credentials detection\n\
  \           \n\
  \            }\n\
  \       {-  Notifications to users who have had risky activity detected\n\
  \           \n\
  \            }\n\
  \       {-  IP-address denylist and allowlist\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   To set the risk configuration for the user pool to defaults, send this request with only the \
   [UserPoolId] parameter. To reset the threat protection settings of an app client to be \
   inherited from the user pool, send [UserPoolId] and [ClientId] parameters only. To change \
   threat protection to audit-only or off, update the value of [UserPoolAddOns] in an \
   [UpdateUserPool] request. To activate this setting, your user pool must be on the \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-plus.html} \
   Plus tier}.\n\
  \   \n\
  \    In secondary regions for user pools with multi-region replication, only the [SourceARN] and \
   [From] attributes of [NotifyConfiguration] can be modified to configure region-specific SES \
   integration. All other risk configuration settings must match the existing values to maintain \
   consistency across replicas.\n\
  \    "]

module SetUICustomization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_ui_customization_request ->
    ( set_ui_customization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_ui_customization_request ->
    ( set_ui_customization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures UI branding settings for domains with the hosted UI (classic) branding version. Your \
   user pool must have a domain. Configure a domain with .\n\n\
  \ Set the default configuration for all clients with a [ClientId] of [ALL]. When the [ClientId] \
   value is an app client ID, the settings you pass in this request apply to that app client and \
   override the default [ALL] configuration.\n\
  \ \n\
  \   Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \   "]

module SetUserMFAPreference : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_user_mfa_preference_request ->
    ( set_user_mfa_preference_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_user_mfa_preference_request ->
    ( set_user_mfa_preference_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Set the user's multi-factor authentication (MFA) method preference, including which MFA factors \
   are activated and if any are preferred. Only one factor can be set as preferred. The preferred \
   MFA factor will be used to authenticate a user if multiple factors are activated. If multiple \
   options are activated and no preference is set, a challenge to choose an MFA option will be \
   returned during sign-in. If an MFA type is activated for a user, the user will be prompted for \
   MFA during all sign-in attempts unless device tracking is turned on and the device has been \
   trusted. If you want MFA to be applied selectively based on the assessed risk level of sign-in \
   attempts, deactivate MFA for users and turn on Adaptive Authentication for the user pool.\n\n\
  \ Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \    "]

module SetUserPoolMfaConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
    | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_user_pool_mfa_config_request ->
    ( set_user_pool_mfa_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_user_pool_mfa_config_request ->
    ( set_user_pool_mfa_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets user pool multi-factor authentication (MFA) and passkey configuration. For more \
   information about user pool MFA, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-mfa.html}Adding \
   MFA}. For more information about WebAuthn passkeys see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-authentication-flow-methods.html#amazon-cognito-user-pools-authentication-flow-methods-passkey}Authentication \
   flows}.\n\n\
  \  This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers \
   require you to register an origination phone number before you can send SMS messages to US \
   phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number \
   with {{:https://console.aws.amazon.com/pinpoint/home/}Amazon Pinpoint}. Amazon Cognito uses the \
   registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages \
   might not be able to sign up, activate their accounts, or sign in.\n\
  \  \n\
  \   If you have never used SMS text messages with Amazon Cognito or any other Amazon Web \
   Services service, Amazon Simple Notification Service might place your account in the SMS \
   sandbox. In {i  {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}sandbox mode} \
   }, you can send messages only to verified phone numbers. After you test your app while in the \
   sandbox environment, you can move out of the sandbox and into production. For more information, \
   see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html} \
   SMS message settings for Amazon Cognito user pools} in the {i Amazon Cognito Developer Guide}.\n\
  \   \n\
  \    "]

module SetUserSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_user_settings_request ->
    ( set_user_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_user_settings_request ->
    ( set_user_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {i This action is no longer supported.} You can use it to configure only SMS MFA. You can't \
   use it to configure time-based one-time password (TOTP) software token or email MFA.\n\n\
  \ Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \    "]

module SignUp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeDeliveryFailureException of code_delivery_failure_exception
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidPasswordException of invalid_password_exception
    | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
    | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnexpectedLambdaException of unexpected_lambda_exception
    | `UserLambdaValidationException of user_lambda_validation_exception
    | `UsernameExistsException of username_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    sign_up_request ->
    ( sign_up_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeDeliveryFailureException of code_delivery_failure_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPasswordException of invalid_password_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UsernameExistsException of username_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    sign_up_request ->
    ( sign_up_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeDeliveryFailureException of code_delivery_failure_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPasswordException of invalid_password_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UsernameExistsException of username_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers a user with an app client and requests a user name, password, and user attributes in \
   the user pool.\n\n\
  \  Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you can't use IAM credentials to authorize requests, \
   and you can't grant IAM permissions in policies. For more information about authorization \
   models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \  \n\
  \     This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers \
   require you to register an origination phone number before you can send SMS messages to US \
   phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number \
   with {{:https://console.aws.amazon.com/pinpoint/home/}Amazon Pinpoint}. Amazon Cognito uses the \
   registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages \
   might not be able to sign up, activate their accounts, or sign in.\n\
  \     \n\
  \      If you have never used SMS text messages with Amazon Cognito or any other Amazon Web \
   Services service, Amazon Simple Notification Service might place your account in the SMS \
   sandbox. In {i  {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}sandbox mode} \
   }, you can send messages only to verified phone numbers. After you test your app while in the \
   sandbox environment, you can move out of the sandbox and into production. For more information, \
   see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html} \
   SMS message settings for Amazon Cognito user pools} in the {i Amazon Cognito Developer Guide}.\n\
  \      \n\
  \        You might receive a [LimitExceeded] exception in response to this request if you have \
   exceeded a rate quota for email or SMS messages, and if your user pool automatically verifies \
   email addresses or phone numbers. When you get this exception in the response, the user is \
   successfully created and is in an [UNCONFIRMED] state.\n\
  \        "]

module StartUserImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PreconditionNotMetException of precondition_not_met_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_user_import_job_request ->
    ( start_user_import_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PreconditionNotMetException of precondition_not_met_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_user_import_job_request ->
    ( start_user_import_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PreconditionNotMetException of precondition_not_met_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Instructs your user pool to start importing users from a CSV file that contains their usernames \
   and attributes. For more information about importing users from a CSV file, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-using-import-tool.html}Importing \
   users from a CSV file}.\n"]

module StartWebAuthnRegistration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `WebAuthnConfigurationMissingException of web_authn_configuration_missing_exception
    | `WebAuthnNotEnabledException of web_authn_not_enabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_web_authn_registration_request ->
    ( start_web_authn_registration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `WebAuthnConfigurationMissingException of web_authn_configuration_missing_exception
      | `WebAuthnNotEnabledException of web_authn_not_enabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_web_authn_registration_request ->
    ( start_web_authn_registration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `WebAuthnConfigurationMissingException of web_authn_configuration_missing_exception
      | `WebAuthnNotEnabledException of web_authn_not_enabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Requests credential creation options from your user pool for the currently signed-in user. \
   Returns information about the user pool, the user profile, and authentication requirements. \
   Users must provide this information in their request to enroll your application with their \
   passkey provider.\n\n\
  \ Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \ "]

module StopUserImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PreconditionNotMetException of precondition_not_met_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_user_import_job_request ->
    ( stop_user_import_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PreconditionNotMetException of precondition_not_met_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_user_import_job_request ->
    ( stop_user_import_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PreconditionNotMetException of precondition_not_met_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Instructs your user pool to stop a running job that's importing users from a CSV file that \
   contains their usernames and attributes. For more information about importing users from a CSV \
   file, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-using-import-tool.html}Importing \
   users from a CSV file}.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Assigns a set of tags to an Amazon Cognito user pool. A tag is a label that you can use to \
   categorize and manage user pools in different ways, such as by purpose, owner, environment, or \
   other criteria.\n\n\
  \ Each tag consists of a key and value, both of which you define. A key is a general category \
   for more specific values. For example, if you have two versions of a user pool, one for testing \
   and another for production, you might assign an [Environment] tag key to both user pools. The \
   value of this key might be [Test] for one user pool, and [Production] for the other.\n\
  \ \n\
  \  Tags are useful for cost tracking and access control. You can activate your tags so that they \
   appear on the Billing and Cost Management console, where you can track the costs associated \
   with your user pools. In an Identity and Access Management policy, you can constrain \
   permissions for user pools based on specific tags or tag values.\n\
  \  \n\
  \   You can use this action up to 5 times per second, per account. A user pool can have as many \
   as 50 tags.\n\
  \   "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Given tag IDs that you previously assigned to a user pool, removes them.\n"]

module UpdateAuthEventFeedback : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotFoundException of user_not_found_exception
    | `UserPoolAddOnNotEnabledException of user_pool_add_on_not_enabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_auth_event_feedback_request ->
    ( update_auth_event_feedback_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception
      | `UserPoolAddOnNotEnabledException of user_pool_add_on_not_enabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_auth_event_feedback_request ->
    ( update_auth_event_feedback_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotFoundException of user_not_found_exception
      | `UserPoolAddOnNotEnabledException of user_pool_add_on_not_enabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides the feedback for an authentication event generated by threat protection features. The \
   user's response indicates that you think that the event either was from a valid user or was an \
   unwanted authentication attempt. This feedback improves the risk evaluation decision for the \
   user pool as part of Amazon Cognito threat protection. To activate this setting, your user pool \
   must be on the \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-plus.html} \
   Plus tier}.\n\n\
  \ This operation requires a [FeedbackToken] that Amazon Cognito generates and adds to \
   notification emails when users have potentially suspicious authentication events. Users invoke \
   this operation when they select the link that corresponds to [{one-click-link-valid}] or \
   [{one-click-link-invalid}] in your notification template. Because [FeedbackToken] is a required \
   parameter, you can't make requests to [UpdateAuthEventFeedback] without the contents of the \
   notification email message.\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \    "]

module UpdateDeviceStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_device_status_request ->
    ( update_device_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_device_status_request ->
    ( update_device_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the status of a the currently signed-in user's device so that it is marked as \
   remembered or not remembered for the purpose of device authentication. Device authentication is \
   a \"remember me\" mechanism that silently completes sign-in from trusted devices with a device \
   key instead of a user-provided MFA code. This operation changes the status of a device without \
   deleting it, so you can enable it again later. For more information about device \
   authentication, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
   with devices}.\n\n\
  \ Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \ \n\
  \   Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \   \n\
  \    "]

module UpdateGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_group_request ->
    ( update_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_group_request ->
    ( update_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given the name of a user pool group, updates any of the properties for precedence, IAM role, or \
   description. For more information about user pool groups, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-user-groups.html}Adding \
   groups to a user pool}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module UpdateIdentityProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedIdentityProviderException of unsupported_identity_provider_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_identity_provider_request ->
    ( update_identity_provider_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedIdentityProviderException of unsupported_identity_provider_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_identity_provider_request ->
    ( update_identity_provider_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedIdentityProviderException of unsupported_identity_provider_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the configuration and trust relationship between a third-party identity provider (IdP) \
   and a user pool. Amazon Cognito accepts sign-in with third-party identity providers through \
   managed login and OIDC relying-party libraries. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-identity-federation.html}Third-party \
   IdP sign-in}.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module UpdateManagedLoginBranding : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_managed_login_branding_request ->
    ( update_managed_login_branding_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_managed_login_branding_request ->
    ( update_managed_login_branding_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures the branding settings for a user pool style. This operation is the programmatic \
   option for the configuration of a style in the branding editor.\n\n\
  \ Provides values for UI customization in a [Settings] JSON object and image files in an \
   [Assets] array.\n\
  \ \n\
  \   This operation has a 2-megabyte request-size limit and include the CSS settings and image \
   assets for your app client. Your branding settings might exceed 2MB in size. Amazon Cognito \
   doesn't require that you pass all parameters in one request and preserves existing style \
   settings that you don't specify. If your request is larger than 2MB, separate it into multiple \
   requests, each with a size smaller than the limit.\n\
  \  \n\
  \    Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \    \n\
  \      {b Learn more} \n\
  \     \n\
  \      {ul\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   "]

module UpdateProvisionedLimit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_provisioned_limit_request ->
    ( update_provisioned_limit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_provisioned_limit_request ->
    ( update_provisioned_limit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the provisioned limit for a specific API category. The value must be between the default \
   limit and your account-level maximum limit in Service Quotas.\n\n\
  \ Managed login user pools don't support adjustments to the [UserAuthentication] or \
   [UserFederation] categories. To increase these limits, submit a Service Quotas increase request.\n\
  \ \n\
  \   Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \   \n\
  \     {b Learn more} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \   "]

module UpdateResourceServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_resource_server_request ->
    ( update_resource_server_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_resource_server_request ->
    ( update_resource_server_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the name and scopes of a resource server. All other fields are read-only. For more \
   information about resource servers, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-define-resource-servers.html}Access \
   control with resource servers}.\n\n\
  \  If you don't provide a value for an attribute, it is set to the default value.\n\
  \  \n\
  \     Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you must use IAM credentials to authorize requests, and \
   you must grant yourself the corresponding IAM permission in a policy.\n\
  \     \n\
  \       {b Learn more} \n\
  \      \n\
  \       {ul\n\
  \             {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                 \n\
  \                  }\n\
  \             {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \   "]

module UpdateTerms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TermsExistsException of terms_exists_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_terms_request ->
    ( update_terms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TermsExistsException of terms_exists_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_terms_request ->
    ( update_terms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TermsExistsException of terms_exists_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies existing terms documents for the requested app client. When Terms and conditions and \
   Privacy policy documents are configured, the app client displays links to them in the sign-up \
   page of managed login for the app client.\n\n\
  \ You can provide URLs for terms documents in the languages that are supported by \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html#managed-login-localization}managed \
   login localization}. Amazon Cognito directs users to the terms documents for their current \
   language, with fallback to [default] if no document exists for the language.\n\
  \ \n\
  \  Each request accepts one type of terms document and a map of language-to-link for that \
   document type. You must provide both types of terms documents in at least one language before \
   Amazon Cognito displays your terms documents. Supply each type in separate requests.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html#managed-login-terms-documents}Terms \
   documents}.\n\
  \   \n\
  \     Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you must use IAM credentials to authorize requests, and \
   you must grant yourself the corresponding IAM permission in a policy.\n\
  \     \n\
  \       {b Learn more} \n\
  \      \n\
  \       {ul\n\
  \             {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                 \n\
  \                  }\n\
  \             {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \   "]

module UpdateUserAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AliasExistsException of alias_exists_exception
    | `CodeDeliveryFailureException of code_delivery_failure_exception
    | `CodeMismatchException of code_mismatch_exception
    | `ExpiredCodeException of expired_code_exception
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
    | `InvalidLambdaResponseException of invalid_lambda_response_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
    | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnexpectedLambdaException of unexpected_lambda_exception
    | `UserLambdaValidationException of user_lambda_validation_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_user_attributes_request ->
    ( update_user_attributes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AliasExistsException of alias_exists_exception
      | `CodeDeliveryFailureException of code_delivery_failure_exception
      | `CodeMismatchException of code_mismatch_exception
      | `ExpiredCodeException of expired_code_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_user_attributes_request ->
    ( update_user_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AliasExistsException of alias_exists_exception
      | `CodeDeliveryFailureException of code_delivery_failure_exception
      | `CodeMismatchException of code_mismatch_exception
      | `ExpiredCodeException of expired_code_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidLambdaResponseException of invalid_lambda_response_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnexpectedLambdaException of unexpected_lambda_exception
      | `UserLambdaValidationException of user_lambda_validation_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the currently signed-in user's attributes. To delete an attribute from the user, submit \
   the attribute in your API request with a blank value.\n\n\
  \ For custom attributes, you must add a [custom:] prefix to the attribute name, for example \
   [custom:department].\n\
  \ \n\
  \  Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \  \n\
  \    Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \    \n\
  \       This action might generate an SMS text message. Starting June 1, 2021, US telecom \
   carriers require you to register an origination phone number before you can send SMS messages \
   to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone \
   number with {{:https://console.aws.amazon.com/pinpoint/home/}Amazon Pinpoint}. Amazon Cognito \
   uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS \
   messages might not be able to sign up, activate their accounts, or sign in.\n\
  \       \n\
  \        If you have never used SMS text messages with Amazon Cognito or any other Amazon Web \
   Services service, Amazon Simple Notification Service might place your account in the SMS \
   sandbox. In {i  {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}sandbox mode} \
   }, you can send messages only to verified phone numbers. After you test your app while in the \
   sandbox environment, you can move out of the sandbox and into production. For more information, \
   see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html} \
   SMS message settings for Amazon Cognito user pools} in the {i Amazon Cognito Developer Guide}.\n\
  \        \n\
  \         "]

module UpdateUserPool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
    | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TierChangeNotAllowedException of tier_change_not_allowed_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserImportInProgressException of user_import_in_progress_exception
    | `UserPoolTaggingException of user_pool_tagging_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_user_pool_request ->
    ( update_user_pool_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TierChangeNotAllowedException of tier_change_not_allowed_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserImportInProgressException of user_import_in_progress_exception
      | `UserPoolTaggingException of user_pool_tagging_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_user_pool_request ->
    ( update_user_pool_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidEmailRoleAccessPolicyException of invalid_email_role_access_policy_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSmsRoleAccessPolicyException of invalid_sms_role_access_policy_exception
      | `InvalidSmsRoleTrustRelationshipException of invalid_sms_role_trust_relationship_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TierChangeNotAllowedException of tier_change_not_allowed_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserImportInProgressException of user_import_in_progress_exception
      | `UserPoolTaggingException of user_pool_tagging_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of a user pool. To avoid setting parameters to Amazon Cognito \
   defaults, construct this API request to pass the existing configuration of your user pool, \
   modified to include the changes that you want to make.\n\n\
  \  If you don't provide a value for an attribute, Amazon Cognito sets it to its default value.\n\
  \  \n\
  \    In secondary regions for user pools with multi-region replication, regional configurations \
   for email, SMS, Lambda functions, and tags can be updated. Both global and regional settings \
   must be provided as inputs, with global settings required to match existing values to maintain \
   consistency across replicas.\n\
  \    \n\
  \      This action might generate an SMS text message. Starting June 1, 2021, US telecom \
   carriers require you to register an origination phone number before you can send SMS messages \
   to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone \
   number with {{:https://console.aws.amazon.com/pinpoint/home/}Amazon Pinpoint}. Amazon Cognito \
   uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS \
   messages might not be able to sign up, activate their accounts, or sign in.\n\
  \      \n\
  \       If you have never used SMS text messages with Amazon Cognito or any other Amazon Web \
   Services service, Amazon Simple Notification Service might place your account in the SMS \
   sandbox. In {i  {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}sandbox mode} \
   }, you can send messages only to verified phone numbers. After you test your app while in the \
   sandbox environment, you can move out of the sandbox and into production. For more information, \
   see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html} \
   SMS message settings for Amazon Cognito user pools} in the {i Amazon Cognito Developer Guide}.\n\
  \       \n\
  \          Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you must use IAM credentials to authorize requests, \
   and you must grant yourself the corresponding IAM permission in a policy.\n\
  \          \n\
  \            {b Learn more} \n\
  \           \n\
  \            {ul\n\
  \                  {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                      \n\
  \                       }\n\
  \                  {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                      \n\
  \                       }\n\
  \                  }\n\
  \   "]

module UpdateUserPoolClient : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidOAuthFlowException of invalid_o_auth_flow_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ScopeDoesNotExistException of scope_does_not_exist_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_user_pool_client_request ->
    ( update_user_pool_client_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidOAuthFlowException of invalid_o_auth_flow_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ScopeDoesNotExistException of scope_does_not_exist_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_user_pool_client_request ->
    ( update_user_pool_client_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidOAuthFlowException of invalid_o_auth_flow_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ScopeDoesNotExistException of scope_does_not_exist_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a user pool app client ID, updates the configuration. To avoid setting parameters to \
   Amazon Cognito defaults, construct this API request to pass the existing configuration of your \
   app client, modified to include the changes that you want to make.\n\n\
  \  If you don't provide a value for an attribute, Amazon Cognito sets it to its default value.\n\
  \  \n\
  \    Unlike app clients created in the console, Amazon Cognito doesn't automatically assign a \
   branding style to app clients that you configure with this API operation. Managed login and \
   classic hosted UI pages aren't available for your client until after you apply a branding style.\n\
  \    \n\
  \      Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you must use IAM credentials to authorize requests, and \
   you must grant yourself the corresponding IAM permission in a policy.\n\
  \      \n\
  \        {b Learn more} \n\
  \       \n\
  \        {ul\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \   "]

module UpdateUserPoolDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_user_pool_domain_request ->
    ( update_user_pool_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_user_pool_domain_request ->
    ( update_user_pool_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `FeatureUnavailableInTierException of feature_unavailable_in_tier_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "A user pool domain hosts managed login, an authorization server and web server for \
   authentication in your application. This operation updates the branding version for user pool \
   domains between [1] for hosted UI (classic) and [2] for managed login. It also updates the SSL \
   certificate for user pool custom domains.\n\n\
  \ Changes to the domain branding version take up to one minute to take effect for a prefix \
   domain and up to five minutes for a custom domain.\n\
  \ \n\
  \  This operation doesn't change the name of your user pool domain. To change your domain, \
   delete it with [DeleteUserPoolDomain] and create a new domain with [CreateUserPoolDomain].\n\
  \  \n\
  \   You can pass the ARN of a new Certificate Manager certificate in this request. Typically, \
   ACM certificates automatically renew and you user pool can continue to use the same ARN. But if \
   you generate a new certificate for your custom domain name, replace the original configuration \
   with the new ARN in this request.\n\
  \   \n\
  \    ACM certificates for custom domains must be in the US East (N. Virginia) Amazon Web \
   Services Region. After you submit your request, Amazon Cognito requires up to 1 hour to \
   distribute your new certificate to your custom domain.\n\
  \    \n\
  \     For more information about adding a custom domain to your user pool, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html}Configuring \
   a user pool domain}.\n\
  \     \n\
  \       Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you must use IAM credentials to authorize requests, and \
   you must grant yourself the corresponding IAM permission in a policy.\n\
  \       \n\
  \         {b Learn more} \n\
  \        \n\
  \         {ul\n\
  \               {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \                   \n\
  \                    }\n\
  \               {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \                   \n\
  \                    }\n\
  \               }\n\
  \   "]

module UpdateUserPoolReplica : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_user_pool_replica_request ->
    ( update_user_pool_replica_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_user_pool_replica_request ->
    ( update_user_pool_replica_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates replica-specific settings for a user pool replica. You can modify the status to \
   activate or deactivate the replica. This request can be made in both primary and secondary \
   regions of the user pool.\n\n\
  \  Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this \
   API operation. For this operation, you must use IAM credentials to authorize requests, and you \
   must grant yourself the corresponding IAM permission in a policy.\n\
  \  \n\
  \    {b Learn more} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html}Signing Amazon \
   Web Services API Requests} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module VerifySoftwareToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeMismatchException of code_mismatch_exception
    | `EnableSoftwareTokenMFAException of enable_software_token_mfa_exception
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `SoftwareTokenMFANotFoundException of software_token_mfa_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    verify_software_token_request ->
    ( verify_software_token_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeMismatchException of code_mismatch_exception
      | `EnableSoftwareTokenMFAException of enable_software_token_mfa_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `SoftwareTokenMFANotFoundException of software_token_mfa_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    verify_software_token_request ->
    ( verify_software_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeMismatchException of code_mismatch_exception
      | `EnableSoftwareTokenMFAException of enable_software_token_mfa_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidUserPoolConfigurationException of invalid_user_pool_configuration_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `SoftwareTokenMFANotFoundException of software_token_mfa_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers the current user's time-based one-time password (TOTP) authenticator with a code \
   generated in their authenticator app from a private key that's supplied by your user pool. \
   Marks the user's software token MFA status as \"verified\" if successful. The request takes an \
   access token or a session string, but not both.\n\n\
  \  Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for \
   this API operation. For this operation, you can't use IAM credentials to authorize requests, \
   and you can't grant IAM permissions in policies. For more information about authorization \
   models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \  \n\
  \   "]

(** {1:Serialization and Deserialization} *)
module VerifyUserAttribute : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AliasExistsException of alias_exists_exception
    | `CodeMismatchException of code_mismatch_exception
    | `ExpiredCodeException of expired_code_exception
    | `ForbiddenException of forbidden_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotAuthorizedException of not_authorized_exception
    | `OperationNotEnabledException of operation_not_enabled_exception
    | `PasswordResetRequiredException of password_reset_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UserNotConfirmedException of user_not_confirmed_exception
    | `UserNotFoundException of user_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    verify_user_attribute_request ->
    ( verify_user_attribute_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AliasExistsException of alias_exists_exception
      | `CodeMismatchException of code_mismatch_exception
      | `ExpiredCodeException of expired_code_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    verify_user_attribute_request ->
    ( verify_user_attribute_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AliasExistsException of alias_exists_exception
      | `CodeMismatchException of code_mismatch_exception
      | `ExpiredCodeException of expired_code_exception
      | `ForbiddenException of forbidden_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotAuthorizedException of not_authorized_exception
      | `OperationNotEnabledException of operation_not_enabled_exception
      | `PasswordResetRequiredException of password_reset_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UserNotConfirmedException of user_not_confirmed_exception
      | `UserNotFoundException of user_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Submits a verification code for a signed-in user who has added or changed a value of an \
   auto-verified attribute. When successful, the user's attribute becomes verified and the \
   attribute [email_verified] or [phone_number_verified] becomes [true].\n\n\
  \  If your user pool requires verification before Amazon Cognito updates the attribute value, \
   this operation updates the affected attribute to its pending value.\n\
  \ \n\
  \  Authorize this action with a signed-in user's access token. It must include the scope \
   [aws.cognito.signin.user.admin].\n\
  \  \n\
  \    Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests \
   for this API operation. For this operation, you can't use IAM credentials to authorize \
   requests, and you can't grant IAM permissions in policies. For more information about \
   authorization models in Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html}Using \
   the Amazon Cognito user pools API and user pool endpoints}.\n\
  \    \n\
  \     "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
