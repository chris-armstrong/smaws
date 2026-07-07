open Types

let make_attached_permissions_boundary
    ?permissions_boundary_arn:(permissions_boundary_arn_ : arn_type option)
    ?permissions_boundary_type:
      (permissions_boundary_type_ : permissions_boundary_attachment_type option) () =
  ({
     permissions_boundary_arn = permissions_boundary_arn_;
     permissions_boundary_type = permissions_boundary_type_;
   }
    : attached_permissions_boundary)

let make_tag ~value:(value_ : tag_value_type) ~key:(key_ : tag_key_type) () =
  ({ value = value_; key = key_ } : tag)

let make_user ?tags:(tags_ : tag_list_type option)
    ?permissions_boundary:(permissions_boundary_ : attached_permissions_boundary option)
    ?password_last_used:(password_last_used_ : date_type option)
    ~create_date:(create_date_ : date_type) ~arn:(arn_ : arn_type) ~user_id:(user_id_ : id_type)
    ~user_name:(user_name_ : user_name_type) ~path:(path_ : path_type) () =
  ({
     tags = tags_;
     permissions_boundary = permissions_boundary_;
     password_last_used = password_last_used_;
     create_date = create_date_;
     arn = arn_;
     user_id = user_id_;
     user_name = user_name_;
     path = path_;
   }
    : user)

let make_virtual_mfa_device ?tags:(tags_ : tag_list_type option)
    ?enable_date:(enable_date_ : date_type option) ?user:(user_ : user option)
    ?qr_code_pn_g:(qr_code_pn_g_ : bootstrap_datum option)
    ?base32_string_seed:(base32_string_seed_ : bootstrap_datum option)
    ~serial_number:(serial_number_ : serial_number_type) () =
  ({
     tags = tags_;
     enable_date = enable_date_;
     user = user_;
     qr_code_pn_g = qr_code_pn_g_;
     base32_string_seed = base32_string_seed_;
     serial_number = serial_number_;
   }
    : virtual_mfa_device)

let make_policy_detail ?policy_document:(policy_document_ : policy_document_type option)
    ?policy_name:(policy_name_ : policy_name_type option) () =
  ({ policy_document = policy_document_; policy_name = policy_name_ } : policy_detail)

let make_attached_policy ?policy_arn:(policy_arn_ : arn_type option)
    ?policy_name:(policy_name_ : policy_name_type option) () =
  ({ policy_arn = policy_arn_; policy_name = policy_name_ } : attached_policy)

let make_user_detail ?tags:(tags_ : tag_list_type option)
    ?permissions_boundary:(permissions_boundary_ : attached_permissions_boundary option)
    ?attached_managed_policies:(attached_managed_policies_ : attached_policies_list_type option)
    ?group_list:(group_list_ : group_name_list_type option)
    ?user_policy_list:(user_policy_list_ : policy_detail_list_type option)
    ?create_date:(create_date_ : date_type option) ?arn:(arn_ : arn_type option)
    ?user_id:(user_id_ : id_type option) ?user_name:(user_name_ : user_name_type option)
    ?path:(path_ : path_type option) () =
  ({
     tags = tags_;
     permissions_boundary = permissions_boundary_;
     attached_managed_policies = attached_managed_policies_;
     group_list = group_list_;
     user_policy_list = user_policy_list_;
     create_date = create_date_;
     arn = arn_;
     user_id = user_id_;
     user_name = user_name_;
     path = path_;
   }
    : user_detail)

let make_server_certificate_metadata ?expiration:(expiration_ : date_type option)
    ?upload_date:(upload_date_ : date_type option) ~arn:(arn_ : arn_type)
    ~server_certificate_id:(server_certificate_id_ : id_type)
    ~server_certificate_name:(server_certificate_name_ : server_certificate_name_type)
    ~path:(path_ : path_type) () =
  ({
     expiration = expiration_;
     upload_date = upload_date_;
     arn = arn_;
     server_certificate_id = server_certificate_id_;
     server_certificate_name = server_certificate_name_;
     path = path_;
   }
    : server_certificate_metadata)

let make_role_last_used ?region:(region_ : string_type option)
    ?last_used_date:(last_used_date_ : date_type option) () =
  ({ region = region_; last_used_date = last_used_date_ } : role_last_used)

let make_role ?role_last_used:(role_last_used_ : role_last_used option)
    ?tags:(tags_ : tag_list_type option)
    ?permissions_boundary:(permissions_boundary_ : attached_permissions_boundary option)
    ?max_session_duration:(max_session_duration_ : role_max_session_duration_type option)
    ?description:(description_ : role_description_type option)
    ?assume_role_policy_document:(assume_role_policy_document_ : policy_document_type option)
    ~create_date:(create_date_ : date_type) ~arn:(arn_ : arn_type) ~role_id:(role_id_ : id_type)
    ~role_name:(role_name_ : role_name_type) ~path:(path_ : path_type) () =
  ({
     role_last_used = role_last_used_;
     tags = tags_;
     permissions_boundary = permissions_boundary_;
     max_session_duration = max_session_duration_;
     description = description_;
     assume_role_policy_document = assume_role_policy_document_;
     create_date = create_date_;
     arn = arn_;
     role_id = role_id_;
     role_name = role_name_;
     path = path_;
   }
    : role)

let make_instance_profile ?tags:(tags_ : tag_list_type option) ~roles:(roles_ : role_list_type)
    ~create_date:(create_date_ : date_type) ~arn:(arn_ : arn_type)
    ~instance_profile_id:(instance_profile_id_ : id_type)
    ~instance_profile_name:(instance_profile_name_ : instance_profile_name_type)
    ~path:(path_ : path_type) () =
  ({
     tags = tags_;
     roles = roles_;
     create_date = create_date_;
     arn = arn_;
     instance_profile_id = instance_profile_id_;
     instance_profile_name = instance_profile_name_;
     path = path_;
   }
    : instance_profile)

let make_role_detail ?role_last_used:(role_last_used_ : role_last_used option)
    ?tags:(tags_ : tag_list_type option)
    ?permissions_boundary:(permissions_boundary_ : attached_permissions_boundary option)
    ?attached_managed_policies:(attached_managed_policies_ : attached_policies_list_type option)
    ?role_policy_list:(role_policy_list_ : policy_detail_list_type option)
    ?instance_profile_list:(instance_profile_list_ : instance_profile_list_type option)
    ?assume_role_policy_document:(assume_role_policy_document_ : policy_document_type option)
    ?create_date:(create_date_ : date_type option) ?arn:(arn_ : arn_type option)
    ?role_id:(role_id_ : id_type option) ?role_name:(role_name_ : role_name_type option)
    ?path:(path_ : path_type option) () =
  ({
     role_last_used = role_last_used_;
     tags = tags_;
     permissions_boundary = permissions_boundary_;
     attached_managed_policies = attached_managed_policies_;
     role_policy_list = role_policy_list_;
     instance_profile_list = instance_profile_list_;
     assume_role_policy_document = assume_role_policy_document_;
     create_date = create_date_;
     arn = arn_;
     role_id = role_id_;
     role_name = role_name_;
     path = path_;
   }
    : role_detail)

let make_saml_private_key ?timestamp:(timestamp_ : date_type option)
    ?key_id:(key_id_ : private_key_id_type option) () =
  ({ timestamp = timestamp_; key_id = key_id_ } : saml_private_key)

let make_policy_parameter ?type_:(type__ : policy_parameter_type_enum option)
    ?values:(values_ : policy_parameter_values_list_type option)
    ?name:(name_ : policy_parameter_name_type option) () =
  ({ type_ = type__; values = values_; name = name_ } : policy_parameter)

let make_policy ?tags:(tags_ : tag_list_type option) ?update_date:(update_date_ : date_type option)
    ?create_date:(create_date_ : date_type option)
    ?description:(description_ : policy_description_type option)
    ?is_attachable:(is_attachable_ : boolean_type option)
    ?permissions_boundary_usage_count:
      (permissions_boundary_usage_count_ : attachment_count_type option)
    ?attachment_count:(attachment_count_ : attachment_count_type option)
    ?default_version_id:(default_version_id_ : policy_version_id_type option)
    ?path:(path_ : policy_path_type option) ?arn:(arn_ : arn_type option)
    ?policy_id:(policy_id_ : id_type option) ?policy_name:(policy_name_ : policy_name_type option)
    () =
  ({
     tags = tags_;
     update_date = update_date_;
     create_date = create_date_;
     description = description_;
     is_attachable = is_attachable_;
     permissions_boundary_usage_count = permissions_boundary_usage_count_;
     attachment_count = attachment_count_;
     default_version_id = default_version_id_;
     path = path_;
     arn = arn_;
     policy_id = policy_id_;
     policy_name = policy_name_;
   }
    : policy)

let make_policy_granting_service_access ?entity_name:(entity_name_ : entity_name_type option)
    ?entity_type:(entity_type_ : policy_owner_entity_type option)
    ?policy_arn:(policy_arn_ : arn_type option) ~policy_type:(policy_type_ : policy_type)
    ~policy_name:(policy_name_ : policy_name_type) () =
  ({
     entity_name = entity_name_;
     entity_type = entity_type_;
     policy_arn = policy_arn_;
     policy_type = policy_type_;
     policy_name = policy_name_;
   }
    : policy_granting_service_access)

let make_policy_version ?create_date:(create_date_ : date_type option)
    ?is_default_version:(is_default_version_ : boolean_type option)
    ?version_id:(version_id_ : policy_version_id_type option)
    ?document:(document_ : policy_document_type option) () =
  ({
     create_date = create_date_;
     is_default_version = is_default_version_;
     version_id = version_id_;
     document = document_;
   }
    : policy_version)

let make_mfa_device ~enable_date:(enable_date_ : date_type)
    ~serial_number:(serial_number_ : serial_number_type) ~user_name:(user_name_ : user_name_type) ()
    =
  ({ enable_date = enable_date_; serial_number = serial_number_; user_name = user_name_ }
    : mfa_device)

let make_list_policies_granting_service_access_entry
    ?policies:(policies_ : policy_granting_service_access_list_type option)
    ?service_namespace:(service_namespace_ : service_namespace_type option) () =
  ({ policies = policies_; service_namespace = service_namespace_ }
    : list_policies_granting_service_access_entry)

let make_group ~create_date:(create_date_ : date_type) ~arn:(arn_ : arn_type)
    ~group_id:(group_id_ : id_type) ~group_name:(group_name_ : group_name_type)
    ~path:(path_ : path_type) () =
  ({
     create_date = create_date_;
     arn = arn_;
     group_id = group_id_;
     group_name = group_name_;
     path = path_;
   }
    : group)

let make_group_detail
    ?attached_managed_policies:(attached_managed_policies_ : attached_policies_list_type option)
    ?group_policy_list:(group_policy_list_ : policy_detail_list_type option)
    ?create_date:(create_date_ : date_type option) ?arn:(arn_ : arn_type option)
    ?group_id:(group_id_ : id_type option) ?group_name:(group_name_ : group_name_type option)
    ?path:(path_ : path_type option) () =
  ({
     attached_managed_policies = attached_managed_policies_;
     group_policy_list = group_policy_list_;
     create_date = create_date_;
     arn = arn_;
     group_id = group_id_;
     group_name = group_name_;
     path = path_;
   }
    : group_detail)

let make_entity_info ?path:(path_ : path_type option) ~id:(id_ : id_type)
    ~type_:(type__ : policy_owner_entity_type) ~name:(name_ : user_name_type) ~arn:(arn_ : arn_type)
    () =
  ({ path = path_; id = id_; type_ = type__; name = name_; arn = arn_ } : entity_info)

let make_entity_details ?last_authenticated:(last_authenticated_ : date_type option)
    ~entity_info:(entity_info_ : entity_info) () =
  ({ last_authenticated = last_authenticated_; entity_info = entity_info_ } : entity_details)

let make_delegation_permission ?parameters:(parameters_ : policy_parameter_list_type option)
    ?policy_template_arn:(policy_template_arn_ : arn_type option) () =
  ({ parameters = parameters_; policy_template_arn = policy_template_arn_ } : delegation_permission)

