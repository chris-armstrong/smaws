open Types

val make_custom_attribute : ?value:string_ -> ?object_identifier:string_ -> unit -> custom_attribute

val make_distinguished_name :
  ?title:string_ ->
  ?surname:string_ ->
  ?state:string_ ->
  ?serial_number:string_ ->
  ?pseudonym:string_ ->
  ?organizational_unit:string_ ->
  ?organization:string_ ->
  ?locality:string_ ->
  ?initials:string_ ->
  ?given_name:string_ ->
  ?generation_qualifier:string_ ->
  ?distinguished_name_qualifier:string_ ->
  ?custom_attributes:custom_attribute_list ->
  ?country:string_ ->
  ?domain_components:domain_component_list ->
  ?common_name:string_ ->
  unit ->
  distinguished_name

val make_other_name : ?value:string_ -> ?object_identifier:string_ -> unit -> other_name

val make_x509_attributes :
  ?not_before:t_stamp ->
  ?not_after:t_stamp ->
  ?serial_number:serial_number ->
  ?key_usages:key_usage_names ->
  ?key_algorithm:key_algorithm ->
  ?extended_key_usages:extended_key_usage_names ->
  ?subject_alternative_names:general_name_list ->
  ?subject:distinguished_name ->
  ?issuer:distinguished_name ->
  unit ->
  x509_attributes

val make_common_name_filter :
  comparison_operator:comparison_operator -> value:filter_string -> unit -> common_name_filter

val make_dns_name_filter :
  comparison_operator:comparison_operator -> value:filter_string -> unit -> dns_name_filter

val make_timestamp_range : ?end_:t_stamp -> ?start:t_stamp -> unit -> timestamp_range

val make_certificate_options :
  ?export_:certificate_export ->
  ?certificate_transparency_logging_preference:certificate_transparency_logging_preference ->
  unit ->
  certificate_options

val make_update_certificate_options_request :
  options:certificate_options -> certificate_arn:arn -> unit -> update_certificate_options_request

val make_public_certificate_authority :
  ?allowed_key_algorithms:public_key_algorithm_list -> unit -> public_certificate_authority

val make_update_acme_endpoint_request :
  ?certificate_authority:certificate_authority ->
  ?contact:acme_contact ->
  ?authorization_behavior:acme_authorization_behavior ->
  acme_endpoint_arn:acme_endpoint_arn ->
  unit ->
  update_acme_endpoint_request

val make_throttling_reason :
  ?resource:coral_availability_throttled_resource ->
  ?reason:coral_availability_throttling_reason ->
  unit ->
  throttling_reason

val make_domain_scope :
  ?wildcards:domain_scope_option ->
  ?subdomains:domain_scope_option ->
  ?exact_domain:domain_scope_option ->
  unit ->
  domain_scope

val make_dns_prevalidation_options :
  ?hosted_zone_id:hosted_zone_id -> ?domain_scope:domain_scope -> unit -> dns_prevalidation_options

val make_update_acme_domain_validation_request :
  ?prevalidation_options:prevalidation_options ->
  acme_domain_validation_arn:acme_domain_validation_arn ->
  unit ->
  update_acme_domain_validation_request

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:arn -> unit -> untag_resource_request

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_request : tags:tag_list -> resource_arn:arn -> unit -> tag_resource_request

val make_acm_certificate_metadata :
  ?acme_account_id:acme_account_id ->
  ?acme_endpoint_arn:arn ->
  ?certificate_key_pair_origin:certificate_key_pair_origin ->
  ?validation_method:validation_method ->
  ?managed_by:certificate_managed_by ->
  ?export_option:certificate_export ->
  ?type_:certificate_type ->
  ?renewal_status:renewal_status ->
  ?status:certificate_status ->
  ?revoked_at:t_stamp ->
  ?renewal_eligibility:renewal_eligibility ->
  ?issued_at:t_stamp ->
  ?in_use:nullable_boolean ->
  ?imported_at:t_stamp ->
  ?exported:nullable_boolean ->
  ?created_at:t_stamp ->
  unit ->
  acm_certificate_metadata

