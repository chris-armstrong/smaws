open Types

let make_fees_breakdown_amount ?description:(description_ : basic_string option)
    ?amount:(amount_ : basic_string option) ?rate:(rate_ : basic_string option) () =
  ({ description = description_; amount = amount_; rate = rate_ } : fees_breakdown_amount)

let make_fees_breakdown ?breakdown:(breakdown_ : fees_breakdown_amount_list option)
    ?total_amount:(total_amount_ : basic_string option) () =
  ({ breakdown = breakdown_; total_amount = total_amount_ } : fees_breakdown)

let make_taxes_breakdown_amount ?description:(description_ : basic_string option)
    ?amount:(amount_ : basic_string option) ?rate:(rate_ : basic_string option) () =
  ({ description = description_; amount = amount_; rate = rate_ } : taxes_breakdown_amount)

let make_taxes_breakdown ?breakdown:(breakdown_ : taxes_breakdown_amount_list option)
    ?total_amount:(total_amount_ : basic_string option) () =
  ({ breakdown = breakdown_; total_amount = total_amount_ } : taxes_breakdown)

let make_discounts_breakdown_amount ?description:(description_ : basic_string option)
    ?amount:(amount_ : basic_string option) ?rate:(rate_ : basic_string option) () =
  ({ description = description_; amount = amount_; rate = rate_ } : discounts_breakdown_amount)

let make_discounts_breakdown ?breakdown:(breakdown_ : discounts_breakdown_amount_list option)
    ?total_amount:(total_amount_ : basic_string option) () =
  ({ breakdown = breakdown_; total_amount = total_amount_ } : discounts_breakdown)

let make_amount_breakdown ?sub_total_amount:(sub_total_amount_ : basic_string option)
    ?discounts:(discounts_ : discounts_breakdown option) ?taxes:(taxes_ : taxes_breakdown option)
    ?fees:(fees_ : fees_breakdown option) () =
  ({ sub_total_amount = sub_total_amount_; discounts = discounts_; taxes = taxes_; fees = fees_ }
    : amount_breakdown)

let make_validation_exception_field ~name:(name_ : basic_string) ~message:(message_ : basic_string)
    () =
  ({ name = name_; message = message_ } : validation_exception_field)

let make_receiver_address ?address_line1:(address_line1_ : basic_string option)
    ?address_line2:(address_line2_ : basic_string option)
    ?address_line3:(address_line3_ : basic_string option)
    ?district_or_county:(district_or_county_ : basic_string option)
    ?city:(city_ : basic_string option) ?state_or_region:(state_or_region_ : basic_string option)
    ?country_code:(country_code_ : basic_string option)
    ?company_name:(company_name_ : basic_string option)
    ?postal_code:(postal_code_ : basic_string option) () =
  ({
     address_line1 = address_line1_;
     address_line2 = address_line2_;
     address_line3 = address_line3_;
     district_or_county = district_or_county_;
     city = city_;
     state_or_region = state_or_region_;
     country_code = country_code_;
     company_name = company_name_;
     postal_code = postal_code_;
   }
    : receiver_address)

let make_invoice_profile ?account_id:(account_id_ : account_id_string option)
    ?receiver_name:(receiver_name_ : basic_string_without_space option)
    ?receiver_address:(receiver_address_ : receiver_address option)
    ?receiver_email:(receiver_email_ : sensitive_basic_string_without_space option)
    ?issuer:(issuer_ : basic_string_without_space option)
    ?tax_registration_number:
      (tax_registration_number_ : sensitive_basic_string_without_space option) () =
  ({
     account_id = account_id_;
     receiver_name = receiver_name_;
     receiver_address = receiver_address_;
     receiver_email = receiver_email_;
     issuer = issuer_;
     tax_registration_number = tax_registration_number_;
   }
    : invoice_profile)

let make_batch_get_invoice_profile_response ?profiles:(profiles_ : profile_list option) () =
  ({ profiles = profiles_ } : batch_get_invoice_profile_response)

let make_batch_get_invoice_profile_request ~account_ids:(account_ids_ : account_id_list) () =
  ({ account_ids = account_ids_ } : batch_get_invoice_profile_request)

let make_billing_period ~month:(month_ : month) ~year:(year_ : year) () =
  ({ month = month_; year = year_ } : billing_period)

let make_contact ?name:(name_ : basic_string option) ?email:(email_ : email_string option) () =
  ({ name = name_; email = email_ } : contact)