let make_delegation_request ?updated_time:(updated_time_ : date_type option)
    ?only_send_by_owner:(only_send_by_owner_ : boolean_type option)
    ?rejection_reason:(rejection_reason_ : notes_type option) ?notes:(notes_ : notes_type option)
    ?redirect_url:(redirect_url_ : redirect_url_type option)
    ?session_duration:(session_duration_ : session_duration_type option)
    ?create_date:(create_date_ : date_type option)
    ?requestor_name:(requestor_name_ : requestor_name_type option)
    ?requestor_id:(requestor_id_ : account_id_type option)
    ?expiration_time:(expiration_time_ : date_type option) ?state:(state_ : state_type option)
    ?approver_id:(approver_id_ : arn_type option) ?owner_id:(owner_id_ : owner_id_type option)
    ?role_permission_restriction_arns:
      (role_permission_restriction_arns_ : role_permission_restriction_arn_list_type option)
    ?permission_policy:(permission_policy_ : permission_type option)
    ?permissions:(permissions_ : delegation_permission option)
    ?request_message:(request_message_ : request_message_type option)
    ?description:(description_ : delegation_request_description_type option)
    ?owner_account_id:(owner_account_id_ : account_id_type option)
    ?delegation_request_id:(delegation_request_id_ : delegation_request_id_type option) () =
  ({
     updated_time = updated_time_;
     only_send_by_owner = only_send_by_owner_;
     rejection_reason = rejection_reason_;
     notes = notes_;
     redirect_url = redirect_url_;
     session_duration = session_duration_;
     create_date = create_date_;
     requestor_name = requestor_name_;
     requestor_id = requestor_id_;
     expiration_time = expiration_time_;
     state = state_;
     approver_id = approver_id_;
     owner_id = owner_id_;
     role_permission_restriction_arns = role_permission_restriction_arns_;
     permission_policy = permission_policy_;
     permissions = permissions_;
     request_message = request_message_;
     description = description_;
     owner_account_id = owner_account_id_;
     delegation_request_id = delegation_request_id_;
   }
    : delegation_request)

let make_signing_certificate ?upload_date:(upload_date_ : date_type option)
    ~status:(status_ : status_type) ~certificate_body:(certificate_body_ : certificate_body_type)
    ~certificate_id:(certificate_id_ : certificate_id_type) ~user_name:(user_name_ : user_name_type)
    () =
  ({
     upload_date = upload_date_;
     status = status_;
     certificate_body = certificate_body_;
     certificate_id = certificate_id_;
     user_name = user_name_;
   }
    : signing_certificate)

let make_access_key_metadata ?create_date:(create_date_ : date_type option)
    ?status:(status_ : status_type option)
    ?access_key_id:(access_key_id_ : access_key_id_type option)
    ?user_name:(user_name_ : user_name_type option) () =
  ({
     create_date = create_date_;
     status = status_;
     access_key_id = access_key_id_;
     user_name = user_name_;
   }
    : access_key_metadata)

let make_upload_signing_certificate_response ~certificate:(certificate_ : signing_certificate) () =
  ({ certificate = certificate_ } : upload_signing_certificate_response)

let make_upload_signing_certificate_request ?user_name:(user_name_ : existing_user_name_type option)
    ~certificate_body:(certificate_body_ : certificate_body_type) () =
  ({ certificate_body = certificate_body_; user_name = user_name_ }
    : upload_signing_certificate_request)

let make_upload_server_certificate_response ?tags:(tags_ : tag_list_type option)
    ?server_certificate_metadata:(server_certificate_metadata_ : server_certificate_metadata option)
    () =
  ({ tags = tags_; server_certificate_metadata = server_certificate_metadata_ }
    : upload_server_certificate_response)

let make_upload_server_certificate_request ?tags:(tags_ : tag_list_type option)
    ?certificate_chain:(certificate_chain_ : certificate_chain_type option)
    ?path:(path_ : path_type option) ~private_key:(private_key_ : private_key_type)
    ~certificate_body:(certificate_body_ : certificate_body_type)
    ~server_certificate_name:(server_certificate_name_ : server_certificate_name_type) () =
  ({
     tags = tags_;
     certificate_chain = certificate_chain_;
     private_key = private_key_;
     certificate_body = certificate_body_;
     server_certificate_name = server_certificate_name_;
     path = path_;
   }
    : upload_server_certificate_request)

let make_ssh_public_key ?upload_date:(upload_date_ : date_type option)
    ~status:(status_ : status_type)
    ~ssh_public_key_body:(ssh_public_key_body_ : public_key_material_type)
    ~fingerprint:(fingerprint_ : public_key_fingerprint_type)
    ~ssh_public_key_id:(ssh_public_key_id_ : public_key_id_type)
    ~user_name:(user_name_ : user_name_type) () =
  ({
     upload_date = upload_date_;
     status = status_;
     ssh_public_key_body = ssh_public_key_body_;
     fingerprint = fingerprint_;
     ssh_public_key_id = ssh_public_key_id_;
     user_name = user_name_;
   }
    : ssh_public_key)

let make_upload_ssh_public_key_response ?ssh_public_key:(ssh_public_key_ : ssh_public_key option) ()
    =
  ({ ssh_public_key = ssh_public_key_ } : upload_ssh_public_key_response)

let make_upload_ssh_public_key_request
    ~ssh_public_key_body:(ssh_public_key_body_ : public_key_material_type)
    ~user_name:(user_name_ : user_name_type) () =
  ({ ssh_public_key_body = ssh_public_key_body_; user_name = user_name_ }
    : upload_ssh_public_key_request)

let make_update_user_request ?new_user_name:(new_user_name_ : user_name_type option)
    ?new_path:(new_path_ : path_type option) ~user_name:(user_name_ : existing_user_name_type) () =
  ({ new_user_name = new_user_name_; new_path = new_path_; user_name = user_name_ }
    : update_user_request)

let make_update_signing_certificate_request ?user_name:(user_name_ : existing_user_name_type option)
    ~status:(status_ : status_type) ~certificate_id:(certificate_id_ : certificate_id_type) () =
  ({ status = status_; certificate_id = certificate_id_; user_name = user_name_ }
    : update_signing_certificate_request)

let make_update_service_specific_credential_request ?user_name:(user_name_ : user_name_type option)
    ~status:(status_ : status_type)
    ~service_specific_credential_id:
      (service_specific_credential_id_ : service_specific_credential_id) () =
  ({
     status = status_;
     service_specific_credential_id = service_specific_credential_id_;
     user_name = user_name_;
   }
    : update_service_specific_credential_request)

let make_update_server_certificate_request
    ?new_server_certificate_name:
      (new_server_certificate_name_ : server_certificate_name_type option)
    ?new_path:(new_path_ : path_type option)
    ~server_certificate_name:(server_certificate_name_ : server_certificate_name_type) () =
  ({
     new_server_certificate_name = new_server_certificate_name_;
     new_path = new_path_;
     server_certificate_name = server_certificate_name_;
   }
    : update_server_certificate_request)

let make_update_ssh_public_key_request ~status:(status_ : status_type)
    ~ssh_public_key_id:(ssh_public_key_id_ : public_key_id_type)
    ~user_name:(user_name_ : user_name_type) () =
  ({ status = status_; ssh_public_key_id = ssh_public_key_id_; user_name = user_name_ }
    : update_ssh_public_key_request)

let make_update_saml_provider_response ?saml_provider_arn:(saml_provider_arn_ : arn_type option) ()
    =
  ({ saml_provider_arn = saml_provider_arn_ } : update_saml_provider_response)

let make_update_saml_provider_request
    ?remove_private_key:(remove_private_key_ : private_key_id_type option)
    ?add_private_key:(add_private_key_ : private_key_type option)
    ?assertion_encryption_mode:(assertion_encryption_mode_ : assertion_encryption_mode_type option)
    ?saml_metadata_document:(saml_metadata_document_ : saml_metadata_document_type option)
    ~saml_provider_arn:(saml_provider_arn_ : arn_type) () =
  ({
     remove_private_key = remove_private_key_;
     add_private_key = add_private_key_;
     assertion_encryption_mode = assertion_encryption_mode_;
     saml_provider_arn = saml_provider_arn_;
     saml_metadata_document = saml_metadata_document_;
   }
    : update_saml_provider_request)

let make_update_role_response () = (() : unit)

let make_update_role_request
    ?max_session_duration:(max_session_duration_ : role_max_session_duration_type option)
    ?description:(description_ : role_description_type option)
    ~role_name:(role_name_ : role_name_type) () =
  ({
     max_session_duration = max_session_duration_;
     description = description_;
     role_name = role_name_;
   }
    : update_role_request)

let make_update_role_description_response ?role:(role_ : role option) () =
  ({ role = role_ } : update_role_description_response)

let make_update_role_description_request ~description:(description_ : role_description_type)
    ~role_name:(role_name_ : role_name_type) () =
  ({ description = description_; role_name = role_name_ } : update_role_description_request)

let make_update_open_id_connect_provider_thumbprint_request
    ~thumbprint_list:(thumbprint_list_ : thumbprint_list_type)
    ~open_id_connect_provider_arn:(open_id_connect_provider_arn_ : arn_type) () =
  ({
     thumbprint_list = thumbprint_list_;
     open_id_connect_provider_arn = open_id_connect_provider_arn_;
   }
    : update_open_id_connect_provider_thumbprint_request)

let make_update_login_profile_request
    ?password_reset_required:(password_reset_required_ : boolean_object_type option)
    ?password:(password_ : password_type option) ~user_name:(user_name_ : user_name_type) () =
  ({
     password_reset_required = password_reset_required_;
     password = password_;
     user_name = user_name_;
   }
    : update_login_profile_request)

let make_update_group_request ?new_group_name:(new_group_name_ : group_name_type option)
    ?new_path:(new_path_ : path_type option) ~group_name:(group_name_ : group_name_type) () =
  ({ new_group_name = new_group_name_; new_path = new_path_; group_name = group_name_ }
    : update_group_request)

let make_update_delegation_request_request ?notes:(notes_ : notes_type option)
    ~delegation_request_id:(delegation_request_id_ : delegation_request_id_type) () =
  ({ notes = notes_; delegation_request_id = delegation_request_id_ }
    : update_delegation_request_request)

let make_update_assume_role_policy_request
    ~policy_document:(policy_document_ : policy_document_type)
    ~role_name:(role_name_ : role_name_type) () =
  ({ policy_document = policy_document_; role_name = role_name_ }
    : update_assume_role_policy_request)

let make_update_account_password_policy_request
    ?hard_expiry:(hard_expiry_ : boolean_object_type option)
    ?password_reuse_prevention:(password_reuse_prevention_ : password_reuse_prevention_type option)
    ?max_password_age:(max_password_age_ : max_password_age_type option)
    ?allow_users_to_change_password:(allow_users_to_change_password_ : boolean_type option)
    ?require_lowercase_characters:(require_lowercase_characters_ : boolean_type option)
    ?require_uppercase_characters:(require_uppercase_characters_ : boolean_type option)
    ?require_numbers:(require_numbers_ : boolean_type option)
    ?require_symbols:(require_symbols_ : boolean_type option)
    ?minimum_password_length:(minimum_password_length_ : minimum_password_length_type option) () =
  ({
     hard_expiry = hard_expiry_;
     password_reuse_prevention = password_reuse_prevention_;
     max_password_age = max_password_age_;
     allow_users_to_change_password = allow_users_to_change_password_;
     require_lowercase_characters = require_lowercase_characters_;
     require_uppercase_characters = require_uppercase_characters_;
     require_numbers = require_numbers_;
     require_symbols = require_symbols_;
     minimum_password_length = minimum_password_length_;
   }
    : update_account_password_policy_request)

let make_update_access_key_request ?user_name:(user_name_ : existing_user_name_type option)
    ~status:(status_ : status_type) ~access_key_id:(access_key_id_ : access_key_id_type) () =
  ({ status = status_; access_key_id = access_key_id_; user_name = user_name_ }
    : update_access_key_request)

let make_untag_user_request ~tag_keys:(tag_keys_ : tag_key_list_type)
    ~user_name:(user_name_ : existing_user_name_type) () =
  ({ tag_keys = tag_keys_; user_name = user_name_ } : untag_user_request)

let make_untag_server_certificate_request ~tag_keys:(tag_keys_ : tag_key_list_type)
    ~server_certificate_name:(server_certificate_name_ : server_certificate_name_type) () =
  ({ tag_keys = tag_keys_; server_certificate_name = server_certificate_name_ }
    : untag_server_certificate_request)

let make_untag_saml_provider_request ~tag_keys:(tag_keys_ : tag_key_list_type)
    ~saml_provider_arn:(saml_provider_arn_ : arn_type) () =
  ({ tag_keys = tag_keys_; saml_provider_arn = saml_provider_arn_ } : untag_saml_provider_request)