val make_search_certificates_response :
  ?next_token:next_token ->
  ?results:certificate_search_result_list ->
  unit ->
  search_certificates_response

val make_search_certificates_request :
  ?sort_order:search_certificates_sort_order ->
  ?sort_by:search_certificates_sort_by ->
  ?next_token:next_token ->
  ?max_results:search_max_results ->
  ?filter_statement:certificate_filter_statement ->
  unit ->
  search_certificates_request

val make_revoke_certificate_response : ?certificate_arn:arn -> unit -> revoke_certificate_response

val make_revoke_certificate_request :
  revocation_reason:revocation_reason -> certificate_arn:arn -> unit -> revoke_certificate_request

val make_revoke_acme_external_account_binding_request :
  acme_external_account_binding_arn:acme_external_account_binding_arn ->
  unit ->
  revoke_acme_external_account_binding_request

val make_revoke_acme_account_request :
  account_url:Smaws_Lib.Smithy_api.Types.string_ ->
  acme_endpoint_arn:acme_endpoint_arn ->
  unit ->
  revoke_acme_account_request

val make_resource_record :
  value:string_ -> type_:record_type -> name:string_ -> unit -> resource_record

val make_resend_validation_email_request :
  validation_domain:domain_name_string ->
  domain:domain_name_string ->
  certificate_arn:arn ->
  unit ->
  resend_validation_email_request

val make_request_certificate_response : ?certificate_arn:arn -> unit -> request_certificate_response

val make_domain_validation_option :
  validation_domain:domain_name_string ->
  domain_name:domain_name_string ->
  unit ->
  domain_validation_option

val make_request_certificate_request :
  ?managed_by:certificate_managed_by ->
  ?key_algorithm:key_algorithm ->
  ?tags:tag_list ->
  ?certificate_authority_arn:pca_arn ->
  ?options:certificate_options ->
  ?domain_validation_options:domain_validation_option_list ->
  ?idempotency_token:idempotency_token ->
  ?subject_alternative_names:domain_list ->
  ?validation_method:validation_method ->
  domain_name:domain_name_string ->
  unit ->
  request_certificate_request

val make_http_redirect : ?redirect_to:string_ -> ?redirect_from:string_ -> unit -> http_redirect

val make_domain_validation :
  ?validation_method:validation_method ->
  ?http_redirect:http_redirect ->
  ?resource_record:resource_record ->
  ?validation_status:domain_status ->
  ?validation_domain:domain_name_string ->
  ?validation_emails:validation_email_list ->
  domain_name:domain_name_string ->
  unit ->
  domain_validation

val make_renewal_summary :
  ?renewal_status_reason:failure_reason ->
  updated_at:t_stamp ->
  domain_validation_options:domain_validation_list ->
  renewal_status:renewal_status ->
  unit ->
  renewal_summary

val make_renew_certificate_request : certificate_arn:arn -> unit -> renew_certificate_request

val make_remove_tags_from_certificate_request :
  tags:tag_list -> certificate_arn:arn -> unit -> remove_tags_from_certificate_request

val make_expiry_events_configuration :
  ?days_before_expiry:positive_integer -> unit -> expiry_events_configuration

val make_put_account_configuration_request :
  ?expiry_events:expiry_events_configuration ->
  idempotency_token:idempotency_token ->
  unit ->
  put_account_configuration_request

val make_dns_prevalidation_details :
  ?resource_record:resource_record ->
  ?hosted_zone_id:hosted_zone_id ->
  ?domain_scope:domain_scope ->
  unit ->
  dns_prevalidation_details

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_list_tags_for_certificate_response :
  ?tags:tag_list -> unit -> list_tags_for_certificate_response

val make_list_tags_for_certificate_request :
  certificate_arn:arn -> unit -> list_tags_for_certificate_request

