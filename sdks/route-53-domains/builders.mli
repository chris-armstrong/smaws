open Types

val make_accept_domain_transfer_from_another_aws_account_response :
  ?operation_id:operation_id -> unit -> accept_domain_transfer_from_another_aws_account_response

val make_accept_domain_transfer_from_another_aws_account_request :
  domain_name:domain_name ->
  password:password ->
  unit ->
  accept_domain_transfer_from_another_aws_account_request

val make_associate_delegation_signer_to_domain_response :
  ?operation_id:operation_id -> unit -> associate_delegation_signer_to_domain_response

val make_dnssec_signing_attributes :
  ?algorithm:nullable_integer ->
  ?flags:nullable_integer ->
  ?public_key:dnssec_public_key ->
  unit ->
  dnssec_signing_attributes

val make_associate_delegation_signer_to_domain_request :
  domain_name:domain_name ->
  signing_attributes:dnssec_signing_attributes ->
  unit ->
  associate_delegation_signer_to_domain_request

val make_billing_record :
  ?domain_name:domain_name ->
  ?operation:operation_type ->
  ?invoice_id:invoice_id ->
  ?bill_date:timestamp ->
  ?price:price ->
  unit ->
  billing_record

val make_cancel_domain_transfer_to_another_aws_account_response :
  ?operation_id:operation_id -> unit -> cancel_domain_transfer_to_another_aws_account_response

val make_cancel_domain_transfer_to_another_aws_account_request :
  domain_name:domain_name -> unit -> cancel_domain_transfer_to_another_aws_account_request

val make_check_domain_availability_response :
  ?availability:domain_availability -> unit -> check_domain_availability_response

val make_check_domain_availability_request :
  ?idn_lang_code:lang_code -> domain_name:domain_name -> unit -> check_domain_availability_request

val make_domain_transferability : ?transferable:transferable -> unit -> domain_transferability

val make_check_domain_transferability_response :
  ?transferability:domain_transferability ->
  ?message:message ->
  unit ->
  check_domain_transferability_response

val make_check_domain_transferability_request :
  ?auth_code:domain_auth_code ->
  domain_name:domain_name ->
  unit ->
  check_domain_transferability_request

val make_consent : max_price:price -> currency:currency -> unit -> consent
val make_extra_param : name:extra_param_name -> value:extra_param_value -> unit -> extra_param

val make_contact_detail :
  ?first_name:contact_name ->
  ?last_name:contact_name ->
  ?contact_type:contact_type ->
  ?organization_name:contact_name ->
  ?address_line1:address_line ->
  ?address_line2:address_line ->
  ?city:city ->
  ?state:state ->
  ?country_code:country_code ->
  ?zip_code:zip_code ->
  ?phone_number:contact_number ->
  ?email:email ->
  ?fax:contact_number ->
  ?extra_params:extra_param_list ->
  unit ->
  contact_detail

val make_delete_domain_response : ?operation_id:operation_id -> unit -> delete_domain_response
val make_delete_domain_request : domain_name:domain_name -> unit -> delete_domain_request
val make_delete_tags_for_domain_response : unit -> unit

val make_delete_tags_for_domain_request :
  domain_name:domain_name -> tags_to_delete:tag_key_list -> unit -> delete_tags_for_domain_request

val make_disable_domain_auto_renew_response : unit -> unit

val make_disable_domain_auto_renew_request :
  domain_name:domain_name -> unit -> disable_domain_auto_renew_request

val make_disable_domain_transfer_lock_response :
  ?operation_id:operation_id -> unit -> disable_domain_transfer_lock_response

val make_disable_domain_transfer_lock_request :
  domain_name:domain_name -> unit -> disable_domain_transfer_lock_request

val make_disassociate_delegation_signer_from_domain_response :
  ?operation_id:operation_id -> unit -> disassociate_delegation_signer_from_domain_response

val make_disassociate_delegation_signer_from_domain_request :
  domain_name:domain_name ->
  id:string_ ->
  unit ->
  disassociate_delegation_signer_from_domain_request

val make_dnssec_key :
  ?algorithm:nullable_integer ->
  ?flags:nullable_integer ->
  ?public_key:dnssec_public_key ->
  ?digest_type:nullable_integer ->
  ?digest:string_ ->
  ?key_tag:nullable_integer ->
  ?id:string_ ->
  unit ->
  dnssec_key

val make_price_with_currency : price:price -> currency:currency -> unit -> price_with_currency

val make_domain_price :
  ?name:domain_price_name ->
  ?registration_price:price_with_currency ->
  ?transfer_price:price_with_currency ->
  ?renewal_price:price_with_currency ->
  ?change_ownership_price:price_with_currency ->
  ?restoration_price:price_with_currency ->
  unit ->
  domain_price

val make_domain_suggestion :
  ?domain_name:domain_name -> ?availability:string_ -> unit -> domain_suggestion

val make_domain_summary :
  ?domain_name:domain_name ->
  ?auto_renew:boolean_ ->
  ?transfer_lock:boolean_ ->
  ?expiry:timestamp ->
  unit ->
  domain_summary

