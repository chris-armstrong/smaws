open Types

let make_validity ~type_:(type__ : validity_period_type) ~value:(value_ : positive_long) () =
  ({ type_ = type__; value = value_ } : validity)

let make_crl_distribution_point_extension_configuration ~omit_extension:(omit_extension_ : boolean_)
    () =
  ({ omit_extension = omit_extension_ } : crl_distribution_point_extension_configuration)

let make_crl_configuration ?custom_path:(custom_path_ : crl_path_string option)
    ?crl_type:(crl_type_ : crl_type option)
    ?crl_distribution_point_extension_configuration:
      (crl_distribution_point_extension_configuration_ :
         crl_distribution_point_extension_configuration option)
    ?s3_object_acl:(s3_object_acl_ : s3_object_acl option)
    ?s3_bucket_name:(s3_bucket_name_ : s3_bucket_name3_to255 option)
    ?custom_cname:(custom_cname_ : cname_string option)
    ?expiration_in_days:(expiration_in_days_ : integer1_to5000 option)
    ~enabled:(enabled_ : boolean_) () =
  ({
     custom_path = custom_path_;
     crl_type = crl_type_;
     crl_distribution_point_extension_configuration =
       crl_distribution_point_extension_configuration_;
     s3_object_acl = s3_object_acl_;
     s3_bucket_name = s3_bucket_name_;
     custom_cname = custom_cname_;
     expiration_in_days = expiration_in_days_;
     enabled = enabled_;
   }
    : crl_configuration)

let make_ocsp_configuration ?ocsp_custom_cname:(ocsp_custom_cname_ : cname_string option)
    ~enabled:(enabled_ : boolean_) () =
  ({ ocsp_custom_cname = ocsp_custom_cname_; enabled = enabled_ } : ocsp_configuration)

let make_revocation_configuration
    ?ocsp_configuration:(ocsp_configuration_ : ocsp_configuration option)
    ?crl_configuration:(crl_configuration_ : crl_configuration option) () =
  ({ ocsp_configuration = ocsp_configuration_; crl_configuration = crl_configuration_ }
    : revocation_configuration)

let make_update_certificate_authority_request
    ?status:(status_ : certificate_authority_status option)
    ?revocation_configuration:(revocation_configuration_ : revocation_configuration option)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({
     status = status_;
     revocation_configuration = revocation_configuration_;
     certificate_authority_arn = certificate_authority_arn_;
   }
    : update_certificate_authority_request)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_untag_certificate_authority_request ~tags:(tags_ : tag_list)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({ tags = tags_; certificate_authority_arn = certificate_authority_arn_ }
    : untag_certificate_authority_request)

let make_tag_certificate_authority_request ~tags:(tags_ : tag_list)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({ tags = tags_; certificate_authority_arn = certificate_authority_arn_ }
    : tag_certificate_authority_request)

let make_revoke_certificate_request ~revocation_reason:(revocation_reason_ : revocation_reason)
    ~certificate_serial:(certificate_serial_ : string128)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({
     revocation_reason = revocation_reason_;
     certificate_serial = certificate_serial_;
     certificate_authority_arn = certificate_authority_arn_;
   }
    : revoke_certificate_request)

let make_restore_certificate_authority_request
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({ certificate_authority_arn = certificate_authority_arn_ }
    : restore_certificate_authority_request)

let make_qualifier ~cps_uri:(cps_uri_ : string256) () = ({ cps_uri = cps_uri_ } : qualifier)

let make_put_policy_request ~policy:(policy_ : aws_policy) ~resource_arn:(resource_arn_ : arn) () =
  ({ policy = policy_; resource_arn = resource_arn_ } : put_policy_request)

let make_policy_qualifier_info ~qualifier:(qualifier_ : qualifier)
    ~policy_qualifier_id:(policy_qualifier_id_ : policy_qualifier_id) () =
  ({ qualifier = qualifier_; policy_qualifier_id = policy_qualifier_id_ } : policy_qualifier_info)

let make_policy_information
    ?policy_qualifiers:(policy_qualifiers_ : policy_qualifier_info_list option)
    ~cert_policy_id:(cert_policy_id_ : custom_object_identifier) () =
  ({ policy_qualifiers = policy_qualifiers_; cert_policy_id = cert_policy_id_ }
    : policy_information)

