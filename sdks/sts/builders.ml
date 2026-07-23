open Types

let make_get_web_identity_token_response
    ?web_identity_token:(web_identity_token_ : web_identity_token_type option)
    ?expiration:(expiration_ : date_type option) () =
  ({ web_identity_token = web_identity_token_; expiration = expiration_ }
    : get_web_identity_token_response)

let make_tag ~key:(key_ : tag_key_type) ~value:(value_ : tag_value_type) () =
  ({ key = key_; value = value_ } : tag)

let make_get_web_identity_token_request
    ?duration_seconds:(duration_seconds_ : web_identity_token_duration_seconds_type option)
    ?tags:(tags_ : tag_list_type option)
    ~audience:(audience_ : web_identity_token_audience_list_type)
    ~signing_algorithm:(signing_algorithm_ : jwt_algorithm_type) () =
  ({
     audience = audience_;
     duration_seconds = duration_seconds_;
     signing_algorithm = signing_algorithm_;
     tags = tags_;
   }
    : get_web_identity_token_request)

let make_credentials ~access_key_id:(access_key_id_ : access_key_id_type)
    ~secret_access_key:(secret_access_key_ : access_key_secret_type)
    ~session_token:(session_token_ : token_type) ~expiration:(expiration_ : date_type) () =
  ({
     access_key_id = access_key_id_;
     secret_access_key = secret_access_key_;
     session_token = session_token_;
     expiration = expiration_;
   }
    : credentials)

let make_get_session_token_response ?credentials:(credentials_ : credentials option) () =
  ({ credentials = credentials_ } : get_session_token_response)

let make_get_session_token_request
    ?duration_seconds:(duration_seconds_ : duration_seconds_type option)
    ?serial_number:(serial_number_ : serial_number_type option)
    ?token_code:(token_code_ : token_code_type option) () =
  ({
     duration_seconds = duration_seconds_;
     serial_number = serial_number_;
     token_code = token_code_;
   }
    : get_session_token_request)

let make_federated_user ~federated_user_id:(federated_user_id_ : federated_id_type)
    ~arn:(arn_ : arn_type) () =
  ({ federated_user_id = federated_user_id_; arn = arn_ } : federated_user)

let make_get_federation_token_response ?credentials:(credentials_ : credentials option)
    ?federated_user:(federated_user_ : federated_user option)
    ?packed_policy_size:(packed_policy_size_ : non_negative_integer_type option) () =
  ({
     credentials = credentials_;
     federated_user = federated_user_;
     packed_policy_size = packed_policy_size_;
   }
    : get_federation_token_response)

let make_policy_descriptor_type ?arn:(arn_ : arn_type option) () =
  ({ arn = arn_ } : policy_descriptor_type)

let make_get_federation_token_request ?policy:(policy_ : session_policy_document_type option)
    ?policy_arns:(policy_arns_ : policy_descriptor_list_type option)
    ?duration_seconds:(duration_seconds_ : duration_seconds_type option)
    ?tags:(tags_ : tag_list_type option) ~name:(name_ : user_name_type) () =
  ({
     name = name_;
     policy = policy_;
     policy_arns = policy_arns_;
     duration_seconds = duration_seconds_;
     tags = tags_;
   }
    : get_federation_token_request)

let make_get_delegated_access_token_response ?credentials:(credentials_ : credentials option)
    ?packed_policy_size:(packed_policy_size_ : non_negative_integer_type option)
    ?assumed_principal:(assumed_principal_ : arn_type option) () =
  ({
     credentials = credentials_;
     packed_policy_size = packed_policy_size_;
     assumed_principal = assumed_principal_;
   }
    : get_delegated_access_token_response)

let make_get_delegated_access_token_request ~trade_in_token:(trade_in_token_ : trade_in_token_type)
    () =
  ({ trade_in_token = trade_in_token_ } : get_delegated_access_token_request)

let make_get_caller_identity_response ?user_id:(user_id_ : user_id_type option)
    ?account:(account_ : account_type option) ?arn:(arn_ : arn_type option) () =
  ({ user_id = user_id_; account = account_; arn = arn_ } : get_caller_identity_response)

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

let make_assume_root_response ?credentials:(credentials_ : credentials option)
    ?source_identity:(source_identity_ : source_identity_type option) () =
  ({ credentials = credentials_; source_identity = source_identity_ } : assume_root_response)

let make_assume_root_request
    ?duration_seconds:(duration_seconds_ : root_duration_seconds_type option)
    ~target_principal:(target_principal_ : target_principal_type)
    ~task_policy_arn:(task_policy_arn_ : policy_descriptor_type) () =
  ({
     target_principal = target_principal_;
     task_policy_arn = task_policy_arn_;
     duration_seconds = duration_seconds_;
   }
    : assume_root_request)

let make_assumed_role_user ~assumed_role_id:(assumed_role_id_ : assumed_role_id_type)
    ~arn:(arn_ : arn_type) () =
  ({ assumed_role_id = assumed_role_id_; arn = arn_ } : assumed_role_user)

