open Types

val make_ssh_public_key :
  ?upload_date:date_type ->
  user_name:user_name_type ->
  ssh_public_key_id:public_key_id_type ->
  fingerprint:public_key_fingerprint_type ->
  ssh_public_key_body:public_key_material_type ->
  status:status_type ->
  unit ->
  ssh_public_key

val make_upload_ssh_public_key_response :
  ?ssh_public_key:ssh_public_key -> unit -> upload_ssh_public_key_response

val make_upload_ssh_public_key_request :
  user_name:user_name_type ->
  ssh_public_key_body:public_key_material_type ->
  unit ->
  upload_ssh_public_key_request

val make_signing_certificate :
  ?upload_date:date_type ->
  user_name:user_name_type ->
  certificate_id:certificate_id_type ->
  certificate_body:certificate_body_type ->
  status:status_type ->
  unit ->
  signing_certificate

val make_upload_signing_certificate_response :
  certificate:signing_certificate -> unit -> upload_signing_certificate_response

val make_upload_signing_certificate_request :
  ?user_name:existing_user_name_type ->
  certificate_body:certificate_body_type ->
  unit ->
  upload_signing_certificate_request

val make_tag : key:tag_key_type -> value:tag_value_type -> unit -> tag

val make_server_certificate_metadata :
  ?upload_date:date_type ->
  ?expiration:date_type ->
  path:path_type ->
  server_certificate_name:server_certificate_name_type ->
  server_certificate_id:id_type ->
  arn:arn_type ->
  unit ->
  server_certificate_metadata

val make_upload_server_certificate_response :
  ?server_certificate_metadata:server_certificate_metadata ->
  ?tags:tag_list_type ->
  unit ->
  upload_server_certificate_response

val make_upload_server_certificate_request :
  ?path:path_type ->
  ?certificate_chain:certificate_chain_type ->
  ?tags:tag_list_type ->
  server_certificate_name:server_certificate_name_type ->
  certificate_body:certificate_body_type ->
  private_key:private_key_type ->
  unit ->
  upload_server_certificate_request

val make_update_user_request :
  ?new_path:path_type ->
  ?new_user_name:user_name_type ->
  user_name:existing_user_name_type ->
  unit ->
  update_user_request

val make_update_ssh_public_key_request :
  user_name:user_name_type ->
  ssh_public_key_id:public_key_id_type ->
  status:status_type ->
  unit ->
  update_ssh_public_key_request

val make_update_signing_certificate_request :
  ?user_name:existing_user_name_type ->
  certificate_id:certificate_id_type ->
  status:status_type ->
  unit ->
  update_signing_certificate_request

val make_update_service_specific_credential_request :
  ?user_name:user_name_type ->
  service_specific_credential_id:service_specific_credential_id ->
  status:status_type ->
  unit ->
  update_service_specific_credential_request

val make_update_server_certificate_request :
  ?new_path:path_type ->
  ?new_server_certificate_name:server_certificate_name_type ->
  server_certificate_name:server_certificate_name_type ->
  unit ->
  update_server_certificate_request

val make_update_saml_provider_response :
  ?saml_provider_arn:arn_type -> unit -> update_saml_provider_response

val make_update_saml_provider_request :
  ?saml_metadata_document:saml_metadata_document_type ->
  ?assertion_encryption_mode:assertion_encryption_mode_type ->
  ?add_private_key:private_key_type ->
  ?remove_private_key:private_key_id_type ->
  saml_provider_arn:arn_type ->
  unit ->
  update_saml_provider_request

val make_role_last_used : ?last_used_date:date_type -> ?region:string_type -> unit -> role_last_used

val make_attached_permissions_boundary :
  ?permissions_boundary_type:permissions_boundary_attachment_type ->
  ?permissions_boundary_arn:arn_type ->
  unit ->
  attached_permissions_boundary

val make_role :
  ?assume_role_policy_document:policy_document_type ->
  ?description:role_description_type ->
  ?max_session_duration:role_max_session_duration_type ->
  ?permissions_boundary:attached_permissions_boundary ->
  ?tags:tag_list_type ->
  ?role_last_used:role_last_used ->
  path:path_type ->
  role_name:role_name_type ->
  role_id:id_type ->
  arn:arn_type ->
  create_date:date_type ->
  unit ->
  role

val make_update_role_description_response : ?role:role -> unit -> update_role_description_response

val make_update_role_description_request :
  role_name:role_name_type ->
  description:role_description_type ->
  unit ->
  update_role_description_request

val make_update_role_response : unit -> unit

val make_update_role_request :
  ?description:role_description_type ->
  ?max_session_duration:role_max_session_duration_type ->
  role_name:role_name_type ->
  unit ->
  update_role_request

val make_update_open_id_connect_provider_thumbprint_request :
  open_id_connect_provider_arn:arn_type ->
  thumbprint_list:thumbprint_list_type ->
  unit ->
  update_open_id_connect_provider_thumbprint_request

val make_update_login_profile_request :
  ?password:password_type ->
  ?password_reset_required:boolean_object_type ->
  user_name:user_name_type ->
  unit ->
  update_login_profile_request

val make_update_group_request :
  ?new_path:path_type ->
  ?new_group_name:group_name_type ->
  group_name:group_name_type ->
  unit ->
  update_group_request

val make_update_delegation_request_request :
  ?notes:notes_type ->
  delegation_request_id:delegation_request_id_type ->
  unit ->
  update_delegation_request_request

val make_update_assume_role_policy_request :
  role_name:role_name_type ->
  policy_document:policy_document_type ->
  unit ->
  update_assume_role_policy_request

val make_update_account_password_policy_request :
  ?minimum_password_length:minimum_password_length_type ->
  ?require_symbols:boolean_type ->
  ?require_numbers:boolean_type ->
  ?require_uppercase_characters:boolean_type ->
  ?require_lowercase_characters:boolean_type ->
  ?allow_users_to_change_password:boolean_type ->
  ?max_password_age:max_password_age_type ->
  ?password_reuse_prevention:password_reuse_prevention_type ->
  ?hard_expiry:boolean_object_type ->
  unit ->
  update_account_password_policy_request

val make_update_access_key_request :
  ?user_name:existing_user_name_type ->
  access_key_id:access_key_id_type ->
  status:status_type ->
  unit ->
  update_access_key_request

val make_untag_user_request :
  user_name:existing_user_name_type -> tag_keys:tag_key_list_type -> unit -> untag_user_request

val make_untag_server_certificate_request :
  server_certificate_name:server_certificate_name_type ->
  tag_keys:tag_key_list_type ->
  unit ->
  untag_server_certificate_request

val make_untag_saml_provider_request :
  saml_provider_arn:arn_type -> tag_keys:tag_key_list_type -> unit -> untag_saml_provider_request