val make_certificate_summary :
  ?certificate_key_pair_origin:certificate_key_pair_origin ->
  ?managed_by:certificate_managed_by ->
  ?revoked_at:t_stamp ->
  ?imported_at:t_stamp ->
  ?issued_at:t_stamp ->
  ?created_at:t_stamp ->
  ?not_after:t_stamp ->
  ?not_before:t_stamp ->
  ?renewal_eligibility:renewal_eligibility ->
  ?exported:nullable_boolean ->
  ?in_use:nullable_boolean ->
  ?export_option:certificate_export ->
  ?extended_key_usages:extended_key_usage_names ->
  ?key_usages:key_usage_names ->
  ?key_algorithm:key_algorithm ->
  ?type_:certificate_type ->
  ?status:certificate_status ->
  ?has_additional_subject_alternative_names:nullable_boolean ->
  ?subject_alternative_name_summaries:domain_list ->
  ?domain_name:domain_name_string ->
  ?certificate_arn:arn ->
  unit ->
  certificate_summary

val make_list_certificates_response :
  ?certificate_summary_list:certificate_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_certificates_response

val make_filters :
  ?managed_by:certificate_managed_by ->
  ?export_option:certificate_export ->
  ?key_types:key_algorithm_list ->
  ?key_usage:key_usage_filter_list ->
  ?extended_key_usage:extended_key_usage_filter_list ->
  unit ->
  filters

val make_list_certificates_request :
  ?sort_order:sort_order ->
  ?sort_by:sort_by ->
  ?max_items:max_items ->
  ?next_token:next_token ->
  ?includes:filters ->
  ?certificate_key_pair_origins:certificate_key_pair_origins ->
  ?certificate_statuses:certificate_statuses ->
  unit ->
  list_certificates_request

val make_acme_external_account_binding_summary :
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_used_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?revoked_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?role_arn:role_arn ->
  ?acme_endpoint_arn:acme_endpoint_arn ->
  ?acme_external_account_binding_arn:acme_external_account_binding_arn ->
  unit ->
  acme_external_account_binding_summary

val make_list_acme_external_account_bindings_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?external_account_bindings:acme_external_account_binding_list ->
  unit ->
  list_acme_external_account_bindings_response

val make_list_acme_external_account_bindings_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  acme_endpoint_arn:acme_endpoint_arn ->
  unit ->
  list_acme_external_account_bindings_request

val make_acme_endpoint_summary :
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?certificate_tags:tag_list ->
  ?certificate_authority:certificate_authority ->
  ?contact:acme_contact ->
  ?authorization_behavior:acme_authorization_behavior ->
  ?failure_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:acme_endpoint_status ->
  ?endpoint_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?acme_endpoint_arn:acme_endpoint_arn ->
  unit ->
  acme_endpoint_summary

val make_list_acme_endpoints_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?acme_endpoints:acme_endpoint_list ->
  unit ->
  list_acme_endpoints_response

val make_list_acme_endpoints_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_acme_endpoints_request

val make_failure_details :
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reason:acme_domain_validation_failure_reason ->
  unit ->
  failure_details

val make_acme_domain_validation_summary :
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?failure_details:failure_details ->
  ?status:acme_domain_validation_status ->
  ?prevalidation_details:prevalidation_details ->
  ?prevalidation_type:prevalidation_type ->
  ?domain_name:domain_name ->
  ?acme_endpoint_arn:acme_endpoint_arn ->
  ?acme_domain_validation_arn:acme_domain_validation_arn ->
  unit ->
  acme_domain_validation_summary

val make_list_acme_domain_validations_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?acme_domain_validations:acme_domain_validation_list ->
  unit ->
  list_acme_domain_validations_response

val make_list_acme_domain_validations_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  acme_endpoint_arn:acme_endpoint_arn ->
  unit ->
  list_acme_domain_validations_request

val make_acme_account_summary :
  ?contacts:contact_list ->
  ?acme_external_account_binding_arn:acme_external_account_binding_arn ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:acme_account_status ->
  ?public_key_thumbprint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_url:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  acme_account_summary

val make_list_acme_accounts_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?acme_accounts:acme_account_list ->
  unit ->
  list_acme_accounts_response

val make_list_acme_accounts_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  acme_endpoint_arn:acme_endpoint_arn ->
  unit ->
  list_acme_accounts_request

