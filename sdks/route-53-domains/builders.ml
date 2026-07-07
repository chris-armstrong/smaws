open Types

let make_billing_record ?price:(price_ : price option) ?bill_date:(bill_date_ : timestamp option)
    ?invoice_id:(invoice_id_ : invoice_id option) ?operation:(operation_ : operation_type option)
    ?domain_name:(domain_name_ : domain_name option) () =
  ({
     price = price_;
     bill_date = bill_date_;
     invoice_id = invoice_id_;
     operation = operation_;
     domain_name = domain_name_;
   }
    : billing_record)

let make_view_billing_response ?billing_records:(billing_records_ : billing_records option)
    ?next_page_marker:(next_page_marker_ : page_marker option) () =
  ({ billing_records = billing_records_; next_page_marker = next_page_marker_ }
    : view_billing_response)

let make_view_billing_request ?max_items:(max_items_ : page_max_items option)
    ?marker:(marker_ : page_marker option) ?end_:(end__ : timestamp option)
    ?start:(start_ : timestamp option) () =
  ({ max_items = max_items_; marker = marker_; end_ = end__; start = start_ }
    : view_billing_request)

let make_update_tags_for_domain_response () = (() : unit)

let make_tag ?value:(value_ : tag_value option) ?key:(key_ : tag_key option) () =
  ({ value = value_; key = key_ } : tag)

let make_update_tags_for_domain_request ?tags_to_update:(tags_to_update_ : tag_list option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ tags_to_update = tags_to_update_; domain_name = domain_name_ }
    : update_tags_for_domain_request)

let make_update_domain_nameservers_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : update_domain_nameservers_response)

let make_nameserver ?glue_ips:(glue_ips_ : glue_ip_list option) ~name:(name_ : host_name) () =
  ({ glue_ips = glue_ips_; name = name_ } : nameserver)

let make_update_domain_nameservers_request ?fi_auth_key:(fi_auth_key_ : fi_auth_key option)
    ~nameservers:(nameservers_ : nameserver_list) ~domain_name:(domain_name_ : domain_name) () =
  ({ nameservers = nameservers_; fi_auth_key = fi_auth_key_; domain_name = domain_name_ }
    : update_domain_nameservers_request)

let make_update_domain_contact_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : update_domain_contact_response)

let make_extra_param ~value:(value_ : extra_param_value) ~name:(name_ : extra_param_name) () =
  ({ value = value_; name = name_ } : extra_param)

let make_contact_detail ?extra_params:(extra_params_ : extra_param_list option)
    ?fax:(fax_ : contact_number option) ?email:(email_ : email option)
    ?phone_number:(phone_number_ : contact_number option) ?zip_code:(zip_code_ : zip_code option)
    ?country_code:(country_code_ : country_code option) ?state:(state_ : state option)
    ?city:(city_ : city option) ?address_line2:(address_line2_ : address_line option)
    ?address_line1:(address_line1_ : address_line option)
    ?organization_name:(organization_name_ : contact_name option)
    ?contact_type:(contact_type_ : contact_type option)
    ?last_name:(last_name_ : contact_name option) ?first_name:(first_name_ : contact_name option) ()
    =
  ({
     extra_params = extra_params_;
     fax = fax_;
     email = email_;
     phone_number = phone_number_;
     zip_code = zip_code_;
     country_code = country_code_;
     state = state_;
     city = city_;
     address_line2 = address_line2_;
     address_line1 = address_line1_;
     organization_name = organization_name_;
     contact_type = contact_type_;
     last_name = last_name_;
     first_name = first_name_;
   }
    : contact_detail)

let make_consent ~currency:(currency_ : currency) ~max_price:(max_price_ : price) () =
  ({ currency = currency_; max_price = max_price_ } : consent)

