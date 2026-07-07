open Types

val make_validity : type_:validity_period_type -> value:positive_long -> unit -> validity

val make_crl_distribution_point_extension_configuration :
  omit_extension:boolean_ -> unit -> crl_distribution_point_extension_configuration

val make_crl_configuration :
  ?custom_path:crl_path_string ->
  ?crl_type:crl_type ->
  ?crl_distribution_point_extension_configuration:crl_distribution_point_extension_configuration ->
  ?s3_object_acl:s3_object_acl ->
  ?s3_bucket_name:s3_bucket_name3_to255 ->
  ?custom_cname:cname_string ->
  ?expiration_in_days:integer1_to5000 ->
  enabled:boolean_ ->
  unit ->
  crl_configuration

val make_ocsp_configuration :
  ?ocsp_custom_cname:cname_string -> enabled:boolean_ -> unit -> ocsp_configuration

val make_revocation_configuration :
  ?ocsp_configuration:ocsp_configuration ->
  ?crl_configuration:crl_configuration ->
  unit ->
  revocation_configuration

val make_update_certificate_authority_request :
  ?status:certificate_authority_status ->
  ?revocation_configuration:revocation_configuration ->
  certificate_authority_arn:arn ->
  unit ->
  update_certificate_authority_request

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_untag_certificate_authority_request :
  tags:tag_list -> certificate_authority_arn:arn -> unit -> untag_certificate_authority_request

val make_tag_certificate_authority_request :
  tags:tag_list -> certificate_authority_arn:arn -> unit -> tag_certificate_authority_request

val make_revoke_certificate_request :
  revocation_reason:revocation_reason ->
  certificate_serial:string128 ->
  certificate_authority_arn:arn ->
  unit ->
  revoke_certificate_request

val make_restore_certificate_authority_request :
  certificate_authority_arn:arn -> unit -> restore_certificate_authority_request

val make_qualifier : cps_uri:string256 -> unit -> qualifier
val make_put_policy_request : policy:aws_policy -> resource_arn:arn -> unit -> put_policy_request

val make_policy_qualifier_info :
  qualifier:qualifier -> policy_qualifier_id:policy_qualifier_id -> unit -> policy_qualifier_info

val make_policy_information :
  ?policy_qualifiers:policy_qualifier_info_list ->
  cert_policy_id:custom_object_identifier ->
  unit ->
  policy_information

val make_permission :
  ?policy:aws_policy ->
  ?actions:action_list ->
  ?source_account:account_id ->
  ?principal:principal ->
  ?created_at:t_stamp ->
  ?certificate_authority_arn:arn ->
  unit ->
  permission

val make_other_name : value:string256 -> type_id:custom_object_identifier -> unit -> other_name
val make_list_tags_response : ?tags:tag_list -> ?next_token:next_token -> unit -> list_tags_response

val make_list_tags_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  certificate_authority_arn:arn ->
  unit ->
  list_tags_request

val make_list_permissions_response :
  ?permissions:permission_list -> ?next_token:next_token -> unit -> list_permissions_response

val make_list_permissions_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  certificate_authority_arn:arn ->
  unit ->
  list_permissions_request

val make_custom_attribute :
  value:string1_to256 -> object_identifier:custom_object_identifier -> unit -> custom_attribute

val make_asn1_subject :
  ?custom_attributes:custom_attribute_list ->
  ?generation_qualifier:string3 ->
  ?pseudonym:string128 ->
  ?initials:string5 ->
  ?given_name:string16 ->
  ?surname:string40 ->
  ?title:string64 ->
  ?locality:string128 ->
  ?serial_number:asn1_printable_string64 ->
  ?common_name:string64 ->
  ?state:string128 ->
  ?distinguished_name_qualifier:asn1_printable_string64 ->
  ?organizational_unit:string64 ->
  ?organization:string64 ->
  ?country:country_code_string ->
  unit ->
  asn1_subject

val make_key_usage :
  ?decipher_only:boolean_ ->
  ?encipher_only:boolean_ ->
  ?crl_sign:boolean_ ->
  ?key_cert_sign:boolean_ ->
  ?key_agreement:boolean_ ->
  ?data_encipherment:boolean_ ->
  ?key_encipherment:boolean_ ->
  ?non_repudiation:boolean_ ->
  ?digital_signature:boolean_ ->
  unit ->
  key_usage

val make_access_method :
  ?access_method_type:access_method_type ->
  ?custom_object_identifier:custom_object_identifier ->
  unit ->
  access_method

val make_edi_party_name : ?name_assigner:string256 -> party_name:string256 -> unit -> edi_party_name

val make_general_name :
  ?registered_id:custom_object_identifier ->
  ?ip_address:string39 ->
  ?uniform_resource_identifier:string253 ->
  ?edi_party_name:edi_party_name ->
  ?directory_name:asn1_subject ->
  ?dns_name:string253 ->
  ?rfc822_name:string256 ->
  ?other_name:other_name ->
  unit ->
  general_name

val make_access_description :
  access_location:general_name -> access_method:access_method -> unit -> access_description

val make_csr_extensions :
  ?subject_information_access:access_description_list ->
  ?key_usage:key_usage ->
  unit ->
  csr_extensions

val make_certificate_authority_configuration :
  ?csr_extensions:csr_extensions ->
  subject:asn1_subject ->
  signing_algorithm:signing_algorithm ->
  key_algorithm:key_algorithm ->
  unit ->
  certificate_authority_configuration

