open Types

val make_acm_certificate_metadata :
  ?created_at:t_stamp ->
  ?exported:nullable_boolean ->
  ?imported_at:t_stamp ->
  ?in_use:nullable_boolean ->
  ?issued_at:t_stamp ->
  ?renewal_eligibility:renewal_eligibility ->
  ?revoked_at:t_stamp ->
  ?status:certificate_status ->
  ?renewal_status:renewal_status ->
  ?type_:certificate_type ->
  ?export_option:certificate_export ->
  ?managed_by:certificate_managed_by ->
  ?validation_method:validation_method ->
  ?certificate_key_pair_origin:certificate_key_pair_origin ->
  ?acme_endpoint_arn:arn ->
  ?acme_account_id:acme_account_id ->
  unit ->
  acm_certificate_metadata

val make_acme_account :
  ?account_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?public_key_thumbprint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:acme_account_status ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?acme_external_account_binding_arn:acme_external_account_binding_arn ->
  ?contacts:contact_list ->
  unit ->
  acme_account

val make_acme_account_summary :
  ?account_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?public_key_thumbprint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:acme_account_status ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?acme_external_account_binding_arn:acme_external_account_binding_arn ->
  ?contacts:contact_list ->
  unit ->
  acme_account_summary

val make_failure_details :
  ?reason:acme_domain_validation_failure_reason ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  failure_details

val make_resource_record :
  name:string_ -> type_:record_type -> value:string_ -> unit -> resource_record

val make_domain_scope :
  ?exact_domain:domain_scope_option ->
  ?subdomains:domain_scope_option ->
  ?wildcards:domain_scope_option ->
  unit ->
  domain_scope

val make_dns_prevalidation_details :
  ?domain_scope:domain_scope ->
  ?hosted_zone_id:hosted_zone_id ->
  ?resource_record:resource_record ->
  unit ->
  dns_prevalidation_details

val make_acme_domain_validation :
  ?acme_domain_validation_arn:acme_domain_validation_arn ->
  ?acme_endpoint_arn:acme_endpoint_arn ->
  ?domain_name:domain_name ->
  ?prevalidation_type:prevalidation_type ->
  ?prevalidation_details:prevalidation_details ->
  ?status:acme_domain_validation_status ->
  ?failure_details:failure_details ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  acme_domain_validation

val make_acme_domain_validation_summary :
  ?acme_domain_validation_arn:acme_domain_validation_arn ->
  ?acme_endpoint_arn:acme_endpoint_arn ->
  ?domain_name:domain_name ->
  ?prevalidation_type:prevalidation_type ->
  ?prevalidation_details:prevalidation_details ->
  ?status:acme_domain_validation_status ->
  ?failure_details:failure_details ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  acme_domain_validation_summary

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_public_certificate_authority :
  ?allowed_key_algorithms:public_key_algorithm_list -> unit -> public_certificate_authority

val make_acme_endpoint :
  ?acme_endpoint_arn:acme_endpoint_arn ->
  ?endpoint_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:acme_endpoint_status ->
  ?failure_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?authorization_behavior:acme_authorization_behavior ->
  ?contact:acme_contact ->
  ?certificate_authority:certificate_authority ->
  ?certificate_tags:tag_list ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  acme_endpoint

val make_acme_endpoint_summary :
  ?acme_endpoint_arn:acme_endpoint_arn ->
  ?endpoint_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:acme_endpoint_status ->
  ?failure_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?authorization_behavior:acme_authorization_behavior ->
  ?contact:acme_contact ->
  ?certificate_authority:certificate_authority ->
  ?certificate_tags:tag_list ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  acme_endpoint_summary

val make_acme_external_account_binding :
  ?acme_external_account_binding_arn:acme_external_account_binding_arn ->
  ?acme_endpoint_arn:acme_endpoint_arn ->
  ?role_arn:role_arn ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?revoked_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_used_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  acme_external_account_binding

val make_acme_external_account_binding_summary :
  ?acme_external_account_binding_arn:acme_external_account_binding_arn ->
  ?acme_endpoint_arn:acme_endpoint_arn ->
  ?role_arn:role_arn ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?revoked_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_used_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  acme_external_account_binding_summary

val make_throttling_reason :
  ?reason:coral_availability_throttling_reason ->
  ?resource:coral_availability_throttled_resource ->
  unit ->
  throttling_reason

val make_add_tags_to_certificate_request :
  certificate_arn:arn -> tags:tag_list -> unit -> add_tags_to_certificate_request

val make_certificate_options :
  ?certificate_transparency_logging_preference:certificate_transparency_logging_preference ->
  ?export_:certificate_export ->
  unit ->
  certificate_options

val make_extended_key_usage :
  ?name:extended_key_usage_name -> ?oi_d:string_ -> unit -> extended_key_usage

