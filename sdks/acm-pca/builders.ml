open Types

let make_ocsp_configuration ?ocsp_custom_cname:(ocsp_custom_cname_ : cname_string option)
    ~enabled:(enabled_ : boolean_) () =
  ({ enabled = enabled_; ocsp_custom_cname = ocsp_custom_cname_ } : ocsp_configuration)

let make_crl_distribution_point_extension_configuration ~omit_extension:(omit_extension_ : boolean_)
    () =
  ({ omit_extension = omit_extension_ } : crl_distribution_point_extension_configuration)

let make_crl_configuration ?expiration_in_days:(expiration_in_days_ : integer1_to5000 option)
    ?custom_cname:(custom_cname_ : cname_string option)
    ?s3_bucket_name:(s3_bucket_name_ : s3_bucket_name3_to255 option)
    ?s3_object_acl:(s3_object_acl_ : s3_object_acl option)
    ?crl_distribution_point_extension_configuration:
      (crl_distribution_point_extension_configuration_ :
         crl_distribution_point_extension_configuration option)
    ?crl_type:(crl_type_ : crl_type option) ?custom_path:(custom_path_ : crl_path_string option)
    ~enabled:(enabled_ : boolean_) () =
  ({
     enabled = enabled_;
     expiration_in_days = expiration_in_days_;
     custom_cname = custom_cname_;
     s3_bucket_name = s3_bucket_name_;
     s3_object_acl = s3_object_acl_;
     crl_distribution_point_extension_configuration =
       crl_distribution_point_extension_configuration_;
     crl_type = crl_type_;
     custom_path = custom_path_;
   }
    : crl_configuration)

let make_revocation_configuration ?crl_configuration:(crl_configuration_ : crl_configuration option)
    ?ocsp_configuration:(ocsp_configuration_ : ocsp_configuration option) () =
  ({ crl_configuration = crl_configuration_; ocsp_configuration = ocsp_configuration_ }
    : revocation_configuration)

let make_update_certificate_authority_request
    ?revocation_configuration:(revocation_configuration_ : revocation_configuration option)
    ?status:(status_ : certificate_authority_status option)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({
     certificate_authority_arn = certificate_authority_arn_;
     revocation_configuration = revocation_configuration_;
     status = status_;
   }
    : update_certificate_authority_request)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ key = key_; value = value_ } : tag)

let make_untag_certificate_authority_request
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) ~tags:(tags_ : tag_list) () =
  ({ certificate_authority_arn = certificate_authority_arn_; tags = tags_ }
    : untag_certificate_authority_request)

let make_tag_certificate_authority_request
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) ~tags:(tags_ : tag_list) () =
  ({ certificate_authority_arn = certificate_authority_arn_; tags = tags_ }
    : tag_certificate_authority_request)

let make_revoke_certificate_request ~certificate_authority_arn:(certificate_authority_arn_ : arn)
    ~certificate_serial:(certificate_serial_ : string128)
    ~revocation_reason:(revocation_reason_ : revocation_reason) () =
  ({
     certificate_authority_arn = certificate_authority_arn_;
     certificate_serial = certificate_serial_;
     revocation_reason = revocation_reason_;
   }
    : revoke_certificate_request)

let make_restore_certificate_authority_request
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({ certificate_authority_arn = certificate_authority_arn_ }
    : restore_certificate_authority_request)

let make_put_policy_request ~resource_arn:(resource_arn_ : arn) ~policy:(policy_ : aws_policy) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : put_policy_request)

let make_list_tags_response ?next_token:(next_token_ : next_token option)
    ?tags:(tags_ : tag_list option) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_response)

let make_list_tags_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     certificate_authority_arn = certificate_authority_arn_;
   }
    : list_tags_request)

let make_permission ?certificate_authority_arn:(certificate_authority_arn_ : arn option)
    ?created_at:(created_at_ : t_stamp option) ?principal:(principal_ : principal option)
    ?source_account:(source_account_ : account_id option) ?actions:(actions_ : action_list option)
    ?policy:(policy_ : aws_policy option) () =
  ({
     certificate_authority_arn = certificate_authority_arn_;
     created_at = created_at_;
     principal = principal_;
     source_account = source_account_;
     actions = actions_;
     policy = policy_;
   }
    : permission)