let make_untag_role_request ~tag_keys:(tag_keys_ : tag_key_list_type)
    ~role_name:(role_name_ : role_name_type) () =
  ({ tag_keys = tag_keys_; role_name = role_name_ } : untag_role_request)

let make_untag_policy_request ~tag_keys:(tag_keys_ : tag_key_list_type)
    ~policy_arn:(policy_arn_ : arn_type) () =
  ({ tag_keys = tag_keys_; policy_arn = policy_arn_ } : untag_policy_request)

let make_untag_open_id_connect_provider_request ~tag_keys:(tag_keys_ : tag_key_list_type)
    ~open_id_connect_provider_arn:(open_id_connect_provider_arn_ : arn_type) () =
  ({ tag_keys = tag_keys_; open_id_connect_provider_arn = open_id_connect_provider_arn_ }
    : untag_open_id_connect_provider_request)

let make_untag_mfa_device_request ~tag_keys:(tag_keys_ : tag_key_list_type)
    ~serial_number:(serial_number_ : serial_number_type) () =
  ({ tag_keys = tag_keys_; serial_number = serial_number_ } : untag_mfa_device_request)

let make_untag_instance_profile_request ~tag_keys:(tag_keys_ : tag_key_list_type)
    ~instance_profile_name:(instance_profile_name_ : instance_profile_name_type) () =
  ({ tag_keys = tag_keys_; instance_profile_name = instance_profile_name_ }
    : untag_instance_profile_request)

let make_tracked_action_last_accessed
    ?last_accessed_region:(last_accessed_region_ : string_type option)
    ?last_accessed_time:(last_accessed_time_ : date_type option)
    ?last_accessed_entity:(last_accessed_entity_ : arn_type option)
    ?action_name:(action_name_ : string_type option) () =
  ({
     last_accessed_region = last_accessed_region_;
     last_accessed_time = last_accessed_time_;
     last_accessed_entity = last_accessed_entity_;
     action_name = action_name_;
   }
    : tracked_action_last_accessed)

let make_tag_user_request ~tags:(tags_ : tag_list_type)
    ~user_name:(user_name_ : existing_user_name_type) () =
  ({ tags = tags_; user_name = user_name_ } : tag_user_request)

let make_tag_server_certificate_request ~tags:(tags_ : tag_list_type)
    ~server_certificate_name:(server_certificate_name_ : server_certificate_name_type) () =
  ({ tags = tags_; server_certificate_name = server_certificate_name_ }
    : tag_server_certificate_request)

let make_tag_saml_provider_request ~tags:(tags_ : tag_list_type)
    ~saml_provider_arn:(saml_provider_arn_ : arn_type) () =
  ({ tags = tags_; saml_provider_arn = saml_provider_arn_ } : tag_saml_provider_request)

let make_tag_role_request ~tags:(tags_ : tag_list_type) ~role_name:(role_name_ : role_name_type) ()
    =
  ({ tags = tags_; role_name = role_name_ } : tag_role_request)

let make_tag_policy_request ~tags:(tags_ : tag_list_type) ~policy_arn:(policy_arn_ : arn_type) () =
  ({ tags = tags_; policy_arn = policy_arn_ } : tag_policy_request)

let make_tag_open_id_connect_provider_request ~tags:(tags_ : tag_list_type)
    ~open_id_connect_provider_arn:(open_id_connect_provider_arn_ : arn_type) () =
  ({ tags = tags_; open_id_connect_provider_arn = open_id_connect_provider_arn_ }
    : tag_open_id_connect_provider_request)

let make_tag_mfa_device_request ~tags:(tags_ : tag_list_type)
    ~serial_number:(serial_number_ : serial_number_type) () =
  ({ tags = tags_; serial_number = serial_number_ } : tag_mfa_device_request)

let make_tag_instance_profile_request ~tags:(tags_ : tag_list_type)
    ~instance_profile_name:(instance_profile_name_ : instance_profile_name_type) () =
  ({ tags = tags_; instance_profile_name = instance_profile_name_ } : tag_instance_profile_request)

let make_position ?column:(column_ : column_number option) ?line:(line_ : line_number option) () =
  ({ column = column_; line = line_ } : position)

let make_statement ?end_position:(end_position_ : position option)
    ?start_position:(start_position_ : position option)
    ?source_policy_type:(source_policy_type_ : policy_source_type option)
    ?source_policy_id:(source_policy_id_ : policy_identifier_type option) () =
  ({
     end_position = end_position_;
     start_position = start_position_;
     source_policy_type = source_policy_type_;
     source_policy_id = source_policy_id_;
   }
    : statement)

let make_context_entry ?context_key_type:(context_key_type_ : context_key_type_enum option)
    ?context_key_values:(context_key_values_ : context_key_value_list_type option)
    ?context_key_name:(context_key_name_ : context_key_name_type option) () =
  ({
     context_key_type = context_key_type_;
     context_key_values = context_key_values_;
     context_key_name = context_key_name_;
   }
    : context_entry)

let make_simulate_principal_policy_request ?marker:(marker_ : marker_type option)
    ?max_items:(max_items_ : max_items_type option)
    ?resource_handling_option:(resource_handling_option_ : resource_handling_option_type option)
    ?context_entries:(context_entries_ : context_entry_list_type option)
    ?caller_arn:(caller_arn_ : resource_name_type option)
    ?resource_owner:(resource_owner_ : resource_name_type option)
    ?resource_policy:(resource_policy_ : policy_document_type option)
    ?resource_arns:(resource_arns_ : resource_name_list_type option)
    ?permissions_boundary_policy_input_list:
      (permissions_boundary_policy_input_list_ : simulation_policy_list_type option)
    ?policy_input_list:(policy_input_list_ : simulation_policy_list_type option)
    ~action_names:(action_names_ : action_name_list_type)
    ~policy_source_arn:(policy_source_arn_ : arn_type) () =
  ({
     marker = marker_;
     max_items = max_items_;
     resource_handling_option = resource_handling_option_;
     context_entries = context_entries_;
     caller_arn = caller_arn_;
     resource_owner = resource_owner_;
     resource_policy = resource_policy_;
     resource_arns = resource_arns_;
     action_names = action_names_;
     permissions_boundary_policy_input_list = permissions_boundary_policy_input_list_;
     policy_input_list = policy_input_list_;
     policy_source_arn = policy_source_arn_;
   }
    : simulate_principal_policy_request)

let make_organizations_decision_detail
    ?allowed_by_organizations:(allowed_by_organizations_ : boolean_type option) () =
  ({ allowed_by_organizations = allowed_by_organizations_ } : organizations_decision_detail)

let make_permissions_boundary_decision_detail
    ?allowed_by_permissions_boundary:(allowed_by_permissions_boundary_ : boolean_type option) () =
  ({ allowed_by_permissions_boundary = allowed_by_permissions_boundary_ }
    : permissions_boundary_decision_detail)

let make_simulate_policy_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ?evaluation_results:(evaluation_results_ : evaluation_results_list_type option) () =
  ({ marker = marker_; is_truncated = is_truncated_; evaluation_results = evaluation_results_ }
    : simulate_policy_response)

let make_simulate_custom_policy_request ?marker:(marker_ : marker_type option)
    ?max_items:(max_items_ : max_items_type option)
    ?resource_handling_option:(resource_handling_option_ : resource_handling_option_type option)
    ?context_entries:(context_entries_ : context_entry_list_type option)
    ?caller_arn:(caller_arn_ : resource_name_type option)
    ?resource_owner:(resource_owner_ : resource_name_type option)
    ?resource_policy:(resource_policy_ : policy_document_type option)
    ?resource_arns:(resource_arns_ : resource_name_list_type option)
    ?permissions_boundary_policy_input_list:
      (permissions_boundary_policy_input_list_ : simulation_policy_list_type option)
    ~action_names:(action_names_ : action_name_list_type)
    ~policy_input_list:(policy_input_list_ : simulation_policy_list_type) () =
  ({
     marker = marker_;
     max_items = max_items_;
     resource_handling_option = resource_handling_option_;
     context_entries = context_entries_;
     caller_arn = caller_arn_;
     resource_owner = resource_owner_;
     resource_policy = resource_policy_;
     resource_arns = resource_arns_;
     action_names = action_names_;
     permissions_boundary_policy_input_list = permissions_boundary_policy_input_list_;
     policy_input_list = policy_input_list_;
   }
    : simulate_custom_policy_request)

let make_set_security_token_service_preferences_request
    ~global_endpoint_token_version:(global_endpoint_token_version_ : global_endpoint_token_version)
    () =
  ({ global_endpoint_token_version = global_endpoint_token_version_ }
    : set_security_token_service_preferences_request)

let make_set_default_policy_version_request ~version_id:(version_id_ : policy_version_id_type)
    ~policy_arn:(policy_arn_ : arn_type) () =
  ({ version_id = version_id_; policy_arn = policy_arn_ } : set_default_policy_version_request)

let make_service_last_accessed
    ?tracked_actions_last_accessed:
      (tracked_actions_last_accessed_ : tracked_actions_last_accessed option)
    ?total_authenticated_entities:(total_authenticated_entities_ : integer_type option)
    ?last_authenticated_region:(last_authenticated_region_ : string_type option)
    ?last_authenticated_entity:(last_authenticated_entity_ : arn_type option)
    ?last_authenticated:(last_authenticated_ : date_type option)
    ~service_namespace:(service_namespace_ : service_namespace_type)
    ~service_name:(service_name_ : service_name_type) () =
  ({
     tracked_actions_last_accessed = tracked_actions_last_accessed_;
     total_authenticated_entities = total_authenticated_entities_;
     last_authenticated_region = last_authenticated_region_;
     last_authenticated_entity = last_authenticated_entity_;
     service_namespace = service_namespace_;
     last_authenticated = last_authenticated_;
     service_name = service_name_;
   }
    : service_last_accessed)

let make_service_specific_credential_metadata ?expiration_date:(expiration_date_ : date_type option)
    ?service_credential_alias:(service_credential_alias_ : service_credential_alias option)
    ?service_user_name:(service_user_name_ : service_user_name option)
    ~service_name:(service_name_ : service_name)
    ~service_specific_credential_id:
      (service_specific_credential_id_ : service_specific_credential_id)
    ~create_date:(create_date_ : date_type) ~status:(status_ : status_type)
    ~user_name:(user_name_ : user_name_type) () =
  ({
     service_name = service_name_;
     service_specific_credential_id = service_specific_credential_id_;
     expiration_date = expiration_date_;
     create_date = create_date_;
     service_credential_alias = service_credential_alias_;
     service_user_name = service_user_name_;
     status = status_;
     user_name = user_name_;
   }
    : service_specific_credential_metadata)

let make_service_specific_credential
    ?service_credential_secret:(service_credential_secret_ : service_credential_secret option)
    ?service_credential_alias:(service_credential_alias_ : service_credential_alias option)
    ?service_password:(service_password_ : service_password option)
    ?service_user_name:(service_user_name_ : service_user_name option)
    ?expiration_date:(expiration_date_ : date_type option) ~status:(status_ : status_type)
    ~user_name:(user_name_ : user_name_type)
    ~service_specific_credential_id:
      (service_specific_credential_id_ : service_specific_credential_id)
    ~service_name:(service_name_ : service_name) ~create_date:(create_date_ : date_type) () =
  ({
     status = status_;
     user_name = user_name_;
     service_specific_credential_id = service_specific_credential_id_;
     service_credential_secret = service_credential_secret_;
     service_credential_alias = service_credential_alias_;
     service_password = service_password_;
     service_user_name = service_user_name_;
     service_name = service_name_;
     expiration_date = expiration_date_;
     create_date = create_date_;
   }
    : service_specific_credential)

let make_server_certificate ?tags:(tags_ : tag_list_type option)
    ?certificate_chain:(certificate_chain_ : certificate_chain_type option)
    ~certificate_body:(certificate_body_ : certificate_body_type)
    ~server_certificate_metadata:(server_certificate_metadata_ : server_certificate_metadata) () =
  ({
     tags = tags_;
     certificate_chain = certificate_chain_;
     certificate_body = certificate_body_;
     server_certificate_metadata = server_certificate_metadata_;
   }
    : server_certificate)

let make_send_delegation_token_request
    ~delegation_request_id:(delegation_request_id_ : delegation_request_id_type) () =
  ({ delegation_request_id = delegation_request_id_ } : send_delegation_token_request)