val make_untag_role_request :
  role_name:role_name_type -> tag_keys:tag_key_list_type -> unit -> untag_role_request

val make_untag_policy_request :
  policy_arn:arn_type -> tag_keys:tag_key_list_type -> unit -> untag_policy_request

val make_untag_open_id_connect_provider_request :
  open_id_connect_provider_arn:arn_type ->
  tag_keys:tag_key_list_type ->
  unit ->
  untag_open_id_connect_provider_request

val make_untag_mfa_device_request :
  serial_number:serial_number_type -> tag_keys:tag_key_list_type -> unit -> untag_mfa_device_request

val make_untag_instance_profile_request :
  instance_profile_name:instance_profile_name_type ->
  tag_keys:tag_key_list_type ->
  unit ->
  untag_instance_profile_request

val make_tag_user_request :
  user_name:existing_user_name_type -> tags:tag_list_type -> unit -> tag_user_request

val make_tag_server_certificate_request :
  server_certificate_name:server_certificate_name_type ->
  tags:tag_list_type ->
  unit ->
  tag_server_certificate_request

val make_tag_saml_provider_request :
  saml_provider_arn:arn_type -> tags:tag_list_type -> unit -> tag_saml_provider_request

val make_tag_role_request :
  role_name:role_name_type -> tags:tag_list_type -> unit -> tag_role_request

val make_tag_policy_request :
  policy_arn:arn_type -> tags:tag_list_type -> unit -> tag_policy_request

val make_tag_open_id_connect_provider_request :
  open_id_connect_provider_arn:arn_type ->
  tags:tag_list_type ->
  unit ->
  tag_open_id_connect_provider_request

val make_tag_mfa_device_request :
  serial_number:serial_number_type -> tags:tag_list_type -> unit -> tag_mfa_device_request

val make_tag_instance_profile_request :
  instance_profile_name:instance_profile_name_type ->
  tags:tag_list_type ->
  unit ->
  tag_instance_profile_request

val make_permissions_boundary_decision_detail :
  ?allowed_by_permissions_boundary:boolean_type -> unit -> permissions_boundary_decision_detail

val make_position : ?line:line_number -> ?column:column_number -> unit -> position

val make_statement :
  ?source_policy_id:policy_identifier_type ->
  ?source_policy_type:policy_source_type ->
  ?start_position:position ->
  ?end_position:position ->
  unit ->
  statement

val make_organizations_decision_detail :
  ?allowed_by_organizations:boolean_type -> unit -> organizations_decision_detail

val make_simulate_policy_response :
  ?evaluation_results:evaluation_results_list_type ->
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  unit ->
  simulate_policy_response

val make_context_entry :
  ?context_key_name:context_key_name_type ->
  ?context_key_values:context_key_value_list_type ->
  ?context_key_type:context_key_type_enum ->
  unit ->
  context_entry

val make_simulate_principal_policy_request :
  ?policy_input_list:simulation_policy_list_type ->
  ?permissions_boundary_policy_input_list:simulation_policy_list_type ->
  ?resource_arns:resource_name_list_type ->
  ?resource_policy:policy_document_type ->
  ?resource_owner:resource_name_type ->
  ?caller_arn:resource_name_type ->
  ?context_entries:context_entry_list_type ->
  ?resource_handling_option:resource_handling_option_type ->
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  policy_source_arn:arn_type ->
  action_names:action_name_list_type ->
  unit ->
  simulate_principal_policy_request

val make_simulate_custom_policy_request :
  ?permissions_boundary_policy_input_list:simulation_policy_list_type ->
  ?resource_arns:resource_name_list_type ->
  ?resource_policy:policy_document_type ->
  ?resource_owner:resource_name_type ->
  ?caller_arn:resource_name_type ->
  ?context_entries:context_entry_list_type ->
  ?resource_handling_option:resource_handling_option_type ->
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  policy_input_list:simulation_policy_list_type ->
  action_names:action_name_list_type ->
  unit ->
  simulate_custom_policy_request

val make_set_security_token_service_preferences_request :
  global_endpoint_token_version:global_endpoint_token_version ->
  unit ->
  set_security_token_service_preferences_request

val make_set_default_policy_version_request :
  policy_arn:arn_type ->
  version_id:policy_version_id_type ->
  unit ->
  set_default_policy_version_request

val make_send_delegation_token_request :
  delegation_request_id:delegation_request_id_type -> unit -> send_delegation_token_request

val make_resync_mfa_device_request :
  user_name:existing_user_name_type ->
  serial_number:serial_number_type ->
  authentication_code1:authentication_code_type ->
  authentication_code2:authentication_code_type ->
  unit ->
  resync_mfa_device_request

val make_service_specific_credential :
  ?expiration_date:date_type ->
  ?service_user_name:service_user_name ->
  ?service_password:service_password ->
  ?service_credential_alias:service_credential_alias ->
  ?service_credential_secret:service_credential_secret ->
  create_date:date_type ->
  service_name:service_name ->
  service_specific_credential_id:service_specific_credential_id ->
  user_name:user_name_type ->
  status:status_type ->
  unit ->
  service_specific_credential

val make_reset_service_specific_credential_response :
  ?service_specific_credential:service_specific_credential ->
  unit ->
  reset_service_specific_credential_response

val make_reset_service_specific_credential_request :
  ?user_name:user_name_type ->
  service_specific_credential_id:service_specific_credential_id ->
  unit ->
  reset_service_specific_credential_request

val make_remove_user_from_group_request :
  group_name:group_name_type ->
  user_name:existing_user_name_type ->
  unit ->
  remove_user_from_group_request

val make_remove_role_from_instance_profile_request :
  instance_profile_name:instance_profile_name_type ->
  role_name:role_name_type ->
  unit ->
  remove_role_from_instance_profile_request

val make_remove_client_id_from_open_id_connect_provider_request :
  open_id_connect_provider_arn:arn_type ->
  client_i_d:client_id_type ->
  unit ->
  remove_client_id_from_open_id_connect_provider_request

val make_reject_delegation_request_request :
  ?notes:notes_type ->
  delegation_request_id:delegation_request_id_type ->
  unit ->
  reject_delegation_request_request

val make_put_user_policy_request :
  user_name:existing_user_name_type ->
  policy_name:policy_name_type ->
  policy_document:policy_document_type ->
  unit ->
  put_user_policy_request

val make_put_user_permissions_boundary_request :
  user_name:user_name_type ->
  permissions_boundary:arn_type ->
  unit ->
  put_user_permissions_boundary_request

val make_put_role_policy_request :
  role_name:role_name_type ->
  policy_name:policy_name_type ->
  policy_document:policy_document_type ->
  unit ->
  put_role_policy_request

val make_put_role_permissions_boundary_request :
  role_name:role_name_type ->
  permissions_boundary:arn_type ->
  unit ->
  put_role_permissions_boundary_request

