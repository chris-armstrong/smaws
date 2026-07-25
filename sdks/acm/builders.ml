open Types

let make_acm_certificate_metadata ?created_at:(created_at_ : t_stamp option)
    ?exported:(exported_ : nullable_boolean option) ?imported_at:(imported_at_ : t_stamp option)
    ?in_use:(in_use_ : nullable_boolean option) ?issued_at:(issued_at_ : t_stamp option)
    ?renewal_eligibility:(renewal_eligibility_ : renewal_eligibility option)
    ?revoked_at:(revoked_at_ : t_stamp option) ?status:(status_ : certificate_status option)
    ?renewal_status:(renewal_status_ : renewal_status option)
    ?type_:(type__ : certificate_type option)
    ?export_option:(export_option_ : certificate_export option)
    ?managed_by:(managed_by_ : certificate_managed_by option)
    ?validation_method:(validation_method_ : validation_method option)
    ?certificate_key_pair_origin:(certificate_key_pair_origin_ : certificate_key_pair_origin option)
    ?acme_endpoint_arn:(acme_endpoint_arn_ : arn option)
    ?acme_account_id:(acme_account_id_ : acme_account_id option) () =
  ({
     created_at = created_at_;
     exported = exported_;
     imported_at = imported_at_;
     in_use = in_use_;
     issued_at = issued_at_;
     renewal_eligibility = renewal_eligibility_;
     revoked_at = revoked_at_;
     status = status_;
     renewal_status = renewal_status_;
     type_ = type__;
     export_option = export_option_;
     managed_by = managed_by_;
     validation_method = validation_method_;
     certificate_key_pair_origin = certificate_key_pair_origin_;
     acme_endpoint_arn = acme_endpoint_arn_;
     acme_account_id = acme_account_id_;
   }
    : acm_certificate_metadata)

let make_acme_account ?account_url:(account_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?public_key_thumbprint:(public_key_thumbprint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : acme_account_status option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?acme_external_account_binding_arn:
      (acme_external_account_binding_arn_ : acme_external_account_binding_arn option)
    ?contacts:(contacts_ : contact_list option) () =
  ({
     account_url = account_url_;
     public_key_thumbprint = public_key_thumbprint_;
     status = status_;
     created_at = created_at_;
     acme_external_account_binding_arn = acme_external_account_binding_arn_;
     contacts = contacts_;
   }
    : acme_account)

let make_acme_account_summary
    ?account_url:(account_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?public_key_thumbprint:(public_key_thumbprint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : acme_account_status option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?acme_external_account_binding_arn:
      (acme_external_account_binding_arn_ : acme_external_account_binding_arn option)
    ?contacts:(contacts_ : contact_list option) () =
  ({
     account_url = account_url_;
     public_key_thumbprint = public_key_thumbprint_;
     status = status_;
     created_at = created_at_;
     acme_external_account_binding_arn = acme_external_account_binding_arn_;
     contacts = contacts_;
   }
    : acme_account_summary)

let make_failure_details ?reason:(reason_ : acme_domain_validation_failure_reason option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ reason = reason_; message = message_ } : failure_details)

let make_resource_record ~name:(name_ : string_) ~type_:(type__ : record_type)
    ~value:(value_ : string_) () =
  ({ name = name_; type_ = type__; value = value_ } : resource_record)

let make_domain_scope ?exact_domain:(exact_domain_ : domain_scope_option option)
    ?subdomains:(subdomains_ : domain_scope_option option)
    ?wildcards:(wildcards_ : domain_scope_option option) () =
  ({ exact_domain = exact_domain_; subdomains = subdomains_; wildcards = wildcards_ }
    : domain_scope)

let make_dns_prevalidation_details ?domain_scope:(domain_scope_ : domain_scope option)
    ?hosted_zone_id:(hosted_zone_id_ : hosted_zone_id option)
    ?resource_record:(resource_record_ : resource_record option) () =
  ({
     domain_scope = domain_scope_;
     hosted_zone_id = hosted_zone_id_;
     resource_record = resource_record_;
   }
    : dns_prevalidation_details)

let make_acme_domain_validation
    ?acme_domain_validation_arn:(acme_domain_validation_arn_ : acme_domain_validation_arn option)
    ?acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn option)
    ?domain_name:(domain_name_ : domain_name option)
    ?prevalidation_type:(prevalidation_type_ : prevalidation_type option)
    ?prevalidation_details:(prevalidation_details_ : prevalidation_details option)
    ?status:(status_ : acme_domain_validation_status option)
    ?failure_details:(failure_details_ : failure_details option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     acme_domain_validation_arn = acme_domain_validation_arn_;
     acme_endpoint_arn = acme_endpoint_arn_;
     domain_name = domain_name_;
     prevalidation_type = prevalidation_type_;
     prevalidation_details = prevalidation_details_;
     status = status_;
     failure_details = failure_details_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : acme_domain_validation)

let make_acme_domain_validation_summary
    ?acme_domain_validation_arn:(acme_domain_validation_arn_ : acme_domain_validation_arn option)
    ?acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn option)
    ?domain_name:(domain_name_ : domain_name option)
    ?prevalidation_type:(prevalidation_type_ : prevalidation_type option)
    ?prevalidation_details:(prevalidation_details_ : prevalidation_details option)
    ?status:(status_ : acme_domain_validation_status option)
    ?failure_details:(failure_details_ : failure_details option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     acme_domain_validation_arn = acme_domain_validation_arn_;
     acme_endpoint_arn = acme_endpoint_arn_;
     domain_name = domain_name_;
     prevalidation_type = prevalidation_type_;
     prevalidation_details = prevalidation_details_;
     status = status_;
     failure_details = failure_details_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : acme_domain_validation_summary)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ key = key_; value = value_ } : tag)