val make_key_usage : ?name:key_usage_name -> unit -> key_usage
val make_import_certificate_response : ?certificate_arn:arn -> unit -> import_certificate_response

val make_import_certificate_request :
  ?tags:tag_list ->
  ?certificate_chain:certificate_chain_blob ->
  ?certificate_arn:arn ->
  private_key:private_key_blob ->
  certificate:certificate_body_blob ->
  unit ->
  import_certificate_request

val make_get_certificate_response :
  ?certificate_chain:certificate_chain ->
  ?certificate:certificate_body ->
  unit ->
  get_certificate_response

val make_get_certificate_request : certificate_arn:arn -> unit -> get_certificate_request

val make_get_acme_external_account_binding_credentials_response :
  ?mac_key:mac_key ->
  ?key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  get_acme_external_account_binding_credentials_response

val make_get_acme_external_account_binding_credentials_request :
  acme_external_account_binding_arn:acme_external_account_binding_arn ->
  unit ->
  get_acme_external_account_binding_credentials_request

val make_get_account_configuration_response :
  ?expiry_events:expiry_events_configuration -> unit -> get_account_configuration_response

val make_extended_key_usage :
  ?oi_d:string_ -> ?name:extended_key_usage_name -> unit -> extended_key_usage

val make_export_certificate_response :
  ?private_key:private_key ->
  ?certificate_chain:certificate_chain ->
  ?certificate:certificate_body ->
  unit ->
  export_certificate_response

val make_export_certificate_request :
  passphrase:passphrase_blob -> certificate_arn:arn -> unit -> export_certificate_request

val make_expiration : type_:time_type -> value:Smaws_Lib.Smithy_api.Types.long -> unit -> expiration

val make_certificate_detail :
  ?acme_account_id:acme_account_id ->
  ?acme_endpoint_arn:arn ->
  ?certificate_key_pair_origin:certificate_key_pair_origin ->
  ?options:certificate_options ->
  ?renewal_eligibility:renewal_eligibility ->
  ?certificate_authority_arn:arn ->
  ?extended_key_usages:extended_key_usage_list ->
  ?key_usages:key_usage_list ->
  ?renewal_summary:renewal_summary ->
  ?type_:certificate_type ->
  ?failure_reason:failure_reason ->
  ?in_use_by:in_use_list ->
  ?signature_algorithm:string_ ->
  ?key_algorithm:key_algorithm ->
  ?not_after:t_stamp ->
  ?not_before:t_stamp ->
  ?revocation_reason:revocation_reason ->
  ?revoked_at:t_stamp ->
  ?status:certificate_status ->
  ?imported_at:t_stamp ->
  ?issued_at:t_stamp ->
  ?created_at:t_stamp ->
  ?issuer:string_ ->
  ?subject:string_ ->
  ?serial:string_ ->
  ?domain_validation_options:domain_validation_list ->
  ?managed_by:certificate_managed_by ->
  ?subject_alternative_names:domain_list ->
  ?domain_name:domain_name_string ->
  ?certificate_arn:arn ->
  unit ->
  certificate_detail

val make_describe_certificate_response :
  ?certificate:certificate_detail -> unit -> describe_certificate_response

val make_describe_certificate_request : certificate_arn:arn -> unit -> describe_certificate_request

val make_acme_external_account_binding :
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_used_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?revoked_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?role_arn:role_arn ->
  ?acme_endpoint_arn:acme_endpoint_arn ->
  ?acme_external_account_binding_arn:acme_external_account_binding_arn ->
  unit ->
  acme_external_account_binding

val make_describe_acme_external_account_binding_response :
  ?external_account_binding:acme_external_account_binding ->
  unit ->
  describe_acme_external_account_binding_response

val make_describe_acme_external_account_binding_request :
  acme_external_account_binding_arn:acme_external_account_binding_arn ->
  unit ->
  describe_acme_external_account_binding_request