val make_put_group_policy_request :
  group_name:group_name_type ->
  policy_name:policy_name_type ->
  policy_document:policy_document_type ->
  unit ->
  put_group_policy_request

val make_user :
  ?password_last_used:date_type ->
  ?permissions_boundary:attached_permissions_boundary ->
  ?tags:tag_list_type ->
  path:path_type ->
  user_name:user_name_type ->
  user_id:id_type ->
  arn:arn_type ->
  create_date:date_type ->
  unit ->
  user

val make_virtual_mfa_device :
  ?base32_string_seed:bootstrap_datum ->
  ?qr_code_pn_g:bootstrap_datum ->
  ?user:user ->
  ?enable_date:date_type ->
  ?tags:tag_list_type ->
  serial_number:serial_number_type ->
  unit ->
  virtual_mfa_device

val make_list_virtual_mfa_devices_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  virtual_mfa_devices:virtual_mfa_device_list_type ->
  unit ->
  list_virtual_mfa_devices_response

val make_list_virtual_mfa_devices_request :
  ?assignment_status:assignment_status_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  unit ->
  list_virtual_mfa_devices_request

val make_list_user_tags_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  tags:tag_list_type ->
  unit ->
  list_user_tags_response

val make_list_user_tags_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  user_name:existing_user_name_type ->
  unit ->
  list_user_tags_request

val make_list_users_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  users:user_list_type ->
  unit ->
  list_users_response

val make_list_users_request :
  ?path_prefix:path_prefix_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  unit ->
  list_users_request

val make_list_user_policies_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  policy_names:policy_name_list_type ->
  unit ->
  list_user_policies_response

val make_list_user_policies_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  user_name:existing_user_name_type ->
  unit ->
  list_user_policies_request

val make_ssh_public_key_metadata :
  user_name:user_name_type ->
  ssh_public_key_id:public_key_id_type ->
  status:status_type ->
  upload_date:date_type ->
  unit ->
  ssh_public_key_metadata

val make_list_ssh_public_keys_response :
  ?ssh_public_keys:ssh_public_key_list_type ->
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  unit ->
  list_ssh_public_keys_response

val make_list_ssh_public_keys_request :
  ?user_name:user_name_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  unit ->
  list_ssh_public_keys_request

val make_list_signing_certificates_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  certificates:certificate_list_type ->
  unit ->
  list_signing_certificates_response

val make_list_signing_certificates_request :
  ?user_name:existing_user_name_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  unit ->
  list_signing_certificates_request

val make_service_specific_credential_metadata :
  ?service_user_name:service_user_name ->
  ?service_credential_alias:service_credential_alias ->
  ?expiration_date:date_type ->
  user_name:user_name_type ->
  status:status_type ->
  create_date:date_type ->
  service_specific_credential_id:service_specific_credential_id ->
  service_name:service_name ->
  unit ->
  service_specific_credential_metadata

val make_list_service_specific_credentials_response :
  ?service_specific_credentials:service_specific_credentials_list_type ->
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  unit ->
  list_service_specific_credentials_response

val make_list_service_specific_credentials_request :
  ?user_name:user_name_type ->
  ?service_name:service_name ->
  ?all_users:all_users ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  unit ->
  list_service_specific_credentials_request

val make_list_server_certificate_tags_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  tags:tag_list_type ->
  unit ->
  list_server_certificate_tags_response

val make_list_server_certificate_tags_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  server_certificate_name:server_certificate_name_type ->
  unit ->
  list_server_certificate_tags_request

val make_list_server_certificates_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  server_certificate_metadata_list:server_certificate_metadata_list_type ->
  unit ->
  list_server_certificates_response

val make_list_server_certificates_request :
  ?path_prefix:path_prefix_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  unit ->
  list_server_certificates_request

val make_list_saml_provider_tags_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  tags:tag_list_type ->
  unit ->
  list_saml_provider_tags_response

val make_list_saml_provider_tags_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  saml_provider_arn:arn_type ->
  unit ->
  list_saml_provider_tags_request

val make_saml_provider_list_entry :
  ?arn:arn_type ->
  ?valid_until:date_type ->
  ?create_date:date_type ->
  unit ->
  saml_provider_list_entry

val make_list_saml_providers_response :
  ?saml_provider_list:saml_provider_list_type -> unit -> list_saml_providers_response

val make_list_saml_providers_request : unit -> unit

val make_list_role_tags_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  tags:tag_list_type ->
  unit ->
  list_role_tags_response

val make_list_role_tags_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  role_name:role_name_type ->
  unit ->
  list_role_tags_request

val make_list_roles_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  roles:role_list_type ->
  unit ->
  list_roles_response

val make_list_roles_request :
  ?path_prefix:path_prefix_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  unit ->
  list_roles_request

val make_list_role_policies_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  policy_names:policy_name_list_type ->
  unit ->
  list_role_policies_response

val make_list_role_policies_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  role_name:role_name_type ->
  unit ->
  list_role_policies_request

val make_policy_version :
  ?document:policy_document_type ->
  ?version_id:policy_version_id_type ->
  ?is_default_version:boolean_type ->
  ?create_date:date_type ->
  unit ->
  policy_version

val make_list_policy_versions_response :
  ?versions:policy_document_version_list_type ->
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  unit ->
  list_policy_versions_response

val make_list_policy_versions_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  policy_arn:arn_type ->
  unit ->
  list_policy_versions_request

val make_list_policy_tags_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  tags:tag_list_type ->
  unit ->
  list_policy_tags_response

val make_list_policy_tags_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  policy_arn:arn_type ->
  unit ->
  list_policy_tags_request

val make_policy_granting_service_access :
  ?policy_arn:arn_type ->
  ?entity_type:policy_owner_entity_type ->
  ?entity_name:entity_name_type ->
  policy_name:policy_name_type ->
  policy_type:policy_type ->
  unit ->
  policy_granting_service_access

val make_list_policies_granting_service_access_entry :
  ?service_namespace:service_namespace_type ->
  ?policies:policy_granting_service_access_list_type ->
  unit ->
  list_policies_granting_service_access_entry

val make_list_policies_granting_service_access_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  policies_granting_service_access:list_policy_granting_service_access_response_list_type ->
  unit ->
  list_policies_granting_service_access_response

val make_list_policies_granting_service_access_request :
  ?marker:marker_type ->
  arn:arn_type ->
  service_namespaces:service_namespace_list_type ->
  unit ->
  list_policies_granting_service_access_request