let make_public_certificate_authority
    ?allowed_key_algorithms:(allowed_key_algorithms_ : public_key_algorithm_list option) () =
  ({ allowed_key_algorithms = allowed_key_algorithms_ } : public_certificate_authority)

let make_acme_endpoint ?acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn option)
    ?endpoint_url:(endpoint_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : acme_endpoint_status option)
    ?failure_reason:(failure_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?authorization_behavior:(authorization_behavior_ : acme_authorization_behavior option)
    ?contact:(contact_ : acme_contact option)
    ?certificate_authority:(certificate_authority_ : certificate_authority option)
    ?certificate_tags:(certificate_tags_ : tag_list option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     acme_endpoint_arn = acme_endpoint_arn_;
     endpoint_url = endpoint_url_;
     status = status_;
     failure_reason = failure_reason_;
     authorization_behavior = authorization_behavior_;
     contact = contact_;
     certificate_authority = certificate_authority_;
     certificate_tags = certificate_tags_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : acme_endpoint)

let make_acme_endpoint_summary ?acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn option)
    ?endpoint_url:(endpoint_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : acme_endpoint_status option)
    ?failure_reason:(failure_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?authorization_behavior:(authorization_behavior_ : acme_authorization_behavior option)
    ?contact:(contact_ : acme_contact option)
    ?certificate_authority:(certificate_authority_ : certificate_authority option)
    ?certificate_tags:(certificate_tags_ : tag_list option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     acme_endpoint_arn = acme_endpoint_arn_;
     endpoint_url = endpoint_url_;
     status = status_;
     failure_reason = failure_reason_;
     authorization_behavior = authorization_behavior_;
     contact = contact_;
     certificate_authority = certificate_authority_;
     certificate_tags = certificate_tags_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : acme_endpoint_summary)

let make_acme_external_account_binding
    ?acme_external_account_binding_arn:
      (acme_external_account_binding_arn_ : acme_external_account_binding_arn option)
    ?acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn option)
    ?role_arn:(role_arn_ : role_arn option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?revoked_at:(revoked_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_used_at:(last_used_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     acme_external_account_binding_arn = acme_external_account_binding_arn_;
     acme_endpoint_arn = acme_endpoint_arn_;
     role_arn = role_arn_;
     expires_at = expires_at_;
     revoked_at = revoked_at_;
     last_used_at = last_used_at_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : acme_external_account_binding)

let make_acme_external_account_binding_summary
    ?acme_external_account_binding_arn:
      (acme_external_account_binding_arn_ : acme_external_account_binding_arn option)
    ?acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn option)
    ?role_arn:(role_arn_ : role_arn option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?revoked_at:(revoked_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_used_at:(last_used_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     acme_external_account_binding_arn = acme_external_account_binding_arn_;
     acme_endpoint_arn = acme_endpoint_arn_;
     role_arn = role_arn_;
     expires_at = expires_at_;
     revoked_at = revoked_at_;
     last_used_at = last_used_at_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : acme_external_account_binding_summary)

let make_throttling_reason ?reason:(reason_ : coral_availability_throttling_reason option)
    ?resource:(resource_ : coral_availability_throttled_resource option) () =
  ({ reason = reason_; resource = resource_ } : throttling_reason)

let make_add_tags_to_certificate_request ~certificate_arn:(certificate_arn_ : arn)
    ~tags:(tags_ : tag_list) () =
  ({ certificate_arn = certificate_arn_; tags = tags_ } : add_tags_to_certificate_request)

let make_certificate_options
    ?certificate_transparency_logging_preference:
      (certificate_transparency_logging_preference_ :
         certificate_transparency_logging_preference option)
    ?export_:(export__ : certificate_export option) () =
  ({
     certificate_transparency_logging_preference = certificate_transparency_logging_preference_;
     export_ = export__;
   }
    : certificate_options)

let make_extended_key_usage ?name:(name_ : extended_key_usage_name option)
    ?oi_d:(oi_d_ : string_ option) () =
  ({ name = name_; oi_d = oi_d_ } : extended_key_usage)

let make_key_usage ?name:(name_ : key_usage_name option) () = ({ name = name_ } : key_usage)

let make_http_redirect ?redirect_from:(redirect_from_ : string_ option)
    ?redirect_to:(redirect_to_ : string_ option) () =
  ({ redirect_from = redirect_from_; redirect_to = redirect_to_ } : http_redirect)

let make_domain_validation ?validation_emails:(validation_emails_ : validation_email_list option)
    ?validation_domain:(validation_domain_ : domain_name_string option)
    ?validation_status:(validation_status_ : domain_status option)
    ?resource_record:(resource_record_ : resource_record option)
    ?http_redirect:(http_redirect_ : http_redirect option)
    ?validation_method:(validation_method_ : validation_method option)
    ~domain_name:(domain_name_ : domain_name_string) () =
  ({
     domain_name = domain_name_;
     validation_emails = validation_emails_;
     validation_domain = validation_domain_;
     validation_status = validation_status_;
     resource_record = resource_record_;
     http_redirect = http_redirect_;
     validation_method = validation_method_;
   }
    : domain_validation)

let make_renewal_summary ?renewal_status_reason:(renewal_status_reason_ : failure_reason option)
    ~renewal_status:(renewal_status_ : renewal_status)
    ~domain_validation_options:(domain_validation_options_ : domain_validation_list)
    ~updated_at:(updated_at_ : t_stamp) () =
  ({
     renewal_status = renewal_status_;
     domain_validation_options = domain_validation_options_;
     renewal_status_reason = renewal_status_reason_;
     updated_at = updated_at_;
   }
    : renewal_summary)

let make_certificate_detail ?certificate_arn:(certificate_arn_ : arn option)
    ?domain_name:(domain_name_ : domain_name_string option)
    ?subject_alternative_names:(subject_alternative_names_ : domain_list option)
    ?managed_by:(managed_by_ : certificate_managed_by option)
    ?domain_validation_options:(domain_validation_options_ : domain_validation_list option)
    ?serial:(serial_ : string_ option) ?subject:(subject_ : string_ option)
    ?issuer:(issuer_ : string_ option) ?created_at:(created_at_ : t_stamp option)
    ?issued_at:(issued_at_ : t_stamp option) ?imported_at:(imported_at_ : t_stamp option)
    ?status:(status_ : certificate_status option) ?revoked_at:(revoked_at_ : t_stamp option)
    ?revocation_reason:(revocation_reason_ : revocation_reason option)
    ?not_before:(not_before_ : t_stamp option) ?not_after:(not_after_ : t_stamp option)
    ?key_algorithm:(key_algorithm_ : key_algorithm option)
    ?signature_algorithm:(signature_algorithm_ : string_ option)
    ?in_use_by:(in_use_by_ : in_use_list option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?type_:(type__ : certificate_type option)
    ?renewal_summary:(renewal_summary_ : renewal_summary option)
    ?key_usages:(key_usages_ : key_usage_list option)
    ?extended_key_usages:(extended_key_usages_ : extended_key_usage_list option)
    ?certificate_authority_arn:(certificate_authority_arn_ : arn option)
    ?renewal_eligibility:(renewal_eligibility_ : renewal_eligibility option)
    ?options:(options_ : certificate_options option)
    ?certificate_key_pair_origin:(certificate_key_pair_origin_ : certificate_key_pair_origin option)
    ?acme_endpoint_arn:(acme_endpoint_arn_ : arn option)
    ?acme_account_id:(acme_account_id_ : acme_account_id option) () =
  ({
     certificate_arn = certificate_arn_;
     domain_name = domain_name_;
     subject_alternative_names = subject_alternative_names_;
     managed_by = managed_by_;
     domain_validation_options = domain_validation_options_;
     serial = serial_;
     subject = subject_;
     issuer = issuer_;
     created_at = created_at_;
     issued_at = issued_at_;
     imported_at = imported_at_;
     status = status_;
     revoked_at = revoked_at_;
     revocation_reason = revocation_reason_;
     not_before = not_before_;
     not_after = not_after_;
     key_algorithm = key_algorithm_;
     signature_algorithm = signature_algorithm_;
     in_use_by = in_use_by_;
     failure_reason = failure_reason_;
     type_ = type__;
     renewal_summary = renewal_summary_;
     key_usages = key_usages_;
     extended_key_usages = extended_key_usages_;
     certificate_authority_arn = certificate_authority_arn_;
     renewal_eligibility = renewal_eligibility_;
     options = options_;
     certificate_key_pair_origin = certificate_key_pair_origin_;
     acme_endpoint_arn = acme_endpoint_arn_;
     acme_account_id = acme_account_id_;
   }
    : certificate_detail)

let make_timestamp_range ?start:(start_ : t_stamp option) ?end_:(end__ : t_stamp option) () =
  ({ start = start_; end_ = end__ } : timestamp_range)

let make_dns_name_filter ~value:(value_ : filter_string)
    ~comparison_operator:(comparison_operator_ : comparison_operator) () =
  ({ value = value_; comparison_operator = comparison_operator_ } : dns_name_filter)

let make_common_name_filter ~value:(value_ : filter_string)
    ~comparison_operator:(comparison_operator_ : comparison_operator) () =
  ({ value = value_; comparison_operator = comparison_operator_ } : common_name_filter)

let make_update_certificate_options_request ~certificate_arn:(certificate_arn_ : arn)
    ~options:(options_ : certificate_options) () =
  ({ certificate_arn = certificate_arn_; options = options_ } : update_certificate_options_request)

let make_update_acme_endpoint_request
    ?authorization_behavior:(authorization_behavior_ : acme_authorization_behavior option)
    ?contact:(contact_ : acme_contact option)
    ?certificate_authority:(certificate_authority_ : certificate_authority option)
    ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn) () =
  ({
     acme_endpoint_arn = acme_endpoint_arn_;
     authorization_behavior = authorization_behavior_;
     contact = contact_;
     certificate_authority = certificate_authority_;
   }
    : update_acme_endpoint_request)

let make_dns_prevalidation_options ?domain_scope:(domain_scope_ : domain_scope option)
    ?hosted_zone_id:(hosted_zone_id_ : hosted_zone_id option) () =
  ({ domain_scope = domain_scope_; hosted_zone_id = hosted_zone_id_ } : dns_prevalidation_options)

let make_update_acme_domain_validation_request
    ?prevalidation_options:(prevalidation_options_ : prevalidation_options option)
    ~acme_domain_validation_arn:(acme_domain_validation_arn_ : acme_domain_validation_arn) () =
  ({
     acme_domain_validation_arn = acme_domain_validation_arn_;
     prevalidation_options = prevalidation_options_;
   }
    : update_acme_domain_validation_request)

let make_untag_resource_request ~resource_arn:(resource_arn_ : arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_request ~resource_arn:(resource_arn_ : arn) ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_other_name ?object_identifier:(object_identifier_ : string_ option)
    ?value:(value_ : string_ option) () =
  ({ object_identifier = object_identifier_; value = value_ } : other_name)

let make_custom_attribute ?object_identifier:(object_identifier_ : string_ option)
    ?value:(value_ : string_ option) () =
  ({ object_identifier = object_identifier_; value = value_ } : custom_attribute)

let make_distinguished_name ?common_name:(common_name_ : string_ option)
    ?domain_components:(domain_components_ : domain_component_list option)
    ?country:(country_ : string_ option)
    ?custom_attributes:(custom_attributes_ : custom_attribute_list option)
    ?distinguished_name_qualifier:(distinguished_name_qualifier_ : string_ option)
    ?generation_qualifier:(generation_qualifier_ : string_ option)
    ?given_name:(given_name_ : string_ option) ?initials:(initials_ : string_ option)
    ?locality:(locality_ : string_ option) ?organization:(organization_ : string_ option)
    ?organizational_unit:(organizational_unit_ : string_ option)
    ?pseudonym:(pseudonym_ : string_ option) ?serial_number:(serial_number_ : string_ option)
    ?state:(state_ : string_ option) ?surname:(surname_ : string_ option)
    ?title:(title_ : string_ option) () =
  ({
     common_name = common_name_;
     domain_components = domain_components_;
     country = country_;
     custom_attributes = custom_attributes_;
     distinguished_name_qualifier = distinguished_name_qualifier_;
     generation_qualifier = generation_qualifier_;
     given_name = given_name_;
     initials = initials_;
     locality = locality_;
     organization = organization_;
     organizational_unit = organizational_unit_;
     pseudonym = pseudonym_;
     serial_number = serial_number_;
     state = state_;
     surname = surname_;
     title = title_;
   }
    : distinguished_name)

let make_x509_attributes ?issuer:(issuer_ : distinguished_name option)
    ?subject:(subject_ : distinguished_name option)
    ?subject_alternative_names:(subject_alternative_names_ : general_name_list option)
    ?extended_key_usages:(extended_key_usages_ : extended_key_usage_names option)
    ?key_algorithm:(key_algorithm_ : key_algorithm option)
    ?key_usages:(key_usages_ : key_usage_names option)
    ?serial_number:(serial_number_ : serial_number option) ?not_after:(not_after_ : t_stamp option)
    ?not_before:(not_before_ : t_stamp option) () =
  ({
     issuer = issuer_;
     subject = subject_;
     subject_alternative_names = subject_alternative_names_;
     extended_key_usages = extended_key_usages_;
     key_algorithm = key_algorithm_;
     key_usages = key_usages_;
     serial_number = serial_number_;
     not_after = not_after_;
     not_before = not_before_;
   }
    : x509_attributes)

let make_search_certificates_response ?results:(results_ : certificate_search_result_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ results = results_; next_token = next_token_ } : search_certificates_response)

let make_search_certificates_request
    ?filter_statement:(filter_statement_ : certificate_filter_statement option)
    ?max_results:(max_results_ : search_max_results option)
    ?next_token:(next_token_ : next_token option)
    ?sort_by:(sort_by_ : search_certificates_sort_by option)
    ?sort_order:(sort_order_ : search_certificates_sort_order option) () =
  ({
     filter_statement = filter_statement_;
     max_results = max_results_;
     next_token = next_token_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : search_certificates_request)

let make_revoke_certificate_response ?certificate_arn:(certificate_arn_ : arn option) () =
  ({ certificate_arn = certificate_arn_ } : revoke_certificate_response)

let make_revoke_certificate_request ~certificate_arn:(certificate_arn_ : arn)
    ~revocation_reason:(revocation_reason_ : revocation_reason) () =
  ({ certificate_arn = certificate_arn_; revocation_reason = revocation_reason_ }
    : revoke_certificate_request)

let make_revoke_acme_external_account_binding_request
    ~acme_external_account_binding_arn:
      (acme_external_account_binding_arn_ : acme_external_account_binding_arn) () =
  ({ acme_external_account_binding_arn = acme_external_account_binding_arn_ }
    : revoke_acme_external_account_binding_request)

let make_revoke_acme_account_request ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn)
    ~account_url:(account_url_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ acme_endpoint_arn = acme_endpoint_arn_; account_url = account_url_ }
    : revoke_acme_account_request)

let make_resend_validation_email_request ~certificate_arn:(certificate_arn_ : arn)
    ~domain:(domain_ : domain_name_string)
    ~validation_domain:(validation_domain_ : domain_name_string) () =
  ({ certificate_arn = certificate_arn_; domain = domain_; validation_domain = validation_domain_ }
    : resend_validation_email_request)

let make_request_certificate_response ?certificate_arn:(certificate_arn_ : arn option) () =
  ({ certificate_arn = certificate_arn_ } : request_certificate_response)

let make_domain_validation_option ~domain_name:(domain_name_ : domain_name_string)
    ~validation_domain:(validation_domain_ : domain_name_string) () =
  ({ domain_name = domain_name_; validation_domain = validation_domain_ }
    : domain_validation_option)

let make_request_certificate_request
    ?validation_method:(validation_method_ : validation_method option)
    ?subject_alternative_names:(subject_alternative_names_ : domain_list option)
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ?domain_validation_options:(domain_validation_options_ : domain_validation_option_list option)
    ?options:(options_ : certificate_options option)
    ?certificate_authority_arn:(certificate_authority_arn_ : pca_arn option)
    ?tags:(tags_ : tag_list option) ?key_algorithm:(key_algorithm_ : key_algorithm option)
    ?managed_by:(managed_by_ : certificate_managed_by option)
    ~domain_name:(domain_name_ : domain_name_string) () =
  ({
     domain_name = domain_name_;
     validation_method = validation_method_;
     subject_alternative_names = subject_alternative_names_;
     idempotency_token = idempotency_token_;
     domain_validation_options = domain_validation_options_;
     options = options_;
     certificate_authority_arn = certificate_authority_arn_;
     tags = tags_;
     key_algorithm = key_algorithm_;
     managed_by = managed_by_;
   }
    : request_certificate_request)

let make_renew_certificate_request ~certificate_arn:(certificate_arn_ : arn) () =
  ({ certificate_arn = certificate_arn_ } : renew_certificate_request)

let make_remove_tags_from_certificate_request ~certificate_arn:(certificate_arn_ : arn)
    ~tags:(tags_ : tag_list) () =
  ({ certificate_arn = certificate_arn_; tags = tags_ } : remove_tags_from_certificate_request)

let make_expiry_events_configuration
    ?days_before_expiry:(days_before_expiry_ : positive_integer option) () =
  ({ days_before_expiry = days_before_expiry_ } : expiry_events_configuration)

let make_put_account_configuration_request
    ?expiry_events:(expiry_events_ : expiry_events_configuration option)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({ expiry_events = expiry_events_; idempotency_token = idempotency_token_ }
    : put_account_configuration_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_tags_for_certificate_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_certificate_response)

let make_list_tags_for_certificate_request ~certificate_arn:(certificate_arn_ : arn) () =
  ({ certificate_arn = certificate_arn_ } : list_tags_for_certificate_request)

let make_certificate_summary ?certificate_arn:(certificate_arn_ : arn option)
    ?domain_name:(domain_name_ : domain_name_string option)
    ?subject_alternative_name_summaries:(subject_alternative_name_summaries_ : domain_list option)
    ?has_additional_subject_alternative_names:
      (has_additional_subject_alternative_names_ : nullable_boolean option)
    ?status:(status_ : certificate_status option) ?type_:(type__ : certificate_type option)
    ?key_algorithm:(key_algorithm_ : key_algorithm option)
    ?key_usages:(key_usages_ : key_usage_names option)
    ?extended_key_usages:(extended_key_usages_ : extended_key_usage_names option)
    ?export_option:(export_option_ : certificate_export option)
    ?in_use:(in_use_ : nullable_boolean option) ?exported:(exported_ : nullable_boolean option)
    ?renewal_eligibility:(renewal_eligibility_ : renewal_eligibility option)
    ?not_before:(not_before_ : t_stamp option) ?not_after:(not_after_ : t_stamp option)
    ?created_at:(created_at_ : t_stamp option) ?issued_at:(issued_at_ : t_stamp option)
    ?imported_at:(imported_at_ : t_stamp option) ?revoked_at:(revoked_at_ : t_stamp option)
    ?managed_by:(managed_by_ : certificate_managed_by option)
    ?certificate_key_pair_origin:(certificate_key_pair_origin_ : certificate_key_pair_origin option)
    () =
  ({
     certificate_arn = certificate_arn_;
     domain_name = domain_name_;
     subject_alternative_name_summaries = subject_alternative_name_summaries_;
     has_additional_subject_alternative_names = has_additional_subject_alternative_names_;
     status = status_;
     type_ = type__;
     key_algorithm = key_algorithm_;
     key_usages = key_usages_;
     extended_key_usages = extended_key_usages_;
     export_option = export_option_;
     in_use = in_use_;
     exported = exported_;
     renewal_eligibility = renewal_eligibility_;
     not_before = not_before_;
     not_after = not_after_;
     created_at = created_at_;
     issued_at = issued_at_;
     imported_at = imported_at_;
     revoked_at = revoked_at_;
     managed_by = managed_by_;
     certificate_key_pair_origin = certificate_key_pair_origin_;
   }
    : certificate_summary)

let make_list_certificates_response ?next_token:(next_token_ : next_token option)
    ?certificate_summary_list:(certificate_summary_list_ : certificate_summary_list option) () =
  ({ next_token = next_token_; certificate_summary_list = certificate_summary_list_ }
    : list_certificates_response)

let make_filters ?extended_key_usage:(extended_key_usage_ : extended_key_usage_filter_list option)
    ?key_usage:(key_usage_ : key_usage_filter_list option)
    ?key_types:(key_types_ : key_algorithm_list option)
    ?export_option:(export_option_ : certificate_export option)
    ?managed_by:(managed_by_ : certificate_managed_by option) () =
  ({
     extended_key_usage = extended_key_usage_;
     key_usage = key_usage_;
     key_types = key_types_;
     export_option = export_option_;
     managed_by = managed_by_;
   }
    : filters)

let make_list_certificates_request
    ?certificate_statuses:(certificate_statuses_ : certificate_statuses option)
    ?certificate_key_pair_origins:
      (certificate_key_pair_origins_ : certificate_key_pair_origins option)
    ?includes:(includes_ : filters option) ?next_token:(next_token_ : next_token option)
    ?max_items:(max_items_ : max_items option) ?sort_by:(sort_by_ : sort_by option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     certificate_statuses = certificate_statuses_;
     certificate_key_pair_origins = certificate_key_pair_origins_;
     includes = includes_;
     next_token = next_token_;
     max_items = max_items_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_certificates_request)

let make_list_acme_external_account_bindings_response
    ?external_account_bindings:
      (external_account_bindings_ : acme_external_account_binding_list option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ external_account_bindings = external_account_bindings_; next_token = next_token_ }
    : list_acme_external_account_bindings_response)

let make_list_acme_external_account_bindings_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn) () =
  ({ next_token = next_token_; max_results = max_results_; acme_endpoint_arn = acme_endpoint_arn_ }
    : list_acme_external_account_bindings_request)

