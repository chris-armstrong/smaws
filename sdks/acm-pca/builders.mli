open Types

val make_ocsp_configuration :
  ?ocsp_custom_cname:cname_string -> enabled:boolean_ -> unit -> ocsp_configuration

val make_crl_distribution_point_extension_configuration :
  omit_extension:boolean_ -> unit -> crl_distribution_point_extension_configuration

val make_crl_configuration :
  ?expiration_in_days:integer1_to5000 ->
  ?custom_cname:cname_string ->
  ?s3_bucket_name:s3_bucket_name3_to255 ->
  ?s3_object_acl:s3_object_acl ->
  ?crl_distribution_point_extension_configuration:crl_distribution_point_extension_configuration ->
  ?crl_type:crl_type ->
  ?custom_path:crl_path_string ->
  enabled:boolean_ ->
  unit ->
  crl_configuration

val make_revocation_configuration :
  ?crl_configuration:crl_configuration ->
  ?ocsp_configuration:ocsp_configuration ->
  unit ->
  revocation_configuration

val make_update_certificate_authority_request :
  ?revocation_configuration:revocation_configuration ->
  ?status:certificate_authority_status ->
  certificate_authority_arn:arn ->
  unit ->
  update_certificate_authority_request

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_untag_certificate_authority_request :
  certificate_authority_arn:arn -> tags:tag_list -> unit -> untag_certificate_authority_request

val make_tag_certificate_authority_request :
  certificate_authority_arn:arn -> tags:tag_list -> unit -> tag_certificate_authority_request

val make_revoke_certificate_request :
  certificate_authority_arn:arn ->
  certificate_serial:string128 ->
  revocation_reason:revocation_reason ->
  unit ->
  revoke_certificate_request

val make_restore_certificate_authority_request :
  certificate_authority_arn:arn -> unit -> restore_certificate_authority_request

val make_put_policy_request : resource_arn:arn -> policy:aws_policy -> unit -> put_policy_request
val make_list_tags_response : ?next_token:next_token -> ?tags:tag_list -> unit -> list_tags_response

val make_list_tags_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  certificate_authority_arn:arn ->
  unit ->
  list_tags_request

val make_permission :
  ?certificate_authority_arn:arn ->
  ?created_at:t_stamp ->
  ?principal:principal ->
  ?source_account:account_id ->
  ?actions:action_list ->
  ?policy:aws_policy ->
  unit ->
  permission

val make_list_permissions_response :
  ?next_token:next_token -> ?permissions:permission_list -> unit -> list_permissions_response

val make_list_permissions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  certificate_authority_arn:arn ->
  unit ->
  list_permissions_request

val make_edi_party_name : ?name_assigner:string256 -> party_name:string256 -> unit -> edi_party_name

val make_custom_attribute :
  object_identifier:custom_object_identifier -> value:string1_to256 -> unit -> custom_attribute

val make_asn1_subject :
  ?country:country_code_string ->
  ?organization:string64 ->
  ?organizational_unit:string64 ->
  ?distinguished_name_qualifier:asn1_printable_string64 ->
  ?state:string128 ->
  ?common_name:string64 ->
  ?serial_number:asn1_printable_string64 ->
  ?locality:string128 ->
  ?title:string64 ->
  ?surname:string40 ->
  ?given_name:string16 ->
  ?initials:string5 ->
  ?pseudonym:string128 ->
  ?generation_qualifier:string3 ->
  ?custom_attributes:custom_attribute_list ->
  unit ->
  asn1_subject

val make_other_name : type_id:custom_object_identifier -> value:string256 -> unit -> other_name

val make_general_name :
  ?other_name:other_name ->
  ?rfc822_name:string256 ->
  ?dns_name:string253 ->
  ?directory_name:asn1_subject ->
  ?edi_party_name:edi_party_name ->
  ?uniform_resource_identifier:string253 ->
  ?ip_address:string39 ->
  ?registered_id:custom_object_identifier ->
  unit ->
  general_name

val make_access_method :
  ?custom_object_identifier:custom_object_identifier ->
  ?access_method_type:access_method_type ->
  unit ->
  access_method

val make_access_description :
  access_method:access_method -> access_location:general_name -> unit -> access_description

val make_key_usage :
  ?digital_signature:boolean_ ->
  ?non_repudiation:boolean_ ->
  ?key_encipherment:boolean_ ->
  ?data_encipherment:boolean_ ->
  ?key_agreement:boolean_ ->
  ?key_cert_sign:boolean_ ->
  ?crl_sign:boolean_ ->
  ?encipher_only:boolean_ ->
  ?decipher_only:boolean_ ->
  unit ->
  key_usage

val make_csr_extensions :
  ?key_usage:key_usage ->
  ?subject_information_access:access_description_list ->
  unit ->
  csr_extensions

val make_certificate_authority_configuration :
  ?csr_extensions:csr_extensions ->
  key_algorithm:key_algorithm ->
  signing_algorithm:signing_algorithm ->
  subject:asn1_subject ->
  unit ->
  certificate_authority_configuration

val make_certificate_authority :
  ?arn:arn ->
  ?owner_account:account_id ->
  ?created_at:t_stamp ->
  ?last_state_change_at:t_stamp ->
  ?type_:certificate_authority_type ->
  ?serial:string_ ->
  ?status:certificate_authority_status ->
  ?not_before:t_stamp ->
  ?not_after:t_stamp ->
  ?failure_reason:failure_reason ->
  ?certificate_authority_configuration:certificate_authority_configuration ->
  ?revocation_configuration:revocation_configuration ->
  ?restorable_until:t_stamp ->
  ?key_storage_security_standard:key_storage_security_standard ->
  ?usage_mode:certificate_authority_usage_mode ->
  unit ->
  certificate_authority

