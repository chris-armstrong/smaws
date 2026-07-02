open Types

let make_tag ~value:(value_ : tag_value_type) ~key:(key_ : tag_key_type) () =
  ({ value = value_; key = key_ } : tag)

let make_policy_descriptor_type ?arn:(arn_ : arn_type option) () =
  ({ arn = arn_ } : policy_descriptor_type)

let make_provided_context ?context_assertion:(context_assertion_ : context_assertion_type option)
    ?provider_arn:(provider_arn_ : arn_type option) () =
  ({ context_assertion = context_assertion_; provider_arn = provider_arn_ } : provided_context)

let make_credentials ~expiration:(expiration_ : date_type)
    ~session_token:(session_token_ : token_type)
    ~secret_access_key:(secret_access_key_ : access_key_secret_type)
    ~access_key_id:(access_key_id_ : access_key_id_type) () =
  ({
     expiration = expiration_;
     session_token = session_token_;
     secret_access_key = secret_access_key_;
     access_key_id = access_key_id_;
   }
    : credentials)

let make_get_session_token_response ?credentials:(credentials_ : credentials option) () =
  ({ credentials = credentials_ } : get_session_token_response)

let make_get_session_token_request ?token_code:(token_code_ : token_code_type option)
    ?serial_number:(serial_number_ : serial_number_type option)
    ?duration_seconds:(duration_seconds_ : duration_seconds_type option) () =
  ({
     token_code = token_code_;
     serial_number = serial_number_;
     duration_seconds = duration_seconds_;
   }
    : get_session_token_request)

let make_federated_user ~arn:(arn_ : arn_type)
    ~federated_user_id:(federated_user_id_ : federated_id_type) () =
  ({ arn = arn_; federated_user_id = federated_user_id_ } : federated_user)

let make_get_federation_token_response
    ?packed_policy_size:(packed_policy_size_ : non_negative_integer_type option)
    ?federated_user:(federated_user_ : federated_user option)
    ?credentials:(credentials_ : credentials option) () =
  ({
     packed_policy_size = packed_policy_size_;
     federated_user = federated_user_;
     credentials = credentials_;
   }
    : get_federation_token_response)

let make_get_federation_token_request ?tags:(tags_ : tag_list_type option)
    ?duration_seconds:(duration_seconds_ : duration_seconds_type option)
    ?policy_arns:(policy_arns_ : policy_descriptor_list_type option)
    ?policy:(policy_ : session_policy_document_type option) ~name:(name_ : user_name_type) () =
  ({
     tags = tags_;
     duration_seconds = duration_seconds_;
     policy_arns = policy_arns_;
     policy = policy_;
     name = name_;
   }
    : get_federation_token_request)

let make_get_caller_identity_response ?arn:(arn_ : arn_type option)
    ?account:(account_ : account_type option) ?user_id:(user_id_ : user_id_type option) () =
  ({ arn = arn_; account = account_; user_id = user_id_ } : get_caller_identity_response)

let make_get_caller_identity_request () = (() : unit)

let make_get_access_key_info_response ?account:(account_ : account_type option) () =
  ({ account = account_ } : get_access_key_info_response)

let make_get_access_key_info_request ~access_key_id:(access_key_id_ : access_key_id_type) () =
  ({ access_key_id = access_key_id_ } : get_access_key_info_request)

let make_decode_authorization_message_response
    ?decoded_message:(decoded_message_ : decoded_message_type option) () =
  ({ decoded_message = decoded_message_ } : decode_authorization_message_response)

let make_decode_authorization_message_request
    ~encoded_message:(encoded_message_ : encoded_message_type) () =
  ({ encoded_message = encoded_message_ } : decode_authorization_message_request)

let make_assumed_role_user ~arn:(arn_ : arn_type)
    ~assumed_role_id:(assumed_role_id_ : assumed_role_id_type) () =
  ({ arn = arn_; assumed_role_id = assumed_role_id_ } : assumed_role_user)

let make_assume_root_response ?source_identity:(source_identity_ : source_identity_type option)
    ?credentials:(credentials_ : credentials option) () =
  ({ source_identity = source_identity_; credentials = credentials_ } : assume_root_response)

let make_assume_root_request
    ?duration_seconds:(duration_seconds_ : root_duration_seconds_type option)
    ~task_policy_arn:(task_policy_arn_ : policy_descriptor_type)
    ~target_principal:(target_principal_ : target_principal_type) () =
  ({
     duration_seconds = duration_seconds_;
     task_policy_arn = task_policy_arn_;
     target_principal = target_principal_;
   }
    : assume_root_request)

