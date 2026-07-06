open Types

let make_custom_attribute ?value:(value_ : string_ option)
    ?object_identifier:(object_identifier_ : string_ option) () =
  ({ value = value_; object_identifier = object_identifier_ } : custom_attribute)

let make_distinguished_name ?title:(title_ : string_ option) ?surname:(surname_ : string_ option)
    ?state:(state_ : string_ option) ?serial_number:(serial_number_ : string_ option)
    ?pseudonym:(pseudonym_ : string_ option)
    ?organizational_unit:(organizational_unit_ : string_ option)
    ?organization:(organization_ : string_ option) ?locality:(locality_ : string_ option)
    ?initials:(initials_ : string_ option) ?given_name:(given_name_ : string_ option)
    ?generation_qualifier:(generation_qualifier_ : string_ option)
    ?distinguished_name_qualifier:(distinguished_name_qualifier_ : string_ option)
    ?custom_attributes:(custom_attributes_ : custom_attribute_list option)
    ?country:(country_ : string_ option)
    ?domain_components:(domain_components_ : domain_component_list option)
    ?common_name:(common_name_ : string_ option) () =
  ({
     title = title_;
     surname = surname_;
     state = state_;
     serial_number = serial_number_;
     pseudonym = pseudonym_;
     organizational_unit = organizational_unit_;
     organization = organization_;
     locality = locality_;
     initials = initials_;
     given_name = given_name_;
     generation_qualifier = generation_qualifier_;
     distinguished_name_qualifier = distinguished_name_qualifier_;
     custom_attributes = custom_attributes_;
     country = country_;
     domain_components = domain_components_;
     common_name = common_name_;
   }
    : distinguished_name)

let make_other_name ?value:(value_ : string_ option)
    ?object_identifier:(object_identifier_ : string_ option) () =
  ({ value = value_; object_identifier = object_identifier_ } : other_name)

let make_x509_attributes ?not_before:(not_before_ : t_stamp option)
    ?not_after:(not_after_ : t_stamp option) ?serial_number:(serial_number_ : serial_number option)
    ?key_usages:(key_usages_ : key_usage_names option)
    ?key_algorithm:(key_algorithm_ : key_algorithm option)
    ?extended_key_usages:(extended_key_usages_ : extended_key_usage_names option)
    ?subject_alternative_names:(subject_alternative_names_ : general_name_list option)
    ?subject:(subject_ : distinguished_name option) ?issuer:(issuer_ : distinguished_name option) ()
    =
  ({
     not_before = not_before_;
     not_after = not_after_;
     serial_number = serial_number_;
     key_usages = key_usages_;
     key_algorithm = key_algorithm_;
     extended_key_usages = extended_key_usages_;
     subject_alternative_names = subject_alternative_names_;
     subject = subject_;
     issuer = issuer_;
   }
    : x509_attributes)

let make_common_name_filter ~comparison_operator:(comparison_operator_ : comparison_operator)
    ~value:(value_ : filter_string) () =
  ({ comparison_operator = comparison_operator_; value = value_ } : common_name_filter)

let make_dns_name_filter ~comparison_operator:(comparison_operator_ : comparison_operator)
    ~value:(value_ : filter_string) () =
  ({ comparison_operator = comparison_operator_; value = value_ } : dns_name_filter)

let make_timestamp_range ?end_:(end__ : t_stamp option) ?start:(start_ : t_stamp option) () =
  ({ end_ = end__; start = start_ } : timestamp_range)

let make_certificate_options ?export_:(export__ : certificate_export option)
    ?certificate_transparency_logging_preference:
      (certificate_transparency_logging_preference_ :
         certificate_transparency_logging_preference option) () =
  ({
     export_ = export__;
     certificate_transparency_logging_preference = certificate_transparency_logging_preference_;
   }
    : certificate_options)

let make_update_certificate_options_request ~options:(options_ : certificate_options)
    ~certificate_arn:(certificate_arn_ : arn) () =
  ({ options = options_; certificate_arn = certificate_arn_ } : update_certificate_options_request)

let make_public_certificate_authority
    ?allowed_key_algorithms:(allowed_key_algorithms_ : public_key_algorithm_list option) () =
  ({ allowed_key_algorithms = allowed_key_algorithms_ } : public_certificate_authority)

let make_update_acme_endpoint_request
    ?certificate_authority:(certificate_authority_ : certificate_authority option)
    ?contact:(contact_ : acme_contact option)
    ?authorization_behavior:(authorization_behavior_ : acme_authorization_behavior option)
    ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn) () =
  ({
     certificate_authority = certificate_authority_;
     contact = contact_;
     authorization_behavior = authorization_behavior_;
     acme_endpoint_arn = acme_endpoint_arn_;
   }
    : update_acme_endpoint_request)

