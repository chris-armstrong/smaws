open Types

val make_validation_exception_field :
  message:basic_string -> name:basic_string -> unit -> validation_exception_field

val make_update_procurement_portal_preference_status_response :
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  unit ->
  update_procurement_portal_preference_status_response

val make_update_procurement_portal_preference_status_request :
  ?client_token:basic_string_without_space ->
  ?purchase_order_retrieval_preference_status_reason:basic_string ->
  ?purchase_order_retrieval_preference_status:procurement_portal_preference_status ->
  ?einvoice_delivery_preference_status_reason:basic_string ->
  ?einvoice_delivery_preference_status:procurement_portal_preference_status ->
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  unit ->
  update_procurement_portal_preference_status_request

val make_update_invoice_unit_response :
  ?invoice_unit_arn:invoice_unit_arn_string -> unit -> update_invoice_unit_response

val make_invoice_unit_rule :
  ?bill_source_accounts:rule_account_id_list ->
  ?linked_accounts:rule_account_id_list ->
  unit ->
  invoice_unit_rule

val make_update_invoice_unit_request :
  ?client_token:basic_string_without_space ->
  ?rule:invoice_unit_rule ->
  ?tax_inheritance_disabled:tax_inheritance_disabled_flag ->
  ?description:description_string ->
  invoice_unit_arn:invoice_unit_arn_string ->
  unit ->
  update_invoice_unit_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_tag_keys:resource_tag_key_list ->
  resource_arn:tagris_arn ->
  unit ->
  untag_resource_request

val make_test_env_preference_input :
  ?procurement_portal_instance_endpoint:basic_string_without_space ->
  ?procurement_portal_shared_secret:basic_string_without_space ->
  supplier_identifier:basic_string_without_space ->
  supplier_domain:supplier_domain ->
  buyer_identifier:basic_string_without_space ->
  buyer_domain:buyer_domain ->
  unit ->
  test_env_preference_input

val make_test_env_preference :
  ?purchase_order_retrieval_endpoint:basic_string_without_space ->
  ?procurement_portal_instance_endpoint:basic_string_without_space ->
  ?procurement_portal_shared_secret:basic_string_without_space ->
  supplier_identifier:basic_string_without_space ->
  supplier_domain:supplier_domain ->
  buyer_identifier:basic_string_without_space ->
  buyer_domain:buyer_domain ->
  unit ->
  test_env_preference

val make_taxes_breakdown_amount :
  ?rate:basic_string ->
  ?amount:basic_string ->
  ?description:basic_string ->
  unit ->
  taxes_breakdown_amount

val make_taxes_breakdown :
  ?total_amount:basic_string -> ?breakdown:taxes_breakdown_amount_list -> unit -> taxes_breakdown

val make_tag_resource_response : unit -> unit
val make_resource_tag : value:resource_tag_value -> key:resource_tag_key -> unit -> resource_tag

val make_tag_resource_request :
  resource_tags:resource_tag_list -> resource_arn:tagris_arn -> unit -> tag_resource_request

val make_supplemental_document :
  ?document_url_expiration_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?document_url:string_without_new_line ->
  ?document_id:string_without_new_line ->
  ?document_type:supplemental_document_type ->
  unit ->
  supplemental_document

val make_receiver_address :
  ?postal_code:basic_string ->
  ?company_name:basic_string ->
  ?country_code:basic_string ->
  ?state_or_region:basic_string ->
  ?city:basic_string ->
  ?district_or_county:basic_string ->
  ?address_line3:basic_string ->
  ?address_line2:basic_string ->
  ?address_line1:basic_string ->
  unit ->
  receiver_address

val make_put_procurement_portal_preference_response :
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  unit ->
  put_procurement_portal_preference_response

val make_procurement_portal_preference_selector :
  ?seller_of_records:seller_of_records ->
  ?invoice_unit_arns:invoice_unit_arns ->
  unit ->
  procurement_portal_preference_selector

val make_purchase_order_data_source :
  ?purchase_order_data_source_type:purchase_order_data_source_type ->
  ?einvoice_delivery_document_type:einvoice_delivery_document_type ->
  unit ->
  purchase_order_data_source

