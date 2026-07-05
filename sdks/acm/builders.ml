open Types
let make_certificate_options ?export_:(export__ : certificate_export option)
  ?certificate_transparency_logging_preference:(certificate_transparency_logging_preference_
                                                 :
                                                 certificate_transparency_logging_preference
                                                   option)
  () =
  ({
     export_ = export__;
     certificate_transparency_logging_preference =
       certificate_transparency_logging_preference_
   } : certificate_options)
let make_update_certificate_options_request
  ~options:(options_ : certificate_options)
  ~certificate_arn:(certificate_arn_ : arn) () =
  ({ options = options_; certificate_arn = certificate_arn_ } : update_certificate_options_request)
let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)
let make_revoke_certificate_response
  ?certificate_arn:(certificate_arn_ : arn option) () =
  ({ certificate_arn = certificate_arn_ } : revoke_certificate_response)
let make_revoke_certificate_request
  ~revocation_reason:(revocation_reason_ : revocation_reason)
  ~certificate_arn:(certificate_arn_ : arn) () =
  ({
     revocation_reason = revocation_reason_;
     certificate_arn = certificate_arn_
   } : revoke_certificate_request)
let make_resource_record ~value:(value_ : string_)
  ~type_:(type__ : record_type) ~name:(name_ : string_) () =
  ({ value = value_; type_ = type__; name = name_ } : resource_record)
let make_resend_validation_email_request
  ~validation_domain:(validation_domain_ : domain_name_string)
  ~domain:(domain_ : domain_name_string)
  ~certificate_arn:(certificate_arn_ : arn) () =
  ({
     validation_domain = validation_domain_;
     domain = domain_;
     certificate_arn = certificate_arn_
   } : resend_validation_email_request)
let make_request_certificate_response
  ?certificate_arn:(certificate_arn_ : arn option) () =
  ({ certificate_arn = certificate_arn_ } : request_certificate_response)
let make_domain_validation_option
  ~validation_domain:(validation_domain_ : domain_name_string)
  ~domain_name:(domain_name_ : domain_name_string) () =
  ({ validation_domain = validation_domain_; domain_name = domain_name_ } : 
  domain_validation_option)
let make_request_certificate_request
  ?managed_by:(managed_by_ : certificate_managed_by option)
  ?key_algorithm:(key_algorithm_ : key_algorithm option)
  ?tags:(tags_ : tag_list option)
  ?certificate_authority_arn:(certificate_authority_arn_ : pca_arn option)
  ?options:(options_ : certificate_options option)
  ?domain_validation_options:(domain_validation_options_ :
                               domain_validation_option_list option)
  ?idempotency_token:(idempotency_token_ : idempotency_token option)
  ?subject_alternative_names:(subject_alternative_names_ :
                               domain_list option)
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
     domain_name = domain_name_
   } : request_certificate_request)
let make_http_redirect ?redirect_to:(redirect_to_ : string_ option)
  ?redirect_from:(redirect_from_ : string_ option) () =
  ({ redirect_to = redirect_to_; redirect_from = redirect_from_ } : http_redirect)
let make_domain_validation
  ?validation_method:(validation_method_ : validation_method option)
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
     domain_name = domain_name_
   } : domain_validation)
let make_renewal_summary
  ?renewal_status_reason:(renewal_status_reason_ : failure_reason option)
  ~updated_at:(updated_at_ : t_stamp)
  ~domain_validation_options:(domain_validation_options_ :
                               domain_validation_list)
  ~renewal_status:(renewal_status_ : renewal_status) () =
  ({
     updated_at = updated_at_;
     renewal_status_reason = renewal_status_reason_;
     domain_validation_options = domain_validation_options_;
     renewal_status = renewal_status_
   } : renewal_summary)
let make_renew_certificate_request ~certificate_arn:(certificate_arn_ : arn)
  () = ({ certificate_arn = certificate_arn_ } : renew_certificate_request)
let make_remove_tags_from_certificate_request ~tags:(tags_ : tag_list)
  ~certificate_arn:(certificate_arn_ : arn) () =
  ({ tags = tags_; certificate_arn = certificate_arn_ } : remove_tags_from_certificate_request)
let make_expiry_events_configuration
  ?days_before_expiry:(days_before_expiry_ : positive_integer option) () =
  ({ days_before_expiry = days_before_expiry_ } : expiry_events_configuration)