let make_list_permissions_response ?next_token:(next_token_ : next_token option)
    ?permissions:(permissions_ : permission_list option) () =
  ({ next_token = next_token_; permissions = permissions_ } : list_permissions_response)

let make_list_permissions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     certificate_authority_arn = certificate_authority_arn_;
   }
    : list_permissions_request)

let make_edi_party_name ?name_assigner:(name_assigner_ : string256 option)
    ~party_name:(party_name_ : string256) () =
  ({ party_name = party_name_; name_assigner = name_assigner_ } : edi_party_name)

let make_custom_attribute ~object_identifier:(object_identifier_ : custom_object_identifier)
    ~value:(value_ : string1_to256) () =
  ({ object_identifier = object_identifier_; value = value_ } : custom_attribute)

let make_asn1_subject ?country:(country_ : country_code_string option)
    ?organization:(organization_ : string64 option)
    ?organizational_unit:(organizational_unit_ : string64 option)
    ?distinguished_name_qualifier:(distinguished_name_qualifier_ : asn1_printable_string64 option)
    ?state:(state_ : string128 option) ?common_name:(common_name_ : string64 option)
    ?serial_number:(serial_number_ : asn1_printable_string64 option)
    ?locality:(locality_ : string128 option) ?title:(title_ : string64 option)
    ?surname:(surname_ : string40 option) ?given_name:(given_name_ : string16 option)
    ?initials:(initials_ : string5 option) ?pseudonym:(pseudonym_ : string128 option)
    ?generation_qualifier:(generation_qualifier_ : string3 option)
    ?custom_attributes:(custom_attributes_ : custom_attribute_list option) () =
  ({
     country = country_;
     organization = organization_;
     organizational_unit = organizational_unit_;
     distinguished_name_qualifier = distinguished_name_qualifier_;
     state = state_;
     common_name = common_name_;
     serial_number = serial_number_;
     locality = locality_;
     title = title_;
     surname = surname_;
     given_name = given_name_;
     initials = initials_;
     pseudonym = pseudonym_;
     generation_qualifier = generation_qualifier_;
     custom_attributes = custom_attributes_;
   }
    : asn1_subject)

let make_other_name ~type_id:(type_id_ : custom_object_identifier) ~value:(value_ : string256) () =
  ({ type_id = type_id_; value = value_ } : other_name)

let make_general_name ?other_name:(other_name_ : other_name option)
    ?rfc822_name:(rfc822_name_ : string256 option) ?dns_name:(dns_name_ : string253 option)
    ?directory_name:(directory_name_ : asn1_subject option)
    ?edi_party_name:(edi_party_name_ : edi_party_name option)
    ?uniform_resource_identifier:(uniform_resource_identifier_ : string253 option)
    ?ip_address:(ip_address_ : string39 option)
    ?registered_id:(registered_id_ : custom_object_identifier option) () =
  ({
     other_name = other_name_;
     rfc822_name = rfc822_name_;
     dns_name = dns_name_;
     directory_name = directory_name_;
     edi_party_name = edi_party_name_;
     uniform_resource_identifier = uniform_resource_identifier_;
     ip_address = ip_address_;
     registered_id = registered_id_;
   }
    : general_name)

let make_access_method
    ?custom_object_identifier:(custom_object_identifier_ : custom_object_identifier option)
    ?access_method_type:(access_method_type_ : access_method_type option) () =
  ({
     custom_object_identifier = custom_object_identifier_;
     access_method_type = access_method_type_;
   }
    : access_method)

let make_access_description ~access_method:(access_method_ : access_method)
    ~access_location:(access_location_ : general_name) () =
  ({ access_method = access_method_; access_location = access_location_ } : access_description)

let make_key_usage ?digital_signature:(digital_signature_ : boolean_ option)
    ?non_repudiation:(non_repudiation_ : boolean_ option)
    ?key_encipherment:(key_encipherment_ : boolean_ option)
    ?data_encipherment:(data_encipherment_ : boolean_ option)
    ?key_agreement:(key_agreement_ : boolean_ option)
    ?key_cert_sign:(key_cert_sign_ : boolean_ option) ?crl_sign:(crl_sign_ : boolean_ option)
    ?encipher_only:(encipher_only_ : boolean_ option)
    ?decipher_only:(decipher_only_ : boolean_ option) () =
  ({
     digital_signature = digital_signature_;
     non_repudiation = non_repudiation_;
     key_encipherment = key_encipherment_;
     data_encipherment = data_encipherment_;
     key_agreement = key_agreement_;
     key_cert_sign = key_cert_sign_;
     crl_sign = crl_sign_;
     encipher_only = encipher_only_;
     decipher_only = decipher_only_;
   }
    : key_usage)

