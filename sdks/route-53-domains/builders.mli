open Types

val make_billing_record :
  ?price:price ->
  ?bill_date:timestamp ->
  ?invoice_id:invoice_id ->
  ?operation:operation_type ->
  ?domain_name:domain_name ->
  unit ->
  billing_record

val make_view_billing_response :
  ?billing_records:billing_records -> ?next_page_marker:page_marker -> unit -> view_billing_response

val make_view_billing_request :
  ?max_items:page_max_items ->
  ?marker:page_marker ->
  ?end_:timestamp ->
  ?start:timestamp ->
  unit ->
  view_billing_request

val make_update_tags_for_domain_response : unit -> unit
val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag

val make_update_tags_for_domain_request :
  ?tags_to_update:tag_list -> domain_name:domain_name -> unit -> update_tags_for_domain_request

val make_update_domain_nameservers_response :
  ?operation_id:operation_id -> unit -> update_domain_nameservers_response

val make_nameserver : ?glue_ips:glue_ip_list -> name:host_name -> unit -> nameserver

val make_update_domain_nameservers_request :
  ?fi_auth_key:fi_auth_key ->
  nameservers:nameserver_list ->
  domain_name:domain_name ->
  unit ->
  update_domain_nameservers_request

val make_update_domain_contact_response :
  ?operation_id:operation_id -> unit -> update_domain_contact_response

val make_extra_param : value:extra_param_value -> name:extra_param_name -> unit -> extra_param

val make_contact_detail :
  ?extra_params:extra_param_list ->
  ?fax:contact_number ->
  ?email:email ->
  ?phone_number:contact_number ->
  ?zip_code:zip_code ->
  ?country_code:country_code ->
  ?state:state ->
  ?city:city ->
  ?address_line2:address_line ->
  ?address_line1:address_line ->
  ?organization_name:contact_name ->
  ?contact_type:contact_type ->
  ?last_name:contact_name ->
  ?first_name:contact_name ->
  unit ->
  contact_detail

val make_consent : currency:currency -> max_price:price -> unit -> consent

val make_update_domain_contact_request :
  ?billing_contact:contact_detail ->
  ?consent:consent ->
  ?tech_contact:contact_detail ->
  ?registrant_contact:contact_detail ->
  ?admin_contact:contact_detail ->
  domain_name:domain_name ->
  unit ->
  update_domain_contact_request

val make_update_domain_contact_privacy_response :
  ?operation_id:operation_id -> unit -> update_domain_contact_privacy_response

val make_update_domain_contact_privacy_request :
  ?billing_privacy:boolean_ ->
  ?tech_privacy:boolean_ ->
  ?registrant_privacy:boolean_ ->
  ?admin_privacy:boolean_ ->
  domain_name:domain_name ->
  unit ->
  update_domain_contact_privacy_request

val make_transfer_domain_to_another_aws_account_response :
  ?password:password ->
  ?operation_id:operation_id ->
  unit ->
  transfer_domain_to_another_aws_account_response

val make_transfer_domain_to_another_aws_account_request :
  account_id:account_id ->
  domain_name:domain_name ->
  unit ->
  transfer_domain_to_another_aws_account_request

val make_transfer_domain_response : ?operation_id:operation_id -> unit -> transfer_domain_response

val make_transfer_domain_request :
  ?privacy_protect_billing_contact:boolean_ ->
  ?billing_contact:contact_detail ->
  ?privacy_protect_tech_contact:boolean_ ->
  ?privacy_protect_registrant_contact:boolean_ ->
  ?privacy_protect_admin_contact:boolean_ ->
  ?auto_renew:boolean_ ->
  ?auth_code:domain_auth_code ->
  ?nameservers:nameserver_list ->
  ?duration_in_years:duration_in_years ->
  ?idn_lang_code:lang_code ->
  tech_contact:contact_detail ->
  registrant_contact:contact_detail ->
  admin_contact:contact_detail ->
  domain_name:domain_name ->
  unit ->
  transfer_domain_request

val make_sort_condition :
  sort_order:sort_order -> name:list_domains_attribute_name -> unit -> sort_condition

val make_retrieve_domain_auth_code_response :
  ?auth_code:domain_auth_code -> unit -> retrieve_domain_auth_code_response

val make_retrieve_domain_auth_code_request :
  domain_name:domain_name -> unit -> retrieve_domain_auth_code_request

val make_resend_operation_authorization_request :
  operation_id:operation_id -> unit -> resend_operation_authorization_request

val make_resend_contact_reachability_email_response :
  ?is_already_verified:boolean_ ->
  ?email_address:email ->
  ?domain_name:domain_name ->
  unit ->
  resend_contact_reachability_email_response

val make_resend_contact_reachability_email_request :
  ?domain_name:domain_name -> unit -> resend_contact_reachability_email_request

val make_renew_domain_response : ?operation_id:operation_id -> unit -> renew_domain_response