let make_throttling_reason ?resource:(resource_ : coral_availability_throttled_resource option)
    ?reason:(reason_ : coral_availability_throttling_reason option) () =
  ({ resource = resource_; reason = reason_ } : throttling_reason)

let make_domain_scope ?wildcards:(wildcards_ : domain_scope_option option)
    ?subdomains:(subdomains_ : domain_scope_option option)
    ?exact_domain:(exact_domain_ : domain_scope_option option) () =
  ({ wildcards = wildcards_; subdomains = subdomains_; exact_domain = exact_domain_ }
    : domain_scope)

let make_dns_prevalidation_options ?hosted_zone_id:(hosted_zone_id_ : hosted_zone_id option)
    ?domain_scope:(domain_scope_ : domain_scope option) () =
  ({ hosted_zone_id = hosted_zone_id_; domain_scope = domain_scope_ } : dns_prevalidation_options)

let make_update_acme_domain_validation_request
    ?prevalidation_options:(prevalidation_options_ : prevalidation_options option)
    ~acme_domain_validation_arn:(acme_domain_validation_arn_ : acme_domain_validation_arn) () =
  ({
     prevalidation_options = prevalidation_options_;
     acme_domain_validation_arn = acme_domain_validation_arn_;
   }
    : update_acme_domain_validation_request)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list) ~resource_arn:(resource_arn_ : arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_acm_certificate_metadata ?acme_account_id:(acme_account_id_ : acme_account_id option)
    ?acme_endpoint_arn:(acme_endpoint_arn_ : arn option)
    ?certificate_key_pair_origin:(certificate_key_pair_origin_ : certificate_key_pair_origin option)
    ?validation_method:(validation_method_ : validation_method option)
    ?managed_by:(managed_by_ : certificate_managed_by option)
    ?export_option:(export_option_ : certificate_export option)
    ?type_:(type__ : certificate_type option)
    ?renewal_status:(renewal_status_ : renewal_status option)
    ?status:(status_ : certificate_status option) ?revoked_at:(revoked_at_ : t_stamp option)
    ?renewal_eligibility:(renewal_eligibility_ : renewal_eligibility option)
    ?issued_at:(issued_at_ : t_stamp option) ?in_use:(in_use_ : nullable_boolean option)
    ?imported_at:(imported_at_ : t_stamp option) ?exported:(exported_ : nullable_boolean option)
    ?created_at:(created_at_ : t_stamp option) () =
  ({
     acme_account_id = acme_account_id_;
     acme_endpoint_arn = acme_endpoint_arn_;
     certificate_key_pair_origin = certificate_key_pair_origin_;
     validation_method = validation_method_;
     managed_by = managed_by_;
     export_option = export_option_;
     type_ = type__;
     renewal_status = renewal_status_;
     status = status_;
     revoked_at = revoked_at_;
     renewal_eligibility = renewal_eligibility_;
     issued_at = issued_at_;
     in_use = in_use_;
     imported_at = imported_at_;
     exported = exported_;
     created_at = created_at_;
   }
    : acm_certificate_metadata)

let make_search_certificates_response ?next_token:(next_token_ : next_token option)
    ?results:(results_ : certificate_search_result_list option) () =
  ({ next_token = next_token_; results = results_ } : search_certificates_response)

let make_search_certificates_request
    ?sort_order:(sort_order_ : search_certificates_sort_order option)
    ?sort_by:(sort_by_ : search_certificates_sort_by option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : search_max_results option)
    ?filter_statement:(filter_statement_ : certificate_filter_statement option) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     next_token = next_token_;
     max_results = max_results_;
     filter_statement = filter_statement_;
   }
    : search_certificates_request)

let make_revoke_certificate_response ?certificate_arn:(certificate_arn_ : arn option) () =
  ({ certificate_arn = certificate_arn_ } : revoke_certificate_response)

let make_revoke_certificate_request ~revocation_reason:(revocation_reason_ : revocation_reason)
    ~certificate_arn:(certificate_arn_ : arn) () =
  ({ revocation_reason = revocation_reason_; certificate_arn = certificate_arn_ }
    : revoke_certificate_request)

let make_revoke_acme_external_account_binding_request
    ~acme_external_account_binding_arn:
      (acme_external_account_binding_arn_ : acme_external_account_binding_arn) () =
  ({ acme_external_account_binding_arn = acme_external_account_binding_arn_ }
    : revoke_acme_external_account_binding_request)

let make_revoke_acme_account_request
    ~account_url:(account_url_ : Smaws_Lib.Smithy_api.Types.string_)
    ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn) () =
  ({ account_url = account_url_; acme_endpoint_arn = acme_endpoint_arn_ }
    : revoke_acme_account_request)