let make_ssh_public_key_metadata ~upload_date:(upload_date_ : date_type)
    ~status:(status_ : status_type) ~ssh_public_key_id:(ssh_public_key_id_ : public_key_id_type)
    ~user_name:(user_name_ : user_name_type) () =
  ({
     upload_date = upload_date_;
     status = status_;
     ssh_public_key_id = ssh_public_key_id_;
     user_name = user_name_;
   }
    : ssh_public_key_metadata)

let make_saml_provider_list_entry ?create_date:(create_date_ : date_type option)
    ?valid_until:(valid_until_ : date_type option) ?arn:(arn_ : arn_type option) () =
  ({ create_date = create_date_; valid_until = valid_until_; arn = arn_ }
    : saml_provider_list_entry)

let make_role_usage_type ?resources:(resources_ : arn_list_type option)
    ?region:(region_ : region_name_type option) () =
  ({ resources = resources_; region = region_ } : role_usage_type)

let make_resync_mfa_device_request
    ~authentication_code2:(authentication_code2_ : authentication_code_type)
    ~authentication_code1:(authentication_code1_ : authentication_code_type)
    ~serial_number:(serial_number_ : serial_number_type)
    ~user_name:(user_name_ : existing_user_name_type) () =
  ({
     authentication_code2 = authentication_code2_;
     authentication_code1 = authentication_code1_;
     serial_number = serial_number_;
     user_name = user_name_;
   }
    : resync_mfa_device_request)

let make_reset_service_specific_credential_response
    ?service_specific_credential:(service_specific_credential_ : service_specific_credential option)
    () =
  ({ service_specific_credential = service_specific_credential_ }
    : reset_service_specific_credential_response)

let make_reset_service_specific_credential_request ?user_name:(user_name_ : user_name_type option)
    ~service_specific_credential_id:
      (service_specific_credential_id_ : service_specific_credential_id) () =
  ({ service_specific_credential_id = service_specific_credential_id_; user_name = user_name_ }
    : reset_service_specific_credential_request)

let make_remove_user_from_group_request ~user_name:(user_name_ : existing_user_name_type)
    ~group_name:(group_name_ : group_name_type) () =
  ({ user_name = user_name_; group_name = group_name_ } : remove_user_from_group_request)

let make_remove_role_from_instance_profile_request ~role_name:(role_name_ : role_name_type)
    ~instance_profile_name:(instance_profile_name_ : instance_profile_name_type) () =
  ({ role_name = role_name_; instance_profile_name = instance_profile_name_ }
    : remove_role_from_instance_profile_request)

let make_remove_client_id_from_open_id_connect_provider_request
    ~client_i_d:(client_i_d_ : client_id_type)
    ~open_id_connect_provider_arn:(open_id_connect_provider_arn_ : arn_type) () =
  ({ client_i_d = client_i_d_; open_id_connect_provider_arn = open_id_connect_provider_arn_ }
    : remove_client_id_from_open_id_connect_provider_request)

let make_reject_delegation_request_request ?notes:(notes_ : notes_type option)
    ~delegation_request_id:(delegation_request_id_ : delegation_request_id_type) () =
  ({ notes = notes_; delegation_request_id = delegation_request_id_ }
    : reject_delegation_request_request)

let make_put_user_policy_request ~policy_document:(policy_document_ : policy_document_type)
    ~policy_name:(policy_name_ : policy_name_type) ~user_name:(user_name_ : existing_user_name_type)
    () =
  ({ policy_document = policy_document_; policy_name = policy_name_; user_name = user_name_ }
    : put_user_policy_request)

let make_put_user_permissions_boundary_request
    ~permissions_boundary:(permissions_boundary_ : arn_type)
    ~user_name:(user_name_ : user_name_type) () =
  ({ permissions_boundary = permissions_boundary_; user_name = user_name_ }
    : put_user_permissions_boundary_request)

let make_put_role_policy_request ~policy_document:(policy_document_ : policy_document_type)
    ~policy_name:(policy_name_ : policy_name_type) ~role_name:(role_name_ : role_name_type) () =
  ({ policy_document = policy_document_; policy_name = policy_name_; role_name = role_name_ }
    : put_role_policy_request)

let make_put_role_permissions_boundary_request
    ~permissions_boundary:(permissions_boundary_ : arn_type)
    ~role_name:(role_name_ : role_name_type) () =
  ({ permissions_boundary = permissions_boundary_; role_name = role_name_ }
    : put_role_permissions_boundary_request)

let make_put_group_policy_request ~policy_document:(policy_document_ : policy_document_type)
    ~policy_name:(policy_name_ : policy_name_type) ~group_name:(group_name_ : group_name_type) () =
  ({ policy_document = policy_document_; policy_name = policy_name_; group_name = group_name_ }
    : put_group_policy_request)

let make_policy_user ?user_id:(user_id_ : id_type option)
    ?user_name:(user_name_ : user_name_type option) () =
  ({ user_id = user_id_; user_name = user_name_ } : policy_user)

let make_policy_role ?role_id:(role_id_ : id_type option)
    ?role_name:(role_name_ : role_name_type option) () =
  ({ role_id = role_id_; role_name = role_name_ } : policy_role)

let make_policy_group ?group_id:(group_id_ : id_type option)
    ?group_name:(group_name_ : group_name_type option) () =
  ({ group_id = group_id_; group_name = group_name_ } : policy_group)

let make_password_policy ?hard_expiry:(hard_expiry_ : boolean_object_type option)
    ?password_reuse_prevention:(password_reuse_prevention_ : password_reuse_prevention_type option)
    ?max_password_age:(max_password_age_ : max_password_age_type option)
    ?expire_passwords:(expire_passwords_ : boolean_type option)
    ?allow_users_to_change_password:(allow_users_to_change_password_ : boolean_type option)
    ?require_lowercase_characters:(require_lowercase_characters_ : boolean_type option)
    ?require_uppercase_characters:(require_uppercase_characters_ : boolean_type option)
    ?require_numbers:(require_numbers_ : boolean_type option)
    ?require_symbols:(require_symbols_ : boolean_type option)
    ?minimum_password_length:(minimum_password_length_ : minimum_password_length_type option) () =
  ({
     hard_expiry = hard_expiry_;
     password_reuse_prevention = password_reuse_prevention_;
     max_password_age = max_password_age_;
     expire_passwords = expire_passwords_;
     allow_users_to_change_password = allow_users_to_change_password_;
     require_lowercase_characters = require_lowercase_characters_;
     require_uppercase_characters = require_uppercase_characters_;
     require_numbers = require_numbers_;
     require_symbols = require_symbols_;
     minimum_password_length = minimum_password_length_;
   }
    : password_policy)

let make_open_id_connect_provider_list_entry ?arn:(arn_ : arn_type option) () =
  ({ arn = arn_ } : open_id_connect_provider_list_entry)

let make_managed_policy_detail
    ?policy_version_list:(policy_version_list_ : policy_document_version_list_type option)
    ?update_date:(update_date_ : date_type option) ?create_date:(create_date_ : date_type option)
    ?description:(description_ : policy_description_type option)
    ?is_attachable:(is_attachable_ : boolean_type option)
    ?permissions_boundary_usage_count:
      (permissions_boundary_usage_count_ : attachment_count_type option)
    ?attachment_count:(attachment_count_ : attachment_count_type option)
    ?default_version_id:(default_version_id_ : policy_version_id_type option)
    ?path:(path_ : policy_path_type option) ?arn:(arn_ : arn_type option)
    ?policy_id:(policy_id_ : id_type option) ?policy_name:(policy_name_ : policy_name_type option)
    () =
  ({
     policy_version_list = policy_version_list_;
     update_date = update_date_;
     create_date = create_date_;
     description = description_;
     is_attachable = is_attachable_;
     permissions_boundary_usage_count = permissions_boundary_usage_count_;
     attachment_count = attachment_count_;
     default_version_id = default_version_id_;
     path = path_;
     arn = arn_;
     policy_id = policy_id_;
     policy_name = policy_name_;
   }
    : managed_policy_detail)

let make_login_profile ?password_reset_required:(password_reset_required_ : boolean_type option)
    ~create_date:(create_date_ : date_type) ~user_name:(user_name_ : user_name_type) () =
  ({
     password_reset_required = password_reset_required_;
     create_date = create_date_;
     user_name = user_name_;
   }
    : login_profile)

let make_list_virtual_mfa_devices_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ~virtual_mfa_devices:(virtual_mfa_devices_ : virtual_mfa_device_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; virtual_mfa_devices = virtual_mfa_devices_ }
    : list_virtual_mfa_devices_response)

let make_list_virtual_mfa_devices_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option)
    ?assignment_status:(assignment_status_ : assignment_status_type option) () =
  ({ max_items = max_items_; marker = marker_; assignment_status = assignment_status_ }
    : list_virtual_mfa_devices_request)

let make_list_users_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option) ~users:(users_ : user_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; users = users_ } : list_users_response)

let make_list_users_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ?path_prefix:(path_prefix_ : path_prefix_type option) ()
    =
  ({ max_items = max_items_; marker = marker_; path_prefix = path_prefix_ } : list_users_request)

let make_list_user_tags_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option) ~tags:(tags_ : tag_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; tags = tags_ } : list_user_tags_response)

let make_list_user_tags_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ~user_name:(user_name_ : existing_user_name_type) () =
  ({ max_items = max_items_; marker = marker_; user_name = user_name_ } : list_user_tags_request)

let make_list_user_policies_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ~policy_names:(policy_names_ : policy_name_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; policy_names = policy_names_ }
    : list_user_policies_response)

let make_list_user_policies_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ~user_name:(user_name_ : existing_user_name_type) () =
  ({ max_items = max_items_; marker = marker_; user_name = user_name_ }
    : list_user_policies_request)

let make_list_signing_certificates_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ~certificates:(certificates_ : certificate_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; certificates = certificates_ }
    : list_signing_certificates_response)

let make_list_signing_certificates_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ?user_name:(user_name_ : existing_user_name_type option)
    () =
  ({ max_items = max_items_; marker = marker_; user_name = user_name_ }
    : list_signing_certificates_request)

let make_list_service_specific_credentials_response
    ?is_truncated:(is_truncated_ : boolean_type option)
    ?marker:(marker_ : response_marker_type option)
    ?service_specific_credentials:
      (service_specific_credentials_ : service_specific_credentials_list_type option) () =
  ({
     is_truncated = is_truncated_;
     marker = marker_;
     service_specific_credentials = service_specific_credentials_;
   }
    : list_service_specific_credentials_response)

let make_list_service_specific_credentials_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ?all_users:(all_users_ : all_users option)
    ?service_name:(service_name_ : service_name option)
    ?user_name:(user_name_ : user_name_type option) () =
  ({
     max_items = max_items_;
     marker = marker_;
     all_users = all_users_;
     service_name = service_name_;
     user_name = user_name_;
   }
    : list_service_specific_credentials_request)

let make_list_server_certificates_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ~server_certificate_metadata_list:
      (server_certificate_metadata_list_ : server_certificate_metadata_list_type) () =
  ({
     marker = marker_;
     is_truncated = is_truncated_;
     server_certificate_metadata_list = server_certificate_metadata_list_;
   }
    : list_server_certificates_response)

let make_list_server_certificates_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ?path_prefix:(path_prefix_ : path_prefix_type option) ()
    =
  ({ max_items = max_items_; marker = marker_; path_prefix = path_prefix_ }
    : list_server_certificates_request)

let make_list_server_certificate_tags_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option) ~tags:(tags_ : tag_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; tags = tags_ }
    : list_server_certificate_tags_response)

let make_list_server_certificate_tags_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option)
    ~server_certificate_name:(server_certificate_name_ : server_certificate_name_type) () =
  ({ max_items = max_items_; marker = marker_; server_certificate_name = server_certificate_name_ }
    : list_server_certificate_tags_request)

let make_list_ssh_public_keys_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ?ssh_public_keys:(ssh_public_keys_ : ssh_public_key_list_type option) () =
  ({ marker = marker_; is_truncated = is_truncated_; ssh_public_keys = ssh_public_keys_ }
    : list_ssh_public_keys_response)

let make_list_ssh_public_keys_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ?user_name:(user_name_ : user_name_type option) () =
  ({ max_items = max_items_; marker = marker_; user_name = user_name_ }
    : list_ssh_public_keys_request)