let make_permission ?policy:(policy_ : aws_policy option) ?actions:(actions_ : action_list option)
    ?source_account:(source_account_ : account_id option) ?principal:(principal_ : principal option)
    ?created_at:(created_at_ : t_stamp option)
    ?certificate_authority_arn:(certificate_authority_arn_ : arn option) () =
  ({
     policy = policy_;
     actions = actions_;
     source_account = source_account_;
     principal = principal_;
     created_at = created_at_;
     certificate_authority_arn = certificate_authority_arn_;
   }
    : permission)

let make_other_name ~value:(value_ : string256) ~type_id:(type_id_ : custom_object_identifier) () =
  ({ value = value_; type_id = type_id_ } : other_name)

let make_list_tags_response ?tags:(tags_ : tag_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_response)

let make_list_tags_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({
     certificate_authority_arn = certificate_authority_arn_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_tags_request)

let make_list_permissions_response ?permissions:(permissions_ : permission_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ permissions = permissions_; next_token = next_token_ } : list_permissions_response)

let make_list_permissions_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({
     certificate_authority_arn = certificate_authority_arn_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_permissions_request)

let make_custom_attribute ~value:(value_ : string1_to256)
    ~object_identifier:(object_identifier_ : custom_object_identifier) () =
  ({ value = value_; object_identifier = object_identifier_ } : custom_attribute)

let make_asn1_subject ?custom_attributes:(custom_attributes_ : custom_attribute_list option)
    ?generation_qualifier:(generation_qualifier_ : string3 option)
    ?pseudonym:(pseudonym_ : string128 option) ?initials:(initials_ : string5 option)
    ?given_name:(given_name_ : string16 option) ?surname:(surname_ : string40 option)
    ?title:(title_ : string64 option) ?locality:(locality_ : string128 option)
    ?serial_number:(serial_number_ : asn1_printable_string64 option)
    ?common_name:(common_name_ : string64 option) ?state:(state_ : string128 option)
    ?distinguished_name_qualifier:(distinguished_name_qualifier_ : asn1_printable_string64 option)
    ?organizational_unit:(organizational_unit_ : string64 option)
    ?organization:(organization_ : string64 option) ?country:(country_ : country_code_string option)
    () =
  ({
     custom_attributes = custom_attributes_;
     generation_qualifier = generation_qualifier_;
     pseudonym = pseudonym_;
     initials = initials_;
     given_name = given_name_;
     surname = surname_;
     title = title_;
     locality = locality_;
     serial_number = serial_number_;
     common_name = common_name_;
     state = state_;
     distinguished_name_qualifier = distinguished_name_qualifier_;
     organizational_unit = organizational_unit_;
     organization = organization_;
     country = country_;
   }
    : asn1_subject)

let make_key_usage ?decipher_only:(decipher_only_ : boolean_ option)
    ?encipher_only:(encipher_only_ : boolean_ option) ?crl_sign:(crl_sign_ : boolean_ option)
    ?key_cert_sign:(key_cert_sign_ : boolean_ option)
    ?key_agreement:(key_agreement_ : boolean_ option)
    ?data_encipherment:(data_encipherment_ : boolean_ option)
    ?key_encipherment:(key_encipherment_ : boolean_ option)
    ?non_repudiation:(non_repudiation_ : boolean_ option)
    ?digital_signature:(digital_signature_ : boolean_ option) () =
  ({
     decipher_only = decipher_only_;
     encipher_only = encipher_only_;
     crl_sign = crl_sign_;
     key_cert_sign = key_cert_sign_;
     key_agreement = key_agreement_;
     data_encipherment = data_encipherment_;
     key_encipherment = key_encipherment_;
     non_repudiation = non_repudiation_;
     digital_signature = digital_signature_;
   }
    : key_usage)

let make_access_method ?access_method_type:(access_method_type_ : access_method_type option)
    ?custom_object_identifier:(custom_object_identifier_ : custom_object_identifier option) () =
  ({
     access_method_type = access_method_type_;
     custom_object_identifier = custom_object_identifier_;
   }
    : access_method)

let make_edi_party_name ?name_assigner:(name_assigner_ : string256 option)
    ~party_name:(party_name_ : string256) () =
  ({ name_assigner = name_assigner_; party_name = party_name_ } : edi_party_name)

let make_general_name ?registered_id:(registered_id_ : custom_object_identifier option)
    ?ip_address:(ip_address_ : string39 option)
    ?uniform_resource_identifier:(uniform_resource_identifier_ : string253 option)
    ?edi_party_name:(edi_party_name_ : edi_party_name option)
    ?directory_name:(directory_name_ : asn1_subject option) ?dns_name:(dns_name_ : string253 option)
    ?rfc822_name:(rfc822_name_ : string256 option) ?other_name:(other_name_ : other_name option) ()
    =
  ({
     registered_id = registered_id_;
     ip_address = ip_address_;
     uniform_resource_identifier = uniform_resource_identifier_;
     edi_party_name = edi_party_name_;
     directory_name = directory_name_;
     dns_name = dns_name_;
     rfc822_name = rfc822_name_;
     other_name = other_name_;
   }
    : general_name)

let make_access_description ~access_location:(access_location_ : general_name)
    ~access_method:(access_method_ : access_method) () =
  ({ access_location = access_location_; access_method = access_method_ } : access_description)

let make_csr_extensions
    ?subject_information_access:(subject_information_access_ : access_description_list option)
    ?key_usage:(key_usage_ : key_usage option) () =
  ({ subject_information_access = subject_information_access_; key_usage = key_usage_ }
    : csr_extensions)

let make_certificate_authority_configuration
    ?csr_extensions:(csr_extensions_ : csr_extensions option) ~subject:(subject_ : asn1_subject)
    ~signing_algorithm:(signing_algorithm_ : signing_algorithm)
    ~key_algorithm:(key_algorithm_ : key_algorithm) () =
  ({
     csr_extensions = csr_extensions_;
     subject = subject_;
     signing_algorithm = signing_algorithm_;
     key_algorithm = key_algorithm_;
   }
    : certificate_authority_configuration)

let make_certificate_authority ?usage_mode:(usage_mode_ : certificate_authority_usage_mode option)
    ?key_storage_security_standard:
      (key_storage_security_standard_ : key_storage_security_standard option)
    ?restorable_until:(restorable_until_ : t_stamp option)
    ?revocation_configuration:(revocation_configuration_ : revocation_configuration option)
    ?certificate_authority_configuration:
      (certificate_authority_configuration_ : certificate_authority_configuration option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?not_after:(not_after_ : t_stamp option) ?not_before:(not_before_ : t_stamp option)
    ?status:(status_ : certificate_authority_status option) ?serial:(serial_ : string_ option)
    ?type_:(type__ : certificate_authority_type option)
    ?last_state_change_at:(last_state_change_at_ : t_stamp option)
    ?created_at:(created_at_ : t_stamp option) ?owner_account:(owner_account_ : account_id option)
    ?arn:(arn_ : arn option) () =
  ({
     usage_mode = usage_mode_;
     key_storage_security_standard = key_storage_security_standard_;
     restorable_until = restorable_until_;
     revocation_configuration = revocation_configuration_;
     certificate_authority_configuration = certificate_authority_configuration_;
     failure_reason = failure_reason_;
     not_after = not_after_;
     not_before = not_before_;
     status = status_;
     serial = serial_;
     type_ = type__;
     last_state_change_at = last_state_change_at_;
     created_at = created_at_;
     owner_account = owner_account_;
     arn = arn_;
   }
    : certificate_authority)

let make_list_certificate_authorities_response
    ?certificate_authorities:(certificate_authorities_ : certificate_authorities option)
    ?next_token:(next_token_ : next_token option) () =
  ({ certificate_authorities = certificate_authorities_; next_token = next_token_ }
    : list_certificate_authorities_response)

let make_list_certificate_authorities_request
    ?resource_owner:(resource_owner_ : resource_owner option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ resource_owner = resource_owner_; next_token = next_token_; max_results = max_results_ }
    : list_certificate_authorities_request)

let make_issue_certificate_response ?certificate_arn:(certificate_arn_ : arn option) () =
  ({ certificate_arn = certificate_arn_ } : issue_certificate_response)

let make_extended_key_usage
    ?extended_key_usage_object_identifier:
      (extended_key_usage_object_identifier_ : custom_object_identifier option)
    ?extended_key_usage_type:(extended_key_usage_type_ : extended_key_usage_type option) () =
  ({
     extended_key_usage_object_identifier = extended_key_usage_object_identifier_;
     extended_key_usage_type = extended_key_usage_type_;
   }
    : extended_key_usage)

let make_custom_extension ?critical:(critical_ : boolean_ option)
    ~value:(value_ : base64_string1_to4096)
    ~object_identifier:(object_identifier_ : custom_object_identifier) () =
  ({ critical = critical_; value = value_; object_identifier = object_identifier_ }
    : custom_extension)

let make_extensions ?custom_extensions:(custom_extensions_ : custom_extension_list option)
    ?subject_alternative_names:(subject_alternative_names_ : general_name_list option)
    ?key_usage:(key_usage_ : key_usage option)
    ?extended_key_usage:(extended_key_usage_ : extended_key_usage_list option)
    ?certificate_policies:(certificate_policies_ : certificate_policy_list option) () =
  ({
     custom_extensions = custom_extensions_;
     subject_alternative_names = subject_alternative_names_;
     key_usage = key_usage_;
     extended_key_usage = extended_key_usage_;
     certificate_policies = certificate_policies_;
   }
    : extensions)

let make_api_passthrough ?subject:(subject_ : asn1_subject option)
    ?extensions:(extensions_ : extensions option) () =
  ({ subject = subject_; extensions = extensions_ } : api_passthrough)

let make_issue_certificate_request
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ?validity_not_before:(validity_not_before_ : validity option)
    ?template_arn:(template_arn_ : arn option)
    ?api_passthrough:(api_passthrough_ : api_passthrough option) ~validity:(validity_ : validity)
    ~signing_algorithm:(signing_algorithm_ : signing_algorithm) ~csr:(csr_ : csr_blob)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({
     idempotency_token = idempotency_token_;
     validity_not_before = validity_not_before_;
     validity = validity_;
     template_arn = template_arn_;
     signing_algorithm = signing_algorithm_;
     csr = csr_;
     certificate_authority_arn = certificate_authority_arn_;
     api_passthrough = api_passthrough_;
   }
    : issue_certificate_request)

let make_import_certificate_authority_certificate_request
    ?certificate_chain:(certificate_chain_ : certificate_chain_blob option)
    ~certificate:(certificate_ : certificate_body_blob)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({
     certificate_chain = certificate_chain_;
     certificate = certificate_;
     certificate_authority_arn = certificate_authority_arn_;
   }
    : import_certificate_authority_certificate_request)

let make_get_policy_response ?policy:(policy_ : aws_policy option) () =
  ({ policy = policy_ } : get_policy_response)

let make_get_policy_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : get_policy_request)