let make_resource_record ~value:(value_ : string_) ~type_:(type__ : record_type)
    ~name:(name_ : string_) () =
  ({ value = value_; type_ = type__; name = name_ } : resource_record)

let make_resend_validation_email_request
    ~validation_domain:(validation_domain_ : domain_name_string)
    ~domain:(domain_ : domain_name_string) ~certificate_arn:(certificate_arn_ : arn) () =
  ({ validation_domain = validation_domain_; domain = domain_; certificate_arn = certificate_arn_ }
    : resend_validation_email_request)

let make_request_certificate_response ?certificate_arn:(certificate_arn_ : arn option) () =
  ({ certificate_arn = certificate_arn_ } : request_certificate_response)

let make_domain_validation_option ~validation_domain:(validation_domain_ : domain_name_string)
    ~domain_name:(domain_name_ : domain_name_string) () =
  ({ validation_domain = validation_domain_; domain_name = domain_name_ }
    : domain_validation_option)

let make_request_certificate_request ?managed_by:(managed_by_ : certificate_managed_by option)
    ?key_algorithm:(key_algorithm_ : key_algorithm option) ?tags:(tags_ : tag_list option)
    ?certificate_authority_arn:(certificate_authority_arn_ : pca_arn option)
    ?options:(options_ : certificate_options option)
    ?domain_validation_options:(domain_validation_options_ : domain_validation_option_list option)
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ?subject_alternative_names:(subject_alternative_names_ : domain_list option)
    ?validation_method:(validation_method_ : validation_method option)
    ~domain_name:(domain_name_ : domain_name_string) () =
  ({
     managed_by = managed_by_;
     key_algorithm = key_algorithm_;
     tags = tags_;
     certificate_authority_arn = certificate_authority_arn_;
     options = options_;
     domain_validation_options = domain_validation_options_;
     idempotency_token = idempotency_token_;
     subject_alternative_names = subject_alternative_names_;
     validation_method = validation_method_;
     domain_name = domain_name_;
   }
    : request_certificate_request)

let make_http_redirect ?redirect_to:(redirect_to_ : string_ option)
    ?redirect_from:(redirect_from_ : string_ option) () =
  ({ redirect_to = redirect_to_; redirect_from = redirect_from_ } : http_redirect)

let make_domain_validation ?validation_method:(validation_method_ : validation_method option)
    ?http_redirect:(http_redirect_ : http_redirect option)
    ?resource_record:(resource_record_ : resource_record option)
    ?validation_status:(validation_status_ : domain_status option)
    ?validation_domain:(validation_domain_ : domain_name_string option)
    ?validation_emails:(validation_emails_ : validation_email_list option)
    ~domain_name:(domain_name_ : domain_name_string) () =
  ({
     validation_method = validation_method_;
     http_redirect = http_redirect_;
     resource_record = resource_record_;
     validation_status = validation_status_;
     validation_domain = validation_domain_;
     validation_emails = validation_emails_;
     domain_name = domain_name_;
   }
    : domain_validation)

let make_renewal_summary ?renewal_status_reason:(renewal_status_reason_ : failure_reason option)
    ~updated_at:(updated_at_ : t_stamp)
    ~domain_validation_options:(domain_validation_options_ : domain_validation_list)
    ~renewal_status:(renewal_status_ : renewal_status) () =
  ({
     updated_at = updated_at_;
     renewal_status_reason = renewal_status_reason_;
     domain_validation_options = domain_validation_options_;
     renewal_status = renewal_status_;
   }
    : renewal_summary)

let make_renew_certificate_request ~certificate_arn:(certificate_arn_ : arn) () =
  ({ certificate_arn = certificate_arn_ } : renew_certificate_request)

let make_remove_tags_from_certificate_request ~tags:(tags_ : tag_list)
    ~certificate_arn:(certificate_arn_ : arn) () =
  ({ tags = tags_; certificate_arn = certificate_arn_ } : remove_tags_from_certificate_request)

let make_expiry_events_configuration
    ?days_before_expiry:(days_before_expiry_ : positive_integer option) () =
  ({ days_before_expiry = days_before_expiry_ } : expiry_events_configuration)

let make_put_account_configuration_request
    ?expiry_events:(expiry_events_ : expiry_events_configuration option)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({ idempotency_token = idempotency_token_; expiry_events = expiry_events_ }
    : put_account_configuration_request)