val make_renew_domain_request :
  ?duration_in_years:duration_in_years ->
  current_expiry_year:current_expiry_year ->
  domain_name:domain_name ->
  unit ->
  renew_domain_request

val make_reject_domain_transfer_from_another_aws_account_response :
  ?operation_id:operation_id -> unit -> reject_domain_transfer_from_another_aws_account_response

val make_reject_domain_transfer_from_another_aws_account_request :
  domain_name:domain_name -> unit -> reject_domain_transfer_from_another_aws_account_request

val make_register_domain_response : ?operation_id:operation_id -> unit -> register_domain_response

val make_register_domain_request :
  ?privacy_protect_billing_contact:boolean_ ->
  ?billing_contact:contact_detail ->
  ?privacy_protect_tech_contact:boolean_ ->
  ?privacy_protect_registrant_contact:boolean_ ->
  ?privacy_protect_admin_contact:boolean_ ->
  ?auto_renew:boolean_ ->
  ?idn_lang_code:lang_code ->
  tech_contact:contact_detail ->
  registrant_contact:contact_detail ->
  admin_contact:contact_detail ->
  duration_in_years:duration_in_years ->
  domain_name:domain_name ->
  unit ->
  register_domain_request

val make_push_domain_request :
  target:label -> domain_name:domain_name -> unit -> push_domain_request

val make_list_tags_for_domain_response : ?tag_list:tag_list -> unit -> list_tags_for_domain_response

val make_list_tags_for_domain_request :
  domain_name:domain_name -> unit -> list_tags_for_domain_request

val make_price_with_currency : currency:currency -> price:price -> unit -> price_with_currency

val make_domain_price :
  ?restoration_price:price_with_currency ->
  ?change_ownership_price:price_with_currency ->
  ?renewal_price:price_with_currency ->
  ?transfer_price:price_with_currency ->
  ?registration_price:price_with_currency ->
  ?name:domain_price_name ->
  unit ->
  domain_price

val make_list_prices_response :
  ?next_page_marker:page_marker -> ?prices:domain_price_list -> unit -> list_prices_response

val make_list_prices_request :
  ?max_items:list_prices_page_max_items ->
  ?marker:page_marker ->
  ?tld:tld_name ->
  unit ->
  list_prices_request

val make_operation_summary :
  ?last_updated_date:timestamp ->
  ?status_flag:status_flag ->
  ?message:error_message ->
  ?domain_name:domain_name ->
  ?submitted_date:timestamp ->
  ?type_:operation_type ->
  ?status:operation_status ->
  ?operation_id:operation_id ->
  unit ->
  operation_summary

val make_list_operations_response :
  ?next_page_marker:page_marker ->
  ?operations:operation_summary_list ->
  unit ->
  list_operations_response

val make_list_operations_request :
  ?sort_order:sort_order ->
  ?sort_by:list_operations_sort_attribute_name ->
  ?type_:operation_type_list ->
  ?status:operation_status_list ->
  ?max_items:page_max_items ->
  ?marker:page_marker ->
  ?submitted_since:timestamp ->
  unit ->
  list_operations_request

val make_domain_summary :
  ?expiry:timestamp ->
  ?transfer_lock:boolean_ ->
  ?auto_renew:boolean_ ->
  ?domain_name:domain_name ->
  unit ->
  domain_summary

val make_list_domains_response :
  ?next_page_marker:page_marker -> ?domains:domain_summary_list -> unit -> list_domains_response

val make_filter_condition :
  values:values -> operator:operator -> name:list_domains_attribute_name -> unit -> filter_condition

val make_list_domains_request :
  ?max_items:page_max_items ->
  ?marker:page_marker ->
  ?sort_condition:sort_condition ->
  ?filter_conditions:filter_conditions ->
  unit ->
  list_domains_request

val make_get_operation_detail_response :
  ?status_flag:status_flag ->
  ?last_updated_date:timestamp ->
  ?submitted_date:timestamp ->
  ?type_:operation_type ->
  ?domain_name:domain_name ->
  ?message:error_message ->
  ?status:operation_status ->
  ?operation_id:operation_id ->
  unit ->
  get_operation_detail_response

val make_get_operation_detail_request :
  operation_id:operation_id -> unit -> get_operation_detail_request

val make_domain_suggestion :
  ?availability:string_ -> ?domain_name:domain_name -> unit -> domain_suggestion

val make_get_domain_suggestions_response :
  ?suggestions_list:domain_suggestions_list -> unit -> get_domain_suggestions_response

val make_get_domain_suggestions_request :
  only_available:boolean_ ->
  suggestion_count:integer ->
  domain_name:domain_name ->
  unit ->
  get_domain_suggestions_request

val make_dnssec_key :
  ?id:string_ ->
  ?key_tag:nullable_integer ->
  ?digest:string_ ->
  ?digest_type:nullable_integer ->
  ?public_key:dnssec_public_key ->
  ?flags:nullable_integer ->
  ?algorithm:nullable_integer ->
  unit ->
  dnssec_key