val make_einvoice_delivery_preference :
  ?einvoice_delivery_attachment_types:einvoice_delivery_attachment_types ->
  einvoice_delivery_activation_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  connection_testing_method:connection_testing_method ->
  purchase_order_data_sources:purchase_order_data_sources ->
  protocol:protocol ->
  einvoice_delivery_document_types:einvoice_delivery_document_types ->
  unit ->
  einvoice_delivery_preference

val make_contact : ?email:email_string -> ?name:basic_string -> unit -> contact

val make_put_procurement_portal_preference_request :
  ?client_token:basic_string_without_space ->
  ?einvoice_delivery_preference:einvoice_delivery_preference ->
  ?test_env_preference:test_env_preference_input ->
  ?procurement_portal_instance_endpoint:basic_string_without_space ->
  ?procurement_portal_shared_secret:sensitive_basic_string_without_space ->
  ?selector:procurement_portal_preference_selector ->
  contacts:contacts ->
  purchase_order_retrieval_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  einvoice_delivery_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  unit ->
  put_procurement_portal_preference_request

val make_invoice_profile :
  ?tax_registration_number:sensitive_basic_string_without_space ->
  ?issuer:basic_string_without_space ->
  ?receiver_email:sensitive_basic_string_without_space ->
  ?receiver_address:receiver_address ->
  ?receiver_name:basic_string_without_space ->
  ?account_id:account_id_string ->
  unit ->
  invoice_profile

val make_procurement_portal_preference_summary :
  ?purchase_order_retrieval_preference_status_reason:basic_string ->
  ?purchase_order_retrieval_preference_status:procurement_portal_preference_status ->
  ?einvoice_delivery_preference_status_reason:basic_string ->
  ?einvoice_delivery_preference_status:procurement_portal_preference_status ->
  ?selector:procurement_portal_preference_selector ->
  last_update_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  create_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  version:Smaws_Lib.Smithy_api.Types.long ->
  purchase_order_retrieval_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  einvoice_delivery_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  supplier_identifier:basic_string_without_space ->
  supplier_domain:supplier_domain ->
  buyer_identifier:basic_string_without_space ->
  buyer_domain:buyer_domain ->
  procurement_portal_name:procurement_portal_name ->
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  aws_account_id:account_id_string ->
  unit ->
  procurement_portal_preference_summary

val make_procurement_portal_preference :
  ?purchase_order_retrieval_preference_status_reason:basic_string ->
  ?purchase_order_retrieval_preference_status:procurement_portal_preference_status ->
  ?einvoice_delivery_preference_status_reason:basic_string ->
  ?einvoice_delivery_preference_status:procurement_portal_preference_status ->
  ?contacts:contacts ->
  ?einvoice_delivery_preference:einvoice_delivery_preference ->
  ?test_env_preference:test_env_preference ->
  ?purchase_order_retrieval_endpoint:basic_string_without_space ->
  ?procurement_portal_instance_endpoint:basic_string_without_space ->
  ?procurement_portal_shared_secret:basic_string_without_space ->
  ?selector:procurement_portal_preference_selector ->
  last_update_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  create_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  version:Smaws_Lib.Smithy_api.Types.long ->
  purchase_order_retrieval_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  einvoice_delivery_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  supplier_identifier:basic_string_without_space ->
  supplier_domain:supplier_domain ->
  buyer_identifier:basic_string_without_space ->
  buyer_domain:buyer_domain ->
  procurement_portal_name:procurement_portal_name ->
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  aws_account_id:account_id_string ->
  unit ->
  procurement_portal_preference

val make_list_tags_for_resource_response :
  ?resource_tags:resource_tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:tagris_arn -> unit -> list_tags_for_resource_request

val make_list_procurement_portal_preferences_response :
  ?next_token:basic_string_without_space ->
  ?procurement_portal_preferences:procurement_portal_preference_summaries ->
  unit ->
  list_procurement_portal_preferences_response

val make_list_procurement_portal_preferences_request :
  ?max_results:max_results ->
  ?next_token:basic_string_without_space ->
  unit ->
  list_procurement_portal_preferences_request

