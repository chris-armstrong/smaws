open Types

let make_accept_domain_transfer_from_another_aws_account_response
    ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : accept_domain_transfer_from_another_aws_account_response)

let make_accept_domain_transfer_from_another_aws_account_request
    ~domain_name:(domain_name_ : domain_name) ~password:(password_ : password) () =
  ({ domain_name = domain_name_; password = password_ }
    : accept_domain_transfer_from_another_aws_account_request)

let make_associate_delegation_signer_to_domain_response
    ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : associate_delegation_signer_to_domain_response)

let make_dnssec_signing_attributes ?algorithm:(algorithm_ : nullable_integer option)
    ?flags:(flags_ : nullable_integer option) ?public_key:(public_key_ : dnssec_public_key option)
    () =
  ({ algorithm = algorithm_; flags = flags_; public_key = public_key_ } : dnssec_signing_attributes)

let make_associate_delegation_signer_to_domain_request ~domain_name:(domain_name_ : domain_name)
    ~signing_attributes:(signing_attributes_ : dnssec_signing_attributes) () =
  ({ domain_name = domain_name_; signing_attributes = signing_attributes_ }
    : associate_delegation_signer_to_domain_request)

let make_billing_record ?domain_name:(domain_name_ : domain_name option)
    ?operation:(operation_ : operation_type option) ?invoice_id:(invoice_id_ : invoice_id option)
    ?bill_date:(bill_date_ : timestamp option) ?price:(price_ : price option) () =
  ({
     domain_name = domain_name_;
     operation = operation_;
     invoice_id = invoice_id_;
     bill_date = bill_date_;
     price = price_;
   }
    : billing_record)

let make_cancel_domain_transfer_to_another_aws_account_response
    ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : cancel_domain_transfer_to_another_aws_account_response)

let make_cancel_domain_transfer_to_another_aws_account_request
    ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : cancel_domain_transfer_to_another_aws_account_request)

let make_check_domain_availability_response
    ?availability:(availability_ : domain_availability option) () =
  ({ availability = availability_ } : check_domain_availability_response)

let make_check_domain_availability_request ?idn_lang_code:(idn_lang_code_ : lang_code option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_; idn_lang_code = idn_lang_code_ }
    : check_domain_availability_request)

let make_domain_transferability ?transferable:(transferable_ : transferable option) () =
  ({ transferable = transferable_ } : domain_transferability)

let make_check_domain_transferability_response
    ?transferability:(transferability_ : domain_transferability option)
    ?message:(message_ : message option) () =
  ({ transferability = transferability_; message = message_ }
    : check_domain_transferability_response)

let make_check_domain_transferability_request ?auth_code:(auth_code_ : domain_auth_code option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_; auth_code = auth_code_ } : check_domain_transferability_request)

let make_consent ~max_price:(max_price_ : price) ~currency:(currency_ : currency) () =
  ({ max_price = max_price_; currency = currency_ } : consent)

let make_extra_param ~name:(name_ : extra_param_name) ~value:(value_ : extra_param_value) () =
  ({ name = name_; value = value_ } : extra_param)

let make_contact_detail ?first_name:(first_name_ : contact_name option)
    ?last_name:(last_name_ : contact_name option)
    ?contact_type:(contact_type_ : contact_type option)
    ?organization_name:(organization_name_ : contact_name option)
    ?address_line1:(address_line1_ : address_line option)
    ?address_line2:(address_line2_ : address_line option) ?city:(city_ : city option)
    ?state:(state_ : state option) ?country_code:(country_code_ : country_code option)
    ?zip_code:(zip_code_ : zip_code option) ?phone_number:(phone_number_ : contact_number option)
    ?email:(email_ : email option) ?fax:(fax_ : contact_number option)
    ?extra_params:(extra_params_ : extra_param_list option) () =
  ({
     first_name = first_name_;
     last_name = last_name_;
     contact_type = contact_type_;
     organization_name = organization_name_;
     address_line1 = address_line1_;
     address_line2 = address_line2_;
     city = city_;
     state = state_;
     country_code = country_code_;
     zip_code = zip_code_;
     phone_number = phone_number_;
     email = email_;
     fax = fax_;
     extra_params = extra_params_;
   }
    : contact_detail)