let make_update_domain_contact_request ?billing_contact:(billing_contact_ : contact_detail option)
    ?consent:(consent_ : consent option) ?tech_contact:(tech_contact_ : contact_detail option)
    ?registrant_contact:(registrant_contact_ : contact_detail option)
    ?admin_contact:(admin_contact_ : contact_detail option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({
     billing_contact = billing_contact_;
     consent = consent_;
     tech_contact = tech_contact_;
     registrant_contact = registrant_contact_;
     admin_contact = admin_contact_;
     domain_name = domain_name_;
   }
    : update_domain_contact_request)

let make_update_domain_contact_privacy_response ?operation_id:(operation_id_ : operation_id option)
    () =
  ({ operation_id = operation_id_ } : update_domain_contact_privacy_response)

let make_update_domain_contact_privacy_request ?billing_privacy:(billing_privacy_ : boolean_ option)
    ?tech_privacy:(tech_privacy_ : boolean_ option)
    ?registrant_privacy:(registrant_privacy_ : boolean_ option)
    ?admin_privacy:(admin_privacy_ : boolean_ option) ~domain_name:(domain_name_ : domain_name) () =
  ({
     billing_privacy = billing_privacy_;
     tech_privacy = tech_privacy_;
     registrant_privacy = registrant_privacy_;
     admin_privacy = admin_privacy_;
     domain_name = domain_name_;
   }
    : update_domain_contact_privacy_request)

let make_transfer_domain_to_another_aws_account_response ?password:(password_ : password option)
    ?operation_id:(operation_id_ : operation_id option) () =
  ({ password = password_; operation_id = operation_id_ }
    : transfer_domain_to_another_aws_account_response)

let make_transfer_domain_to_another_aws_account_request ~account_id:(account_id_ : account_id)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ account_id = account_id_; domain_name = domain_name_ }
    : transfer_domain_to_another_aws_account_request)

let make_transfer_domain_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : transfer_domain_response)

let make_transfer_domain_request
    ?privacy_protect_billing_contact:(privacy_protect_billing_contact_ : boolean_ option)
    ?billing_contact:(billing_contact_ : contact_detail option)
    ?privacy_protect_tech_contact:(privacy_protect_tech_contact_ : boolean_ option)
    ?privacy_protect_registrant_contact:(privacy_protect_registrant_contact_ : boolean_ option)
    ?privacy_protect_admin_contact:(privacy_protect_admin_contact_ : boolean_ option)
    ?auto_renew:(auto_renew_ : boolean_ option) ?auth_code:(auth_code_ : domain_auth_code option)
    ?nameservers:(nameservers_ : nameserver_list option)
    ?duration_in_years:(duration_in_years_ : duration_in_years option)
    ?idn_lang_code:(idn_lang_code_ : lang_code option)
    ~tech_contact:(tech_contact_ : contact_detail)
    ~registrant_contact:(registrant_contact_ : contact_detail)
    ~admin_contact:(admin_contact_ : contact_detail) ~domain_name:(domain_name_ : domain_name) () =
  ({
     privacy_protect_billing_contact = privacy_protect_billing_contact_;
     billing_contact = billing_contact_;
     privacy_protect_tech_contact = privacy_protect_tech_contact_;
     privacy_protect_registrant_contact = privacy_protect_registrant_contact_;
     privacy_protect_admin_contact = privacy_protect_admin_contact_;
     tech_contact = tech_contact_;
     registrant_contact = registrant_contact_;
     admin_contact = admin_contact_;
     auto_renew = auto_renew_;
     auth_code = auth_code_;
     nameservers = nameservers_;
     duration_in_years = duration_in_years_;
     idn_lang_code = idn_lang_code_;
     domain_name = domain_name_;
   }
    : transfer_domain_request)

let make_sort_condition ~sort_order:(sort_order_ : sort_order)
    ~name:(name_ : list_domains_attribute_name) () =
  ({ sort_order = sort_order_; name = name_ } : sort_condition)

let make_retrieve_domain_auth_code_response ?auth_code:(auth_code_ : domain_auth_code option) () =
  ({ auth_code = auth_code_ } : retrieve_domain_auth_code_response)

let make_retrieve_domain_auth_code_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : retrieve_domain_auth_code_request)

let make_resend_operation_authorization_request ~operation_id:(operation_id_ : operation_id) () =
  ({ operation_id = operation_id_ } : resend_operation_authorization_request)