val make_policy :
  ?policy_name:policy_name_type ->
  ?policy_id:id_type ->
  ?arn:arn_type ->
  ?path:policy_path_type ->
  ?default_version_id:policy_version_id_type ->
  ?attachment_count:attachment_count_type ->
  ?permissions_boundary_usage_count:attachment_count_type ->
  ?is_attachable:boolean_type ->
  ?description:policy_description_type ->
  ?create_date:date_type ->
  ?update_date:date_type ->
  ?tags:tag_list_type ->
  unit ->
  policy

val make_list_policies_response :
  ?policies:policy_list_type ->
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  unit ->
  list_policies_response

val make_list_policies_request :
  ?scope:policy_scope_type ->
  ?only_attached:boolean_type ->
  ?path_prefix:policy_path_type ->
  ?policy_usage_filter:policy_usage_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  unit ->
  list_policies_request

val make_list_organizations_features_response :
  ?organization_id:organization_id_type ->
  ?enabled_features:features_list_type ->
  unit ->
  list_organizations_features_response

val make_list_organizations_features_request : unit -> unit

val make_list_open_id_connect_provider_tags_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  tags:tag_list_type ->
  unit ->
  list_open_id_connect_provider_tags_response

val make_list_open_id_connect_provider_tags_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  open_id_connect_provider_arn:arn_type ->
  unit ->
  list_open_id_connect_provider_tags_request

val make_open_id_connect_provider_list_entry :
  ?arn:arn_type -> unit -> open_id_connect_provider_list_entry

val make_list_open_id_connect_providers_response :
  ?open_id_connect_provider_list:open_id_connect_provider_list_type ->
  unit ->
  list_open_id_connect_providers_response

val make_list_open_id_connect_providers_request : unit -> unit

val make_list_mfa_device_tags_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  tags:tag_list_type ->
  unit ->
  list_mfa_device_tags_response

val make_list_mfa_device_tags_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  serial_number:serial_number_type ->
  unit ->
  list_mfa_device_tags_request

val make_mfa_device :
  user_name:user_name_type ->
  serial_number:serial_number_type ->
  enable_date:date_type ->
  unit ->
  mfa_device

val make_list_mfa_devices_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  mfa_devices:mfa_device_list_type ->
  unit ->
  list_mfa_devices_response

val make_list_mfa_devices_request :
  ?user_name:existing_user_name_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  unit ->
  list_mfa_devices_request

val make_list_instance_profile_tags_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  tags:tag_list_type ->
  unit ->
  list_instance_profile_tags_response

val make_list_instance_profile_tags_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  instance_profile_name:instance_profile_name_type ->
  unit ->
  list_instance_profile_tags_request

val make_instance_profile :
  ?tags:tag_list_type ->
  path:path_type ->
  instance_profile_name:instance_profile_name_type ->
  instance_profile_id:id_type ->
  arn:arn_type ->
  create_date:date_type ->
  roles:role_list_type ->
  unit ->
  instance_profile

val make_list_instance_profiles_for_role_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  instance_profiles:instance_profile_list_type ->
  unit ->
  list_instance_profiles_for_role_response

val make_list_instance_profiles_for_role_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  role_name:role_name_type ->
  unit ->
  list_instance_profiles_for_role_request

val make_list_instance_profiles_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  instance_profiles:instance_profile_list_type ->
  unit ->
  list_instance_profiles_response

val make_list_instance_profiles_request :
  ?path_prefix:path_prefix_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  unit ->
  list_instance_profiles_request

val make_group :
  path:path_type ->
  group_name:group_name_type ->
  group_id:id_type ->
  arn:arn_type ->
  create_date:date_type ->
  unit ->
  group

val make_list_groups_for_user_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  groups:group_list_type ->
  unit ->
  list_groups_for_user_response

val make_list_groups_for_user_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  user_name:existing_user_name_type ->
  unit ->
  list_groups_for_user_request

val make_list_groups_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  groups:group_list_type ->
  unit ->
  list_groups_response

val make_list_groups_request :
  ?path_prefix:path_prefix_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  unit ->
  list_groups_request

val make_list_group_policies_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  policy_names:policy_name_list_type ->
  unit ->
  list_group_policies_response

val make_list_group_policies_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  group_name:group_name_type ->
  unit ->
  list_group_policies_request

val make_policy_role : ?role_name:role_name_type -> ?role_id:id_type -> unit -> policy_role
val make_policy_user : ?user_name:user_name_type -> ?user_id:id_type -> unit -> policy_user
val make_policy_group : ?group_name:group_name_type -> ?group_id:id_type -> unit -> policy_group

val make_list_entities_for_policy_response :
  ?policy_groups:policy_group_list_type ->
  ?policy_users:policy_user_list_type ->
  ?policy_roles:policy_role_list_type ->
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  unit ->
  list_entities_for_policy_response

val make_list_entities_for_policy_request :
  ?entity_filter:entity_type ->
  ?path_prefix:path_type ->
  ?policy_usage_filter:policy_usage_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  policy_arn:arn_type ->
  unit ->
  list_entities_for_policy_request

val make_policy_parameter :
  ?name:policy_parameter_name_type ->
  ?values:policy_parameter_values_list_type ->
  ?type_:policy_parameter_type_enum ->
  unit ->
  policy_parameter

val make_delegation_permission :
  ?policy_template_arn:arn_type ->
  ?parameters:policy_parameter_list_type ->
  unit ->
  delegation_permission

val make_delegation_request :
  ?delegation_request_id:delegation_request_id_type ->
  ?owner_account_id:account_id_type ->
  ?description:delegation_request_description_type ->
  ?request_message:request_message_type ->
  ?permissions:delegation_permission ->
  ?permission_policy:permission_type ->
  ?role_permission_restriction_arns:role_permission_restriction_arn_list_type ->
  ?owner_id:owner_id_type ->
  ?approver_id:arn_type ->
  ?state:state_type ->
  ?expiration_time:date_type ->
  ?requestor_id:account_id_type ->
  ?requestor_name:requestor_name_type ->
  ?create_date:date_type ->
  ?session_duration:session_duration_type ->
  ?redirect_url:redirect_url_type ->
  ?notes:notes_type ->
  ?rejection_reason:notes_type ->
  ?only_send_by_owner:boolean_type ->
  ?updated_time:date_type ->
  unit ->
  delegation_request

val make_list_delegation_requests_response :
  ?delegation_requests:delegation_requests_list_type ->
  ?marker:marker_type ->
  ?is_truncated:boolean_type ->
  unit ->
  list_delegation_requests_response

val make_list_delegation_requests_request :
  ?owner_id:owner_id_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  unit ->
  list_delegation_requests_request

val make_attached_policy :
  ?policy_name:policy_name_type -> ?policy_arn:arn_type -> unit -> attached_policy

val make_list_attached_user_policies_response :
  ?attached_policies:attached_policies_list_type ->
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  unit ->
  list_attached_user_policies_response

val make_list_attached_user_policies_request :
  ?path_prefix:policy_path_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  user_name:user_name_type ->
  unit ->
  list_attached_user_policies_request