let make_delete_domain_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : delete_domain_response)

let make_delete_domain_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : delete_domain_request)

let make_delete_tags_for_domain_response () = (() : unit)

let make_delete_tags_for_domain_request ~domain_name:(domain_name_ : domain_name)
    ~tags_to_delete:(tags_to_delete_ : tag_key_list) () =
  ({ domain_name = domain_name_; tags_to_delete = tags_to_delete_ }
    : delete_tags_for_domain_request)

let make_disable_domain_auto_renew_response () = (() : unit)

let make_disable_domain_auto_renew_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : disable_domain_auto_renew_request)

let make_disable_domain_transfer_lock_response ?operation_id:(operation_id_ : operation_id option)
    () =
  ({ operation_id = operation_id_ } : disable_domain_transfer_lock_response)

let make_disable_domain_transfer_lock_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : disable_domain_transfer_lock_request)

let make_disassociate_delegation_signer_from_domain_response
    ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : disassociate_delegation_signer_from_domain_response)

let make_disassociate_delegation_signer_from_domain_request
    ~domain_name:(domain_name_ : domain_name) ~id:(id_ : string_) () =
  ({ domain_name = domain_name_; id = id_ } : disassociate_delegation_signer_from_domain_request)

let make_dnssec_key ?algorithm:(algorithm_ : nullable_integer option)
    ?flags:(flags_ : nullable_integer option) ?public_key:(public_key_ : dnssec_public_key option)
    ?digest_type:(digest_type_ : nullable_integer option) ?digest:(digest_ : string_ option)
    ?key_tag:(key_tag_ : nullable_integer option) ?id:(id_ : string_ option) () =
  ({
     algorithm = algorithm_;
     flags = flags_;
     public_key = public_key_;
     digest_type = digest_type_;
     digest = digest_;
     key_tag = key_tag_;
     id = id_;
   }
    : dnssec_key)

let make_price_with_currency ~price:(price_ : price) ~currency:(currency_ : currency) () =
  ({ price = price_; currency = currency_ } : price_with_currency)

let make_domain_price ?name:(name_ : domain_price_name option)
    ?registration_price:(registration_price_ : price_with_currency option)
    ?transfer_price:(transfer_price_ : price_with_currency option)
    ?renewal_price:(renewal_price_ : price_with_currency option)
    ?change_ownership_price:(change_ownership_price_ : price_with_currency option)
    ?restoration_price:(restoration_price_ : price_with_currency option) () =
  ({
     name = name_;
     registration_price = registration_price_;
     transfer_price = transfer_price_;
     renewal_price = renewal_price_;
     change_ownership_price = change_ownership_price_;
     restoration_price = restoration_price_;
   }
    : domain_price)

let make_domain_suggestion ?domain_name:(domain_name_ : domain_name option)
    ?availability:(availability_ : string_ option) () =
  ({ domain_name = domain_name_; availability = availability_ } : domain_suggestion)

let make_domain_summary ?domain_name:(domain_name_ : domain_name option)
    ?auto_renew:(auto_renew_ : boolean_ option) ?transfer_lock:(transfer_lock_ : boolean_ option)
    ?expiry:(expiry_ : timestamp option) () =
  ({
     domain_name = domain_name_;
     auto_renew = auto_renew_;
     transfer_lock = transfer_lock_;
     expiry = expiry_;
   }
    : domain_summary)

let make_enable_domain_auto_renew_response () = (() : unit)

let make_enable_domain_auto_renew_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : enable_domain_auto_renew_request)

let make_enable_domain_transfer_lock_response ?operation_id:(operation_id_ : operation_id option) ()
    =
  ({ operation_id = operation_id_ } : enable_domain_transfer_lock_response)

let make_enable_domain_transfer_lock_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : enable_domain_transfer_lock_request)

let make_filter_condition ~name:(name_ : list_domains_attribute_name)
    ~operator:(operator_ : operator) ~values:(values_ : values) () =
  ({ name = name_; operator = operator_; values = values_ } : filter_condition)