let make_resend_contact_reachability_email_response
    ?is_already_verified:(is_already_verified_ : boolean_ option)
    ?email_address:(email_address_ : email option) ?domain_name:(domain_name_ : domain_name option)
    () =
  ({
     is_already_verified = is_already_verified_;
     email_address = email_address_;
     domain_name = domain_name_;
   }
    : resend_contact_reachability_email_response)

let make_resend_contact_reachability_email_request ?domain_name:(domain_name_ : domain_name option)
    () =
  ({ domain_name = domain_name_ } : resend_contact_reachability_email_request)

let make_renew_domain_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : renew_domain_response)

let make_renew_domain_request ?duration_in_years:(duration_in_years_ : duration_in_years option)
    ~current_expiry_year:(current_expiry_year_ : current_expiry_year)
    ~domain_name:(domain_name_ : domain_name) () =
  ({
     current_expiry_year = current_expiry_year_;
     duration_in_years = duration_in_years_;
     domain_name = domain_name_;
   }
    : renew_domain_request)

let make_reject_domain_transfer_from_another_aws_account_response
    ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : reject_domain_transfer_from_another_aws_account_response)

let make_reject_domain_transfer_from_another_aws_account_request
    ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : reject_domain_transfer_from_another_aws_account_request)

let make_register_domain_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : register_domain_response)

let make_register_domain_request
    ?privacy_protect_billing_contact:(privacy_protect_billing_contact_ : boolean_ option)
    ?billing_contact:(billing_contact_ : contact_detail option)
    ?privacy_protect_tech_contact:(privacy_protect_tech_contact_ : boolean_ option)
    ?privacy_protect_registrant_contact:(privacy_protect_registrant_contact_ : boolean_ option)
    ?privacy_protect_admin_contact:(privacy_protect_admin_contact_ : boolean_ option)
    ?auto_renew:(auto_renew_ : boolean_ option) ?idn_lang_code:(idn_lang_code_ : lang_code option)
    ~tech_contact:(tech_contact_ : contact_detail)
    ~registrant_contact:(registrant_contact_ : contact_detail)
    ~admin_contact:(admin_contact_ : contact_detail)
    ~duration_in_years:(duration_in_years_ : duration_in_years)
    ~domain_name:(domain_name_ : domain_name) () =
  ({
     privacy_protect_billing_contact = privacy_protect_billing_contact_;
     billing_contact = billing_contact_;
     privacy_protect_tech_contact = privacy_protect_tech_contact_;
     privacy_protect_registrant_contact = privacy_protect_registrant_contact_;
     privacy_protect_admin_contact = privacy_protect_admin_contact_;
     tech_contact = tech_contact_;
     registrant_contact = registrant_contact_;
     admin_contact = admin_contact_;
     auto_renew = auto_renew_;
     duration_in_years = duration_in_years_;
     idn_lang_code = idn_lang_code_;
     domain_name = domain_name_;
   }
    : register_domain_request)

let make_push_domain_request ~target:(target_ : label) ~domain_name:(domain_name_ : domain_name) ()
    =
  ({ target = target_; domain_name = domain_name_ } : push_domain_request)

let make_list_tags_for_domain_response ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : list_tags_for_domain_response)

let make_list_tags_for_domain_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : list_tags_for_domain_request)

let make_price_with_currency ~currency:(currency_ : currency) ~price:(price_ : price) () =
  ({ currency = currency_; price = price_ } : price_with_currency)

let make_domain_price ?restoration_price:(restoration_price_ : price_with_currency option)
    ?change_ownership_price:(change_ownership_price_ : price_with_currency option)
    ?renewal_price:(renewal_price_ : price_with_currency option)
    ?transfer_price:(transfer_price_ : price_with_currency option)
    ?registration_price:(registration_price_ : price_with_currency option)
    ?name:(name_ : domain_price_name option) () =
  ({
     restoration_price = restoration_price_;
     change_ownership_price = change_ownership_price_;
     renewal_price = renewal_price_;
     transfer_price = transfer_price_;
     registration_price = registration_price_;
     name = name_;
   }
    : domain_price)