val make_certificate_authority :
  ?usage_mode:certificate_authority_usage_mode ->
  ?key_storage_security_standard:key_storage_security_standard ->
  ?restorable_until:t_stamp ->
  ?revocation_configuration:revocation_configuration ->
  ?certificate_authority_configuration:certificate_authority_configuration ->
  ?failure_reason:failure_reason ->
  ?not_after:t_stamp ->
  ?not_before:t_stamp ->
  ?status:certificate_authority_status ->
  ?serial:string_ ->
  ?type_:certificate_authority_type ->
  ?last_state_change_at:t_stamp ->
  ?created_at:t_stamp ->
  ?owner_account:account_id ->
  ?arn:arn ->
  unit ->
  certificate_authority

val make_list_certificate_authorities_response :
  ?certificate_authorities:certificate_authorities ->
  ?next_token:next_token ->
  unit ->
  list_certificate_authorities_response

val make_list_certificate_authorities_request :
  ?resource_owner:resource_owner ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_certificate_authorities_request

val make_issue_certificate_response : ?certificate_arn:arn -> unit -> issue_certificate_response

val make_extended_key_usage :
  ?extended_key_usage_object_identifier:custom_object_identifier ->
  ?extended_key_usage_type:extended_key_usage_type ->
  unit ->
  extended_key_usage

val make_custom_extension :
  ?critical:boolean_ ->
  value:base64_string1_to4096 ->
  object_identifier:custom_object_identifier ->
  unit ->
  custom_extension

val make_extensions :
  ?custom_extensions:custom_extension_list ->
  ?subject_alternative_names:general_name_list ->
  ?key_usage:key_usage ->
  ?extended_key_usage:extended_key_usage_list ->
  ?certificate_policies:certificate_policy_list ->
  unit ->
  extensions

val make_api_passthrough :
  ?subject:asn1_subject -> ?extensions:extensions -> unit -> api_passthrough

val make_issue_certificate_request :
  ?idempotency_token:idempotency_token ->
  ?validity_not_before:validity ->
  ?template_arn:arn ->
  ?api_passthrough:api_passthrough ->
  validity:validity ->
  signing_algorithm:signing_algorithm ->
  csr:csr_blob ->
  certificate_authority_arn:arn ->
  unit ->
  issue_certificate_request

val make_import_certificate_authority_certificate_request :
  ?certificate_chain:certificate_chain_blob ->
  certificate:certificate_body_blob ->
  certificate_authority_arn:arn ->
  unit ->
  import_certificate_authority_certificate_request

val make_get_policy_response : ?policy:aws_policy -> unit -> get_policy_response
val make_get_policy_request : resource_arn:arn -> unit -> get_policy_request

val make_get_certificate_response :
  ?certificate_chain:certificate_chain ->
  ?certificate:certificate_body ->
  unit ->
  get_certificate_response

val make_get_certificate_request :
  certificate_arn:arn -> certificate_authority_arn:arn -> unit -> get_certificate_request

val make_get_certificate_authority_csr_response :
  ?csr:csr_body -> unit -> get_certificate_authority_csr_response

val make_get_certificate_authority_csr_request :
  certificate_authority_arn:arn -> unit -> get_certificate_authority_csr_request

val make_get_certificate_authority_certificate_response :
  ?certificate_chain:certificate_chain ->
  ?certificate:certificate_body ->
  unit ->
  get_certificate_authority_certificate_response

val make_get_certificate_authority_certificate_request :
  certificate_authority_arn:arn -> unit -> get_certificate_authority_certificate_request

val make_describe_certificate_authority_response :
  ?certificate_authority:certificate_authority -> unit -> describe_certificate_authority_response

val make_describe_certificate_authority_request :
  certificate_authority_arn:arn -> unit -> describe_certificate_authority_request

val make_describe_certificate_authority_audit_report_response :
  ?created_at:t_stamp ->
  ?s3_key:s3_key ->
  ?s3_bucket_name:s3_bucket_name ->
  ?audit_report_status:audit_report_status ->
  unit ->
  describe_certificate_authority_audit_report_response

val make_describe_certificate_authority_audit_report_request :
  audit_report_id:audit_report_id ->
  certificate_authority_arn:arn ->
  unit ->
  describe_certificate_authority_audit_report_request

val make_delete_policy_request : resource_arn:arn -> unit -> delete_policy_request

val make_delete_permission_request :
  ?source_account:account_id ->
  principal:principal ->
  certificate_authority_arn:arn ->
  unit ->
  delete_permission_request

val make_delete_certificate_authority_request :
  ?permanent_deletion_time_in_days:permanent_deletion_time_in_days ->
  certificate_authority_arn:arn ->
  unit ->
  delete_certificate_authority_request

val make_create_permission_request :
  ?source_account:account_id ->
  actions:action_list ->
  principal:principal ->
  certificate_authority_arn:arn ->
  unit ->
  create_permission_request

val make_create_certificate_authority_response :
  ?certificate_authority_arn:arn -> unit -> create_certificate_authority_response

val make_create_certificate_authority_request :
  ?usage_mode:certificate_authority_usage_mode ->
  ?tags:tag_list ->
  ?key_storage_security_standard:key_storage_security_standard ->
  ?idempotency_token:idempotency_token ->
  ?revocation_configuration:revocation_configuration ->
  certificate_authority_type:certificate_authority_type ->
  certificate_authority_configuration:certificate_authority_configuration ->
  unit ->
  create_certificate_authority_request

val make_create_certificate_authority_audit_report_response :
  ?s3_key:s3_key ->
  ?audit_report_id:audit_report_id ->
  unit ->
  create_certificate_authority_audit_report_response

val make_create_certificate_authority_audit_report_request :
  audit_report_response_format:audit_report_response_format ->
  s3_bucket_name:s3_bucket_name ->
  certificate_authority_arn:arn ->
  unit ->
  create_certificate_authority_audit_report_request