let make_dns_prevalidation_details ?resource_record:(resource_record_ : resource_record option)
    ?hosted_zone_id:(hosted_zone_id_ : hosted_zone_id option)
    ?domain_scope:(domain_scope_ : domain_scope option) () =
  ({
     resource_record = resource_record_;
     hosted_zone_id = hosted_zone_id_;
     domain_scope = domain_scope_;
   }
    : dns_prevalidation_details)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_tags_for_certificate_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_certificate_response)

let make_list_tags_for_certificate_request ~certificate_arn:(certificate_arn_ : arn) () =
  ({ certificate_arn = certificate_arn_ } : list_tags_for_certificate_request)

let make_certificate_summary
    ?certificate_key_pair_origin:(certificate_key_pair_origin_ : certificate_key_pair_origin option)
    ?managed_by:(managed_by_ : certificate_managed_by option)
    ?revoked_at:(revoked_at_ : t_stamp option) ?imported_at:(imported_at_ : t_stamp option)
    ?issued_at:(issued_at_ : t_stamp option) ?created_at:(created_at_ : t_stamp option)
    ?not_after:(not_after_ : t_stamp option) ?not_before:(not_before_ : t_stamp option)
    ?renewal_eligibility:(renewal_eligibility_ : renewal_eligibility option)
    ?exported:(exported_ : nullable_boolean option) ?in_use:(in_use_ : nullable_boolean option)
    ?export_option:(export_option_ : certificate_export option)
    ?extended_key_usages:(extended_key_usages_ : extended_key_usage_names option)
    ?key_usages:(key_usages_ : key_usage_names option)
    ?key_algorithm:(key_algorithm_ : key_algorithm option) ?type_:(type__ : certificate_type option)
    ?status:(status_ : certificate_status option)
    ?has_additional_subject_alternative_names:
      (has_additional_subject_alternative_names_ : nullable_boolean option)
    ?subject_alternative_name_summaries:(subject_alternative_name_summaries_ : domain_list option)
    ?domain_name:(domain_name_ : domain_name_string option)
    ?certificate_arn:(certificate_arn_ : arn option) () =
  ({
     certificate_key_pair_origin = certificate_key_pair_origin_;
     managed_by = managed_by_;
     revoked_at = revoked_at_;
     imported_at = imported_at_;
     issued_at = issued_at_;
     created_at = created_at_;
     not_after = not_after_;
     not_before = not_before_;
     renewal_eligibility = renewal_eligibility_;
     exported = exported_;
     in_use = in_use_;
     export_option = export_option_;
     extended_key_usages = extended_key_usages_;
     key_usages = key_usages_;
     key_algorithm = key_algorithm_;
     type_ = type__;
     status = status_;
     has_additional_subject_alternative_names = has_additional_subject_alternative_names_;
     subject_alternative_name_summaries = subject_alternative_name_summaries_;
     domain_name = domain_name_;
     certificate_arn = certificate_arn_;
   }
    : certificate_summary)

let make_list_certificates_response
    ?certificate_summary_list:(certificate_summary_list_ : certificate_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ certificate_summary_list = certificate_summary_list_; next_token = next_token_ }
    : list_certificates_response)

let make_filters ?managed_by:(managed_by_ : certificate_managed_by option)
    ?export_option:(export_option_ : certificate_export option)
    ?key_types:(key_types_ : key_algorithm_list option)
    ?key_usage:(key_usage_ : key_usage_filter_list option)
    ?extended_key_usage:(extended_key_usage_ : extended_key_usage_filter_list option) () =
  ({
     managed_by = managed_by_;
     export_option = export_option_;
     key_types = key_types_;
     key_usage = key_usage_;
     extended_key_usage = extended_key_usage_;
   }
    : filters)

let make_list_certificates_request ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_by option) ?max_items:(max_items_ : max_items option)
    ?next_token:(next_token_ : next_token option) ?includes:(includes_ : filters option)
    ?certificate_key_pair_origins:
      (certificate_key_pair_origins_ : certificate_key_pair_origins option)
    ?certificate_statuses:(certificate_statuses_ : certificate_statuses option) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     max_items = max_items_;
     next_token = next_token_;
     includes = includes_;
     certificate_key_pair_origins = certificate_key_pair_origins_;
     certificate_statuses = certificate_statuses_;
   }
    : list_certificates_request)

let make_acme_external_account_binding_summary
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_used_at:(last_used_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?revoked_at:(revoked_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?role_arn:(role_arn_ : role_arn option)
    ?acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn option)
    ?acme_external_account_binding_arn:
      (acme_external_account_binding_arn_ : acme_external_account_binding_arn option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     last_used_at = last_used_at_;
     revoked_at = revoked_at_;
     expires_at = expires_at_;
     role_arn = role_arn_;
     acme_endpoint_arn = acme_endpoint_arn_;
     acme_external_account_binding_arn = acme_external_account_binding_arn_;
   }
    : acme_external_account_binding_summary)