let make_get_certificate_response ?certificate_chain:(certificate_chain_ : certificate_chain option)
    ?certificate:(certificate_ : certificate_body option) () =
  ({ certificate_chain = certificate_chain_; certificate = certificate_ }
    : get_certificate_response)

let make_get_certificate_request ~certificate_arn:(certificate_arn_ : arn)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({ certificate_arn = certificate_arn_; certificate_authority_arn = certificate_authority_arn_ }
    : get_certificate_request)

let make_get_certificate_authority_csr_response ?csr:(csr_ : csr_body option) () =
  ({ csr = csr_ } : get_certificate_authority_csr_response)

let make_get_certificate_authority_csr_request
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({ certificate_authority_arn = certificate_authority_arn_ }
    : get_certificate_authority_csr_request)

let make_get_certificate_authority_certificate_response
    ?certificate_chain:(certificate_chain_ : certificate_chain option)
    ?certificate:(certificate_ : certificate_body option) () =
  ({ certificate_chain = certificate_chain_; certificate = certificate_ }
    : get_certificate_authority_certificate_response)

let make_get_certificate_authority_certificate_request
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({ certificate_authority_arn = certificate_authority_arn_ }
    : get_certificate_authority_certificate_request)

let make_describe_certificate_authority_response
    ?certificate_authority:(certificate_authority_ : certificate_authority option) () =
  ({ certificate_authority = certificate_authority_ } : describe_certificate_authority_response)