let make_put_account_configuration_request
  ?expiry_events:(expiry_events_ : expiry_events_configuration option)
  ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({ idempotency_token = idempotency_token_; expiry_events = expiry_events_ } : 
  put_account_configuration_request)
let make_list_tags_for_certificate_response ?tags:(tags_ : tag_list option)
  () = ({ tags = tags_ } : list_tags_for_certificate_response)
let make_list_tags_for_certificate_request
  ~certificate_arn:(certificate_arn_ : arn) () =
  ({ certificate_arn = certificate_arn_ } : list_tags_for_certificate_request)
let make_certificate_summary
  ?managed_by:(managed_by_ : certificate_managed_by option)
  ?revoked_at:(revoked_at_ : t_stamp option)
  ?imported_at:(imported_at_ : t_stamp option)
  ?issued_at:(issued_at_ : t_stamp option)
  ?created_at:(created_at_ : t_stamp option)
  ?not_after:(not_after_ : t_stamp option)
  ?not_before:(not_before_ : t_stamp option)
  ?renewal_eligibility:(renewal_eligibility_ : renewal_eligibility option)
  ?exported:(exported_ : nullable_boolean option)
  ?in_use:(in_use_ : nullable_boolean option)
  ?export_option:(export_option_ : certificate_export option)
  ?extended_key_usages:(extended_key_usages_ :
                         extended_key_usage_names option)
  ?key_usages:(key_usages_ : key_usage_names option)
  ?key_algorithm:(key_algorithm_ : key_algorithm option)
  ?type_:(type__ : certificate_type option)
  ?status:(status_ : certificate_status option)
  ?has_additional_subject_alternative_names:(has_additional_subject_alternative_names_
                                              : nullable_boolean option)
  ?subject_alternative_name_summaries:(subject_alternative_name_summaries_ :
                                        domain_list option)
  ?domain_name:(domain_name_ : domain_name_string option)
  ?certificate_arn:(certificate_arn_ : arn option) () =
  ({
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
     has_additional_subject_alternative_names =
       has_additional_subject_alternative_names_;
     subject_alternative_name_summaries = subject_alternative_name_summaries_;
     domain_name = domain_name_;
     certificate_arn = certificate_arn_
   } : certificate_summary)
let make_list_certificates_response
  ?certificate_summary_list:(certificate_summary_list_ :
                              certificate_summary_list option)
  ?next_token:(next_token_ : next_token option) () =
  ({
     certificate_summary_list = certificate_summary_list_;
     next_token = next_token_
   } : list_certificates_response)
let make_filters ?managed_by:(managed_by_ : certificate_managed_by option)
  ?export_option:(export_option_ : certificate_export option)
  ?key_types:(key_types_ : key_algorithm_list option)
  ?key_usage:(key_usage_ : key_usage_filter_list option)
  ?extended_key_usage:(extended_key_usage_ :
                        extended_key_usage_filter_list option)
  () =
  ({
     managed_by = managed_by_;
     export_option = export_option_;
     key_types = key_types_;
     key_usage = key_usage_;
     extended_key_usage = extended_key_usage_
   } : filters)
let make_list_certificates_request
  ?sort_order:(sort_order_ : sort_order option)
  ?sort_by:(sort_by_ : sort_by option)
  ?max_items:(max_items_ : max_items option)
  ?next_token:(next_token_ : next_token option)
  ?includes:(includes_ : filters option)
  ?certificate_statuses:(certificate_statuses_ : certificate_statuses option)
  () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     max_items = max_items_;
     next_token = next_token_;
     includes = includes_;
     certificate_statuses = certificate_statuses_
   } : list_certificates_request)
let make_key_usage ?name:(name_ : key_usage_name option) () =
  ({ name = name_ } : key_usage)
let make_import_certificate_response
  ?certificate_arn:(certificate_arn_ : arn option) () =
  ({ certificate_arn = certificate_arn_ } : import_certificate_response)
let make_import_certificate_request ?tags:(tags_ : tag_list option)
  ?certificate_chain:(certificate_chain_ : certificate_chain_blob option)
  ?certificate_arn:(certificate_arn_ : arn option)
  ~private_key:(private_key_ : private_key_blob)
  ~certificate:(certificate_ : certificate_body_blob) () =
  ({
     tags = tags_;
     certificate_chain = certificate_chain_;
     private_key = private_key_;
     certificate = certificate_;
     certificate_arn = certificate_arn_
   } : import_certificate_request)