let make_list_acme_external_account_bindings_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?external_account_bindings:
      (external_account_bindings_ : acme_external_account_binding_list option) () =
  ({ next_token = next_token_; external_account_bindings = external_account_bindings_ }
    : list_acme_external_account_bindings_response)

let make_list_acme_external_account_bindings_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn) () =
  ({ acme_endpoint_arn = acme_endpoint_arn_; max_results = max_results_; next_token = next_token_ }
    : list_acme_external_account_bindings_request)

let make_acme_endpoint_summary
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?certificate_tags:(certificate_tags_ : tag_list option)
    ?certificate_authority:(certificate_authority_ : certificate_authority option)
    ?contact:(contact_ : acme_contact option)
    ?authorization_behavior:(authorization_behavior_ : acme_authorization_behavior option)
    ?failure_reason:(failure_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : acme_endpoint_status option)
    ?endpoint_url:(endpoint_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     certificate_tags = certificate_tags_;
     certificate_authority = certificate_authority_;
     contact = contact_;
     authorization_behavior = authorization_behavior_;
     failure_reason = failure_reason_;
     status = status_;
     endpoint_url = endpoint_url_;
     acme_endpoint_arn = acme_endpoint_arn_;
   }
    : acme_endpoint_summary)

let make_list_acme_endpoints_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?acme_endpoints:(acme_endpoints_ : acme_endpoint_list option) () =
  ({ next_token = next_token_; acme_endpoints = acme_endpoints_ } : list_acme_endpoints_response)

let make_list_acme_endpoints_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_acme_endpoints_request)

let make_failure_details ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reason:(reason_ : acme_domain_validation_failure_reason option) () =
  ({ message = message_; reason = reason_ } : failure_details)

let make_acme_domain_validation_summary
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?failure_details:(failure_details_ : failure_details option)
    ?status:(status_ : acme_domain_validation_status option)
    ?prevalidation_details:(prevalidation_details_ : prevalidation_details option)
    ?prevalidation_type:(prevalidation_type_ : prevalidation_type option)
    ?domain_name:(domain_name_ : domain_name option)
    ?acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn option)
    ?acme_domain_validation_arn:(acme_domain_validation_arn_ : acme_domain_validation_arn option) ()
    =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     failure_details = failure_details_;
     status = status_;
     prevalidation_details = prevalidation_details_;
     prevalidation_type = prevalidation_type_;
     domain_name = domain_name_;
     acme_endpoint_arn = acme_endpoint_arn_;
     acme_domain_validation_arn = acme_domain_validation_arn_;
   }
    : acme_domain_validation_summary)

let make_list_acme_domain_validations_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?acme_domain_validations:(acme_domain_validations_ : acme_domain_validation_list option) () =
  ({ next_token = next_token_; acme_domain_validations = acme_domain_validations_ }
    : list_acme_domain_validations_response)

let make_list_acme_domain_validations_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn) () =
  ({ acme_endpoint_arn = acme_endpoint_arn_; max_results = max_results_; next_token = next_token_ }
    : list_acme_domain_validations_request)

let make_acme_account_summary ?contacts:(contacts_ : contact_list option)
    ?acme_external_account_binding_arn:
      (acme_external_account_binding_arn_ : acme_external_account_binding_arn option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : acme_account_status option)
    ?public_key_thumbprint:(public_key_thumbprint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_url:(account_url_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     contacts = contacts_;
     acme_external_account_binding_arn = acme_external_account_binding_arn_;
     created_at = created_at_;
     status = status_;
     public_key_thumbprint = public_key_thumbprint_;
     account_url = account_url_;
   }
    : acme_account_summary)

let make_list_acme_accounts_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?acme_accounts:(acme_accounts_ : acme_account_list option) () =
  ({ next_token = next_token_; acme_accounts = acme_accounts_ } : list_acme_accounts_response)

let make_list_acme_accounts_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn) () =
  ({ acme_endpoint_arn = acme_endpoint_arn_; max_results = max_results_; next_token = next_token_ }
    : list_acme_accounts_request)

let make_key_usage ?name:(name_ : key_usage_name option) () = ({ name = name_ } : key_usage)

let make_import_certificate_response ?certificate_arn:(certificate_arn_ : arn option) () =
  ({ certificate_arn = certificate_arn_ } : import_certificate_response)

let make_import_certificate_request ?tags:(tags_ : tag_list option)
    ?certificate_chain:(certificate_chain_ : certificate_chain_blob option)
    ?certificate_arn:(certificate_arn_ : arn option) ~private_key:(private_key_ : private_key_blob)
    ~certificate:(certificate_ : certificate_body_blob) () =
  ({
     tags = tags_;
     certificate_chain = certificate_chain_;
     private_key = private_key_;
     certificate = certificate_;
     certificate_arn = certificate_arn_;
   }
    : import_certificate_request)