val make_list_certificate_authorities_response :
  ?next_token:next_token ->
  ?certificate_authorities:certificate_authorities ->
  unit ->
  list_certificate_authorities_response

val make_list_certificate_authorities_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?resource_owner:resource_owner ->
  unit ->
  list_certificate_authorities_request

val make_issue_certificate_response : ?certificate_arn:arn -> unit -> issue_certificate_response
val make_validity : value:positive_long -> type_:validity_period_type -> unit -> validity

val make_custom_extension :
  ?critical:boolean_ ->
  object_identifier:custom_object_identifier ->
  value:base64_string1_to4096 ->
  unit ->
  custom_extension

val make_extended_key_usage :
  ?extended_key_usage_type:extended_key_usage_type ->
  ?extended_key_usage_object_identifier:custom_object_identifier ->
  unit ->
  extended_key_usage

val make_qualifier : cps_uri:string256 -> unit -> qualifier

val make_policy_qualifier_info :
  policy_qualifier_id:policy_qualifier_id -> qualifier:qualifier -> unit -> policy_qualifier_info

val make_policy_information :
  ?policy_qualifiers:policy_qualifier_info_list ->
  cert_policy_id:custom_object_identifier ->
  unit ->
  policy_information

val make_extensions :
  ?certificate_policies:certificate_policy_list ->
  ?extended_key_usage:extended_key_usage_list ->
  ?key_usage:key_usage ->
  ?subject_alternative_names:general_name_list ->
  ?custom_extensions:custom_extension_list ->
  unit ->
  extensions

val make_api_passthrough :
  ?extensions:extensions -> ?subject:asn1_subject -> unit -> api_passthrough

val make_issue_certificate_request :
  ?api_passthrough:api_passthrough ->
  ?template_arn:arn ->
  ?validity_not_before:validity ->
  ?idempotency_token:idempotency_token ->
  certificate_authority_arn:arn ->
  csr:csr_blob ->
  signing_algorithm:signing_algorithm ->
  validity:validity ->
  unit ->
  issue_certificate_request

val make_import_certificate_authority_certificate_request :
  ?certificate_chain:certificate_chain_blob ->
  certificate_authority_arn:arn ->
  certificate:certificate_body_blob ->
  unit ->
  import_certificate_authority_certificate_request

val make_get_policy_response : ?policy:aws_policy -> unit -> get_policy_response
val make_get_policy_request : resource_arn:arn -> unit -> get_policy_request

val make_get_certificate_authority_csr_response :
  ?csr:csr_body -> unit -> get_certificate_authority_csr_response

val make_get_certificate_authority_csr_request :
  certificate_authority_arn:arn -> unit -> get_certificate_authority_csr_request

val make_get_certificate_authority_certificate_response :
  ?certificate:certificate_body ->
  ?certificate_chain:certificate_chain ->
  unit ->
  get_certificate_authority_certificate_response

val make_get_certificate_authority_certificate_request :
  certificate_authority_arn:arn -> unit -> get_certificate_authority_certificate_request

val make_get_certificate_response :
  ?certificate:certificate_body ->
  ?certificate_chain:certificate_chain ->
  unit ->
  get_certificate_response

val make_get_certificate_request :
  certificate_authority_arn:arn -> certificate_arn:arn -> unit -> get_certificate_request

val make_describe_certificate_authority_audit_report_response :
  ?audit_report_status:audit_report_status ->
  ?s3_bucket_name:s3_bucket_name ->
  ?s3_key:s3_key ->
  ?created_at:t_stamp ->
  unit ->
  describe_certificate_authority_audit_report_response

val make_describe_certificate_authority_audit_report_request :
  certificate_authority_arn:arn ->
  audit_report_id:audit_report_id ->
  unit ->
  describe_certificate_authority_audit_report_request

val make_describe_certificate_authority_response :
  ?certificate_authority:certificate_authority -> unit -> describe_certificate_authority_response

val make_describe_certificate_authority_request :
  certificate_authority_arn:arn -> unit -> describe_certificate_authority_request

val make_delete_policy_request : resource_arn:arn -> unit -> delete_policy_request

val make_delete_permission_request :
  ?source_account:account_id ->
  certificate_authority_arn:arn ->
  principal:principal ->
  unit ->
  delete_permission_request

val make_delete_certificate_authority_request :
  ?permanent_deletion_time_in_days:permanent_deletion_time_in_days ->
  certificate_authority_arn:arn ->
  unit ->
  delete_certificate_authority_request

val make_create_permission_request :
  ?source_account:account_id ->
  certificate_authority_arn:arn ->
  principal:principal ->
  actions:action_list ->
  unit ->
  create_permission_request

val make_create_certificate_authority_audit_report_response :
  ?audit_report_id:audit_report_id ->
  ?s3_key:s3_key ->
  unit ->
  create_certificate_authority_audit_report_response

val make_create_certificate_authority_audit_report_request :
  certificate_authority_arn:arn ->
  s3_bucket_name:s3_bucket_name ->
  audit_report_response_format:audit_report_response_format ->
  unit ->
  create_certificate_authority_audit_report_request

val make_create_certificate_authority_response :
  ?certificate_authority_arn:arn -> unit -> create_certificate_authority_response

val make_create_certificate_authority_request :
  ?revocation_configuration:revocation_configuration ->
  ?idempotency_token:idempotency_token ->
  ?key_storage_security_standard:key_storage_security_standard ->
  ?tags:tag_list ->
  ?usage_mode:certificate_authority_usage_mode ->
  certificate_authority_configuration:certificate_authority_configuration ->
  certificate_authority_type:certificate_authority_type ->
  unit ->
  create_certificate_authority_request