let make_get_contact_reachability_status_response ?domain_name:(domain_name_ : domain_name option)
    ?status:(status_ : reachability_status option) () =
  ({ domain_name = domain_name_; status = status_ } : get_contact_reachability_status_response)

let make_get_contact_reachability_status_request ?domain_name:(domain_name_ : domain_name option) ()
    =
  ({ domain_name = domain_name_ } : get_contact_reachability_status_request)

let make_nameserver ?glue_ips:(glue_ips_ : glue_ip_list option) ~name:(name_ : host_name) () =
  ({ name = name_; glue_ips = glue_ips_ } : nameserver)

let make_get_domain_detail_response ?domain_name:(domain_name_ : domain_name option)
    ?nameservers:(nameservers_ : nameserver_list option) ?auto_renew:(auto_renew_ : boolean_ option)
    ?admin_contact:(admin_contact_ : contact_detail option)
    ?registrant_contact:(registrant_contact_ : contact_detail option)
    ?tech_contact:(tech_contact_ : contact_detail option)
    ?admin_privacy:(admin_privacy_ : boolean_ option)
    ?registrant_privacy:(registrant_privacy_ : boolean_ option)
    ?tech_privacy:(tech_privacy_ : boolean_ option)
    ?registrar_name:(registrar_name_ : registrar_name option)
    ?who_is_server:(who_is_server_ : registrar_who_is_server option)
    ?registrar_url:(registrar_url_ : registrar_url option)
    ?abuse_contact_email:(abuse_contact_email_ : email option)
    ?abuse_contact_phone:(abuse_contact_phone_ : contact_number option)
    ?registry_domain_id:(registry_domain_id_ : registry_domain_id option)
    ?creation_date:(creation_date_ : timestamp option)
    ?updated_date:(updated_date_ : timestamp option)
    ?expiration_date:(expiration_date_ : timestamp option) ?reseller:(reseller_ : reseller option)
    ?dns_sec:(dns_sec_ : dns_sec option) ?status_list:(status_list_ : domain_status_list option)
    ?dnssec_keys:(dnssec_keys_ : dnssec_key_list option)
    ?billing_contact:(billing_contact_ : contact_detail option)
    ?billing_privacy:(billing_privacy_ : boolean_ option) () =
  ({
     domain_name = domain_name_;
     nameservers = nameservers_;
     auto_renew = auto_renew_;
     admin_contact = admin_contact_;
     registrant_contact = registrant_contact_;
     tech_contact = tech_contact_;
     admin_privacy = admin_privacy_;
     registrant_privacy = registrant_privacy_;
     tech_privacy = tech_privacy_;
     registrar_name = registrar_name_;
     who_is_server = who_is_server_;
     registrar_url = registrar_url_;
     abuse_contact_email = abuse_contact_email_;
     abuse_contact_phone = abuse_contact_phone_;
     registry_domain_id = registry_domain_id_;
     creation_date = creation_date_;
     updated_date = updated_date_;
     expiration_date = expiration_date_;
     reseller = reseller_;
     dns_sec = dns_sec_;
     status_list = status_list_;
     dnssec_keys = dnssec_keys_;
     billing_contact = billing_contact_;
     billing_privacy = billing_privacy_;
   }
    : get_domain_detail_response)

let make_get_domain_detail_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : get_domain_detail_request)

let make_get_domain_suggestions_response
    ?suggestions_list:(suggestions_list_ : domain_suggestions_list option) () =
  ({ suggestions_list = suggestions_list_ } : get_domain_suggestions_response)

let make_get_domain_suggestions_request ~domain_name:(domain_name_ : domain_name)
    ~suggestion_count:(suggestion_count_ : integer) ~only_available:(only_available_ : boolean_) ()
    =
  ({
     domain_name = domain_name_;
     suggestion_count = suggestion_count_;
     only_available = only_available_;
   }
    : get_domain_suggestions_request)