let make_get_certificate_response ?certificate_chain:(certificate_chain_ : certificate_chain option)
    ?certificate:(certificate_ : certificate_body option) () =
  ({ certificate_chain = certificate_chain_; certificate = certificate_ }
    : get_certificate_response)

let make_get_certificate_request ~certificate_arn:(certificate_arn_ : arn) () =
  ({ certificate_arn = certificate_arn_ } : get_certificate_request)

let make_get_acme_external_account_binding_credentials_response ?mac_key:(mac_key_ : mac_key option)
    ?key_id:(key_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ mac_key = mac_key_; key_id = key_id_ }
    : get_acme_external_account_binding_credentials_response)

let make_get_acme_external_account_binding_credentials_request
    ~acme_external_account_binding_arn:
      (acme_external_account_binding_arn_ : acme_external_account_binding_arn) () =
  ({ acme_external_account_binding_arn = acme_external_account_binding_arn_ }
    : get_acme_external_account_binding_credentials_request)

let make_get_account_configuration_response
    ?expiry_events:(expiry_events_ : expiry_events_configuration option) () =
  ({ expiry_events = expiry_events_ } : get_account_configuration_response)

let make_extended_key_usage ?oi_d:(oi_d_ : string_ option)
    ?name:(name_ : extended_key_usage_name option) () =
  ({ oi_d = oi_d_; name = name_ } : extended_key_usage)

let make_export_certificate_response ?private_key:(private_key_ : private_key option)
    ?certificate_chain:(certificate_chain_ : certificate_chain option)
    ?certificate:(certificate_ : certificate_body option) () =
  ({
     private_key = private_key_;
     certificate_chain = certificate_chain_;
     certificate = certificate_;
   }
    : export_certificate_response)

let make_export_certificate_request ~passphrase:(passphrase_ : passphrase_blob)
    ~certificate_arn:(certificate_arn_ : arn) () =
  ({ passphrase = passphrase_; certificate_arn = certificate_arn_ } : export_certificate_request)

let make_expiration ~type_:(type__ : time_type) ~value:(value_ : Smaws_Lib.Smithy_api.Types.long) ()
    =
  ({ type_ = type__; value = value_ } : expiration)