val make_key_usage : ?name:key_usage_name -> unit -> key_usage
val make_http_redirect : ?redirect_from:string_ -> ?redirect_to:string_ -> unit -> http_redirect

val make_domain_validation :
  ?validation_emails:validation_email_list ->
  ?validation_domain:domain_name_string ->
  ?validation_status:domain_status ->
  ?resource_record:resource_record ->
  ?http_redirect:http_redirect ->
  ?validation_method:validation_method ->
  domain_name:domain_name_string ->
  unit ->
  domain_validation

val make_renewal_summary :
  ?renewal_status_reason:failure_reason ->
  renewal_status:renewal_status ->
  domain_validation_options:domain_validation_list ->
  updated_at:t_stamp ->
  unit ->
  renewal_summary

val make_certificate_detail :
  ?certificate_arn:arn ->
  ?domain_name:domain_name_string ->
  ?subject_alternative_names:domain_list ->
  ?managed_by:certificate_managed_by ->
  ?domain_validation_options:domain_validation_list ->
  ?serial:string_ ->
  ?subject:string_ ->
  ?issuer:string_ ->
  ?created_at:t_stamp ->
  ?issued_at:t_stamp ->
  ?imported_at:t_stamp ->
  ?status:certificate_status ->
  ?revoked_at:t_stamp ->
  ?revocation_reason:revocation_reason ->
  ?not_before:t_stamp ->
  ?not_after:t_stamp ->
  ?key_algorithm:key_algorithm ->
  ?signature_algorithm:string_ ->
  ?in_use_by:in_use_list ->
  ?failure_reason:failure_reason ->
  ?type_:certificate_type ->
  ?renewal_summary:renewal_summary ->
  ?key_usages:key_usage_list ->
  ?extended_key_usages:extended_key_usage_list ->
  ?certificate_authority_arn:arn ->
  ?renewal_eligibility:renewal_eligibility ->
  ?options:certificate_options ->
  ?certificate_key_pair_origin:certificate_key_pair_origin ->
  ?acme_endpoint_arn:arn ->
  ?acme_account_id:acme_account_id ->
  unit ->
  certificate_detail

val make_timestamp_range : ?start:t_stamp -> ?end_:t_stamp -> unit -> timestamp_range

val make_dns_name_filter :
  value:filter_string -> comparison_operator:comparison_operator -> unit -> dns_name_filter

val make_common_name_filter :
  value:filter_string -> comparison_operator:comparison_operator -> unit -> common_name_filter

val make_update_certificate_options_request :
  certificate_arn:arn -> options:certificate_options -> unit -> update_certificate_options_request

val make_update_acme_endpoint_request :
  ?authorization_behavior:acme_authorization_behavior ->
  ?contact:acme_contact ->
  ?certificate_authority:certificate_authority ->
  acme_endpoint_arn:acme_endpoint_arn ->
  unit ->
  update_acme_endpoint_request

val make_dns_prevalidation_options :
  ?domain_scope:domain_scope -> ?hosted_zone_id:hosted_zone_id -> unit -> dns_prevalidation_options

val make_update_acme_domain_validation_request :
  ?prevalidation_options:prevalidation_options ->
  acme_domain_validation_arn:acme_domain_validation_arn ->
  unit ->
  update_acme_domain_validation_request

val make_untag_resource_request :
  resource_arn:arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_request : resource_arn:arn -> tags:tag_list -> unit -> tag_resource_request
val make_other_name : ?object_identifier:string_ -> ?value:string_ -> unit -> other_name
val make_custom_attribute : ?object_identifier:string_ -> ?value:string_ -> unit -> custom_attribute

val make_distinguished_name :
  ?common_name:string_ ->
  ?domain_components:domain_component_list ->
  ?country:string_ ->
  ?custom_attributes:custom_attribute_list ->
  ?distinguished_name_qualifier:string_ ->
  ?generation_qualifier:string_ ->
  ?given_name:string_ ->
  ?initials:string_ ->
  ?locality:string_ ->
  ?organization:string_ ->
  ?organizational_unit:string_ ->
  ?pseudonym:string_ ->
  ?serial_number:string_ ->
  ?state:string_ ->
  ?surname:string_ ->
  ?title:string_ ->
  unit ->
  distinguished_name

val make_x509_attributes :
  ?issuer:distinguished_name ->
  ?subject:distinguished_name ->
  ?subject_alternative_names:general_name_list ->
  ?extended_key_usages:extended_key_usage_names ->
  ?key_algorithm:key_algorithm ->
  ?key_usages:key_usage_names ->
  ?serial_number:serial_number ->
  ?not_after:t_stamp ->
  ?not_before:t_stamp ->
  unit ->
  x509_attributes