let make_list_acme_endpoints_response ?acme_endpoints:(acme_endpoints_ : acme_endpoint_list option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ acme_endpoints = acme_endpoints_; next_token = next_token_ } : list_acme_endpoints_response)

let make_list_acme_endpoints_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_acme_endpoints_request)

let make_list_acme_domain_validations_response
    ?acme_domain_validations:(acme_domain_validations_ : acme_domain_validation_list option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ acme_domain_validations = acme_domain_validations_; next_token = next_token_ }
    : list_acme_domain_validations_response)

let make_list_acme_domain_validations_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn) () =
  ({ next_token = next_token_; max_results = max_results_; acme_endpoint_arn = acme_endpoint_arn_ }
    : list_acme_domain_validations_request)

let make_list_acme_accounts_response ?acme_accounts:(acme_accounts_ : acme_account_list option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ acme_accounts = acme_accounts_; next_token = next_token_ } : list_acme_accounts_response)

let make_list_acme_accounts_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn) () =
  ({ next_token = next_token_; max_results = max_results_; acme_endpoint_arn = acme_endpoint_arn_ }
    : list_acme_accounts_request)

let make_import_certificate_response ?certificate_arn:(certificate_arn_ : arn option) () =
  ({ certificate_arn = certificate_arn_ } : import_certificate_response)