let make_csr_extensions ?key_usage:(key_usage_ : key_usage option)
    ?subject_information_access:(subject_information_access_ : access_description_list option) () =
  ({ key_usage = key_usage_; subject_information_access = subject_information_access_ }
    : csr_extensions)

let make_certificate_authority_configuration
    ?csr_extensions:(csr_extensions_ : csr_extensions option)
    ~key_algorithm:(key_algorithm_ : key_algorithm)
    ~signing_algorithm:(signing_algorithm_ : signing_algorithm) ~subject:(subject_ : asn1_subject)
    () =
  ({
     key_algorithm = key_algorithm_;
     signing_algorithm = signing_algorithm_;
     subject = subject_;
     csr_extensions = csr_extensions_;
   }
    : certificate_authority_configuration)

let make_certificate_authority ?arn:(arn_ : arn option)
    ?owner_account:(owner_account_ : account_id option) ?created_at:(created_at_ : t_stamp option)
    ?last_state_change_at:(last_state_change_at_ : t_stamp option)
    ?type_:(type__ : certificate_authority_type option) ?serial:(serial_ : string_ option)
    ?status:(status_ : certificate_authority_status option)
    ?not_before:(not_before_ : t_stamp option) ?not_after:(not_after_ : t_stamp option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?certificate_authority_configuration:
      (certificate_authority_configuration_ : certificate_authority_configuration option)
    ?revocation_configuration:(revocation_configuration_ : revocation_configuration option)
    ?restorable_until:(restorable_until_ : t_stamp option)
    ?key_storage_security_standard:
      (key_storage_security_standard_ : key_storage_security_standard option)
    ?usage_mode:(usage_mode_ : certificate_authority_usage_mode option) () =
  ({
     arn = arn_;
     owner_account = owner_account_;
     created_at = created_at_;
     last_state_change_at = last_state_change_at_;
     type_ = type__;
     serial = serial_;
     status = status_;
     not_before = not_before_;
     not_after = not_after_;
     failure_reason = failure_reason_;
     certificate_authority_configuration = certificate_authority_configuration_;
     revocation_configuration = revocation_configuration_;
     restorable_until = restorable_until_;
     key_storage_security_standard = key_storage_security_standard_;
     usage_mode = usage_mode_;
   }
    : certificate_authority)

let make_list_certificate_authorities_response ?next_token:(next_token_ : next_token option)
    ?certificate_authorities:(certificate_authorities_ : certificate_authorities option) () =
  ({ next_token = next_token_; certificate_authorities = certificate_authorities_ }
    : list_certificate_authorities_response)

let make_list_certificate_authorities_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?resource_owner:(resource_owner_ : resource_owner option) () =
  ({ max_results = max_results_; next_token = next_token_; resource_owner = resource_owner_ }
    : list_certificate_authorities_request)

let make_issue_certificate_response ?certificate_arn:(certificate_arn_ : arn option) () =
  ({ certificate_arn = certificate_arn_ } : issue_certificate_response)

let make_validity ~value:(value_ : positive_long) ~type_:(type__ : validity_period_type) () =
  ({ value = value_; type_ = type__ } : validity)

let make_custom_extension ?critical:(critical_ : boolean_ option)
    ~object_identifier:(object_identifier_ : custom_object_identifier)
    ~value:(value_ : base64_string1_to4096) () =
  ({ object_identifier = object_identifier_; value = value_; critical = critical_ }
    : custom_extension)

let make_extended_key_usage
    ?extended_key_usage_type:(extended_key_usage_type_ : extended_key_usage_type option)
    ?extended_key_usage_object_identifier:
      (extended_key_usage_object_identifier_ : custom_object_identifier option) () =
  ({
     extended_key_usage_type = extended_key_usage_type_;
     extended_key_usage_object_identifier = extended_key_usage_object_identifier_;
   }
    : extended_key_usage)

let make_qualifier ~cps_uri:(cps_uri_ : string256) () = ({ cps_uri = cps_uri_ } : qualifier)

let make_policy_qualifier_info ~policy_qualifier_id:(policy_qualifier_id_ : policy_qualifier_id)
    ~qualifier:(qualifier_ : qualifier) () =
  ({ policy_qualifier_id = policy_qualifier_id_; qualifier = qualifier_ } : policy_qualifier_info)

let make_policy_information
    ?policy_qualifiers:(policy_qualifiers_ : policy_qualifier_info_list option)
    ~cert_policy_id:(cert_policy_id_ : custom_object_identifier) () =
  ({ cert_policy_id = cert_policy_id_; policy_qualifiers = policy_qualifiers_ }
    : policy_information)

let make_extensions ?certificate_policies:(certificate_policies_ : certificate_policy_list option)
    ?extended_key_usage:(extended_key_usage_ : extended_key_usage_list option)
    ?key_usage:(key_usage_ : key_usage option)
    ?subject_alternative_names:(subject_alternative_names_ : general_name_list option)
    ?custom_extensions:(custom_extensions_ : custom_extension_list option) () =
  ({
     certificate_policies = certificate_policies_;
     extended_key_usage = extended_key_usage_;
     key_usage = key_usage_;
     subject_alternative_names = subject_alternative_names_;
     custom_extensions = custom_extensions_;
   }
    : extensions)

let make_api_passthrough ?extensions:(extensions_ : extensions option)
    ?subject:(subject_ : asn1_subject option) () =
  ({ extensions = extensions_; subject = subject_ } : api_passthrough)

let make_issue_certificate_request ?api_passthrough:(api_passthrough_ : api_passthrough option)
    ?template_arn:(template_arn_ : arn option)
    ?validity_not_before:(validity_not_before_ : validity option)
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) ~csr:(csr_ : csr_blob)
    ~signing_algorithm:(signing_algorithm_ : signing_algorithm) ~validity:(validity_ : validity) ()
    =
  ({
     api_passthrough = api_passthrough_;
     certificate_authority_arn = certificate_authority_arn_;
     csr = csr_;
     signing_algorithm = signing_algorithm_;
     template_arn = template_arn_;
     validity = validity_;
     validity_not_before = validity_not_before_;
     idempotency_token = idempotency_token_;
   }
    : issue_certificate_request)