val make_search_certificates_response :
  ?results:certificate_search_result_list ->
  ?next_token:next_token ->
  unit ->
  search_certificates_response

val make_search_certificates_request :
  ?filter_statement:certificate_filter_statement ->
  ?max_results:search_max_results ->
  ?next_token:next_token ->
  ?sort_by:search_certificates_sort_by ->
  ?sort_order:search_certificates_sort_order ->
  unit ->
  search_certificates_request

val make_revoke_certificate_response : ?certificate_arn:arn -> unit -> revoke_certificate_response

val make_revoke_certificate_request :
  certificate_arn:arn -> revocation_reason:revocation_reason -> unit -> revoke_certificate_request

val make_revoke_acme_external_account_binding_request :
  acme_external_account_binding_arn:acme_external_account_binding_arn ->
  unit ->
  revoke_acme_external_account_binding_request

val make_revoke_acme_account_request :
  acme_endpoint_arn:acme_endpoint_arn ->
  account_url:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  revoke_acme_account_request

val make_resend_validation_email_request :
  certificate_arn:arn ->
  domain:domain_name_string ->
  validation_domain:domain_name_string ->
  unit ->
  resend_validation_email_request

val make_request_certificate_response : ?certificate_arn:arn -> unit -> request_certificate_response

val make_domain_validation_option :
  domain_name:domain_name_string ->
  validation_domain:domain_name_string ->
  unit ->
  domain_validation_option

val make_request_certificate_request :
  ?validation_method:validation_method ->
  ?subject_alternative_names:domain_list ->
  ?idempotency_token:idempotency_token ->
  ?domain_validation_options:domain_validation_option_list ->
  ?options:certificate_options ->
  ?certificate_authority_arn:pca_arn ->
  ?tags:tag_list ->
  ?key_algorithm:key_algorithm ->
  ?managed_by:certificate_managed_by ->
  domain_name:domain_name_string ->
  unit ->
  request_certificate_request

val make_renew_certificate_request : certificate_arn:arn -> unit -> renew_certificate_request

val make_remove_tags_from_certificate_request :
  certificate_arn:arn -> tags:tag_list -> unit -> remove_tags_from_certificate_request

val make_expiry_events_configuration :
  ?days_before_expiry:positive_integer -> unit -> expiry_events_configuration

val make_put_account_configuration_request :
  ?expiry_events:expiry_events_configuration ->
  idempotency_token:idempotency_token ->
  unit ->
  put_account_configuration_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_list_tags_for_certificate_response :
  ?tags:tag_list -> unit -> list_tags_for_certificate_response

val make_list_tags_for_certificate_request :
  certificate_arn:arn -> unit -> list_tags_for_certificate_request

val make_certificate_summary :
  ?certificate_arn:arn ->
  ?domain_name:domain_name_string ->
  ?subject_alternative_name_summaries:domain_list ->
  ?has_additional_subject_alternative_names:nullable_boolean ->
  ?status:certificate_status ->
  ?type_:certificate_type ->
  ?key_algorithm:key_algorithm ->
  ?key_usages:key_usage_names ->
  ?extended_key_usages:extended_key_usage_names ->
  ?export_option:certificate_export ->
  ?in_use:nullable_boolean ->
  ?exported:nullable_boolean ->
  ?renewal_eligibility:renewal_eligibility ->
  ?not_before:t_stamp ->
  ?not_after:t_stamp ->
  ?created_at:t_stamp ->
  ?issued_at:t_stamp ->
  ?imported_at:t_stamp ->
  ?revoked_at:t_stamp ->
  ?managed_by:certificate_managed_by ->
  ?certificate_key_pair_origin:certificate_key_pair_origin ->
  unit ->
  certificate_summary

val make_list_certificates_response :
  ?next_token:next_token ->
  ?certificate_summary_list:certificate_summary_list ->
  unit ->
  list_certificates_response

val make_filters :
  ?extended_key_usage:extended_key_usage_filter_list ->
  ?key_usage:key_usage_filter_list ->
  ?key_types:key_algorithm_list ->
  ?export_option:certificate_export ->
  ?managed_by:certificate_managed_by ->
  unit ->
  filters

val make_list_certificates_request :
  ?certificate_statuses:certificate_statuses ->
  ?certificate_key_pair_origins:certificate_key_pair_origins ->
  ?includes:filters ->
  ?next_token:next_token ->
  ?max_items:max_items ->
  ?sort_by:sort_by ->
  ?sort_order:sort_order ->
  unit ->
  list_certificates_request

val make_list_acme_external_account_bindings_response :
  ?external_account_bindings:acme_external_account_binding_list ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_acme_external_account_bindings_response

val make_list_acme_external_account_bindings_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  acme_endpoint_arn:acme_endpoint_arn ->
  unit ->
  list_acme_external_account_bindings_request