let make_list_prices_response ?next_page_marker:(next_page_marker_ : page_marker option)
    ?prices:(prices_ : domain_price_list option) () =
  ({ next_page_marker = next_page_marker_; prices = prices_ } : list_prices_response)

let make_list_prices_request ?max_items:(max_items_ : list_prices_page_max_items option)
    ?marker:(marker_ : page_marker option) ?tld:(tld_ : tld_name option) () =
  ({ max_items = max_items_; marker = marker_; tld = tld_ } : list_prices_request)

let make_operation_summary ?last_updated_date:(last_updated_date_ : timestamp option)
    ?status_flag:(status_flag_ : status_flag option) ?message:(message_ : error_message option)
    ?domain_name:(domain_name_ : domain_name option)
    ?submitted_date:(submitted_date_ : timestamp option) ?type_:(type__ : operation_type option)
    ?status:(status_ : operation_status option) ?operation_id:(operation_id_ : operation_id option)
    () =
  ({
     last_updated_date = last_updated_date_;
     status_flag = status_flag_;
     message = message_;
     domain_name = domain_name_;
     submitted_date = submitted_date_;
     type_ = type__;
     status = status_;
     operation_id = operation_id_;
   }
    : operation_summary)

let make_list_operations_response ?next_page_marker:(next_page_marker_ : page_marker option)
    ?operations:(operations_ : operation_summary_list option) () =
  ({ next_page_marker = next_page_marker_; operations = operations_ } : list_operations_response)

let make_list_operations_request ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : list_operations_sort_attribute_name option)
    ?type_:(type__ : operation_type_list option) ?status:(status_ : operation_status_list option)
    ?max_items:(max_items_ : page_max_items option) ?marker:(marker_ : page_marker option)
    ?submitted_since:(submitted_since_ : timestamp option) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     type_ = type__;
     status = status_;
     max_items = max_items_;
     marker = marker_;
     submitted_since = submitted_since_;
   }
    : list_operations_request)

let make_domain_summary ?expiry:(expiry_ : timestamp option)
    ?transfer_lock:(transfer_lock_ : boolean_ option) ?auto_renew:(auto_renew_ : boolean_ option)
    ?domain_name:(domain_name_ : domain_name option) () =
  ({
     expiry = expiry_;
     transfer_lock = transfer_lock_;
     auto_renew = auto_renew_;
     domain_name = domain_name_;
   }
    : domain_summary)

let make_list_domains_response ?next_page_marker:(next_page_marker_ : page_marker option)
    ?domains:(domains_ : domain_summary_list option) () =
  ({ next_page_marker = next_page_marker_; domains = domains_ } : list_domains_response)

let make_filter_condition ~values:(values_ : values) ~operator:(operator_ : operator)
    ~name:(name_ : list_domains_attribute_name) () =
  ({ values = values_; operator = operator_; name = name_ } : filter_condition)

let make_list_domains_request ?max_items:(max_items_ : page_max_items option)
    ?marker:(marker_ : page_marker option) ?sort_condition:(sort_condition_ : sort_condition option)
    ?filter_conditions:(filter_conditions_ : filter_conditions option) () =
  ({
     max_items = max_items_;
     marker = marker_;
     sort_condition = sort_condition_;
     filter_conditions = filter_conditions_;
   }
    : list_domains_request)

let make_get_operation_detail_response ?status_flag:(status_flag_ : status_flag option)
    ?last_updated_date:(last_updated_date_ : timestamp option)
    ?submitted_date:(submitted_date_ : timestamp option) ?type_:(type__ : operation_type option)
    ?domain_name:(domain_name_ : domain_name option) ?message:(message_ : error_message option)
    ?status:(status_ : operation_status option) ?operation_id:(operation_id_ : operation_id option)
    () =
  ({
     status_flag = status_flag_;
     last_updated_date = last_updated_date_;
     submitted_date = submitted_date_;
     type_ = type__;
     domain_name = domain_name_;
     message = message_;
     status = status_;
     operation_id = operation_id_;
   }
    : get_operation_detail_response)

let make_get_operation_detail_request ~operation_id:(operation_id_ : operation_id) () =
  ({ operation_id = operation_id_ } : get_operation_detail_request)