let make_create_invoice_unit_response
    ?invoice_unit_arn:(invoice_unit_arn_ : invoice_unit_arn_string option) () =
  ({ invoice_unit_arn = invoice_unit_arn_ } : create_invoice_unit_response)

let make_resource_tag ~key:(key_ : resource_tag_key) ~value:(value_ : resource_tag_value) () =
  ({ key = key_; value = value_ } : resource_tag)

let make_invoice_unit_rule ?linked_accounts:(linked_accounts_ : rule_account_id_list option)
    ?bill_source_accounts:(bill_source_accounts_ : rule_account_id_list option) () =
  ({ linked_accounts = linked_accounts_; bill_source_accounts = bill_source_accounts_ }
    : invoice_unit_rule)

let make_create_invoice_unit_request ?description:(description_ : description_string option)
    ?tax_inheritance_disabled:(tax_inheritance_disabled_ : tax_inheritance_disabled_flag option)
    ?resource_tags:(resource_tags_ : resource_tag_list option)
    ?client_token:(client_token_ : basic_string_without_space option)
    ~name:(name_ : invoice_unit_name) ~invoice_receiver:(invoice_receiver_ : account_id_string)
    ~rule:(rule_ : invoice_unit_rule) () =
  ({
     name = name_;
     invoice_receiver = invoice_receiver_;
     description = description_;
     tax_inheritance_disabled = tax_inheritance_disabled_;
     rule = rule_;
     resource_tags = resource_tags_;
     client_token = client_token_;
   }
    : create_invoice_unit_request)

let make_create_procurement_portal_preference_response
    ~procurement_portal_preference_arn:
      (procurement_portal_preference_arn_ : procurement_portal_preference_arn_string) () =
  ({ procurement_portal_preference_arn = procurement_portal_preference_arn_ }
    : create_procurement_portal_preference_response)

let make_purchase_order_data_source
    ?einvoice_delivery_document_type:
      (einvoice_delivery_document_type_ : einvoice_delivery_document_type option)
    ?purchase_order_data_source_type:
      (purchase_order_data_source_type_ : purchase_order_data_source_type option) () =
  ({
     einvoice_delivery_document_type = einvoice_delivery_document_type_;
     purchase_order_data_source_type = purchase_order_data_source_type_;
   }
    : purchase_order_data_source)

let make_einvoice_delivery_preference
    ?einvoice_delivery_attachment_types:
      (einvoice_delivery_attachment_types_ : einvoice_delivery_attachment_types option)
    ~einvoice_delivery_document_types:
      (einvoice_delivery_document_types_ : einvoice_delivery_document_types)
    ~protocol:(protocol_ : protocol)
    ~purchase_order_data_sources:(purchase_order_data_sources_ : purchase_order_data_sources)
    ~connection_testing_method:(connection_testing_method_ : connection_testing_method)
    ~einvoice_delivery_activation_date:
      (einvoice_delivery_activation_date_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     einvoice_delivery_document_types = einvoice_delivery_document_types_;
     einvoice_delivery_attachment_types = einvoice_delivery_attachment_types_;
     protocol = protocol_;
     purchase_order_data_sources = purchase_order_data_sources_;
     connection_testing_method = connection_testing_method_;
     einvoice_delivery_activation_date = einvoice_delivery_activation_date_;
   }
    : einvoice_delivery_preference)

let make_test_env_preference_input
    ?procurement_portal_shared_secret:
      (procurement_portal_shared_secret_ : basic_string_without_space option)
    ?procurement_portal_instance_endpoint:
      (procurement_portal_instance_endpoint_ : basic_string_without_space option)
    ~buyer_domain:(buyer_domain_ : buyer_domain)
    ~buyer_identifier:(buyer_identifier_ : basic_string_without_space)
    ~supplier_domain:(supplier_domain_ : supplier_domain)
    ~supplier_identifier:(supplier_identifier_ : basic_string_without_space) () =
  ({
     buyer_domain = buyer_domain_;
     buyer_identifier = buyer_identifier_;
     supplier_domain = supplier_domain_;
     supplier_identifier = supplier_identifier_;
     procurement_portal_shared_secret = procurement_portal_shared_secret_;
     procurement_portal_instance_endpoint = procurement_portal_instance_endpoint_;
   }
    : test_env_preference_input)

