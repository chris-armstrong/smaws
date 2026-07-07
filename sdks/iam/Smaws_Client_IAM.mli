(** IAM client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_attached_permissions_boundary :
  ?permissions_boundary_arn:arn_type ->
  ?permissions_boundary_type:permissions_boundary_attachment_type ->
  unit ->
  attached_permissions_boundary

val make_tag : value:tag_value_type -> key:tag_key_type -> unit -> tag

val make_user :
  ?tags:tag_list_type ->
  ?permissions_boundary:attached_permissions_boundary ->
  ?password_last_used:date_type ->
  create_date:date_type ->
  arn:arn_type ->
  user_id:id_type ->
  user_name:user_name_type ->
  path:path_type ->
  unit ->
  user

val make_virtual_mfa_device :
  ?tags:tag_list_type ->
  ?enable_date:date_type ->
  ?user:user ->
  ?qr_code_pn_g:bootstrap_datum ->
  ?base32_string_seed:bootstrap_datum ->
  serial_number:serial_number_type ->
  unit ->
  virtual_mfa_device

val make_policy_detail :
  ?policy_document:policy_document_type -> ?policy_name:policy_name_type -> unit -> policy_detail

val make_attached_policy :
  ?policy_arn:arn_type -> ?policy_name:policy_name_type -> unit -> attached_policy

val make_user_detail :
  ?tags:tag_list_type ->
  ?permissions_boundary:attached_permissions_boundary ->
  ?attached_managed_policies:attached_policies_list_type ->
  ?group_list:group_name_list_type ->
  ?user_policy_list:policy_detail_list_type ->
  ?create_date:date_type ->
  ?arn:arn_type ->
  ?user_id:id_type ->
  ?user_name:user_name_type ->
  ?path:path_type ->
  unit ->
  user_detail

val make_server_certificate_metadata :
  ?expiration:date_type ->
  ?upload_date:date_type ->
  arn:arn_type ->
  server_certificate_id:id_type ->
  server_certificate_name:server_certificate_name_type ->
  path:path_type ->
  unit ->
  server_certificate_metadata

val make_role_last_used : ?region:string_type -> ?last_used_date:date_type -> unit -> role_last_used

val make_role :
  ?role_last_used:role_last_used ->
  ?tags:tag_list_type ->
  ?permissions_boundary:attached_permissions_boundary ->
  ?max_session_duration:role_max_session_duration_type ->
  ?description:role_description_type ->
  ?assume_role_policy_document:policy_document_type ->
  create_date:date_type ->
  arn:arn_type ->
  role_id:id_type ->
  role_name:role_name_type ->
  path:path_type ->
  unit ->
  role

val make_instance_profile :
  ?tags:tag_list_type ->
  roles:role_list_type ->
  create_date:date_type ->
  arn:arn_type ->
  instance_profile_id:id_type ->
  instance_profile_name:instance_profile_name_type ->
  path:path_type ->
  unit ->
  instance_profile

val make_role_detail :
  ?role_last_used:role_last_used ->
  ?tags:tag_list_type ->
  ?permissions_boundary:attached_permissions_boundary ->
  ?attached_managed_policies:attached_policies_list_type ->
  ?role_policy_list:policy_detail_list_type ->
  ?instance_profile_list:instance_profile_list_type ->
  ?assume_role_policy_document:policy_document_type ->
  ?create_date:date_type ->
  ?arn:arn_type ->
  ?role_id:id_type ->
  ?role_name:role_name_type ->
  ?path:path_type ->
  unit ->
  role_detail

val make_saml_private_key :
  ?timestamp:date_type -> ?key_id:private_key_id_type -> unit -> saml_private_key

val make_policy_parameter :
  ?type_:policy_parameter_type_enum ->
  ?values:policy_parameter_values_list_type ->
  ?name:policy_parameter_name_type ->
  unit ->
  policy_parameter

val make_policy :
  ?tags:tag_list_type ->
  ?update_date:date_type ->
  ?create_date:date_type ->
  ?description:policy_description_type ->
  ?is_attachable:boolean_type ->
  ?permissions_boundary_usage_count:attachment_count_type ->
  ?attachment_count:attachment_count_type ->
  ?default_version_id:policy_version_id_type ->
  ?path:policy_path_type ->
  ?arn:arn_type ->
  ?policy_id:id_type ->
  ?policy_name:policy_name_type ->
  unit ->
  policy

val make_policy_granting_service_access :
  ?entity_name:entity_name_type ->
  ?entity_type:policy_owner_entity_type ->
  ?policy_arn:arn_type ->
  policy_type:policy_type ->
  policy_name:policy_name_type ->
  unit ->
  policy_granting_service_access

val make_policy_version :
  ?create_date:date_type ->
  ?is_default_version:boolean_type ->
  ?version_id:policy_version_id_type ->
  ?document:policy_document_type ->
  unit ->
  policy_version

val make_mfa_device :
  enable_date:date_type ->
  serial_number:serial_number_type ->
  user_name:user_name_type ->
  unit ->
  mfa_device

val make_list_policies_granting_service_access_entry :
  ?policies:policy_granting_service_access_list_type ->
  ?service_namespace:service_namespace_type ->
  unit ->
  list_policies_granting_service_access_entry

val make_group :
  create_date:date_type ->
  arn:arn_type ->
  group_id:id_type ->
  group_name:group_name_type ->
  path:path_type ->
  unit ->
  group

val make_group_detail :
  ?attached_managed_policies:attached_policies_list_type ->
  ?group_policy_list:policy_detail_list_type ->
  ?create_date:date_type ->
  ?arn:arn_type ->
  ?group_id:id_type ->
  ?group_name:group_name_type ->
  ?path:path_type ->
  unit ->
  group_detail

val make_entity_info :
  ?path:path_type ->
  id:id_type ->
  type_:policy_owner_entity_type ->
  name:user_name_type ->
  arn:arn_type ->
  unit ->
  entity_info

val make_entity_details :
  ?last_authenticated:date_type -> entity_info:entity_info -> unit -> entity_details

val make_delegation_permission :
  ?parameters:policy_parameter_list_type ->
  ?policy_template_arn:arn_type ->
  unit ->
  delegation_permission

val make_delegation_request :
  ?updated_time:date_type ->
  ?only_send_by_owner:boolean_type ->
  ?rejection_reason:notes_type ->
  ?notes:notes_type ->
  ?redirect_url:redirect_url_type ->
  ?session_duration:session_duration_type ->
  ?create_date:date_type ->
  ?requestor_name:requestor_name_type ->
  ?requestor_id:account_id_type ->
  ?expiration_time:date_type ->
  ?state:state_type ->
  ?approver_id:arn_type ->
  ?owner_id:owner_id_type ->
  ?role_permission_restriction_arns:role_permission_restriction_arn_list_type ->
  ?permission_policy:permission_type ->
  ?permissions:delegation_permission ->
  ?request_message:request_message_type ->
  ?description:delegation_request_description_type ->
  ?owner_account_id:account_id_type ->
  ?delegation_request_id:delegation_request_id_type ->
  unit ->
  delegation_request

val make_signing_certificate :
  ?upload_date:date_type ->
  status:status_type ->
  certificate_body:certificate_body_type ->
  certificate_id:certificate_id_type ->
  user_name:user_name_type ->
  unit ->
  signing_certificate

val make_access_key_metadata :
  ?create_date:date_type ->
  ?status:status_type ->
  ?access_key_id:access_key_id_type ->
  ?user_name:user_name_type ->
  unit ->
  access_key_metadata

val make_upload_signing_certificate_response :
  certificate:signing_certificate -> unit -> upload_signing_certificate_response

val make_upload_signing_certificate_request :
  ?user_name:existing_user_name_type ->
  certificate_body:certificate_body_type ->
  unit ->
  upload_signing_certificate_request

val make_upload_server_certificate_response :
  ?tags:tag_list_type ->
  ?server_certificate_metadata:server_certificate_metadata ->
  unit ->
  upload_server_certificate_response

val make_upload_server_certificate_request :
  ?tags:tag_list_type ->
  ?certificate_chain:certificate_chain_type ->
  ?path:path_type ->
  private_key:private_key_type ->
  certificate_body:certificate_body_type ->
  server_certificate_name:server_certificate_name_type ->
  unit ->
  upload_server_certificate_request

val make_ssh_public_key :
  ?upload_date:date_type ->
  status:status_type ->
  ssh_public_key_body:public_key_material_type ->
  fingerprint:public_key_fingerprint_type ->
  ssh_public_key_id:public_key_id_type ->
  user_name:user_name_type ->
  unit ->
  ssh_public_key

val make_upload_ssh_public_key_response :
  ?ssh_public_key:ssh_public_key -> unit -> upload_ssh_public_key_response

val make_upload_ssh_public_key_request :
  ssh_public_key_body:public_key_material_type ->
  user_name:user_name_type ->
  unit ->
  upload_ssh_public_key_request

val make_update_user_request :
  ?new_user_name:user_name_type ->
  ?new_path:path_type ->
  user_name:existing_user_name_type ->
  unit ->
  update_user_request

val make_update_signing_certificate_request :
  ?user_name:existing_user_name_type ->
  status:status_type ->
  certificate_id:certificate_id_type ->
  unit ->
  update_signing_certificate_request

val make_update_service_specific_credential_request :
  ?user_name:user_name_type ->
  status:status_type ->
  service_specific_credential_id:service_specific_credential_id ->
  unit ->
  update_service_specific_credential_request

val make_update_server_certificate_request :
  ?new_server_certificate_name:server_certificate_name_type ->
  ?new_path:path_type ->
  server_certificate_name:server_certificate_name_type ->
  unit ->
  update_server_certificate_request

val make_update_ssh_public_key_request :
  status:status_type ->
  ssh_public_key_id:public_key_id_type ->
  user_name:user_name_type ->
  unit ->
  update_ssh_public_key_request

val make_update_saml_provider_response :
  ?saml_provider_arn:arn_type -> unit -> update_saml_provider_response

val make_update_saml_provider_request :
  ?remove_private_key:private_key_id_type ->
  ?add_private_key:private_key_type ->
  ?assertion_encryption_mode:assertion_encryption_mode_type ->
  ?saml_metadata_document:saml_metadata_document_type ->
  saml_provider_arn:arn_type ->
  unit ->
  update_saml_provider_request

val make_update_role_response : unit -> unit

val make_update_role_request :
  ?max_session_duration:role_max_session_duration_type ->
  ?description:role_description_type ->
  role_name:role_name_type ->
  unit ->
  update_role_request

val make_update_role_description_response : ?role:role -> unit -> update_role_description_response

val make_update_role_description_request :
  description:role_description_type ->
  role_name:role_name_type ->
  unit ->
  update_role_description_request

val make_update_open_id_connect_provider_thumbprint_request :
  thumbprint_list:thumbprint_list_type ->
  open_id_connect_provider_arn:arn_type ->
  unit ->
  update_open_id_connect_provider_thumbprint_request

val make_update_login_profile_request :
  ?password_reset_required:boolean_object_type ->
  ?password:password_type ->
  user_name:user_name_type ->
  unit ->
  update_login_profile_request

val make_update_group_request :
  ?new_group_name:group_name_type ->
  ?new_path:path_type ->
  group_name:group_name_type ->
  unit ->
  update_group_request

val make_update_delegation_request_request :
  ?notes:notes_type ->
  delegation_request_id:delegation_request_id_type ->
  unit ->
  update_delegation_request_request

val make_update_assume_role_policy_request :
  policy_document:policy_document_type ->
  role_name:role_name_type ->
  unit ->
  update_assume_role_policy_request

val make_update_account_password_policy_request :
  ?hard_expiry:boolean_object_type ->
  ?password_reuse_prevention:password_reuse_prevention_type ->
  ?max_password_age:max_password_age_type ->
  ?allow_users_to_change_password:boolean_type ->
  ?require_lowercase_characters:boolean_type ->
  ?require_uppercase_characters:boolean_type ->
  ?require_numbers:boolean_type ->
  ?require_symbols:boolean_type ->
  ?minimum_password_length:minimum_password_length_type ->
  unit ->
  update_account_password_policy_request

val make_update_access_key_request :
  ?user_name:existing_user_name_type ->
  status:status_type ->
  access_key_id:access_key_id_type ->
  unit ->
  update_access_key_request

val make_untag_user_request :
  tag_keys:tag_key_list_type -> user_name:existing_user_name_type -> unit -> untag_user_request

val make_untag_server_certificate_request :
  tag_keys:tag_key_list_type ->
  server_certificate_name:server_certificate_name_type ->
  unit ->
  untag_server_certificate_request

val make_untag_saml_provider_request :
  tag_keys:tag_key_list_type -> saml_provider_arn:arn_type -> unit -> untag_saml_provider_request

val make_untag_role_request :
  tag_keys:tag_key_list_type -> role_name:role_name_type -> unit -> untag_role_request

val make_untag_policy_request :
  tag_keys:tag_key_list_type -> policy_arn:arn_type -> unit -> untag_policy_request

val make_untag_open_id_connect_provider_request :
  tag_keys:tag_key_list_type ->
  open_id_connect_provider_arn:arn_type ->
  unit ->
  untag_open_id_connect_provider_request

val make_untag_mfa_device_request :
  tag_keys:tag_key_list_type -> serial_number:serial_number_type -> unit -> untag_mfa_device_request

val make_untag_instance_profile_request :
  tag_keys:tag_key_list_type ->
  instance_profile_name:instance_profile_name_type ->
  unit ->
  untag_instance_profile_request

val make_tracked_action_last_accessed :
  ?last_accessed_region:string_type ->
  ?last_accessed_time:date_type ->
  ?last_accessed_entity:arn_type ->
  ?action_name:string_type ->
  unit ->
  tracked_action_last_accessed

val make_tag_user_request :
  tags:tag_list_type -> user_name:existing_user_name_type -> unit -> tag_user_request

val make_tag_server_certificate_request :
  tags:tag_list_type ->
  server_certificate_name:server_certificate_name_type ->
  unit ->
  tag_server_certificate_request

val make_tag_saml_provider_request :
  tags:tag_list_type -> saml_provider_arn:arn_type -> unit -> tag_saml_provider_request

val make_tag_role_request :
  tags:tag_list_type -> role_name:role_name_type -> unit -> tag_role_request

val make_tag_policy_request :
  tags:tag_list_type -> policy_arn:arn_type -> unit -> tag_policy_request

val make_tag_open_id_connect_provider_request :
  tags:tag_list_type ->
  open_id_connect_provider_arn:arn_type ->
  unit ->
  tag_open_id_connect_provider_request

val make_tag_mfa_device_request :
  tags:tag_list_type -> serial_number:serial_number_type -> unit -> tag_mfa_device_request

val make_tag_instance_profile_request :
  tags:tag_list_type ->
  instance_profile_name:instance_profile_name_type ->
  unit ->
  tag_instance_profile_request

val make_position : ?column:column_number -> ?line:line_number -> unit -> position

val make_statement :
  ?end_position:position ->
  ?start_position:position ->
  ?source_policy_type:policy_source_type ->
  ?source_policy_id:policy_identifier_type ->
  unit ->
  statement

val make_context_entry :
  ?context_key_type:context_key_type_enum ->
  ?context_key_values:context_key_value_list_type ->
  ?context_key_name:context_key_name_type ->
  unit ->
  context_entry

val make_simulate_principal_policy_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  ?resource_handling_option:resource_handling_option_type ->
  ?context_entries:context_entry_list_type ->
  ?caller_arn:resource_name_type ->
  ?resource_owner:resource_name_type ->
  ?resource_policy:policy_document_type ->
  ?resource_arns:resource_name_list_type ->
  ?permissions_boundary_policy_input_list:simulation_policy_list_type ->
  ?policy_input_list:simulation_policy_list_type ->
  action_names:action_name_list_type ->
  policy_source_arn:arn_type ->
  unit ->
  simulate_principal_policy_request

val make_organizations_decision_detail :
  ?allowed_by_organizations:boolean_type -> unit -> organizations_decision_detail

val make_permissions_boundary_decision_detail :
  ?allowed_by_permissions_boundary:boolean_type -> unit -> permissions_boundary_decision_detail

val make_simulate_policy_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  ?evaluation_results:evaluation_results_list_type ->
  unit ->
  simulate_policy_response

val make_simulate_custom_policy_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  ?resource_handling_option:resource_handling_option_type ->
  ?context_entries:context_entry_list_type ->
  ?caller_arn:resource_name_type ->
  ?resource_owner:resource_name_type ->
  ?resource_policy:policy_document_type ->
  ?resource_arns:resource_name_list_type ->
  ?permissions_boundary_policy_input_list:simulation_policy_list_type ->
  action_names:action_name_list_type ->
  policy_input_list:simulation_policy_list_type ->
  unit ->
  simulate_custom_policy_request

val make_set_security_token_service_preferences_request :
  global_endpoint_token_version:global_endpoint_token_version ->
  unit ->
  set_security_token_service_preferences_request

val make_set_default_policy_version_request :
  version_id:policy_version_id_type ->
  policy_arn:arn_type ->
  unit ->
  set_default_policy_version_request

val make_service_last_accessed :
  ?tracked_actions_last_accessed:tracked_actions_last_accessed ->
  ?total_authenticated_entities:integer_type ->
  ?last_authenticated_region:string_type ->
  ?last_authenticated_entity:arn_type ->
  ?last_authenticated:date_type ->
  service_namespace:service_namespace_type ->
  service_name:service_name_type ->
  unit ->
  service_last_accessed

val make_service_specific_credential_metadata :
  ?expiration_date:date_type ->
  ?service_credential_alias:service_credential_alias ->
  ?service_user_name:service_user_name ->
  service_name:service_name ->
  service_specific_credential_id:service_specific_credential_id ->
  create_date:date_type ->
  status:status_type ->
  user_name:user_name_type ->
  unit ->
  service_specific_credential_metadata

val make_service_specific_credential :
  ?service_credential_secret:service_credential_secret ->
  ?service_credential_alias:service_credential_alias ->
  ?service_password:service_password ->
  ?service_user_name:service_user_name ->
  ?expiration_date:date_type ->
  status:status_type ->
  user_name:user_name_type ->
  service_specific_credential_id:service_specific_credential_id ->
  service_name:service_name ->
  create_date:date_type ->
  unit ->
  service_specific_credential

val make_server_certificate :
  ?tags:tag_list_type ->
  ?certificate_chain:certificate_chain_type ->
  certificate_body:certificate_body_type ->
  server_certificate_metadata:server_certificate_metadata ->
  unit ->
  server_certificate

val make_send_delegation_token_request :
  delegation_request_id:delegation_request_id_type -> unit -> send_delegation_token_request

val make_ssh_public_key_metadata :
  upload_date:date_type ->
  status:status_type ->
  ssh_public_key_id:public_key_id_type ->
  user_name:user_name_type ->
  unit ->
  ssh_public_key_metadata

val make_saml_provider_list_entry :
  ?create_date:date_type ->
  ?valid_until:date_type ->
  ?arn:arn_type ->
  unit ->
  saml_provider_list_entry

val make_role_usage_type :
  ?resources:arn_list_type -> ?region:region_name_type -> unit -> role_usage_type

val make_resync_mfa_device_request :
  authentication_code2:authentication_code_type ->
  authentication_code1:authentication_code_type ->
  serial_number:serial_number_type ->
  user_name:existing_user_name_type ->
  unit ->
  resync_mfa_device_request

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
  user_name:existing_user_name_type ->
  group_name:group_name_type ->
  unit ->
  remove_user_from_group_request

val make_remove_role_from_instance_profile_request :
  role_name:role_name_type ->
  instance_profile_name:instance_profile_name_type ->
  unit ->
  remove_role_from_instance_profile_request

val make_remove_client_id_from_open_id_connect_provider_request :
  client_i_d:client_id_type ->
  open_id_connect_provider_arn:arn_type ->
  unit ->
  remove_client_id_from_open_id_connect_provider_request

val make_reject_delegation_request_request :
  ?notes:notes_type ->
  delegation_request_id:delegation_request_id_type ->
  unit ->
  reject_delegation_request_request

val make_put_user_policy_request :
  policy_document:policy_document_type ->
  policy_name:policy_name_type ->
  user_name:existing_user_name_type ->
  unit ->
  put_user_policy_request

val make_put_user_permissions_boundary_request :
  permissions_boundary:arn_type ->
  user_name:user_name_type ->
  unit ->
  put_user_permissions_boundary_request

val make_put_role_policy_request :
  policy_document:policy_document_type ->
  policy_name:policy_name_type ->
  role_name:role_name_type ->
  unit ->
  put_role_policy_request

val make_put_role_permissions_boundary_request :
  permissions_boundary:arn_type ->
  role_name:role_name_type ->
  unit ->
  put_role_permissions_boundary_request

val make_put_group_policy_request :
  policy_document:policy_document_type ->
  policy_name:policy_name_type ->
  group_name:group_name_type ->
  unit ->
  put_group_policy_request

val make_policy_user : ?user_id:id_type -> ?user_name:user_name_type -> unit -> policy_user
val make_policy_role : ?role_id:id_type -> ?role_name:role_name_type -> unit -> policy_role
val make_policy_group : ?group_id:id_type -> ?group_name:group_name_type -> unit -> policy_group

val make_password_policy :
  ?hard_expiry:boolean_object_type ->
  ?password_reuse_prevention:password_reuse_prevention_type ->
  ?max_password_age:max_password_age_type ->
  ?expire_passwords:boolean_type ->
  ?allow_users_to_change_password:boolean_type ->
  ?require_lowercase_characters:boolean_type ->
  ?require_uppercase_characters:boolean_type ->
  ?require_numbers:boolean_type ->
  ?require_symbols:boolean_type ->
  ?minimum_password_length:minimum_password_length_type ->
  unit ->
  password_policy

val make_open_id_connect_provider_list_entry :
  ?arn:arn_type -> unit -> open_id_connect_provider_list_entry

val make_managed_policy_detail :
  ?policy_version_list:policy_document_version_list_type ->
  ?update_date:date_type ->
  ?create_date:date_type ->
  ?description:policy_description_type ->
  ?is_attachable:boolean_type ->
  ?permissions_boundary_usage_count:attachment_count_type ->
  ?attachment_count:attachment_count_type ->
  ?default_version_id:policy_version_id_type ->
  ?path:policy_path_type ->
  ?arn:arn_type ->
  ?policy_id:id_type ->
  ?policy_name:policy_name_type ->
  unit ->
  managed_policy_detail

val make_login_profile :
  ?password_reset_required:boolean_type ->
  create_date:date_type ->
  user_name:user_name_type ->
  unit ->
  login_profile

val make_list_virtual_mfa_devices_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  virtual_mfa_devices:virtual_mfa_device_list_type ->
  unit ->
  list_virtual_mfa_devices_response

val make_list_virtual_mfa_devices_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?assignment_status:assignment_status_type ->
  unit ->
  list_virtual_mfa_devices_request

val make_list_users_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  users:user_list_type ->
  unit ->
  list_users_response

val make_list_users_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?path_prefix:path_prefix_type ->
  unit ->
  list_users_request

val make_list_user_tags_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  tags:tag_list_type ->
  unit ->
  list_user_tags_response

val make_list_user_tags_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  user_name:existing_user_name_type ->
  unit ->
  list_user_tags_request

val make_list_user_policies_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  policy_names:policy_name_list_type ->
  unit ->
  list_user_policies_response

val make_list_user_policies_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  user_name:existing_user_name_type ->
  unit ->
  list_user_policies_request

val make_list_signing_certificates_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  certificates:certificate_list_type ->
  unit ->
  list_signing_certificates_response

val make_list_signing_certificates_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?user_name:existing_user_name_type ->
  unit ->
  list_signing_certificates_request

val make_list_service_specific_credentials_response :
  ?is_truncated:boolean_type ->
  ?marker:response_marker_type ->
  ?service_specific_credentials:service_specific_credentials_list_type ->
  unit ->
  list_service_specific_credentials_response

val make_list_service_specific_credentials_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?all_users:all_users ->
  ?service_name:service_name ->
  ?user_name:user_name_type ->
  unit ->
  list_service_specific_credentials_request

val make_list_server_certificates_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  server_certificate_metadata_list:server_certificate_metadata_list_type ->
  unit ->
  list_server_certificates_response

val make_list_server_certificates_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?path_prefix:path_prefix_type ->
  unit ->
  list_server_certificates_request

val make_list_server_certificate_tags_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  tags:tag_list_type ->
  unit ->
  list_server_certificate_tags_response

val make_list_server_certificate_tags_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  server_certificate_name:server_certificate_name_type ->
  unit ->
  list_server_certificate_tags_request

val make_list_ssh_public_keys_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  ?ssh_public_keys:ssh_public_key_list_type ->
  unit ->
  list_ssh_public_keys_response

val make_list_ssh_public_keys_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?user_name:user_name_type ->
  unit ->
  list_ssh_public_keys_request

val make_list_saml_providers_response :
  ?saml_provider_list:saml_provider_list_type -> unit -> list_saml_providers_response

val make_list_saml_providers_request : unit -> unit

val make_list_saml_provider_tags_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  tags:tag_list_type ->
  unit ->
  list_saml_provider_tags_response

val make_list_saml_provider_tags_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  saml_provider_arn:arn_type ->
  unit ->
  list_saml_provider_tags_request

val make_list_roles_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  roles:role_list_type ->
  unit ->
  list_roles_response

val make_list_roles_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?path_prefix:path_prefix_type ->
  unit ->
  list_roles_request

val make_list_role_tags_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  tags:tag_list_type ->
  unit ->
  list_role_tags_response

val make_list_role_tags_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  role_name:role_name_type ->
  unit ->
  list_role_tags_request

val make_list_role_policies_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  policy_names:policy_name_list_type ->
  unit ->
  list_role_policies_response

val make_list_role_policies_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  role_name:role_name_type ->
  unit ->
  list_role_policies_request

val make_list_policy_versions_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  ?versions:policy_document_version_list_type ->
  unit ->
  list_policy_versions_response

val make_list_policy_versions_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  policy_arn:arn_type ->
  unit ->
  list_policy_versions_request

val make_list_policy_tags_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  tags:tag_list_type ->
  unit ->
  list_policy_tags_response

val make_list_policy_tags_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  policy_arn:arn_type ->
  unit ->
  list_policy_tags_request

val make_list_policies_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  ?policies:policy_list_type ->
  unit ->
  list_policies_response

val make_list_policies_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?policy_usage_filter:policy_usage_type ->
  ?path_prefix:policy_path_type ->
  ?only_attached:boolean_type ->
  ?scope:policy_scope_type ->
  unit ->
  list_policies_request

val make_list_policies_granting_service_access_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  policies_granting_service_access:list_policy_granting_service_access_response_list_type ->
  unit ->
  list_policies_granting_service_access_response

val make_list_policies_granting_service_access_request :
  ?marker:marker_type ->
  service_namespaces:service_namespace_list_type ->
  arn:arn_type ->
  unit ->
  list_policies_granting_service_access_request

val make_list_organizations_features_response :
  ?enabled_features:features_list_type ->
  ?organization_id:organization_id_type ->
  unit ->
  list_organizations_features_response

val make_list_organizations_features_request : unit -> unit

val make_list_open_id_connect_providers_response :
  ?open_id_connect_provider_list:open_id_connect_provider_list_type ->
  unit ->
  list_open_id_connect_providers_response

val make_list_open_id_connect_providers_request : unit -> unit

val make_list_open_id_connect_provider_tags_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  tags:tag_list_type ->
  unit ->
  list_open_id_connect_provider_tags_response

val make_list_open_id_connect_provider_tags_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  open_id_connect_provider_arn:arn_type ->
  unit ->
  list_open_id_connect_provider_tags_request

val make_list_mfa_devices_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  mfa_devices:mfa_device_list_type ->
  unit ->
  list_mfa_devices_response

val make_list_mfa_devices_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?user_name:existing_user_name_type ->
  unit ->
  list_mfa_devices_request

val make_list_mfa_device_tags_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  tags:tag_list_type ->
  unit ->
  list_mfa_device_tags_response

val make_list_mfa_device_tags_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  serial_number:serial_number_type ->
  unit ->
  list_mfa_device_tags_request

val make_list_instance_profiles_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  instance_profiles:instance_profile_list_type ->
  unit ->
  list_instance_profiles_response

val make_list_instance_profiles_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?path_prefix:path_prefix_type ->
  unit ->
  list_instance_profiles_request

val make_list_instance_profiles_for_role_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  instance_profiles:instance_profile_list_type ->
  unit ->
  list_instance_profiles_for_role_response

val make_list_instance_profiles_for_role_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  role_name:role_name_type ->
  unit ->
  list_instance_profiles_for_role_request

val make_list_instance_profile_tags_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  tags:tag_list_type ->
  unit ->
  list_instance_profile_tags_response

val make_list_instance_profile_tags_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  instance_profile_name:instance_profile_name_type ->
  unit ->
  list_instance_profile_tags_request

val make_list_groups_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  groups:group_list_type ->
  unit ->
  list_groups_response

val make_list_groups_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?path_prefix:path_prefix_type ->
  unit ->
  list_groups_request

val make_list_groups_for_user_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  groups:group_list_type ->
  unit ->
  list_groups_for_user_response

val make_list_groups_for_user_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  user_name:existing_user_name_type ->
  unit ->
  list_groups_for_user_request

val make_list_group_policies_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  policy_names:policy_name_list_type ->
  unit ->
  list_group_policies_response

val make_list_group_policies_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  group_name:group_name_type ->
  unit ->
  list_group_policies_request

val make_list_entities_for_policy_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  ?policy_roles:policy_role_list_type ->
  ?policy_users:policy_user_list_type ->
  ?policy_groups:policy_group_list_type ->
  unit ->
  list_entities_for_policy_response

val make_list_entities_for_policy_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?policy_usage_filter:policy_usage_type ->
  ?path_prefix:path_type ->
  ?entity_filter:entity_type ->
  policy_arn:arn_type ->
  unit ->
  list_entities_for_policy_request

val make_list_delegation_requests_response :
  ?is_truncated:boolean_type ->
  ?marker:marker_type ->
  ?delegation_requests:delegation_requests_list_type ->
  unit ->
  list_delegation_requests_response

val make_list_delegation_requests_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?owner_id:owner_id_type ->
  unit ->
  list_delegation_requests_request

val make_list_attached_user_policies_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  ?attached_policies:attached_policies_list_type ->
  unit ->
  list_attached_user_policies_response

val make_list_attached_user_policies_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?path_prefix:policy_path_type ->
  user_name:user_name_type ->
  unit ->
  list_attached_user_policies_request

val make_list_attached_role_policies_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  ?attached_policies:attached_policies_list_type ->
  unit ->
  list_attached_role_policies_response

val make_list_attached_role_policies_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?path_prefix:policy_path_type ->
  role_name:role_name_type ->
  unit ->
  list_attached_role_policies_request

val make_list_attached_group_policies_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  ?attached_policies:attached_policies_list_type ->
  unit ->
  list_attached_group_policies_response

val make_list_attached_group_policies_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?path_prefix:policy_path_type ->
  group_name:group_name_type ->
  unit ->
  list_attached_group_policies_request

val make_list_account_aliases_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  account_aliases:account_alias_list_type ->
  unit ->
  list_account_aliases_response

val make_list_account_aliases_request :
  ?max_items:max_items_type -> ?marker:marker_type -> unit -> list_account_aliases_request

val make_list_access_keys_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  access_key_metadata:access_key_metadata_list_type ->
  unit ->
  list_access_keys_response

val make_list_access_keys_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  ?user_name:existing_user_name_type ->
  unit ->
  list_access_keys_request

val make_get_user_response : user:user -> unit -> get_user_response
val make_get_user_request : ?user_name:existing_user_name_type -> unit -> get_user_request

val make_get_user_policy_response :
  policy_document:policy_document_type ->
  policy_name:policy_name_type ->
  user_name:existing_user_name_type ->
  unit ->
  get_user_policy_response

val make_get_user_policy_request :
  policy_name:policy_name_type ->
  user_name:existing_user_name_type ->
  unit ->
  get_user_policy_request

val make_deletion_task_failure_reason_type :
  ?role_usage_list:role_usage_list_type ->
  ?reason:reason_type ->
  unit ->
  deletion_task_failure_reason_type

val make_get_service_linked_role_deletion_status_response :
  ?reason:deletion_task_failure_reason_type ->
  status:deletion_task_status_type ->
  unit ->
  get_service_linked_role_deletion_status_response

val make_get_service_linked_role_deletion_status_request :
  deletion_task_id:deletion_task_id_type -> unit -> get_service_linked_role_deletion_status_request

val make_error_details : code:string_type -> message:string_type -> unit -> error_details

val make_get_service_last_accessed_details_with_entities_response :
  ?error:error_details ->
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  entity_details_list:entity_details_list_type ->
  job_completion_date:date_type ->
  job_creation_date:date_type ->
  job_status:job_status_type ->
  unit ->
  get_service_last_accessed_details_with_entities_response

val make_get_service_last_accessed_details_with_entities_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  service_namespace:service_namespace_type ->
  job_id:job_id_type ->
  unit ->
  get_service_last_accessed_details_with_entities_request

val make_get_service_last_accessed_details_response :
  ?error:error_details ->
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  ?job_type:access_advisor_usage_granularity_type ->
  job_completion_date:date_type ->
  services_last_accessed:services_last_accessed ->
  job_creation_date:date_type ->
  job_status:job_status_type ->
  unit ->
  get_service_last_accessed_details_response

val make_get_service_last_accessed_details_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  job_id:job_id_type ->
  unit ->
  get_service_last_accessed_details_request

val make_get_server_certificate_response :
  server_certificate:server_certificate -> unit -> get_server_certificate_response

val make_get_server_certificate_request :
  server_certificate_name:server_certificate_name_type -> unit -> get_server_certificate_request

val make_get_ssh_public_key_response :
  ?ssh_public_key:ssh_public_key -> unit -> get_ssh_public_key_response

val make_get_ssh_public_key_request :
  encoding:encoding_type ->
  ssh_public_key_id:public_key_id_type ->
  user_name:user_name_type ->
  unit ->
  get_ssh_public_key_request

val make_get_saml_provider_response :
  ?private_key_list:private_key_list ->
  ?assertion_encryption_mode:assertion_encryption_mode_type ->
  ?tags:tag_list_type ->
  ?valid_until:date_type ->
  ?create_date:date_type ->
  ?saml_metadata_document:saml_metadata_document_type ->
  ?saml_provider_uui_d:private_key_id_type ->
  unit ->
  get_saml_provider_response

val make_get_saml_provider_request : saml_provider_arn:arn_type -> unit -> get_saml_provider_request
val make_get_role_response : role:role -> unit -> get_role_response
val make_get_role_request : role_name:role_name_type -> unit -> get_role_request

val make_get_role_policy_response :
  policy_document:policy_document_type ->
  policy_name:policy_name_type ->
  role_name:role_name_type ->
  unit ->
  get_role_policy_response

val make_get_role_policy_request :
  policy_name:policy_name_type -> role_name:role_name_type -> unit -> get_role_policy_request

val make_get_policy_version_response :
  ?policy_version:policy_version -> unit -> get_policy_version_response

val make_get_policy_version_request :
  version_id:policy_version_id_type -> policy_arn:arn_type -> unit -> get_policy_version_request

val make_get_policy_response : ?policy:policy -> unit -> get_policy_response
val make_get_policy_request : policy_arn:arn_type -> unit -> get_policy_request

val make_get_outbound_web_identity_federation_info_response :
  ?jwt_vending_enabled:boolean_type ->
  ?issuer_identifier:string_type ->
  unit ->
  get_outbound_web_identity_federation_info_response

val make_access_detail :
  ?total_authenticated_entities:integer_type ->
  ?last_authenticated_time:date_type ->
  ?entity_path:organizations_entity_path_type ->
  ?region:string_type ->
  service_namespace:service_namespace_type ->
  service_name:service_name_type ->
  unit ->
  access_detail

val make_get_organizations_access_report_response :
  ?error_details:error_details ->
  ?marker:marker_type ->
  ?is_truncated:boolean_type ->
  ?access_details:access_details ->
  ?number_of_services_not_accessed:integer_type ->
  ?number_of_services_accessible:integer_type ->
  ?job_completion_date:date_type ->
  job_creation_date:date_type ->
  job_status:job_status_type ->
  unit ->
  get_organizations_access_report_response

val make_get_organizations_access_report_request :
  ?sort_key:sort_key_type ->
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  job_id:job_id_type ->
  unit ->
  get_organizations_access_report_request

val make_get_open_id_connect_provider_response :
  ?tags:tag_list_type ->
  ?create_date:date_type ->
  ?thumbprint_list:thumbprint_list_type ->
  ?client_id_list:client_id_list_type ->
  ?url:open_id_connect_provider_url_type ->
  unit ->
  get_open_id_connect_provider_response

val make_get_open_id_connect_provider_request :
  open_id_connect_provider_arn:arn_type -> unit -> get_open_id_connect_provider_request

val make_get_mfa_device_response :
  ?certifications:certification_map_type ->
  ?enable_date:date_type ->
  ?user_name:user_name_type ->
  serial_number:serial_number_type ->
  unit ->
  get_mfa_device_response

val make_get_mfa_device_request :
  ?user_name:user_name_type -> serial_number:serial_number_type -> unit -> get_mfa_device_request

val make_get_login_profile_response :
  login_profile:login_profile -> unit -> get_login_profile_response

val make_get_login_profile_request : ?user_name:user_name_type -> unit -> get_login_profile_request

val make_get_instance_profile_response :
  instance_profile:instance_profile -> unit -> get_instance_profile_response

val make_get_instance_profile_request :
  instance_profile_name:instance_profile_name_type -> unit -> get_instance_profile_request

val make_get_human_readable_summary_response :
  ?summary_state:summary_state_type ->
  ?locale:locale_type ->
  ?summary_content:summary_content_type ->
  unit ->
  get_human_readable_summary_response

val make_get_human_readable_summary_request :
  ?locale:locale_type -> entity_arn:arn_type -> unit -> get_human_readable_summary_request

val make_get_group_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  users:user_list_type ->
  group:group ->
  unit ->
  get_group_response

val make_get_group_request :
  ?max_items:max_items_type ->
  ?marker:marker_type ->
  group_name:group_name_type ->
  unit ->
  get_group_request

val make_get_group_policy_response :
  policy_document:policy_document_type ->
  policy_name:policy_name_type ->
  group_name:group_name_type ->
  unit ->
  get_group_policy_response

val make_get_group_policy_request :
  policy_name:policy_name_type -> group_name:group_name_type -> unit -> get_group_policy_request

val make_get_delegation_request_response :
  ?permission_check_result:permission_check_result_type ->
  ?permission_check_status:permission_check_status_type ->
  ?delegation_request:delegation_request ->
  unit ->
  get_delegation_request_response

val make_get_delegation_request_request :
  ?delegation_permission_check:boolean_type ->
  delegation_request_id:delegation_request_id_type ->
  unit ->
  get_delegation_request_request

val make_get_credential_report_response :
  ?generated_time:date_type ->
  ?report_format:report_format_type ->
  ?content:report_content_type ->
  unit ->
  get_credential_report_response

val make_get_context_keys_for_principal_policy_request :
  ?policy_input_list:simulation_policy_list_type ->
  policy_source_arn:arn_type ->
  unit ->
  get_context_keys_for_principal_policy_request

val make_get_context_keys_for_policy_response :
  ?context_key_names:context_key_names_result_list_type ->
  unit ->
  get_context_keys_for_policy_response

val make_get_context_keys_for_custom_policy_request :
  policy_input_list:simulation_policy_list_type ->
  unit ->
  get_context_keys_for_custom_policy_request

val make_get_account_summary_response :
  ?summary_map:summary_map_type -> unit -> get_account_summary_response

val make_get_account_password_policy_response :
  password_policy:password_policy -> unit -> get_account_password_policy_response

val make_get_account_authorization_details_response :
  ?marker:response_marker_type ->
  ?is_truncated:boolean_type ->
  ?policies:managed_policy_detail_list_type ->
  ?role_detail_list:role_detail_list_type ->
  ?group_detail_list:group_detail_list_type ->
  ?user_detail_list:user_detail_list_type ->
  unit ->
  get_account_authorization_details_response

val make_get_account_authorization_details_request :
  ?marker:marker_type ->
  ?max_items:max_items_type ->
  ?filter:entity_list_type ->
  unit ->
  get_account_authorization_details_request

val make_access_key_last_used :
  ?last_used_date:date_type ->
  region:string_type ->
  service_name:string_type ->
  unit ->
  access_key_last_used

val make_get_access_key_last_used_response :
  ?access_key_last_used:access_key_last_used ->
  ?user_name:existing_user_name_type ->
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
  ?description:report_state_description_type ->
  ?state:report_state_type ->
  unit ->
  generate_credential_report_response

val make_enable_outbound_web_identity_federation_response :
  ?issuer_identifier:string_type -> unit -> enable_outbound_web_identity_federation_response

val make_enable_organizations_root_sessions_response :
  ?enabled_features:features_list_type ->
  ?organization_id:organization_id_type ->
  unit ->
  enable_organizations_root_sessions_response

val make_enable_organizations_root_sessions_request : unit -> unit

val make_enable_organizations_root_credentials_management_response :
  ?enabled_features:features_list_type ->
  ?organization_id:organization_id_type ->
  unit ->
  enable_organizations_root_credentials_management_response

val make_enable_organizations_root_credentials_management_request : unit -> unit

val make_enable_mfa_device_request :
  authentication_code2:authentication_code_type ->
  authentication_code1:authentication_code_type ->
  serial_number:serial_number_type ->
  user_name:existing_user_name_type ->
  unit ->
  enable_mfa_device_request

val make_disable_organizations_root_sessions_response :
  ?enabled_features:features_list_type ->
  ?organization_id:organization_id_type ->
  unit ->
  disable_organizations_root_sessions_response

val make_disable_organizations_root_sessions_request : unit -> unit

val make_disable_organizations_root_credentials_management_response :
  ?enabled_features:features_list_type ->
  ?organization_id:organization_id_type ->
  unit ->
  disable_organizations_root_credentials_management_response

val make_disable_organizations_root_credentials_management_request : unit -> unit

val make_detach_user_policy_request :
  policy_arn:arn_type -> user_name:user_name_type -> unit -> detach_user_policy_request

val make_detach_role_policy_request :
  policy_arn:arn_type -> role_name:role_name_type -> unit -> detach_role_policy_request

val make_detach_group_policy_request :
  policy_arn:arn_type -> group_name:group_name_type -> unit -> detach_group_policy_request

val make_delete_virtual_mfa_device_request :
  serial_number:serial_number_type -> unit -> delete_virtual_mfa_device_request

val make_delete_user_request : user_name:existing_user_name_type -> unit -> delete_user_request

val make_delete_user_policy_request :
  policy_name:policy_name_type ->
  user_name:existing_user_name_type ->
  unit ->
  delete_user_policy_request

val make_delete_user_permissions_boundary_request :
  user_name:user_name_type -> unit -> delete_user_permissions_boundary_request

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

val make_delete_ssh_public_key_request :
  ssh_public_key_id:public_key_id_type ->
  user_name:user_name_type ->
  unit ->
  delete_ssh_public_key_request

val make_delete_saml_provider_request :
  saml_provider_arn:arn_type -> unit -> delete_saml_provider_request

val make_delete_role_request : role_name:role_name_type -> unit -> delete_role_request

val make_delete_role_policy_request :
  policy_name:policy_name_type -> role_name:role_name_type -> unit -> delete_role_policy_request

val make_delete_role_permissions_boundary_request :
  role_name:role_name_type -> unit -> delete_role_permissions_boundary_request

val make_delete_policy_version_request :
  version_id:policy_version_id_type -> policy_arn:arn_type -> unit -> delete_policy_version_request

val make_delete_policy_request : policy_arn:arn_type -> unit -> delete_policy_request

val make_delete_open_id_connect_provider_request :
  open_id_connect_provider_arn:arn_type -> unit -> delete_open_id_connect_provider_request

val make_delete_login_profile_request :
  ?user_name:user_name_type -> unit -> delete_login_profile_request

val make_delete_instance_profile_request :
  instance_profile_name:instance_profile_name_type -> unit -> delete_instance_profile_request

val make_delete_group_request : group_name:group_name_type -> unit -> delete_group_request

val make_delete_group_policy_request :
  policy_name:policy_name_type -> group_name:group_name_type -> unit -> delete_group_policy_request

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
  ?tags:tag_list_type ->
  ?path:path_type ->
  virtual_mfa_device_name:virtual_mfa_device_name ->
  unit ->
  create_virtual_mfa_device_request

val make_create_user_response : ?user:user -> unit -> create_user_response

val make_create_user_request :
  ?tags:tag_list_type ->
  ?permissions_boundary:arn_type ->
  ?path:path_type ->
  user_name:user_name_type ->
  unit ->
  create_user_request

val make_create_service_specific_credential_response :
  ?service_specific_credential:service_specific_credential ->
  unit ->
  create_service_specific_credential_response

val make_create_service_specific_credential_request :
  ?credential_age_days:credential_age_days ->
  service_name:service_name ->
  user_name:user_name_type ->
  unit ->
  create_service_specific_credential_request

val make_create_service_linked_role_response :
  ?role:role -> unit -> create_service_linked_role_response

val make_create_service_linked_role_request :
  ?custom_suffix:custom_suffix_type ->
  ?description:role_description_type ->
  aws_service_name:group_name_type ->
  unit ->
  create_service_linked_role_request

val make_create_saml_provider_response :
  ?tags:tag_list_type -> ?saml_provider_arn:arn_type -> unit -> create_saml_provider_response

val make_create_saml_provider_request :
  ?add_private_key:private_key_type ->
  ?assertion_encryption_mode:assertion_encryption_mode_type ->
  ?tags:tag_list_type ->
  name:saml_provider_name_type ->
  saml_metadata_document:saml_metadata_document_type ->
  unit ->
  create_saml_provider_request

val make_create_role_response : role:role -> unit -> create_role_response

val make_create_role_request :
  ?tags:tag_list_type ->
  ?permissions_boundary:arn_type ->
  ?max_session_duration:role_max_session_duration_type ->
  ?description:role_description_type ->
  ?path:path_type ->
  assume_role_policy_document:policy_document_type ->
  role_name:role_name_type ->
  unit ->
  create_role_request

val make_create_policy_version_response :
  ?policy_version:policy_version -> unit -> create_policy_version_response

val make_create_policy_version_request :
  ?set_as_default:boolean_type ->
  policy_document:policy_document_type ->
  policy_arn:arn_type ->
  unit ->
  create_policy_version_request

val make_create_policy_response : ?policy:policy -> unit -> create_policy_response

val make_create_policy_request :
  ?tags:tag_list_type ->
  ?description:policy_description_type ->
  ?path:policy_path_type ->
  policy_document:policy_document_type ->
  policy_name:policy_name_type ->
  unit ->
  create_policy_request

val make_create_open_id_connect_provider_response :
  ?tags:tag_list_type ->
  ?open_id_connect_provider_arn:arn_type ->
  unit ->
  create_open_id_connect_provider_response

val make_create_open_id_connect_provider_request :
  ?tags:tag_list_type ->
  ?thumbprint_list:thumbprint_list_type ->
  ?client_id_list:client_id_list_type ->
  url:open_id_connect_provider_url_type ->
  unit ->
  create_open_id_connect_provider_request

val make_create_login_profile_response :
  login_profile:login_profile -> unit -> create_login_profile_response

val make_create_login_profile_request :
  ?password_reset_required:boolean_type ->
  ?password:password_type ->
  ?user_name:user_name_type ->
  unit ->
  create_login_profile_request

val make_create_instance_profile_response :
  instance_profile:instance_profile -> unit -> create_instance_profile_response

val make_create_instance_profile_request :
  ?tags:tag_list_type ->
  ?path:path_type ->
  instance_profile_name:instance_profile_name_type ->
  unit ->
  create_instance_profile_request

val make_create_group_response : group:group -> unit -> create_group_response

val make_create_group_request :
  ?path:path_type -> group_name:group_name_type -> unit -> create_group_request

val make_create_delegation_request_response :
  ?delegation_request_id:delegation_request_id_type ->
  ?console_deep_link:console_deep_link_type ->
  unit ->
  create_delegation_request_response

val make_create_delegation_request_request :
  ?only_send_by_owner:boolean_type ->
  ?redirect_url:redirect_url_type ->
  ?request_message:request_message_type ->
  ?owner_account_id:account_id_type ->
  session_duration:session_duration_type ->
  notification_channel:notification_channel_type ->
  requestor_workflow_id:requestor_workflow_id_type ->
  permissions:delegation_permission ->
  description:delegation_request_description_type ->
  unit ->
  create_delegation_request_request

val make_create_account_alias_request :
  account_alias:account_alias_type -> unit -> create_account_alias_request

val make_access_key :
  ?create_date:date_type ->
  secret_access_key:access_key_secret_type ->
  status:status_type ->
  access_key_id:access_key_id_type ->
  user_name:user_name_type ->
  unit ->
  access_key

val make_create_access_key_response : access_key:access_key -> unit -> create_access_key_response

val make_create_access_key_request :
  ?user_name:existing_user_name_type -> unit -> create_access_key_request

val make_change_password_request :
  new_password:password_type -> old_password:password_type -> unit -> change_password_request

val make_attach_user_policy_request :
  policy_arn:arn_type -> user_name:user_name_type -> unit -> attach_user_policy_request

val make_attach_role_policy_request :
  policy_arn:arn_type -> role_name:role_name_type -> unit -> attach_role_policy_request

val make_attach_group_policy_request :
  policy_arn:arn_type -> group_name:group_name_type -> unit -> attach_group_policy_request

val make_associate_delegation_request_request :
  delegation_request_id:delegation_request_id_type -> unit -> associate_delegation_request_request

val make_add_user_to_group_request :
  user_name:existing_user_name_type ->
  group_name:group_name_type ->
  unit ->
  add_user_to_group_request

val make_add_role_to_instance_profile_request :
  role_name:role_name_type ->
  instance_profile_name:instance_profile_name_type ->
  unit ->
  add_role_to_instance_profile_request

val make_add_client_id_to_open_id_connect_provider_request :
  client_i_d:client_id_type ->
  open_id_connect_provider_arn:arn_type ->
  unit ->
  add_client_id_to_open_id_connect_provider_request

val make_accept_delegation_request_request :
  delegation_request_id:delegation_request_id_type -> unit -> accept_delegation_request_request
(** {1:operations Operations} *)

module AcceptDelegationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_delegation_request_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_delegation_request_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts a delegation request, granting the requested temporary access.\n\n\
  \ Once the delegation request is accepted, it is eligible to send the exchange token to the \
   partner. The \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_SendDelegationToken.html}SendDelegationToken} \
   API has to be explicitly called to send the delegation token. \n\
  \ \n\
  \  At the time of acceptance, IAM records the details and the state of the identity that called \
   this API. This is the identity that gets mapped to the delegated credential. \n\
  \  \n\
  \   An accepted request may be rejected before the exchange token is sent to the partner.\n\
  \   "]

module AddClientIDToOpenIDConnectProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_client_id_to_open_id_connect_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_client_id_to_open_id_connect_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds a new client ID (also known as audience) to the list of client IDs already registered for \
   the specified IAM OpenID Connect (OIDC) provider resource.\n\n\
  \ This operation is idempotent; it does not fail or return an error if you add an existing \
   client ID to the provider.\n\
  \ "]

module AddRoleToInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception
    | `UnmodifiableEntityException of unmodifiable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_role_to_instance_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_role_to_instance_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds the specified IAM role to the specified instance profile. An instance profile can contain \
   only one role, and this quota cannot be increased. You can remove the existing role and then \
   add a different role to an instance profile. You must then wait for the change to appear across \
   all of Amazon Web Services because of \
   {{:https://en.wikipedia.org/wiki/Eventual_consistency}eventual consistency}. To force the \
   change, you must \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DisassociateIamInstanceProfile.html}disassociate \
   the instance profile} and then \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_AssociateIamInstanceProfile.html}associate \
   the instance profile}, or you can stop your instance and then restart it.\n\n\
  \  The caller of this operation must be granted the [PassRole] permission on the IAM role by a \
   permissions policy.\n\
  \  \n\
  \     When using the \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_iam-condition-keys.html#available-keys-for-iam}iam:AssociatedResourceArn} \
   condition in a policy to restrict the \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html}PassRole} IAM \
   action, special considerations apply if the policy is intended to define access for the \
   [AddRoleToInstanceProfile] action. In this case, you cannot specify a Region or instance ID in \
   the EC2 instance ARN. The ARN value must be [arn:aws:ec2:*:CallerAccountId:instance/*]. Using \
   any other ARN value may lead to unexpected evaluation results.\n\
  \     \n\
  \        For more information about roles, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html}IAM roles} in the {i IAM User \
   Guide}. For more information about instance profiles, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html}Using \
   instance profiles} in the {i IAM User Guide}.\n\
  \       "]

module AddUserToGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_user_to_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_user_to_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds the specified user to the specified group.\n"]

module AssociateDelegationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_delegation_request_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_delegation_request_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a delegation request with the current identity.\n\n\
  \ If the partner that created the delegation request has specified the owner account during \
   creation, only an identity from that owner account can call the [AssociateDelegationRequest] \
   API for the specified delegation request. Once the [AssociateDelegationRequest] API call is \
   successful, the ARN of the current calling identity will be stored as the [ownerId] of the \
   request. \n\
  \ \n\
  \  If the partner that created the delegation request has not specified the owner account during \
   creation, any caller from any account can call the [AssociateDelegationRequest] API for the \
   delegation request. Once this API call is successful, the ARN of the current calling identity \
   will be stored as the [ownerId] and the Amazon Web Services account ID of the current calling \
   identity will be stored as the [ownerAccount] of the request. \n\
  \  \n\
  \    For more details, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-temporary-delegation.html#temporary-delegation-managing-permissions} \
   Managing Permissions for Delegation Requests}. \n\
  \   "]

module AttachGroupPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `PolicyNotAttachableException of policy_not_attachable_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_group_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PolicyNotAttachableException of policy_not_attachable_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_group_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PolicyNotAttachableException of policy_not_attachable_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches the specified managed policy to the specified IAM group.\n\n\
  \ You use this operation to attach a managed policy to a group. To embed an inline policy in a \
   group, use {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_PutGroupPolicy.html} \
   [PutGroupPolicy] }.\n\
  \ \n\
  \  As a best practice, you can validate your IAM policies. To learn more, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_policy-validator.html}Validating \
   IAM policies} in the {i IAM User Guide}.\n\
  \  \n\
  \   For more information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \   "]

module AttachRolePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `PolicyNotAttachableException of policy_not_attachable_exception
    | `ServiceFailureException of service_failure_exception
    | `UnmodifiableEntityException of unmodifiable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_role_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PolicyNotAttachableException of policy_not_attachable_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_role_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PolicyNotAttachableException of policy_not_attachable_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches the specified managed policy to the specified IAM role. When you attach a managed \
   policy to a role, the managed policy becomes part of the role's permission (access) policy.\n\n\
  \  You cannot use a managed policy as the role's trust policy. The role's trust policy is \
   created at the same time as the role, using \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html} [CreateRole] }. You \
   can update a role's trust policy using \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateAssumeRolePolicy.html} \
   [UpdateAssumerolePolicy] }.\n\
  \  \n\
  \    Use this operation to attach a {i managed} policy to a role. To embed an inline policy in a \
   role, use {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_PutRolePolicy.html} \
   [PutRolePolicy] }. For more information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \    \n\
  \     As a best practice, you can validate your IAM policies. To learn more, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_policy-validator.html}Validating \
   IAM policies} in the {i IAM User Guide}.\n\
  \     "]

module AttachUserPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `PolicyNotAttachableException of policy_not_attachable_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_user_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PolicyNotAttachableException of policy_not_attachable_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_user_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PolicyNotAttachableException of policy_not_attachable_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches the specified managed policy to the specified user.\n\n\
  \ You use this operation to attach a {i managed} policy to a user. To embed an inline policy in \
   a user, use {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_PutUserPolicy.html} \
   [PutUserPolicy] }.\n\
  \ \n\
  \  As a best practice, you can validate your IAM policies. To learn more, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_policy-validator.html}Validating \
   IAM policies} in the {i IAM User Guide}.\n\
  \  \n\
  \   For more information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \   "]

module ChangePassword : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
    | `InvalidUserTypeException of invalid_user_type_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `PasswordPolicyViolationException of password_policy_violation_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    change_password_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
      | `InvalidUserTypeException of invalid_user_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PasswordPolicyViolationException of password_policy_violation_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    change_password_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
      | `InvalidUserTypeException of invalid_user_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PasswordPolicyViolationException of password_policy_violation_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Changes the password of the IAM user who is calling this operation. This operation can be \
   performed using the CLI, the Amazon Web Services API, or the {b My Security Credentials} page \
   in the Amazon Web Services Management Console. The Amazon Web Services account root user \
   password is not affected by this operation.\n\n\
  \ Use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateLoginProfile.html}UpdateLoginProfile} \
   to use the CLI, the Amazon Web Services API, or the {b Users} page in the IAM console to change \
   the password for any IAM user. For more information about modifying passwords, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html}Managing \
   passwords} in the {i IAM User Guide}.\n\
  \ "]

module CreateAccessKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_access_key_request ->
    ( create_access_key_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_access_key_request ->
    ( create_access_key_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Creates a new Amazon Web Services secret access key and corresponding Amazon Web Services \
   access key ID for the specified user. The default status for new keys is [Active].\n\n\
  \ If you do not specify a user name, IAM determines the user name implicitly based on the Amazon \
   Web Services access key ID signing the request. This operation works for access keys under the \
   Amazon Web Services account. Consequently, you can use this operation to manage Amazon Web \
   Services account root user credentials. This is true even if the Amazon Web Services account \
   has no associated users.\n\
  \ \n\
  \   For information about quotas on the number of keys you can create, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html}IAM and STS \
   quotas} in the {i IAM User Guide}.\n\
  \  \n\
  \    To ensure the security of your Amazon Web Services account, the secret access key is \
   accessible only during key and user creation. You must save the key (for example, in a text \
   file) if you want to be able to access it again. If a secret key is lost, you can delete the \
   access keys for the associated user and then create new keys.\n\
  \    \n\
  \     "]

module CreateAccountAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_account_alias_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_account_alias_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an alias for your Amazon Web Services account. For information about using an Amazon \
   Web Services account alias, see \
   {{:https://docs.aws.amazon.com/signin/latest/userguide/CreateAccountAlias.html}Creating, \
   deleting, and listing an Amazon Web Services account alias} in the {i Amazon Web Services \
   Sign-In User Guide}.\n"]

module CreateDelegationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_delegation_request_request ->
    ( create_delegation_request_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_delegation_request_request ->
    ( create_delegation_request_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an IAM delegation request for temporary access delegation.\n\n\
  \ This API is not available for general use. In order to use this API, a caller first need to go \
   through an onboarding process described in the \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-temporary-delegation-partner-guide.html}partner \
   onboarding documentation}. \n\
  \ "]

module CreateGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_group_request ->
    ( create_group_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_group_request ->
    ( create_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new group.\n\n\
  \  For information about the number of groups you can create, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html}IAM and STS \
   quotas} in the {i IAM User Guide}.\n\
  \ "]

module CreateInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_instance_profile_request ->
    ( create_instance_profile_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_instance_profile_request ->
    ( create_instance_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Creates a new instance profile. For information about instance profiles, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2.html}Using \
   roles for applications on Amazon EC2} in the {i IAM User Guide}, and \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html#ec2-instance-profile}Instance \
   profiles} in the {i Amazon EC2 User Guide}.\n\n\
  \  For information about the number of instance profiles you can create, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html}IAM object \
   quotas} in the {i IAM User Guide}.\n\
  \ "]

module CreateLoginProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `PasswordPolicyViolationException of password_policy_violation_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_login_profile_request ->
    ( create_login_profile_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PasswordPolicyViolationException of password_policy_violation_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_login_profile_request ->
    ( create_login_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PasswordPolicyViolationException of password_policy_violation_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a password for the specified IAM user. A password allows an IAM user to access Amazon \
   Web Services services through the Amazon Web Services Management Console.\n\n\
  \ You can use the CLI, the Amazon Web Services API, or the {b Users} page in the IAM console to \
   create a password for any IAM user. Use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ChangePassword.html}ChangePassword} \
   to update your own existing password in the {b My Security Credentials} page in the Amazon Web \
   Services Management Console.\n\
  \ \n\
  \  For more information about managing passwords, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html}Managing \
   passwords} in the {i IAM User Guide}.\n\
  \  "]

module CreateOpenIDConnectProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OpenIdIdpCommunicationErrorException of open_id_idp_communication_error_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_open_id_connect_provider_request ->
    ( create_open_id_connect_provider_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OpenIdIdpCommunicationErrorException of open_id_idp_communication_error_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_open_id_connect_provider_request ->
    ( create_open_id_connect_provider_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OpenIdIdpCommunicationErrorException of open_id_idp_communication_error_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an IAM entity to describe an identity provider (IdP) that supports \
   {{:http://openid.net/connect/}OpenID Connect (OIDC)}.\n\n\
  \ The OIDC provider that you create with this operation can be used as a principal in a role's \
   trust policy. Such a policy establishes a trust relationship between Amazon Web Services and \
   the OIDC provider.\n\
  \ \n\
  \  If you are using an OIDC identity provider from Google, Facebook, or Amazon Cognito, you \
   don't need to create a separate IAM identity provider. These OIDC identity providers are \
   already built-in to Amazon Web Services and are available for your use. Instead, you can move \
   directly to creating new roles using your identity provider. To learn more, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-idp_oidc.html}Creating \
   a role for web identity or OpenID connect federation} in the {i IAM User Guide}.\n\
  \  \n\
  \   When you create the IAM OIDC provider, you specify the following:\n\
  \   \n\
  \    {ul\n\
  \          {-  The URL of the OIDC identity provider (IdP) to trust\n\
  \              \n\
  \               }\n\
  \          {-  A list of client IDs (also known as audiences) that identify the application or \
   applications allowed to authenticate using the OIDC provider\n\
  \              \n\
  \               }\n\
  \          {-  A list of tags that are attached to the specified IAM OIDC provider\n\
  \              \n\
  \               }\n\
  \          {-  A list of thumbprints of one or more server certificates that the IdP uses\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   You get all of this information from the OIDC IdP you want to use to access Amazon Web \
   Services.\n\
  \   \n\
  \     Amazon Web Services secures communication with OIDC identity providers (IdPs) using our \
   library of trusted root certificate authorities (CAs) to verify the JSON Web Key Set (JWKS) \
   endpoint's TLS certificate. If your OIDC IdP relies on a certificate that is not signed by one \
   of these trusted CAs, only then we secure communication using the thumbprints set in the IdP's \
   configuration.\n\
  \     \n\
  \        The trust for the OIDC provider is derived from the IAM provider that this operation \
   creates. Therefore, it is best to limit access to the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html}CreateOpenIDConnectProvider} \
   operation to highly privileged users.\n\
  \        \n\
  \         "]

module CreatePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_policy_request ->
    ( create_policy_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_policy_request ->
    ( create_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new managed policy for your Amazon Web Services account.\n\n\
  \ This operation creates a policy version with a version identifier of [v1] and sets v1 as the \
   policy's default version. For more information about policy versions, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html}Versioning \
   for managed policies} in the {i IAM User Guide}.\n\
  \ \n\
  \  As a best practice, you can validate your IAM policies. To learn more, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_policy-validator.html}Validating \
   IAM policies} in the {i IAM User Guide}.\n\
  \  \n\
  \   For more information about managed policies in general, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \   "]

module CreatePolicyVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_policy_version_request ->
    ( create_policy_version_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_policy_version_request ->
    ( create_policy_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new version of the specified managed policy. To update a managed policy, you create a \
   new policy version. A managed policy can have up to five versions. If the policy has five \
   versions, you must delete an existing version using \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeletePolicyVersion.html}DeletePolicyVersion} \
   before you create a new version.\n\n\
  \ Optionally, you can set the new version as the policy's default version. The default version \
   is the version that is in effect for the IAM users, groups, and roles to which the policy is \
   attached.\n\
  \ \n\
  \  For more information about managed policy versions, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html}Versioning \
   for managed policies} in the {i IAM User Guide}.\n\
  \  "]

module CreateRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_role_request ->
    ( create_role_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_role_request ->
    ( create_role_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new role for your Amazon Web Services account.\n\n\
  \  For more information about roles, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html}IAM roles} in the {i IAM User \
   Guide}. For information about quotas for role names and the number of roles you can create, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html}IAM and STS \
   quotas} in the {i IAM User Guide}.\n\
  \ "]

module CreateSAMLProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_saml_provider_request ->
    ( create_saml_provider_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_saml_provider_request ->
    ( create_saml_provider_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an IAM resource that describes an identity provider (IdP) that supports SAML 2.0.\n\n\
  \ The SAML provider resource that you create with this operation can be used as a principal in \
   an IAM role's trust policy. Such a policy can enable federated users who sign in using the SAML \
   IdP to assume the role. You can create an IAM role that supports Web-based single sign-on (SSO) \
   to the Amazon Web Services Management Console or one that supports API access to Amazon Web \
   Services.\n\
  \ \n\
  \  When you create the SAML provider resource, you upload a SAML metadata document that you get \
   from your IdP. That document includes the issuer's name, expiration information, and keys that \
   can be used to validate the SAML authentication response (assertions) that the IdP sends. You \
   must generate the metadata document using the identity management software that is used as your \
   organization's IdP.\n\
  \  \n\
  \     This operation requires \
   {{:https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html}Signature Version 4}.\n\
  \    \n\
  \       For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-saml.html}Enabling \
   SAML 2.0 federated users to access the Amazon Web Services Management Console} and \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html}About SAML \
   2.0-based federation} in the {i IAM User Guide}.\n\
  \      "]

module CreateServiceLinkedRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_service_linked_role_request ->
    ( create_service_linked_role_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_service_linked_role_request ->
    ( create_service_linked_role_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an IAM role that is linked to a specific Amazon Web Services service. The service \
   controls the attached policies and when the role can be deleted. This helps ensure that the \
   service is not broken by an unexpectedly changed or deleted role, which could put your Amazon \
   Web Services resources into an unknown state. Allowing the service to control the role helps \
   improve service stability and proper cleanup when a service and its role are no longer needed. \
   For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html}Using \
   service-linked roles} in the {i IAM User Guide}. \n\n\
  \ To attach a policy to this service-linked role, you must make the request using the Amazon Web \
   Services service that depends on this role.\n\
  \ "]

module CreateServiceSpecificCredential : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceNotSupportedException of service_not_supported_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_service_specific_credential_request ->
    ( create_service_specific_credential_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceNotSupportedException of service_not_supported_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_service_specific_credential_request ->
    ( create_service_specific_credential_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceNotSupportedException of service_not_supported_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates a set of credentials consisting of a user name and password that can be used to \
   access the service specified in the request. These credentials are generated by IAM, and can be \
   used only for the specified service. \n\n\
  \ You can have a maximum of two sets of service-specific credentials for each supported service \
   per user.\n\
  \ \n\
  \  You can reset the password to a new service-generated value by calling \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ResetServiceSpecificCredential.html}ResetServiceSpecificCredential}.\n\
  \  \n\
  \   For more information about using service-specific credentials to authenticate to an Amazon \
   Web Services service, refer to the following docs:\n\
  \   \n\
  \    {ul\n\
  \          {-  For service-specific credentials with CodeCommit, refer to \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_ssh-keys.html}IAM \
   credentials for CodeCommit: Git credentials, SSH keys, and Amazon Web Services access keys} in \
   the {i IAM User Guide}.\n\
  \              \n\
  \               }\n\
  \          {-  For service-specific credentials with Amazon Keyspaces (for Apache Cassandra), \
   refer to {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_keyspaces.html}Use \
   IAM with Amazon Keyspaces (for Apache Cassandra)} in the {i IAM User Guide}.\n\
  \              \n\
  \               }\n\
  \          {-  For services that support long-term API keys, refer to \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_api_keys_for_aws_services.html}API \
   keys for Amazon Web Services services} in the {i IAM User Guide}.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module CreateUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_request ->
    ( create_user_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_request ->
    ( create_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new IAM user for your Amazon Web Services account.\n\n\
  \  For information about quotas for the number of IAM users you can create, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html}IAM and STS \
   quotas} in the {i IAM User Guide}.\n\
  \ "]

module CreateVirtualMFADevice : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_virtual_mfa_device_request ->
    ( create_virtual_mfa_device_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_virtual_mfa_device_request ->
    ( create_virtual_mfa_device_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new virtual MFA device for the Amazon Web Services account. After creating the \
   virtual MFA, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_EnableMFADevice.html}EnableMFADevice} \
   to attach the MFA device to an IAM user. For more information about creating and working with \
   virtual MFA devices, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html}Using a virtual MFA \
   device} in the {i IAM User Guide}.\n\n\
  \ For information about the maximum number of MFA devices you can create, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html}IAM and STS \
   quotas} in the {i IAM User Guide}.\n\
  \ \n\
  \   The seed information contained in the QR code and the Base32 string should be treated like \
   any other secret access information. In other words, protect the seed information as you would \
   your Amazon Web Services access keys or your passwords. After you provision your virtual \
   device, you should ensure that the information is destroyed following secure procedures.\n\
  \   \n\
  \    "]

module DeactivateMFADevice : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deactivate_mfa_device_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deactivate_mfa_device_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deactivates the specified MFA device and removes it from association with the user name for \
   which it was originally enabled.\n\n\
  \ For more information about creating and working with virtual MFA devices, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html}Enabling a virtual \
   multi-factor authentication (MFA) device} in the {i IAM User Guide}.\n\
  \ "]

module DeleteAccessKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_access_key_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_access_key_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the access key pair associated with the specified IAM user.\n\n\
  \ If you do not specify a user name, IAM determines the user name implicitly based on the Amazon \
   Web Services access key ID signing the request. This operation works for access keys under the \
   Amazon Web Services account. Consequently, you can use this operation to manage Amazon Web \
   Services account root user credentials even if the Amazon Web Services account has no \
   associated users.\n\
  \ "]

module DeleteAccountAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_account_alias_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_account_alias_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deletes the specified Amazon Web Services account alias. For information about using an Amazon \
   Web Services account alias, see \
   {{:https://docs.aws.amazon.com/signin/latest/userguide/CreateAccountAlias.html}Creating, \
   deleting, and listing an Amazon Web Services account alias} in the {i Amazon Web Services \
   Sign-In User Guide}.\n"]

module DeleteAccountPasswordPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the password policy for the Amazon Web Services account. There are no parameters.\n"]

module DeleteGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DeleteConflictException of delete_conflict_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DeleteConflictException of delete_conflict_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DeleteConflictException of delete_conflict_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified IAM group. The group must not contain any users or have any attached \
   policies.\n"]

module DeleteGroupPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_group_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_group_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified inline policy that is embedded in the specified IAM group.\n\n\
  \ A group can also have managed policies attached to it. To detach a managed policy from a \
   group, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DetachGroupPolicy.html}DetachGroupPolicy}. \
   For more information about policies, refer to \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \ "]

module DeleteInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DeleteConflictException of delete_conflict_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_instance_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DeleteConflictException of delete_conflict_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_instance_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DeleteConflictException of delete_conflict_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified instance profile. The instance profile must not have an associated role.\n\n\
  \  Make sure that you do not have any Amazon EC2 instances running with the instance profile you \
   are about to delete. Deleting a role or instance profile that is associated with a running \
   instance will break any applications running on the instance.\n\
  \  \n\
  \    For more information about instance profiles, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html}Using \
   instance profiles} in the {i IAM User Guide}.\n\
  \    "]

module DeleteLoginProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_login_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_login_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the password for the specified IAM user or root user, For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_passwords_admin-change-user.html}Managing \
   passwords for IAM users}.\n\n\
  \ You can use the CLI, the Amazon Web Services API, or the {b Users} page in the IAM console to \
   delete a password for any IAM user. You can use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ChangePassword.html}ChangePassword} \
   to update, but not delete, your own password in the {b My Security Credentials} page in the \
   Amazon Web Services Management Console.\n\
  \ \n\
  \   Deleting a user's password does not prevent a user from accessing Amazon Web Services \
   through the command line interface or the API. To prevent all user access, you must also either \
   make any access keys inactive or delete them. For more information about making keys inactive \
   or deleting them, see \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateAccessKey.html}UpdateAccessKey} \
   and \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteAccessKey.html}DeleteAccessKey}.\n\
  \   \n\
  \    "]

module DeleteOpenIDConnectProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_open_id_connect_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_open_id_connect_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an OpenID Connect identity provider (IdP) resource object in IAM.\n\n\
  \ Deleting an IAM OIDC provider resource does not update any roles that reference the provider \
   as a principal in their trust policies. Any attempt to assume a role that references a deleted \
   provider fails.\n\
  \ \n\
  \  This operation is idempotent; it does not fail or return an error if you call the operation \
   for a provider that does not exist.\n\
  \  "]

module DeletePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DeleteConflictException of delete_conflict_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DeleteConflictException of delete_conflict_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DeleteConflictException of delete_conflict_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified managed policy.\n\n\
  \ Before you can delete a managed policy, you must first detach the policy from all users, \
   groups, and roles that it is attached to. In addition, you must delete all the policy's \
   versions. The following steps describe the process for deleting a managed policy:\n\
  \ \n\
  \  {ul\n\
  \        {-  Detach the policy from all users, groups, and roles that the policy is attached to, \
   using \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DetachUserPolicy.html}DetachUserPolicy}, \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DetachGroupPolicy.html}DetachGroupPolicy}, \
   or \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DetachRolePolicy.html}DetachRolePolicy}. \
   To list all the users, groups, and roles that a policy is attached to, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListEntitiesForPolicy.html}ListEntitiesForPolicy}.\n\
  \            \n\
  \             }\n\
  \        {-  Delete all versions of the policy using \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeletePolicyVersion.html}DeletePolicyVersion}. \
   To list the policy's versions, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPolicyVersions.html}ListPolicyVersions}. \
   You cannot use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeletePolicyVersion.html}DeletePolicyVersion} \
   to delete the version that is marked as the default version. You delete the policy's default \
   version in the next step of the process.\n\
  \            \n\
  \             }\n\
  \        {-  Delete the policy (this automatically deletes the policy's default version) using \
   this operation.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For information about managed policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \   "]

module DeletePolicyVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DeleteConflictException of delete_conflict_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_version_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DeleteConflictException of delete_conflict_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_version_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DeleteConflictException of delete_conflict_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified version from the specified managed policy.\n\n\
  \ You cannot delete the default version from a policy using this operation. To delete the \
   default version from a policy, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeletePolicy.html}DeletePolicy}. To \
   find out which version of a policy is marked as the default version, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPolicyVersions.html}ListPolicyVersions}.\n\
  \ \n\
  \  For information about versions for managed policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html}Versioning \
   for managed policies} in the {i IAM User Guide}.\n\
  \  "]

module DeleteRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `DeleteConflictException of delete_conflict_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception
    | `UnmodifiableEntityException of unmodifiable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_role_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `DeleteConflictException of delete_conflict_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_role_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `DeleteConflictException of delete_conflict_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified role. Unlike the Amazon Web Services Management Console, when you delete \
   a role programmatically, you must delete the items attached to the role manually, or the \
   deletion fails. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html#roles-managingrole-deleting-cli}Deleting \
   an IAM role}. Before attempting to delete a role, remove the following attached items: \n\n\
  \ {ul\n\
  \       {-  Inline policies \
   ({{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteRolePolicy.html}DeleteRolePolicy})\n\
  \           \n\
  \            }\n\
  \       {-  Attached managed policies \
   ({{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DetachRolePolicy.html}DetachRolePolicy})\n\
  \           \n\
  \            }\n\
  \       {-  Instance profile \
   ({{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_RemoveRoleFromInstanceProfile.html}RemoveRoleFromInstanceProfile})\n\
  \           \n\
  \            }\n\
  \       {-  Optional \226\128\147 Delete instance profile after detaching from role for resource \
   clean up \
   ({{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteInstanceProfile.html}DeleteInstanceProfile})\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    Make sure that you do not have any Amazon EC2 instances running with the role you are about \
   to delete. Deleting a role or instance profile that is associated with a running instance will \
   break any applications running on the instance.\n\
  \    \n\
  \     "]

module DeleteRolePermissionsBoundary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception
    | `UnmodifiableEntityException of unmodifiable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_role_permissions_boundary_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_role_permissions_boundary_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the permissions boundary for the specified IAM role. \n\n\
  \ You cannot set the boundary for a service-linked role.\n\
  \ \n\
  \   Deleting the permissions boundary for a role might increase its permissions. For example, it \
   might allow anyone who assumes the role to perform all the actions granted in its permissions \
   policies.\n\
  \   \n\
  \    "]

module DeleteRolePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception
    | `UnmodifiableEntityException of unmodifiable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_role_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_role_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified inline policy that is embedded in the specified IAM role.\n\n\
  \ A role can also have managed policies attached to it. To detach a managed policy from a role, \
   use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DetachRolePolicy.html}DetachRolePolicy}. \
   For more information about policies, refer to \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \ "]

module DeleteSAMLProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_saml_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_saml_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a SAML provider resource in IAM.\n\n\
  \ Deleting the provider resource from IAM does not update any roles that reference the SAML \
   provider resource's ARN as a principal in their trust policies. Any attempt to assume a role \
   that references a non-existent provider resource ARN fails.\n\
  \ \n\
  \    This operation requires \
   {{:https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html}Signature Version 4}.\n\
  \   \n\
  \    "]

module DeleteSSHPublicKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_ssh_public_key_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_ssh_public_key_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified SSH public key.\n\n\
  \ The SSH public key deleted by this operation is used only for authenticating the associated \
   IAM user to an CodeCommit repository. For more information about using SSH keys to authenticate \
   to an CodeCommit repository, see \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html}Set \
   up CodeCommit for SSH connections} in the {i CodeCommit User Guide}.\n\
  \ "]

module DeleteServerCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DeleteConflictException of delete_conflict_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_server_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DeleteConflictException of delete_conflict_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_server_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DeleteConflictException of delete_conflict_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified server certificate.\n\n\
  \ For more information about working with server certificates, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html}Working \
   with server certificates} in the {i IAM User Guide}. This topic also includes a list of Amazon \
   Web Services services that can use the server certificates that you manage with IAM.\n\
  \ \n\
  \    If you are using a server certificate with Elastic Load Balancing, deleting the certificate \
   could have implications for your application. If Elastic Load Balancing doesn't detect the \
   deletion of bound certificates, it may continue to use the certificates. This could cause \
   Elastic Load Balancing to stop accepting traffic. We recommend that you remove the reference to \
   the certificate from Elastic Load Balancing before using this command to delete the \
   certificate. For more information, see \
   {{:https://docs.aws.amazon.com/ElasticLoadBalancing/latest/APIReference/API_DeleteLoadBalancerListeners.html}DeleteLoadBalancerListeners} \
   in the {i Elastic Load Balancing API Reference}.\n\
  \   \n\
  \    "]

module DeleteServiceLinkedRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_service_linked_role_request ->
    ( delete_service_linked_role_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_service_linked_role_request ->
    ( delete_service_linked_role_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Submits a service-linked role deletion request and returns a [DeletionTaskId], which you can \
   use to check the status of the deletion. Before you call this operation, confirm that the role \
   has no active sessions and that any resources used by the role in the linked service are \
   deleted. If you call this operation more than once for the same service-linked role and an \
   earlier deletion task is not complete, then the [DeletionTaskId] of the earlier request is \
   returned.\n\n\
  \ If you submit a deletion request for a service-linked role whose linked service is still \
   accessing a resource, then the deletion task fails. If it fails, the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLinkedRoleDeletionStatus.html}GetServiceLinkedRoleDeletionStatus} \
   operation returns the reason for the failure, usually including the resources that must be \
   deleted. To delete the service-linked role, you must first remove those resources from the \
   linked service and then submit the deletion request again. Resources are specific to the \
   service that is linked to the role. For more information about removing resources from a \
   service, see the {{:http://docs.aws.amazon.com/}Amazon Web Services documentation} for your \
   service.\n\
  \ \n\
  \  For more information about service-linked roles, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-service-linked-role}Roles \
   terms and concepts: Amazon Web Services service-linked role} in the {i IAM User Guide}.\n\
  \  "]

module DeleteServiceSpecificCredential : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_service_specific_credential_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_service_specific_credential_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified service-specific credential.\n"]

module DeleteSigningCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_signing_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_signing_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a signing certificate associated with the specified IAM user.\n\n\
  \ If you do not specify a user name, IAM determines the user name implicitly based on the Amazon \
   Web Services access key ID signing the request. This operation works for access keys under the \
   Amazon Web Services account. Consequently, you can use this operation to manage Amazon Web \
   Services account root user credentials even if the Amazon Web Services account has no \
   associated IAM users.\n\
  \ "]

module DeleteUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `DeleteConflictException of delete_conflict_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `DeleteConflictException of delete_conflict_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `DeleteConflictException of delete_conflict_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified IAM user. Unlike the Amazon Web Services Management Console, when you \
   delete a user programmatically, you must delete the items attached to the user manually, or the \
   deletion fails. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_manage.html#id_users_deleting_cli}Deleting \
   an IAM user}. Before attempting to delete a user, remove the following items:\n\n\
  \ {ul\n\
  \       {-  Password \
   ({{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteLoginProfile.html}DeleteLoginProfile})\n\
  \           \n\
  \            }\n\
  \       {-  Access keys \
   ({{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteAccessKey.html}DeleteAccessKey})\n\
  \           \n\
  \            }\n\
  \       {-  Signing certificate \
   ({{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteSigningCertificate.html}DeleteSigningCertificate})\n\
  \           \n\
  \            }\n\
  \       {-  SSH public key \
   ({{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteSSHPublicKey.html}DeleteSSHPublicKey})\n\
  \           \n\
  \            }\n\
  \       {-  Git credentials \
   ({{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteServiceSpecificCredential.html}DeleteServiceSpecificCredential})\n\
  \           \n\
  \            }\n\
  \       {-  Multi-factor authentication (MFA) device \
   ({{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeactivateMFADevice.html}DeactivateMFADevice}, \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteVirtualMFADevice.html}DeleteVirtualMFADevice})\n\
  \           \n\
  \            }\n\
  \       {-  Inline policies \
   ({{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteUserPolicy.html}DeleteUserPolicy})\n\
  \           \n\
  \            }\n\
  \       {-  Attached managed policies \
   ({{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DetachUserPolicy.html}DetachUserPolicy})\n\
  \           \n\
  \            }\n\
  \       {-  Group memberships \
   ({{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_RemoveUserFromGroup.html}RemoveUserFromGroup})\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DeleteUserPermissionsBoundary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_permissions_boundary_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_permissions_boundary_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the permissions boundary for the specified IAM user.\n\n\
  \  Deleting the permissions boundary for a user might increase its permissions by allowing the \
   user to perform all the actions granted in its permissions policies. \n\
  \  \n\
  \   "]

module DeleteUserPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified inline policy that is embedded in the specified IAM user.\n\n\
  \ A user can also have managed policies attached to it. To detach a managed policy from a user, \
   use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DetachUserPolicy.html}DetachUserPolicy}. \
   For more information about policies, refer to \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \ "]

module DeleteVirtualMFADevice : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `DeleteConflictException of delete_conflict_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_virtual_mfa_device_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `DeleteConflictException of delete_conflict_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_virtual_mfa_device_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `DeleteConflictException of delete_conflict_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a virtual MFA device.\n\n\
  \   You must deactivate a user's virtual MFA device before you can delete it. For information \
   about deactivating MFA devices, see \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeactivateMFADevice.html}DeactivateMFADevice}. \n\
  \  \n\
  \   "]

module DetachGroupPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_group_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_group_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified managed policy from the specified IAM group.\n\n\
  \ A group can also have inline policies embedded with it. To delete an inline policy, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteGroupPolicy.html}DeleteGroupPolicy}. \
   For information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \ "]

module DetachRolePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception
    | `UnmodifiableEntityException of unmodifiable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_role_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_role_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified managed policy from the specified role.\n\n\
  \ A role can also have inline policies embedded with it. To delete an inline policy, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteRolePolicy.html}DeleteRolePolicy}. \
   For information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \ "]

module DetachUserPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_user_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_user_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified managed policy from the specified user.\n\n\
  \ A user can also have inline policies embedded with it. To delete an inline policy, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteUserPolicy.html}DeleteUserPolicy}. \
   For information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \ "]