let make_import_certificate_request ?certificate_arn:(certificate_arn_ : arn option)
    ?certificate_chain:(certificate_chain_ : certificate_chain_blob option)
    ?tags:(tags_ : tag_list option) ~certificate:(certificate_ : certificate_body_blob)
    ~private_key:(private_key_ : private_key_blob) () =
  ({
     certificate_arn = certificate_arn_;
     certificate = certificate_;
     private_key = private_key_;
     certificate_chain = certificate_chain_;
     tags = tags_;
   }
    : import_certificate_request)

let make_get_certificate_response ?certificate:(certificate_ : certificate_body option)
    ?certificate_chain:(certificate_chain_ : certificate_chain option) () =
  ({ certificate = certificate_; certificate_chain = certificate_chain_ }
    : get_certificate_response)

let make_get_certificate_request ~certificate_arn:(certificate_arn_ : arn) () =
  ({ certificate_arn = certificate_arn_ } : get_certificate_request)

let make_get_acme_external_account_binding_credentials_response
    ?key_id:(key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?mac_key:(mac_key_ : mac_key option) () =
  ({ key_id = key_id_; mac_key = mac_key_ }
    : get_acme_external_account_binding_credentials_response)

let make_get_acme_external_account_binding_credentials_request
    ~acme_external_account_binding_arn:
      (acme_external_account_binding_arn_ : acme_external_account_binding_arn) () =
  ({ acme_external_account_binding_arn = acme_external_account_binding_arn_ }
    : get_acme_external_account_binding_credentials_request)

let make_get_account_configuration_response
    ?expiry_events:(expiry_events_ : expiry_events_configuration option) () =
  ({ expiry_events = expiry_events_ } : get_account_configuration_response)

let make_export_certificate_response ?certificate:(certificate_ : certificate_body option)
    ?certificate_chain:(certificate_chain_ : certificate_chain option)
    ?private_key:(private_key_ : private_key option) () =
  ({
     certificate = certificate_;
     certificate_chain = certificate_chain_;
     private_key = private_key_;
   }
    : export_certificate_response)

let make_export_certificate_request ~certificate_arn:(certificate_arn_ : arn)
    ~passphrase:(passphrase_ : passphrase_blob) () =
  ({ certificate_arn = certificate_arn_; passphrase = passphrase_ } : export_certificate_request)

let make_describe_certificate_response ?certificate:(certificate_ : certificate_detail option) () =
  ({ certificate = certificate_ } : describe_certificate_response)

let make_describe_certificate_request ~certificate_arn:(certificate_arn_ : arn) () =
  ({ certificate_arn = certificate_arn_ } : describe_certificate_request)

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

let make_describe_acme_endpoint_response ?acme_endpoint:(acme_endpoint_ : acme_endpoint option) () =
  ({ acme_endpoint = acme_endpoint_ } : describe_acme_endpoint_response)

let make_describe_acme_endpoint_request ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn)
    () =
  ({ acme_endpoint_arn = acme_endpoint_arn_ } : describe_acme_endpoint_request)