val make_get_domain_detail_response :
  ?billing_privacy:boolean_ ->
  ?billing_contact:contact_detail ->
  ?dnssec_keys:dnssec_key_list ->
  ?status_list:domain_status_list ->
  ?dns_sec:dns_sec ->
  ?reseller:reseller ->
  ?expiration_date:timestamp ->
  ?updated_date:timestamp ->
  ?creation_date:timestamp ->
  ?registry_domain_id:registry_domain_id ->
  ?abuse_contact_phone:contact_number ->
  ?abuse_contact_email:email ->
  ?registrar_url:registrar_url ->
  ?who_is_server:registrar_who_is_server ->
  ?registrar_name:registrar_name ->
  ?tech_privacy:boolean_ ->
  ?registrant_privacy:boolean_ ->
  ?admin_privacy:boolean_ ->
  ?tech_contact:contact_detail ->
  ?registrant_contact:contact_detail ->
  ?admin_contact:contact_detail ->
  ?auto_renew:boolean_ ->
  ?nameservers:nameserver_list ->
  ?domain_name:domain_name ->
  unit ->
  get_domain_detail_response

val make_get_domain_detail_request : domain_name:domain_name -> unit -> get_domain_detail_request

val make_get_contact_reachability_status_response :
  ?status:reachability_status ->
  ?domain_name:domain_name ->
  unit ->
  get_contact_reachability_status_response

val make_get_contact_reachability_status_request :
  ?domain_name:domain_name -> unit -> get_contact_reachability_status_request

val make_enable_domain_transfer_lock_response :
  ?operation_id:operation_id -> unit -> enable_domain_transfer_lock_response

val make_enable_domain_transfer_lock_request :
  domain_name:domain_name -> unit -> enable_domain_transfer_lock_request

val make_enable_domain_auto_renew_response : unit -> unit

val make_enable_domain_auto_renew_request :
  domain_name:domain_name -> unit -> enable_domain_auto_renew_request

val make_disassociate_delegation_signer_from_domain_response :
  ?operation_id:operation_id -> unit -> disassociate_delegation_signer_from_domain_response

val make_disassociate_delegation_signer_from_domain_request :
  id:string_ ->
  domain_name:domain_name ->
  unit ->
  disassociate_delegation_signer_from_domain_request

val make_disable_domain_transfer_lock_response :
  ?operation_id:operation_id -> unit -> disable_domain_transfer_lock_response

val make_disable_domain_transfer_lock_request :
  domain_name:domain_name -> unit -> disable_domain_transfer_lock_request

val make_disable_domain_auto_renew_response : unit -> unit

val make_disable_domain_auto_renew_request :
  domain_name:domain_name -> unit -> disable_domain_auto_renew_request

val make_delete_tags_for_domain_response : unit -> unit

val make_delete_tags_for_domain_request :
  tags_to_delete:tag_key_list -> domain_name:domain_name -> unit -> delete_tags_for_domain_request

val make_delete_domain_response : ?operation_id:operation_id -> unit -> delete_domain_response
val make_delete_domain_request : domain_name:domain_name -> unit -> delete_domain_request
val make_domain_transferability : ?transferable:transferable -> unit -> domain_transferability

val make_check_domain_transferability_response :
  ?message:message ->
  ?transferability:domain_transferability ->
  unit ->
  check_domain_transferability_response

val make_check_domain_transferability_request :
  ?auth_code:domain_auth_code ->
  domain_name:domain_name ->
  unit ->
  check_domain_transferability_request

val make_check_domain_availability_response :
  ?availability:domain_availability -> unit -> check_domain_availability_response

val make_check_domain_availability_request :
  ?idn_lang_code:lang_code -> domain_name:domain_name -> unit -> check_domain_availability_request

val make_cancel_domain_transfer_to_another_aws_account_response :
  ?operation_id:operation_id -> unit -> cancel_domain_transfer_to_another_aws_account_response

val make_cancel_domain_transfer_to_another_aws_account_request :
  domain_name:domain_name -> unit -> cancel_domain_transfer_to_another_aws_account_request

val make_associate_delegation_signer_to_domain_response :
  ?operation_id:operation_id -> unit -> associate_delegation_signer_to_domain_response

val make_dnssec_signing_attributes :
  ?public_key:dnssec_public_key ->
  ?flags:nullable_integer ->
  ?algorithm:nullable_integer ->
  unit ->
  dnssec_signing_attributes

val make_associate_delegation_signer_to_domain_request :
  signing_attributes:dnssec_signing_attributes ->
  domain_name:domain_name ->
  unit ->
  associate_delegation_signer_to_domain_request

val make_accept_domain_transfer_from_another_aws_account_response :
  ?operation_id:operation_id -> unit -> accept_domain_transfer_from_another_aws_account_response

val make_accept_domain_transfer_from_another_aws_account_request :
  password:password ->
  domain_name:domain_name ->
  unit ->
  accept_domain_transfer_from_another_aws_account_request