let make_import_certificate_authority_certificate_request
    ?certificate_chain:(certificate_chain_ : certificate_chain_blob option)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn)
    ~certificate:(certificate_ : certificate_body_blob) () =
  ({
     certificate_authority_arn = certificate_authority_arn_;
     certificate = certificate_;
     certificate_chain = certificate_chain_;
   }
    : import_certificate_authority_certificate_request)

let make_get_policy_response ?policy:(policy_ : aws_policy option) () =
  ({ policy = policy_ } : get_policy_response)

let make_get_policy_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : get_policy_request)

let make_get_certificate_authority_csr_response ?csr:(csr_ : csr_body option) () =
  ({ csr = csr_ } : get_certificate_authority_csr_response)

let make_get_certificate_authority_csr_request
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({ certificate_authority_arn = certificate_authority_arn_ }
    : get_certificate_authority_csr_request)

let make_get_certificate_authority_certificate_response
    ?certificate:(certificate_ : certificate_body option)
    ?certificate_chain:(certificate_chain_ : certificate_chain option) () =
  ({ certificate = certificate_; certificate_chain = certificate_chain_ }
    : get_certificate_authority_certificate_response)

let make_get_certificate_authority_certificate_request
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({ certificate_authority_arn = certificate_authority_arn_ }
    : get_certificate_authority_certificate_request)

let make_get_certificate_response ?certificate:(certificate_ : certificate_body option)
    ?certificate_chain:(certificate_chain_ : certificate_chain option) () =
  ({ certificate = certificate_; certificate_chain = certificate_chain_ }
    : get_certificate_response)

let make_get_certificate_request ~certificate_authority_arn:(certificate_authority_arn_ : arn)
    ~certificate_arn:(certificate_arn_ : arn) () =
  ({ certificate_authority_arn = certificate_authority_arn_; certificate_arn = certificate_arn_ }
    : get_certificate_request)