let make_procurement_portal_preference_selector
    ?invoice_unit_arns:(invoice_unit_arns_ : invoice_unit_arns option)
    ?seller_of_records:(seller_of_records_ : seller_of_records option) () =
  ({ invoice_unit_arns = invoice_unit_arns_; seller_of_records = seller_of_records_ }
    : procurement_portal_preference_selector)

let make_create_procurement_portal_preference_request
    ?selector:(selector_ : procurement_portal_preference_selector option)
    ?procurement_portal_shared_secret:
      (procurement_portal_shared_secret_ : sensitive_basic_string_without_space option)
    ?procurement_portal_instance_endpoint:
      (procurement_portal_instance_endpoint_ : basic_string_without_space option)
    ?test_env_preference:(test_env_preference_ : test_env_preference_input option)
    ?einvoice_delivery_preference:
      (einvoice_delivery_preference_ : einvoice_delivery_preference option)
    ?resource_tags:(resource_tags_ : resource_tag_list option)
    ?client_token:(client_token_ : basic_string_without_space option)
    ~procurement_portal_name:(procurement_portal_name_ : procurement_portal_name)
    ~buyer_domain:(buyer_domain_ : buyer_domain)
    ~buyer_identifier:(buyer_identifier_ : basic_string_without_space)
    ~supplier_domain:(supplier_domain_ : supplier_domain)
    ~supplier_identifier:(supplier_identifier_ : basic_string_without_space)
    ~einvoice_delivery_enabled:(einvoice_delivery_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~purchase_order_retrieval_enabled:
      (purchase_order_retrieval_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~contacts:(contacts_ : contacts) () =
  ({
     procurement_portal_name = procurement_portal_name_;
     buyer_domain = buyer_domain_;
     buyer_identifier = buyer_identifier_;
     supplier_domain = supplier_domain_;
     supplier_identifier = supplier_identifier_;
     selector = selector_;
     procurement_portal_shared_secret = procurement_portal_shared_secret_;
     procurement_portal_instance_endpoint = procurement_portal_instance_endpoint_;
     test_env_preference = test_env_preference_;
     einvoice_delivery_enabled = einvoice_delivery_enabled_;
     einvoice_delivery_preference = einvoice_delivery_preference_;
     purchase_order_retrieval_enabled = purchase_order_retrieval_enabled_;
     contacts = contacts_;
     resource_tags = resource_tags_;
     client_token = client_token_;
   }
    : create_procurement_portal_preference_request)

let make_currency_exchange_details
    ?source_currency_code:(source_currency_code_ : basic_string option)
    ?target_currency_code:(target_currency_code_ : basic_string option)
    ?rate:(rate_ : basic_string option) () =
  ({
     source_currency_code = source_currency_code_;
     target_currency_code = target_currency_code_;
     rate = rate_;
   }
    : currency_exchange_details)

let make_date_interval ~start_date:(start_date_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~end_date:(end_date_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ start_date = start_date_; end_date = end_date_ } : date_interval)

let make_delete_invoice_unit_response
    ?invoice_unit_arn:(invoice_unit_arn_ : invoice_unit_arn_string option) () =
  ({ invoice_unit_arn = invoice_unit_arn_ } : delete_invoice_unit_response)

let make_delete_invoice_unit_request
    ?client_token:(client_token_ : basic_string_without_space option)
    ~invoice_unit_arn:(invoice_unit_arn_ : invoice_unit_arn_string) () =
  ({ invoice_unit_arn = invoice_unit_arn_; client_token = client_token_ }
    : delete_invoice_unit_request)

let make_delete_procurement_portal_preference_response
    ~procurement_portal_preference_arn:
      (procurement_portal_preference_arn_ : procurement_portal_preference_arn_string) () =
  ({ procurement_portal_preference_arn = procurement_portal_preference_arn_ }
    : delete_procurement_portal_preference_response)

let make_delete_procurement_portal_preference_request
    ?client_token:(client_token_ : basic_string_without_space option)
    ~procurement_portal_preference_arn:
      (procurement_portal_preference_arn_ : procurement_portal_preference_arn_string) () =
  ({
     procurement_portal_preference_arn = procurement_portal_preference_arn_;
     client_token = client_token_;
   }
    : delete_procurement_portal_preference_request)

let make_entity ?invoicing_entity:(invoicing_entity_ : basic_string option)
    ?billing_entity:(billing_entity_ : billing_entity option) () =
  ({ invoicing_entity = invoicing_entity_; billing_entity = billing_entity_ } : entity)

let make_filters ?names:(names_ : invoice_unit_names option)
    ?invoice_receivers:(invoice_receivers_ : account_id_list option)
    ?accounts:(accounts_ : account_id_list option)
    ?bill_source_accounts:(bill_source_accounts_ : account_id_list option) () =
  ({
     names = names_;
     invoice_receivers = invoice_receivers_;
     accounts = accounts_;
     bill_source_accounts = bill_source_accounts_;
   }
    : filters)

let make_supplemental_document ?document_type:(document_type_ : supplemental_document_type option)
    ?document_id:(document_id_ : string_without_new_line option)
    ?document_url:(document_url_ : string_without_new_line option)
    ?document_url_expiration_date:
      (document_url_expiration_date_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     document_type = document_type_;
     document_id = document_id_;
     document_url = document_url_;
     document_url_expiration_date = document_url_expiration_date_;
   }
    : supplemental_document)

let make_invoice_pd_f ?invoice_id:(invoice_id_ : string_without_new_line option)
    ?document_url:(document_url_ : string_without_new_line option)
    ?document_url_expiration_date:
      (document_url_expiration_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?supplemental_documents:(supplemental_documents_ : supplemental_documents option) () =
  ({
     invoice_id = invoice_id_;
     document_url = document_url_;
     document_url_expiration_date = document_url_expiration_date_;
     supplemental_documents = supplemental_documents_;
   }
    : invoice_pd_f)

let make_get_invoice_pdf_response ?invoice_pd_f:(invoice_pd_f_ : invoice_pd_f option) () =
  ({ invoice_pd_f = invoice_pd_f_ } : get_invoice_pdf_response)

let make_get_invoice_pdf_request ~invoice_id:(invoice_id_ : string_without_new_line) () =
  ({ invoice_id = invoice_id_ } : get_invoice_pdf_request)

let make_get_invoice_unit_response
    ?invoice_unit_arn:(invoice_unit_arn_ : invoice_unit_arn_string option)
    ?invoice_receiver:(invoice_receiver_ : account_id_string option)
    ?name:(name_ : invoice_unit_name option) ?description:(description_ : description_string option)
    ?tax_inheritance_disabled:(tax_inheritance_disabled_ : tax_inheritance_disabled_flag option)
    ?rule:(rule_ : invoice_unit_rule option)
    ?last_modified:(last_modified_ : last_modified_timestamp option) () =
  ({
     invoice_unit_arn = invoice_unit_arn_;
     invoice_receiver = invoice_receiver_;
     name = name_;
     description = description_;
     tax_inheritance_disabled = tax_inheritance_disabled_;
     rule = rule_;
     last_modified = last_modified_;
   }
    : get_invoice_unit_response)

let make_get_invoice_unit_request ?as_of:(as_of_ : as_of_timestamp option)
    ~invoice_unit_arn:(invoice_unit_arn_ : invoice_unit_arn_string) () =
  ({ invoice_unit_arn = invoice_unit_arn_; as_of = as_of_ } : get_invoice_unit_request)

let make_test_env_preference
    ?procurement_portal_shared_secret:
      (procurement_portal_shared_secret_ : basic_string_without_space option)
    ?procurement_portal_instance_endpoint:
      (procurement_portal_instance_endpoint_ : basic_string_without_space option)
    ?purchase_order_retrieval_endpoint:
      (purchase_order_retrieval_endpoint_ : basic_string_without_space option)
    ~buyer_domain:(buyer_domain_ : buyer_domain)
    ~buyer_identifier:(buyer_identifier_ : basic_string_without_space)
    ~supplier_domain:(supplier_domain_ : supplier_domain)
    ~supplier_identifier:(supplier_identifier_ : basic_string_without_space) () =
  ({
     buyer_domain = buyer_domain_;
     buyer_identifier = buyer_identifier_;
     supplier_domain = supplier_domain_;
     supplier_identifier = supplier_identifier_;
     procurement_portal_shared_secret = procurement_portal_shared_secret_;
     procurement_portal_instance_endpoint = procurement_portal_instance_endpoint_;
     purchase_order_retrieval_endpoint = purchase_order_retrieval_endpoint_;
   }
    : test_env_preference)

let make_procurement_portal_preference
    ?selector:(selector_ : procurement_portal_preference_selector option)
    ?procurement_portal_shared_secret:
      (procurement_portal_shared_secret_ : basic_string_without_space option)
    ?procurement_portal_instance_endpoint:
      (procurement_portal_instance_endpoint_ : basic_string_without_space option)
    ?purchase_order_retrieval_endpoint:
      (purchase_order_retrieval_endpoint_ : basic_string_without_space option)
    ?test_env_preference:(test_env_preference_ : test_env_preference option)
    ?einvoice_delivery_preference:
      (einvoice_delivery_preference_ : einvoice_delivery_preference option)
    ?contacts:(contacts_ : contacts option)
    ?einvoice_delivery_preference_status:
      (einvoice_delivery_preference_status_ : procurement_portal_preference_status option)
    ?einvoice_delivery_preference_status_reason:
      (einvoice_delivery_preference_status_reason_ : basic_string option)
    ?purchase_order_retrieval_preference_status:
      (purchase_order_retrieval_preference_status_ : procurement_portal_preference_status option)
    ?purchase_order_retrieval_preference_status_reason:
      (purchase_order_retrieval_preference_status_reason_ : basic_string option)
    ~aws_account_id:(aws_account_id_ : account_id_string)
    ~procurement_portal_preference_arn:
      (procurement_portal_preference_arn_ : procurement_portal_preference_arn_string)
    ~procurement_portal_name:(procurement_portal_name_ : procurement_portal_name)
    ~buyer_domain:(buyer_domain_ : buyer_domain)
    ~buyer_identifier:(buyer_identifier_ : basic_string_without_space)
    ~supplier_domain:(supplier_domain_ : supplier_domain)
    ~supplier_identifier:(supplier_identifier_ : basic_string_without_space)
    ~einvoice_delivery_enabled:(einvoice_delivery_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~purchase_order_retrieval_enabled:
      (purchase_order_retrieval_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~version:(version_ : Smaws_Lib.Smithy_api.Types.long)
    ~create_date:(create_date_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_update_date:(last_update_date_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     aws_account_id = aws_account_id_;
     procurement_portal_preference_arn = procurement_portal_preference_arn_;
     procurement_portal_name = procurement_portal_name_;
     buyer_domain = buyer_domain_;
     buyer_identifier = buyer_identifier_;
     supplier_domain = supplier_domain_;
     supplier_identifier = supplier_identifier_;
     selector = selector_;
     procurement_portal_shared_secret = procurement_portal_shared_secret_;
     procurement_portal_instance_endpoint = procurement_portal_instance_endpoint_;
     purchase_order_retrieval_endpoint = purchase_order_retrieval_endpoint_;
     test_env_preference = test_env_preference_;
     einvoice_delivery_enabled = einvoice_delivery_enabled_;
     einvoice_delivery_preference = einvoice_delivery_preference_;
     purchase_order_retrieval_enabled = purchase_order_retrieval_enabled_;
     contacts = contacts_;
     einvoice_delivery_preference_status = einvoice_delivery_preference_status_;
     einvoice_delivery_preference_status_reason = einvoice_delivery_preference_status_reason_;
     purchase_order_retrieval_preference_status = purchase_order_retrieval_preference_status_;
     purchase_order_retrieval_preference_status_reason =
       purchase_order_retrieval_preference_status_reason_;
     version = version_;
     create_date = create_date_;
     last_update_date = last_update_date_;
   }
    : procurement_portal_preference)

let make_get_procurement_portal_preference_response
    ~procurement_portal_preference:(procurement_portal_preference_ : procurement_portal_preference)
    () =
  ({ procurement_portal_preference = procurement_portal_preference_ }
    : get_procurement_portal_preference_response)

let make_get_procurement_portal_preference_request
    ~procurement_portal_preference_arn:
      (procurement_portal_preference_arn_ : procurement_portal_preference_arn_string) () =
  ({ procurement_portal_preference_arn = procurement_portal_preference_arn_ }
    : get_procurement_portal_preference_request)

let make_invoice_currency_amount ?total_amount:(total_amount_ : basic_string option)
    ?total_amount_before_tax:(total_amount_before_tax_ : basic_string option)
    ?currency_code:(currency_code_ : currency_code option)
    ?amount_breakdown:(amount_breakdown_ : amount_breakdown option)
    ?currency_exchange_details:(currency_exchange_details_ : currency_exchange_details option) () =
  ({
     total_amount = total_amount_;
     total_amount_before_tax = total_amount_before_tax_;
     currency_code = currency_code_;
     amount_breakdown = amount_breakdown_;
     currency_exchange_details = currency_exchange_details_;
   }
    : invoice_currency_amount)

let make_invoice_summary ?account_id:(account_id_ : account_id_string option)
    ?invoice_id:(invoice_id_ : basic_string option)
    ?issued_date:(issued_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?due_date:(due_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?bill_source_accounts:(bill_source_accounts_ : bill_source_account_list option)
    ?bill_source_accounts_total_count:
      (bill_source_accounts_total_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?receiver_role:(receiver_role_ : receiver_role option) ?entity:(entity_ : entity option)
    ?billing_period:(billing_period_ : billing_period option)
    ?invoice_frequency:(invoice_frequency_ : invoice_frequency option)
    ?bill_type:(bill_type_ : bill_type option) ?invoice_type:(invoice_type_ : invoice_type option)
    ?commercial_invoice_id:(commercial_invoice_id_ : basic_string option)
    ?original_invoice_id:(original_invoice_id_ : basic_string option)
    ?purchase_order_number:(purchase_order_number_ : basic_string option)
    ?einvoice_delivery_status:(einvoice_delivery_status_ : einvoice_delivery_status option)
    ?tax_authority_status:(tax_authority_status_ : tax_authority_status option)
    ?base_currency_amount:(base_currency_amount_ : invoice_currency_amount option)
    ?tax_currency_amount:(tax_currency_amount_ : invoice_currency_amount option)
    ?payment_currency_amount:(payment_currency_amount_ : invoice_currency_amount option) () =
  ({
     account_id = account_id_;
     invoice_id = invoice_id_;
     issued_date = issued_date_;
     due_date = due_date_;
     bill_source_accounts = bill_source_accounts_;
     bill_source_accounts_total_count = bill_source_accounts_total_count_;
     receiver_role = receiver_role_;
     entity = entity_;
     billing_period = billing_period_;
     invoice_frequency = invoice_frequency_;
     bill_type = bill_type_;
     invoice_type = invoice_type_;
     commercial_invoice_id = commercial_invoice_id_;
     original_invoice_id = original_invoice_id_;
     purchase_order_number = purchase_order_number_;
     einvoice_delivery_status = einvoice_delivery_status_;
     tax_authority_status = tax_authority_status_;
     base_currency_amount = base_currency_amount_;
     tax_currency_amount = tax_currency_amount_;
     payment_currency_amount = payment_currency_amount_;
   }
    : invoice_summary)

let make_invoice_summaries_filter ?time_interval:(time_interval_ : date_interval option)
    ?billing_period:(billing_period_ : billing_period option)
    ?invoicing_entity:(invoicing_entity_ : basic_string option)
    ?receiver_role:(receiver_role_ : receiver_role option) () =
  ({
     time_interval = time_interval_;
     billing_period = billing_period_;
     invoicing_entity = invoicing_entity_;
     receiver_role = receiver_role_;
   }
    : invoice_summaries_filter)

let make_invoice_summaries_selector
    ~resource_type:(resource_type_ : list_invoice_summaries_resource_type)
    ~value:(value_ : string_without_new_line) () =
  ({ resource_type = resource_type_; value = value_ } : invoice_summaries_selector)

let make_invoice_unit ?invoice_unit_arn:(invoice_unit_arn_ : invoice_unit_arn_string option)
    ?invoice_receiver:(invoice_receiver_ : account_id_string option)
    ?name:(name_ : invoice_unit_name option) ?description:(description_ : description_string option)
    ?tax_inheritance_disabled:(tax_inheritance_disabled_ : tax_inheritance_disabled_flag option)
    ?rule:(rule_ : invoice_unit_rule option)
    ?last_modified:(last_modified_ : last_modified_timestamp option) () =
  ({
     invoice_unit_arn = invoice_unit_arn_;
     invoice_receiver = invoice_receiver_;
     name = name_;
     description = description_;
     tax_inheritance_disabled = tax_inheritance_disabled_;
     rule = rule_;
     last_modified = last_modified_;
   }
    : invoice_unit)

let make_update_procurement_portal_preference_status_response
    ~procurement_portal_preference_arn:
      (procurement_portal_preference_arn_ : procurement_portal_preference_arn_string) () =
  ({ procurement_portal_preference_arn = procurement_portal_preference_arn_ }
    : update_procurement_portal_preference_status_response)

let make_update_procurement_portal_preference_status_request
    ?einvoice_delivery_preference_status:
      (einvoice_delivery_preference_status_ : procurement_portal_preference_status option)
    ?einvoice_delivery_preference_status_reason:
      (einvoice_delivery_preference_status_reason_ : basic_string option)
    ?purchase_order_retrieval_preference_status:
      (purchase_order_retrieval_preference_status_ : procurement_portal_preference_status option)
    ?purchase_order_retrieval_preference_status_reason:
      (purchase_order_retrieval_preference_status_reason_ : basic_string option)
    ?client_token:(client_token_ : basic_string_without_space option)
    ~procurement_portal_preference_arn:
      (procurement_portal_preference_arn_ : procurement_portal_preference_arn_string) () =
  ({
     procurement_portal_preference_arn = procurement_portal_preference_arn_;
     einvoice_delivery_preference_status = einvoice_delivery_preference_status_;
     einvoice_delivery_preference_status_reason = einvoice_delivery_preference_status_reason_;
     purchase_order_retrieval_preference_status = purchase_order_retrieval_preference_status_;
     purchase_order_retrieval_preference_status_reason =
       purchase_order_retrieval_preference_status_reason_;
     client_token = client_token_;
   }
    : update_procurement_portal_preference_status_request)

let make_update_invoice_unit_response
    ?invoice_unit_arn:(invoice_unit_arn_ : invoice_unit_arn_string option) () =
  ({ invoice_unit_arn = invoice_unit_arn_ } : update_invoice_unit_response)

let make_update_invoice_unit_request ?description:(description_ : description_string option)
    ?tax_inheritance_disabled:(tax_inheritance_disabled_ : tax_inheritance_disabled_flag option)
    ?rule:(rule_ : invoice_unit_rule option)
    ?client_token:(client_token_ : basic_string_without_space option)
    ~invoice_unit_arn:(invoice_unit_arn_ : invoice_unit_arn_string) () =
  ({
     invoice_unit_arn = invoice_unit_arn_;
     description = description_;
     tax_inheritance_disabled = tax_inheritance_disabled_;
     rule = rule_;
     client_token = client_token_;
   }
    : update_invoice_unit_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : tagris_arn)
    ~resource_tag_keys:(resource_tag_keys_ : resource_tag_key_list) () =
  ({ resource_arn = resource_arn_; resource_tag_keys = resource_tag_keys_ }
    : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : tagris_arn)
    ~resource_tags:(resource_tags_ : resource_tag_list) () =
  ({ resource_arn = resource_arn_; resource_tags = resource_tags_ } : tag_resource_request)

let make_put_procurement_portal_preference_response
    ~procurement_portal_preference_arn:
      (procurement_portal_preference_arn_ : procurement_portal_preference_arn_string) () =
  ({ procurement_portal_preference_arn = procurement_portal_preference_arn_ }
    : put_procurement_portal_preference_response)

let make_put_procurement_portal_preference_request
    ?selector:(selector_ : procurement_portal_preference_selector option)
    ?procurement_portal_shared_secret:
      (procurement_portal_shared_secret_ : sensitive_basic_string_without_space option)
    ?procurement_portal_instance_endpoint:
      (procurement_portal_instance_endpoint_ : basic_string_without_space option)
    ?test_env_preference:(test_env_preference_ : test_env_preference_input option)
    ?einvoice_delivery_preference:
      (einvoice_delivery_preference_ : einvoice_delivery_preference option)
    ?client_token:(client_token_ : basic_string_without_space option)
    ~procurement_portal_preference_arn:
      (procurement_portal_preference_arn_ : procurement_portal_preference_arn_string)
    ~einvoice_delivery_enabled:(einvoice_delivery_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~purchase_order_retrieval_enabled:
      (purchase_order_retrieval_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~contacts:(contacts_ : contacts) () =
  ({
     procurement_portal_preference_arn = procurement_portal_preference_arn_;
     selector = selector_;
     procurement_portal_shared_secret = procurement_portal_shared_secret_;
     procurement_portal_instance_endpoint = procurement_portal_instance_endpoint_;
     test_env_preference = test_env_preference_;
     einvoice_delivery_enabled = einvoice_delivery_enabled_;
     einvoice_delivery_preference = einvoice_delivery_preference_;
     purchase_order_retrieval_enabled = purchase_order_retrieval_enabled_;
     contacts = contacts_;
     client_token = client_token_;
   }
    : put_procurement_portal_preference_request)

let make_list_tags_for_resource_response ?resource_tags:(resource_tags_ : resource_tag_list option)
    () =
  ({ resource_tags = resource_tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : tagris_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_procurement_portal_preference_summary
    ?selector:(selector_ : procurement_portal_preference_selector option)
    ?einvoice_delivery_preference_status:
      (einvoice_delivery_preference_status_ : procurement_portal_preference_status option)
    ?einvoice_delivery_preference_status_reason:
      (einvoice_delivery_preference_status_reason_ : basic_string option)
    ?purchase_order_retrieval_preference_status:
      (purchase_order_retrieval_preference_status_ : procurement_portal_preference_status option)
    ?purchase_order_retrieval_preference_status_reason:
      (purchase_order_retrieval_preference_status_reason_ : basic_string option)
    ~aws_account_id:(aws_account_id_ : account_id_string)
    ~procurement_portal_preference_arn:
      (procurement_portal_preference_arn_ : procurement_portal_preference_arn_string)
    ~procurement_portal_name:(procurement_portal_name_ : procurement_portal_name)
    ~buyer_domain:(buyer_domain_ : buyer_domain)
    ~buyer_identifier:(buyer_identifier_ : basic_string_without_space)
    ~supplier_domain:(supplier_domain_ : supplier_domain)
    ~supplier_identifier:(supplier_identifier_ : basic_string_without_space)
    ~einvoice_delivery_enabled:(einvoice_delivery_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~purchase_order_retrieval_enabled:
      (purchase_order_retrieval_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~version:(version_ : Smaws_Lib.Smithy_api.Types.long)
    ~create_date:(create_date_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_update_date:(last_update_date_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     aws_account_id = aws_account_id_;
     procurement_portal_preference_arn = procurement_portal_preference_arn_;
     procurement_portal_name = procurement_portal_name_;
     buyer_domain = buyer_domain_;
     buyer_identifier = buyer_identifier_;
     supplier_domain = supplier_domain_;
     supplier_identifier = supplier_identifier_;
     selector = selector_;
     einvoice_delivery_enabled = einvoice_delivery_enabled_;
     purchase_order_retrieval_enabled = purchase_order_retrieval_enabled_;
     einvoice_delivery_preference_status = einvoice_delivery_preference_status_;
     einvoice_delivery_preference_status_reason = einvoice_delivery_preference_status_reason_;
     purchase_order_retrieval_preference_status = purchase_order_retrieval_preference_status_;
     purchase_order_retrieval_preference_status_reason =
       purchase_order_retrieval_preference_status_reason_;
     version = version_;
     create_date = create_date_;
     last_update_date = last_update_date_;
   }
    : procurement_portal_preference_summary)

let make_list_procurement_portal_preferences_response
    ?procurement_portal_preferences:
      (procurement_portal_preferences_ : procurement_portal_preference_summaries option)
    ?next_token:(next_token_ : basic_string_without_space option) () =
  ({ procurement_portal_preferences = procurement_portal_preferences_; next_token = next_token_ }
    : list_procurement_portal_preferences_response)

let make_list_procurement_portal_preferences_request
    ?next_token:(next_token_ : basic_string_without_space option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ }
    : list_procurement_portal_preferences_request)

let make_list_invoice_units_response ?invoice_units:(invoice_units_ : invoice_units option)
    ?next_token:(next_token_ : next_token_string option) () =
  ({ invoice_units = invoice_units_; next_token = next_token_ } : list_invoice_units_response)

let make_list_invoice_units_request ?filters:(filters_ : filters option)
    ?next_token:(next_token_ : next_token_string option)
    ?max_results:(max_results_ : max_results_integer option)
    ?as_of:(as_of_ : as_of_timestamp option) () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_; as_of = as_of_ }
    : list_invoice_units_request)

let make_list_invoice_summaries_response ?next_token:(next_token_ : next_token_string option)
    ~invoice_summaries:(invoice_summaries_ : invoice_summaries) () =
  ({ invoice_summaries = invoice_summaries_; next_token = next_token_ }
    : list_invoice_summaries_response)

let make_list_invoice_summaries_request ?filter:(filter_ : invoice_summaries_filter option)
    ?next_token:(next_token_ : next_token_string option)
    ?max_results:(max_results_ : invoice_summaries_max_results option)
    ~selector:(selector_ : invoice_summaries_selector) () =
  ({ selector = selector_; filter = filter_; next_token = next_token_; max_results = max_results_ }
    : list_invoice_summaries_request)