let make_list_saml_providers_response
    ?saml_provider_list:(saml_provider_list_ : saml_provider_list_type option) () =
  ({ saml_provider_list = saml_provider_list_ } : list_saml_providers_response)

let make_list_saml_providers_request () = (() : unit)

let make_list_saml_provider_tags_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option) ~tags:(tags_ : tag_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; tags = tags_ }
    : list_saml_provider_tags_response)

let make_list_saml_provider_tags_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ~saml_provider_arn:(saml_provider_arn_ : arn_type) () =
  ({ max_items = max_items_; marker = marker_; saml_provider_arn = saml_provider_arn_ }
    : list_saml_provider_tags_request)

let make_list_roles_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option) ~roles:(roles_ : role_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; roles = roles_ } : list_roles_response)

let make_list_roles_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ?path_prefix:(path_prefix_ : path_prefix_type option) ()
    =
  ({ max_items = max_items_; marker = marker_; path_prefix = path_prefix_ } : list_roles_request)

let make_list_role_tags_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option) ~tags:(tags_ : tag_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; tags = tags_ } : list_role_tags_response)

let make_list_role_tags_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ~role_name:(role_name_ : role_name_type) () =
  ({ max_items = max_items_; marker = marker_; role_name = role_name_ } : list_role_tags_request)

let make_list_role_policies_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ~policy_names:(policy_names_ : policy_name_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; policy_names = policy_names_ }
    : list_role_policies_response)

let make_list_role_policies_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ~role_name:(role_name_ : role_name_type) () =
  ({ max_items = max_items_; marker = marker_; role_name = role_name_ }
    : list_role_policies_request)

let make_list_policy_versions_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ?versions:(versions_ : policy_document_version_list_type option) () =
  ({ marker = marker_; is_truncated = is_truncated_; versions = versions_ }
    : list_policy_versions_response)

let make_list_policy_versions_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ~policy_arn:(policy_arn_ : arn_type) () =
  ({ max_items = max_items_; marker = marker_; policy_arn = policy_arn_ }
    : list_policy_versions_request)

let make_list_policy_tags_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option) ~tags:(tags_ : tag_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; tags = tags_ } : list_policy_tags_response)

let make_list_policy_tags_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ~policy_arn:(policy_arn_ : arn_type) () =
  ({ max_items = max_items_; marker = marker_; policy_arn = policy_arn_ }
    : list_policy_tags_request)

let make_list_policies_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ?policies:(policies_ : policy_list_type option) () =
  ({ marker = marker_; is_truncated = is_truncated_; policies = policies_ }
    : list_policies_response)

let make_list_policies_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option)
    ?policy_usage_filter:(policy_usage_filter_ : policy_usage_type option)
    ?path_prefix:(path_prefix_ : policy_path_type option)
    ?only_attached:(only_attached_ : boolean_type option) ?scope:(scope_ : policy_scope_type option)
    () =
  ({
     max_items = max_items_;
     marker = marker_;
     policy_usage_filter = policy_usage_filter_;
     path_prefix = path_prefix_;
     only_attached = only_attached_;
     scope = scope_;
   }
    : list_policies_request)

let make_list_policies_granting_service_access_response
    ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ~policies_granting_service_access:
      (policies_granting_service_access_ : list_policy_granting_service_access_response_list_type)
    () =
  ({
     marker = marker_;
     is_truncated = is_truncated_;
     policies_granting_service_access = policies_granting_service_access_;
   }
    : list_policies_granting_service_access_response)

let make_list_policies_granting_service_access_request ?marker:(marker_ : marker_type option)
    ~service_namespaces:(service_namespaces_ : service_namespace_list_type) ~arn:(arn_ : arn_type)
    () =
  ({ service_namespaces = service_namespaces_; arn = arn_; marker = marker_ }
    : list_policies_granting_service_access_request)

let make_list_organizations_features_response
    ?enabled_features:(enabled_features_ : features_list_type option)
    ?organization_id:(organization_id_ : organization_id_type option) () =
  ({ enabled_features = enabled_features_; organization_id = organization_id_ }
    : list_organizations_features_response)

let make_list_organizations_features_request () = (() : unit)

let make_list_open_id_connect_providers_response
    ?open_id_connect_provider_list:
      (open_id_connect_provider_list_ : open_id_connect_provider_list_type option) () =
  ({ open_id_connect_provider_list = open_id_connect_provider_list_ }
    : list_open_id_connect_providers_response)

let make_list_open_id_connect_providers_request () = (() : unit)

let make_list_open_id_connect_provider_tags_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option) ~tags:(tags_ : tag_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; tags = tags_ }
    : list_open_id_connect_provider_tags_response)

let make_list_open_id_connect_provider_tags_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option)
    ~open_id_connect_provider_arn:(open_id_connect_provider_arn_ : arn_type) () =
  ({
     max_items = max_items_;
     marker = marker_;
     open_id_connect_provider_arn = open_id_connect_provider_arn_;
   }
    : list_open_id_connect_provider_tags_request)

let make_list_mfa_devices_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ~mfa_devices:(mfa_devices_ : mfa_device_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; mfa_devices = mfa_devices_ }
    : list_mfa_devices_response)

let make_list_mfa_devices_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ?user_name:(user_name_ : existing_user_name_type option)
    () =
  ({ max_items = max_items_; marker = marker_; user_name = user_name_ } : list_mfa_devices_request)

let make_list_mfa_device_tags_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option) ~tags:(tags_ : tag_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; tags = tags_ } : list_mfa_device_tags_response)

let make_list_mfa_device_tags_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ~serial_number:(serial_number_ : serial_number_type) () =
  ({ max_items = max_items_; marker = marker_; serial_number = serial_number_ }
    : list_mfa_device_tags_request)

let make_list_instance_profiles_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ~instance_profiles:(instance_profiles_ : instance_profile_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; instance_profiles = instance_profiles_ }
    : list_instance_profiles_response)

let make_list_instance_profiles_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ?path_prefix:(path_prefix_ : path_prefix_type option) ()
    =
  ({ max_items = max_items_; marker = marker_; path_prefix = path_prefix_ }
    : list_instance_profiles_request)

let make_list_instance_profiles_for_role_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ~instance_profiles:(instance_profiles_ : instance_profile_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; instance_profiles = instance_profiles_ }
    : list_instance_profiles_for_role_response)

let make_list_instance_profiles_for_role_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ~role_name:(role_name_ : role_name_type) () =
  ({ max_items = max_items_; marker = marker_; role_name = role_name_ }
    : list_instance_profiles_for_role_request)

let make_list_instance_profile_tags_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option) ~tags:(tags_ : tag_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; tags = tags_ }
    : list_instance_profile_tags_response)

let make_list_instance_profile_tags_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option)
    ~instance_profile_name:(instance_profile_name_ : instance_profile_name_type) () =
  ({ max_items = max_items_; marker = marker_; instance_profile_name = instance_profile_name_ }
    : list_instance_profile_tags_request)

let make_list_groups_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option) ~groups:(groups_ : group_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; groups = groups_ } : list_groups_response)

let make_list_groups_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ?path_prefix:(path_prefix_ : path_prefix_type option) ()
    =
  ({ max_items = max_items_; marker = marker_; path_prefix = path_prefix_ } : list_groups_request)

let make_list_groups_for_user_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option) ~groups:(groups_ : group_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; groups = groups_ }
    : list_groups_for_user_response)

let make_list_groups_for_user_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ~user_name:(user_name_ : existing_user_name_type) () =
  ({ max_items = max_items_; marker = marker_; user_name = user_name_ }
    : list_groups_for_user_request)

let make_list_group_policies_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ~policy_names:(policy_names_ : policy_name_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; policy_names = policy_names_ }
    : list_group_policies_response)

let make_list_group_policies_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ~group_name:(group_name_ : group_name_type) () =
  ({ max_items = max_items_; marker = marker_; group_name = group_name_ }
    : list_group_policies_request)

let make_list_entities_for_policy_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ?policy_roles:(policy_roles_ : policy_role_list_type option)
    ?policy_users:(policy_users_ : policy_user_list_type option)
    ?policy_groups:(policy_groups_ : policy_group_list_type option) () =
  ({
     marker = marker_;
     is_truncated = is_truncated_;
     policy_roles = policy_roles_;
     policy_users = policy_users_;
     policy_groups = policy_groups_;
   }
    : list_entities_for_policy_response)

let make_list_entities_for_policy_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option)
    ?policy_usage_filter:(policy_usage_filter_ : policy_usage_type option)
    ?path_prefix:(path_prefix_ : path_type option)
    ?entity_filter:(entity_filter_ : entity_type option) ~policy_arn:(policy_arn_ : arn_type) () =
  ({
     max_items = max_items_;
     marker = marker_;
     policy_usage_filter = policy_usage_filter_;
     path_prefix = path_prefix_;
     entity_filter = entity_filter_;
     policy_arn = policy_arn_;
   }
    : list_entities_for_policy_request)

let make_list_delegation_requests_response ?is_truncated:(is_truncated_ : boolean_type option)
    ?marker:(marker_ : marker_type option)
    ?delegation_requests:(delegation_requests_ : delegation_requests_list_type option) () =
  ({ is_truncated = is_truncated_; marker = marker_; delegation_requests = delegation_requests_ }
    : list_delegation_requests_response)

let make_list_delegation_requests_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ?owner_id:(owner_id_ : owner_id_type option) () =
  ({ max_items = max_items_; marker = marker_; owner_id = owner_id_ }
    : list_delegation_requests_request)

let make_list_attached_user_policies_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ?attached_policies:(attached_policies_ : attached_policies_list_type option) () =
  ({ marker = marker_; is_truncated = is_truncated_; attached_policies = attached_policies_ }
    : list_attached_user_policies_response)

let make_list_attached_user_policies_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ?path_prefix:(path_prefix_ : policy_path_type option)
    ~user_name:(user_name_ : user_name_type) () =
  ({ max_items = max_items_; marker = marker_; path_prefix = path_prefix_; user_name = user_name_ }
    : list_attached_user_policies_request)

let make_list_attached_role_policies_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ?attached_policies:(attached_policies_ : attached_policies_list_type option) () =
  ({ marker = marker_; is_truncated = is_truncated_; attached_policies = attached_policies_ }
    : list_attached_role_policies_response)

let make_list_attached_role_policies_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ?path_prefix:(path_prefix_ : policy_path_type option)
    ~role_name:(role_name_ : role_name_type) () =
  ({ max_items = max_items_; marker = marker_; path_prefix = path_prefix_; role_name = role_name_ }
    : list_attached_role_policies_request)

let make_list_attached_group_policies_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ?attached_policies:(attached_policies_ : attached_policies_list_type option) () =
  ({ marker = marker_; is_truncated = is_truncated_; attached_policies = attached_policies_ }
    : list_attached_group_policies_response)

let make_list_attached_group_policies_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ?path_prefix:(path_prefix_ : policy_path_type option)
    ~group_name:(group_name_ : group_name_type) () =
  ({
     max_items = max_items_;
     marker = marker_;
     path_prefix = path_prefix_;
     group_name = group_name_;
   }
    : list_attached_group_policies_request)

let make_list_account_aliases_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ~account_aliases:(account_aliases_ : account_alias_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; account_aliases = account_aliases_ }
    : list_account_aliases_response)

let make_list_account_aliases_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) () =
  ({ max_items = max_items_; marker = marker_ } : list_account_aliases_request)

let make_list_access_keys_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ~access_key_metadata:(access_key_metadata_ : access_key_metadata_list_type) () =
  ({ marker = marker_; is_truncated = is_truncated_; access_key_metadata = access_key_metadata_ }
    : list_access_keys_response)

let make_list_access_keys_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ?user_name:(user_name_ : existing_user_name_type option)
    () =
  ({ max_items = max_items_; marker = marker_; user_name = user_name_ } : list_access_keys_request)

let make_get_user_response ~user:(user_ : user) () = ({ user = user_ } : get_user_response)

let make_get_user_request ?user_name:(user_name_ : existing_user_name_type option) () =
  ({ user_name = user_name_ } : get_user_request)

let make_get_user_policy_response ~policy_document:(policy_document_ : policy_document_type)
    ~policy_name:(policy_name_ : policy_name_type) ~user_name:(user_name_ : existing_user_name_type)
    () =
  ({ policy_document = policy_document_; policy_name = policy_name_; user_name = user_name_ }
    : get_user_policy_response)