val make_invoice_unit :
  ?last_modified:last_modified_timestamp ->
  ?rule:invoice_unit_rule ->
  ?tax_inheritance_disabled:tax_inheritance_disabled_flag ->
  ?description:description_string ->
  ?name:invoice_unit_name ->
  ?invoice_receiver:account_id_string ->
  ?invoice_unit_arn:invoice_unit_arn_string ->
  unit ->
  invoice_unit

val make_list_invoice_units_response :
  ?next_token:next_token_string ->
  ?invoice_units:invoice_units ->
  unit ->
  list_invoice_units_response

val make_filters :
  ?bill_source_accounts:account_id_list ->
  ?accounts:account_id_list ->
  ?invoice_receivers:account_id_list ->
  ?names:invoice_unit_names ->
  unit ->
  filters

val make_list_invoice_units_request :
  ?as_of:as_of_timestamp ->
  ?max_results:max_results_integer ->
  ?next_token:next_token_string ->
  ?filters:filters ->
  unit ->
  list_invoice_units_request

val make_entity : ?billing_entity:billing_entity -> ?invoicing_entity:basic_string -> unit -> entity
val make_billing_period : year:year -> month:month -> unit -> billing_period

val make_discounts_breakdown_amount :
  ?rate:basic_string ->
  ?amount:basic_string ->
  ?description:basic_string ->
  unit ->
  discounts_breakdown_amount

val make_discounts_breakdown :
  ?total_amount:basic_string ->
  ?breakdown:discounts_breakdown_amount_list ->
  unit ->
  discounts_breakdown

val make_fees_breakdown_amount :
  ?rate:basic_string ->
  ?amount:basic_string ->
  ?description:basic_string ->
  unit ->
  fees_breakdown_amount

val make_fees_breakdown :
  ?total_amount:basic_string -> ?breakdown:fees_breakdown_amount_list -> unit -> fees_breakdown

val make_amount_breakdown :
  ?fees:fees_breakdown ->
  ?taxes:taxes_breakdown ->
  ?discounts:discounts_breakdown ->
  ?sub_total_amount:basic_string ->
  unit ->
  amount_breakdown

val make_currency_exchange_details :
  ?rate:basic_string ->
  ?target_currency_code:basic_string ->
  ?source_currency_code:basic_string ->
  unit ->
  currency_exchange_details

val make_invoice_currency_amount :
  ?currency_exchange_details:currency_exchange_details ->
  ?amount_breakdown:amount_breakdown ->
  ?currency_code:currency_code ->
  ?total_amount_before_tax:basic_string ->
  ?total_amount:basic_string ->
  unit ->
  invoice_currency_amount

val make_invoice_summary :
  ?payment_currency_amount:invoice_currency_amount ->
  ?tax_currency_amount:invoice_currency_amount ->
  ?base_currency_amount:invoice_currency_amount ->
  ?tax_authority_status:tax_authority_status ->
  ?einvoice_delivery_status:einvoice_delivery_status ->
  ?purchase_order_number:basic_string ->
  ?original_invoice_id:basic_string ->
  ?commercial_invoice_id:basic_string ->
  ?invoice_type:invoice_type ->
  ?bill_type:bill_type ->
  ?invoice_frequency:invoice_frequency ->
  ?billing_period:billing_period ->
  ?entity:entity ->
  ?receiver_role:receiver_role ->
  ?bill_source_accounts_total_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?bill_source_accounts:bill_source_account_list ->
  ?due_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?issued_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?invoice_id:basic_string ->
  ?account_id:account_id_string ->
  unit ->
  invoice_summary

val make_list_invoice_summaries_response :
  ?next_token:next_token_string ->
  invoice_summaries:invoice_summaries ->
  unit ->
  list_invoice_summaries_response

val make_invoice_summaries_selector :
  value:string_without_new_line ->
  resource_type:list_invoice_summaries_resource_type ->
  unit ->
  invoice_summaries_selector

val make_date_interval :
  end_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  start_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  date_interval