val make_list_attached_role_policies_response :
  ?attached_policies:attached_policies_list_type ->
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  unit ->
  list_attached_role_policies_response

val make_list_attached_role_policies_request :
  ?path_prefix:policy_path_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  role_name:role_name_type ->
  unit ->
  list_attached_role_policies_request

val make_list_attached_group_policies_response :
  ?attached_policies:attached_policies_list_type ->
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  unit ->
  list_attached_group_policies_response

val make_list_attached_group_policies_request :
  ?path_prefix:policy_path_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  group_name:group_name_type ->
  unit ->
  list_attached_group_policies_request

val make_list_account_aliases_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  account_aliases:account_alias_list_type ->
  unit ->
  list_account_aliases_response

val make_list_account_aliases_request :
  ?marker:marker_type -> ?max_items:max_items_type -> unit -> list_account_aliases_request

val make_access_key_metadata :
  ?user_name:user_name_type ->
  ?access_key_id:access_key_id_type ->
  ?status:status_type ->
  ?create_date:date_type ->
  unit ->
  access_key_metadata

val make_list_access_keys_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  access_key_metadata:access_key_metadata_list_type ->
  unit ->
  list_access_keys_response

val make_list_access_keys_request :
  ?user_name:existing_user_name_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  unit ->
  list_access_keys_request

val make_get_user_policy_response :
  user_name:existing_user_name_type ->
  policy_name:policy_name_type ->
  policy_document:policy_document_type ->
  unit ->
  get_user_policy_response

val make_get_user_policy_request :
  user_name:existing_user_name_type ->
  policy_name:policy_name_type ->
  unit ->
  get_user_policy_request

val make_get_user_response : user:user -> unit -> get_user_response
val make_get_user_request : ?user_name:existing_user_name_type -> unit -> get_user_request

val make_get_ssh_public_key_response :
  ?ssh_public_key:ssh_public_key -> unit -> get_ssh_public_key_response

val make_get_ssh_public_key_request :
  user_name:user_name_type ->
  ssh_public_key_id:public_key_id_type ->
  encoding:encoding_type ->
  unit ->
  get_ssh_public_key_request

val make_role_usage_type :
  ?region:region_name_type -> ?resources:arn_list_type -> unit -> role_usage_type

val make_deletion_task_failure_reason_type :
  ?reason:reason_type ->
  ?role_usage_list:role_usage_list_type ->
  unit ->
  deletion_task_failure_reason_type

val make_get_service_linked_role_deletion_status_response :
  ?reason:deletion_task_failure_reason_type ->
  status:deletion_task_status_type ->
  unit ->
  get_service_linked_role_deletion_status_response

val make_get_service_linked_role_deletion_status_request :
  deletion_task_id:deletion_task_id_type -> unit -> get_service_linked_role_deletion_status_request

val make_error_details : message:string_type -> code:string_type -> unit -> error_details

val make_entity_info :
  ?path:path_type ->
  arn:arn_type ->
  name:user_name_type ->
  type_:policy_owner_entity_type ->
  id:id_type ->
  unit ->
  entity_info

val make_entity_details :
  ?last_authenticated:date_type -> entity_info:entity_info -> unit -> entity_details

val make_get_service_last_accessed_details_with_entities_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  ?error:error_details ->
  job_status:job_status_type ->
  job_creation_date:date_type ->
  job_completion_date:date_type ->
  entity_details_list:entity_details_list_type ->
  unit ->
  get_service_last_accessed_details_with_entities_response

val make_get_service_last_accessed_details_with_entities_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  job_id:job_id_type ->
  service_namespace:service_namespace_type ->
  unit ->
  get_service_last_accessed_details_with_entities_request

val make_tracked_action_last_accessed :
  ?action_name:string_type ->
  ?last_accessed_entity:arn_type ->
  ?last_accessed_time:date_type ->
  ?last_accessed_region:string_type ->
  unit ->
  tracked_action_last_accessed

val make_service_last_accessed :
  ?last_authenticated:date_type ->
  ?last_authenticated_entity:arn_type ->
  ?last_authenticated_region:string_type ->
  ?total_authenticated_entities:integer_type ->
  ?tracked_actions_last_accessed:tracked_actions_last_accessed ->
  service_name:service_name_type ->
  service_namespace:service_namespace_type ->
  unit ->
  service_last_accessed

val make_get_service_last_accessed_details_response :
  ?job_type:access_advisor_usage_granularity_type ->
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  ?error:error_details ->
  job_status:job_status_type ->
  job_creation_date:date_type ->
  services_last_accessed:services_last_accessed ->
  job_completion_date:date_type ->
  unit ->
  get_service_last_accessed_details_response

val make_get_service_last_accessed_details_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  job_id:job_id_type ->
  unit ->
  get_service_last_accessed_details_request

val make_server_certificate :
  ?certificate_chain:certificate_chain_type ->
  ?tags:tag_list_type ->
  server_certificate_metadata:server_certificate_metadata ->
  certificate_body:certificate_body_type ->
  unit ->
  server_certificate

val make_get_server_certificate_response :
  server_certificate:server_certificate -> unit -> get_server_certificate_response

val make_get_server_certificate_request :
  server_certificate_name:server_certificate_name_type -> unit -> get_server_certificate_request

val make_saml_private_key :
  ?key_id:private_key_id_type -> ?timestamp:date_type -> unit -> saml_private_key

val make_get_saml_provider_response :
  ?saml_provider_uui_d:private_key_id_type ->
  ?saml_metadata_document:saml_metadata_document_type ->
  ?create_date:date_type ->
  ?valid_until:date_type ->
  ?tags:tag_list_type ->
  ?assertion_encryption_mode:assertion_encryption_mode_type ->
  ?private_key_list:private_key_list ->
  unit ->
  get_saml_provider_response

val make_get_saml_provider_request : saml_provider_arn:arn_type -> unit -> get_saml_provider_request

val make_get_role_policy_response :
  role_name:role_name_type ->
  policy_name:policy_name_type ->
  policy_document:policy_document_type ->
  unit ->
  get_role_policy_response

val make_get_role_policy_request :
  role_name:role_name_type -> policy_name:policy_name_type -> unit -> get_role_policy_request

val make_get_role_response : role:role -> unit -> get_role_response
val make_get_role_request : role_name:role_name_type -> unit -> get_role_request

val make_get_policy_version_response :
  ?policy_version:policy_version -> unit -> get_policy_version_response

val make_get_policy_version_request :
  policy_arn:arn_type -> version_id:policy_version_id_type -> unit -> get_policy_version_request

val make_get_policy_response : ?policy:policy -> unit -> get_policy_response
val make_get_policy_request : policy_arn:arn_type -> unit -> get_policy_request