let make_get_operation_detail_response ?operation_id:(operation_id_ : operation_id option)
    ?status:(status_ : operation_status option) ?message:(message_ : error_message option)
    ?domain_name:(domain_name_ : domain_name option) ?type_:(type__ : operation_type option)
    ?submitted_date:(submitted_date_ : timestamp option)
    ?last_updated_date:(last_updated_date_ : timestamp option)
    ?status_flag:(status_flag_ : status_flag option) () =
  ({
     operation_id = operation_id_;
     status = status_;
     message = message_;
     domain_name = domain_name_;
     type_ = type__;
     submitted_date = submitted_date_;
     last_updated_date = last_updated_date_;
     status_flag = status_flag_;
   }
    : get_operation_detail_response)

let make_get_operation_detail_request ~operation_id:(operation_id_ : operation_id) () =
  ({ operation_id = operation_id_ } : get_operation_detail_request)

let make_list_domains_response ?domains:(domains_ : domain_summary_list option)
    ?next_page_marker:(next_page_marker_ : page_marker option) () =
  ({ domains = domains_; next_page_marker = next_page_marker_ } : list_domains_response)

let make_sort_condition ~name:(name_ : list_domains_attribute_name)
    ~sort_order:(sort_order_ : sort_order) () =
  ({ name = name_; sort_order = sort_order_ } : sort_condition)

let make_list_domains_request ?filter_conditions:(filter_conditions_ : filter_conditions option)
    ?sort_condition:(sort_condition_ : sort_condition option) ?marker:(marker_ : page_marker option)
    ?max_items:(max_items_ : page_max_items option) () =
  ({
     filter_conditions = filter_conditions_;
     sort_condition = sort_condition_;
     marker = marker_;
     max_items = max_items_;
   }
    : list_domains_request)

let make_operation_summary ?operation_id:(operation_id_ : operation_id option)
    ?status:(status_ : operation_status option) ?type_:(type__ : operation_type option)
    ?submitted_date:(submitted_date_ : timestamp option)
    ?domain_name:(domain_name_ : domain_name option) ?message:(message_ : error_message option)
    ?status_flag:(status_flag_ : status_flag option)
    ?last_updated_date:(last_updated_date_ : timestamp option) () =
  ({
     operation_id = operation_id_;
     status = status_;
     type_ = type__;
     submitted_date = submitted_date_;
     domain_name = domain_name_;
     message = message_;
     status_flag = status_flag_;
     last_updated_date = last_updated_date_;
   }
    : operation_summary)

let make_list_operations_response ?operations:(operations_ : operation_summary_list option)
    ?next_page_marker:(next_page_marker_ : page_marker option) () =
  ({ operations = operations_; next_page_marker = next_page_marker_ } : list_operations_response)

let make_list_operations_request ?submitted_since:(submitted_since_ : timestamp option)
    ?marker:(marker_ : page_marker option) ?max_items:(max_items_ : page_max_items option)
    ?status:(status_ : operation_status_list option) ?type_:(type__ : operation_type_list option)
    ?sort_by:(sort_by_ : list_operations_sort_attribute_name option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     submitted_since = submitted_since_;
     marker = marker_;
     max_items = max_items_;
     status = status_;
     type_ = type__;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_operations_request)

let make_list_prices_response ?prices:(prices_ : domain_price_list option)
    ?next_page_marker:(next_page_marker_ : page_marker option) () =
  ({ prices = prices_; next_page_marker = next_page_marker_ } : list_prices_response)

let make_list_prices_request ?tld:(tld_ : tld_name option) ?marker:(marker_ : page_marker option)
    ?max_items:(max_items_ : list_prices_page_max_items option) () =
  ({ tld = tld_; marker = marker_; max_items = max_items_ } : list_prices_request)

let make_tag ?key:(key_ : tag_key option) ?value:(value_ : tag_value option) () =
  ({ key = key_; value = value_ } : tag)

let make_list_tags_for_domain_response ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : list_tags_for_domain_response)

let make_list_tags_for_domain_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : list_tags_for_domain_request)

let make_push_domain_request ~domain_name:(domain_name_ : domain_name) ~target:(target_ : label) ()
    =
  ({ domain_name = domain_name_; target = target_ } : push_domain_request)

let make_register_domain_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : register_domain_response)