val make_invoice_summaries_filter :
  ?receiver_role:receiver_role ->
  ?invoicing_entity:basic_string ->
  ?billing_period:billing_period ->
  ?time_interval:date_interval ->
  unit ->
  invoice_summaries_filter

val make_list_invoice_summaries_request :
  ?max_results:invoice_summaries_max_results ->
  ?next_token:next_token_string ->
  ?filter:invoice_summaries_filter ->
  selector:invoice_summaries_selector ->
  unit ->
  list_invoice_summaries_request

val make_get_procurement_portal_preference_response :
  procurement_portal_preference:procurement_portal_preference ->
  unit ->
  get_procurement_portal_preference_response

val make_get_procurement_portal_preference_request :
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  unit ->
  get_procurement_portal_preference_request

val make_get_invoice_unit_response :
  ?last_modified:last_modified_timestamp ->
  ?rule:invoice_unit_rule ->
  ?tax_inheritance_disabled:tax_inheritance_disabled_flag ->
  ?description:description_string ->
  ?name:invoice_unit_name ->
  ?invoice_receiver:account_id_string ->
  ?invoice_unit_arn:invoice_unit_arn_string ->
  unit ->
  get_invoice_unit_response

val make_get_invoice_unit_request :
  ?as_of:as_of_timestamp ->
  invoice_unit_arn:invoice_unit_arn_string ->
  unit ->
  get_invoice_unit_request

val make_invoice_pd_f :
  ?supplemental_documents:supplemental_documents ->
  ?document_url_expiration_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?document_url:string_without_new_line ->
  ?invoice_id:string_without_new_line ->
  unit ->
  invoice_pd_f

val make_get_invoice_pdf_response : ?invoice_pd_f:invoice_pd_f -> unit -> get_invoice_pdf_response

val make_get_invoice_pdf_request :
  invoice_id:string_without_new_line -> unit -> get_invoice_pdf_request

val make_delete_procurement_portal_preference_response :
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  unit ->
  delete_procurement_portal_preference_response

val make_delete_procurement_portal_preference_request :
  ?client_token:basic_string_without_space ->
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  unit ->
  delete_procurement_portal_preference_request

val make_delete_invoice_unit_response :
  ?invoice_unit_arn:invoice_unit_arn_string -> unit -> delete_invoice_unit_response

val make_delete_invoice_unit_request :
  ?client_token:basic_string_without_space ->
  invoice_unit_arn:invoice_unit_arn_string ->
  unit ->
  delete_invoice_unit_request

val make_create_procurement_portal_preference_response :
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  unit ->
  create_procurement_portal_preference_response

val make_create_procurement_portal_preference_request :
  ?client_token:basic_string_without_space ->
  ?resource_tags:resource_tag_list ->
  ?einvoice_delivery_preference:einvoice_delivery_preference ->
  ?test_env_preference:test_env_preference_input ->
  ?procurement_portal_instance_endpoint:basic_string_without_space ->
  ?procurement_portal_shared_secret:sensitive_basic_string_without_space ->
  ?selector:procurement_portal_preference_selector ->
  contacts:contacts ->
  purchase_order_retrieval_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  einvoice_delivery_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  supplier_identifier:basic_string_without_space ->
  supplier_domain:supplier_domain ->
  buyer_identifier:basic_string_without_space ->
  buyer_domain:buyer_domain ->
  procurement_portal_name:procurement_portal_name ->
  unit ->
  create_procurement_portal_preference_request

val make_create_invoice_unit_response :
  ?invoice_unit_arn:invoice_unit_arn_string -> unit -> create_invoice_unit_response

val make_create_invoice_unit_request :
  ?client_token:basic_string_without_space ->
  ?resource_tags:resource_tag_list ->
  ?tax_inheritance_disabled:tax_inheritance_disabled_flag ->
  ?description:description_string ->
  rule:invoice_unit_rule ->
  invoice_receiver:account_id_string ->
  name:invoice_unit_name ->
  unit ->
  create_invoice_unit_request

val make_batch_get_invoice_profile_response :
  ?profiles:profile_list -> unit -> batch_get_invoice_profile_response

val make_batch_get_invoice_profile_request :
  account_ids:account_id_list -> unit -> batch_get_invoice_profile_request