val make_get_outbound_web_identity_federation_info_response :
  ?issuer_identifier:string_type ->
  ?jwt_vending_enabled:boolean_type ->
  unit ->
  get_outbound_web_identity_federation_info_response

val make_access_detail :
  ?region:string_type ->
  ?entity_path:organizations_entity_path_type ->
  ?last_authenticated_time:date_type ->
  ?total_authenticated_entities:integer_type ->
  service_name:service_name_type ->
  service_namespace:service_namespace_type ->
  unit ->
  access_detail

val make_get_organizations_access_report_response :
  ?job_completion_date:date_type ->
  ?number_of_services_accessible:integer_type ->
  ?number_of_services_not_accessed:integer_type ->
  ?access_details:access_details ->
  ?is_truncated:boolean_type ->
  ?marker:marker_type ->
  ?error_details:error_details ->
  job_status:job_status_type ->
  job_creation_date:date_type ->
  unit ->
  get_organizations_access_report_response

val make_get_organizations_access_report_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?sort_key:sort_key_type ->
  job_id:job_id_type ->
  unit ->
  get_organizations_access_report_request

val make_get_open_id_connect_provider_response :
  ?url:open_id_connect_provider_url_type ->
  ?client_id_list:client_id_list_type ->
  ?thumbprint_list:thumbprint_list_type ->
  ?create_date:date_type ->
  ?tags:tag_list_type ->
  unit ->
  get_open_id_connect_provider_response

val make_get_open_id_connect_provider_request :
  open_id_connect_provider_arn:arn_type -> unit -> get_open_id_connect_provider_request

val make_get_mfa_device_response :
  ?user_name:user_name_type ->
  ?enable_date:date_type ->
  ?certifications:certification_map_type ->
  serial_number:serial_number_type ->
  unit ->
  get_mfa_device_response

val make_get_mfa_device_request :
  ?user_name:user_name_type -> serial_number:serial_number_type -> unit -> get_mfa_device_request

val make_login_profile :
  ?password_reset_required:boolean_type ->
  user_name:user_name_type ->
  create_date:date_type ->
  unit ->
  login_profile

val make_get_login_profile_response :
  login_profile:login_profile -> unit -> get_login_profile_response

val make_get_login_profile_request : ?user_name:user_name_type -> unit -> get_login_profile_request

val make_get_instance_profile_response :
  instance_profile:instance_profile -> unit -> get_instance_profile_response

val make_get_instance_profile_request :
  instance_profile_name:instance_profile_name_type -> unit -> get_instance_profile_request

val make_get_human_readable_summary_response :
  ?summary_content:summary_content_type ->
  ?locale:locale_type ->
  ?summary_state:summary_state_type ->
  unit ->
  get_human_readable_summary_response

val make_get_human_readable_summary_request :
  ?locale:locale_type -> entity_arn:arn_type -> unit -> get_human_readable_summary_request

val make_get_group_policy_response :
  group_name:group_name_type ->
  policy_name:policy_name_type ->
  policy_document:policy_document_type ->
  unit ->
  get_group_policy_response

val make_get_group_policy_request :
  group_name:group_name_type -> policy_name:policy_name_type -> unit -> get_group_policy_request

val make_get_group_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  group:group ->
  users:user_list_type ->
  unit ->
  get_group_response

val make_get_group_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  group_name:group_name_type ->
  unit ->
  get_group_request

val make_get_delegation_request_response :
  ?delegation_request:delegation_request ->
  ?permission_check_status:permission_check_status_type ->
  ?permission_check_result:permission_check_result_type ->
  unit ->
  get_delegation_request_response

val make_get_delegation_request_request :
  ?delegation_permission_check:boolean_type ->
  delegation_request_id:delegation_request_id_type ->
  unit ->
  get_delegation_request_request

val make_get_credential_report_response :
  ?content:report_content_type ->
  ?report_format:report_format_type ->
  ?generated_time:date_type ->
  unit ->
  get_credential_report_response

val make_get_context_keys_for_policy_response :
  ?context_key_names:context_key_names_result_list_type ->
  unit ->
  get_context_keys_for_policy_response

val make_get_context_keys_for_principal_policy_request :
  ?policy_input_list:simulation_policy_list_type ->
  policy_source_arn:arn_type ->
  unit ->
  get_context_keys_for_principal_policy_request

val make_get_context_keys_for_custom_policy_request :
  policy_input_list:simulation_policy_list_type ->
  unit ->
  get_context_keys_for_custom_policy_request

val make_get_account_summary_response :
  ?summary_map:summary_map_type -> unit -> get_account_summary_response

val make_password_policy :
  ?minimum_password_length:minimum_password_length_type ->
  ?require_symbols:boolean_type ->
  ?require_numbers:boolean_type ->
  ?require_uppercase_characters:boolean_type ->
  ?require_lowercase_characters:boolean_type ->
  ?allow_users_to_change_password:boolean_type ->
  ?expire_passwords:boolean_type ->
  ?max_password_age:max_password_age_type ->
  ?password_reuse_prevention:password_reuse_prevention_type ->
  ?hard_expiry:boolean_object_type ->
  unit ->
  password_policy

val make_get_account_password_policy_response :
  password_policy:password_policy -> unit -> get_account_password_policy_response

val make_managed_policy_detail :
  ?policy_name:policy_name_type ->
  ?policy_id:id_type ->
  ?arn:arn_type ->
  ?path:policy_path_type ->
  ?default_version_id:policy_version_id_type ->
  ?attachment_count:attachment_count_type ->
  ?permissions_boundary_usage_count:attachment_count_type ->
  ?is_attachable:boolean_type ->
  ?description:policy_description_type ->
  ?create_date:date_type ->
  ?update_date:date_type ->
  ?policy_version_list:policy_document_version_list_type ->
  unit ->
  managed_policy_detail

val make_policy_detail :
  ?policy_name:policy_name_type -> ?policy_document:policy_document_type -> unit -> policy_detail

val make_role_detail :
  ?path:path_type ->
  ?role_name:role_name_type ->
  ?role_id:id_type ->
  ?arn:arn_type ->
  ?create_date:date_type ->
  ?assume_role_policy_document:policy_document_type ->
  ?instance_profile_list:instance_profile_list_type ->
  ?role_policy_list:policy_detail_list_type ->
  ?attached_managed_policies:attached_policies_list_type ->
  ?permissions_boundary:attached_permissions_boundary ->
  ?tags:tag_list_type ->
  ?role_last_used:role_last_used ->
  unit ->
  role_detail

val make_group_detail :
  ?path:path_type ->
  ?group_name:group_name_type ->
  ?group_id:id_type ->
  ?arn:arn_type ->
  ?create_date:date_type ->
  ?group_policy_list:policy_detail_list_type ->
  ?attached_managed_policies:attached_policies_list_type ->
  unit ->
  group_detail