let make_describe_certificate_authority_audit_report_response
    ?audit_report_status:(audit_report_status_ : audit_report_status option)
    ?s3_bucket_name:(s3_bucket_name_ : s3_bucket_name option) ?s3_key:(s3_key_ : s3_key option)
    ?created_at:(created_at_ : t_stamp option) () =
  ({
     audit_report_status = audit_report_status_;
     s3_bucket_name = s3_bucket_name_;
     s3_key = s3_key_;
     created_at = created_at_;
   }
    : describe_certificate_authority_audit_report_response)

let make_describe_certificate_authority_audit_report_request
    ~certificate_authority_arn:(certificate_authority_arn_ : arn)
    ~audit_report_id:(audit_report_id_ : audit_report_id) () =
  ({ certificate_authority_arn = certificate_authority_arn_; audit_report_id = audit_report_id_ }
    : describe_certificate_authority_audit_report_request)

let make_describe_certificate_authority_response
    ?certificate_authority:(certificate_authority_ : certificate_authority option) () =
  ({ certificate_authority = certificate_authority_ } : describe_certificate_authority_response)

let make_describe_certificate_authority_request
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({ certificate_authority_arn = certificate_authority_arn_ }
    : describe_certificate_authority_request)

let make_delete_policy_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : delete_policy_request)

let make_delete_permission_request ?source_account:(source_account_ : account_id option)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn)
    ~principal:(principal_ : principal) () =
  ({
     certificate_authority_arn = certificate_authority_arn_;
     principal = principal_;
     source_account = source_account_;
   }
    : delete_permission_request)

let make_delete_certificate_authority_request
    ?permanent_deletion_time_in_days:
      (permanent_deletion_time_in_days_ : permanent_deletion_time_in_days option)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({
     certificate_authority_arn = certificate_authority_arn_;
     permanent_deletion_time_in_days = permanent_deletion_time_in_days_;
   }
    : delete_certificate_authority_request)

let make_create_permission_request ?source_account:(source_account_ : account_id option)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn)
    ~principal:(principal_ : principal) ~actions:(actions_ : action_list) () =
  ({
     certificate_authority_arn = certificate_authority_arn_;
     principal = principal_;
     source_account = source_account_;
     actions = actions_;
   }
    : create_permission_request)

let make_create_certificate_authority_audit_report_response
    ?audit_report_id:(audit_report_id_ : audit_report_id option) ?s3_key:(s3_key_ : s3_key option)
    () =
  ({ audit_report_id = audit_report_id_; s3_key = s3_key_ }
    : create_certificate_authority_audit_report_response)

let make_create_certificate_authority_audit_report_request
    ~certificate_authority_arn:(certificate_authority_arn_ : arn)
    ~s3_bucket_name:(s3_bucket_name_ : s3_bucket_name)
    ~audit_report_response_format:(audit_report_response_format_ : audit_report_response_format) ()
    =
  ({
     certificate_authority_arn = certificate_authority_arn_;
     s3_bucket_name = s3_bucket_name_;
     audit_report_response_format = audit_report_response_format_;
   }
    : create_certificate_authority_audit_report_request)

let make_create_certificate_authority_response
    ?certificate_authority_arn:(certificate_authority_arn_ : arn option) () =
  ({ certificate_authority_arn = certificate_authority_arn_ }
    : create_certificate_authority_response)

let make_create_certificate_authority_request
    ?revocation_configuration:(revocation_configuration_ : revocation_configuration option)
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ?key_storage_security_standard:
      (key_storage_security_standard_ : key_storage_security_standard option)
    ?tags:(tags_ : tag_list option)
    ?usage_mode:(usage_mode_ : certificate_authority_usage_mode option)
    ~certificate_authority_configuration:
      (certificate_authority_configuration_ : certificate_authority_configuration)
    ~certificate_authority_type:(certificate_authority_type_ : certificate_authority_type) () =
  ({
     certificate_authority_configuration = certificate_authority_configuration_;
     revocation_configuration = revocation_configuration_;
     certificate_authority_type = certificate_authority_type_;
     idempotency_token = idempotency_token_;
     key_storage_security_standard = key_storage_security_standard_;
     tags = tags_;
     usage_mode = usage_mode_;
   }
    : create_certificate_authority_request)