module DisableOrganizationsRootCredentialsManagement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccountNotManagementOrDelegatedAdministratorException of
      account_not_management_or_delegated_administrator_exception
    | `OrganizationNotFoundException of organization_not_found_exception
    | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
    | `ServiceAccessNotEnabledException of service_access_not_enabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_organizations_root_credentials_management_request ->
    ( disable_organizations_root_credentials_management_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountNotManagementOrDelegatedAdministratorException of
        account_not_management_or_delegated_administrator_exception
      | `OrganizationNotFoundException of organization_not_found_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `ServiceAccessNotEnabledException of service_access_not_enabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_organizations_root_credentials_management_request ->
    ( disable_organizations_root_credentials_management_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountNotManagementOrDelegatedAdministratorException of
        account_not_management_or_delegated_administrator_exception
      | `OrganizationNotFoundException of organization_not_found_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `ServiceAccessNotEnabledException of service_access_not_enabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables the management of privileged root user credentials across member accounts in your \
   organization. When you disable this feature, the management account and the delegated \
   administrator for IAM can no longer manage root user credentials for member accounts in your \
   organization.\n"]

module DisableOrganizationsRootSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccountNotManagementOrDelegatedAdministratorException of
      account_not_management_or_delegated_administrator_exception
    | `OrganizationNotFoundException of organization_not_found_exception
    | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
    | `ServiceAccessNotEnabledException of service_access_not_enabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_organizations_root_sessions_request ->
    ( disable_organizations_root_sessions_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountNotManagementOrDelegatedAdministratorException of
        account_not_management_or_delegated_administrator_exception
      | `OrganizationNotFoundException of organization_not_found_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `ServiceAccessNotEnabledException of service_access_not_enabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_organizations_root_sessions_request ->
    ( disable_organizations_root_sessions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountNotManagementOrDelegatedAdministratorException of
        account_not_management_or_delegated_administrator_exception
      | `OrganizationNotFoundException of organization_not_found_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `ServiceAccessNotEnabledException of service_access_not_enabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables root user sessions for privileged tasks across member accounts in your organization. \
   When you disable this feature, the management account and the delegated administrator for IAM \
   can no longer perform privileged tasks on member accounts in your organization.\n"]

module DisableOutboundWebIdentityFederation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `FeatureDisabledException of feature_disabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `FeatureDisabledException of feature_disabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `FeatureDisabledException of feature_disabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables the outbound identity federation feature for your Amazon Web Services account. When \
   disabled, IAM principals in the account cannot use the [GetWebIdentityToken] API to obtain JSON \
   Web Tokens (JWTs) for authentication with external services. This operation does not affect \
   tokens that were issued before the feature was disabled.\n"]

module EnableMFADevice : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
    | `InvalidAuthenticationCodeException of invalid_authentication_code_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_mfa_device_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
      | `InvalidAuthenticationCodeException of invalid_authentication_code_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_mfa_device_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
      | `InvalidAuthenticationCodeException of invalid_authentication_code_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables the specified MFA device and associates it with the specified IAM user. When enabled, \
   the MFA device is required for every subsequent login by the IAM user associated with the \
   device.\n"]

module EnableOrganizationsRootCredentialsManagement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccountNotManagementOrDelegatedAdministratorException of
      account_not_management_or_delegated_administrator_exception
    | `CallerIsNotManagementAccountException of caller_is_not_management_account_exception
    | `OrganizationNotFoundException of organization_not_found_exception
    | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
    | `ServiceAccessNotEnabledException of service_access_not_enabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_organizations_root_credentials_management_request ->
    ( enable_organizations_root_credentials_management_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountNotManagementOrDelegatedAdministratorException of
        account_not_management_or_delegated_administrator_exception
      | `CallerIsNotManagementAccountException of caller_is_not_management_account_exception
      | `OrganizationNotFoundException of organization_not_found_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `ServiceAccessNotEnabledException of service_access_not_enabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_organizations_root_credentials_management_request ->
    ( enable_organizations_root_credentials_management_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountNotManagementOrDelegatedAdministratorException of
        account_not_management_or_delegated_administrator_exception
      | `CallerIsNotManagementAccountException of caller_is_not_management_account_exception
      | `OrganizationNotFoundException of organization_not_found_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `ServiceAccessNotEnabledException of service_access_not_enabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables the management of privileged root user credentials across member accounts in your \
   organization. When you enable root credentials management for \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html#id_root-user-access-management}centralized \
   root access}, the management account and the delegated administrator for IAM can manage root \
   user credentials for member accounts in your organization.\n\n\
  \ Before you enable centralized root access, you must have an account configured with the \
   following settings:\n\
  \ \n\
  \  {ul\n\
  \        {-  You must manage your Amazon Web Services accounts in \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html}Organizations}.\n\
  \            \n\
  \             }\n\
  \        {-  Enable trusted access for Identity and Access Management in Organizations. For \
   details, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-iam.html}IAM \
   and Organizations} in the {i Organizations User Guide}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module EnableOrganizationsRootSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccountNotManagementOrDelegatedAdministratorException of
      account_not_management_or_delegated_administrator_exception
    | `CallerIsNotManagementAccountException of caller_is_not_management_account_exception
    | `OrganizationNotFoundException of organization_not_found_exception
    | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
    | `ServiceAccessNotEnabledException of service_access_not_enabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_organizations_root_sessions_request ->
    ( enable_organizations_root_sessions_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountNotManagementOrDelegatedAdministratorException of
        account_not_management_or_delegated_administrator_exception
      | `CallerIsNotManagementAccountException of caller_is_not_management_account_exception
      | `OrganizationNotFoundException of organization_not_found_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `ServiceAccessNotEnabledException of service_access_not_enabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_organizations_root_sessions_request ->
    ( enable_organizations_root_sessions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountNotManagementOrDelegatedAdministratorException of
        account_not_management_or_delegated_administrator_exception
      | `CallerIsNotManagementAccountException of caller_is_not_management_account_exception
      | `OrganizationNotFoundException of organization_not_found_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `ServiceAccessNotEnabledException of service_access_not_enabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows the management account or delegated administrator to perform privileged tasks on member \
   accounts in your organization. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html#id_root-user-access-management}Centrally \
   manage root access for member accounts} in the {i Identity and Access Management User Guide}.\n\n\
  \ Before you enable this feature, you must have an account configured with the following settings:\n\
  \ \n\
  \  {ul\n\
  \        {-  You must manage your Amazon Web Services accounts in \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html}Organizations}.\n\
  \            \n\
  \             }\n\
  \        {-  Enable trusted access for Identity and Access Management in Organizations. For \
   details, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-ra.html}IAM \
   and Organizations} in the {i Organizations User Guide}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module EnableOutboundWebIdentityFederation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `FeatureEnabledException of feature_enabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( enable_outbound_web_identity_federation_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `FeatureEnabledException of feature_enabled_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( enable_outbound_web_identity_federation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `FeatureEnabledException of feature_enabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables the outbound identity federation feature for your Amazon Web Services account. When \
   enabled, IAM principals in your account can use the [GetWebIdentityToken] API to obtain JSON \
   Web Tokens (JWTs) for secure authentication with external services. This operation also \
   generates a unique issuer URL for your Amazon Web Services account. \n"]

module GenerateCredentialReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( generate_credential_report_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( generate_credential_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Generates a credential report for the Amazon Web Services account. For more information about \
   the credential report, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html}Getting credential \
   reports} in the {i IAM User Guide}.\n"]

module GenerateOrganizationsAccessReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ReportGenerationLimitExceededException of report_generation_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    generate_organizations_access_report_request ->
    ( generate_organizations_access_report_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ReportGenerationLimitExceededException of report_generation_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    generate_organizations_access_report_request ->
    ( generate_organizations_access_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ReportGenerationLimitExceededException of report_generation_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates a report for service last accessed data for Organizations. You can generate a report \
   for any entities (organization root, organizational unit, or account) or policies in your \
   organization.\n\n\
  \ To call this operation, you must be signed in using your Organizations management account \
   credentials. You can use your long-term IAM user or root user credentials, or temporary \
   credentials from assuming an IAM role. SCPs must be enabled for your organization root. You \
   must have the required IAM and Organizations permissions. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html}Refining \
   permissions using service last accessed data} in the {i IAM User Guide}.\n\
  \ \n\
  \  You can generate a service last accessed data report for entities by specifying only the \
   entity's path. This data includes a list of services that are allowed by any service control \
   policies (SCPs) that apply to the entity.\n\
  \  \n\
  \   You can generate a service last accessed data report for a policy by specifying an entity's \
   path and an optional Organizations policy ID. This data includes a list of services that are \
   allowed by the specified SCP.\n\
  \   \n\
  \    For each service in both report types, the data includes the most recent account activity \
   that the policy allows to account principals in the entity or the entity's children. For \
   important information about the data, reporting period, permissions required, troubleshooting, \
   and supported Regions see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html}Reducing \
   permissions using service last accessed data} in the {i IAM User Guide}.\n\
  \    \n\
  \      The data includes all attempts to access Amazon Web Services, not just the successful \
   ones. This includes all attempts that were made using the Amazon Web Services Management \
   Console, the Amazon Web Services API through any of the SDKs, or any of the command line tools. \
   An unexpected entry in the service last accessed data does not mean that an account has been \
   compromised, because the request might have been denied. Refer to your CloudTrail logs as the \
   authoritative source for information about all API calls and whether they were successful or \
   denied access. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html}Logging IAM \
   events with CloudTrail} in the {i IAM User Guide}.\n\
  \      \n\
  \        This operation returns a [JobId]. Use this parameter in the \n\
  \        {[\n\
  \         \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOrganizationsAccessReport.html}GetOrganizationsAccessReport} \n\
  \        ]}\n\
  \         operation to check the status of the report generation. To check the status of this \
   request, use the [JobId] parameter in the \n\
  \        {[\n\
  \         \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOrganizationsAccessReport.html}GetOrganizationsAccessReport} \n\
  \        ]}\n\
  \         operation and test the [JobStatus] response parameter. When the job is complete, you \
   can retrieve the report.\n\
  \        \n\
  \         To generate a service last accessed data report for entities, specify an entity path \
   without specifying the optional Organizations policy ID. The type of entity that you specify \
   determines the data returned in the report.\n\
  \         \n\
  \          {ul\n\
  \                {-   {b Root} \226\128\147 When you specify the organizations root as the \
   entity, the resulting report lists all of the services allowed by SCPs that are attached to \
   your root. For each service, the report includes data for all accounts in your organization \
   except the management account, because the management account is not limited by SCPs.\n\
  \                    \n\
  \                     }\n\
  \                {-   {b OU} \226\128\147 When you specify an organizational unit (OU) as the \
   entity, the resulting report lists all of the services allowed by SCPs that are attached to the \
   OU and its parents. For each service, the report includes data for all accounts in the OU or \
   its children. This data excludes the management account, because the management account is not \
   limited by SCPs.\n\
  \                    \n\
  \                     }\n\
  \                {-   {b management account} \226\128\147 When you specify the management \
   account, the resulting report lists all Amazon Web Services services, because the management \
   account is not limited by SCPs. For each service, the report includes data for only the \
   management account.\n\
  \                    \n\
  \                     }\n\
  \                {-   {b Account} \226\128\147 When you specify another account as the entity, \
   the resulting report lists all of the services allowed by SCPs that are attached to the account \
   and its parents. For each service, the report includes data for only the specified account.\n\
  \                    \n\
  \                     }\n\
  \                }\n\
  \   To generate a service last accessed data report for policies, specify an entity path and the \
   optional Organizations policy ID. The type of entity that you specify determines the data \
   returned for each service.\n\
  \   \n\
  \    {ul\n\
  \          {-   {b Root} \226\128\147 When you specify the root entity and a policy ID, the \
   resulting report lists all of the services that are allowed by the specified SCP. For each \
   service, the report includes data for all accounts in your organization to which the SCP \
   applies. This data excludes the management account, because the management account is not \
   limited by SCPs. If the SCP is not attached to any entities in the organization, then the \
   report will return a list of services with no data.\n\
  \              \n\
  \               }\n\
  \          {-   {b OU} \226\128\147 When you specify an OU entity and a policy ID, the resulting \
   report lists all of the services that are allowed by the specified SCP. For each service, the \
   report includes data for all accounts in the OU or its children to which the SCP applies. This \
   means that other accounts outside the OU that are affected by the SCP might not be included in \
   the data. This data excludes the management account, because the management account is not \
   limited by SCPs. If the SCP is not attached to the OU or one of its children, the report will \
   return a list of services with no data.\n\
  \              \n\
  \               }\n\
  \          {-   {b management account} \226\128\147 When you specify the management account, the \
   resulting report lists all Amazon Web Services services, because the management account is not \
   limited by SCPs. If you specify a policy ID in the CLI or API, the policy is ignored. For each \
   service, the report includes data for only the management account.\n\
  \              \n\
  \               }\n\
  \          {-   {b Account} \226\128\147 When you specify another account entity and a policy \
   ID, the resulting report lists all of the services that are allowed by the specified SCP. For \
   each service, the report includes data for only the specified account. This means that other \
   accounts in the organization that are affected by the SCP might not be included in the data. If \
   the SCP is not attached to the account, the report will return a list of services with no data.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    Service last accessed data does not use other policy types when determining whether a \
   principal could access a service. These other policy types include identity-based policies, \
   resource-based policies, access control lists, IAM permissions boundaries, and STS assume role \
   policies. It only applies SCP logic. For more about the evaluation of policy types, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics}Evaluating \
   policies} in the {i IAM User Guide}.\n\
  \    \n\
  \      For more information about service last accessed data, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html}Reducing \
   policy scope by viewing user activity} in the {i IAM User Guide}.\n\
  \      "]

module GenerateServiceLastAccessedDetails : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    generate_service_last_accessed_details_request ->
    ( generate_service_last_accessed_details_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    generate_service_last_accessed_details_request ->
    ( generate_service_last_accessed_details_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates a report that includes details about when an IAM resource (user, group, role, or \
   policy) was last used in an attempt to access Amazon Web Services services. Recent activity \
   usually appears within four hours. IAM reports activity for at least the last 400 days, or less \
   if your Region began supporting this feature within the last year. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period}Regions \
   where data is tracked}. For more information about services and actions for which action last \
   accessed information is displayed, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor-action-last-accessed.html}IAM \
   action last accessed information services and actions}.\n\n\
  \  The service last accessed data includes all attempts to access an Amazon Web Services API, \
   not just the successful ones. This includes all attempts that were made using the Amazon Web \
   Services Management Console, the Amazon Web Services API through any of the SDKs, or any of the \
   command line tools. An unexpected entry in the service last accessed data does not mean that \
   your account has been compromised, because the request might have been denied. Refer to your \
   CloudTrail logs as the authoritative source for information about all API calls and whether \
   they were successful or denied access. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html}Logging IAM \
   events with CloudTrail} in the {i IAM User Guide}.\n\
  \  \n\
  \    The [GenerateServiceLastAccessedDetails] operation returns a [JobId]. Use this parameter in \
   the following operations to retrieve the following details from your report: \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetails.html}GetServiceLastAccessedDetails} \
   \226\128\147 Use this operation for users, groups, roles, or policies to list every Amazon Web \
   Services service that the resource could access using permissions policies. For each service, \
   the response includes information about the most recent access attempt.\n\
  \               \n\
  \                The [JobId] returned by [GenerateServiceLastAccessedDetail] must be used by the \
   same role within a session, or by the same user when used to call \
   [GetServiceLastAccessedDetail].\n\
  \                \n\
  \                 }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetailsWithEntities.html}GetServiceLastAccessedDetailsWithEntities} \
   \226\128\147 Use this operation for groups and policies to list information about the \
   associated entities (users or roles) that attempted to access a specific Amazon Web Services \
   service. \n\
  \               \n\
  \                }\n\
  \           }\n\
  \   To check the status of the [GenerateServiceLastAccessedDetails] request, use the [JobId] \
   parameter in the same operations and test the [JobStatus] response parameter.\n\
  \   \n\
  \    For additional information about the permissions policies that allow an identity (user, \
   group, or role) to access specific services, use the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPoliciesGrantingServiceAccess.html}ListPoliciesGrantingServiceAccess} \
   operation.\n\
  \    \n\
  \      Service last accessed data does not use other policy types when determining whether a \
   resource could access a service. These other policy types include resource-based policies, \
   access control lists, Organizations policies, IAM permissions boundaries, and STS assume role \
   policies. It only applies permissions policy logic. For more about the evaluation of policy \
   types, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics}Evaluating \
   policies} in the {i IAM User Guide}.\n\
  \      \n\
  \        For more information about service and action last accessed data, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html}Reducing \
   permissions using service last accessed data} in the {i IAM User Guide}.\n\
  \        "]

module GetAccessKeyLastUsed : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_access_key_last_used_request ->
    (get_access_key_last_used_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_access_key_last_used_request ->
    ( get_access_key_last_used_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about when the specified access key was last used. The information \
   includes the date and time of last use, along with the Amazon Web Services service and Region \
   that were specified in the last request made with that key.\n"]

module GetAccountAuthorizationDetails : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_account_authorization_details_request ->
    ( get_account_authorization_details_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_account_authorization_details_request ->
    ( get_account_authorization_details_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about all IAM users, groups, roles, and policies in your Amazon Web \
   Services account, including their relationships to one another. Use this operation to obtain a \
   snapshot of the configuration of IAM permissions (users, groups, roles, and policies) in your \
   account.\n\n\
  \  Policies returned by this operation are URL-encoded compliant with \
   {{:https://tools.ietf.org/html/rfc3986}RFC 3986}. You can use a URL decoding method to convert \
   the policy back to plain JSON text. For example, if you use Java, you can use the [decode] \
   method of the [java.net.URLDecoder] utility class in the Java SDK. Other languages and SDKs \
   provide similar functionality, and some SDKs do this decoding automatically.\n\
  \  \n\
  \    You can optionally filter the results using the [Filter] parameter. You can paginate the \
   results using the [MaxItems] and [Marker] parameters.\n\
  \    "]

module GetAccountPasswordPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( get_account_password_policy_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( get_account_password_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the password policy for the Amazon Web Services account. This tells you the \
   complexity requirements and mandatory rotation periods for the IAM user passwords in your \
   account. For more information about using a password policy, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingPasswordPolicies.html}Managing \
   an IAM password policy}.\n"]

module GetAccountSummary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( get_account_summary_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( get_account_summary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about IAM entity usage and IAM quotas in the Amazon Web Services account.\n\n\
  \  For information about IAM quotas, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html}IAM and STS \
   quotas} in the {i IAM User Guide}.\n\
  \ "]

module GetContextKeysForCustomPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_context_keys_for_custom_policy_request ->
    ( get_context_keys_for_policy_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidInputException of invalid_input_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_context_keys_for_custom_policy_request ->
    ( get_context_keys_for_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of all of the context keys referenced in the input policies. The policies are \
   supplied as a list of one or more strings. To get the context keys from policies associated \
   with an IAM user, group, or role, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForPrincipalPolicy.html}GetContextKeysForPrincipalPolicy}.\n\n\
  \ Context keys are variables maintained by Amazon Web Services and its services that provide \
   details about the context of an API query request. Context keys can be evaluated by testing \
   against a value specified in an IAM policy. Use [GetContextKeysForCustomPolicy] to understand \
   what key names and values you must supply when you call \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulateCustomPolicy.html}SimulateCustomPolicy}. \
   Note that all parameters are shown in unencoded form here for clarity but must be URL encoded \
   to be included as a part of a real HTML request.\n\
  \ "]

module GetContextKeysForPrincipalPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_context_keys_for_principal_policy_request ->
    ( get_context_keys_for_policy_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_context_keys_for_principal_policy_request ->
    ( get_context_keys_for_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of all of the context keys referenced in all the IAM policies that are attached to \
   the specified IAM entity. The entity can be an IAM user, group, or role. If you specify a user, \
   then the request also includes all of the policies attached to groups that the user is a member \
   of.\n\n\
  \ You can optionally include a list of one or more additional policies, specified as strings. If \
   you want to include {i only} a list of policies by string, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForCustomPolicy.html}GetContextKeysForCustomPolicy} \
   instead.\n\
  \ \n\
  \   {b Note:} This operation discloses information about the permissions granted to other users. \
   If you do not want users to see other user's permissions, then consider allowing them to use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForCustomPolicy.html}GetContextKeysForCustomPolicy} \
   instead.\n\
  \  \n\
  \   Context keys are variables maintained by Amazon Web Services and its services that provide \
   details about the context of an API query request. Context keys can be evaluated by testing \
   against a value in an IAM policy. Use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForPrincipalPolicy.html}GetContextKeysForPrincipalPolicy} \
   to understand what key names and values you must supply when you call \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulatePrincipalPolicy.html}SimulatePrincipalPolicy}.\n\
  \   "]

module GetCredentialReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CredentialReportExpiredException of credential_report_expired_exception
    | `CredentialReportNotPresentException of credential_report_not_present_exception
    | `CredentialReportNotReadyException of credential_report_not_ready_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( get_credential_report_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CredentialReportExpiredException of credential_report_expired_exception
      | `CredentialReportNotPresentException of credential_report_not_present_exception
      | `CredentialReportNotReadyException of credential_report_not_ready_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( get_credential_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CredentialReportExpiredException of credential_report_expired_exception
      | `CredentialReportNotPresentException of credential_report_not_present_exception
      | `CredentialReportNotReadyException of credential_report_not_ready_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Retrieves a credential report for the Amazon Web Services account. For more information about \
   the credential report, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html}Getting credential \
   reports} in the {i IAM User Guide}.\n"]

module GetDelegationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_delegation_request_request ->
    ( get_delegation_request_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_delegation_request_request ->
    ( get_delegation_request_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about a specific delegation request.\n\n\
  \  If a delegation request has no owner or owner account, [GetDelegationRequest] for that \
   delegation request can be called by any account. If the owner account is assigned but there is \
   no owner id, only identities within that owner account can call [GetDelegationRequest] for the \
   delegation request. Once the delegation request is fully owned, the owner of the request gets a \
   default permission to get that delegation request. For more details, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-temporary-delegation.html#temporary-delegation-managing-permissions} \
   Managing Permissions for Delegation Requests}. \n\
  \ "]

module GetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_group_request ->
    ( get_group_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_group_request ->
    ( get_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Returns a list of IAM users that are in the specified IAM group. You can paginate the results \
   using the [MaxItems] and [Marker] parameters.\n"]

module GetGroupPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_group_policy_request ->
    ( get_group_policy_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_group_policy_request ->
    ( get_group_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the specified inline policy document that is embedded in the specified IAM group.\n\n\
  \  Policies returned by this operation are URL-encoded compliant with \
   {{:https://tools.ietf.org/html/rfc3986}RFC 3986}. You can use a URL decoding method to convert \
   the policy back to plain JSON text. For example, if you use Java, you can use the [decode] \
   method of the [java.net.URLDecoder] utility class in the Java SDK. Other languages and SDKs \
   provide similar functionality, and some SDKs do this decoding automatically.\n\
  \  \n\
  \    An IAM group can also have managed policies attached to it. To retrieve a managed policy \
   document that is attached to a group, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicy.html}GetPolicy} to \
   determine the policy's default version, then use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicyVersion.html}GetPolicyVersion} \
   to retrieve the policy document.\n\
  \    \n\
  \     For more information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \     "]

module GetHumanReadableSummary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_human_readable_summary_request ->
    ( get_human_readable_summary_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_human_readable_summary_request ->
    ( get_human_readable_summary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a human readable summary for a given entity. At this time, the only supported entity \
   type is [delegation-request] \n\n\
  \ This method uses a Large Language Model (LLM) to generate the summary.\n\
  \ \n\
  \   If a delegation request has no owner or owner account, [GetHumanReadableSummary] for that \
   delegation request can be called by any account. If the owner account is assigned but there is \
   no owner id, only identities within that owner account can call [GetHumanReadableSummary] for \
   the delegation request to retrieve a summary of that request. Once the delegation request is \
   fully owned, the owner of the request gets a default permission to get that delegation request. \
   For more details, read {{:}default permissions granted to delegation requests}. These rules are \
   identical to \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetDelegationRequest.html}GetDelegationRequest} \
   API behavior, such that a party who has permissions to call \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetDelegationRequest.html}GetDelegationRequest} \
   for a given delegation request will always be able to retrieve the human readable summary for \
   that request. \n\
  \  "]

module GetInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_instance_profile_request ->
    ( get_instance_profile_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_instance_profile_request ->
    ( get_instance_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Retrieves information about the specified instance profile, including the instance profile's \
   path, GUID, ARN, and role. For more information about instance profiles, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html}Using \
   instance profiles} in the {i IAM User Guide}.\n"]

module GetLoginProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_login_profile_request ->
    ( get_login_profile_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_login_profile_request ->
    ( get_login_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the user name for the specified IAM user. A login profile is created when you create \
   a password for the user to access the Amazon Web Services Management Console. If the user does \
   not exist or does not have a password, the operation returns a 404 ([NoSuchEntity]) error.\n\n\
  \ If you create an IAM user with access to the console, the [CreateDate] reflects the date you \
   created the initial password for the user.\n\
  \ \n\
  \  If you create an IAM user with programmatic access, and then later add a password for the \
   user to access the Amazon Web Services Management Console, the [CreateDate] reflects the \
   initial password creation date. A user with programmatic access does not have a login profile \
   unless you create a password for the user to access the Amazon Web Services Management Console.\n\
  \  "]

module GetMFADevice : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_mfa_device_request ->
    ( get_mfa_device_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_mfa_device_request ->
    ( get_mfa_device_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about an MFA device for a specified user.\n"]

module GetOpenIDConnectProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_open_id_connect_provider_request ->
    ( get_open_id_connect_provider_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_open_id_connect_provider_request ->
    ( get_open_id_connect_provider_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the specified OpenID Connect (OIDC) provider resource object in IAM.\n"]

module GetOrganizationsAccessReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_organizations_access_report_request ->
    ( get_organizations_access_report_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_organizations_access_report_request ->
    ( get_organizations_access_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the service last accessed data report for Organizations that was previously generated \
   using the \n\
   {[\n\
  \ \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GenerateOrganizationsAccessReport.html}GenerateOrganizationsAccessReport} \n\
   ]}\n\
  \ operation. This operation retrieves the status of your report job and the report contents.\n\n\
  \ Depending on the parameters that you passed when you generated the report, the data returned \
   could include different information. For details, see \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GenerateOrganizationsAccessReport.html}GenerateOrganizationsAccessReport}.\n\
  \ \n\
  \  To call this operation, you must be signed in to the management account in your organization. \
   SCPs must be enabled for your organization root. You must have permissions to perform this \
   operation. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html}Refining \
   permissions using service last accessed data} in the {i IAM User Guide}.\n\
  \  \n\
  \   For each service that principals in an account (root user, IAM users, or IAM roles) could \
   access using SCPs, the operation returns details about the most recent access attempt. If there \
   was no attempt, the service is listed without details about the most recent attempt to access \
   the service. If the operation fails, it returns the reason that it failed.\n\
  \   \n\
  \    By default, the list is sorted by service namespace.\n\
  \    "]

module GetOutboundWebIdentityFederationInfo : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `FeatureDisabledException of feature_disabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( get_outbound_web_identity_federation_info_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `FeatureDisabledException of feature_disabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( get_outbound_web_identity_federation_info_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `FeatureDisabledException of feature_disabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the configuration information for the outbound identity federation feature in your \
   Amazon Web Services account. The response includes the unique issuer URL for your Amazon Web \
   Services account and the current enabled/disabled status of the feature. Use this operation to \
   obtain the issuer URL that you need to configure trust relationships with external services.\n"]

module GetPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_policy_request ->
    ( get_policy_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_policy_request ->
    ( get_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about the specified managed policy, including the policy's default \
   version and the total number of IAM users, groups, and roles to which the policy is attached. \
   To retrieve the list of the specific users, groups, and roles that the policy is attached to, \
   use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListEntitiesForPolicy.html}ListEntitiesForPolicy}. \
   This operation returns metadata about the policy. To retrieve the actual policy document for a \
   specific version of the policy, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicyVersion.html}GetPolicyVersion}.\n\n\
  \ This operation retrieves information about managed policies. To retrieve information about an \
   inline policy that is embedded with an IAM user, group, or role, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetUserPolicy.html}GetUserPolicy}, \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetGroupPolicy.html}GetGroupPolicy}, \
   or {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetRolePolicy.html}GetRolePolicy}.\n\
  \ \n\
  \  For more information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \  "]

module GetPolicyVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_policy_version_request ->
    ( get_policy_version_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_policy_version_request ->
    ( get_policy_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about the specified version of the specified managed policy, including \
   the policy document.\n\n\
  \  Policies returned by this operation are URL-encoded compliant with \
   {{:https://tools.ietf.org/html/rfc3986}RFC 3986}. You can use a URL decoding method to convert \
   the policy back to plain JSON text. For example, if you use Java, you can use the [decode] \
   method of the [java.net.URLDecoder] utility class in the Java SDK. Other languages and SDKs \
   provide similar functionality, and some SDKs do this decoding automatically.\n\
  \  \n\
  \    To list the available versions for a policy, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPolicyVersions.html}ListPolicyVersions}.\n\
  \    \n\
  \     This operation retrieves information about managed policies. To retrieve information about \
   an inline policy that is embedded in a user, group, or role, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetUserPolicy.html}GetUserPolicy}, \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetGroupPolicy.html}GetGroupPolicy}, \
   or {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetRolePolicy.html}GetRolePolicy}.\n\
  \     \n\
  \      For more information about the types of policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \      \n\
  \       For more information about managed policy versions, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html}Versioning \
   for managed policies} in the {i IAM User Guide}.\n\
  \       "]

module GetRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_role_request ->
    ( get_role_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_role_request ->
    ( get_role_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about the specified role, including the role's path, GUID, ARN, and the \
   role's trust policy that grants permission to assume the role. For more information about \
   roles, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html}IAM roles} in the \
   {i IAM User Guide}.\n\n\
  \  Policies returned by this operation are URL-encoded compliant with \
   {{:https://tools.ietf.org/html/rfc3986}RFC 3986}. You can use a URL decoding method to convert \
   the policy back to plain JSON text. For example, if you use Java, you can use the [decode] \
   method of the [java.net.URLDecoder] utility class in the Java SDK. Other languages and SDKs \
   provide similar functionality, and some SDKs do this decoding automatically.\n\
  \  \n\
  \   "]

module GetRolePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_role_policy_request ->
    ( get_role_policy_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_role_policy_request ->
    ( get_role_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the specified inline policy document that is embedded with the specified IAM role.\n\n\
  \  Policies returned by this operation are URL-encoded compliant with \
   {{:https://tools.ietf.org/html/rfc3986}RFC 3986}. You can use a URL decoding method to convert \
   the policy back to plain JSON text. For example, if you use Java, you can use the [decode] \
   method of the [java.net.URLDecoder] utility class in the Java SDK. Other languages and SDKs \
   provide similar functionality, and some SDKs do this decoding automatically.\n\
  \  \n\
  \    An IAM role can also have managed policies attached to it. To retrieve a managed policy \
   document that is attached to a role, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicy.html}GetPolicy} to \
   determine the policy's default version, then use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicyVersion.html}GetPolicyVersion} \
   to retrieve the policy document.\n\
  \    \n\
  \     For more information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \     \n\
  \       For more information about roles, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html}IAM roles} in the {i IAM User \
   Guide}.\n\
  \      "]

module GetSAMLProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_saml_provider_request ->
    ( get_saml_provider_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_saml_provider_request ->
    ( get_saml_provider_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the SAML provider metadocument that was uploaded when the IAM SAML provider resource \
   object was created or updated.\n\n\
  \  This operation requires \
   {{:https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html}Signature Version 4}.\n\
  \  \n\
  \   "]

module GetSSHPublicKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `UnrecognizedPublicKeyEncodingException of unrecognized_public_key_encoding_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ssh_public_key_request ->
    ( get_ssh_public_key_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `UnrecognizedPublicKeyEncodingException of unrecognized_public_key_encoding_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ssh_public_key_request ->
    ( get_ssh_public_key_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `UnrecognizedPublicKeyEncodingException of unrecognized_public_key_encoding_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the specified SSH public key, including metadata about the key.\n\n\
  \ The SSH public key retrieved by this operation is used only for authenticating the associated \
   IAM user to an CodeCommit repository. For more information about using SSH keys to authenticate \
   to an CodeCommit repository, see \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html}Set \
   up CodeCommit for SSH connections} in the {i CodeCommit User Guide}.\n\
  \ "]

module GetServerCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_server_certificate_request ->
    ( get_server_certificate_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_server_certificate_request ->
    ( get_server_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about the specified server certificate stored in IAM.\n\n\
  \ For more information about working with server certificates, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html}Working \
   with server certificates} in the {i IAM User Guide}. This topic includes a list of Amazon Web \
   Services services that can use the server certificates that you manage with IAM.\n\
  \ "]

module GetServiceLastAccessedDetails : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_service_last_accessed_details_request ->
    ( get_service_last_accessed_details_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_service_last_accessed_details_request ->
    ( get_service_last_accessed_details_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a service last accessed report that was created using the \
   [GenerateServiceLastAccessedDetails] operation. You can use the [JobId] parameter in \
   [GetServiceLastAccessedDetails] to retrieve the status of your report job. When the report is \
   complete, you can retrieve the generated report. The report includes a list of Amazon Web \
   Services services that the resource (user, group, role, or managed policy) can access.\n\n\
  \  Service last accessed data does not use other policy types when determining whether a \
   resource could access a service. These other policy types include resource-based policies, \
   access control lists, Organizations policies, IAM permissions boundaries, and STS assume role \
   policies. It only applies permissions policy logic. For more about the evaluation of policy \
   types, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics}Evaluating \
   policies} in the {i IAM User Guide}.\n\
  \  \n\
  \    For each service that the resource could access using permissions policies, the operation \
   returns details about the most recent access attempt. If there was no attempt, the service is \
   listed without details about the most recent attempt to access the service. If the operation \
   fails, the [GetServiceLastAccessedDetails] operation returns the reason that it failed.\n\
  \    \n\
  \     The [GetServiceLastAccessedDetails] operation returns a list of services. This list \
   includes the number of entities that have attempted to access the service and the date and time \
   of the last attempt. It also returns the ARN of the following entity, depending on the resource \
   ARN that you used to generate the report:\n\
  \     \n\
  \      {ul\n\
  \            {-   {b User} \226\128\147 Returns the user ARN that you used to generate the report\n\
  \                \n\
  \                 }\n\
  \            {-   {b Group} \226\128\147 Returns the ARN of the group member (user) that last \
   attempted to access the service\n\
  \                \n\
  \                 }\n\
  \            {-   {b Role} \226\128\147 Returns the role ARN that you used to generate the report\n\
  \                \n\
  \                 }\n\
  \            {-   {b Policy} \226\128\147 Returns the ARN of the user or role that last used the \
   policy to attempt to access the service\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   By default, the list is sorted by service namespace.\n\
  \   \n\
  \    If you specified [ACTION_LEVEL] granularity when you generated the report, this operation \
   returns service and action last accessed data. This includes the most recent access attempt for \
   each tracked action within a service. Otherwise, this operation returns only service data.\n\
  \    \n\
  \     For more information about service and action last accessed data, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html}Reducing \
   permissions using service last accessed data} in the {i IAM User Guide}.\n\
  \     "]

module GetServiceLastAccessedDetailsWithEntities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_service_last_accessed_details_with_entities_request ->
    ( get_service_last_accessed_details_with_entities_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_service_last_accessed_details_with_entities_request ->
    ( get_service_last_accessed_details_with_entities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "After you generate a group or policy report using the [GenerateServiceLastAccessedDetails] \
   operation, you can use the [JobId] parameter in [GetServiceLastAccessedDetailsWithEntities]. \
   This operation retrieves the status of your report job and a list of entities that could have \
   used group or policy permissions to access the specified service.\n\n\
  \ {ul\n\
  \       {-   {b Group} \226\128\147 For a group report, this operation returns a list of users \
   in the group that could have used the group\226\128\153s policies in an attempt to access the \
   service.\n\
  \           \n\
  \            }\n\
  \       {-   {b Policy} \226\128\147 For a policy report, this operation returns a list of \
   entities (users or roles) that could have used the policy in an attempt to access the service.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   You can also use this operation for user or role reports to retrieve details about those \
   entities.\n\
  \   \n\
  \    If the operation fails, the [GetServiceLastAccessedDetailsWithEntities] operation returns \
   the reason that it failed.\n\
  \    \n\
  \     By default, the list of associated entities is sorted by date, with the most recent access \
   listed first.\n\
  \     "]

module GetServiceLinkedRoleDeletionStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_service_linked_role_deletion_status_request ->
    ( get_service_linked_role_deletion_status_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_service_linked_role_deletion_status_request ->
    ( get_service_linked_role_deletion_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the status of your service-linked role deletion. After you use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteServiceLinkedRole.html}DeleteServiceLinkedRole} \
   to submit a service-linked role for deletion, you can use the [DeletionTaskId] parameter in \
   [GetServiceLinkedRoleDeletionStatus] to check the status of the deletion. If the deletion \
   fails, this operation returns the reason that it failed, if that information is returned by the \
   service.\n"]

module GetUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_user_request ->
    ( get_user_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_user_request ->
    ( get_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about the specified IAM user, including the user's creation date, path, \
   unique ID, and ARN.\n\n\
  \ If you do not specify a user name, IAM determines the user name implicitly based on the Amazon \
   Web Services access key ID used to sign the request to this operation.\n\
  \ "]

module GetUserPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_user_policy_request ->
    ( get_user_policy_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_user_policy_request ->
    ( get_user_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the specified inline policy document that is embedded in the specified IAM user.\n\n\
  \  Policies returned by this operation are URL-encoded compliant with \
   {{:https://tools.ietf.org/html/rfc3986}RFC 3986}. You can use a URL decoding method to convert \
   the policy back to plain JSON text. For example, if you use Java, you can use the [decode] \
   method of the [java.net.URLDecoder] utility class in the Java SDK. Other languages and SDKs \
   provide similar functionality, and some SDKs do this decoding automatically.\n\
  \  \n\
  \    An IAM user can also have managed policies attached to it. To retrieve a managed policy \
   document that is attached to a user, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicy.html}GetPolicy} to \
   determine the policy's default version. Then use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicyVersion.html}GetPolicyVersion} \
   to retrieve the policy document.\n\
  \    \n\
  \     For more information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \     "]

module ListAccessKeys : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_access_keys_request ->
    ( list_access_keys_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_access_keys_request ->
    ( list_access_keys_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the access key IDs associated with the specified IAM user. If there \
   is none, the operation returns an empty list.\n\n\
  \ Although each user is limited to a small number of keys, you can still paginate the results \
   using the [MaxItems] and [Marker] parameters.\n\
  \ \n\
  \  If the [UserName] is not specified, the user name is determined implicitly based on the \
   Amazon Web Services access key ID used to sign the request. If a temporary access key is used, \
   then [UserName] is required. If a long-term key is assigned to the user, then [UserName] is not \
   required.\n\
  \  \n\
  \   This operation works for access keys under the Amazon Web Services account. If the Amazon \
   Web Services account has no associated users, the root user returns it's own access key IDs by \
   running this command.\n\
  \   \n\
  \     To ensure the security of your Amazon Web Services account, the secret access key is \
   accessible only during key and user creation.\n\
  \     \n\
  \      "]

module ListAccountAliases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_account_aliases_request ->
    ( list_account_aliases_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_account_aliases_request ->
    ( list_account_aliases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the account alias associated with the Amazon Web Services account (Note: you can have \
   only one). For information about using an Amazon Web Services account alias, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/console_account-alias.html#CreateAccountAlias}Creating, \
   deleting, and listing an Amazon Web Services account alias} in the {i IAM User Guide}.\n"]

module ListAttachedGroupPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_attached_group_policies_request ->
    ( list_attached_group_policies_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_attached_group_policies_request ->
    ( list_attached_group_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all managed policies that are attached to the specified IAM group.\n\n\
  \ An IAM group can also have inline policies embedded with it. To list the inline policies for a \
   group, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListGroupPolicies.html}ListGroupPolicies}. \
   For information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \ \n\
  \  You can paginate the results using the [MaxItems] and [Marker] parameters. You can use the \
   [PathPrefix] parameter to limit the list of policies to only those matching the specified path \
   prefix. If there are no policies attached to the specified group (or none that match the \
   specified path prefix), the operation returns an empty list.\n\
  \  "]

module ListAttachedRolePolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_attached_role_policies_request ->
    ( list_attached_role_policies_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_attached_role_policies_request ->
    ( list_attached_role_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all managed policies that are attached to the specified IAM role.\n\n\
  \ An IAM role can also have inline policies embedded with it. To list the inline policies for a \
   role, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListRolePolicies.html}ListRolePolicies}. \
   For information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \ \n\
  \  You can paginate the results using the [MaxItems] and [Marker] parameters. You can use the \
   [PathPrefix] parameter to limit the list of policies to only those matching the specified path \
   prefix. If there are no policies attached to the specified role (or none that match the \
   specified path prefix), the operation returns an empty list.\n\
  \  "]

module ListAttachedUserPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_attached_user_policies_request ->
    ( list_attached_user_policies_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_attached_user_policies_request ->
    ( list_attached_user_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all managed policies that are attached to the specified IAM user.\n\n\
  \ An IAM user can also have inline policies embedded with it. To list the inline policies for a \
   user, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListUserPolicies.html}ListUserPolicies}. \
   For information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \ \n\
  \  You can paginate the results using the [MaxItems] and [Marker] parameters. You can use the \
   [PathPrefix] parameter to limit the list of policies to only those matching the specified path \
   prefix. If there are no policies attached to the specified group (or none that match the \
   specified path prefix), the operation returns an empty list.\n\
  \  "]

module ListDelegationRequests : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_delegation_requests_request ->
    ( list_delegation_requests_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_delegation_requests_request ->
    ( list_delegation_requests_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists delegation requests based on the specified criteria.\n\n\
  \ If a delegation request has no owner, even if it is assigned to a specific account, it will \
   not be part of the [ListDelegationRequests] output for that account.\n\
  \ \n\
  \   For more details, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-temporary-delegation.html#temporary-delegation-managing-permissions} \
   Managing Permissions for Delegation Requests}. \n\
  \  "]

module ListEntitiesForPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_entities_for_policy_request ->
    ( list_entities_for_policy_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_entities_for_policy_request ->
    ( list_entities_for_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all IAM users, groups, and roles that the specified managed policy is attached to.\n\n\
  \ You can use the optional [EntityFilter] parameter to limit the results to a particular type of \
   entity (users, groups, or roles). For example, to list only the roles that are attached to the \
   specified policy, set [EntityFilter] to [Role].\n\
  \ \n\
  \  You can paginate the results using the [MaxItems] and [Marker] parameters.\n\
  \  "]

module ListGroupPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_group_policies_request ->
    ( list_group_policies_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_group_policies_request ->
    ( list_group_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the names of the inline policies that are embedded in the specified IAM group.\n\n\
  \ An IAM group can also have managed policies attached to it. To list the managed policies that \
   are attached to a group, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAttachedGroupPolicies.html}ListAttachedGroupPolicies}. \
   For more information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \ \n\
  \  You can paginate the results using the [MaxItems] and [Marker] parameters. If there are no \
   inline policies embedded with the specified group, the operation returns an empty list.\n\
  \  "]

module ListGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_groups_request ->
    ( list_groups_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_groups_request ->
    ( list_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the IAM groups that have the specified path prefix.\n\n\
  \  You can paginate the results using the [MaxItems] and [Marker] parameters.\n\
  \ "]

module ListGroupsForUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_groups_for_user_request ->
    ( list_groups_for_user_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_groups_for_user_request ->
    ( list_groups_for_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the IAM groups that the specified IAM user belongs to.\n\n\
  \ You can paginate the results using the [MaxItems] and [Marker] parameters.\n\
  \ "]

module ListInstanceProfileTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_instance_profile_tags_request ->
    ( list_instance_profile_tags_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_instance_profile_tags_request ->
    ( list_instance_profile_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags that are attached to the specified IAM instance profile. The returned list of \
   tags is sorted by tag key. For more information about tagging, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} in the \
   {i IAM User Guide}.\n"]

module ListInstanceProfiles : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_instance_profiles_request ->
    ( list_instance_profiles_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_instance_profiles_request ->
    ( list_instance_profiles_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the instance profiles that have the specified path prefix. If there are none, the \
   operation returns an empty list. For more information about instance profiles, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html}Using \
   instance profiles} in the {i IAM User Guide}.\n\n\
  \  IAM resource-listing operations return a subset of the available attributes for the resource. \
   For example, this operation does not return tags, even though they are an attribute of the \
   returned object. To view all of the information for an instance profile, see \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetInstanceProfile.html}GetInstanceProfile}.\n\
  \  \n\
  \    You can paginate the results using the [MaxItems] and [Marker] parameters.\n\
  \    "]

module ListInstanceProfilesForRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_instance_profiles_for_role_request ->
    ( list_instance_profiles_for_role_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_instance_profiles_for_role_request ->
    ( list_instance_profiles_for_role_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the instance profiles that have the specified associated IAM role. If there are none, the \
   operation returns an empty list. For more information about instance profiles, go to \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html}Using \
   instance profiles} in the {i IAM User Guide}.\n\n\
  \ You can paginate the results using the [MaxItems] and [Marker] parameters.\n\
  \ "]

module ListMFADeviceTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_mfa_device_tags_request ->
    ( list_mfa_device_tags_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_mfa_device_tags_request ->
    ( list_mfa_device_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags that are attached to the specified IAM virtual multi-factor authentication (MFA) \
   device. The returned list of tags is sorted by tag key. For more information about tagging, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} in the \
   {i IAM User Guide}.\n"]

module ListMFADevices : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_mfa_devices_request ->
    ( list_mfa_devices_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_mfa_devices_request ->
    ( list_mfa_devices_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the MFA devices for an IAM user. If the request includes a IAM user name, then this \
   operation lists all the MFA devices associated with the specified user. If you do not specify a \
   user name, IAM determines the user name implicitly based on the Amazon Web Services access key \
   ID signing the request for this operation.\n\n\
  \ You can paginate the results using the [MaxItems] and [Marker] parameters.\n\
  \ "]

module ListOpenIDConnectProviderTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_open_id_connect_provider_tags_request ->
    ( list_open_id_connect_provider_tags_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_open_id_connect_provider_tags_request ->
    ( list_open_id_connect_provider_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags that are attached to the specified OpenID Connect (OIDC)-compatible identity \
   provider. The returned list of tags is sorted by tag key. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html}About web \
   identity federation}.\n\n\
  \ For more information about tagging, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} in the \
   {i IAM User Guide}.\n\
  \ "]

module ListOpenIDConnectProviders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_open_id_connect_providers_request ->
    ( list_open_id_connect_providers_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_open_id_connect_providers_request ->
    ( list_open_id_connect_providers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists information about the IAM OpenID Connect (OIDC) provider resource objects defined in the \
   Amazon Web Services account.\n\n\
  \  IAM resource-listing operations return a subset of the available attributes for the resource. \
   For example, this operation does not return tags, even though they are an attribute of the \
   returned object. To view all of the information for an OIDC provider, see \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOpenIDConnectProvider.html}GetOpenIDConnectProvider}.\n\
  \  \n\
  \   "]

module ListOrganizationsFeatures : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccountNotManagementOrDelegatedAdministratorException of
      account_not_management_or_delegated_administrator_exception
    | `OrganizationNotFoundException of organization_not_found_exception
    | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
    | `ServiceAccessNotEnabledException of service_access_not_enabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_organizations_features_request ->
    ( list_organizations_features_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountNotManagementOrDelegatedAdministratorException of
        account_not_management_or_delegated_administrator_exception
      | `OrganizationNotFoundException of organization_not_found_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `ServiceAccessNotEnabledException of service_access_not_enabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_organizations_features_request ->
    ( list_organizations_features_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountNotManagementOrDelegatedAdministratorException of
        account_not_management_or_delegated_administrator_exception
      | `OrganizationNotFoundException of organization_not_found_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `ServiceAccessNotEnabledException of service_access_not_enabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the centralized root access features enabled for your organization. For more information, \
   see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html#id_root-user-access-management}Centrally \
   manage root access for member accounts}.\n"]

module ListPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_policies_request ->
    ( list_policies_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_policies_request ->
    ( list_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the managed policies that are available in your Amazon Web Services account, \
   including your own customer-defined managed policies and all Amazon Web Services managed \
   policies.\n\n\
  \ You can filter the list of policies that is returned using the optional [OnlyAttached], \
   [Scope], and [PathPrefix] parameters. For example, to list only the customer managed policies \
   in your Amazon Web Services account, set [Scope] to [Local]. To list only Amazon Web Services \
   managed policies, set [Scope] to [AWS].\n\
  \ \n\
  \  You can paginate the results using the [MaxItems] and [Marker] parameters.\n\
  \  \n\
  \   For more information about managed policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \   \n\
  \     IAM resource-listing operations return a subset of the available attributes for the \
   resource. For example, this operation does not return tags, even though they are an attribute \
   of the returned object. To view all of the information for a customer manged policy, see \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicy.html}GetPolicy}.\n\
  \     \n\
  \      "]

module ListPoliciesGrantingServiceAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_policies_granting_service_access_request ->
    ( list_policies_granting_service_access_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_policies_granting_service_access_request ->
    ( list_policies_granting_service_access_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of policies that the IAM identity (user, group, or role) can use to access \
   each specified service.\n\n\
  \  This operation does not use other policy types when determining whether a resource could \
   access a service. These other policy types include resource-based policies, access control \
   lists, Organizations policies, IAM permissions boundaries, and STS assume role policies. It \
   only applies permissions policy logic. For more about the evaluation of policy types, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics}Evaluating \
   policies} in the {i IAM User Guide}.\n\
  \  \n\
  \    The list of policies returned by the operation depends on the ARN of the identity that you \
   provide.\n\
  \    \n\
  \     {ul\n\
  \           {-   {b User} \226\128\147 The list of policies includes the managed and inline \
   policies that are attached to the user directly. The list also includes any additional managed \
   and inline policies that are attached to the group to which the user belongs. \n\
  \               \n\
  \                }\n\
  \           {-   {b Group} \226\128\147 The list of policies includes only the managed and \
   inline policies that are attached to the group directly. Policies that are attached to the \
   group\226\128\153s user are not included.\n\
  \               \n\
  \                }\n\
  \           {-   {b Role} \226\128\147 The list of policies includes only the managed and inline \
   policies that are attached to the role.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   For each managed policy, this operation returns the ARN and policy name. For each inline \
   policy, it returns the policy name and the entity to which it is attached. Inline policies do \
   not have an ARN. For more information about these policy types, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \   \n\
  \    Policies that are attached to users and roles as permissions boundaries are not returned. \
   To view which managed policy is currently used to set the permissions boundary for a user or \
   role, use the {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetUser.html}GetUser} \
   or {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetRole.html}GetRole} operations.\n\
  \    "]

module ListPolicyTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_policy_tags_request ->
    ( list_policy_tags_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_policy_tags_request ->
    ( list_policy_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags that are attached to the specified IAM customer managed policy. The returned \
   list of tags is sorted by tag key. For more information about tagging, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} in the \
   {i IAM User Guide}.\n"]

module ListPolicyVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_policy_versions_request ->
    ( list_policy_versions_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_policy_versions_request ->
    ( list_policy_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists information about the versions of the specified managed policy, including the version \
   that is currently set as the policy's default version.\n\n\
  \ For more information about managed policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \ "]

module ListRolePolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_role_policies_request ->
    ( list_role_policies_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_role_policies_request ->
    ( list_role_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the names of the inline policies that are embedded in the specified IAM role.\n\n\
  \ An IAM role can also have managed policies attached to it. To list the managed policies that \
   are attached to a role, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAttachedRolePolicies.html}ListAttachedRolePolicies}. \
   For more information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \ \n\
  \  You can paginate the results using the [MaxItems] and [Marker] parameters. If there are no \
   inline policies embedded with the specified role, the operation returns an empty list.\n\
  \  "]

module ListRoleTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_role_tags_request ->
    ( list_role_tags_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_role_tags_request ->
    ( list_role_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags that are attached to the specified role. The returned list of tags is sorted by \
   tag key. For more information about tagging, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} in the \
   {i IAM User Guide}.\n"]

module ListRoles : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_roles_request ->
    ( list_roles_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_roles_request ->
    ( list_roles_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the IAM roles that have the specified path prefix. If there are none, the operation \
   returns an empty list. For more information about roles, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html}IAM roles} in the {i IAM User \
   Guide}.\n\n\
  \  IAM resource-listing operations return a subset of the available attributes for the resource. \
   This operation does not return the following attributes, even though they are an attribute of \
   the returned object:\n\
  \  \n\
  \   {ul\n\
  \         {-  PermissionsBoundary\n\
  \             \n\
  \              }\n\
  \         {-  RoleLastUsed\n\
  \             \n\
  \              }\n\
  \         {-  Tags\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   To view all of the information for a role, see \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetRole.html}GetRole}.\n\
  \   \n\
  \     You can paginate the results using the [MaxItems] and [Marker] parameters.\n\
  \     "]

module ListSAMLProviderTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_saml_provider_tags_request ->
    ( list_saml_provider_tags_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_saml_provider_tags_request ->
    ( list_saml_provider_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags that are attached to the specified Security Assertion Markup Language (SAML) \
   identity provider. The returned list of tags is sorted by tag key. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html}About SAML \
   2.0-based federation}.\n\n\
  \ For more information about tagging, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} in the \
   {i IAM User Guide}.\n\
  \ "]

module ListSAMLProviders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_saml_providers_request ->
    ( list_saml_providers_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_saml_providers_request ->
    ( list_saml_providers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the SAML provider resource objects defined in IAM in the account. IAM resource-listing \
   operations return a subset of the available attributes for the resource. For example, this \
   operation does not return tags, even though they are an attribute of the returned object. To \
   view all of the information for a SAML provider, see \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetSAMLProvider.html}GetSAMLProvider}.\n\n\
  \   This operation requires \
   {{:https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html}Signature Version 4}.\n\
  \  \n\
  \   "]

module ListSSHPublicKeys : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_ssh_public_keys_request ->
    ( list_ssh_public_keys_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_ssh_public_keys_request ->
    ( list_ssh_public_keys_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the SSH public keys associated with the specified IAM user. If none \
   exists, the operation returns an empty list.\n\n\
  \ The SSH public keys returned by this operation are used only for authenticating the IAM user \
   to an CodeCommit repository. For more information about using SSH keys to authenticate to an \
   CodeCommit repository, see \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html}Set \
   up CodeCommit for SSH connections} in the {i CodeCommit User Guide}.\n\
  \ \n\
  \  Although each user is limited to a small number of keys, you can still paginate the results \
   using the [MaxItems] and [Marker] parameters.\n\
  \  "]

module ListServerCertificateTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_server_certificate_tags_request ->
    ( list_server_certificate_tags_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_server_certificate_tags_request ->
    ( list_server_certificate_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags that are attached to the specified IAM server certificate. The returned list of \
   tags is sorted by tag key. For more information about tagging, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} in the \
   {i IAM User Guide}.\n\n\
  \  For certificates in a Region supported by Certificate Manager (ACM), we recommend that you \
   don't use IAM server certificates. Instead, use ACM to provision, manage, and deploy your \
   server certificates. For more information about IAM server certificates, \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html}Working \
   with server certificates} in the {i IAM User Guide}.\n\
  \  \n\
  \   "]

module ListServerCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_server_certificates_request ->
    ( list_server_certificates_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_server_certificates_request ->
    ( list_server_certificates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the server certificates stored in IAM that have the specified path prefix. If none exist, \
   the operation returns an empty list.\n\n\
  \  You can paginate the results using the [MaxItems] and [Marker] parameters.\n\
  \ \n\
  \  For more information about working with server certificates, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html}Working \
   with server certificates} in the {i IAM User Guide}. This topic also includes a list of Amazon \
   Web Services services that can use the server certificates that you manage with IAM.\n\
  \  \n\
  \    IAM resource-listing operations return a subset of the available attributes for the \
   resource. For example, this operation does not return tags, even though they are an attribute \
   of the returned object. To view all of the information for a servercertificate, see \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServerCertificate.html}GetServerCertificate}.\n\
  \    \n\
  \     "]

module ListServiceSpecificCredentials : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceNotSupportedException of service_not_supported_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_service_specific_credentials_request ->
    ( list_service_specific_credentials_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceNotSupportedException of service_not_supported_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_service_specific_credentials_request ->
    ( list_service_specific_credentials_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceNotSupportedException of service_not_supported_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the service-specific credentials associated with the specified IAM \
   user. If none exists, the operation returns an empty list. The service-specific credentials \
   returned by this operation are used only for authenticating the IAM user to a specific service. \
   For more information about using service-specific credentials to authenticate to an Amazon Web \
   Services service, refer to the following docs:\n\n\
  \ {ul\n\
  \       {-  For service-specific credentials with CodeCommit, refer to \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_ssh-keys.html}IAM \
   credentials for CodeCommit: Git credentials, SSH keys, and Amazon Web Services access keys} in \
   the {i IAM User Guide}.\n\
  \           \n\
  \            }\n\
  \       {-  For service-specific credentials with Amazon Keyspaces (for Apache Cassandra), refer \
   to {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_keyspaces.html}Use IAM \
   with Amazon Keyspaces (for Apache Cassandra)} in the {i IAM User Guide}.\n\
  \           \n\
  \            }\n\
  \       {-  For services that support long-term API keys, refer to \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_api_keys_for_aws_services.html}API \
   keys for Amazon Web Services services} in the {i IAM User Guide}.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module ListSigningCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_signing_certificates_request ->
    ( list_signing_certificates_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_signing_certificates_request ->
    ( list_signing_certificates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the signing certificates associated with the specified IAM user. If \
   none exists, the operation returns an empty list.\n\n\
  \ Although each user is limited to a small number of signing certificates, you can still \
   paginate the results using the [MaxItems] and [Marker] parameters.\n\
  \ \n\
  \  If the [UserName] field is not specified, the user name is determined implicitly based on the \
   Amazon Web Services access key ID used to sign the request for this operation. This operation \
   works for access keys under the Amazon Web Services account. Consequently, you can use this \
   operation to manage Amazon Web Services account root user credentials even if the Amazon Web \
   Services account has no associated users.\n\
  \  "]

module ListUserPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_user_policies_request ->
    ( list_user_policies_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_user_policies_request ->
    ( list_user_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the names of the inline policies embedded in the specified IAM user.\n\n\
  \ An IAM user can also have managed policies attached to it. To list the managed policies that \
   are attached to a user, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAttachedUserPolicies.html}ListAttachedUserPolicies}. \
   For more information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \ \n\
  \  You can paginate the results using the [MaxItems] and [Marker] parameters. If there are no \
   inline policies embedded with the specified user, the operation returns an empty list.\n\
  \  "]

module ListUserTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_user_tags_request ->
    ( list_user_tags_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_user_tags_request ->
    ( list_user_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags that are attached to the specified IAM user. The returned list of tags is sorted \
   by tag key. For more information about tagging, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} in the \
   {i IAM User Guide}.\n"]

module ListUsers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_users_request ->
    ( list_users_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_users_request ->
    ( list_users_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the IAM users that have the specified path prefix. If no path prefix is specified, the \
   operation returns all users in the Amazon Web Services account. If there are none, the \
   operation returns an empty list.\n\n\
  \  IAM resource-listing operations return a subset of the available attributes for the resource. \
   This operation does not return the following attributes, even though they are an attribute of \
   the returned object:\n\
  \  \n\
  \   {ul\n\
  \         {-  PermissionsBoundary\n\
  \             \n\
  \              }\n\
  \         {-  Tags\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   To view all of the information for a user, see \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetUser.html}GetUser}.\n\
  \   \n\
  \     You can paginate the results using the [MaxItems] and [Marker] parameters.\n\
  \     "]

module ListVirtualMFADevices : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_virtual_mfa_devices_request ->
    (list_virtual_mfa_devices_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_virtual_mfa_devices_request ->
    ( list_virtual_mfa_devices_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the virtual MFA devices defined in the Amazon Web Services account by assignment status. \
   If you do not specify an assignment status, the operation returns a list of all virtual MFA \
   devices. Assignment status can be [Assigned], [Unassigned], or [Any].\n\n\
  \  IAM resource-listing operations return a subset of the available attributes for the resource. \
   For example, this operation does not return tags, even though they are an attribute of the \
   returned object. To view tag information for a virtual MFA device, see \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListMFADeviceTags.html}ListMFADeviceTags}.\n\
  \  \n\
  \    You can paginate the results using the [MaxItems] and [Marker] parameters.\n\
  \    "]

module PutGroupPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_group_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_group_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or updates an inline policy document that is embedded in the specified IAM group.\n\n\
  \ A user can also have managed policies attached to it. To attach a managed policy to a group, \
   use {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_AttachGroupPolicy.html} \
   [AttachGroupPolicy] }. To create a new managed policy, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicy.html} [CreatePolicy] }. \
   For information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \ \n\
  \  For information about the maximum number of inline policies that you can embed in a group, \
   see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html}IAM and STS \
   quotas} in the {i IAM User Guide}.\n\
  \  \n\
  \    Because policy documents can be large, you should use POST rather than GET when calling \
   [PutGroupPolicy]. For general information about using the Query API with IAM, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html}Making query \
   requests} in the {i IAM User Guide}.\n\
  \    \n\
  \     "]

module PutRolePermissionsBoundary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `PolicyNotAttachableException of policy_not_attachable_exception
    | `ServiceFailureException of service_failure_exception
    | `UnmodifiableEntityException of unmodifiable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_role_permissions_boundary_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PolicyNotAttachableException of policy_not_attachable_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_role_permissions_boundary_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PolicyNotAttachableException of policy_not_attachable_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or updates the policy that is specified as the IAM role's permissions boundary. You can \
   use an Amazon Web Services managed policy or a customer managed policy to set the boundary for \
   a role. Use the boundary to control the maximum permissions that the role can have. Setting a \
   permissions boundary is an advanced feature that can affect the permissions for the role.\n\n\
  \ You cannot set the boundary for a service-linked role.\n\
  \ \n\
  \   Policies used as permissions boundaries do not provide permissions. You must also attach a \
   permissions policy to the role. To learn how the effective permissions for a role are \
   evaluated, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html}IAM \
   JSON policy evaluation logic} in the IAM User Guide. \n\
  \   \n\
  \    "]

module PutRolePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception
    | `UnmodifiableEntityException of unmodifiable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_role_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_role_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or updates an inline policy document that is embedded in the specified IAM role.\n\n\
  \ When you embed an inline policy in a role, the inline policy is used as part of the role's \
   access (permissions) policy. The role's trust policy is created at the same time as the role, \
   using {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html} [CreateRole] \
   }. You can update a role's trust policy using \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateAssumeRolePolicy.html} \
   [UpdateAssumeRolePolicy] }. For more information about roles, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html}IAM roles} in the {i \
   IAM User Guide}.\n\
  \ \n\
  \  A role can also have a managed policy attached to it. To attach a managed policy to a role, \
   use {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_AttachRolePolicy.html} \
   [AttachRolePolicy] }. To create a new managed policy, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicy.html} [CreatePolicy] }. \
   For information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \  \n\
  \   For information about the maximum number of inline policies that you can embed with a role, \
   see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html}IAM and STS \
   quotas} in the {i IAM User Guide}.\n\
  \   \n\
  \     Because policy documents can be large, you should use POST rather than GET when calling \
   [PutRolePolicy]. For general information about using the Query API with IAM, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html}Making query \
   requests} in the {i IAM User Guide}.\n\
  \     \n\
  \      "]

module PutUserPermissionsBoundary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `PolicyNotAttachableException of policy_not_attachable_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_user_permissions_boundary_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PolicyNotAttachableException of policy_not_attachable_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_user_permissions_boundary_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PolicyNotAttachableException of policy_not_attachable_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or updates the policy that is specified as the IAM user's permissions boundary. You can \
   use an Amazon Web Services managed policy or a customer managed policy to set the boundary for \
   a user. Use the boundary to control the maximum permissions that the user can have. Setting a \
   permissions boundary is an advanced feature that can affect the permissions for the user.\n\n\
  \  Policies that are used as permissions boundaries do not provide permissions. You must also \
   attach a permissions policy to the user. To learn how the effective permissions for a user are \
   evaluated, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html}IAM \
   JSON policy evaluation logic} in the IAM User Guide. \n\
  \  \n\
  \   "]

module PutUserPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_user_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_user_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or updates an inline policy document that is embedded in the specified IAM user.\n\n\
  \ An IAM user can also have a managed policy attached to it. To attach a managed policy to a \
   user, use {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_AttachUserPolicy.html} \
   [AttachUserPolicy] }. To create a new managed policy, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicy.html} [CreatePolicy] }. \
   For information about policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \ \n\
  \  For information about the maximum number of inline policies that you can embed in a user, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html}IAM and STS \
   quotas} in the {i IAM User Guide}.\n\
  \  \n\
  \    Because policy documents can be large, you should use POST rather than GET when calling \
   [PutUserPolicy]. For general information about using the Query API with IAM, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html}Making query \
   requests} in the {i IAM User Guide}.\n\
  \    \n\
  \     "]

module RejectDelegationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_delegation_request_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_delegation_request_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Rejects a delegation request, denying the requested temporary access.\n\n\
  \ Once a request is rejected, it cannot be accepted or updated later. Rejected requests expire \
   after 7 days.\n\
  \ \n\
  \  When rejecting a request, an optional explanation can be added using the [Notes] request \
   parameter.\n\
  \  \n\
  \    For more details, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-temporary-delegation.html#temporary-delegation-managing-permissions} \
   Managing Permissions for Delegation Requests}. \n\
  \   "]

module RemoveClientIDFromOpenIDConnectProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_client_id_from_open_id_connect_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_client_id_from_open_id_connect_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified client ID (also known as audience) from the list of client IDs registered \
   for the specified IAM OpenID Connect (OIDC) provider resource object.\n\n\
  \ This operation is idempotent; it does not fail or return an error if you try to remove a \
   client ID that does not exist.\n\
  \ "]

module RemoveRoleFromInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception
    | `UnmodifiableEntityException of unmodifiable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_role_from_instance_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_role_from_instance_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified IAM role from the specified Amazon EC2 instance profile.\n\n\
  \  Make sure that you do not have any Amazon EC2 instances running with the role you are about \
   to remove from the instance profile. Removing a role from an instance profile that is \
   associated with a running instance might break any applications running on the instance.\n\
  \  \n\
  \     For more information about roles, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html}IAM roles} in the {i IAM User \
   Guide}. For more information about instance profiles, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html}Using \
   instance profiles} in the {i IAM User Guide}.\n\
  \    "]

module RemoveUserFromGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_user_from_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_user_from_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes the specified user from the specified group.\n"]

module ResetServiceSpecificCredential : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reset_service_specific_credential_request ->
    ( reset_service_specific_credential_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reset_service_specific_credential_request ->
    ( reset_service_specific_credential_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Resets the password for a service-specific credential. The new password is Amazon Web Services \
   generated and cryptographically strong. It cannot be configured by the user. Resetting the \
   password immediately invalidates the previous password associated with this user.\n"]

module ResyncMFADevice : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAuthenticationCodeException of invalid_authentication_code_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resync_mfa_device_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAuthenticationCodeException of invalid_authentication_code_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    resync_mfa_device_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAuthenticationCodeException of invalid_authentication_code_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Synchronizes the specified MFA device with its IAM resource object on the Amazon Web Services \
   servers.\n\n\
  \ For more information about creating and working with virtual MFA devices, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html}Using a virtual MFA \
   device} in the {i IAM User Guide}.\n\
  \ "]

module SendDelegationToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_delegation_token_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_delegation_token_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sends the exchange token for an accepted delegation request.\n\n\
  \ The exchange token is sent to the partner via an asynchronous notification channel, \
   established by the partner.\n\
  \ \n\
  \  The delegation request must be in the [ACCEPTED] state when calling this API. After the \
   [SendDelegationToken] API call is successful, the request transitions to a [FINALIZED] state \
   and cannot be rolled back. However, a user may reject an accepted request before the \
   [SendDelegationToken] API is called.\n\
  \  \n\
  \    For more details, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-temporary-delegation.html#temporary-delegation-managing-permissions} \
   Managing Permissions for Delegation Requests}. \n\
  \   "]

module SetDefaultPolicyVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_default_policy_version_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_default_policy_version_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the specified version of the specified policy as the policy's default (operative) version.\n\n\
  \ This operation affects all users, groups, and roles that the policy is attached to. To list \
   the users, groups, and roles that the policy is attached to, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListEntitiesForPolicy.html}ListEntitiesForPolicy}.\n\
  \ \n\
  \  For information about managed policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}.\n\
  \  "]

module SetSecurityTokenServicePreferences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_security_token_service_preferences_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_security_token_service_preferences_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the specified version of the global endpoint token as the token version used for the \
   Amazon Web Services account.\n\n\
  \ By default, Security Token Service (STS) is available as a global service, and all STS \
   requests go to a single endpoint at [https://sts.amazonaws.com]. Amazon Web Services recommends \
   using Regional STS endpoints to reduce latency, build in redundancy, and increase session token \
   availability. For information about Regional endpoints for STS, see \
   {{:https://docs.aws.amazon.com/general/latest/gr/sts.html}Security Token Service endpoints and \
   quotas} in the {i Amazon Web Services General Reference}.\n\
  \ \n\
  \  If you make an STS call to the global endpoint, the resulting session tokens might be valid \
   in some Regions but not others. It depends on the version that is set in this operation. \
   Version 1 tokens are valid only in Amazon Web Services Regions that are available by default. \
   These tokens do not work in manually enabled Regions, such as Asia Pacific (Hong Kong). Version \
   2 tokens are valid in all Regions. However, version 2 tokens are longer and might affect \
   systems where you temporarily store tokens. For information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html}Activating \
   and deactivating STS in an Amazon Web Services Region} in the {i IAM User Guide}.\n\
  \  \n\
  \   To view the current session token version, see the [GlobalEndpointTokenVersion] entry in the \
   response of the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountSummary.html}GetAccountSummary} \
   operation.\n\
  \   "]

module SimulateCustomPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `PolicyEvaluationException of policy_evaluation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    simulate_custom_policy_request ->
    ( simulate_policy_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `PolicyEvaluationException of policy_evaluation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    simulate_custom_policy_request ->
    ( simulate_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `PolicyEvaluationException of policy_evaluation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Simulate how a set of IAM policies and optionally a resource-based policy works with a list of \
   API operations and Amazon Web Services resources to determine the policies' effective \
   permissions. The policies are provided as strings.\n\n\
  \ The simulation does not perform the API operations; it only checks the authorization to \
   determine if the simulated policies allow or deny the operations. You can simulate resources \
   that don't exist in your account.\n\
  \ \n\
  \  If you want to simulate existing policies that are attached to an IAM user, group, or role, \
   use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulatePrincipalPolicy.html}SimulatePrincipalPolicy} \
   instead.\n\
  \  \n\
  \   Context keys are variables that are maintained by Amazon Web Services and its services and \
   which provide details about the context of an API query request. You can use the [Condition] \
   element of an IAM policy to evaluate context keys. To get the list of context keys that the \
   policies require for correct simulation, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForCustomPolicy.html}GetContextKeysForCustomPolicy}.\n\
  \   \n\
  \    If the output is long, you can use [MaxItems] and [Marker] parameters to paginate the \
   results.\n\
  \    \n\
  \      The IAM policy simulator evaluates statements in the identity-based policy and the inputs \
   that you provide during simulation. The policy simulator results can differ from your live \
   Amazon Web Services environment. We recommend that you check your policies against your live \
   Amazon Web Services environment after testing using the policy simulator to confirm that you \
   have the desired results. For more information about using the policy simulator, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_testing-policies.html}Testing \
   IAM policies with the IAM policy simulator }in the {i IAM User Guide}.\n\
  \      \n\
  \       "]

module SimulatePrincipalPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `PolicyEvaluationException of policy_evaluation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    simulate_principal_policy_request ->
    ( simulate_policy_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PolicyEvaluationException of policy_evaluation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    simulate_principal_policy_request ->
    ( simulate_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PolicyEvaluationException of policy_evaluation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Simulate how a set of IAM policies attached to an IAM entity works with a list of API \
   operations and Amazon Web Services resources to determine the policies' effective permissions. \
   The entity can be an IAM user, group, or role. If you specify a user, then the simulation also \
   includes all of the policies that are attached to groups that the user belongs to. You can \
   simulate resources that don't exist in your account.\n\n\
  \ You can optionally include a list of one or more additional policies specified as strings to \
   include in the simulation. If you want to simulate only policies specified as strings, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulateCustomPolicy.html}SimulateCustomPolicy} \
   instead.\n\
  \ \n\
  \  You can also optionally include one resource-based policy to be evaluated with each of the \
   resources included in the simulation for IAM users only.\n\
  \  \n\
  \   The simulation does not perform the API operations; it only checks the authorization to \
   determine if the simulated policies allow or deny the operations.\n\
  \   \n\
  \     {b Note:} This operation discloses information about the permissions granted to other \
   users. If you do not want users to see other user's permissions, then consider allowing them to \
   use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulateCustomPolicy.html}SimulateCustomPolicy} \
   instead.\n\
  \    \n\
  \     Context keys are variables maintained by Amazon Web Services and its services that provide \
   details about the context of an API query request. You can use the [Condition] element of an \
   IAM policy to evaluate context keys. To get the list of context keys that the policies require \
   for correct simulation, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForPrincipalPolicy.html}GetContextKeysForPrincipalPolicy}.\n\
  \     \n\
  \      If the output is long, you can use the [MaxItems] and [Marker] parameters to paginate the \
   results.\n\
  \      \n\
  \        The IAM policy simulator evaluates statements in the identity-based policy and the \
   inputs that you provide during simulation. The policy simulator results can differ from your \
   live Amazon Web Services environment. We recommend that you check your policies against your \
   live Amazon Web Services environment after testing using the policy simulator to confirm that \
   you have the desired results. For more information about using the policy simulator, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_testing-policies.html}Testing \
   IAM policies with the IAM policy simulator }in the {i IAM User Guide}.\n\
  \        \n\
  \         "]

module TagInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_instance_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_instance_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more tags to an IAM instance profile. If a tag with the same key name already \
   exists, then that tag is overwritten with the new value.\n\n\
  \ Each tag consists of a key name and an associated value. By assigning tags to your resources, \
   you can do the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   {b Administrative grouping and discovery} - Attach tags to resources to aid in \
   organization and search. For example, you could search for all resources with the key name {i \
   Project} and the value {i MyImportantProject}. Or search for all resources with the key name {i \
   Cost Center} and the value {i 41200}. \n\
  \            \n\
  \             }\n\
  \        {-   {b Access control} - Include tags in IAM user-based and resource-based policies. \
   You can use tags to restrict access to only an IAM instance profile that has a specified tag \
   attached. For examples of policies that show how to use tags to control access, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html}Control access using IAM \
   tags} in the {i IAM User Guide}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \    {ul\n\
  \          {-  If any one of the tags is invalid or if you exceed the allowed maximum number of \
   tags, then the entire request fails and the resource is not created. For more information about \
   tagging, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM \
   resources} in the {i IAM User Guide}.\n\
  \              \n\
  \               }\n\
  \          {-  Amazon Web Services always interprets the tag [Value] as a single string. If you \
   need to store an array, you can store comma-separated values in the string. However, you must \
   interpret the value in your code.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module TagMFADevice : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_mfa_device_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_mfa_device_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more tags to an IAM virtual multi-factor authentication (MFA) device. If a tag with \
   the same key name already exists, then that tag is overwritten with the new value.\n\n\
  \ A tag consists of a key name and an associated value. By assigning tags to your resources, you \
   can do the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   {b Administrative grouping and discovery} - Attach tags to resources to aid in \
   organization and search. For example, you could search for all resources with the key name {i \
   Project} and the value {i MyImportantProject}. Or search for all resources with the key name {i \
   Cost Center} and the value {i 41200}. \n\
  \            \n\
  \             }\n\
  \        {-   {b Access control} - Include tags in IAM user-based and resource-based policies. \
   You can use tags to restrict access to only an IAM virtual MFA device that has a specified tag \
   attached. For examples of policies that show how to use tags to control access, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html}Control access using IAM \
   tags} in the {i IAM User Guide}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \    {ul\n\
  \          {-  If any one of the tags is invalid or if you exceed the allowed maximum number of \
   tags, then the entire request fails and the resource is not created. For more information about \
   tagging, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM \
   resources} in the {i IAM User Guide}.\n\
  \              \n\
  \               }\n\
  \          {-  Amazon Web Services always interprets the tag [Value] as a single string. If you \
   need to store an array, you can store comma-separated values in the string. However, you must \
   interpret the value in your code.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module TagOpenIDConnectProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_open_id_connect_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_open_id_connect_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more tags to an OpenID Connect (OIDC)-compatible identity provider. For more \
   information about these providers, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html}About web \
   identity federation}. If a tag with the same key name already exists, then that tag is \
   overwritten with the new value.\n\n\
  \ A tag consists of a key name and an associated value. By assigning tags to your resources, you \
   can do the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   {b Administrative grouping and discovery} - Attach tags to resources to aid in \
   organization and search. For example, you could search for all resources with the key name {i \
   Project} and the value {i MyImportantProject}. Or search for all resources with the key name {i \
   Cost Center} and the value {i 41200}. \n\
  \            \n\
  \             }\n\
  \        {-   {b Access control} - Include tags in IAM identity-based and resource-based \
   policies. You can use tags to restrict access to only an OIDC provider that has a specified tag \
   attached. For examples of policies that show how to use tags to control access, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html}Control access using IAM \
   tags} in the {i IAM User Guide}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \    {ul\n\
  \          {-  If any one of the tags is invalid or if you exceed the allowed maximum number of \
   tags, then the entire request fails and the resource is not created. For more information about \
   tagging, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM \
   resources} in the {i IAM User Guide}.\n\
  \              \n\
  \               }\n\
  \          {-  Amazon Web Services always interprets the tag [Value] as a single string. If you \
   need to store an array, you can store comma-separated values in the string. However, you must \
   interpret the value in your code.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module TagPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more tags to an IAM customer managed policy. If a tag with the same key name \
   already exists, then that tag is overwritten with the new value.\n\n\
  \ A tag consists of a key name and an associated value. By assigning tags to your resources, you \
   can do the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   {b Administrative grouping and discovery} - Attach tags to resources to aid in \
   organization and search. For example, you could search for all resources with the key name {i \
   Project} and the value {i MyImportantProject}. Or search for all resources with the key name {i \
   Cost Center} and the value {i 41200}. \n\
  \            \n\
  \             }\n\
  \        {-   {b Access control} - Include tags in IAM user-based and resource-based policies. \
   You can use tags to restrict access to only an IAM customer managed policy that has a specified \
   tag attached. For examples of policies that show how to use tags to control access, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html}Control access using IAM \
   tags} in the {i IAM User Guide}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \    {ul\n\
  \          {-  If any one of the tags is invalid or if you exceed the allowed maximum number of \
   tags, then the entire request fails and the resource is not created. For more information about \
   tagging, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM \
   resources} in the {i IAM User Guide}.\n\
  \              \n\
  \               }\n\
  \          {-  Amazon Web Services always interprets the tag [Value] as a single string. If you \
   need to store an array, you can store comma-separated values in the string. However, you must \
   interpret the value in your code.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module TagRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_role_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_role_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more tags to an IAM role. The role can be a regular role or a service-linked role. \
   If a tag with the same key name already exists, then that tag is overwritten with the new \
   value.\n\n\
  \ A tag consists of a key name and an associated value. By assigning tags to your resources, you \
   can do the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   {b Administrative grouping and discovery} - Attach tags to resources to aid in \
   organization and search. For example, you could search for all resources with the key name {i \
   Project} and the value {i MyImportantProject}. Or search for all resources with the key name {i \
   Cost Center} and the value {i 41200}. \n\
  \            \n\
  \             }\n\
  \        {-   {b Access control} - Include tags in IAM user-based and resource-based policies. \
   You can use tags to restrict access to only an IAM role that has a specified tag attached. You \
   can also restrict access to only those resources that have a certain tag attached. For examples \
   of policies that show how to use tags to control access, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html}Control access using IAM \
   tags} in the {i IAM User Guide}.\n\
  \            \n\
  \             }\n\
  \        {-   {b Cost allocation} - Use tags to help track which individuals and teams are using \
   which Amazon Web Services resources.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \    {ul\n\
  \          {-  If any one of the tags is invalid or if you exceed the allowed maximum number of \
   tags, then the entire request fails and the resource is not created. For more information about \
   tagging, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM \
   resources} in the {i IAM User Guide}.\n\
  \              \n\
  \               }\n\
  \          {-  Amazon Web Services always interprets the tag [Value] as a single string. If you \
   need to store an array, you can store comma-separated values in the string. However, you must \
   interpret the value in your code.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    For more information about tagging, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM identities} in the \
   {i IAM User Guide}.\n\
  \    "]

module TagSAMLProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_saml_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_saml_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more tags to a Security Assertion Markup Language (SAML) identity provider. For \
   more information about these providers, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html}About SAML \
   2.0-based federation }. If a tag with the same key name already exists, then that tag is \
   overwritten with the new value.\n\n\
  \ A tag consists of a key name and an associated value. By assigning tags to your resources, you \
   can do the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   {b Administrative grouping and discovery} - Attach tags to resources to aid in \
   organization and search. For example, you could search for all resources with the key name {i \
   Project} and the value {i MyImportantProject}. Or search for all resources with the key name {i \
   Cost Center} and the value {i 41200}. \n\
  \            \n\
  \             }\n\
  \        {-   {b Access control} - Include tags in IAM user-based and resource-based policies. \
   You can use tags to restrict access to only a SAML identity provider that has a specified tag \
   attached. For examples of policies that show how to use tags to control access, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html}Control access using IAM \
   tags} in the {i IAM User Guide}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \    {ul\n\
  \          {-  If any one of the tags is invalid or if you exceed the allowed maximum number of \
   tags, then the entire request fails and the resource is not created. For more information about \
   tagging, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM \
   resources} in the {i IAM User Guide}.\n\
  \              \n\
  \               }\n\
  \          {-  Amazon Web Services always interprets the tag [Value] as a single string. If you \
   need to store an array, you can store comma-separated values in the string. However, you must \
   interpret the value in your code.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module TagServerCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_server_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_server_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more tags to an IAM server certificate. If a tag with the same key name already \
   exists, then that tag is overwritten with the new value.\n\n\
  \  For certificates in a Region supported by Certificate Manager (ACM), we recommend that you \
   don't use IAM server certificates. Instead, use ACM to provision, manage, and deploy your \
   server certificates. For more information about IAM server certificates, \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html}Working \
   with server certificates} in the {i IAM User Guide}.\n\
  \  \n\
  \    A tag consists of a key name and an associated value. By assigning tags to your resources, \
   you can do the following:\n\
  \    \n\
  \     {ul\n\
  \           {-   {b Administrative grouping and discovery} - Attach tags to resources to aid in \
   organization and search. For example, you could search for all resources with the key name {i \
   Project} and the value {i MyImportantProject}. Or search for all resources with the key name {i \
   Cost Center} and the value {i 41200}. \n\
  \               \n\
  \                }\n\
  \           {-   {b Access control} - Include tags in IAM user-based and resource-based \
   policies. You can use tags to restrict access to only a server certificate that has a specified \
   tag attached. For examples of policies that show how to use tags to control access, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html}Control access using IAM \
   tags} in the {i IAM User Guide}.\n\
  \               \n\
  \                }\n\
  \           {-   {b Cost allocation} - Use tags to help track which individuals and teams are \
   using which Amazon Web Services resources.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \    {ul\n\
  \          {-  If any one of the tags is invalid or if you exceed the allowed maximum number of \
   tags, then the entire request fails and the resource is not created. For more information about \
   tagging, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM \
   resources} in the {i IAM User Guide}.\n\
  \              \n\
  \               }\n\
  \          {-  Amazon Web Services always interprets the tag [Value] as a single string. If you \
   need to store an array, you can store comma-separated values in the string. However, you must \
   interpret the value in your code.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module TagUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_user_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_user_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more tags to an IAM user. If a tag with the same key name already exists, then that \
   tag is overwritten with the new value.\n\n\
  \ A tag consists of a key name and an associated value. By assigning tags to your resources, you \
   can do the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   {b Administrative grouping and discovery} - Attach tags to resources to aid in \
   organization and search. For example, you could search for all resources with the key name {i \
   Project} and the value {i MyImportantProject}. Or search for all resources with the key name {i \
   Cost Center} and the value {i 41200}. \n\
  \            \n\
  \             }\n\
  \        {-   {b Access control} - Include tags in IAM identity-based and resource-based \
   policies. You can use tags to restrict access to only an IAM requesting user that has a \
   specified tag attached. You can also restrict access to only those resources that have a \
   certain tag attached. For examples of policies that show how to use tags to control access, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html}Control access using IAM \
   tags} in the {i IAM User Guide}.\n\
  \            \n\
  \             }\n\
  \        {-   {b Cost allocation} - Use tags to help track which individuals and teams are using \
   which Amazon Web Services resources.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \    {ul\n\
  \          {-  If any one of the tags is invalid or if you exceed the allowed maximum number of \
   tags, then the entire request fails and the resource is not created. For more information about \
   tagging, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM \
   resources} in the {i IAM User Guide}.\n\
  \              \n\
  \               }\n\
  \          {-  Amazon Web Services always interprets the tag [Value] as a single string. If you \
   need to store an array, you can store comma-separated values in the string. However, you must \
   interpret the value in your code.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    For more information about tagging, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM identities} in the \
   {i IAM User Guide}.\n\
  \    "]

module UntagInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_instance_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_instance_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified tags from the IAM instance profile. For more information about tagging, \
   see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} in \
   the {i IAM User Guide}.\n"]

module UntagMFADevice : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_mfa_device_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_mfa_device_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified tags from the IAM virtual multi-factor authentication (MFA) device. For \
   more information about tagging, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} in the \
   {i IAM User Guide}.\n"]

module UntagOpenIDConnectProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_open_id_connect_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_open_id_connect_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified tags from the specified OpenID Connect (OIDC)-compatible identity \
   provider in IAM. For more information about OIDC providers, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html}About web \
   identity federation}. For more information about tagging, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} in the \
   {i IAM User Guide}.\n"]

module UntagPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified tags from the customer managed policy. For more information about \
   tagging, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM \
   resources} in the {i IAM User Guide}.\n"]

module UntagRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_role_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_role_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified tags from the role. For more information about tagging, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} in the \
   {i IAM User Guide}.\n"]

module UntagSAMLProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_saml_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_saml_provider_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified tags from the specified Security Assertion Markup Language (SAML) \
   identity provider in IAM. For more information about these providers, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html}About web \
   identity federation}. For more information about tagging, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} in the \
   {i IAM User Guide}.\n"]

module UntagServerCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_server_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_server_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified tags from the IAM server certificate. For more information about tagging, \
   see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} in \
   the {i IAM User Guide}.\n\n\
  \  For certificates in a Region supported by Certificate Manager (ACM), we recommend that you \
   don't use IAM server certificates. Instead, use ACM to provision, manage, and deploy your \
   server certificates. For more information about IAM server certificates, \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html}Working \
   with server certificates} in the {i IAM User Guide}.\n\
  \  \n\
  \   "]

module UntagUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_user_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_user_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified tags from the user. For more information about tagging, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} in the \
   {i IAM User Guide}.\n"]

module UpdateAccessKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_access_key_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_access_key_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Changes the status of the specified access key from Active to Inactive, or vice versa. This \
   operation can be used to disable a user's key as part of a key rotation workflow.\n\n\
  \ If the [UserName] is not specified, the user name is determined implicitly based on the Amazon \
   Web Services access key ID used to sign the request. If a temporary access key is used, then \
   [UserName] is required. If a long-term key is assigned to the user, then [UserName] is not \
   required. This operation works for access keys under the Amazon Web Services account. \
   Consequently, you can use this operation to manage Amazon Web Services account root user \
   credentials even if the Amazon Web Services account has no associated users.\n\
  \ \n\
  \  For information about rotating keys, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/ManagingCredentials.html}Managing keys and \
   certificates} in the {i IAM User Guide}.\n\
  \  "]

module UpdateAccountPasswordPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_account_password_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_account_password_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the password policy settings for the Amazon Web Services account.\n\n\
  \  This operation does not support partial updates. No parameters are required, but if you do \
   not specify a parameter, that parameter's value reverts to its default value. See the {b \
   Request Parameters} section for each parameter's default value. Also note that some parameters \
   do not allow the default parameter to be explicitly set. Instead, to invoke the default value, \
   do not include that parameter when you invoke the operation.\n\
  \  \n\
  \     For more information about using a password policy, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingPasswordPolicies.html}Managing \
   an IAM password policy} in the {i IAM User Guide}.\n\
  \    "]

module UpdateAssumeRolePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededException of limit_exceeded_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception
    | `UnmodifiableEntityException of unmodifiable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_assume_role_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_assume_role_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the policy that grants an IAM entity permission to assume a role. This is typically \
   referred to as the \"role trust policy\". For more information about roles, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html}Using roles to delegate \
   permissions and federate identities}.\n"]

module UpdateDelegationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_delegation_request_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_delegation_request_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing delegation request with additional information. When the delegation request \
   is updated, it reaches the [PENDING_APPROVAL] state. \n\n\
  \ Once a delegation request has an owner, that owner gets a default permission to update the \
   delegation request. For more details, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-temporary-delegation.html#temporary-delegation-managing-permissions} \
   Managing Permissions for Delegation Requests}. \n\
  \ "]

module UpdateGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the name and/or the path of the specified IAM group.\n\n\
  \   You should understand the implications of changing a group's path or name. For more \
   information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_WorkingWithGroupsAndUsers.html}Renaming \
   users and groups} in the {i IAM User Guide}.\n\
  \  \n\
  \     The person making the request (the principal), must have permission to change the role \
   group with the old name and the new name. For example, to change the group named [Managers] to \
   [MGRs], the principal must have a policy that allows them to update both groups. If the \
   principal has permission to update the [Managers] group, but not the [MGRs] group, then the \
   update fails. For more information about permissions, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access.html}Access management}. \n\
  \     \n\
  \      "]

module UpdateLoginProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `PasswordPolicyViolationException of password_policy_violation_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_login_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PasswordPolicyViolationException of password_policy_violation_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_login_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PasswordPolicyViolationException of password_policy_violation_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Changes the password for the specified IAM user. You can use the CLI, the Amazon Web Services \
   API, or the {b Users} page in the IAM console to change the password for any IAM user. Use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ChangePassword.html}ChangePassword} \
   to change your own password in the {b My Security Credentials} page in the Amazon Web Services \
   Management Console.\n\n\
  \ For more information about modifying passwords, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html}Managing \
   passwords} in the {i IAM User Guide}.\n\
  \ "]

module UpdateOpenIDConnectProviderThumbprint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_open_id_connect_provider_thumbprint_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_open_id_connect_provider_thumbprint_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Replaces the existing list of server certificate thumbprints associated with an OpenID Connect \
   (OIDC) provider resource object with a new list of thumbprints.\n\n\
  \ The list that you pass with this operation completely replaces the existing list of \
   thumbprints. (The lists are not merged.)\n\
  \ \n\
  \  Typically, you need to update a thumbprint only when the identity provider certificate \
   changes, which occurs rarely. However, if the provider's certificate {i does} change, any \
   attempt to assume an IAM role that specifies the OIDC provider as a principal fails until the \
   certificate thumbprint is updated.\n\
  \  \n\
  \    Amazon Web Services secures communication with OIDC identity providers (IdPs) using our \
   library of trusted root certificate authorities (CAs) to verify the JSON Web Key Set (JWKS) \
   endpoint's TLS certificate. If your OIDC IdP relies on a certificate that is not signed by one \
   of these trusted CAs, only then we secure communication using the thumbprints set in the IdP's \
   configuration.\n\
  \    \n\
  \       Trust for the OIDC provider is derived from the provider certificate and is validated by \
   the thumbprint. Therefore, it is best to limit access to the \
   [UpdateOpenIDConnectProviderThumbprint] operation to highly privileged users.\n\
  \       \n\
  \        "]

module UpdateRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception
    | `UnmodifiableEntityException of unmodifiable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_role_request ->
    ( update_role_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_role_request ->
    ( update_role_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the description or maximum session duration setting of a role.\n"]

module UpdateRoleDescription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception
    | `UnmodifiableEntityException of unmodifiable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_role_description_request ->
    ( update_role_description_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_role_description_request ->
    ( update_role_description_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateRole.html}UpdateRole} \
   instead.\n\n\
  \ Modifies only the description of a role. This operation performs the same function as the \
   [Description] parameter in the [UpdateRole] operation.\n\
  \ "]

module UpdateSAMLProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_saml_provider_request ->
    ( update_saml_provider_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_saml_provider_request ->
    ( update_saml_provider_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the metadata document, SAML encryption settings, and private keys for an existing SAML \
   provider. To rotate private keys, add your new private key and then remove the old key in a \
   separate request.\n"]

module UpdateSSHPublicKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_ssh_public_key_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_ssh_public_key_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the status of an IAM user's SSH public key to active or inactive. SSH public keys that are \
   inactive cannot be used for authentication. This operation can be used to disable a user's SSH \
   public key as part of a key rotation work flow.\n\n\
  \ The SSH public key affected by this operation is used only for authenticating the associated \
   IAM user to an CodeCommit repository. For more information about using SSH keys to authenticate \
   to an CodeCommit repository, see \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html}Set \
   up CodeCommit for SSH connections} in the {i CodeCommit User Guide}.\n\
  \ "]

module UpdateServerCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_server_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_server_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the name and/or the path of the specified server certificate stored in IAM.\n\n\
  \ For more information about working with server certificates, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html}Working \
   with server certificates} in the {i IAM User Guide}. This topic also includes a list of Amazon \
   Web Services services that can use the server certificates that you manage with IAM.\n\
  \ \n\
  \   You should understand the implications of changing a server certificate's path or name. For \
   more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs_manage.html#RenamingServerCerts}Renaming \
   a server certificate} in the {i IAM User Guide}.\n\
  \   \n\
  \      The person making the request (the principal), must have permission to change the server \
   certificate with the old name and the new name. For example, to change the certificate named \
   [ProductionCert] to [ProdCert], the principal must have a policy that allows them to update \
   both certificates. If the principal has permission to update the [ProductionCert] group, but \
   not the [ProdCert] certificate, then the update fails. For more information about permissions, \
   see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access.html}Access management} in the \
   {i IAM User Guide}.\n\
  \      \n\
  \       "]

module UpdateServiceSpecificCredential : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_specific_credential_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_service_specific_credential_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the status of a service-specific credential to [Active] or [Inactive]. Service-specific \
   credentials that are inactive cannot be used for authentication to the service. This operation \
   can be used to disable a user's service-specific credential as part of a credential rotation \
   work flow.\n"]

module UpdateSigningCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_signing_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_signing_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Changes the status of the specified user signing certificate from active to disabled, or vice \
   versa. This operation can be used to disable an IAM user's signing certificate as part of a \
   certificate rotation work flow.\n\n\
  \ If the [UserName] field is not specified, the user name is determined implicitly based on the \
   Amazon Web Services access key ID used to sign the request. This operation works for access \
   keys under the Amazon Web Services account. Consequently, you can use this operation to manage \
   Amazon Web Services account root user credentials even if the Amazon Web Services account has \
   no associated users.\n\
  \ "]

module UpdateUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_user_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_user_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityTemporarilyUnmodifiableException of entity_temporarily_unmodifiable_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the name and/or the path of the specified IAM user.\n\n\
  \   You should understand the implications of changing an IAM user's path or name. For more \
   information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_manage.html#id_users_renaming}Renaming \
   an IAM user} and \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_groups_manage_rename.html}Renaming an \
   IAM group} in the {i IAM User Guide}.\n\
  \  \n\
  \      To change a user name, the requester must have appropriate permissions on both the source \
   object and the target object. For example, to change Bob to Robert, the entity making the \
   request must have permission on Bob and Robert, or must have permission on all (*). For more \
   information about permissions, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/PermissionsAndPolicies.html}Permissions and \
   policies}. \n\
  \     \n\
  \      "]

module UploadSSHPublicKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DuplicateSSHPublicKeyException of duplicate_ssh_public_key_exception
    | `InvalidPublicKeyException of invalid_public_key_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `UnrecognizedPublicKeyEncodingException of unrecognized_public_key_encoding_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    upload_ssh_public_key_request ->
    ( upload_ssh_public_key_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DuplicateSSHPublicKeyException of duplicate_ssh_public_key_exception
      | `InvalidPublicKeyException of invalid_public_key_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `UnrecognizedPublicKeyEncodingException of unrecognized_public_key_encoding_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    upload_ssh_public_key_request ->
    ( upload_ssh_public_key_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DuplicateSSHPublicKeyException of duplicate_ssh_public_key_exception
      | `InvalidPublicKeyException of invalid_public_key_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `UnrecognizedPublicKeyEncodingException of unrecognized_public_key_encoding_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Uploads an SSH public key and associates it with the specified IAM user.\n\n\
  \ The SSH public key uploaded by this operation can be used only for authenticating the \
   associated IAM user to an CodeCommit repository. For more information about using SSH keys to \
   authenticate to an CodeCommit repository, see \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html}Set \
   up CodeCommit for SSH connections} in the {i CodeCommit User Guide}.\n\
  \ "]

module UploadServerCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `InvalidInputException of invalid_input_exception
    | `KeyPairMismatchException of key_pair_mismatch_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MalformedCertificateException of malformed_certificate_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    upload_server_certificate_request ->
    ( upload_server_certificate_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `KeyPairMismatchException of key_pair_mismatch_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedCertificateException of malformed_certificate_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    upload_server_certificate_request ->
    ( upload_server_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `KeyPairMismatchException of key_pair_mismatch_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedCertificateException of malformed_certificate_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Uploads a server certificate entity for the Amazon Web Services account. The server certificate \
   entity includes a public key certificate, a private key, and an optional certificate chain, \
   which should all be PEM-encoded.\n\n\
  \ We recommend that you use {{:https://docs.aws.amazon.com/acm/}Certificate Manager} to \
   provision, manage, and deploy your server certificates. With ACM you can request a certificate, \
   deploy it to Amazon Web Services resources, and let ACM handle certificate renewals for you. \
   Certificates provided by ACM are free. For more information about using ACM, see the \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/}Certificate Manager User Guide}.\n\
  \ \n\
  \  For more information about working with server certificates, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html}Working \
   with server certificates} in the {i IAM User Guide}. This topic includes a list of Amazon Web \
   Services services that can use the server certificates that you manage with IAM.\n\
  \  \n\
  \   For information about the number of server certificates you can upload, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html}IAM and STS \
   quotas} in the {i IAM User Guide}.\n\
  \   \n\
  \     Because the body of the public key certificate, private key, and the certificate chain can \
   be large, you should use POST rather than GET when calling [UploadServerCertificate]. For \
   information about setting up signatures and authorization through the API, see \
   {{:https://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html}Signing Amazon \
   Web Services API requests} in the {i Amazon Web Services General Reference}. For general \
   information about using the Query API with IAM, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/programming.html}Calling the API by making \
   HTTP query requests} in the {i IAM User Guide}.\n\
  \     \n\
  \      "]

(** {1:Serialization and Deserialization} *)
module UploadSigningCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `DuplicateCertificateException of duplicate_certificate_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `InvalidCertificateException of invalid_certificate_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MalformedCertificateException of malformed_certificate_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceFailureException of service_failure_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    upload_signing_certificate_request ->
    ( upload_signing_certificate_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `DuplicateCertificateException of duplicate_certificate_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidCertificateException of invalid_certificate_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedCertificateException of malformed_certificate_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    upload_signing_certificate_request ->
    ( upload_signing_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `DuplicateCertificateException of duplicate_certificate_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `InvalidCertificateException of invalid_certificate_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedCertificateException of malformed_certificate_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceFailureException of service_failure_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Uploads an X.509 signing certificate and associates it with the specified IAM user. Some Amazon \
   Web Services services require you to use certificates to validate requests that are signed with \
   a corresponding private key. When you upload the certificate, its default status is [Active].\n\n\
  \ For information about when you would use an X.509 signing certificate, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html}Managing \
   server certificates in IAM} in the {i IAM User Guide}.\n\
  \ \n\
  \  If the [UserName] is not specified, the IAM user name is determined implicitly based on the \
   Amazon Web Services access key ID used to sign the request. This operation works for access \
   keys under the Amazon Web Services account. Consequently, you can use this operation to manage \
   Amazon Web Services account root user credentials even if the Amazon Web Services account has \
   no associated users.\n\
  \  \n\
  \    Because the body of an X.509 certificate can be large, you should use POST rather than GET \
   when calling [UploadSigningCertificate]. For information about setting up signatures and \
   authorization through the API, see \
   {{:https://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html}Signing Amazon \
   Web Services API requests} in the {i Amazon Web Services General Reference}. For general \
   information about using the Query API with IAM, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html}Making query \
   requests} in the {i IAM User Guide}.\n\
  \    \n\
  \     "]

module Query_serializers = Query_serializers
module Query_deserializers = Query_deserializers
