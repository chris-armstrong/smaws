open Types

val make_certificate_options :
  ?export_:certificate_export ->
  ?certificate_transparency_logging_preference:certificate_transparency_logging_preference ->
  unit ->
  certificate_options

val make_update_certificate_options_request :
  options:certificate_options -> certificate_arn:arn -> unit -> update_certificate_options_request

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag
val make_revoke_certificate_response : ?certificate_arn:arn -> unit -> revoke_certificate_response

val make_revoke_certificate_request :
  revocation_reason:revocation_reason -> certificate_arn:arn -> unit -> revoke_certificate_request

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

val make_list_tags_for_certificate_response :
  ?tags:tag_list -> unit -> list_tags_for_certificate_response

val make_list_tags_for_certificate_request :
  certificate_arn:arn -> unit -> list_tags_for_certificate_request

val make_certificate_summary :
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
  ?certificate_statuses:certificate_statuses ->
  unit ->
  list_certificates_request

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

val make_certificate_detail :
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
val make_delete_certificate_request : certificate_arn:arn -> unit -> delete_certificate_request

val make_add_tags_to_certificate_request :
  tags:tag_list -> certificate_arn:arn -> unit -> add_tags_to_certificate_request