val make_enable_domain_auto_renew_response : unit -> unit

val make_enable_domain_auto_renew_request :
  domain_name:domain_name -> unit -> enable_domain_auto_renew_request

val make_enable_domain_transfer_lock_response :
  ?operation_id:operation_id -> unit -> enable_domain_transfer_lock_response

val make_enable_domain_transfer_lock_request :
  domain_name:domain_name -> unit -> enable_domain_transfer_lock_request

val make_filter_condition :
  name:list_domains_attribute_name -> operator:operator -> values:values -> unit -> filter_condition

val make_get_contact_reachability_status_response :
  ?domain_name:domain_name ->
  ?status:reachability_status ->
  unit ->
  get_contact_reachability_status_response

val make_get_contact_reachability_status_request :
  ?domain_name:domain_name -> unit -> get_contact_reachability_status_request

val make_nameserver : ?glue_ips:glue_ip_list -> name:host_name -> unit -> nameserver

val make_get_domain_detail_response :
  ?domain_name:domain_name ->
  ?nameservers:nameserver_list ->
  ?auto_renew:boolean_ ->
  ?admin_contact:contact_detail ->
  ?registrant_contact:contact_detail ->
  ?tech_contact:contact_detail ->
  ?admin_privacy:boolean_ ->
  ?registrant_privacy:boolean_ ->
  ?tech_privacy:boolean_ ->
  ?registrar_name:registrar_name ->
  ?who_is_server:registrar_who_is_server ->
  ?registrar_url:registrar_url ->
  ?abuse_contact_email:email ->
  ?abuse_contact_phone:contact_number ->
  ?registry_domain_id:registry_domain_id ->
  ?creation_date:timestamp ->
  ?updated_date:timestamp ->
  ?expiration_date:timestamp ->
  ?reseller:reseller ->
  ?dns_sec:dns_sec ->
  ?status_list:domain_status_list ->
  ?dnssec_keys:dnssec_key_list ->
  ?billing_contact:contact_detail ->
  ?billing_privacy:boolean_ ->
  unit ->
  get_domain_detail_response

val make_get_domain_detail_request : domain_name:domain_name -> unit -> get_domain_detail_request

val make_get_domain_suggestions_response :
  ?suggestions_list:domain_suggestions_list -> unit -> get_domain_suggestions_response

val make_get_domain_suggestions_request :
  domain_name:domain_name ->
  suggestion_count:integer ->
  only_available:boolean_ ->
  unit ->
  get_domain_suggestions_request

val make_get_operation_detail_response :
  ?operation_id:operation_id ->
  ?status:operation_status ->
  ?message:error_message ->
  ?domain_name:domain_name ->
  ?type_:operation_type ->
  ?submitted_date:timestamp ->
  ?last_updated_date:timestamp ->
  ?status_flag:status_flag ->
  unit ->
  get_operation_detail_response

val make_get_operation_detail_request :
  operation_id:operation_id -> unit -> get_operation_detail_request

val make_list_domains_response :
  ?domains:domain_summary_list -> ?next_page_marker:page_marker -> unit -> list_domains_response

val make_sort_condition :
  name:list_domains_attribute_name -> sort_order:sort_order -> unit -> sort_condition

val make_list_domains_request :
  ?filter_conditions:filter_conditions ->
  ?sort_condition:sort_condition ->
  ?marker:page_marker ->
  ?max_items:page_max_items ->
  unit ->
  list_domains_request

val make_operation_summary :
  ?operation_id:operation_id ->
  ?status:operation_status ->
  ?type_:operation_type ->
  ?submitted_date:timestamp ->
  ?domain_name:domain_name ->
  ?message:error_message ->
  ?status_flag:status_flag ->
  ?last_updated_date:timestamp ->
  unit ->
  operation_summary

val make_list_operations_response :
  ?operations:operation_summary_list ->
  ?next_page_marker:page_marker ->
  unit ->
  list_operations_response

val make_list_operations_request :
  ?submitted_since:timestamp ->
  ?marker:page_marker ->
  ?max_items:page_max_items ->
  ?status:operation_status_list ->
  ?type_:operation_type_list ->
  ?sort_by:list_operations_sort_attribute_name ->
  ?sort_order:sort_order ->
  unit ->
  list_operations_request

val make_list_prices_response :
  ?prices:domain_price_list -> ?next_page_marker:page_marker -> unit -> list_prices_response

val make_list_prices_request :
  ?tld:tld_name ->
  ?marker:page_marker ->
  ?max_items:list_prices_page_max_items ->
  unit ->
  list_prices_request

val make_tag : ?key:tag_key -> ?value:tag_value -> unit -> tag
val make_list_tags_for_domain_response : ?tag_list:tag_list -> unit -> list_tags_for_domain_response

val make_list_tags_for_domain_request :
  domain_name:domain_name -> unit -> list_tags_for_domain_request