let make_register_domain_request ?idn_lang_code:(idn_lang_code_ : lang_code option)
    ?auto_renew:(auto_renew_ : boolean_ option)
    ?privacy_protect_admin_contact:(privacy_protect_admin_contact_ : boolean_ option)
    ?privacy_protect_registrant_contact:(privacy_protect_registrant_contact_ : boolean_ option)
    ?privacy_protect_tech_contact:(privacy_protect_tech_contact_ : boolean_ option)
    ?billing_contact:(billing_contact_ : contact_detail option)
    ?privacy_protect_billing_contact:(privacy_protect_billing_contact_ : boolean_ option)
    ~domain_name:(domain_name_ : domain_name)
    ~duration_in_years:(duration_in_years_ : duration_in_years)
    ~admin_contact:(admin_contact_ : contact_detail)
    ~registrant_contact:(registrant_contact_ : contact_detail)
    ~tech_contact:(tech_contact_ : contact_detail) () =
  ({
     domain_name = domain_name_;
     idn_lang_code = idn_lang_code_;
     duration_in_years = duration_in_years_;
     auto_renew = auto_renew_;
     admin_contact = admin_contact_;
     registrant_contact = registrant_contact_;
     tech_contact = tech_contact_;
     privacy_protect_admin_contact = privacy_protect_admin_contact_;
     privacy_protect_registrant_contact = privacy_protect_registrant_contact_;
     privacy_protect_tech_contact = privacy_protect_tech_contact_;
     billing_contact = billing_contact_;
     privacy_protect_billing_contact = privacy_protect_billing_contact_;
   }
    : register_domain_request)

let make_reject_domain_transfer_from_another_aws_account_response
    ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : reject_domain_transfer_from_another_aws_account_response)

let make_reject_domain_transfer_from_another_aws_account_request
    ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : reject_domain_transfer_from_another_aws_account_request)

let make_renew_domain_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : renew_domain_response)

let make_renew_domain_request ?duration_in_years:(duration_in_years_ : duration_in_years option)
    ~domain_name:(domain_name_ : domain_name)
    ~current_expiry_year:(current_expiry_year_ : current_expiry_year) () =
  ({
     domain_name = domain_name_;
     duration_in_years = duration_in_years_;
     current_expiry_year = current_expiry_year_;
   }
    : renew_domain_request)

let make_resend_contact_reachability_email_response ?domain_name:(domain_name_ : domain_name option)
    ?email_address:(email_address_ : email option)
    ?is_already_verified:(is_already_verified_ : boolean_ option) () =
  ({
     domain_name = domain_name_;
     email_address = email_address_;
     is_already_verified = is_already_verified_;
   }
    : resend_contact_reachability_email_response)

let make_resend_contact_reachability_email_request ?domain_name:(domain_name_ : domain_name option)
    () =
  ({ domain_name = domain_name_ } : resend_contact_reachability_email_request)

let make_resend_operation_authorization_request ~operation_id:(operation_id_ : operation_id) () =
  ({ operation_id = operation_id_ } : resend_operation_authorization_request)

let make_retrieve_domain_auth_code_response ?auth_code:(auth_code_ : domain_auth_code option) () =
  ({ auth_code = auth_code_ } : retrieve_domain_auth_code_response)

let make_retrieve_domain_auth_code_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : retrieve_domain_auth_code_request)

let make_view_billing_response ?next_page_marker:(next_page_marker_ : page_marker option)
    ?billing_records:(billing_records_ : billing_records option) () =
  ({ next_page_marker = next_page_marker_; billing_records = billing_records_ }
    : view_billing_response)

let make_view_billing_request ?start:(start_ : timestamp option) ?end_:(end__ : timestamp option)
    ?marker:(marker_ : page_marker option) ?max_items:(max_items_ : page_max_items option) () =
  ({ start = start_; end_ = end__; marker = marker_; max_items = max_items_ }
    : view_billing_request)

let make_update_tags_for_domain_response () = (() : unit)

let make_update_tags_for_domain_request ?tags_to_update:(tags_to_update_ : tag_list option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_; tags_to_update = tags_to_update_ }
    : update_tags_for_domain_request)

let make_update_domain_nameservers_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : update_domain_nameservers_response)

