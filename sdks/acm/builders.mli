open Smaws_Lib
open Types
val make_certificate_options :
  ?certificate_transparency_logging_preference:certificate_transparency_logging_preference
    -> unit -> certificate_options
val make_update_certificate_options_request :
  options:certificate_options ->
    certificate_arn:string -> unit -> update_certificate_options_request
val make_tag : ?value:string -> key:string -> unit -> tag
val make_resource_record :
  value:string -> type_:record_type -> name:string -> unit -> resource_record
val make_resend_validation_email_request :
  validation_domain:string ->
    domain:string ->
      certificate_arn:string -> unit -> resend_validation_email_request
val make_request_certificate_response :
  ?certificate_arn:string -> unit -> request_certificate_response
val make_domain_validation_option :
  validation_domain:string ->
    domain_name:string -> unit -> domain_validation_option
val make_request_certificate_request :
  ?key_algorithm:key_algorithm ->
    ?tags:tag list ->
      ?certificate_authority_arn:string ->
        ?options:certificate_options ->
          ?domain_validation_options:domain_validation_option list ->
            ?idempotency_token:string ->
              ?subject_alternative_names:string list ->
                ?validation_method:validation_method ->
                  domain_name:string -> unit -> request_certificate_request
val make_domain_validation :
  ?validation_method:validation_method ->
    ?resource_record:resource_record ->
      ?validation_status:domain_status ->
        ?validation_domain:string ->
          ?validation_emails:string list ->
            domain_name:string -> unit -> domain_validation
val make_renewal_summary :
  ?renewal_status_reason:failure_reason ->
    updated_at:CoreTypes.Timestamp.t ->
      domain_validation_options:domain_validation list ->
        renewal_status:renewal_status -> unit -> renewal_summary
val make_renew_certificate_request :
  certificate_arn:string -> unit -> renew_certificate_request
val make_remove_tags_from_certificate_request :
  tags:tag list ->
    certificate_arn:string -> unit -> remove_tags_from_certificate_request
val make_expiry_events_configuration :
  ?days_before_expiry:int -> unit -> expiry_events_configuration
val make_put_account_configuration_request :
  ?expiry_events:expiry_events_configuration ->
    idempotency_token:string -> unit -> put_account_configuration_request
val make_list_tags_for_certificate_response :
  ?tags:tag list -> unit -> list_tags_for_certificate_response
val make_list_tags_for_certificate_request :
  certificate_arn:string -> unit -> list_tags_for_certificate_request
val make_certificate_summary :
  ?revoked_at:CoreTypes.Timestamp.t ->
    ?imported_at:CoreTypes.Timestamp.t ->
      ?issued_at:CoreTypes.Timestamp.t ->
        ?created_at:CoreTypes.Timestamp.t ->
          ?not_after:CoreTypes.Timestamp.t ->
            ?not_before:CoreTypes.Timestamp.t ->
              ?renewal_eligibility:renewal_eligibility ->
                ?exported:bool ->
                  ?in_use:bool ->
                    ?extended_key_usages:extended_key_usage_name list ->
                      ?key_usages:key_usage_name list ->
                        ?key_algorithm:key_algorithm ->
                          ?type_:certificate_type ->
                            ?status:certificate_status ->
                              ?has_additional_subject_alternative_names:bool
                                ->
                                ?subject_alternative_name_summaries:string
                                  list ->
                                  ?domain_name:string ->
                                    ?certificate_arn:string ->
                                      unit -> certificate_summary
val make_list_certificates_response :
  ?certificate_summary_list:certificate_summary list ->
    ?next_token:string -> unit -> list_certificates_response
val make_filters :
  ?key_types:key_algorithm list ->
    ?key_usage:key_usage_name list ->
      ?extended_key_usage:extended_key_usage_name list -> unit -> filters
val make_list_certificates_request :
  ?sort_order:sort_order ->
    ?sort_by:sort_by ->
      ?max_items:int ->
        ?next_token:string ->
          ?includes:filters ->
            ?certificate_statuses:certificate_status list ->
              unit -> list_certificates_request
val make_key_usage : ?name:key_usage_name -> unit -> key_usage
val make_import_certificate_response :
  ?certificate_arn:string -> unit -> import_certificate_response
val make_import_certificate_request :
  ?tags:tag list ->
    ?certificate_chain:bytes ->
      ?certificate_arn:string ->
        private_key:bytes ->
          certificate:bytes -> unit -> import_certificate_request
val make_get_certificate_response :
  ?certificate_chain:string ->
    ?certificate:string -> unit -> get_certificate_response
val make_get_certificate_request :
  certificate_arn:string -> unit -> get_certificate_request
val make_get_account_configuration_response :
  ?expiry_events:expiry_events_configuration ->
    unit -> get_account_configuration_response
val make_extended_key_usage :
  ?oi_d:string -> ?name:extended_key_usage_name -> unit -> extended_key_usage
val make_export_certificate_response :
  ?private_key:string ->
    ?certificate_chain:string ->
      ?certificate:string -> unit -> export_certificate_response
val make_export_certificate_request :
  passphrase:bytes ->
    certificate_arn:string -> unit -> export_certificate_request
val make_certificate_detail :
  ?options:certificate_options ->
    ?renewal_eligibility:renewal_eligibility ->
      ?certificate_authority_arn:string ->
        ?extended_key_usages:extended_key_usage list ->
          ?key_usages:key_usage list ->
            ?renewal_summary:renewal_summary ->
              ?type_:certificate_type ->
                ?failure_reason:failure_reason ->
                  ?in_use_by:string list ->
                    ?signature_algorithm:string ->
                      ?key_algorithm:key_algorithm ->
                        ?not_after:CoreTypes.Timestamp.t ->
                          ?not_before:CoreTypes.Timestamp.t ->
                            ?revocation_reason:revocation_reason ->
                              ?revoked_at:CoreTypes.Timestamp.t ->
                                ?status:certificate_status ->
                                  ?imported_at:CoreTypes.Timestamp.t ->
                                    ?issued_at:CoreTypes.Timestamp.t ->
                                      ?created_at:CoreTypes.Timestamp.t ->
                                        ?issuer:string ->
                                          ?subject:string ->
                                            ?serial:string ->
                                              ?domain_validation_options:domain_validation
                                                list ->
                                                ?subject_alternative_names:string
                                                  list ->
                                                  ?domain_name:string ->
                                                    ?certificate_arn:string
                                                      ->
                                                      unit ->
                                                        certificate_detail
val make_describe_certificate_response :
  ?certificate:certificate_detail -> unit -> describe_certificate_response
val make_describe_certificate_request :
  certificate_arn:string -> unit -> describe_certificate_request
val make_delete_certificate_request :
  certificate_arn:string -> unit -> delete_certificate_request
val make_add_tags_to_certificate_request :
  tags:tag list ->
    certificate_arn:string -> unit -> add_tags_to_certificate_request