val make_user_detail :
  ?path:path_type ->
  ?user_name:user_name_type ->
  ?user_id:id_type ->
  ?arn:arn_type ->
  ?create_date:date_type ->
  ?user_policy_list:policy_detail_list_type ->
  ?group_list:group_name_list_type ->
  ?attached_managed_policies:attached_policies_list_type ->
  ?permissions_boundary:attached_permissions_boundary ->
  ?tags:tag_list_type ->
  unit ->
  user_detail

val make_get_account_authorization_details_response :
  ?user_detail_list:user_detail_list_type ->
  ?group_detail_list:group_detail_list_type ->
  ?role_detail_list:role_detail_list_type ->
  ?policies:managed_policy_detail_list_type ->
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  unit ->
  get_account_authorization_details_response

val make_get_account_authorization_details_request :
  ?filter:entity_list_type ->
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  unit ->
  get_account_authorization_details_request

val make_access_key_last_used :
  ?last_used_date:date_type ->
  service_name:string_type ->
  region:string_type ->
  unit ->
  access_key_last_used

val make_get_access_key_last_used_response :
  ?user_name:existing_user_name_type ->
  ?access_key_last_used:access_key_last_used ->
  unit ->
  get_access_key_last_used_response

val make_get_access_key_last_used_request :
  access_key_id:access_key_id_type -> unit -> get_access_key_last_used_request

val make_generate_service_last_accessed_details_response :
  ?job_id:job_id_type -> unit -> generate_service_last_accessed_details_response

val make_generate_service_last_accessed_details_request :
  ?granularity:access_advisor_usage_granularity_type ->
  arn:arn_type ->
  unit ->
  generate_service_last_accessed_details_request

val make_generate_organizations_access_report_response :
  ?job_id:job_id_type -> unit -> generate_organizations_access_report_response

val make_generate_organizations_access_report_request :
  ?organizations_policy_id:organizations_policy_id_type ->
  entity_path:organizations_entity_path_type ->
  unit ->
  generate_organizations_access_report_request

val make_generate_credential_report_response :
  ?state:report_state_type ->
  ?description:report_state_description_type ->
  unit ->
  generate_credential_report_response

val make_enable_outbound_web_identity_federation_response :
  ?issuer_identifier:string_type -> unit -> enable_outbound_web_identity_federation_response

val make_enable_organizations_root_sessions_response :
  ?organization_id:organization_id_type ->
  ?enabled_features:features_list_type ->
  unit ->
  enable_organizations_root_sessions_response

val make_enable_organizations_root_sessions_request : unit -> unit

val make_enable_organizations_root_credentials_management_response :
  ?organization_id:organization_id_type ->
  ?enabled_features:features_list_type ->
  unit ->
  enable_organizations_root_credentials_management_response

val make_enable_organizations_root_credentials_management_request : unit -> unit

val make_enable_mfa_device_request :
  user_name:existing_user_name_type ->
  serial_number:serial_number_type ->
  authentication_code1:authentication_code_type ->
  authentication_code2:authentication_code_type ->
  unit ->
  enable_mfa_device_request

val make_disable_organizations_root_sessions_response :
  ?organization_id:organization_id_type ->
  ?enabled_features:features_list_type ->
  unit ->
  disable_organizations_root_sessions_response

val make_disable_organizations_root_sessions_request : unit -> unit

val make_disable_organizations_root_credentials_management_response :
  ?organization_id:organization_id_type ->
  ?enabled_features:features_list_type ->
  unit ->
  disable_organizations_root_credentials_management_response

val make_disable_organizations_root_credentials_management_request : unit -> unit

val make_detach_user_policy_request :
  user_name:user_name_type -> policy_arn:arn_type -> unit -> detach_user_policy_request

val make_detach_role_policy_request :
  role_name:role_name_type -> policy_arn:arn_type -> unit -> detach_role_policy_request

val make_detach_group_policy_request :
  group_name:group_name_type -> policy_arn:arn_type -> unit -> detach_group_policy_request

val make_delete_virtual_mfa_device_request :
  serial_number:serial_number_type -> unit -> delete_virtual_mfa_device_request

val make_delete_user_policy_request :
  user_name:existing_user_name_type ->
  policy_name:policy_name_type ->
  unit ->
  delete_user_policy_request

val make_delete_user_permissions_boundary_request :
  user_name:user_name_type -> unit -> delete_user_permissions_boundary_request

val make_delete_user_request : user_name:existing_user_name_type -> unit -> delete_user_request

val make_delete_ssh_public_key_request :
  user_name:user_name_type ->
  ssh_public_key_id:public_key_id_type ->
  unit ->
  delete_ssh_public_key_request

val make_delete_signing_certificate_request :
  ?user_name:existing_user_name_type ->
  certificate_id:certificate_id_type ->
  unit ->
  delete_signing_certificate_request

val make_delete_service_specific_credential_request :
  ?user_name:user_name_type ->
  service_specific_credential_id:service_specific_credential_id ->
  unit ->
  delete_service_specific_credential_request

val make_delete_service_linked_role_response :
  deletion_task_id:deletion_task_id_type -> unit -> delete_service_linked_role_response

val make_delete_service_linked_role_request :
  role_name:role_name_type -> unit -> delete_service_linked_role_request

val make_delete_server_certificate_request :
  server_certificate_name:server_certificate_name_type -> unit -> delete_server_certificate_request

val make_delete_saml_provider_request :
  saml_provider_arn:arn_type -> unit -> delete_saml_provider_request

val make_delete_role_policy_request :
  role_name:role_name_type -> policy_name:policy_name_type -> unit -> delete_role_policy_request

val make_delete_role_permissions_boundary_request :
  role_name:role_name_type -> unit -> delete_role_permissions_boundary_request

val make_delete_role_request : role_name:role_name_type -> unit -> delete_role_request

val make_delete_policy_version_request :
  policy_arn:arn_type -> version_id:policy_version_id_type -> unit -> delete_policy_version_request

val make_delete_policy_request : policy_arn:arn_type -> unit -> delete_policy_request

val make_delete_open_id_connect_provider_request :
  open_id_connect_provider_arn:arn_type -> unit -> delete_open_id_connect_provider_request

val make_delete_login_profile_request :
  ?user_name:user_name_type -> unit -> delete_login_profile_request

val make_delete_instance_profile_request :
  instance_profile_name:instance_profile_name_type -> unit -> delete_instance_profile_request

val make_delete_group_policy_request :
  group_name:group_name_type -> policy_name:policy_name_type -> unit -> delete_group_policy_request

val make_delete_group_request : group_name:group_name_type -> unit -> delete_group_request

val make_delete_account_alias_request :
  account_alias:account_alias_type -> unit -> delete_account_alias_request