let make_update_domain_nameservers_request ?fi_auth_key:(fi_auth_key_ : fi_auth_key option)
    ~domain_name:(domain_name_ : domain_name) ~nameservers:(nameservers_ : nameserver_list) () =
  ({ domain_name = domain_name_; fi_auth_key = fi_auth_key_; nameservers = nameservers_ }
    : update_domain_nameservers_request)

let make_update_domain_contact_privacy_response ?operation_id:(operation_id_ : operation_id option)
    () =
  ({ operation_id = operation_id_ } : update_domain_contact_privacy_response)

let make_update_domain_contact_privacy_request ?admin_privacy:(admin_privacy_ : boolean_ option)
    ?registrant_privacy:(registrant_privacy_ : boolean_ option)
    ?tech_privacy:(tech_privacy_ : boolean_ option)
    ?billing_privacy:(billing_privacy_ : boolean_ option) ~domain_name:(domain_name_ : domain_name)
    () =
  ({
     domain_name = domain_name_;
     admin_privacy = admin_privacy_;
     registrant_privacy = registrant_privacy_;
     tech_privacy = tech_privacy_;
     billing_privacy = billing_privacy_;
   }
    : update_domain_contact_privacy_request)

let make_update_domain_contact_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : update_domain_contact_response)

let make_update_domain_contact_request ?admin_contact:(admin_contact_ : contact_detail option)
    ?registrant_contact:(registrant_contact_ : contact_detail option)
    ?tech_contact:(tech_contact_ : contact_detail option) ?consent:(consent_ : consent option)
    ?billing_contact:(billing_contact_ : contact_detail option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({
     domain_name = domain_name_;
     admin_contact = admin_contact_;
     registrant_contact = registrant_contact_;
     tech_contact = tech_contact_;
     consent = consent_;
     billing_contact = billing_contact_;
   }
    : update_domain_contact_request)

let make_transfer_domain_to_another_aws_account_response
    ?operation_id:(operation_id_ : operation_id option) ?password:(password_ : password option) () =
  ({ operation_id = operation_id_; password = password_ }
    : transfer_domain_to_another_aws_account_response)

let make_transfer_domain_to_another_aws_account_request ~domain_name:(domain_name_ : domain_name)
    ~account_id:(account_id_ : account_id) () =
  ({ domain_name = domain_name_; account_id = account_id_ }
    : transfer_domain_to_another_aws_account_request)

let make_transfer_domain_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : transfer_domain_response)

let make_transfer_domain_request ?idn_lang_code:(idn_lang_code_ : lang_code option)
    ?duration_in_years:(duration_in_years_ : duration_in_years option)
    ?nameservers:(nameservers_ : nameserver_list option)
    ?auth_code:(auth_code_ : domain_auth_code option) ?auto_renew:(auto_renew_ : boolean_ option)
    ?privacy_protect_admin_contact:(privacy_protect_admin_contact_ : boolean_ option)
    ?privacy_protect_registrant_contact:(privacy_protect_registrant_contact_ : boolean_ option)
    ?privacy_protect_tech_contact:(privacy_protect_tech_contact_ : boolean_ option)
    ?billing_contact:(billing_contact_ : contact_detail option)
    ?privacy_protect_billing_contact:(privacy_protect_billing_contact_ : boolean_ option)
    ~domain_name:(domain_name_ : domain_name) ~admin_contact:(admin_contact_ : contact_detail)
    ~registrant_contact:(registrant_contact_ : contact_detail)
    ~tech_contact:(tech_contact_ : contact_detail) () =
  ({
     domain_name = domain_name_;
     idn_lang_code = idn_lang_code_;
     duration_in_years = duration_in_years_;
     nameservers = nameservers_;
     auth_code = auth_code_;
     auto_renew = auto_renew_;
     admin_contact = admin_contact_;
     registrant_contact = registrant_contact_;
     tech_contact = tech_contact_;
     privacy_protect_admin_contact = privacy_protect_admin_contact_;
     privacy_protect_registrant_contact = privacy_protect_registrant_contact_;
     privacy_protect_tech_contact = privacy_protect_tech_contact_;
     billing_contact = billing_contact_;
     privacy_protect_billing_contact = privacy_protect_billing_contact_;
   }
    : transfer_domain_request)