let make_describe_certificate_authority_request
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({ certificate_authority_arn = certificate_authority_arn_ }
    : describe_certificate_authority_request)

let make_describe_certificate_authority_audit_report_response
    ?created_at:(created_at_ : t_stamp option) ?s3_key:(s3_key_ : s3_key option)
    ?s3_bucket_name:(s3_bucket_name_ : s3_bucket_name option)
    ?audit_report_status:(audit_report_status_ : audit_report_status option) () =
  ({
     created_at = created_at_;
     s3_key = s3_key_;
     s3_bucket_name = s3_bucket_name_;
     audit_report_status = audit_report_status_;
   }
    : describe_certificate_authority_audit_report_response)

let make_describe_certificate_authority_audit_report_request
    ~audit_report_id:(audit_report_id_ : audit_report_id)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({ audit_report_id = audit_report_id_; certificate_authority_arn = certificate_authority_arn_ }
    : describe_certificate_authority_audit_report_request)

let make_delete_policy_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : delete_policy_request)

let make_delete_permission_request ?source_account:(source_account_ : account_id option)
    ~principal:(principal_ : principal)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({
     source_account = source_account_;
     principal = principal_;
     certificate_authority_arn = certificate_authority_arn_;
   }
    : delete_permission_request)

let make_delete_certificate_authority_request
    ?permanent_deletion_time_in_days:
      (permanent_deletion_time_in_days_ : permanent_deletion_time_in_days option)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({
     permanent_deletion_time_in_days = permanent_deletion_time_in_days_;
     certificate_authority_arn = certificate_authority_arn_;
   }
    : delete_certificate_authority_request)