let make_describe_acme_domain_validation_response
    ?acme_domain_validation:(acme_domain_validation_ : acme_domain_validation option) () =
  ({ acme_domain_validation = acme_domain_validation_ } : describe_acme_domain_validation_response)

let make_describe_acme_domain_validation_request
    ~acme_domain_validation_arn:(acme_domain_validation_arn_ : acme_domain_validation_arn) () =
  ({ acme_domain_validation_arn = acme_domain_validation_arn_ }
    : describe_acme_domain_validation_request)

let make_describe_acme_account_response ?acme_account:(acme_account_ : acme_account option) () =
  ({ acme_account = acme_account_ } : describe_acme_account_response)

let make_describe_acme_account_request ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn)
    ~account_url:(account_url_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ acme_endpoint_arn = acme_endpoint_arn_; account_url = account_url_ }
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

let make_expiration ~value:(value_ : Smaws_Lib.Smithy_api.Types.long) ~type_:(type__ : time_type) ()
    =
  ({ value = value_; type_ = type__ } : expiration)

let make_create_acme_external_account_binding_request
    ?idempotency_token:(idempotency_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?expiration:(expiration_ : expiration option) ?tags:(tags_ : tag_list option)
    ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn) ~role_arn:(role_arn_ : role_arn) ()
    =
  ({
     idempotency_token = idempotency_token_;
     acme_endpoint_arn = acme_endpoint_arn_;
     role_arn = role_arn_;
     expiration = expiration_;
     tags = tags_;
   }
    : create_acme_external_account_binding_request)