let make_assume_role_with_web_identity_response
    ?source_identity:(source_identity_ : source_identity_type option)
    ?audience:(audience_ : audience option) ?provider:(provider_ : issuer option)
    ?packed_policy_size:(packed_policy_size_ : non_negative_integer_type option)
    ?assumed_role_user:(assumed_role_user_ : assumed_role_user option)
    ?subject_from_web_identity_token:
      (subject_from_web_identity_token_ : web_identity_subject_type option)
    ?credentials:(credentials_ : credentials option) () =
  ({
     source_identity = source_identity_;
     audience = audience_;
     provider = provider_;
     packed_policy_size = packed_policy_size_;
     assumed_role_user = assumed_role_user_;
     subject_from_web_identity_token = subject_from_web_identity_token_;
     credentials = credentials_;
   }
    : assume_role_with_web_identity_response)

let make_assume_role_with_web_identity_request
    ?duration_seconds:(duration_seconds_ : role_duration_seconds_type option)
    ?policy:(policy_ : session_policy_document_type option)
    ?policy_arns:(policy_arns_ : policy_descriptor_list_type option)
    ?provider_id:(provider_id_ : url_type option)
    ~web_identity_token:(web_identity_token_ : client_token_type)
    ~role_session_name:(role_session_name_ : role_session_name_type)
    ~role_arn:(role_arn_ : arn_type) () =
  ({
     duration_seconds = duration_seconds_;
     policy = policy_;
     policy_arns = policy_arns_;
     provider_id = provider_id_;
     web_identity_token = web_identity_token_;
     role_session_name = role_session_name_;
     role_arn = role_arn_;
   }
    : assume_role_with_web_identity_request)

let make_assume_role_with_saml_response
    ?source_identity:(source_identity_ : source_identity_type option)
    ?name_qualifier:(name_qualifier_ : name_qualifier option)
    ?audience:(audience_ : audience option) ?issuer:(issuer_ : issuer option)
    ?subject_type:(subject_type_ : subject_type option) ?subject:(subject_ : subject option)
    ?packed_policy_size:(packed_policy_size_ : non_negative_integer_type option)
    ?assumed_role_user:(assumed_role_user_ : assumed_role_user option)
    ?credentials:(credentials_ : credentials option) () =
  ({
     source_identity = source_identity_;
     name_qualifier = name_qualifier_;
     audience = audience_;
     issuer = issuer_;
     subject_type = subject_type_;
     subject = subject_;
     packed_policy_size = packed_policy_size_;
     assumed_role_user = assumed_role_user_;
     credentials = credentials_;
   }
    : assume_role_with_saml_response)

let make_assume_role_with_saml_request
    ?duration_seconds:(duration_seconds_ : role_duration_seconds_type option)
    ?policy:(policy_ : session_policy_document_type option)
    ?policy_arns:(policy_arns_ : policy_descriptor_list_type option)
    ~saml_assertion:(saml_assertion_ : saml_assertion_type)
    ~principal_arn:(principal_arn_ : arn_type) ~role_arn:(role_arn_ : arn_type) () =
  ({
     duration_seconds = duration_seconds_;
     policy = policy_;
     policy_arns = policy_arns_;
     saml_assertion = saml_assertion_;
     principal_arn = principal_arn_;
     role_arn = role_arn_;
   }
    : assume_role_with_saml_request)

let make_assume_role_response ?source_identity:(source_identity_ : source_identity_type option)
    ?packed_policy_size:(packed_policy_size_ : non_negative_integer_type option)
    ?assumed_role_user:(assumed_role_user_ : assumed_role_user option)
    ?credentials:(credentials_ : credentials option) () =
  ({
     source_identity = source_identity_;
     packed_policy_size = packed_policy_size_;
     assumed_role_user = assumed_role_user_;
     credentials = credentials_;
   }
    : assume_role_response)

let make_assume_role_request
    ?provided_contexts:(provided_contexts_ : provided_contexts_list_type option)
    ?source_identity:(source_identity_ : source_identity_type option)
    ?token_code:(token_code_ : token_code_type option)
    ?serial_number:(serial_number_ : serial_number_type option)
    ?external_id:(external_id_ : external_id_type option)
    ?transitive_tag_keys:(transitive_tag_keys_ : tag_key_list_type option)
    ?tags:(tags_ : tag_list_type option)
    ?duration_seconds:(duration_seconds_ : role_duration_seconds_type option)
    ?policy:(policy_ : unrestricted_session_policy_document_type option)
    ?policy_arns:(policy_arns_ : policy_descriptor_list_type option)
    ~role_session_name:(role_session_name_ : role_session_name_type)
    ~role_arn:(role_arn_ : arn_type) () =
  ({
     provided_contexts = provided_contexts_;
     source_identity = source_identity_;
     token_code = token_code_;
     serial_number = serial_number_;
     external_id = external_id_;
     transitive_tag_keys = transitive_tag_keys_;
     tags = tags_;
     duration_seconds = duration_seconds_;
     policy = policy_;
     policy_arns = policy_arns_;
     role_session_name = role_session_name_;
     role_arn = role_arn_;
   }
    : assume_role_request)