let make_get_user_policy_request ~policy_name:(policy_name_ : policy_name_type)
    ~user_name:(user_name_ : existing_user_name_type) () =
  ({ policy_name = policy_name_; user_name = user_name_ } : get_user_policy_request)

let make_deletion_task_failure_reason_type
    ?role_usage_list:(role_usage_list_ : role_usage_list_type option)
    ?reason:(reason_ : reason_type option) () =
  ({ role_usage_list = role_usage_list_; reason = reason_ } : deletion_task_failure_reason_type)

let make_get_service_linked_role_deletion_status_response
    ?reason:(reason_ : deletion_task_failure_reason_type option)
    ~status:(status_ : deletion_task_status_type) () =
  ({ reason = reason_; status = status_ } : get_service_linked_role_deletion_status_response)

let make_get_service_linked_role_deletion_status_request
    ~deletion_task_id:(deletion_task_id_ : deletion_task_id_type) () =
  ({ deletion_task_id = deletion_task_id_ } : get_service_linked_role_deletion_status_request)

let make_error_details ~code:(code_ : string_type) ~message:(message_ : string_type) () =
  ({ code = code_; message = message_ } : error_details)

let make_get_service_last_accessed_details_with_entities_response
    ?error:(error_ : error_details option) ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ~entity_details_list:(entity_details_list_ : entity_details_list_type)
    ~job_completion_date:(job_completion_date_ : date_type)
    ~job_creation_date:(job_creation_date_ : date_type) ~job_status:(job_status_ : job_status_type)
    () =
  ({
     error = error_;
     marker = marker_;
     is_truncated = is_truncated_;
     entity_details_list = entity_details_list_;
     job_completion_date = job_completion_date_;
     job_creation_date = job_creation_date_;
     job_status = job_status_;
   }
    : get_service_last_accessed_details_with_entities_response)

let make_get_service_last_accessed_details_with_entities_request
    ?marker:(marker_ : marker_type option) ?max_items:(max_items_ : max_items_type option)
    ~service_namespace:(service_namespace_ : service_namespace_type) ~job_id:(job_id_ : job_id_type)
    () =
  ({
     marker = marker_;
     max_items = max_items_;
     service_namespace = service_namespace_;
     job_id = job_id_;
   }
    : get_service_last_accessed_details_with_entities_request)

let make_get_service_last_accessed_details_response ?error:(error_ : error_details option)
    ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ?job_type:(job_type_ : access_advisor_usage_granularity_type option)
    ~job_completion_date:(job_completion_date_ : date_type)
    ~services_last_accessed:(services_last_accessed_ : services_last_accessed)
    ~job_creation_date:(job_creation_date_ : date_type) ~job_status:(job_status_ : job_status_type)
    () =
  ({
     error = error_;
     marker = marker_;
     is_truncated = is_truncated_;
     job_completion_date = job_completion_date_;
     services_last_accessed = services_last_accessed_;
     job_creation_date = job_creation_date_;
     job_type = job_type_;
     job_status = job_status_;
   }
    : get_service_last_accessed_details_response)

let make_get_service_last_accessed_details_request ?marker:(marker_ : marker_type option)
    ?max_items:(max_items_ : max_items_type option) ~job_id:(job_id_ : job_id_type) () =
  ({ marker = marker_; max_items = max_items_; job_id = job_id_ }
    : get_service_last_accessed_details_request)

let make_get_server_certificate_response
    ~server_certificate:(server_certificate_ : server_certificate) () =
  ({ server_certificate = server_certificate_ } : get_server_certificate_response)

let make_get_server_certificate_request
    ~server_certificate_name:(server_certificate_name_ : server_certificate_name_type) () =
  ({ server_certificate_name = server_certificate_name_ } : get_server_certificate_request)

let make_get_ssh_public_key_response ?ssh_public_key:(ssh_public_key_ : ssh_public_key option) () =
  ({ ssh_public_key = ssh_public_key_ } : get_ssh_public_key_response)

let make_get_ssh_public_key_request ~encoding:(encoding_ : encoding_type)
    ~ssh_public_key_id:(ssh_public_key_id_ : public_key_id_type)
    ~user_name:(user_name_ : user_name_type) () =
  ({ encoding = encoding_; ssh_public_key_id = ssh_public_key_id_; user_name = user_name_ }
    : get_ssh_public_key_request)

let make_get_saml_provider_response ?private_key_list:(private_key_list_ : private_key_list option)
    ?assertion_encryption_mode:(assertion_encryption_mode_ : assertion_encryption_mode_type option)
    ?tags:(tags_ : tag_list_type option) ?valid_until:(valid_until_ : date_type option)
    ?create_date:(create_date_ : date_type option)
    ?saml_metadata_document:(saml_metadata_document_ : saml_metadata_document_type option)
    ?saml_provider_uui_d:(saml_provider_uui_d_ : private_key_id_type option) () =
  ({
     private_key_list = private_key_list_;
     assertion_encryption_mode = assertion_encryption_mode_;
     tags = tags_;
     valid_until = valid_until_;
     create_date = create_date_;
     saml_metadata_document = saml_metadata_document_;
     saml_provider_uui_d = saml_provider_uui_d_;
   }
    : get_saml_provider_response)

let make_get_saml_provider_request ~saml_provider_arn:(saml_provider_arn_ : arn_type) () =
  ({ saml_provider_arn = saml_provider_arn_ } : get_saml_provider_request)

let make_get_role_response ~role:(role_ : role) () = ({ role = role_ } : get_role_response)

let make_get_role_request ~role_name:(role_name_ : role_name_type) () =
  ({ role_name = role_name_ } : get_role_request)

let make_get_role_policy_response ~policy_document:(policy_document_ : policy_document_type)
    ~policy_name:(policy_name_ : policy_name_type) ~role_name:(role_name_ : role_name_type) () =
  ({ policy_document = policy_document_; policy_name = policy_name_; role_name = role_name_ }
    : get_role_policy_response)

let make_get_role_policy_request ~policy_name:(policy_name_ : policy_name_type)
    ~role_name:(role_name_ : role_name_type) () =
  ({ policy_name = policy_name_; role_name = role_name_ } : get_role_policy_request)

let make_get_policy_version_response ?policy_version:(policy_version_ : policy_version option) () =
  ({ policy_version = policy_version_ } : get_policy_version_response)

let make_get_policy_version_request ~version_id:(version_id_ : policy_version_id_type)
    ~policy_arn:(policy_arn_ : arn_type) () =
  ({ version_id = version_id_; policy_arn = policy_arn_ } : get_policy_version_request)

let make_get_policy_response ?policy:(policy_ : policy option) () =
  ({ policy = policy_ } : get_policy_response)

let make_get_policy_request ~policy_arn:(policy_arn_ : arn_type) () =
  ({ policy_arn = policy_arn_ } : get_policy_request)

let make_get_outbound_web_identity_federation_info_response
    ?jwt_vending_enabled:(jwt_vending_enabled_ : boolean_type option)
    ?issuer_identifier:(issuer_identifier_ : string_type option) () =
  ({ jwt_vending_enabled = jwt_vending_enabled_; issuer_identifier = issuer_identifier_ }
    : get_outbound_web_identity_federation_info_response)

let make_access_detail
    ?total_authenticated_entities:(total_authenticated_entities_ : integer_type option)
    ?last_authenticated_time:(last_authenticated_time_ : date_type option)
    ?entity_path:(entity_path_ : organizations_entity_path_type option)
    ?region:(region_ : string_type option)
    ~service_namespace:(service_namespace_ : service_namespace_type)
    ~service_name:(service_name_ : service_name_type) () =
  ({
     total_authenticated_entities = total_authenticated_entities_;
     last_authenticated_time = last_authenticated_time_;
     entity_path = entity_path_;
     region = region_;
     service_namespace = service_namespace_;
     service_name = service_name_;
   }
    : access_detail)

let make_get_organizations_access_report_response
    ?error_details:(error_details_ : error_details option) ?marker:(marker_ : marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ?access_details:(access_details_ : access_details option)
    ?number_of_services_not_accessed:(number_of_services_not_accessed_ : integer_type option)
    ?number_of_services_accessible:(number_of_services_accessible_ : integer_type option)
    ?job_completion_date:(job_completion_date_ : date_type option)
    ~job_creation_date:(job_creation_date_ : date_type) ~job_status:(job_status_ : job_status_type)
    () =
  ({
     error_details = error_details_;
     marker = marker_;
     is_truncated = is_truncated_;
     access_details = access_details_;
     number_of_services_not_accessed = number_of_services_not_accessed_;
     number_of_services_accessible = number_of_services_accessible_;
     job_completion_date = job_completion_date_;
     job_creation_date = job_creation_date_;
     job_status = job_status_;
   }
    : get_organizations_access_report_response)

let make_get_organizations_access_report_request ?sort_key:(sort_key_ : sort_key_type option)
    ?marker:(marker_ : marker_type option) ?max_items:(max_items_ : max_items_type option)
    ~job_id:(job_id_ : job_id_type) () =
  ({ sort_key = sort_key_; marker = marker_; max_items = max_items_; job_id = job_id_ }
    : get_organizations_access_report_request)

let make_get_open_id_connect_provider_response ?tags:(tags_ : tag_list_type option)
    ?create_date:(create_date_ : date_type option)
    ?thumbprint_list:(thumbprint_list_ : thumbprint_list_type option)
    ?client_id_list:(client_id_list_ : client_id_list_type option)
    ?url:(url_ : open_id_connect_provider_url_type option) () =
  ({
     tags = tags_;
     create_date = create_date_;
     thumbprint_list = thumbprint_list_;
     client_id_list = client_id_list_;
     url = url_;
   }
    : get_open_id_connect_provider_response)

let make_get_open_id_connect_provider_request
    ~open_id_connect_provider_arn:(open_id_connect_provider_arn_ : arn_type) () =
  ({ open_id_connect_provider_arn = open_id_connect_provider_arn_ }
    : get_open_id_connect_provider_request)

let make_get_mfa_device_response ?certifications:(certifications_ : certification_map_type option)
    ?enable_date:(enable_date_ : date_type option) ?user_name:(user_name_ : user_name_type option)
    ~serial_number:(serial_number_ : serial_number_type) () =
  ({
     certifications = certifications_;
     enable_date = enable_date_;
     serial_number = serial_number_;
     user_name = user_name_;
   }
    : get_mfa_device_response)

let make_get_mfa_device_request ?user_name:(user_name_ : user_name_type option)
    ~serial_number:(serial_number_ : serial_number_type) () =
  ({ user_name = user_name_; serial_number = serial_number_ } : get_mfa_device_request)

let make_get_login_profile_response ~login_profile:(login_profile_ : login_profile) () =
  ({ login_profile = login_profile_ } : get_login_profile_response)

let make_get_login_profile_request ?user_name:(user_name_ : user_name_type option) () =
  ({ user_name = user_name_ } : get_login_profile_request)

let make_get_instance_profile_response ~instance_profile:(instance_profile_ : instance_profile) () =
  ({ instance_profile = instance_profile_ } : get_instance_profile_response)

let make_get_instance_profile_request
    ~instance_profile_name:(instance_profile_name_ : instance_profile_name_type) () =
  ({ instance_profile_name = instance_profile_name_ } : get_instance_profile_request)

let make_get_human_readable_summary_response
    ?summary_state:(summary_state_ : summary_state_type option)
    ?locale:(locale_ : locale_type option)
    ?summary_content:(summary_content_ : summary_content_type option) () =
  ({ summary_state = summary_state_; locale = locale_; summary_content = summary_content_ }
    : get_human_readable_summary_response)

let make_get_human_readable_summary_request ?locale:(locale_ : locale_type option)
    ~entity_arn:(entity_arn_ : arn_type) () =
  ({ locale = locale_; entity_arn = entity_arn_ } : get_human_readable_summary_request)

let make_get_group_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option) ~users:(users_ : user_list_type)
    ~group:(group_ : group) () =
  ({ marker = marker_; is_truncated = is_truncated_; users = users_; group = group_ }
    : get_group_response)

let make_get_group_request ?max_items:(max_items_ : max_items_type option)
    ?marker:(marker_ : marker_type option) ~group_name:(group_name_ : group_name_type) () =
  ({ max_items = max_items_; marker = marker_; group_name = group_name_ } : get_group_request)

let make_get_group_policy_response ~policy_document:(policy_document_ : policy_document_type)
    ~policy_name:(policy_name_ : policy_name_type) ~group_name:(group_name_ : group_name_type) () =
  ({ policy_document = policy_document_; policy_name = policy_name_; group_name = group_name_ }
    : get_group_policy_response)

