open Types

val make_get_web_identity_token_response :
  ?web_identity_token:web_identity_token_type ->
  ?expiration:date_type ->
  unit ->
  get_web_identity_token_response

val make_tag : key:tag_key_type -> value:tag_value_type -> unit -> tag

val make_get_web_identity_token_request :
  ?duration_seconds:web_identity_token_duration_seconds_type ->
  ?tags:tag_list_type ->
  audience:web_identity_token_audience_list_type ->
  signing_algorithm:jwt_algorithm_type ->
  unit ->
  get_web_identity_token_request

val make_credentials :
  access_key_id:access_key_id_type ->
  secret_access_key:access_key_secret_type ->
  session_token:token_type ->
  expiration:date_type ->
  unit ->
  credentials

val make_get_session_token_response : ?credentials:credentials -> unit -> get_session_token_response

val make_get_session_token_request :
  ?duration_seconds:duration_seconds_type ->
  ?serial_number:serial_number_type ->
  ?token_code:token_code_type ->
  unit ->
  get_session_token_request

val make_federated_user :
  federated_user_id:federated_id_type -> arn:arn_type -> unit -> federated_user

val make_get_federation_token_response :
  ?credentials:credentials ->
  ?federated_user:federated_user ->
  ?packed_policy_size:non_negative_integer_type ->
  unit ->
  get_federation_token_response

val make_policy_descriptor_type : ?arn:arn_type -> unit -> policy_descriptor_type

val make_get_federation_token_request :
  ?policy:session_policy_document_type ->
  ?policy_arns:policy_descriptor_list_type ->
  ?duration_seconds:duration_seconds_type ->
  ?tags:tag_list_type ->
  name:user_name_type ->
  unit ->
  get_federation_token_request

val make_get_delegated_access_token_response :
  ?credentials:credentials ->
  ?packed_policy_size:non_negative_integer_type ->
  ?assumed_principal:arn_type ->
  unit ->
  get_delegated_access_token_response

val make_get_delegated_access_token_request :
  trade_in_token:trade_in_token_type -> unit -> get_delegated_access_token_request

val make_get_caller_identity_response :
  ?user_id:user_id_type ->
  ?account:account_type ->
  ?arn:arn_type ->
  unit ->
  get_caller_identity_response

val make_get_caller_identity_request : unit -> unit

val make_get_access_key_info_response :
  ?account:account_type -> unit -> get_access_key_info_response

val make_get_access_key_info_request :
  access_key_id:access_key_id_type -> unit -> get_access_key_info_request

val make_decode_authorization_message_response :
  ?decoded_message:decoded_message_type -> unit -> decode_authorization_message_response

val make_decode_authorization_message_request :
  encoded_message:encoded_message_type -> unit -> decode_authorization_message_request

val make_assume_root_response :
  ?credentials:credentials -> ?source_identity:source_identity_type -> unit -> assume_root_response

val make_assume_root_request :
  ?duration_seconds:root_duration_seconds_type ->
  target_principal:target_principal_type ->
  task_policy_arn:policy_descriptor_type ->
  unit ->
  assume_root_request

val make_assumed_role_user :
  assumed_role_id:assumed_role_id_type -> arn:arn_type -> unit -> assumed_role_user

val make_assume_role_with_web_identity_response :
  ?credentials:credentials ->
  ?subject_from_web_identity_token:web_identity_subject_type ->
  ?assumed_role_user:assumed_role_user ->
  ?packed_policy_size:non_negative_integer_type ->
  ?provider:issuer ->
  ?audience:audience ->
  ?source_identity:source_identity_type ->
  unit ->
  assume_role_with_web_identity_response

val make_assume_role_with_web_identity_request :
  ?provider_id:url_type ->
  ?policy_arns:policy_descriptor_list_type ->
  ?policy:session_policy_document_type ->
  ?duration_seconds:role_duration_seconds_type ->
  role_arn:arn_type ->
  role_session_name:role_session_name_type ->
  web_identity_token:client_token_type ->
  unit ->
  assume_role_with_web_identity_request

val make_assume_role_with_saml_response :
  ?credentials:credentials ->
  ?assumed_role_user:assumed_role_user ->
  ?packed_policy_size:non_negative_integer_type ->
  ?subject:subject ->
  ?subject_type:subject_type ->
  ?issuer:issuer ->
  ?audience:audience ->
  ?name_qualifier:name_qualifier ->
  ?source_identity:source_identity_type ->
  unit ->
  assume_role_with_saml_response

val make_assume_role_with_saml_request :
  ?policy_arns:policy_descriptor_list_type ->
  ?policy:session_policy_document_type ->
  ?duration_seconds:role_duration_seconds_type ->
  role_arn:arn_type ->
  principal_arn:arn_type ->
  saml_assertion:saml_assertion_type ->
  unit ->
  assume_role_with_saml_request

val make_assume_role_response :
  ?credentials:credentials ->
  ?assumed_role_user:assumed_role_user ->
  ?packed_policy_size:non_negative_integer_type ->
  ?source_identity:source_identity_type ->
  unit ->
  assume_role_response

val make_provided_context :
  ?provider_arn:arn_type -> ?context_assertion:context_assertion_type -> unit -> provided_context

val make_assume_role_request :
  ?policy_arns:policy_descriptor_list_type ->
  ?policy:unrestricted_session_policy_document_type ->
  ?duration_seconds:role_duration_seconds_type ->
  ?tags:tag_list_type ->
  ?transitive_tag_keys:tag_key_list_type ->
  ?external_id:external_id_type ->
  ?serial_number:serial_number_type ->
  ?token_code:token_code_type ->
  ?source_identity:source_identity_type ->
  ?provided_contexts:provided_contexts_list_type ->
  role_arn:arn_type ->
  role_session_name:role_session_name_type ->
  unit ->
  assume_role_request