let make_create_permission_request ?source_account:(source_account_ : account_id option)
    ~actions:(actions_ : action_list) ~principal:(principal_ : principal)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({
     actions = actions_;
     source_account = source_account_;
     principal = principal_;
     certificate_authority_arn = certificate_authority_arn_;
   }
    : create_permission_request)

let make_create_certificate_authority_response
    ?certificate_authority_arn:(certificate_authority_arn_ : arn option) () =
  ({ certificate_authority_arn = certificate_authority_arn_ }
    : create_certificate_authority_response)

let make_create_certificate_authority_request
    ?usage_mode:(usage_mode_ : certificate_authority_usage_mode option)
    ?tags:(tags_ : tag_list option)
    ?key_storage_security_standard:
      (key_storage_security_standard_ : key_storage_security_standard option)
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ?revocation_configuration:(revocation_configuration_ : revocation_configuration option)
    ~certificate_authority_type:(certificate_authority_type_ : certificate_authority_type)
    ~certificate_authority_configuration:
      (certificate_authority_configuration_ : certificate_authority_configuration) () =
  ({
     usage_mode = usage_mode_;
     tags = tags_;
     key_storage_security_standard = key_storage_security_standard_;
     idempotency_token = idempotency_token_;
     certificate_authority_type = certificate_authority_type_;
     revocation_configuration = revocation_configuration_;
     certificate_authority_configuration = certificate_authority_configuration_;
   }
    : create_certificate_authority_request)

let make_create_certificate_authority_audit_report_response ?s3_key:(s3_key_ : s3_key option)
    ?audit_report_id:(audit_report_id_ : audit_report_id option) () =
  ({ s3_key = s3_key_; audit_report_id = audit_report_id_ }
    : create_certificate_authority_audit_report_response)

let make_create_certificate_authority_audit_report_request
    ~audit_report_response_format:(audit_report_response_format_ : audit_report_response_format)
    ~s3_bucket_name:(s3_bucket_name_ : s3_bucket_name)
    ~certificate_authority_arn:(certificate_authority_arn_ : arn) () =
  ({
     audit_report_response_format = audit_report_response_format_;
     s3_bucket_name = s3_bucket_name_;
     certificate_authority_arn = certificate_authority_arn_;
   }
    : create_certificate_authority_audit_report_request)