val make_list_acme_endpoints_response :
  ?acme_endpoints:acme_endpoint_list ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_acme_endpoints_response

val make_list_acme_endpoints_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_acme_endpoints_request

val make_list_acme_domain_validations_response :
  ?acme_domain_validations:acme_domain_validation_list ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_acme_domain_validations_response

val make_list_acme_domain_validations_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  acme_endpoint_arn:acme_endpoint_arn ->
  unit ->
  list_acme_domain_validations_request

val make_list_acme_accounts_response :
  ?acme_accounts:acme_account_list ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_acme_accounts_response

val make_list_acme_accounts_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  acme_endpoint_arn:acme_endpoint_arn ->
  unit ->
  list_acme_accounts_request

val make_import_certificate_response : ?certificate_arn:arn -> unit -> import_certificate_response

val make_import_certificate_request :
  ?certificate_arn:arn ->
  ?certificate_chain:certificate_chain_blob ->
  ?tags:tag_list ->
  certificate:certificate_body_blob ->
  private_key:private_key_blob ->
  unit ->
  import_certificate_request

val make_get_certificate_response :
  ?certificate:certificate_body ->
  ?certificate_chain:certificate_chain ->
  unit ->
  get_certificate_response

val make_get_certificate_request : certificate_arn:arn -> unit -> get_certificate_request

val make_get_acme_external_account_binding_credentials_response :
  ?key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?mac_key:mac_key ->
  unit ->
  get_acme_external_account_binding_credentials_response

val make_get_acme_external_account_binding_credentials_request :
  acme_external_account_binding_arn:acme_external_account_binding_arn ->
  unit ->
  get_acme_external_account_binding_credentials_request

val make_get_account_configuration_response :
  ?expiry_events:expiry_events_configuration -> unit -> get_account_configuration_response

val make_export_certificate_response :
  ?certificate:certificate_body ->
  ?certificate_chain:certificate_chain ->
  ?private_key:private_key ->
  unit ->
  export_certificate_response

val make_export_certificate_request :
  certificate_arn:arn -> passphrase:passphrase_blob -> unit -> export_certificate_request

val make_describe_certificate_response :
  ?certificate:certificate_detail -> unit -> describe_certificate_response

val make_describe_certificate_request : certificate_arn:arn -> unit -> describe_certificate_request

val make_describe_acme_external_account_binding_response :
  ?external_account_binding:acme_external_account_binding ->
  unit ->
  describe_acme_external_account_binding_response

val make_describe_acme_external_account_binding_request :
  acme_external_account_binding_arn:acme_external_account_binding_arn ->
  unit ->
  describe_acme_external_account_binding_request

val make_describe_acme_endpoint_response :
  ?acme_endpoint:acme_endpoint -> unit -> describe_acme_endpoint_response

val make_describe_acme_endpoint_request :
  acme_endpoint_arn:acme_endpoint_arn -> unit -> describe_acme_endpoint_request

val make_describe_acme_domain_validation_response :
  ?acme_domain_validation:acme_domain_validation -> unit -> describe_acme_domain_validation_response

val make_describe_acme_domain_validation_request :
  acme_domain_validation_arn:acme_domain_validation_arn ->
  unit ->
  describe_acme_domain_validation_request

val make_describe_acme_account_response :
  ?acme_account:acme_account -> unit -> describe_acme_account_response

val make_describe_acme_account_request :
  acme_endpoint_arn:acme_endpoint_arn ->
  account_url:Smaws_Lib.Smithy_api.Types.string_ ->
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

val make_expiration : value:Smaws_Lib.Smithy_api.Types.long -> type_:time_type -> unit -> expiration

val make_create_acme_external_account_binding_request :
  ?idempotency_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?expiration:expiration ->
  ?tags:tag_list ->
  acme_endpoint_arn:acme_endpoint_arn ->
  role_arn:role_arn ->
  unit ->
  create_acme_external_account_binding_request

val make_create_acme_endpoint_response :
  ?acme_endpoint_arn:acme_endpoint_arn -> unit -> create_acme_endpoint_response

val make_create_acme_endpoint_request :
  ?idempotency_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?contact:acme_contact ->
  ?tags:tag_list ->
  ?certificate_tags:tag_list ->
  authorization_behavior:acme_authorization_behavior ->
  certificate_authority:certificate_authority ->
  unit ->
  create_acme_endpoint_request

val make_create_acme_domain_validation_response :
  acme_domain_validation_arn:acme_domain_validation_arn ->
  unit ->
  create_acme_domain_validation_response

val make_create_acme_domain_validation_request :
  ?idempotency_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tags:tag_list ->
  acme_endpoint_arn:acme_endpoint_arn ->
  domain_name:domain_name ->
  prevalidation_options:prevalidation_options ->
  unit ->
  create_acme_domain_validation_request