let make_certificate_detail ?acme_account_id:(acme_account_id_ : acme_account_id option)
    ?acme_endpoint_arn:(acme_endpoint_arn_ : arn option)
    ?certificate_key_pair_origin:(certificate_key_pair_origin_ : certificate_key_pair_origin option)
    ?options:(options_ : certificate_options option)
    ?renewal_eligibility:(renewal_eligibility_ : renewal_eligibility option)
    ?certificate_authority_arn:(certificate_authority_arn_ : arn option)
    ?extended_key_usages:(extended_key_usages_ : extended_key_usage_list option)
    ?key_usages:(key_usages_ : key_usage_list option)
    ?renewal_summary:(renewal_summary_ : renewal_summary option)
    ?type_:(type__ : certificate_type option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?in_use_by:(in_use_by_ : in_use_list option)
    ?signature_algorithm:(signature_algorithm_ : string_ option)
    ?key_algorithm:(key_algorithm_ : key_algorithm option) ?not_after:(not_after_ : t_stamp option)
    ?not_before:(not_before_ : t_stamp option)
    ?revocation_reason:(revocation_reason_ : revocation_reason option)
    ?revoked_at:(revoked_at_ : t_stamp option) ?status:(status_ : certificate_status option)
    ?imported_at:(imported_at_ : t_stamp option) ?issued_at:(issued_at_ : t_stamp option)
    ?created_at:(created_at_ : t_stamp option) ?issuer:(issuer_ : string_ option)
    ?subject:(subject_ : string_ option) ?serial:(serial_ : string_ option)
    ?domain_validation_options:(domain_validation_options_ : domain_validation_list option)
    ?managed_by:(managed_by_ : certificate_managed_by option)
    ?subject_alternative_names:(subject_alternative_names_ : domain_list option)
    ?domain_name:(domain_name_ : domain_name_string option)
    ?certificate_arn:(certificate_arn_ : arn option) () =
  ({
     acme_account_id = acme_account_id_;
     acme_endpoint_arn = acme_endpoint_arn_;
     certificate_key_pair_origin = certificate_key_pair_origin_;
     options = options_;
     renewal_eligibility = renewal_eligibility_;
     certificate_authority_arn = certificate_authority_arn_;
     extended_key_usages = extended_key_usages_;
     key_usages = key_usages_;
     renewal_summary = renewal_summary_;
     type_ = type__;
     failure_reason = failure_reason_;
     in_use_by = in_use_by_;
     signature_algorithm = signature_algorithm_;
     key_algorithm = key_algorithm_;
     not_after = not_after_;
     not_before = not_before_;
     revocation_reason = revocation_reason_;
     revoked_at = revoked_at_;
     status = status_;
     imported_at = imported_at_;
     issued_at = issued_at_;
     created_at = created_at_;
     issuer = issuer_;
     subject = subject_;
     serial = serial_;
     domain_validation_options = domain_validation_options_;
     managed_by = managed_by_;
     subject_alternative_names = subject_alternative_names_;
     domain_name = domain_name_;
     certificate_arn = certificate_arn_;
   }
    : certificate_detail)

let make_describe_certificate_response ?certificate:(certificate_ : certificate_detail option) () =
  ({ certificate = certificate_ } : describe_certificate_response)

let make_describe_certificate_request ~certificate_arn:(certificate_arn_ : arn) () =
  ({ certificate_arn = certificate_arn_ } : describe_certificate_request)

let make_acme_external_account_binding
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_used_at:(last_used_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?revoked_at:(revoked_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?role_arn:(role_arn_ : role_arn option)
    ?acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn option)
    ?acme_external_account_binding_arn:
      (acme_external_account_binding_arn_ : acme_external_account_binding_arn option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     last_used_at = last_used_at_;
     revoked_at = revoked_at_;
     expires_at = expires_at_;
     role_arn = role_arn_;
     acme_endpoint_arn = acme_endpoint_arn_;
     acme_external_account_binding_arn = acme_external_account_binding_arn_;
   }
    : acme_external_account_binding)

let make_describe_acme_external_account_binding_response
    ?external_account_binding:(external_account_binding_ : acme_external_account_binding option) ()
    =
  ({ external_account_binding = external_account_binding_ }
    : describe_acme_external_account_binding_response)

let make_describe_acme_external_account_binding_request
    ~acme_external_account_binding_arn:
      (acme_external_account_binding_arn_ : acme_external_account_binding_arn) () =
  ({ acme_external_account_binding_arn = acme_external_account_binding_arn_ }
    : describe_acme_external_account_binding_request)

let make_acme_endpoint ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?certificate_tags:(certificate_tags_ : tag_list option)
    ?certificate_authority:(certificate_authority_ : certificate_authority option)
    ?contact:(contact_ : acme_contact option)
    ?authorization_behavior:(authorization_behavior_ : acme_authorization_behavior option)
    ?failure_reason:(failure_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : acme_endpoint_status option)
    ?endpoint_url:(endpoint_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     certificate_tags = certificate_tags_;
     certificate_authority = certificate_authority_;
     contact = contact_;
     authorization_behavior = authorization_behavior_;
     failure_reason = failure_reason_;
     status = status_;
     endpoint_url = endpoint_url_;
     acme_endpoint_arn = acme_endpoint_arn_;
   }
    : acme_endpoint)

let make_describe_acme_endpoint_response ?acme_endpoint:(acme_endpoint_ : acme_endpoint option) () =
  ({ acme_endpoint = acme_endpoint_ } : describe_acme_endpoint_response)

let make_describe_acme_endpoint_request ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn)
    () =
  ({ acme_endpoint_arn = acme_endpoint_arn_ } : describe_acme_endpoint_request)

let make_acme_domain_validation
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?failure_details:(failure_details_ : failure_details option)
    ?status:(status_ : acme_domain_validation_status option)
    ?prevalidation_details:(prevalidation_details_ : prevalidation_details option)
    ?prevalidation_type:(prevalidation_type_ : prevalidation_type option)
    ?domain_name:(domain_name_ : domain_name option)
    ?acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn option)
    ?acme_domain_validation_arn:(acme_domain_validation_arn_ : acme_domain_validation_arn option) ()
    =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     failure_details = failure_details_;
     status = status_;
     prevalidation_details = prevalidation_details_;
     prevalidation_type = prevalidation_type_;
     domain_name = domain_name_;
     acme_endpoint_arn = acme_endpoint_arn_;
     acme_domain_validation_arn = acme_domain_validation_arn_;
   }
    : acme_domain_validation)

let make_describe_acme_domain_validation_response
    ?acme_domain_validation:(acme_domain_validation_ : acme_domain_validation option) () =
  ({ acme_domain_validation = acme_domain_validation_ } : describe_acme_domain_validation_response)