let make_get_group_policy_request ~policy_name:(policy_name_ : policy_name_type)
    ~group_name:(group_name_ : group_name_type) () =
  ({ policy_name = policy_name_; group_name = group_name_ } : get_group_policy_request)

let make_get_delegation_request_response
    ?permission_check_result:(permission_check_result_ : permission_check_result_type option)
    ?permission_check_status:(permission_check_status_ : permission_check_status_type option)
    ?delegation_request:(delegation_request_ : delegation_request option) () =
  ({
     permission_check_result = permission_check_result_;
     permission_check_status = permission_check_status_;
     delegation_request = delegation_request_;
   }
    : get_delegation_request_response)

let make_get_delegation_request_request
    ?delegation_permission_check:(delegation_permission_check_ : boolean_type option)
    ~delegation_request_id:(delegation_request_id_ : delegation_request_id_type) () =
  ({
     delegation_permission_check = delegation_permission_check_;
     delegation_request_id = delegation_request_id_;
   }
    : get_delegation_request_request)

let make_get_credential_report_response ?generated_time:(generated_time_ : date_type option)
    ?report_format:(report_format_ : report_format_type option)
    ?content:(content_ : report_content_type option) () =
  ({ generated_time = generated_time_; report_format = report_format_; content = content_ }
    : get_credential_report_response)

let make_get_context_keys_for_principal_policy_request
    ?policy_input_list:(policy_input_list_ : simulation_policy_list_type option)
    ~policy_source_arn:(policy_source_arn_ : arn_type) () =
  ({ policy_input_list = policy_input_list_; policy_source_arn = policy_source_arn_ }
    : get_context_keys_for_principal_policy_request)

let make_get_context_keys_for_policy_response
    ?context_key_names:(context_key_names_ : context_key_names_result_list_type option) () =
  ({ context_key_names = context_key_names_ } : get_context_keys_for_policy_response)

let make_get_context_keys_for_custom_policy_request
    ~policy_input_list:(policy_input_list_ : simulation_policy_list_type) () =
  ({ policy_input_list = policy_input_list_ } : get_context_keys_for_custom_policy_request)

let make_get_account_summary_response ?summary_map:(summary_map_ : summary_map_type option) () =
  ({ summary_map = summary_map_ } : get_account_summary_response)

let make_get_account_password_policy_response ~password_policy:(password_policy_ : password_policy)
    () =
  ({ password_policy = password_policy_ } : get_account_password_policy_response)

let make_get_account_authorization_details_response ?marker:(marker_ : response_marker_type option)
    ?is_truncated:(is_truncated_ : boolean_type option)
    ?policies:(policies_ : managed_policy_detail_list_type option)
    ?role_detail_list:(role_detail_list_ : role_detail_list_type option)
    ?group_detail_list:(group_detail_list_ : group_detail_list_type option)
    ?user_detail_list:(user_detail_list_ : user_detail_list_type option) () =
  ({
     marker = marker_;
     is_truncated = is_truncated_;
     policies = policies_;
     role_detail_list = role_detail_list_;
     group_detail_list = group_detail_list_;
     user_detail_list = user_detail_list_;
   }
    : get_account_authorization_details_response)

let make_get_account_authorization_details_request ?marker:(marker_ : marker_type option)
    ?max_items:(max_items_ : max_items_type option) ?filter:(filter_ : entity_list_type option) () =
  ({ marker = marker_; max_items = max_items_; filter = filter_ }
    : get_account_authorization_details_request)

let make_access_key_last_used ?last_used_date:(last_used_date_ : date_type option)
    ~region:(region_ : string_type) ~service_name:(service_name_ : string_type) () =
  ({ region = region_; service_name = service_name_; last_used_date = last_used_date_ }
    : access_key_last_used)

let make_get_access_key_last_used_response
    ?access_key_last_used:(access_key_last_used_ : access_key_last_used option)
    ?user_name:(user_name_ : existing_user_name_type option) () =
  ({ access_key_last_used = access_key_last_used_; user_name = user_name_ }
    : get_access_key_last_used_response)

let make_get_access_key_last_used_request ~access_key_id:(access_key_id_ : access_key_id_type) () =
  ({ access_key_id = access_key_id_ } : get_access_key_last_used_request)

let make_generate_service_last_accessed_details_response ?job_id:(job_id_ : job_id_type option) () =
  ({ job_id = job_id_ } : generate_service_last_accessed_details_response)

let make_generate_service_last_accessed_details_request
    ?granularity:(granularity_ : access_advisor_usage_granularity_type option)
    ~arn:(arn_ : arn_type) () =
  ({ granularity = granularity_; arn = arn_ } : generate_service_last_accessed_details_request)

let make_generate_organizations_access_report_response ?job_id:(job_id_ : job_id_type option) () =
  ({ job_id = job_id_ } : generate_organizations_access_report_response)

let make_generate_organizations_access_report_request
    ?organizations_policy_id:(organizations_policy_id_ : organizations_policy_id_type option)
    ~entity_path:(entity_path_ : organizations_entity_path_type) () =
  ({ organizations_policy_id = organizations_policy_id_; entity_path = entity_path_ }
    : generate_organizations_access_report_request)

let make_generate_credential_report_response
    ?description:(description_ : report_state_description_type option)
    ?state:(state_ : report_state_type option) () =
  ({ description = description_; state = state_ } : generate_credential_report_response)

let make_enable_outbound_web_identity_federation_response
    ?issuer_identifier:(issuer_identifier_ : string_type option) () =
  ({ issuer_identifier = issuer_identifier_ } : enable_outbound_web_identity_federation_response)

let make_enable_organizations_root_sessions_response
    ?enabled_features:(enabled_features_ : features_list_type option)
    ?organization_id:(organization_id_ : organization_id_type option) () =
  ({ enabled_features = enabled_features_; organization_id = organization_id_ }
    : enable_organizations_root_sessions_response)

let make_enable_organizations_root_sessions_request () = (() : unit)

let make_enable_organizations_root_credentials_management_response
    ?enabled_features:(enabled_features_ : features_list_type option)
    ?organization_id:(organization_id_ : organization_id_type option) () =
  ({ enabled_features = enabled_features_; organization_id = organization_id_ }
    : enable_organizations_root_credentials_management_response)

let make_enable_organizations_root_credentials_management_request () = (() : unit)

let make_enable_mfa_device_request
    ~authentication_code2:(authentication_code2_ : authentication_code_type)
    ~authentication_code1:(authentication_code1_ : authentication_code_type)
    ~serial_number:(serial_number_ : serial_number_type)
    ~user_name:(user_name_ : existing_user_name_type) () =
  ({
     authentication_code2 = authentication_code2_;
     authentication_code1 = authentication_code1_;
     serial_number = serial_number_;
     user_name = user_name_;
   }
    : enable_mfa_device_request)

let make_disable_organizations_root_sessions_response
    ?enabled_features:(enabled_features_ : features_list_type option)
    ?organization_id:(organization_id_ : organization_id_type option) () =
  ({ enabled_features = enabled_features_; organization_id = organization_id_ }
    : disable_organizations_root_sessions_response)

let make_disable_organizations_root_sessions_request () = (() : unit)

let make_disable_organizations_root_credentials_management_response
    ?enabled_features:(enabled_features_ : features_list_type option)
    ?organization_id:(organization_id_ : organization_id_type option) () =
  ({ enabled_features = enabled_features_; organization_id = organization_id_ }
    : disable_organizations_root_credentials_management_response)

let make_disable_organizations_root_credentials_management_request () = (() : unit)

let make_detach_user_policy_request ~policy_arn:(policy_arn_ : arn_type)
    ~user_name:(user_name_ : user_name_type) () =
  ({ policy_arn = policy_arn_; user_name = user_name_ } : detach_user_policy_request)

let make_detach_role_policy_request ~policy_arn:(policy_arn_ : arn_type)
    ~role_name:(role_name_ : role_name_type) () =
  ({ policy_arn = policy_arn_; role_name = role_name_ } : detach_role_policy_request)

let make_detach_group_policy_request ~policy_arn:(policy_arn_ : arn_type)
    ~group_name:(group_name_ : group_name_type) () =
  ({ policy_arn = policy_arn_; group_name = group_name_ } : detach_group_policy_request)

let make_delete_virtual_mfa_device_request ~serial_number:(serial_number_ : serial_number_type) () =
  ({ serial_number = serial_number_ } : delete_virtual_mfa_device_request)

let make_delete_user_request ~user_name:(user_name_ : existing_user_name_type) () =
  ({ user_name = user_name_ } : delete_user_request)

let make_delete_user_policy_request ~policy_name:(policy_name_ : policy_name_type)
    ~user_name:(user_name_ : existing_user_name_type) () =
  ({ policy_name = policy_name_; user_name = user_name_ } : delete_user_policy_request)

let make_delete_user_permissions_boundary_request ~user_name:(user_name_ : user_name_type) () =
  ({ user_name = user_name_ } : delete_user_permissions_boundary_request)

let make_delete_signing_certificate_request ?user_name:(user_name_ : existing_user_name_type option)
    ~certificate_id:(certificate_id_ : certificate_id_type) () =
  ({ certificate_id = certificate_id_; user_name = user_name_ }
    : delete_signing_certificate_request)

let make_delete_service_specific_credential_request ?user_name:(user_name_ : user_name_type option)
    ~service_specific_credential_id:
      (service_specific_credential_id_ : service_specific_credential_id) () =
  ({ service_specific_credential_id = service_specific_credential_id_; user_name = user_name_ }
    : delete_service_specific_credential_request)

let make_delete_service_linked_role_response
    ~deletion_task_id:(deletion_task_id_ : deletion_task_id_type) () =
  ({ deletion_task_id = deletion_task_id_ } : delete_service_linked_role_response)

let make_delete_service_linked_role_request ~role_name:(role_name_ : role_name_type) () =
  ({ role_name = role_name_ } : delete_service_linked_role_request)

let make_delete_server_certificate_request
    ~server_certificate_name:(server_certificate_name_ : server_certificate_name_type) () =
  ({ server_certificate_name = server_certificate_name_ } : delete_server_certificate_request)

let make_delete_ssh_public_key_request ~ssh_public_key_id:(ssh_public_key_id_ : public_key_id_type)
    ~user_name:(user_name_ : user_name_type) () =
  ({ ssh_public_key_id = ssh_public_key_id_; user_name = user_name_ }
    : delete_ssh_public_key_request)

let make_delete_saml_provider_request ~saml_provider_arn:(saml_provider_arn_ : arn_type) () =
  ({ saml_provider_arn = saml_provider_arn_ } : delete_saml_provider_request)

let make_delete_role_request ~role_name:(role_name_ : role_name_type) () =
  ({ role_name = role_name_ } : delete_role_request)

let make_delete_role_policy_request ~policy_name:(policy_name_ : policy_name_type)
    ~role_name:(role_name_ : role_name_type) () =
  ({ policy_name = policy_name_; role_name = role_name_ } : delete_role_policy_request)

let make_delete_role_permissions_boundary_request ~role_name:(role_name_ : role_name_type) () =
  ({ role_name = role_name_ } : delete_role_permissions_boundary_request)

let make_delete_policy_version_request ~version_id:(version_id_ : policy_version_id_type)
    ~policy_arn:(policy_arn_ : arn_type) () =
  ({ version_id = version_id_; policy_arn = policy_arn_ } : delete_policy_version_request)

let make_delete_policy_request ~policy_arn:(policy_arn_ : arn_type) () =
  ({ policy_arn = policy_arn_ } : delete_policy_request)

let make_delete_open_id_connect_provider_request
    ~open_id_connect_provider_arn:(open_id_connect_provider_arn_ : arn_type) () =
  ({ open_id_connect_provider_arn = open_id_connect_provider_arn_ }
    : delete_open_id_connect_provider_request)

let make_delete_login_profile_request ?user_name:(user_name_ : user_name_type option) () =
  ({ user_name = user_name_ } : delete_login_profile_request)

let make_delete_instance_profile_request
    ~instance_profile_name:(instance_profile_name_ : instance_profile_name_type) () =
  ({ instance_profile_name = instance_profile_name_ } : delete_instance_profile_request)

let make_delete_group_request ~group_name:(group_name_ : group_name_type) () =
  ({ group_name = group_name_ } : delete_group_request)