let make_get_certificate_response
  ?certificate_chain:(certificate_chain_ : certificate_chain option)
  ?certificate:(certificate_ : certificate_body option) () =
  ({ certificate_chain = certificate_chain_; certificate = certificate_ } : 
  get_certificate_response)
let make_get_certificate_request ~certificate_arn:(certificate_arn_ : arn) ()
  = ({ certificate_arn = certificate_arn_ } : get_certificate_request)
let make_get_account_configuration_response
  ?expiry_events:(expiry_events_ : expiry_events_configuration option) () =
  ({ expiry_events = expiry_events_ } : get_account_configuration_response)
let make_extended_key_usage ?oi_d:(oi_d_ : string_ option)
  ?name:(name_ : extended_key_usage_name option) () =
  ({ oi_d = oi_d_; name = name_ } : extended_key_usage)
let make_export_certificate_response
  ?private_key:(private_key_ : private_key option)
  ?certificate_chain:(certificate_chain_ : certificate_chain option)
  ?certificate:(certificate_ : certificate_body option) () =
  ({
     private_key = private_key_;
     certificate_chain = certificate_chain_;
     certificate = certificate_
   } : export_certificate_response)
let make_export_certificate_request
  ~passphrase:(passphrase_ : passphrase_blob)
  ~certificate_arn:(certificate_arn_ : arn) () =
  ({ passphrase = passphrase_; certificate_arn = certificate_arn_ } : 
  export_certificate_request)
let make_certificate_detail ?options:(options_ : certificate_options option)
  ?renewal_eligibility:(renewal_eligibility_ : renewal_eligibility option)
  ?certificate_authority_arn:(certificate_authority_arn_ : arn option)
  ?extended_key_usages:(extended_key_usages_ :
                         extended_key_usage_list option)
  ?key_usages:(key_usages_ : key_usage_list option)
  ?renewal_summary:(renewal_summary_ : renewal_summary option)
  ?type_:(type__ : certificate_type option)
  ?failure_reason:(failure_reason_ : failure_reason option)
  ?in_use_by:(in_use_by_ : in_use_list option)
  ?signature_algorithm:(signature_algorithm_ : string_ option)
  ?key_algorithm:(key_algorithm_ : key_algorithm option)
  ?not_after:(not_after_ : t_stamp option)
  ?not_before:(not_before_ : t_stamp option)
  ?revocation_reason:(revocation_reason_ : revocation_reason option)
  ?revoked_at:(revoked_at_ : t_stamp option)
  ?status:(status_ : certificate_status option)
  ?imported_at:(imported_at_ : t_stamp option)
  ?issued_at:(issued_at_ : t_stamp option)
  ?created_at:(created_at_ : t_stamp option)
  ?issuer:(issuer_ : string_ option) ?subject:(subject_ : string_ option)
  ?serial:(serial_ : string_ option)
  ?domain_validation_options:(domain_validation_options_ :
                               domain_validation_list option)
  ?managed_by:(managed_by_ : certificate_managed_by option)
  ?subject_alternative_names:(subject_alternative_names_ :
                               domain_list option)
  ?domain_name:(domain_name_ : domain_name_string option)
  ?certificate_arn:(certificate_arn_ : arn option) () =
  ({
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
     certificate_arn = certificate_arn_
   } : certificate_detail)
let make_describe_certificate_response
  ?certificate:(certificate_ : certificate_detail option) () =
  ({ certificate = certificate_ } : describe_certificate_response)
let make_describe_certificate_request
  ~certificate_arn:(certificate_arn_ : arn) () =
  ({ certificate_arn = certificate_arn_ } : describe_certificate_request)
let make_delete_certificate_request ~certificate_arn:(certificate_arn_ : arn)
  () = ({ certificate_arn = certificate_arn_ } : delete_certificate_request)
let make_add_tags_to_certificate_request ~tags:(tags_ : tag_list)
  ~certificate_arn:(certificate_arn_ : arn) () =
  ({ tags = tags_; certificate_arn = certificate_arn_ } : add_tags_to_certificate_request)