val make_push_domain_request :
  domain_name:domain_name -> target:label -> unit -> push_domain_request

val make_register_domain_response : ?operation_id:operation_id -> unit -> register_domain_response

val make_register_domain_request :
  ?idn_lang_code:lang_code ->
  ?auto_renew:boolean_ ->
  ?privacy_protect_admin_contact:boolean_ ->
  ?privacy_protect_registrant_contact:boolean_ ->
  ?privacy_protect_tech_contact:boolean_ ->
  ?billing_contact:contact_detail ->
  ?privacy_protect_billing_contact:boolean_ ->
  domain_name:domain_name ->
  duration_in_years:duration_in_years ->
  admin_contact:contact_detail ->
  registrant_contact:contact_detail ->
  tech_contact:contact_detail ->
  unit ->
  register_domain_request

val make_reject_domain_transfer_from_another_aws_account_response :
  ?operation_id:operation_id -> unit -> reject_domain_transfer_from_another_aws_account_response

val make_reject_domain_transfer_from_another_aws_account_request :
  domain_name:domain_name -> unit -> reject_domain_transfer_from_another_aws_account_request

val make_renew_domain_response : ?operation_id:operation_id -> unit -> renew_domain_response

val make_renew_domain_request :
  ?duration_in_years:duration_in_years ->
  domain_name:domain_name ->
  current_expiry_year:current_expiry_year ->
  unit ->
  renew_domain_request

val make_resend_contact_reachability_email_response :
  ?domain_name:domain_name ->
  ?email_address:email ->
  ?is_already_verified:boolean_ ->
  unit ->
  resend_contact_reachability_email_response

val make_resend_contact_reachability_email_request :
  ?domain_name:domain_name -> unit -> resend_contact_reachability_email_request

val make_resend_operation_authorization_request :
  operation_id:operation_id -> unit -> resend_operation_authorization_request

val make_retrieve_domain_auth_code_response :
  ?auth_code:domain_auth_code -> unit -> retrieve_domain_auth_code_response

val make_retrieve_domain_auth_code_request :
  domain_name:domain_name -> unit -> retrieve_domain_auth_code_request

val make_view_billing_response :
  ?next_page_marker:page_marker -> ?billing_records:billing_records -> unit -> view_billing_response

val make_view_billing_request :
  ?start:timestamp ->
  ?end_:timestamp ->
  ?marker:page_marker ->
  ?max_items:page_max_items ->
  unit ->
  view_billing_request

val make_update_tags_for_domain_response : unit -> unit

val make_update_tags_for_domain_request :
  ?tags_to_update:tag_list -> domain_name:domain_name -> unit -> update_tags_for_domain_request

val make_update_domain_nameservers_response :
  ?operation_id:operation_id -> unit -> update_domain_nameservers_response

val make_update_domain_nameservers_request :
  ?fi_auth_key:fi_auth_key ->
  domain_name:domain_name ->
  nameservers:nameserver_list ->
  unit ->
  update_domain_nameservers_request

val make_update_domain_contact_privacy_response :
  ?operation_id:operation_id -> unit -> update_domain_contact_privacy_response

val make_update_domain_contact_privacy_request :
  ?admin_privacy:boolean_ ->
  ?registrant_privacy:boolean_ ->
  ?tech_privacy:boolean_ ->
  ?billing_privacy:boolean_ ->
  domain_name:domain_name ->
  unit ->
  update_domain_contact_privacy_request

val make_update_domain_contact_response :
  ?operation_id:operation_id -> unit -> update_domain_contact_response

val make_update_domain_contact_request :
  ?admin_contact:contact_detail ->
  ?registrant_contact:contact_detail ->
  ?tech_contact:contact_detail ->
  ?consent:consent ->
  ?billing_contact:contact_detail ->
  domain_name:domain_name ->
  unit ->
  update_domain_contact_request

val make_transfer_domain_to_another_aws_account_response :
  ?operation_id:operation_id ->
  ?password:password ->
  unit ->
  transfer_domain_to_another_aws_account_response

val make_transfer_domain_to_another_aws_account_request :
  domain_name:domain_name ->
  account_id:account_id ->
  unit ->
  transfer_domain_to_another_aws_account_request

val make_transfer_domain_response : ?operation_id:operation_id -> unit -> transfer_domain_response

val make_transfer_domain_request :
  ?idn_lang_code:lang_code ->
  ?duration_in_years:duration_in_years ->
  ?nameservers:nameserver_list ->
  ?auth_code:domain_auth_code ->
  ?auto_renew:boolean_ ->
  ?privacy_protect_admin_contact:boolean_ ->
  ?privacy_protect_registrant_contact:boolean_ ->
  ?privacy_protect_tech_contact:boolean_ ->
  ?billing_contact:contact_detail ->
  ?privacy_protect_billing_contact:boolean_ ->
  domain_name:domain_name ->
  admin_contact:contact_detail ->
  registrant_contact:contact_detail ->
  tech_contact:contact_detail ->
  unit ->
  transfer_domain_request
