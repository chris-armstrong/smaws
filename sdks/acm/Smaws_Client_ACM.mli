(** ACM client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module CreateAcmeDomainValidation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_acme_domain_validation_request ->
    ( create_acme_domain_validation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_acme_domain_validation_request ->
    ( create_acme_domain_validation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a domain validation for an ACME endpoint. Domain validations authorize the endpoint to \
   issue certificates for specified domain names. You configure prevalidation to prove domain \
   ownership.\n"]

module CreateAcmeEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_acme_endpoint_request ->
    ( create_acme_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_acme_endpoint_request ->
    ( create_acme_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an ACME endpoint, which is a managed ACME server with a unique endpoint URL. After \
   creation, ACME clients can use the endpoint URL to automate certificate issuance using the ACME \
   protocol.\n"]

module CreateAcmeExternalAccountBinding : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_acme_external_account_binding_request ->
    ( create_acme_external_account_binding_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_acme_external_account_binding_request ->
    ( create_acme_external_account_binding_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an external account binding (EAB) for an ACME endpoint. An EAB provides credentials \
   that authorize an ACME client to register an account with the endpoint. Each EAB is associated \
   with an IAM role that controls what certificate operations the ACME client can perform.\n"]

module DeleteAcmeDomainValidation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_acme_domain_validation_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_acme_domain_validation_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a domain validation. After deletion, the ACME endpoint can no longer issue certificates \
   for the associated domain.\n"]

module DeleteAcmeEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_acme_endpoint_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_acme_endpoint_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an ACME endpoint. After deletion, the endpoint URL is no longer accessible and ACME \
   clients cannot issue certificates through it. Any existing external account bindings and domain \
   validations associated with the endpoint are also deleted.\n"]

module DeleteAcmeExternalAccountBinding : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_acme_external_account_binding_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_acme_external_account_binding_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an external account binding. Previously fetched credentials for this binding will no \
   longer be usable for account registration. A deleted binding cannot be recovered.\n"]

module DeleteCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InvalidArnException of invalid_arn_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InvalidArnException of invalid_arn_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InvalidArnException of invalid_arn_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a certificate and its associated private key. If this action succeeds, the certificate \
   is not available for use by Amazon Web Services services integrated with ACM. Deleting a \
   certificate is eventually consistent. The may be a short delay before the certificate no longer \
   appears in the list that can be displayed by calling the [ListCertificates] action or be \
   retrieved by calling the [GetCertificate] action.\n\n\
  \  You cannot delete an ACM certificate that is being used by another Amazon Web Services \
   service. To delete a certificate that is in use, you must first remove the certificate \
   association using the console or the CLI for the associated service.\n\
  \  \n\
  \   Deleting a certificate issued by a private certificate authority (CA) has no effect on the \
   CA. You will continue to be charged for the CA until it is deleted. For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/PCADeleteCA.html} Deleting Your \
   Private CA} in the {i Private Certificate Authority User Guide}.\n\
  \   \n\
  \    You cannot delete a certificate with a [CertificateKeyPairOrigin] of [ACME]. ACM \
   automatically deletes these certificates 1 year after they expire.\n\
  \    \n\
  \      Deleting a certificate issued by a private certificate authority (CA) has no effect on \
   the CA. You will continue to be charged for the CA until it is deleted. For more information, \
   see {{:https://docs.aws.amazon.com/privateca/latest/userguide/PCADeleteCA.html}Deleting your \
   private CA} in the {i Amazon Web Services Private Certificate Authority User Guide}.\n\
  \      "]

module DescribeAcmeAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_acme_account_request ->
    ( describe_acme_account_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_acme_account_request ->
    ( describe_acme_account_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns detailed metadata about the specified ACME account, including its status, public key \
   thumbprint, and associated external account binding.\n"]

module DescribeAcmeDomainValidation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_acme_domain_validation_request ->
    ( describe_acme_domain_validation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_acme_domain_validation_request ->
    ( describe_acme_domain_validation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns detailed metadata about the specified domain validation, including its status, domain \
   scope, and DNS resource records required for validation.\n"]

module DescribeAcmeEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_acme_endpoint_request ->
    ( describe_acme_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_acme_endpoint_request ->
    ( describe_acme_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns detailed metadata about the specified ACME endpoint, including its status, URL, \
   authorization behavior, and certificate authority configuration.\n"]

module DescribeAcmeExternalAccountBinding : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_acme_external_account_binding_request ->
    ( describe_acme_external_account_binding_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_acme_external_account_binding_request ->
    ( describe_acme_external_account_binding_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns detailed metadata about the specified external account binding, including the \
   associated IAM role, expiration time, and usage history.\n"]

module DescribeCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_certificate_request ->
    ( describe_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_certificate_request ->
    ( describe_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns detailed metadata about the specified ACM certificate.\n\n\
  \ If you have just created a certificate using the [RequestCertificate] action, there is a delay \
   of several seconds before you can retrieve information about it.\n\
  \ "]

module ExportCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `RequestInProgressException of request_in_progress_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_certificate_request ->
    ( export_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_certificate_request ->
    ( export_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Exports a private certificate issued by a private certificate authority (CA) or a public \
   certificate for use anywhere. The exported file contains the certificate, the certificate \
   chain, and the encrypted private key associated with the public key that is embedded in the \
   certificate. For security, you must assign a passphrase for the private key when exporting it. \
   \n\n\
  \ For information about exporting and formatting a certificate using the ACM console or CLI, see \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/export-private.html}Export a private \
   certificate} and \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/export-public-certificate}Export a public \
   certificate}.\n\
  \ \n\
  \   ACM public certificates created prior to June 17, 2025 cannot be exported.\n\
  \   \n\
  \    "]

module GetAccountConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( get_account_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( get_account_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the account configuration options associated with an Amazon Web Services account.\n"]

module GetAcmeExternalAccountBindingCredentials : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_acme_external_account_binding_credentials_request ->
    ( get_acme_external_account_binding_credentials_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_acme_external_account_binding_credentials_request ->
    ( get_acme_external_account_binding_credentials_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the key ID and MAC key credentials for an external account binding. These credentials \
   are used by ACME clients during account registration to bind to the endpoint.\n"]

module GetCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `RequestInProgressException of request_in_progress_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_certificate_request ->
    ( get_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_certificate_request ->
    ( get_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a certificate and its certificate chain. The certificate may be either a public or \
   private certificate issued using the ACM [RequestCertificate] action, or a certificate imported \
   into ACM using the [ImportCertificate] action. The chain consists of the certificate of the \
   issuing CA and the intermediate certificates of any other subordinate CAs. All of the \
   certificates are base64 encoded. You can use \
   {{:https://wiki.openssl.org/index.php/Command_Line_Utilities}OpenSSL} to decode the \
   certificates and inspect individual fields.\n"]

module ImportCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InvalidArnException of invalid_arn_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidTagException of invalid_tag_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagPolicyException of tag_policy_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_certificate_request ->
    ( import_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagException of invalid_tag_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagPolicyException of tag_policy_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_certificate_request ->
    ( import_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagException of invalid_tag_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagPolicyException of tag_policy_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Imports a certificate into Certificate Manager (ACM) to use with services that are integrated \
   with ACM. Note that \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-services.html}integrated services} \
   allow only certificate types and keys they support to be associated with their resources. \
   Further, their support differs depending on whether the certificate is imported into IAM or \
   into ACM. For more information, see the documentation for each service. For more information \
   about importing certificates into ACM, see \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html}Importing \
   Certificates} in the {i Certificate Manager User Guide}. \n\n\
  \  ACM does not provide \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal} for \
   certificates that you import.\n\
  \  \n\
  \    Note the following guidelines when importing third party certificates:\n\
  \    \n\
  \     {ul\n\
  \           {-  You must enter the private key that matches the certificate you are importing.\n\
  \               \n\
  \                }\n\
  \           {-  The private key must be unencrypted. You cannot import a private key that is \
   protected by a password or a passphrase.\n\
  \               \n\
  \                }\n\
  \           {-  The private key must be no larger than 5 KB (5,120 bytes).\n\
  \               \n\
  \                }\n\
  \           {-  The certificate, private key, and certificate chain must be PEM-encoded.\n\
  \               \n\
  \                }\n\
  \           {-  The current time must be between the [Not Before] and [Not After] certificate \
   fields.\n\
  \               \n\
  \                }\n\
  \           {-  The [Issuer] field must not be empty.\n\
  \               \n\
  \                }\n\
  \           {-  The OCSP authority URL, if present, must not exceed 1000 characters.\n\
  \               \n\
  \                }\n\
  \           {-  To import a new certificate, omit the [CertificateArn] argument. Include this \
   argument only when you want to replace a previously imported certificate.\n\
  \               \n\
  \                }\n\
  \           {-  When you import a certificate by using the CLI, you must specify the \
   certificate, the certificate chain, and the private key by their file names preceded by \
   [fileb://]. For example, you can specify a certificate saved in the [C:\\temp] folder as \
   [fileb://C:\\temp\\certificate_to_import.pem]. If you are making an HTTP or HTTPS Query \
   request, include these arguments as BLOBs. \n\
  \               \n\
  \                }\n\
  \           {-  When you import a certificate by using an SDK, you must specify the certificate, \
   the certificate chain, and the private key files in the manner required by the programming \
   language you're using. \n\
  \               \n\
  \                }\n\
  \           {-  The cryptographic algorithm of an imported certificate must match the algorithm \
   of the signing CA. For example, if the signing CA key type is RSA, then the certificate key \
   type must also be RSA.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   This operation returns the \
   {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource \
   Name (ARN)} of the imported certificate.\n\
  \   "]

module ListAcmeAccounts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_acme_accounts_request ->
    ( list_acme_accounts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_acme_accounts_request ->
    ( list_acme_accounts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of ACME accounts registered with the specified ACME endpoint. ACME accounts \
   are created when clients use external account binding credentials to register.\n"]

module ListAcmeDomainValidations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_acme_domain_validations_request ->
    ( list_acme_domain_validations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_acme_domain_validations_request ->
    ( list_acme_domain_validations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of domain validations for the specified ACME endpoint.\n"]

module ListAcmeEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_acme_endpoints_request ->
    ( list_acme_endpoints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_acme_endpoints_request ->
    ( list_acme_endpoints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of ACME endpoints in your account. Use this operation to view all configured \
   ACME endpoints and their current status.\n"]

module ListAcmeExternalAccountBindings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_acme_external_account_bindings_request ->
    ( list_acme_external_account_bindings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_acme_external_account_bindings_request ->
    ( list_acme_external_account_bindings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of external account bindings for the specified ACME endpoint.\n"]

module ListCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgsException of invalid_args_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_certificates_request ->
    ( list_certificates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgsException of invalid_args_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_certificates_request ->
    ( list_certificates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgsException of invalid_args_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of certificate ARNs and domain names. You can request that only certificates \
   that match a specific status be listed. You can also filter by specific attributes of the \
   certificate. Default filtering returns only [RSA_2048] certificates. For more information, see \
   [Filters].\n\n\
  \  By default, this action does not return certificates with a [CertificateKeyPairOrigin] of \
   [ACME]. To include ACME certificates, specify [ACME] in the [CertificateKeyPairOrigins] filter.\n\
  \  \n\
  \   "]

module ListTagsForCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_certificate_request ->
    ( list_tags_for_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_certificate_request ->
    ( list_tags_for_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags that have been applied to the ACM certificate. Use the certificate's Amazon \
   Resource Name (ARN) to specify the certificate. To add a tag to an ACM certificate, use the \
   [AddTagsToCertificate] action. To delete a tag, use the [RemoveTagsFromCertificate] action. \n\n\
  \  This action applies only to the [certificate] resource type. For all other ACM resource \
   types, use [ListTagsForResource] instead.\n\
  \  \n\
  \   "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags associated with an ACM resource.\n\n\
  \  Use this action for all ACM resource types except the [certificate] resource type. For \
   certificate resources, use [ListTagsForCertificate] instead.\n\
  \  \n\
  \    To add one or more tags, use the [TagResource] action. To remove one or more tags, use the \
   [UntagResource] action.\n\
  \    "]

module PutAccountConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_account_configuration_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_account_configuration_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or modifies account-level configurations in ACM. \n\n\
  \ The supported configuration option is [DaysBeforeExpiry]. This option specifies the number of \
   days prior to certificate expiration when ACM starts generating [EventBridge] events. ACM sends \
   one event per day per certificate until the certificate expires. By default, accounts receive \
   events starting 45 days before certificate expiration.\n\
  \ "]

module RemoveTagsFromCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidTagException of invalid_tag_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagPolicyException of tag_policy_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagException of invalid_tag_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagPolicyException of tag_policy_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagException of invalid_tag_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagPolicyException of tag_policy_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Remove one or more tags from an ACM certificate. A tag consists of a key-value pair. If you do \
   not specify the value portion of the tag when calling this function, the tag will be removed \
   regardless of value. If you specify a value, the tag is removed only if it is associated with \
   the specified value. \n\n\
  \  This action applies only to the [certificate] resource type. For all other ACM resource \
   types, use [UntagResource] instead.\n\
  \  \n\
  \    To add tags to a certificate, use the [AddTagsToCertificate] action. To view all of the \
   tags that have been applied to a specific ACM certificate, use the [ListTagsForCertificate] \
   action. \n\
  \    "]

module RenewCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `RequestInProgressException of request_in_progress_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    renew_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    renew_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Renews an {{:https://docs.aws.amazon.com/acm/latest/userguide/managed-renewal.html}eligible ACM \
   certificate}. In order to renew your Amazon Web Services Private CA certificates with ACM, you \
   must first \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/assign-permissions.html#PcaPermissions}grant \
   the ACM service principal permission to do so}. For more information, see \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/managed-renewal.html}Testing Managed \
   Renewal} in the ACM User Guide.\n"]

module RequestCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidTagException of invalid_tag_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TagPolicyException of tag_policy_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    request_certificate_request ->
    ( request_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagException of invalid_tag_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TagPolicyException of tag_policy_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    request_certificate_request ->
    ( request_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagException of invalid_tag_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TagPolicyException of tag_policy_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Requests an ACM certificate for use with other Amazon Web Services services. To request an ACM \
   certificate, you must specify a fully qualified domain name (FQDN) in the [DomainName] \
   parameter. You can also specify additional FQDNs in the [SubjectAlternativeNames] parameter. \n\n\
  \ If you are requesting a private certificate, domain validation is not required. If you are \
   requesting a public certificate, each domain name that you specify must be validated to verify \
   that you own or control the domain. You can use \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html}DNS validation} or \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-email.html}email \
   validation}. We recommend that you use DNS validation.\n\
  \ \n\
  \   ACM behavior differs from the \
   {{:https://datatracker.ietf.org/doc/html/rfc6125#appendix-B.2}RFC 6125} specification of the \
   certificate validation process. ACM first checks for a Subject Alternative Name, and, if it \
   finds one, ignores the common name (CN).\n\
  \   \n\
  \     After successful completion of the [RequestCertificate] action, there is a delay of \
   several seconds before you can retrieve information about the new certificate.\n\
  \     "]

module ResendValidationEmail : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resend_validation_email_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    resend_validation_email_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Resends the email that requests domain ownership validation. The domain owner or an authorized \
   representative must approve the ACM certificate before it can be issued. The certificate can be \
   approved by clicking a link in the mail to navigate to the Amazon certificate approval website \
   and then clicking {b I Approve}. However, the validation email can be blocked by spam filters. \
   Therefore, if you do not receive the original mail, you can request that the mail be resent \
   within 72 hours of requesting the ACM certificate. If more than 72 hours have elapsed since \
   your original request or since your last attempt to resend validation mail, you must request a \
   new certificate. For more information about setting up your contact email addresses, see \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/setup-email.html}Configure Email for your \
   Domain}. \n"]

module RevokeAcmeAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    revoke_acme_account_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    revoke_acme_account_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Revokes an ACME account, preventing it from requesting or revoking certificates. This operation \
   is irreversible.\n"]

module RevokeAcmeExternalAccountBinding : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    revoke_acme_external_account_binding_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    revoke_acme_external_account_binding_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Revokes an external account binding, preventing new ACME accounts from being registered using \
   this binding. Existing ACME accounts that were previously registered using the binding are not \
   affected and must be revoked separately.\n"]

module RevokeCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InvalidArnException of invalid_arn_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    revoke_certificate_request ->
    ( revoke_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InvalidArnException of invalid_arn_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    revoke_certificate_request ->
    ( revoke_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InvalidArnException of invalid_arn_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Revokes a public ACM certificate. You can only revoke certificates that have been previously \
   exported.\n\n\
  \  Once a certificate is revoked, you cannot reuse the certificate. Revoking a certificate is \
   permanent.\n\
  \  \n\
  \   "]

module SearchCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_certificates_request ->
    ( search_certificates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_certificates_request ->
    ( search_certificates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of certificates matching search criteria. You can filter certificates by X.509 \
   attributes and ACM specific properties like certificate status, type and renewal eligibility. \
   This operation provides more flexible filtering than [ListCertificates] by supporting complex \
   filter statements.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more tags to an ACM resource. Tags are labels that you can use to identify and \
   organize your Amazon Web Services resources. Each tag consists of a [key] and an optional \
   [value].\n\n\
  \  Use this action for all ACM resource types except the [certificate] resource type. For \
   certificate resources, use [AddTagsToCertificate] instead.\n\
  \  \n\
  \    To remove one or more tags, use the [UntagResource] action. To view all of the tags that \
   have been applied to a resource, use the [ListTagsForResource] action.\n\
  \    "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes one or more tags from an ACM resource.\n\n\
  \  Use this action for all ACM resource types except the [certificate] resource type. For \
   certificate resources, use [RemoveTagsFromCertificate] instead.\n\
  \  \n\
  \    To add one or more tags, use the [TagResource] action. To view all of the tags that have \
   been applied to a resource, use the [ListTagsForResource] action.\n\
  \    "]

module UpdateAcmeDomainValidation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_acme_domain_validation_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_acme_domain_validation_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the prevalidation configuration of an existing domain validation.\n"]

module UpdateAcmeEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_acme_endpoint_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_acme_endpoint_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of an existing ACME endpoint. You can change the authorization \
   behavior, contact requirement, or certificate authority settings.\n"]

module UpdateCertificateOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidStateException of invalid_state_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_certificate_options_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_certificate_options_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a certificate. You can use this function to specify whether to export your certificate. \
   Certificate transparency logging opt-out is no longer available. For more information, see \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-concepts.html#concept-transparency}Certificate \
   Transparency Logging} and \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-exportable-certificates.html}Certificate \
   Manager Exportable Managed Certificates}.\n"]

(** {1:Serialization and Deserialization} *)
module AddTagsToCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidTagException of invalid_tag_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagPolicyException of tag_policy_exception
    | `ThrottlingException of throttling_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagException of invalid_tag_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagPolicyException of tag_policy_exception
      | `ThrottlingException of throttling_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagException of invalid_tag_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagPolicyException of tag_policy_exception
      | `ThrottlingException of throttling_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more tags to an ACM certificate. Tags are labels that you can use to identify and \
   organize your Amazon Web Services resources. Each tag consists of a [key] and an optional \
   [value]. You specify the certificate on input by its Amazon Resource Name (ARN). You specify \
   the tag by using a key-value pair. \n\n\
  \  This action applies only to the [certificate] resource type. For all other ACM resource \
   types, use [TagResource] instead.\n\
  \  \n\
  \    You can apply a tag to just one certificate if you want to identify a specific \
   characteristic of that certificate, or you can apply the same tag to multiple certificates if \
   you want to filter for a common relationship among those certificates. Similarly, you can apply \
   the same tag to multiple resources if you want to specify a relationship among those resources. \
   For example, you can add the same tag to an ACM certificate and an Elastic Load Balancing load \
   balancer to indicate that they are both used by the same website. For more information, see \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/tags.html}Tagging ACM certificates}. \n\
  \    \n\
  \     To remove one or more tags, use the [RemoveTagsFromCertificate] action. To view all of the \
   tags that have been applied to the certificate, use the [ListTagsForCertificate] action. \n\
  \     "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
