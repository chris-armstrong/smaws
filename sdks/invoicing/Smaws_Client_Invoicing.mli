(** Invoicing client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_fees_breakdown_amount :
  ?description:basic_string ->
  ?amount:basic_string ->
  ?rate:basic_string ->
  unit ->
  fees_breakdown_amount

val make_fees_breakdown :
  ?breakdown:fees_breakdown_amount_list -> ?total_amount:basic_string -> unit -> fees_breakdown

val make_taxes_breakdown_amount :
  ?description:basic_string ->
  ?amount:basic_string ->
  ?rate:basic_string ->
  unit ->
  taxes_breakdown_amount

val make_taxes_breakdown :
  ?breakdown:taxes_breakdown_amount_list -> ?total_amount:basic_string -> unit -> taxes_breakdown

val make_discounts_breakdown_amount :
  ?description:basic_string ->
  ?amount:basic_string ->
  ?rate:basic_string ->
  unit ->
  discounts_breakdown_amount

val make_discounts_breakdown :
  ?breakdown:discounts_breakdown_amount_list ->
  ?total_amount:basic_string ->
  unit ->
  discounts_breakdown

val make_amount_breakdown :
  ?sub_total_amount:basic_string ->
  ?discounts:discounts_breakdown ->
  ?taxes:taxes_breakdown ->
  ?fees:fees_breakdown ->
  unit ->
  amount_breakdown

val make_validation_exception_field :
  name:basic_string -> message:basic_string -> unit -> validation_exception_field

val make_receiver_address :
  ?address_line1:basic_string ->
  ?address_line2:basic_string ->
  ?address_line3:basic_string ->
  ?district_or_county:basic_string ->
  ?city:basic_string ->
  ?state_or_region:basic_string ->
  ?country_code:basic_string ->
  ?company_name:basic_string ->
  ?postal_code:basic_string ->
  unit ->
  receiver_address

val make_invoice_profile :
  ?account_id:account_id_string ->
  ?receiver_name:basic_string_without_space ->
  ?receiver_address:receiver_address ->
  ?receiver_email:sensitive_basic_string_without_space ->
  ?issuer:basic_string_without_space ->
  ?tax_registration_number:sensitive_basic_string_without_space ->
  unit ->
  invoice_profile

val make_batch_get_invoice_profile_response :
  ?profiles:profile_list -> unit -> batch_get_invoice_profile_response

val make_batch_get_invoice_profile_request :
  account_ids:account_id_list -> unit -> batch_get_invoice_profile_request

val make_billing_period : month:month -> year:year -> unit -> billing_period
val make_contact : ?name:basic_string -> ?email:email_string -> unit -> contact

val make_create_invoice_unit_response :
  ?invoice_unit_arn:invoice_unit_arn_string -> unit -> create_invoice_unit_response

val make_resource_tag : key:resource_tag_key -> value:resource_tag_value -> unit -> resource_tag

val make_invoice_unit_rule :
  ?linked_accounts:rule_account_id_list ->
  ?bill_source_accounts:rule_account_id_list ->
  unit ->
  invoice_unit_rule

val make_create_invoice_unit_request :
  ?description:description_string ->
  ?tax_inheritance_disabled:tax_inheritance_disabled_flag ->
  ?resource_tags:resource_tag_list ->
  ?client_token:basic_string_without_space ->
  name:invoice_unit_name ->
  invoice_receiver:account_id_string ->
  rule:invoice_unit_rule ->
  unit ->
  create_invoice_unit_request

val make_create_procurement_portal_preference_response :
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  unit ->
  create_procurement_portal_preference_response

val make_purchase_order_data_source :
  ?einvoice_delivery_document_type:einvoice_delivery_document_type ->
  ?purchase_order_data_source_type:purchase_order_data_source_type ->
  unit ->
  purchase_order_data_source

val make_einvoice_delivery_preference :
  ?einvoice_delivery_attachment_types:einvoice_delivery_attachment_types ->
  einvoice_delivery_document_types:einvoice_delivery_document_types ->
  protocol:protocol ->
  purchase_order_data_sources:purchase_order_data_sources ->
  connection_testing_method:connection_testing_method ->
  einvoice_delivery_activation_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  einvoice_delivery_preference

val make_test_env_preference_input :
  ?procurement_portal_shared_secret:basic_string_without_space ->
  ?procurement_portal_instance_endpoint:basic_string_without_space ->
  buyer_domain:buyer_domain ->
  buyer_identifier:basic_string_without_space ->
  supplier_domain:supplier_domain ->
  supplier_identifier:basic_string_without_space ->
  unit ->
  test_env_preference_input

val make_procurement_portal_preference_selector :
  ?invoice_unit_arns:invoice_unit_arns ->
  ?seller_of_records:seller_of_records ->
  unit ->
  procurement_portal_preference_selector

val make_create_procurement_portal_preference_request :
  ?selector:procurement_portal_preference_selector ->
  ?procurement_portal_shared_secret:sensitive_basic_string_without_space ->
  ?procurement_portal_instance_endpoint:basic_string_without_space ->
  ?test_env_preference:test_env_preference_input ->
  ?einvoice_delivery_preference:einvoice_delivery_preference ->
  ?resource_tags:resource_tag_list ->
  ?client_token:basic_string_without_space ->
  procurement_portal_name:procurement_portal_name ->
  buyer_domain:buyer_domain ->
  buyer_identifier:basic_string_without_space ->
  supplier_domain:supplier_domain ->
  supplier_identifier:basic_string_without_space ->
  einvoice_delivery_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  purchase_order_retrieval_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  contacts:contacts ->
  unit ->
  create_procurement_portal_preference_request

val make_currency_exchange_details :
  ?source_currency_code:basic_string ->
  ?target_currency_code:basic_string ->
  ?rate:basic_string ->
  unit ->
  currency_exchange_details

val make_date_interval :
  start_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  end_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  date_interval

val make_delete_invoice_unit_response :
  ?invoice_unit_arn:invoice_unit_arn_string -> unit -> delete_invoice_unit_response

val make_delete_invoice_unit_request :
  ?client_token:basic_string_without_space ->
  invoice_unit_arn:invoice_unit_arn_string ->
  unit ->
  delete_invoice_unit_request

val make_delete_procurement_portal_preference_response :
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  unit ->
  delete_procurement_portal_preference_response

val make_delete_procurement_portal_preference_request :
  ?client_token:basic_string_without_space ->
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  unit ->
  delete_procurement_portal_preference_request

val make_entity : ?invoicing_entity:basic_string -> ?billing_entity:billing_entity -> unit -> entity

val make_filters :
  ?names:invoice_unit_names ->
  ?invoice_receivers:account_id_list ->
  ?accounts:account_id_list ->
  ?bill_source_accounts:account_id_list ->
  unit ->
  filters

val make_supplemental_document :
  ?document_type:supplemental_document_type ->
  ?document_id:string_without_new_line ->
  ?document_url:string_without_new_line ->
  ?document_url_expiration_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  supplemental_document

val make_invoice_pd_f :
  ?invoice_id:string_without_new_line ->
  ?document_url:string_without_new_line ->
  ?document_url_expiration_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?supplemental_documents:supplemental_documents ->
  unit ->
  invoice_pd_f

val make_get_invoice_pdf_response : ?invoice_pd_f:invoice_pd_f -> unit -> get_invoice_pdf_response

val make_get_invoice_pdf_request :
  invoice_id:string_without_new_line -> unit -> get_invoice_pdf_request

val make_get_invoice_unit_response :
  ?invoice_unit_arn:invoice_unit_arn_string ->
  ?invoice_receiver:account_id_string ->
  ?name:invoice_unit_name ->
  ?description:description_string ->
  ?tax_inheritance_disabled:tax_inheritance_disabled_flag ->
  ?rule:invoice_unit_rule ->
  ?last_modified:last_modified_timestamp ->
  unit ->
  get_invoice_unit_response

val make_get_invoice_unit_request :
  ?as_of:as_of_timestamp ->
  invoice_unit_arn:invoice_unit_arn_string ->
  unit ->
  get_invoice_unit_request

val make_test_env_preference :
  ?procurement_portal_shared_secret:basic_string_without_space ->
  ?procurement_portal_instance_endpoint:basic_string_without_space ->
  ?purchase_order_retrieval_endpoint:basic_string_without_space ->
  buyer_domain:buyer_domain ->
  buyer_identifier:basic_string_without_space ->
  supplier_domain:supplier_domain ->
  supplier_identifier:basic_string_without_space ->
  unit ->
  test_env_preference

val make_procurement_portal_preference :
  ?selector:procurement_portal_preference_selector ->
  ?procurement_portal_shared_secret:basic_string_without_space ->
  ?procurement_portal_instance_endpoint:basic_string_without_space ->
  ?purchase_order_retrieval_endpoint:basic_string_without_space ->
  ?test_env_preference:test_env_preference ->
  ?einvoice_delivery_preference:einvoice_delivery_preference ->
  ?contacts:contacts ->
  ?einvoice_delivery_preference_status:procurement_portal_preference_status ->
  ?einvoice_delivery_preference_status_reason:basic_string ->
  ?purchase_order_retrieval_preference_status:procurement_portal_preference_status ->
  ?purchase_order_retrieval_preference_status_reason:basic_string ->
  aws_account_id:account_id_string ->
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  procurement_portal_name:procurement_portal_name ->
  buyer_domain:buyer_domain ->
  buyer_identifier:basic_string_without_space ->
  supplier_domain:supplier_domain ->
  supplier_identifier:basic_string_without_space ->
  einvoice_delivery_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  purchase_order_retrieval_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  version:Smaws_Lib.Smithy_api.Types.long ->
  create_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_update_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  procurement_portal_preference

val make_get_procurement_portal_preference_response :
  procurement_portal_preference:procurement_portal_preference ->
  unit ->
  get_procurement_portal_preference_response

val make_get_procurement_portal_preference_request :
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  unit ->
  get_procurement_portal_preference_request

val make_invoice_currency_amount :
  ?total_amount:basic_string ->
  ?total_amount_before_tax:basic_string ->
  ?currency_code:currency_code ->
  ?amount_breakdown:amount_breakdown ->
  ?currency_exchange_details:currency_exchange_details ->
  unit ->
  invoice_currency_amount

val make_invoice_summary :
  ?account_id:account_id_string ->
  ?invoice_id:basic_string ->
  ?issued_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?due_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?bill_source_accounts:bill_source_account_list ->
  ?bill_source_accounts_total_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?receiver_role:receiver_role ->
  ?entity:entity ->
  ?billing_period:billing_period ->
  ?invoice_frequency:invoice_frequency ->
  ?bill_type:bill_type ->
  ?invoice_type:invoice_type ->
  ?commercial_invoice_id:basic_string ->
  ?original_invoice_id:basic_string ->
  ?purchase_order_number:basic_string ->
  ?einvoice_delivery_status:einvoice_delivery_status ->
  ?tax_authority_status:tax_authority_status ->
  ?base_currency_amount:invoice_currency_amount ->
  ?tax_currency_amount:invoice_currency_amount ->
  ?payment_currency_amount:invoice_currency_amount ->
  unit ->
  invoice_summary

val make_invoice_summaries_filter :
  ?time_interval:date_interval ->
  ?billing_period:billing_period ->
  ?invoicing_entity:basic_string ->
  ?receiver_role:receiver_role ->
  unit ->
  invoice_summaries_filter

val make_invoice_summaries_selector :
  resource_type:list_invoice_summaries_resource_type ->
  value:string_without_new_line ->
  unit ->
  invoice_summaries_selector

val make_invoice_unit :
  ?invoice_unit_arn:invoice_unit_arn_string ->
  ?invoice_receiver:account_id_string ->
  ?name:invoice_unit_name ->
  ?description:description_string ->
  ?tax_inheritance_disabled:tax_inheritance_disabled_flag ->
  ?rule:invoice_unit_rule ->
  ?last_modified:last_modified_timestamp ->
  unit ->
  invoice_unit

val make_update_procurement_portal_preference_status_response :
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  unit ->
  update_procurement_portal_preference_status_response

val make_update_procurement_portal_preference_status_request :
  ?einvoice_delivery_preference_status:procurement_portal_preference_status ->
  ?einvoice_delivery_preference_status_reason:basic_string ->
  ?purchase_order_retrieval_preference_status:procurement_portal_preference_status ->
  ?purchase_order_retrieval_preference_status_reason:basic_string ->
  ?client_token:basic_string_without_space ->
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  unit ->
  update_procurement_portal_preference_status_request

val make_update_invoice_unit_response :
  ?invoice_unit_arn:invoice_unit_arn_string -> unit -> update_invoice_unit_response

val make_update_invoice_unit_request :
  ?description:description_string ->
  ?tax_inheritance_disabled:tax_inheritance_disabled_flag ->
  ?rule:invoice_unit_rule ->
  ?client_token:basic_string_without_space ->
  invoice_unit_arn:invoice_unit_arn_string ->
  unit ->
  update_invoice_unit_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:tagris_arn ->
  resource_tag_keys:resource_tag_key_list ->
  unit ->
  untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:tagris_arn -> resource_tags:resource_tag_list -> unit -> tag_resource_request

val make_put_procurement_portal_preference_response :
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  unit ->
  put_procurement_portal_preference_response

val make_put_procurement_portal_preference_request :
  ?selector:procurement_portal_preference_selector ->
  ?procurement_portal_shared_secret:sensitive_basic_string_without_space ->
  ?procurement_portal_instance_endpoint:basic_string_without_space ->
  ?test_env_preference:test_env_preference_input ->
  ?einvoice_delivery_preference:einvoice_delivery_preference ->
  ?client_token:basic_string_without_space ->
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  einvoice_delivery_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  purchase_order_retrieval_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  contacts:contacts ->
  unit ->
  put_procurement_portal_preference_request

val make_list_tags_for_resource_response :
  ?resource_tags:resource_tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:tagris_arn -> unit -> list_tags_for_resource_request

val make_procurement_portal_preference_summary :
  ?selector:procurement_portal_preference_selector ->
  ?einvoice_delivery_preference_status:procurement_portal_preference_status ->
  ?einvoice_delivery_preference_status_reason:basic_string ->
  ?purchase_order_retrieval_preference_status:procurement_portal_preference_status ->
  ?purchase_order_retrieval_preference_status_reason:basic_string ->
  aws_account_id:account_id_string ->
  procurement_portal_preference_arn:procurement_portal_preference_arn_string ->
  procurement_portal_name:procurement_portal_name ->
  buyer_domain:buyer_domain ->
  buyer_identifier:basic_string_without_space ->
  supplier_domain:supplier_domain ->
  supplier_identifier:basic_string_without_space ->
  einvoice_delivery_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  purchase_order_retrieval_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  version:Smaws_Lib.Smithy_api.Types.long ->
  create_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_update_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  procurement_portal_preference_summary

val make_list_procurement_portal_preferences_response :
  ?procurement_portal_preferences:procurement_portal_preference_summaries ->
  ?next_token:basic_string_without_space ->
  unit ->
  list_procurement_portal_preferences_response

val make_list_procurement_portal_preferences_request :
  ?next_token:basic_string_without_space ->
  ?max_results:max_results ->
  unit ->
  list_procurement_portal_preferences_request

val make_list_invoice_units_response :
  ?invoice_units:invoice_units ->
  ?next_token:next_token_string ->
  unit ->
  list_invoice_units_response

val make_list_invoice_units_request :
  ?filters:filters ->
  ?next_token:next_token_string ->
  ?max_results:max_results_integer ->
  ?as_of:as_of_timestamp ->
  unit ->
  list_invoice_units_request

val make_list_invoice_summaries_response :
  ?next_token:next_token_string ->
  invoice_summaries:invoice_summaries ->
  unit ->
  list_invoice_summaries_response

val make_list_invoice_summaries_request :
  ?filter:invoice_summaries_filter ->
  ?next_token:next_token_string ->
  ?max_results:invoice_summaries_max_results ->
  selector:invoice_summaries_selector ->
  unit ->
  list_invoice_summaries_request
(** {1:operations Operations} *)

module ListInvoiceSummaries : sig
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
    list_invoice_summaries_request ->
    ( list_invoice_summaries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_invoice_summaries_request ->
    ( list_invoice_summaries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves your invoice details programmatically, without line item details.\n"]

module ListInvoiceUnits : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_invoice_units_request ->
    ( list_invoice_units_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_invoice_units_request ->
    ( list_invoice_units_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This fetches a list of all invoice unit definitions for a given account, as of the provided \
   [AsOf] date.\n"]

module ListProcurementPortalPreferences : sig
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
    list_procurement_portal_preferences_request ->
    ( list_procurement_portal_preferences_response,
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
    list_procurement_portal_preferences_request ->
    ( list_procurement_portal_preferences_response Smaws_Lib.Response.t,
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
  " {i  {b This feature API is subject to changing at any time. For more information, see the \
   {{:https://aws.amazon.com/service-terms/}Amazon Web Services Service Terms} (Betas and \
   Previews).} } \n\n\
  \ Retrieves a list of procurement portal preferences associated with the Amazon Web Services \
   account.\n\
  \ "]

module ListTagsForResource : sig
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
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the tags for a resource. \n"]

module PutProcurementPortalPreference : sig
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
    put_procurement_portal_preference_request ->
    ( put_procurement_portal_preference_response,
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
    put_procurement_portal_preference_request ->
    ( put_procurement_portal_preference_response Smaws_Lib.Response.t,
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
  " {i  {b This feature API is subject to changing at any time. For more information, see the \
   {{:https://aws.amazon.com/service-terms/}Amazon Web Services Service Terms} (Betas and \
   Previews).} } \n\n\
  \ Updates an existing procurement portal preference configuration. This operation can modify \
   settings for e-invoice delivery and purchase order retrieval.\n\
  \ "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds a tag to a resource. \n"]

module UntagResource : sig
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
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Removes a tag from a resource. \n"]

module UpdateInvoiceUnit : sig
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
    update_invoice_unit_request ->
    ( update_invoice_unit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_invoice_unit_request ->
    ( update_invoice_unit_response Smaws_Lib.Response.t,
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
  "You can update the invoice unit configuration at any time, and Amazon Web Services will use the \
   latest configuration at the end of the month.\n"]

module UpdateProcurementPortalPreferenceStatus : sig
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
    update_procurement_portal_preference_status_request ->
    ( update_procurement_portal_preference_status_response,
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
    update_procurement_portal_preference_status_request ->
    ( update_procurement_portal_preference_status_response Smaws_Lib.Response.t,
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
  " {i  {b This feature API is subject to changing at any time. For more information, see the \
   {{:https://aws.amazon.com/service-terms/}Amazon Web Services Service Terms} (Betas and \
   Previews).} } \n\n\
  \ Updates the status of a procurement portal preference, including the activation state of \
   e-invoice delivery and purchase order retrieval features.\n\
  \ "]

module GetProcurementPortalPreference : sig
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
    get_procurement_portal_preference_request ->
    ( get_procurement_portal_preference_response,
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
    get_procurement_portal_preference_request ->
    ( get_procurement_portal_preference_response Smaws_Lib.Response.t,
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
  " {i  {b This feature API is subject to changing at any time. For more information, see the \
   {{:https://aws.amazon.com/service-terms/}Amazon Web Services Service Terms} (Betas and \
   Previews).} } \n\n\
  \ Retrieves the details of a specific procurement portal preference configuration.\n\
  \ "]

module GetInvoiceUnit : sig
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
    get_invoice_unit_request ->
    ( get_invoice_unit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_invoice_unit_request ->
    ( get_invoice_unit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "This retrieves the invoice unit definition.\n"]

module GetInvoicePDF : sig
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
    get_invoice_pdf_request ->
    ( get_invoice_pdf_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_invoice_pdf_request ->
    ( get_invoice_pdf_response Smaws_Lib.Response.t,
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
  "Returns a URL to download the invoice document and supplemental documents associated with an \
   invoice. The URLs are pre-signed and have expiration time. For special cases like Brazil, where \
   Amazon Web Services generated invoice identifiers and government provided identifiers do not \
   match, use the Amazon Web Services generated invoice identifier when making API requests. To \
   grant IAM permission to use this operation, the caller needs the [invoicing:GetInvoicePDF] \
   policy action.\n"]

module DeleteProcurementPortalPreference : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_procurement_portal_preference_request ->
    ( delete_procurement_portal_preference_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_procurement_portal_preference_request ->
    ( delete_procurement_portal_preference_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {i  {b This feature API is subject to changing at any time. For more information, see the \
   {{:https://aws.amazon.com/service-terms/}Amazon Web Services Service Terms} (Betas and \
   Previews).} } \n\n\
  \ Deletes an existing procurement portal preference. This action cannot be undone. Active \
   e-invoice delivery and PO retrieval configurations will be terminated.\n\
  \ "]

module DeleteInvoiceUnit : sig
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
    delete_invoice_unit_request ->
    ( delete_invoice_unit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_invoice_unit_request ->
    ( delete_invoice_unit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "This deletes an invoice unit with the provided invoice unit ARN. \n"]

module CreateProcurementPortalPreference : sig
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
    create_procurement_portal_preference_request ->
    ( create_procurement_portal_preference_response,
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
    create_procurement_portal_preference_request ->
    ( create_procurement_portal_preference_response Smaws_Lib.Response.t,
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
  " {i  {b This feature API is subject to changing at any time. For more information, see the \
   {{:https://aws.amazon.com/service-terms/}Amazon Web Services Service Terms} (Betas and \
   Previews).} } \n\n\
  \ Creates a procurement portal preference configuration for e-invoice delivery and purchase \
   order retrieval. This preference defines how invoices are delivered to a procurement portal and \
   how purchase orders are retrieved.\n\
  \ "]

module CreateInvoiceUnit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_invoice_unit_request ->
    ( create_invoice_unit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_invoice_unit_request ->
    ( create_invoice_unit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "This creates a new invoice unit with the provided definition.\n"]

(** {1:Serialization and Deserialization} *)
module BatchGetInvoiceProfile : sig
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
    batch_get_invoice_profile_request ->
    ( batch_get_invoice_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_invoice_profile_request ->
    ( batch_get_invoice_profile_response Smaws_Lib.Response.t,
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
  "This gets the invoice profile associated with a set of accounts. The accounts must be linked \
   accounts under the requester management account organization.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