val make_delete_access_key_request :
  ?user_name:existing_user_name_type ->
  access_key_id:access_key_id_type ->
  unit ->
  delete_access_key_request

val make_deactivate_mfa_device_request :
  ?user_name:existing_user_name_type ->
  serial_number:serial_number_type ->
  unit ->
  deactivate_mfa_device_request

val make_create_virtual_mfa_device_response :
  virtual_mfa_device:virtual_mfa_device -> unit -> create_virtual_mfa_device_response

val make_create_virtual_mfa_device_request :
  ?path:path_type ->
  ?tags:tag_list_type ->
  virtual_mfa_device_name:virtual_mfa_device_name ->
  unit ->
  create_virtual_mfa_device_request

val make_create_user_response : ?user:user -> unit -> create_user_response

val make_create_user_request :
  ?path:path_type ->
  ?permissions_boundary:arn_type ->
  ?tags:tag_list_type ->
  user_name:user_name_type ->
  unit ->
  create_user_request

val make_create_service_specific_credential_response :
  ?service_specific_credential:service_specific_credential ->
  unit ->
  create_service_specific_credential_response

val make_create_service_specific_credential_request :
  ?credential_age_days:credential_age_days ->
  user_name:user_name_type ->
  service_name:service_name ->
  unit ->
  create_service_specific_credential_request

val make_create_service_linked_role_response :
  ?role:role -> unit -> create_service_linked_role_response

val make_create_service_linked_role_request :
  ?description:role_description_type ->
  ?custom_suffix:custom_suffix_type ->
  aws_service_name:group_name_type ->
  unit ->
  create_service_linked_role_request

val make_create_saml_provider_response :
  ?saml_provider_arn:arn_type -> ?tags:tag_list_type -> unit -> create_saml_provider_response

val make_create_saml_provider_request :
  ?tags:tag_list_type ->
  ?assertion_encryption_mode:assertion_encryption_mode_type ->
  ?add_private_key:private_key_type ->
  saml_metadata_document:saml_metadata_document_type ->
  name:saml_provider_name_type ->
  unit ->
  create_saml_provider_request

val make_create_role_response : role:role -> unit -> create_role_response

val make_create_role_request :
  ?path:path_type ->
  ?description:role_description_type ->
  ?max_session_duration:role_max_session_duration_type ->
  ?permissions_boundary:arn_type ->
  ?tags:tag_list_type ->
  role_name:role_name_type ->
  assume_role_policy_document:policy_document_type ->
  unit ->
  create_role_request

val make_create_policy_version_response :
  ?policy_version:policy_version -> unit -> create_policy_version_response

val make_create_policy_version_request :
  ?set_as_default:boolean_type ->
  policy_arn:arn_type ->
  policy_document:policy_document_type ->
  unit ->
  create_policy_version_request

val make_create_policy_response : ?policy:policy -> unit -> create_policy_response

val make_create_policy_request :
  ?path:policy_path_type ->
  ?description:policy_description_type ->
  ?tags:tag_list_type ->
  policy_name:policy_name_type ->
  policy_document:policy_document_type ->
  unit ->
  create_policy_request

val make_create_open_id_connect_provider_response :
  ?open_id_connect_provider_arn:arn_type ->
  ?tags:tag_list_type ->
  unit ->
  create_open_id_connect_provider_response

val make_create_open_id_connect_provider_request :
  ?client_id_list:client_id_list_type ->
  ?thumbprint_list:thumbprint_list_type ->
  ?tags:tag_list_type ->
  url:open_id_connect_provider_url_type ->
  unit ->
  create_open_id_connect_provider_request

val make_create_login_profile_response :
  login_profile:login_profile -> unit -> create_login_profile_response

val make_create_login_profile_request :
  ?user_name:user_name_type ->
  ?password:password_type ->
  ?password_reset_required:boolean_type ->
  unit ->
  create_login_profile_request

val make_create_instance_profile_response :
  instance_profile:instance_profile -> unit -> create_instance_profile_response

val make_create_instance_profile_request :
  ?path:path_type ->
  ?tags:tag_list_type ->
  instance_profile_name:instance_profile_name_type ->
  unit ->
  create_instance_profile_request

val make_create_group_response : group:group -> unit -> create_group_response

val make_create_group_request :
  ?path:path_type -> group_name:group_name_type -> unit -> create_group_request

val make_create_delegation_request_response :
  ?console_deep_link:console_deep_link_type ->
  ?delegation_request_id:delegation_request_id_type ->
  unit ->
  create_delegation_request_response

val make_create_delegation_request_request :
  ?owner_account_id:account_id_type ->
  ?request_message:request_message_type ->
  ?redirect_url:redirect_url_type ->
  ?only_send_by_owner:boolean_type ->
  description:delegation_request_description_type ->
  permissions:delegation_permission ->
  requestor_workflow_id:requestor_workflow_id_type ->
  notification_channel:notification_channel_type ->
  session_duration:session_duration_type ->
  unit ->
  create_delegation_request_request

val make_create_account_alias_request :
  account_alias:account_alias_type -> unit -> create_account_alias_request

val make_access_key :
  ?create_date:date_type ->
  user_name:user_name_type ->
  access_key_id:access_key_id_type ->
  status:status_type ->
  secret_access_key:access_key_secret_type ->
  unit ->
  access_key

val make_create_access_key_response : access_key:access_key -> unit -> create_access_key_response

val make_create_access_key_request :
  ?user_name:existing_user_name_type -> unit -> create_access_key_request

val make_change_password_request :
  old_password:password_type -> new_password:password_type -> unit -> change_password_request

val make_attach_user_policy_request :
  user_name:user_name_type -> policy_arn:arn_type -> unit -> attach_user_policy_request

val make_attach_role_policy_request :
  role_name:role_name_type -> policy_arn:arn_type -> unit -> attach_role_policy_request

val make_attach_group_policy_request :
  group_name:group_name_type -> policy_arn:arn_type -> unit -> attach_group_policy_request

val make_associate_delegation_request_request :
  delegation_request_id:delegation_request_id_type -> unit -> associate_delegation_request_request

val make_add_user_to_group_request :
  group_name:group_name_type ->
  user_name:existing_user_name_type ->
  unit ->
  add_user_to_group_request

val make_add_role_to_instance_profile_request :
  instance_profile_name:instance_profile_name_type ->
  role_name:role_name_type ->
  unit ->
  add_role_to_instance_profile_request

val make_add_client_id_to_open_id_connect_provider_request :
  open_id_connect_provider_arn:arn_type ->
  client_i_d:client_id_type ->
  unit ->
  add_client_id_to_open_id_connect_provider_request

val make_accept_delegation_request_request :
  delegation_request_id:delegation_request_id_type -> unit -> accept_delegation_request_request