let make_delete_group_policy_request ~policy_name:(policy_name_ : policy_name_type)
    ~group_name:(group_name_ : group_name_type) () =
  ({ policy_name = policy_name_; group_name = group_name_ } : delete_group_policy_request)

let make_delete_account_alias_request ~account_alias:(account_alias_ : account_alias_type) () =
  ({ account_alias = account_alias_ } : delete_account_alias_request)

let make_delete_access_key_request ?user_name:(user_name_ : existing_user_name_type option)
    ~access_key_id:(access_key_id_ : access_key_id_type) () =
  ({ access_key_id = access_key_id_; user_name = user_name_ } : delete_access_key_request)

let make_deactivate_mfa_device_request ?user_name:(user_name_ : existing_user_name_type option)
    ~serial_number:(serial_number_ : serial_number_type) () =
  ({ serial_number = serial_number_; user_name = user_name_ } : deactivate_mfa_device_request)

let make_create_virtual_mfa_device_response
    ~virtual_mfa_device:(virtual_mfa_device_ : virtual_mfa_device) () =
  ({ virtual_mfa_device = virtual_mfa_device_ } : create_virtual_mfa_device_response)

let make_create_virtual_mfa_device_request ?tags:(tags_ : tag_list_type option)
    ?path:(path_ : path_type option)
    ~virtual_mfa_device_name:(virtual_mfa_device_name_ : virtual_mfa_device_name) () =
  ({ tags = tags_; virtual_mfa_device_name = virtual_mfa_device_name_; path = path_ }
    : create_virtual_mfa_device_request)

let make_create_user_response ?user:(user_ : user option) () =
  ({ user = user_ } : create_user_response)

let make_create_user_request ?tags:(tags_ : tag_list_type option)
    ?permissions_boundary:(permissions_boundary_ : arn_type option) ?path:(path_ : path_type option)
    ~user_name:(user_name_ : user_name_type) () =
  ({
     tags = tags_;
     permissions_boundary = permissions_boundary_;
     user_name = user_name_;
     path = path_;
   }
    : create_user_request)

let make_create_service_specific_credential_response
    ?service_specific_credential:(service_specific_credential_ : service_specific_credential option)
    () =
  ({ service_specific_credential = service_specific_credential_ }
    : create_service_specific_credential_response)

let make_create_service_specific_credential_request
    ?credential_age_days:(credential_age_days_ : credential_age_days option)
    ~service_name:(service_name_ : service_name) ~user_name:(user_name_ : user_name_type) () =
  ({
     credential_age_days = credential_age_days_;
     service_name = service_name_;
     user_name = user_name_;
   }
    : create_service_specific_credential_request)

let make_create_service_linked_role_response ?role:(role_ : role option) () =
  ({ role = role_ } : create_service_linked_role_response)

let make_create_service_linked_role_request
    ?custom_suffix:(custom_suffix_ : custom_suffix_type option)
    ?description:(description_ : role_description_type option)
    ~aws_service_name:(aws_service_name_ : group_name_type) () =
  ({
     custom_suffix = custom_suffix_;
     description = description_;
     aws_service_name = aws_service_name_;
   }
    : create_service_linked_role_request)

let make_create_saml_provider_response ?tags:(tags_ : tag_list_type option)
    ?saml_provider_arn:(saml_provider_arn_ : arn_type option) () =
  ({ tags = tags_; saml_provider_arn = saml_provider_arn_ } : create_saml_provider_response)

let make_create_saml_provider_request ?add_private_key:(add_private_key_ : private_key_type option)
    ?assertion_encryption_mode:(assertion_encryption_mode_ : assertion_encryption_mode_type option)
    ?tags:(tags_ : tag_list_type option) ~name:(name_ : saml_provider_name_type)
    ~saml_metadata_document:(saml_metadata_document_ : saml_metadata_document_type) () =
  ({
     add_private_key = add_private_key_;
     assertion_encryption_mode = assertion_encryption_mode_;
     tags = tags_;
     name = name_;
     saml_metadata_document = saml_metadata_document_;
   }
    : create_saml_provider_request)

let make_create_role_response ~role:(role_ : role) () = ({ role = role_ } : create_role_response)

let make_create_role_request ?tags:(tags_ : tag_list_type option)
    ?permissions_boundary:(permissions_boundary_ : arn_type option)
    ?max_session_duration:(max_session_duration_ : role_max_session_duration_type option)
    ?description:(description_ : role_description_type option) ?path:(path_ : path_type option)
    ~assume_role_policy_document:(assume_role_policy_document_ : policy_document_type)
    ~role_name:(role_name_ : role_name_type) () =
  ({
     tags = tags_;
     permissions_boundary = permissions_boundary_;
     max_session_duration = max_session_duration_;
     description = description_;
     assume_role_policy_document = assume_role_policy_document_;
     role_name = role_name_;
     path = path_;
   }
    : create_role_request)

let make_create_policy_version_response ?policy_version:(policy_version_ : policy_version option) ()
    =
  ({ policy_version = policy_version_ } : create_policy_version_response)

let make_create_policy_version_request ?set_as_default:(set_as_default_ : boolean_type option)
    ~policy_document:(policy_document_ : policy_document_type) ~policy_arn:(policy_arn_ : arn_type)
    () =
  ({
     set_as_default = set_as_default_;
     policy_document = policy_document_;
     policy_arn = policy_arn_;
   }
    : create_policy_version_request)

let make_create_policy_response ?policy:(policy_ : policy option) () =
  ({ policy = policy_ } : create_policy_response)

let make_create_policy_request ?tags:(tags_ : tag_list_type option)
    ?description:(description_ : policy_description_type option)
    ?path:(path_ : policy_path_type option)
    ~policy_document:(policy_document_ : policy_document_type)
    ~policy_name:(policy_name_ : policy_name_type) () =
  ({
     tags = tags_;
     description = description_;
     policy_document = policy_document_;
     path = path_;
     policy_name = policy_name_;
   }
    : create_policy_request)

let make_create_open_id_connect_provider_response ?tags:(tags_ : tag_list_type option)
    ?open_id_connect_provider_arn:(open_id_connect_provider_arn_ : arn_type option) () =
  ({ tags = tags_; open_id_connect_provider_arn = open_id_connect_provider_arn_ }
    : create_open_id_connect_provider_response)

let make_create_open_id_connect_provider_request ?tags:(tags_ : tag_list_type option)
    ?thumbprint_list:(thumbprint_list_ : thumbprint_list_type option)
    ?client_id_list:(client_id_list_ : client_id_list_type option)
    ~url:(url_ : open_id_connect_provider_url_type) () =
  ({
     tags = tags_;
     thumbprint_list = thumbprint_list_;
     client_id_list = client_id_list_;
     url = url_;
   }
    : create_open_id_connect_provider_request)

let make_create_login_profile_response ~login_profile:(login_profile_ : login_profile) () =
  ({ login_profile = login_profile_ } : create_login_profile_response)

let make_create_login_profile_request
    ?password_reset_required:(password_reset_required_ : boolean_type option)
    ?password:(password_ : password_type option) ?user_name:(user_name_ : user_name_type option) ()
    =
  ({
     password_reset_required = password_reset_required_;
     password = password_;
     user_name = user_name_;
   }
    : create_login_profile_request)

let make_create_instance_profile_response ~instance_profile:(instance_profile_ : instance_profile)
    () =
  ({ instance_profile = instance_profile_ } : create_instance_profile_response)

let make_create_instance_profile_request ?tags:(tags_ : tag_list_type option)
    ?path:(path_ : path_type option)
    ~instance_profile_name:(instance_profile_name_ : instance_profile_name_type) () =
  ({ tags = tags_; path = path_; instance_profile_name = instance_profile_name_ }
    : create_instance_profile_request)

let make_create_group_response ~group:(group_ : group) () =
  ({ group = group_ } : create_group_response)

let make_create_group_request ?path:(path_ : path_type option)
    ~group_name:(group_name_ : group_name_type) () =
  ({ group_name = group_name_; path = path_ } : create_group_request)

let make_create_delegation_request_response
    ?delegation_request_id:(delegation_request_id_ : delegation_request_id_type option)
    ?console_deep_link:(console_deep_link_ : console_deep_link_type option) () =
  ({ delegation_request_id = delegation_request_id_; console_deep_link = console_deep_link_ }
    : create_delegation_request_response)

let make_create_delegation_request_request
    ?only_send_by_owner:(only_send_by_owner_ : boolean_type option)
    ?redirect_url:(redirect_url_ : redirect_url_type option)
    ?request_message:(request_message_ : request_message_type option)
    ?owner_account_id:(owner_account_id_ : account_id_type option)
    ~session_duration:(session_duration_ : session_duration_type)
    ~notification_channel:(notification_channel_ : notification_channel_type)
    ~requestor_workflow_id:(requestor_workflow_id_ : requestor_workflow_id_type)
    ~permissions:(permissions_ : delegation_permission)
    ~description:(description_ : delegation_request_description_type) () =
  ({
     only_send_by_owner = only_send_by_owner_;
     session_duration = session_duration_;
     notification_channel = notification_channel_;
     redirect_url = redirect_url_;
     requestor_workflow_id = requestor_workflow_id_;
     request_message = request_message_;
     permissions = permissions_;
     description = description_;
     owner_account_id = owner_account_id_;
   }
    : create_delegation_request_request)

let make_create_account_alias_request ~account_alias:(account_alias_ : account_alias_type) () =
  ({ account_alias = account_alias_ } : create_account_alias_request)

let make_access_key ?create_date:(create_date_ : date_type option)
    ~secret_access_key:(secret_access_key_ : access_key_secret_type) ~status:(status_ : status_type)
    ~access_key_id:(access_key_id_ : access_key_id_type) ~user_name:(user_name_ : user_name_type) ()
    =
  ({
     create_date = create_date_;
     secret_access_key = secret_access_key_;
     status = status_;
     access_key_id = access_key_id_;
     user_name = user_name_;
   }
    : access_key)

let make_create_access_key_response ~access_key:(access_key_ : access_key) () =
  ({ access_key = access_key_ } : create_access_key_response)

let make_create_access_key_request ?user_name:(user_name_ : existing_user_name_type option) () =
  ({ user_name = user_name_ } : create_access_key_request)

let make_change_password_request ~new_password:(new_password_ : password_type)
    ~old_password:(old_password_ : password_type) () =
  ({ new_password = new_password_; old_password = old_password_ } : change_password_request)

let make_attach_user_policy_request ~policy_arn:(policy_arn_ : arn_type)
    ~user_name:(user_name_ : user_name_type) () =
  ({ policy_arn = policy_arn_; user_name = user_name_ } : attach_user_policy_request)

let make_attach_role_policy_request ~policy_arn:(policy_arn_ : arn_type)
    ~role_name:(role_name_ : role_name_type) () =
  ({ policy_arn = policy_arn_; role_name = role_name_ } : attach_role_policy_request)

let make_attach_group_policy_request ~policy_arn:(policy_arn_ : arn_type)
    ~group_name:(group_name_ : group_name_type) () =
  ({ policy_arn = policy_arn_; group_name = group_name_ } : attach_group_policy_request)

let make_associate_delegation_request_request
    ~delegation_request_id:(delegation_request_id_ : delegation_request_id_type) () =
  ({ delegation_request_id = delegation_request_id_ } : associate_delegation_request_request)

let make_add_user_to_group_request ~user_name:(user_name_ : existing_user_name_type)
    ~group_name:(group_name_ : group_name_type) () =
  ({ user_name = user_name_; group_name = group_name_ } : add_user_to_group_request)

let make_add_role_to_instance_profile_request ~role_name:(role_name_ : role_name_type)
    ~instance_profile_name:(instance_profile_name_ : instance_profile_name_type) () =
  ({ role_name = role_name_; instance_profile_name = instance_profile_name_ }
    : add_role_to_instance_profile_request)

let make_add_client_id_to_open_id_connect_provider_request
    ~client_i_d:(client_i_d_ : client_id_type)
    ~open_id_connect_provider_arn:(open_id_connect_provider_arn_ : arn_type) () =
  ({ client_i_d = client_i_d_; open_id_connect_provider_arn = open_id_connect_provider_arn_ }
    : add_client_id_to_open_id_connect_provider_request)

let make_accept_delegation_request_request
    ~delegation_request_id:(delegation_request_id_ : delegation_request_id_type) () =
  ({ delegation_request_id = delegation_request_id_ } : accept_delegation_request_request)