let make_domain_suggestion ?availability:(availability_ : string_ option)
    ?domain_name:(domain_name_ : domain_name option) () =
  ({ availability = availability_; domain_name = domain_name_ } : domain_suggestion)

let make_get_domain_suggestions_response
    ?suggestions_list:(suggestions_list_ : domain_suggestions_list option) () =
  ({ suggestions_list = suggestions_list_ } : get_domain_suggestions_response)

let make_get_domain_suggestions_request ~only_available:(only_available_ : boolean_)
    ~suggestion_count:(suggestion_count_ : integer) ~domain_name:(domain_name_ : domain_name) () =
  ({
     only_available = only_available_;
     suggestion_count = suggestion_count_;
     domain_name = domain_name_;
   }
    : get_domain_suggestions_request)

let make_dnssec_key ?id:(id_ : string_ option) ?key_tag:(key_tag_ : nullable_integer option)
    ?digest:(digest_ : string_ option) ?digest_type:(digest_type_ : nullable_integer option)
    ?public_key:(public_key_ : dnssec_public_key option) ?flags:(flags_ : nullable_integer option)
    ?algorithm:(algorithm_ : nullable_integer option) () =
  ({
     id = id_;
     key_tag = key_tag_;
     digest = digest_;
     digest_type = digest_type_;
     public_key = public_key_;
     flags = flags_;
     algorithm = algorithm_;
   }
    : dnssec_key)

let make_get_domain_detail_response ?billing_privacy:(billing_privacy_ : boolean_ option)
    ?billing_contact:(billing_contact_ : contact_detail option)
    ?dnssec_keys:(dnssec_keys_ : dnssec_key_list option)
    ?status_list:(status_list_ : domain_status_list option) ?dns_sec:(dns_sec_ : dns_sec option)
    ?reseller:(reseller_ : reseller option) ?expiration_date:(expiration_date_ : timestamp option)
    ?updated_date:(updated_date_ : timestamp option)
    ?creation_date:(creation_date_ : timestamp option)
    ?registry_domain_id:(registry_domain_id_ : registry_domain_id option)
    ?abuse_contact_phone:(abuse_contact_phone_ : contact_number option)
    ?abuse_contact_email:(abuse_contact_email_ : email option)
    ?registrar_url:(registrar_url_ : registrar_url option)
    ?who_is_server:(who_is_server_ : registrar_who_is_server option)
    ?registrar_name:(registrar_name_ : registrar_name option)
    ?tech_privacy:(tech_privacy_ : boolean_ option)
    ?registrant_privacy:(registrant_privacy_ : boolean_ option)
    ?admin_privacy:(admin_privacy_ : boolean_ option)
    ?tech_contact:(tech_contact_ : contact_detail option)
    ?registrant_contact:(registrant_contact_ : contact_detail option)
    ?admin_contact:(admin_contact_ : contact_detail option)
    ?auto_renew:(auto_renew_ : boolean_ option) ?nameservers:(nameservers_ : nameserver_list option)
    ?domain_name:(domain_name_ : domain_name option) () =
  ({
     billing_privacy = billing_privacy_;
     billing_contact = billing_contact_;
     dnssec_keys = dnssec_keys_;
     status_list = status_list_;
     dns_sec = dns_sec_;
     reseller = reseller_;
     expiration_date = expiration_date_;
     updated_date = updated_date_;
     creation_date = creation_date_;
     registry_domain_id = registry_domain_id_;
     abuse_contact_phone = abuse_contact_phone_;
     abuse_contact_email = abuse_contact_email_;
     registrar_url = registrar_url_;
     who_is_server = who_is_server_;
     registrar_name = registrar_name_;
     tech_privacy = tech_privacy_;
     registrant_privacy = registrant_privacy_;
     admin_privacy = admin_privacy_;
     tech_contact = tech_contact_;
     registrant_contact = registrant_contact_;
     admin_contact = admin_contact_;
     auto_renew = auto_renew_;
     nameservers = nameservers_;
     domain_name = domain_name_;
   }
    : get_domain_detail_response)

let make_get_domain_detail_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : get_domain_detail_request)