let make_describe_acme_domain_validation_request
    ~acme_domain_validation_arn:(acme_domain_validation_arn_ : acme_domain_validation_arn) () =
  ({ acme_domain_validation_arn = acme_domain_validation_arn_ }
    : describe_acme_domain_validation_request)

let make_acme_account ?contacts:(contacts_ : contact_list option)
    ?acme_external_account_binding_arn:
      (acme_external_account_binding_arn_ : acme_external_account_binding_arn option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : acme_account_status option)
    ?public_key_thumbprint:(public_key_thumbprint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_url:(account_url_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     contacts = contacts_;
     acme_external_account_binding_arn = acme_external_account_binding_arn_;
     created_at = created_at_;
     status = status_;
     public_key_thumbprint = public_key_thumbprint_;
     account_url = account_url_;
   }
    : acme_account)

let make_describe_acme_account_response ?acme_account:(acme_account_ : acme_account option) () =
  ({ acme_account = acme_account_ } : describe_acme_account_response)

let make_describe_acme_account_request
    ~account_url:(account_url_ : Smaws_Lib.Smithy_api.Types.string_)
    ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn) () =
  ({ account_url = account_url_; acme_endpoint_arn = acme_endpoint_arn_ }
    : describe_acme_account_request)

let make_delete_certificate_request ~certificate_arn:(certificate_arn_ : arn) () =
  ({ certificate_arn = certificate_arn_ } : delete_certificate_request)

let make_delete_acme_external_account_binding_request
    ~acme_external_account_binding_arn:
      (acme_external_account_binding_arn_ : acme_external_account_binding_arn) () =
  ({ acme_external_account_binding_arn = acme_external_account_binding_arn_ }
    : delete_acme_external_account_binding_request)

let make_delete_acme_endpoint_request ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn) ()
    =
  ({ acme_endpoint_arn = acme_endpoint_arn_ } : delete_acme_endpoint_request)

let make_delete_acme_domain_validation_request
    ~acme_domain_validation_arn:(acme_domain_validation_arn_ : acme_domain_validation_arn) () =
  ({ acme_domain_validation_arn = acme_domain_validation_arn_ }
    : delete_acme_domain_validation_request)

let make_create_acme_external_account_binding_response
    ?external_account_binding:(external_account_binding_ : acme_external_account_binding option) ()
    =
  ({ external_account_binding = external_account_binding_ }
    : create_acme_external_account_binding_response)

let make_create_acme_external_account_binding_request ?tags:(tags_ : tag_list option)
    ?expiration:(expiration_ : expiration option)
    ?idempotency_token:(idempotency_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~role_arn:(role_arn_ : role_arn) ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn) ()
    =
  ({
     tags = tags_;
     expiration = expiration_;
     role_arn = role_arn_;
     acme_endpoint_arn = acme_endpoint_arn_;
     idempotency_token = idempotency_token_;
   }
    : create_acme_external_account_binding_request)

let make_create_acme_endpoint_response
    ?acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn option) () =
  ({ acme_endpoint_arn = acme_endpoint_arn_ } : create_acme_endpoint_response)

let make_create_acme_endpoint_request ?certificate_tags:(certificate_tags_ : tag_list option)
    ?tags:(tags_ : tag_list option) ?contact:(contact_ : acme_contact option)
    ?idempotency_token:(idempotency_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~certificate_authority:(certificate_authority_ : certificate_authority)
    ~authorization_behavior:(authorization_behavior_ : acme_authorization_behavior) () =
  ({
     certificate_tags = certificate_tags_;
     tags = tags_;
     certificate_authority = certificate_authority_;
     contact = contact_;
     authorization_behavior = authorization_behavior_;
     idempotency_token = idempotency_token_;
   }
    : create_acme_endpoint_request)

let make_create_acme_domain_validation_response
    ~acme_domain_validation_arn:(acme_domain_validation_arn_ : acme_domain_validation_arn) () =
  ({ acme_domain_validation_arn = acme_domain_validation_arn_ }
    : create_acme_domain_validation_response)

let make_create_acme_domain_validation_request ?tags:(tags_ : tag_list option)
    ?idempotency_token:(idempotency_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~prevalidation_options:(prevalidation_options_ : prevalidation_options)
    ~domain_name:(domain_name_ : domain_name)
    ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn) () =
  ({
     tags = tags_;
     prevalidation_options = prevalidation_options_;
     domain_name = domain_name_;
     acme_endpoint_arn = acme_endpoint_arn_;
     idempotency_token = idempotency_token_;
   }
    : create_acme_domain_validation_request)

let make_add_tags_to_certificate_request ~tags:(tags_ : tag_list)
    ~certificate_arn:(certificate_arn_ : arn) () =
  ({ tags = tags_; certificate_arn = certificate_arn_ } : add_tags_to_certificate_request)