val make_acme_endpoint :
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?certificate_tags:tag_list ->
  ?certificate_authority:certificate_authority ->
  ?contact:acme_contact ->
  ?authorization_behavior:acme_authorization_behavior ->
  ?failure_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:acme_endpoint_status ->
  ?endpoint_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?acme_endpoint_arn:acme_endpoint_arn ->
  unit ->
  acme_endpoint

val make_describe_acme_endpoint_response :
  ?acme_endpoint:acme_endpoint -> unit -> describe_acme_endpoint_response

val make_describe_acme_endpoint_request :
  acme_endpoint_arn:acme_endpoint_arn -> unit -> describe_acme_endpoint_request

val make_acme_domain_validation :
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?failure_details:failure_details ->
  ?status:acme_domain_validation_status ->
  ?prevalidation_details:prevalidation_details ->
  ?prevalidation_type:prevalidation_type ->
  ?domain_name:domain_name ->
  ?acme_endpoint_arn:acme_endpoint_arn ->
  ?acme_domain_validation_arn:acme_domain_validation_arn ->
  unit ->
  acme_domain_validation

val make_describe_acme_domain_validation_response :
  ?acme_domain_validation:acme_domain_validation -> unit -> describe_acme_domain_validation_response

val make_describe_acme_domain_validation_request :
  acme_domain_validation_arn:acme_domain_validation_arn ->
  unit ->
  describe_acme_domain_validation_request

val make_acme_account :
  ?contacts:contact_list ->
  ?acme_external_account_binding_arn:acme_external_account_binding_arn ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:acme_account_status ->
  ?public_key_thumbprint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_url:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  acme_account

val make_describe_acme_account_response :
  ?acme_account:acme_account -> unit -> describe_acme_account_response

val make_describe_acme_account_request :
  account_url:Smaws_Lib.Smithy_api.Types.string_ ->
  acme_endpoint_arn:acme_endpoint_arn ->
  unit ->
  describe_acme_account_request

val make_delete_certificate_request : certificate_arn:arn -> unit -> delete_certificate_request

val make_delete_acme_external_account_binding_request :
  acme_external_account_binding_arn:acme_external_account_binding_arn ->
  unit ->
  delete_acme_external_account_binding_request

val make_delete_acme_endpoint_request :
  acme_endpoint_arn:acme_endpoint_arn -> unit -> delete_acme_endpoint_request

val make_delete_acme_domain_validation_request :
  acme_domain_validation_arn:acme_domain_validation_arn ->
  unit ->
  delete_acme_domain_validation_request

val make_create_acme_external_account_binding_response :
  ?external_account_binding:acme_external_account_binding ->
  unit ->
  create_acme_external_account_binding_response

val make_create_acme_external_account_binding_request :
  ?tags:tag_list ->
  ?expiration:expiration ->
  ?idempotency_token:Smaws_Lib.Smithy_api.Types.string_ ->
  role_arn:role_arn ->
  acme_endpoint_arn:acme_endpoint_arn ->
  unit ->
  create_acme_external_account_binding_request

val make_create_acme_endpoint_response :
  ?acme_endpoint_arn:acme_endpoint_arn -> unit -> create_acme_endpoint_response

val make_create_acme_endpoint_request :
  ?certificate_tags:tag_list ->
  ?tags:tag_list ->
  ?contact:acme_contact ->
  ?idempotency_token:Smaws_Lib.Smithy_api.Types.string_ ->
  certificate_authority:certificate_authority ->
  authorization_behavior:acme_authorization_behavior ->
  unit ->
  create_acme_endpoint_request

val make_create_acme_domain_validation_response :
  acme_domain_validation_arn:acme_domain_validation_arn ->
  unit ->
  create_acme_domain_validation_response

val make_create_acme_domain_validation_request :
  ?tags:tag_list ->
  ?idempotency_token:Smaws_Lib.Smithy_api.Types.string_ ->
  prevalidation_options:prevalidation_options ->
  domain_name:domain_name ->
  acme_endpoint_arn:acme_endpoint_arn ->
  unit ->
  create_acme_domain_validation_request

val make_add_tags_to_certificate_request :
  tags:tag_list -> certificate_arn:arn -> unit -> add_tags_to_certificate_request