let make_get_contact_reachability_status_response ?status:(status_ : reachability_status option)
    ?domain_name:(domain_name_ : domain_name option) () =
  ({ status = status_; domain_name = domain_name_ } : get_contact_reachability_status_response)

let make_get_contact_reachability_status_request ?domain_name:(domain_name_ : domain_name option) ()
    =
  ({ domain_name = domain_name_ } : get_contact_reachability_status_request)

let make_enable_domain_transfer_lock_response ?operation_id:(operation_id_ : operation_id option) ()
    =
  ({ operation_id = operation_id_ } : enable_domain_transfer_lock_response)

let make_enable_domain_transfer_lock_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : enable_domain_transfer_lock_request)

let make_enable_domain_auto_renew_response () = (() : unit)

let make_enable_domain_auto_renew_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : enable_domain_auto_renew_request)

let make_disassociate_delegation_signer_from_domain_response
    ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : disassociate_delegation_signer_from_domain_response)

let make_disassociate_delegation_signer_from_domain_request ~id:(id_ : string_)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ id = id_; domain_name = domain_name_ } : disassociate_delegation_signer_from_domain_request)

let make_disable_domain_transfer_lock_response ?operation_id:(operation_id_ : operation_id option)
    () =
  ({ operation_id = operation_id_ } : disable_domain_transfer_lock_response)

let make_disable_domain_transfer_lock_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : disable_domain_transfer_lock_request)

let make_disable_domain_auto_renew_response () = (() : unit)

let make_disable_domain_auto_renew_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : disable_domain_auto_renew_request)

let make_delete_tags_for_domain_response () = (() : unit)

let make_delete_tags_for_domain_request ~tags_to_delete:(tags_to_delete_ : tag_key_list)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ tags_to_delete = tags_to_delete_; domain_name = domain_name_ }
    : delete_tags_for_domain_request)

let make_delete_domain_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : delete_domain_response)

let make_delete_domain_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : delete_domain_request)

let make_domain_transferability ?transferable:(transferable_ : transferable option) () =
  ({ transferable = transferable_ } : domain_transferability)

let make_check_domain_transferability_response ?message:(message_ : message option)
    ?transferability:(transferability_ : domain_transferability option) () =
  ({ message = message_; transferability = transferability_ }
    : check_domain_transferability_response)

let make_check_domain_transferability_request ?auth_code:(auth_code_ : domain_auth_code option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ auth_code = auth_code_; domain_name = domain_name_ } : check_domain_transferability_request)

let make_check_domain_availability_response
    ?availability:(availability_ : domain_availability option) () =
  ({ availability = availability_ } : check_domain_availability_response)

let make_check_domain_availability_request ?idn_lang_code:(idn_lang_code_ : lang_code option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ idn_lang_code = idn_lang_code_; domain_name = domain_name_ }
    : check_domain_availability_request)

let make_cancel_domain_transfer_to_another_aws_account_response
    ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : cancel_domain_transfer_to_another_aws_account_response)

let make_cancel_domain_transfer_to_another_aws_account_request
    ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : cancel_domain_transfer_to_another_aws_account_request)

let make_associate_delegation_signer_to_domain_response
    ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : associate_delegation_signer_to_domain_response)

let make_dnssec_signing_attributes ?public_key:(public_key_ : dnssec_public_key option)
    ?flags:(flags_ : nullable_integer option) ?algorithm:(algorithm_ : nullable_integer option) () =
  ({ public_key = public_key_; flags = flags_; algorithm = algorithm_ } : dnssec_signing_attributes)

let make_associate_delegation_signer_to_domain_request
    ~signing_attributes:(signing_attributes_ : dnssec_signing_attributes)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ signing_attributes = signing_attributes_; domain_name = domain_name_ }
    : associate_delegation_signer_to_domain_request)

let make_accept_domain_transfer_from_another_aws_account_response
    ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : accept_domain_transfer_from_another_aws_account_response)

let make_accept_domain_transfer_from_another_aws_account_request ~password:(password_ : password)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ password = password_; domain_name = domain_name_ }
    : accept_domain_transfer_from_another_aws_account_request)