let make_create_acme_endpoint_response
    ?acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn option) () =
  ({ acme_endpoint_arn = acme_endpoint_arn_ } : create_acme_endpoint_response)

let make_create_acme_endpoint_request
    ?idempotency_token:(idempotency_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?contact:(contact_ : acme_contact option) ?tags:(tags_ : tag_list option)
    ?certificate_tags:(certificate_tags_ : tag_list option)
    ~authorization_behavior:(authorization_behavior_ : acme_authorization_behavior)
    ~certificate_authority:(certificate_authority_ : certificate_authority) () =
  ({
     idempotency_token = idempotency_token_;
     authorization_behavior = authorization_behavior_;
     contact = contact_;
     certificate_authority = certificate_authority_;
     tags = tags_;
     certificate_tags = certificate_tags_;
   }
    : create_acme_endpoint_request)

let make_create_acme_domain_validation_response
    ~acme_domain_validation_arn:(acme_domain_validation_arn_ : acme_domain_validation_arn) () =
  ({ acme_domain_validation_arn = acme_domain_validation_arn_ }
    : create_acme_domain_validation_response)

let make_create_acme_domain_validation_request
    ?idempotency_token:(idempotency_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tags:(tags_ : tag_list option) ~acme_endpoint_arn:(acme_endpoint_arn_ : acme_endpoint_arn)
    ~domain_name:(domain_name_ : domain_name)
    ~prevalidation_options:(prevalidation_options_ : prevalidation_options) () =
  ({
     idempotency_token = idempotency_token_;
     acme_endpoint_arn = acme_endpoint_arn_;
     domain_name = domain_name_;
     prevalidation_options = prevalidation_options_;
     tags = tags_;
   }
    : create_acme_domain_validation_request)