let make_assume_role_with_web_identity_response ?credentials:(credentials_ : credentials option)
    ?subject_from_web_identity_token:
      (subject_from_web_identity_token_ : web_identity_subject_type option)
    ?assumed_role_user:(assumed_role_user_ : assumed_role_user option)
    ?packed_policy_size:(packed_policy_size_ : non_negative_integer_type option)
    ?provider:(provider_ : issuer option) ?audience:(audience_ : audience option)
    ?source_identity:(source_identity_ : source_identity_type option) () =
  ({
     credentials = credentials_;
     subject_from_web_identity_token = subject_from_web_identity_token_;
     assumed_role_user = assumed_role_user_;
     packed_policy_size = packed_policy_size_;
     provider = provider_;
     audience = audience_;
     source_identity = source_identity_;
   }
    : assume_role_with_web_identity_response)

let make_assume_role_with_web_identity_request ?provider_id:(provider_id_ : url_type option)
    ?policy_arns:(policy_arns_ : policy_descriptor_list_type option)
    ?policy:(policy_ : session_policy_document_type option)
    ?duration_seconds:(duration_seconds_ : role_duration_seconds_type option)
    ~role_arn:(role_arn_ : arn_type)
    ~role_session_name:(role_session_name_ : role_session_name_type)
    ~web_identity_token:(web_identity_token_ : client_token_type) () =
  ({
     role_arn = role_arn_;
     role_session_name = role_session_name_;
     web_identity_token = web_identity_token_;
     provider_id = provider_id_;
     policy_arns = policy_arns_;
     policy = policy_;
     duration_seconds = duration_seconds_;
   }
    : assume_role_with_web_identity_request)

let make_assume_role_with_saml_response ?credentials:(credentials_ : credentials option)
    ?assumed_role_user:(assumed_role_user_ : assumed_role_user option)
    ?packed_policy_size:(packed_policy_size_ : non_negative_integer_type option)
    ?subject:(subject_ : subject option) ?subject_type:(subject_type_ : subject_type option)
    ?issuer:(issuer_ : issuer option) ?audience:(audience_ : audience option)
    ?name_qualifier:(name_qualifier_ : name_qualifier option)
    ?source_identity:(source_identity_ : source_identity_type option) () =
  ({
     credentials = credentials_;
     assumed_role_user = assumed_role_user_;
     packed_policy_size = packed_policy_size_;
     subject = subject_;
     subject_type = subject_type_;
     issuer = issuer_;
     audience = audience_;
     name_qualifier = name_qualifier_;
     source_identity = source_identity_;
   }
    : assume_role_with_saml_response)

let make_assume_role_with_saml_request
    ?policy_arns:(policy_arns_ : policy_descriptor_list_type option)
    ?policy:(policy_ : session_policy_document_type option)
    ?duration_seconds:(duration_seconds_ : role_duration_seconds_type option)
    ~role_arn:(role_arn_ : arn_type) ~principal_arn:(principal_arn_ : arn_type)
    ~saml_assertion:(saml_assertion_ : saml_assertion_type) () =
  ({
     role_arn = role_arn_;
     principal_arn = principal_arn_;
     saml_assertion = saml_assertion_;
     policy_arns = policy_arns_;
     policy = policy_;
     duration_seconds = duration_seconds_;
   }
    : assume_role_with_saml_request)

let make_assume_role_response ?credentials:(credentials_ : credentials option)
    ?assumed_role_user:(assumed_role_user_ : assumed_role_user option)
    ?packed_policy_size:(packed_policy_size_ : non_negative_integer_type option)
    ?source_identity:(source_identity_ : source_identity_type option) () =
  ({
     credentials = credentials_;
     assumed_role_user = assumed_role_user_;
     packed_policy_size = packed_policy_size_;
     source_identity = source_identity_;
   }
    : assume_role_response)

let make_provided_context ?provider_arn:(provider_arn_ : arn_type option)
    ?context_assertion:(context_assertion_ : context_assertion_type option) () =
  ({ provider_arn = provider_arn_; context_assertion = context_assertion_ } : provided_context)

let make_assume_role_request ?policy_arns:(policy_arns_ : policy_descriptor_list_type option)
    ?policy:(policy_ : unrestricted_session_policy_document_type option)
    ?duration_seconds:(duration_seconds_ : role_duration_seconds_type option)
    ?tags:(tags_ : tag_list_type option)
    ?transitive_tag_keys:(transitive_tag_keys_ : tag_key_list_type option)
    ?external_id:(external_id_ : external_id_type option)
    ?serial_number:(serial_number_ : serial_number_type option)
    ?token_code:(token_code_ : token_code_type option)
    ?source_identity:(source_identity_ : source_identity_type option)
    ?provided_contexts:(provided_contexts_ : provided_contexts_list_type option)
    ~role_arn:(role_arn_ : arn_type)
    ~role_session_name:(role_session_name_ : role_session_name_type) () =
  ({
     role_arn = role_arn_;
     role_session_name = role_session_name_;
     policy_arns = policy_arns_;
     policy = policy_;
     duration_seconds = duration_seconds_;
     tags = tags_;
     transitive_tag_keys = transitive_tag_keys_;
     external_id = external_id_;
     serial_number = serial_number_;
     token_code = token_code_;
     source_identity = source_identity_;
     provided_contexts = provided_contexts_;
   }
    : assume_role_request)
