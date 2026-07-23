type nonrec invoice_unit_arn_string = string [@@ocaml.doc ""]

type nonrec basic_string = string [@@ocaml.doc ""]

type nonrec access_denied_exception = {
  message : basic_string option; [@ocaml.doc ""]
  resource_name : invoice_unit_arn_string option;
      [@ocaml.doc "You don't have sufficient access to perform this action. \n"]
}
[@@ocaml.doc "You don't have sufficient access to perform this action.\n"]

type nonrec account_id_string = string [@@ocaml.doc ""]

type nonrec account_id_list = account_id_string list [@@ocaml.doc ""]

type nonrec fees_breakdown_amount = {
  description : basic_string option; [@ocaml.doc " The list of fees information. \n"]
  amount : basic_string option; [@ocaml.doc " The fee amount. \n"]
  rate : basic_string option; [@ocaml.doc " Details about the rate amount. \n"]
}
[@@ocaml.doc " The fee amount. \n"]

type nonrec fees_breakdown_amount_list = fees_breakdown_amount list [@@ocaml.doc ""]

type nonrec fees_breakdown = {
  breakdown : fees_breakdown_amount_list option; [@ocaml.doc "The list of fees information. \n"]
  total_amount : basic_string option; [@ocaml.doc " The total amount of fees. \n"]
}
[@@ocaml.doc " The details of fees. \n"]

type nonrec taxes_breakdown_amount = {
  description : basic_string option; [@ocaml.doc " The details of the taxes. \n"]
  amount : basic_string option; [@ocaml.doc " The tax amount. \n"]
  rate : basic_string option; [@ocaml.doc " The details of the tax rate. \n"]
}
[@@ocaml.doc " The tax amount. \n"]

type nonrec taxes_breakdown_amount_list = taxes_breakdown_amount list [@@ocaml.doc ""]

type nonrec taxes_breakdown = {
  breakdown : taxes_breakdown_amount_list option; [@ocaml.doc " A list of tax information. \n"]
  total_amount : basic_string option; [@ocaml.doc " The total amount for your taxes. \n"]
}
[@@ocaml.doc " The details of the taxes. \n"]

type nonrec discounts_breakdown_amount = {
  description : basic_string option; [@ocaml.doc " The list of discounts information. \n"]
  amount : basic_string option; [@ocaml.doc "The discounted amount. \n"]
  rate : basic_string option; [@ocaml.doc " The details for the discount rate.. \n"]
}
[@@ocaml.doc " The discounted amount. \n"]

type nonrec discounts_breakdown_amount_list = discounts_breakdown_amount list [@@ocaml.doc ""]

type nonrec discounts_breakdown = {
  breakdown : discounts_breakdown_amount_list option;
      [@ocaml.doc "The list of discounts information. \n"]
  total_amount : basic_string option; [@ocaml.doc " The discount's total amount. \n"]
}
[@@ocaml.doc "The discounts details. \n"]

type nonrec amount_breakdown = {
  sub_total_amount : basic_string option; [@ocaml.doc " The total of a set of the breakdown. \n"]
  discounts : discounts_breakdown option; [@ocaml.doc " The discounted amount. \n"]
  taxes : taxes_breakdown option; [@ocaml.doc " The tax amount. \n"]
  fees : fees_breakdown option; [@ocaml.doc " The fee amount. \n"]
}
[@@ocaml.doc "Details about how the total amount was calculated and categorized. \n"]

type nonrec as_of_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec basic_string_without_space = string [@@ocaml.doc ""]

type nonrec validation_exception_field = {
  name : basic_string;
      [@ocaml.doc
        " The input fails to satisfy the constraints specified by an Amazon Web Services service. \n"]
  message : basic_string;
      [@ocaml.doc
        " The input fails to satisfy the constraints specified by an Amazon Web Services service. \n"]
}
[@@ocaml.doc
  " The input fails to satisfy the constraints specified by an Amazon Web Services service. \n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | NON_MEMBERS_PRESENT [@ocaml.doc ""]
  | MAX_ACCOUNTS_EXCEEDED [@ocaml.doc ""]
  | MAX_INVOICE_UNITS_EXCEEDED [@ocaml.doc ""]
  | DUPLICATE_INVOICE_UNIT [@ocaml.doc ""]
  | MUTUAL_EXCLUSION_ERROR [@ocaml.doc ""]
  | ACCOUNT_MEMBERSHIP_ERROR [@ocaml.doc ""]
  | TAX_SETTINGS_ERROR [@ocaml.doc ""]
  | EXPIRED_NEXT_TOKEN [@ocaml.doc ""]
  | INVALID_NEXT_TOKEN [@ocaml.doc ""]
  | INVALID_INPUT [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | UNKNOWN_OPERATION [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception = {
  message : basic_string option; [@ocaml.doc ""]
  resource_name : invoice_unit_arn_string option;
      [@ocaml.doc "You don't have sufficient access to perform this action. \n"]
  reason : validation_exception_reason option;
      [@ocaml.doc "You don't have sufficient access to perform this action. \n"]
  field_list : validation_exception_field_list option;
      [@ocaml.doc
        " The input fails to satisfy the constraints specified by an Amazon Web Services service. \n"]
}
[@@ocaml.doc
  " The input fails to satisfy the constraints specified by an Amazon Web Services service. \n"]

type nonrec throttling_exception = { message : basic_string option [@ocaml.doc ""] }
[@@ocaml.doc "The request was denied due to request throttling.\n"]

type nonrec resource_not_found_exception = {
  message : basic_string option; [@ocaml.doc ""]
  resource_name : invoice_unit_arn_string option; [@ocaml.doc "The resource could not be found.\n"]
}
[@@ocaml.doc "The resource could not be found. \n"]

type nonrec internal_server_exception = {
  retry_after_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The processing request failed because of an unknown error, exception, or failure.\n"]
  message : basic_string option; [@ocaml.doc ""]
}
[@@ocaml.doc "The processing request failed because of an unknown error, exception, or failure. \n"]

type nonrec sensitive_basic_string_without_space = string [@@ocaml.doc ""]

type nonrec receiver_address = {
  address_line1 : basic_string option; [@ocaml.doc " The first line of the address. \n"]
  address_line2 : basic_string option;
      [@ocaml.doc " The second line of the address, if applicable. \n"]
  address_line3 : basic_string option;
      [@ocaml.doc " The third line of the address, if applicable. \n"]
  district_or_county : basic_string option;
      [@ocaml.doc " The district or country the address is located in. \n"]
  city : basic_string option; [@ocaml.doc " The city that the address is in. \n"]
  state_or_region : basic_string option;
      [@ocaml.doc " The state, region, or province the address is located. \n"]
  country_code : basic_string option;
      [@ocaml.doc " The country code for the country the address is in. \n"]
  company_name : basic_string option; [@ocaml.doc " A unique company name. \n"]
  postal_code : basic_string option; [@ocaml.doc " The postal code associated with the address. \n"]
}
[@@ocaml.doc " The details of the address associated with the receiver. \n"]

type nonrec invoice_profile = {
  account_id : account_id_string option;
      [@ocaml.doc " The account ID the invoice profile is generated for. \n"]
  receiver_name : basic_string_without_space option;
      [@ocaml.doc " The name of the person receiving the invoice profile. \n"]
  receiver_address : receiver_address option;
      [@ocaml.doc "The address of the receiver that will be printed on the invoice. \n"]
  receiver_email : sensitive_basic_string_without_space option;
      [@ocaml.doc "The email address for the invoice profile receiver. \n"]
  issuer : basic_string_without_space option;
      [@ocaml.doc " This specifies the issuing entity of the invoice. \n"]
  tax_registration_number : sensitive_basic_string_without_space option;
      [@ocaml.doc " Your Tax Registration Number (TRN) information. \n"]
}
[@@ocaml.doc " Contains high-level information about the invoice receiver. \n"]

type nonrec profile_list = invoice_profile list [@@ocaml.doc ""]

type nonrec batch_get_invoice_profile_response = {
  profiles : profile_list option;
      [@ocaml.doc " A list of invoice profiles corresponding to the requested accounts. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_invoice_profile_request = {
  account_ids : account_id_list;
      [@ocaml.doc "Retrieves the corresponding invoice profile data for these account IDs. \n"]
}
[@@ocaml.doc ""]

type nonrec bill_source_account_list = account_id_string list [@@ocaml.doc ""]

type nonrec bill_type =
  | ANNIVERSARY [@ocaml.doc ""]
  | PURCHASE [@ocaml.doc ""]
  | REFUND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec billing_entity = AWS [@ocaml.doc ""] | AWS_MARKETPLACE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec year = int [@@ocaml.doc ""]

type nonrec month = int [@@ocaml.doc ""]

type nonrec billing_period = {
  month : month; [@ocaml.doc " The billing period month. \n"]
  year : year; [@ocaml.doc " The billing period year. \n"]
}
[@@ocaml.doc " The billing period for which you want to retrieve invoice-related documents. \n"]

type nonrec buyer_domain = NetworkID [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec conflict_exception = {
  message : basic_string option; [@ocaml.doc ""]
  resource_id : basic_string option;
      [@ocaml.doc "The identifier of the resource that caused the conflict.\n"]
  resource_type : basic_string option;
      [@ocaml.doc "The type of resource that caused the conflict.\n"]
}
[@@ocaml.doc
  "The request could not be completed due to a conflict with the current state of the resource. \
   This exception occurs when a concurrent modification is detected during an update operation, or \
   when attempting to create a resource that already exists.\n"]

type nonrec connection_testing_method =
  | PROD_ENV_DOLLAR_TEST [@ocaml.doc ""]
  | TEST_ENV_REPLAY_TEST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec email_string = string [@@ocaml.doc ""]

type nonrec contact = {
  name : basic_string option; [@ocaml.doc "The name of the contact person or role.\n"]
  email : email_string option; [@ocaml.doc "The email address of the contact person or role.\n"]
}
[@@ocaml.doc
  "Represents contact information for a person or role associated with the procurement portal \
   preference.\n"]

type nonrec contacts = contact list [@@ocaml.doc ""]

type nonrec create_invoice_unit_response = {
  invoice_unit_arn : invoice_unit_arn_string option;
      [@ocaml.doc
        " The ARN to identify an invoice unit. This information can't be modified or deleted. \n"]
}
[@@ocaml.doc ""]

type nonrec resource_tag_value = string [@@ocaml.doc ""]

type nonrec resource_tag_key = string [@@ocaml.doc ""]

type nonrec resource_tag = {
  key : resource_tag_key; [@ocaml.doc "The object key of your of your resource tag. \n"]
  value : resource_tag_value; [@ocaml.doc " The specific value of the resource tag. \n"]
}
[@@ocaml.doc "The tag structure that contains a tag key and value. \n"]

type nonrec resource_tag_list = resource_tag list [@@ocaml.doc ""]

type nonrec rule_account_id_list = account_id_string list [@@ocaml.doc ""]

type nonrec invoice_unit_rule = {
  linked_accounts : rule_account_id_list option;
      [@ocaml.doc
        "The list of [LINKED_ACCOUNT] IDs where charges are included within the invoice unit. \n"]
  bill_source_accounts : rule_account_id_list option;
      [@ocaml.doc
        " A list of Amazon Web Services account IDs that have delegated their billing \
         responsibility to the receiver account through transfer billing. Unlike linked accounts, \
         these bill source accounts can be payer accounts from other organizations that have \
         authorized billing transfer to this account. \n"]
}
[@@ocaml.doc
  " This is used to categorize the invoice unit. Values are Amazon Web Services account IDs. \
   Currently, the only supported rule is [LINKED_ACCOUNT]. \n"]

type nonrec tax_inheritance_disabled_flag = bool [@@ocaml.doc ""]

type nonrec description_string = string [@@ocaml.doc ""]

type nonrec invoice_unit_name = string [@@ocaml.doc ""]

type nonrec create_invoice_unit_request = {
  name : invoice_unit_name;
      [@ocaml.doc
        " The unique name of the invoice unit that is shown on the generated invoice. This can't \
         be changed once it is set. To change this name, you must delete the invoice unit \
         recreate. \n"]
  invoice_receiver : account_id_string;
      [@ocaml.doc
        " The Amazon Web Services account ID chosen to be the receiver of an invoice unit. All \
         invoices generated for that invoice unit will be sent to this account ID. \n"]
  description : description_string option;
      [@ocaml.doc " The invoice unit's description. This can be changed at a later time. \n"]
  tax_inheritance_disabled : tax_inheritance_disabled_flag option;
      [@ocaml.doc
        "Whether the invoice unit based tax inheritance is/ should be enabled or disabled. \n"]
  rule : invoice_unit_rule;
      [@ocaml.doc "The [InvoiceUnitRule] object used to create invoice units. \n"]
  resource_tags : resource_tag_list option;
      [@ocaml.doc " The tag structure that contains a tag key and value. \n"]
  client_token : basic_string_without_space option;
      [@ocaml.doc
        " A unique, case-sensitive identifier that you provide to ensure idempotency of the \
         request. \n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = { message : basic_string [@ocaml.doc ""] }
[@@ocaml.doc
  "The request was rejected because it attempted to create resources beyond the current Amazon Web \
   Services account limits. The error message describes the limit exceeded. \n"]

type nonrec procurement_portal_preference_arn_string = string [@@ocaml.doc ""]

type nonrec create_procurement_portal_preference_response = {
  procurement_portal_preference_arn : procurement_portal_preference_arn_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the created procurement portal preference.\n"]
}
[@@ocaml.doc ""]

type nonrec purchase_order_data_source_type =
  | ASSOCIATED_PURCHASE_ORDER_REQUIRED [@ocaml.doc ""]
  | PURCHASE_ORDER_NOT_REQUIRED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec einvoice_delivery_document_type =
  | AWS_CLOUD_INVOICE [@ocaml.doc ""]
  | AWS_CLOUD_CREDIT_MEMO [@ocaml.doc ""]
  | AWS_MARKETPLACE_INVOICE [@ocaml.doc ""]
  | AWS_MARKETPLACE_CREDIT_MEMO [@ocaml.doc ""]
  | AWS_REQUEST_FOR_PAYMENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec purchase_order_data_source = {
  einvoice_delivery_document_type : einvoice_delivery_document_type option;
      [@ocaml.doc "The type of e-invoice document that requires purchase order data.\n"]
  purchase_order_data_source_type : purchase_order_data_source_type option;
      [@ocaml.doc "The type of source for purchase order data.\n"]
}
[@@ocaml.doc "Specifies the source configuration for retrieving purchase order data.\n"]

type nonrec purchase_order_data_sources = purchase_order_data_source list [@@ocaml.doc ""]

type nonrec protocol = CXML [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec einvoice_delivery_attachment_type =
  | INVOICE_PDF [@ocaml.doc ""]
  | RFP_PDF [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec einvoice_delivery_attachment_types = einvoice_delivery_attachment_type list
[@@ocaml.doc ""]

type nonrec einvoice_delivery_document_types = einvoice_delivery_document_type list [@@ocaml.doc ""]

type nonrec einvoice_delivery_preference = {
  einvoice_delivery_document_types : einvoice_delivery_document_types;
      [@ocaml.doc "The types of e-invoice documents to be delivered.\n"]
  einvoice_delivery_attachment_types : einvoice_delivery_attachment_types option;
      [@ocaml.doc "The types of attachments to include with the e-invoice delivery.\n"]
  protocol : protocol; [@ocaml.doc "The communication protocol to use for e-invoice delivery.\n"]
  purchase_order_data_sources : purchase_order_data_sources;
      [@ocaml.doc
        "The sources of purchase order data to use for e-invoice generation and delivery.\n"]
  connection_testing_method : connection_testing_method;
      [@ocaml.doc "The method to use for testing the connection to the procurement portal.\n"]
  einvoice_delivery_activation_date : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date when e-invoice delivery should be activated for this preference.\n"]
}
[@@ocaml.doc
  "Specifies the preferences for e-invoice delivery, including document types, attachment types, \
   and customization settings.\n"]

type nonrec supplier_domain = NetworkID [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec test_env_preference_input = {
  buyer_domain : buyer_domain;
      [@ocaml.doc "The domain identifier to use for the buyer in the test environment.\n"]
  buyer_identifier : basic_string_without_space;
      [@ocaml.doc "The unique identifier to use for the buyer in the test environment.\n"]
  supplier_domain : supplier_domain;
      [@ocaml.doc "The domain identifier to use for the supplier in the test environment.\n"]
  supplier_identifier : basic_string_without_space;
      [@ocaml.doc "The unique identifier to use for the supplier in the test environment.\n"]
  procurement_portal_shared_secret : basic_string_without_space option;
      [@ocaml.doc
        "The shared secret or authentication credential to use for secure communication in the \
         test environment.\n"]
  procurement_portal_instance_endpoint : basic_string_without_space option;
      [@ocaml.doc "The endpoint URL where e-invoices will be delivered in the test environment.\n"]
}
[@@ocaml.doc
  "Input parameters for configuring test environment preferences for a procurement portal.\n"]

type nonrec seller_of_records = basic_string_without_space list [@@ocaml.doc ""]

type nonrec invoice_unit_arns = invoice_unit_arn_string list [@@ocaml.doc ""]

type nonrec procurement_portal_preference_selector = {
  invoice_unit_arns : invoice_unit_arns option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of invoice unit identifiers to which this preference \
         applies. \n"]
  seller_of_records : seller_of_records option;
      [@ocaml.doc " The list of seller of record IDs to which this preference applies. \n"]
}
[@@ocaml.doc
  "Specifies criteria for selecting which invoices should be processed using a particular \
   procurement portal preference.\n"]

type nonrec procurement_portal_name = SAP_BUSINESS_NETWORK [@ocaml.doc ""] | COUPA [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec create_procurement_portal_preference_request = {
  procurement_portal_name : procurement_portal_name;
      [@ocaml.doc "The name of the procurement portal.\n"]
  buyer_domain : buyer_domain;
      [@ocaml.doc "The domain identifier for the buyer in the procurement portal.\n"]
  buyer_identifier : basic_string_without_space;
      [@ocaml.doc "The unique identifier for the buyer in the procurement portal. \n"]
  supplier_domain : supplier_domain;
      [@ocaml.doc "The domain identifier for the supplier in the procurement portal.\n"]
  supplier_identifier : basic_string_without_space;
      [@ocaml.doc "The unique identifier for the supplier in the procurement portal.\n"]
  selector : procurement_portal_preference_selector option; [@ocaml.doc ""]
  procurement_portal_shared_secret : sensitive_basic_string_without_space option;
      [@ocaml.doc
        "The shared secret or authentication credential used to establish secure communication \
         with the procurement portal. This value must be encrypted at rest.\n"]
  procurement_portal_instance_endpoint : basic_string_without_space option;
      [@ocaml.doc
        "The endpoint URL where e-invoices will be delivered to the procurement portal. Must be a \
         valid HTTPS URL.\n"]
  test_env_preference : test_env_preference_input option;
      [@ocaml.doc
        "Configuration settings for the test environment of the procurement portal. Includes test \
         credentials and endpoints that are used for validation before production deployment.\n"]
  einvoice_delivery_enabled : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc
        "Indicates whether e-invoice delivery is enabled for this procurement portal preference. \
         Set to true to enable e-invoice delivery, false to disable.\n"]
  einvoice_delivery_preference : einvoice_delivery_preference option;
      [@ocaml.doc
        "Specifies the e-invoice delivery configuration including document types, attachment \
         types, and customization settings for the portal.\n"]
  purchase_order_retrieval_enabled : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc
        "Indicates whether purchase order retrieval is enabled for this procurement portal \
         preference. Set to true to enable PO retrieval, false to disable.\n"]
  contacts : contacts;
      [@ocaml.doc
        "List of contact information for portal administrators and technical contacts responsible \
         for the e-invoice integration.\n"]
  resource_tags : resource_tag_list option;
      [@ocaml.doc
        "The tags to apply to this procurement portal preference resource. Each tag consists of a \
         key and an optional value.\n"]
  client_token : basic_string_without_space option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec currency_code = string [@@ocaml.doc ""]

type nonrec currency_exchange_details = {
  source_currency_code : basic_string option; [@ocaml.doc "The exchange source currency. \n"]
  target_currency_code : basic_string option; [@ocaml.doc "The exchange target currency. \n"]
  rate : basic_string option; [@ocaml.doc "The currency exchange rate. \n"]
}
[@@ocaml.doc "The details of currency exchange. \n"]

type nonrec date_interval = {
  start_date : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        " The beginning of the time period that you want invoice-related documents for. The start \
         date is inclusive. For example, if [start] is [2019-01-01], AWS retrieves invoices \
         starting at [2019-01-01] up to the end date. \n"]
  end_date : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        " The end of the time period that you want invoice-related documents for. The end date is \
         exclusive. For example, if [end] is [2019-01-10], Amazon Web Services retrieves \
         invoice-related documents from the start date up to, but not including, [2018-01-10]. \n"]
}
[@@ocaml.doc " The time period that you want invoice-related documents for. \n"]

type nonrec delete_invoice_unit_response = {
  invoice_unit_arn : invoice_unit_arn_string option;
      [@ocaml.doc
        " The ARN to identify an invoice unit. This information can't be modified or deleted. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_invoice_unit_request = {
  invoice_unit_arn : invoice_unit_arn_string;
      [@ocaml.doc
        " The ARN to identify an invoice unit. This information can't be modified or deleted. \n"]
  client_token : basic_string_without_space option;
      [@ocaml.doc
        " A unique, case-sensitive identifier that you provide to ensure idempotency of the \
         request. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_procurement_portal_preference_response = {
  procurement_portal_preference_arn : procurement_portal_preference_arn_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the deleted procurement portal preference.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_procurement_portal_preference_request = {
  procurement_portal_preference_arn : procurement_portal_preference_arn_string;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the procurement portal preference to delete.\n"]
  client_token : basic_string_without_space option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec einvoice_delivery_status = DELIVERED [@ocaml.doc ""] | NOT_DELIVERED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec entity = {
  invoicing_entity : basic_string option;
      [@ocaml.doc "The name of the entity that issues the Amazon Web Services invoice.\n"]
  billing_entity : billing_entity option;
      [@ocaml.doc
        "Helps you identify whether your invoices are for Amazon Web Services Marketplace or for \
         purchases of other Amazon Web Services services.\n"]
}
[@@ocaml.doc "The organization name providing Amazon Web Services services.\n"]

type nonrec invoice_unit_names = invoice_unit_name list [@@ocaml.doc ""]

type nonrec filters = {
  names : invoice_unit_names option;
      [@ocaml.doc
        " An optional input to the list API. You can specify a list of invoice unit names inside \
         filters to return invoice units that match only the specified invoice unit names. If \
         multiple names are provided, the result is an [OR] condition (match any) of the specified \
         invoice unit names. \n"]
  invoice_receivers : account_id_list option;
      [@ocaml.doc
        " You can specify a list of Amazon Web Services account IDs inside filters to return \
         invoice units that match only the specified accounts. If multiple accounts are provided, \
         the result is an [OR] condition (match any) of the specified accounts. This filter only \
         matches the specified accounts on the invoice receivers of the invoice units. \n"]
  accounts : account_id_list option;
      [@ocaml.doc
        " You can specify a list of Amazon Web Services account IDs inside filters to return \
         invoice units that match only the specified accounts. If multiple accounts are provided, \
         the result is an [OR] condition (match any) of the specified accounts. The specified \
         account IDs are matched with either the receiver or the linked accounts in the rules. \n"]
  bill_source_accounts : account_id_list option;
      [@ocaml.doc
        " A list of Amazon Web Services account IDs used to filter invoice units. These are payer \
         accounts from other Organizations that have delegated their billing responsibility to the \
         receiver account through the billing transfer feature. \n"]
}
[@@ocaml.doc
  "An optional input to the list API. If multiple filters are specified, the returned list will be \
   a configuration that match all of the provided filters. Supported filter types are \
   [InvoiceReceivers], [Names], and [Accounts]. \n"]

type nonrec string_without_new_line = string [@@ocaml.doc ""]

type nonrec supplemental_document_type =
  | GOVERNMENT_INVOICE [@ocaml.doc ""]
  | TAX_E_INVOICE [@ocaml.doc ""]
  | PAYMENT_RECEIPT [@ocaml.doc ""]
  | SUPPLEMENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec supplemental_document = {
  document_type : supplemental_document_type option;
      [@ocaml.doc "The type of supplemental document.\n"]
  document_id : string_without_new_line option;
      [@ocaml.doc "The ID of the supplemental document.\n"]
  document_url : string_without_new_line option;
      [@ocaml.doc "The pre-signed URL to download invoice supplemental document.\n"]
  document_url_expiration_date : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The pre-signed URL expiration date of invoice supplemental document.\n"]
}
[@@ocaml.doc "Supplemental document associated with the invoice.\n"]

type nonrec supplemental_documents = supplemental_document list [@@ocaml.doc ""]

type nonrec invoice_pd_f = {
  invoice_id : string_without_new_line option; [@ocaml.doc " Your unique invoice ID. \n"]
  document_url : string_without_new_line option;
      [@ocaml.doc "The pre-signed URL to download the invoice document. \n"]
  document_url_expiration_date : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The pre-signed URL expiration date of the invoice document.\n"]
  supplemental_documents : supplemental_documents option;
      [@ocaml.doc "List of supplemental documents associated with the invoice.\n"]
}
[@@ocaml.doc " Invoice document data. \n"]

type nonrec get_invoice_pdf_response = {
  invoice_pd_f : invoice_pd_f option;
      [@ocaml.doc
        " The invoice document and supplemental documents associated with the invoice. \n"]
}
[@@ocaml.doc ""]

type nonrec get_invoice_pdf_request = {
  invoice_id : string_without_new_line; [@ocaml.doc " Your unique invoice ID. \n"]
}
[@@ocaml.doc ""]

type nonrec last_modified_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec get_invoice_unit_response = {
  invoice_unit_arn : invoice_unit_arn_string option;
      [@ocaml.doc
        " The ARN to identify an invoice unit. This information can't be modified or deleted. \n"]
  invoice_receiver : account_id_string option;
      [@ocaml.doc
        " The Amazon Web Services account ID chosen to be the receiver of an invoice unit. All \
         invoices generated for that invoice unit will be sent to this account ID. \n"]
  name : invoice_unit_name option;
      [@ocaml.doc " The unique name of the invoice unit that is shown on the generated invoice. \n"]
  description : description_string option;
      [@ocaml.doc " The assigned description for an invoice unit. \n"]
  tax_inheritance_disabled : tax_inheritance_disabled_flag option;
      [@ocaml.doc
        " Whether the invoice unit based tax inheritance is/ should be enabled or disabled. \n"]
  rule : invoice_unit_rule option; [@ocaml.doc ""]
  last_modified : last_modified_timestamp option;
      [@ocaml.doc " The most recent date the invoice unit response was updated. \n"]
}
[@@ocaml.doc ""]

type nonrec get_invoice_unit_request = {
  invoice_unit_arn : invoice_unit_arn_string;
      [@ocaml.doc
        " The ARN to identify an invoice unit. This information can't be modified or deleted. \n"]
  as_of : as_of_timestamp option;
      [@ocaml.doc
        " The state of an invoice unit at a specified time. You can see legacy invoice units that \
         are currently deleted if the [AsOf] time is set to before it was deleted. If an [AsOf] is \
         not provided, the default value is the current time. \n"]
}
[@@ocaml.doc ""]

type nonrec procurement_portal_preference_status =
  | PENDING_VERIFICATION [@ocaml.doc ""]
  | TEST_INITIALIZED [@ocaml.doc ""]
  | TEST_INITIALIZATION_FAILED [@ocaml.doc ""]
  | TEST_FAILED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | SUSPENDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec test_env_preference = {
  buyer_domain : buyer_domain;
      [@ocaml.doc
        "The domain identifier for the buyer in the test environment of the procurement portal.\n"]
  buyer_identifier : basic_string_without_space;
      [@ocaml.doc
        "The unique identifier for the buyer in the test environment of the procurement portal.\n"]
  supplier_domain : supplier_domain;
      [@ocaml.doc
        "The domain identifier for the supplier in the test environment of the procurement portal.\n"]
  supplier_identifier : basic_string_without_space;
      [@ocaml.doc
        "The unique identifier for the supplier in the test environment of the procurement portal.\n"]
  procurement_portal_shared_secret : basic_string_without_space option;
      [@ocaml.doc
        "The shared secret or authentication credential used for secure communication with the \
         test environment.\n"]
  procurement_portal_instance_endpoint : basic_string_without_space option;
      [@ocaml.doc "The endpoint URL where e-invoices are delivered in the test environment.\n"]
  purchase_order_retrieval_endpoint : basic_string_without_space option;
      [@ocaml.doc "The endpoint URL used for retrieving purchase orders in the test environment.\n"]
}
[@@ocaml.doc
  "Contains configuration settings for testing the procurement portal integration in a \
   non-production environment.\n"]

type nonrec procurement_portal_preference = {
  aws_account_id : account_id_string;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with this procurement portal preference.\n"]
  procurement_portal_preference_arn : procurement_portal_preference_arn_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the procurement portal preference.\n"]
  procurement_portal_name : procurement_portal_name;
      [@ocaml.doc "The name of the procurement portal.\n"]
  buyer_domain : buyer_domain;
      [@ocaml.doc "The domain identifier for the buyer in the procurement portal.\n"]
  buyer_identifier : basic_string_without_space;
      [@ocaml.doc "The unique identifier for the buyer in the procurement portal.\n"]
  supplier_domain : supplier_domain;
      [@ocaml.doc "The domain identifier for the supplier in the procurement portal.\n"]
  supplier_identifier : basic_string_without_space;
      [@ocaml.doc "The unique identifier for the supplier in the procurement portal.\n"]
  selector : procurement_portal_preference_selector option; [@ocaml.doc ""]
  procurement_portal_shared_secret : basic_string_without_space option;
      [@ocaml.doc
        "The shared secret or authentication credential used for secure communication with the \
         procurement portal.\n"]
  procurement_portal_instance_endpoint : basic_string_without_space option;
      [@ocaml.doc "The endpoint URL where e-invoices are delivered to the procurement portal.\n"]
  purchase_order_retrieval_endpoint : basic_string_without_space option;
      [@ocaml.doc
        "The endpoint URL used for retrieving purchase orders from the procurement portal.\n"]
  test_env_preference : test_env_preference option;
      [@ocaml.doc "Configuration on settings for the test environment of the procurement portal.\n"]
  einvoice_delivery_enabled : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc
        "Indicates whether e-invoice delivery is enabled for this procurement portal preference.\n"]
  einvoice_delivery_preference : einvoice_delivery_preference option;
      [@ocaml.doc
        "The configuration settings that specify how e-invoices are delivered to the procurement \
         portal.\n"]
  purchase_order_retrieval_enabled : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc
        "Indicates whether purchase order retrieval is enabled for this procurement portal \
         preference.\n"]
  contacts : contacts option;
      [@ocaml.doc "List of contact information for portal administrators and technical contacts.\n"]
  einvoice_delivery_preference_status : procurement_portal_preference_status option;
      [@ocaml.doc "The current status of the e-invoice delivery preference.\n"]
  einvoice_delivery_preference_status_reason : basic_string option;
      [@ocaml.doc "The reason for the current e-invoice delivery preference status.\n"]
  purchase_order_retrieval_preference_status : procurement_portal_preference_status option;
      [@ocaml.doc "The current status of the purchase order retrieval preference.\n"]
  purchase_order_retrieval_preference_status_reason : basic_string option;
      [@ocaml.doc "The reason for the current purchase order retrieval preference status.\n"]
  version : Smaws_Lib.Smithy_api.Types.long;
      [@ocaml.doc "The version number of the procurement portal preference configuration.\n"]
  create_date : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time when the procurement portal preference was created.\n"]
  last_update_date : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time when the procurement portal preference was last updated.\n"]
}
[@@ocaml.doc
  "Represents the full configuration of a procurement portal preference, including settings for \
   e-invoice delivery and purchase order retrieval.\n"]

type nonrec get_procurement_portal_preference_response = {
  procurement_portal_preference : procurement_portal_preference;
      [@ocaml.doc "The detailed configuration of the requested procurement portal preference.\n"]
}
[@@ocaml.doc ""]

type nonrec get_procurement_portal_preference_request = {
  procurement_portal_preference_arn : procurement_portal_preference_arn_string;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the procurement portal preference to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec invoice_currency_amount = {
  total_amount : basic_string option; [@ocaml.doc " The invoice currency amount. \n"]
  total_amount_before_tax : basic_string option;
      [@ocaml.doc " Details about the invoice total amount before tax. \n"]
  currency_code : currency_code option;
      [@ocaml.doc "The currency dominion of the invoice document.\n"]
  amount_breakdown : amount_breakdown option;
      [@ocaml.doc " Details about the invoice currency amount. \n"]
  currency_exchange_details : currency_exchange_details option;
      [@ocaml.doc " The details of currency exchange. \n"]
}
[@@ocaml.doc " The amount charged after taxes, in the preferred currency. \n"]

type nonrec invoice_frequency = ONE_TIME [@ocaml.doc ""] | RECURRING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec tax_authority_status = ISSUED [@ocaml.doc ""] | CANCELLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec invoice_type =
  | INVOICE [@ocaml.doc ""]
  | CREDIT_MEMO [@ocaml.doc ""]
  | PAYMENT_RECEIPT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec receiver_role =
  | SELLER [@ocaml.doc ""]
  | RESELLER [@ocaml.doc ""]
  | BUYER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec invoice_summary = {
  account_id : account_id_string option; [@ocaml.doc " The Amazon Web Services account ID. \n"]
  invoice_id : basic_string option; [@ocaml.doc " The invoice ID. \n"]
  issued_date : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The issued date of the invoice. \n"]
  due_date : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc " The invoice due date. \n"]
  bill_source_accounts : bill_source_account_list option;
      [@ocaml.doc
        " The list of Amazon Web Services account IDs that are the bill source of the invoice. \
         Currently, only a single bill source account is returned.\n"]
  bill_source_accounts_total_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc " The total number of accounts that are the bill source of the invoice. \n"]
  receiver_role : receiver_role option; [@ocaml.doc "The role of the invoice receiver.\n"]
  entity : entity option;
      [@ocaml.doc "The organization name providing Amazon Web Services services.\n"]
  billing_period : billing_period option;
      [@ocaml.doc " The billing period of the invoice-related document. \n"]
  invoice_frequency : invoice_frequency option; [@ocaml.doc " The frequency of the invoice. \n"]
  bill_type : bill_type option; [@ocaml.doc " The type of the bill. \n"]
  invoice_type : invoice_type option; [@ocaml.doc " The type of invoice. \n"]
  commercial_invoice_id : basic_string option;
      [@ocaml.doc
        " The commercial invoice ID. This is only applicable for tax invoices and identifies the \
         associated commercial invoice. \n"]
  original_invoice_id : basic_string option; [@ocaml.doc "The initial or original invoice ID. \n"]
  purchase_order_number : basic_string option;
      [@ocaml.doc " The purchase order number associated to the invoice.\n"]
  einvoice_delivery_status : einvoice_delivery_status option;
      [@ocaml.doc " The e-invoice delivery status. \n"]
  tax_authority_status : tax_authority_status option;
      [@ocaml.doc
        " The current status of an invoice as reported to the tax authority. This captures \
         scenarios where an invoice may be cancelled after issuance. \n"]
  base_currency_amount : invoice_currency_amount option;
      [@ocaml.doc " The summary with the product and service currency. \n"]
  tax_currency_amount : invoice_currency_amount option;
      [@ocaml.doc " The summary with the tax currency. \n"]
  payment_currency_amount : invoice_currency_amount option;
      [@ocaml.doc " The summary with the customer configured currency. \n"]
}
[@@ocaml.doc " The invoice that the API retrieved. \n"]

type nonrec invoice_summaries = invoice_summary list [@@ocaml.doc ""]

type nonrec invoice_summaries_filter = {
  time_interval : date_interval option;
      [@ocaml.doc "The date range for invoice summary retrieval. \n"]
  billing_period : billing_period option;
      [@ocaml.doc "The billing period associated with the invoice documents. \n"]
  invoicing_entity : basic_string option;
      [@ocaml.doc "The name of the entity that issues the Amazon Web Services invoice.\n"]
  receiver_role : receiver_role option;
      [@ocaml.doc
        "The role of the invoice receiver to filter by.\n\n\
        \  When [ReceiverRole] is specified:\n\
        \  \n\
        \   {ul\n\
        \         {-  Data is available starting [2025-06-01]. Queries for periods before \
         [2025-06-01] return a validation error.\n\
        \             \n\
        \              }\n\
        \         {-   [TimeInterval] supports a time interval of up to 5 years. Without \
         [ReceiverRole], [TimeInterval] is limited to one month.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   "]
}
[@@ocaml.doc " Filters for your invoice summaries. \n"]

type nonrec invoice_summaries_max_results = int [@@ocaml.doc ""]

type nonrec list_invoice_summaries_resource_type =
  | ACCOUNT_ID [@ocaml.doc ""]
  | INVOICE_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec invoice_summaries_selector = {
  resource_type : list_invoice_summaries_resource_type;
      [@ocaml.doc "The query identifier type ([INVOICE_ID] or [ACCOUNT_ID]).\n"]
  value : string_without_new_line; [@ocaml.doc "The value of the query identifier.\n"]
}
[@@ocaml.doc "Specifies the invoice summary.\n"]

type nonrec invoice_unit = {
  invoice_unit_arn : invoice_unit_arn_string option;
      [@ocaml.doc
        "ARN to identify an invoice unit. This information can't be modified or deleted. \n"]
  invoice_receiver : account_id_string option;
      [@ocaml.doc "The account that receives invoices related to the invoice unit. \n"]
  name : invoice_unit_name option;
      [@ocaml.doc " A unique name that is distinctive within your Amazon Web Services. \n"]
  description : description_string option;
      [@ocaml.doc
        "The assigned description for an invoice unit. This information can't be modified or \
         deleted. \n"]
  tax_inheritance_disabled : tax_inheritance_disabled_flag option;
      [@ocaml.doc
        "Whether the invoice unit based tax inheritance is/ should be enabled or disabled. \n"]
  rule : invoice_unit_rule option;
      [@ocaml.doc " An [InvoiceUnitRule] object used the categorize invoice units. \n"]
  last_modified : last_modified_timestamp option;
      [@ocaml.doc
        " The last time the invoice unit was updated. This is important to determine the version \
         of invoice unit configuration used to create the invoices. Any invoice created after this \
         modified time will use this invoice unit configuration. \n"]
}
[@@ocaml.doc
  "An invoice unit is a set of mutually exclusive accounts that correspond to your business \
   entity. Invoice units allow you separate Amazon Web Services account costs and configures your \
   invoice for each business entity going forward. \n"]

type nonrec invoice_units = invoice_unit list [@@ocaml.doc ""]

type nonrec update_procurement_portal_preference_status_response = {
  procurement_portal_preference_arn : procurement_portal_preference_arn_string;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the procurement portal preference with updated status.\n"]
}
[@@ocaml.doc ""]

type nonrec update_procurement_portal_preference_status_request = {
  procurement_portal_preference_arn : procurement_portal_preference_arn_string;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the procurement portal preference to update.\n"]
  einvoice_delivery_preference_status : procurement_portal_preference_status option;
      [@ocaml.doc "The updated status of the e-invoice delivery preference.\n"]
  einvoice_delivery_preference_status_reason : basic_string option;
      [@ocaml.doc
        "The reason for the e-invoice delivery preference status update, providing context for the \
         change.\n"]
  purchase_order_retrieval_preference_status : procurement_portal_preference_status option;
      [@ocaml.doc "The updated status of the purchase order retrieval preference.\n"]
  purchase_order_retrieval_preference_status_reason : basic_string option;
      [@ocaml.doc
        "The reason for the purchase order retrieval preference status update, providing context \
         for the change.\n"]
  client_token : basic_string_without_space option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec update_invoice_unit_response = {
  invoice_unit_arn : invoice_unit_arn_string option;
      [@ocaml.doc
        " The ARN to identify an invoice unit. This information can't be modified or deleted. \n"]
}
[@@ocaml.doc ""]

type nonrec update_invoice_unit_request = {
  invoice_unit_arn : invoice_unit_arn_string;
      [@ocaml.doc
        "The ARN to identify an invoice unit. This information can't be modified or deleted. \n"]
  description : description_string option;
      [@ocaml.doc
        "The assigned description for an invoice unit. This information can't be modified or \
         deleted. \n"]
  tax_inheritance_disabled : tax_inheritance_disabled_flag option;
      [@ocaml.doc
        "Whether the invoice unit based tax inheritance is/ should be enabled or disabled. \n"]
  rule : invoice_unit_rule option;
      [@ocaml.doc "The [InvoiceUnitRule] object used to update invoice units. \n"]
  client_token : basic_string_without_space option;
      [@ocaml.doc
        " A unique, case-sensitive identifier that you provide to ensure idempotency of the \
         request. \n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec resource_tag_key_list = resource_tag_key list [@@ocaml.doc ""]

type nonrec tagris_arn = string [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : tagris_arn; [@ocaml.doc " The Amazon Resource Name (ARN) to untag. \n"]
  resource_tag_keys : resource_tag_key_list; [@ocaml.doc " Keys for the tags to be removed. \n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : tagris_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the tags. \n"]
  resource_tags : resource_tag_list; [@ocaml.doc " Adds a tag to a resource. \n"]
}
[@@ocaml.doc ""]

type nonrec put_procurement_portal_preference_response = {
  procurement_portal_preference_arn : procurement_portal_preference_arn_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the updated procurement portal preference.\n"]
}
[@@ocaml.doc ""]

type nonrec put_procurement_portal_preference_request = {
  procurement_portal_preference_arn : procurement_portal_preference_arn_string;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the procurement portal preference to update.\n"]
  selector : procurement_portal_preference_selector option; [@ocaml.doc ""]
  procurement_portal_shared_secret : sensitive_basic_string_without_space option;
      [@ocaml.doc
        "The updated shared secret or authentication credential for the procurement portal. This \
         value must be encrypted at rest.\n"]
  procurement_portal_instance_endpoint : basic_string_without_space option;
      [@ocaml.doc
        "The updated endpoint URL where e-invoices will be delivered to the procurement portal. \
         Must be a valid HTTPS URL.\n"]
  test_env_preference : test_env_preference_input option;
      [@ocaml.doc
        "Updated configuration settings for the test environment of the procurement portal.\n"]
  einvoice_delivery_enabled : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc
        "Updated flag indicating whether e-invoice delivery is enabled for this procurement portal \
         preference.\n"]
  einvoice_delivery_preference : einvoice_delivery_preference option;
      [@ocaml.doc
        "Updated e-invoice delivery configuration including document types, attachment types, and \
         customization settings for the portal.\n"]
  purchase_order_retrieval_enabled : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc
        "Updated flag indicating whether purchase order retrieval is enabled for this procurement \
         portal preference.\n"]
  contacts : contacts;
      [@ocaml.doc
        "Updated list of contact information for portal administrators and technical contacts.\n"]
  client_token : basic_string_without_space option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  resource_tags : resource_tag_list option; [@ocaml.doc " Adds a tag to a resource. \n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : tagris_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of tags to list. \n"]
}
[@@ocaml.doc ""]

type nonrec procurement_portal_preference_summary = {
  aws_account_id : account_id_string;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with this procurement portal preference \
         summary.\n"]
  procurement_portal_preference_arn : procurement_portal_preference_arn_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the procurement portal preference.\n"]
  procurement_portal_name : procurement_portal_name;
      [@ocaml.doc "The name of the procurement portal.\n"]
  buyer_domain : buyer_domain;
      [@ocaml.doc "The domain identifier for the buyer in the procurement portal.\n"]
  buyer_identifier : basic_string_without_space;
      [@ocaml.doc "The unique identifier for the buyer in the procurement portal.\n"]
  supplier_domain : supplier_domain;
      [@ocaml.doc "The domain identifier for the supplier in the procurement portal.\n"]
  supplier_identifier : basic_string_without_space;
      [@ocaml.doc "The unique identifier for the supplier in the procurement portal.\n"]
  selector : procurement_portal_preference_selector option; [@ocaml.doc ""]
  einvoice_delivery_enabled : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc
        "Indicates whether e-invoice delivery is enabled for this procurement portal preference.\n"]
  purchase_order_retrieval_enabled : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc
        "Indicates whether purchase order retrieval is enabled for this procurement portal \
         preference.\n"]
  einvoice_delivery_preference_status : procurement_portal_preference_status option;
      [@ocaml.doc "The current status of the e-invoice delivery preference in this summary.\n"]
  einvoice_delivery_preference_status_reason : basic_string option;
      [@ocaml.doc
        "The reason for the current e-invoice delivery preference status in this summary.\n"]
  purchase_order_retrieval_preference_status : procurement_portal_preference_status option;
      [@ocaml.doc
        "The current status of the purchase order retrieval preference in this summary.\n"]
  purchase_order_retrieval_preference_status_reason : basic_string option;
      [@ocaml.doc
        "The reason for the current purchase order retrieval preference status in this summary.\n"]
  version : Smaws_Lib.Smithy_api.Types.long;
      [@ocaml.doc
        "The version number of the procurement portal preference configuration in this summary.\n"]
  create_date : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time when the procurement portal preference was created.\n"]
  last_update_date : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time when the procurement portal preference was last updated.\n"]
}
[@@ocaml.doc
  "Provides a summary of a procurement portal preference, including key identifiers and status \
   information.\n"]

type nonrec procurement_portal_preference_summaries = procurement_portal_preference_summary list
[@@ocaml.doc ""]

type nonrec list_procurement_portal_preferences_response = {
  procurement_portal_preferences : procurement_portal_preference_summaries option;
      [@ocaml.doc
        "The list of procurement portal preferences associated with the Amazon Web Services account.\n"]
  next_token : basic_string_without_space option;
      [@ocaml.doc
        "The token to use to retrieve the next set of results, or null if there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_procurement_portal_preferences_request = {
  next_token : basic_string_without_space option;
      [@ocaml.doc
        "The token for the next set of results. (You received this token from a previous call.)\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return in a single call. To retrieve the remaining \
         results, make another call with the returned NextToken value.\n"]
}
[@@ocaml.doc ""]

type nonrec next_token_string = string [@@ocaml.doc ""]

type nonrec list_invoice_units_response = {
  invoice_units : invoice_units option;
      [@ocaml.doc
        " An invoice unit is a set of mutually exclusive accounts that correspond to your business \
         entity. \n"]
  next_token : next_token_string option;
      [@ocaml.doc "The next token used to indicate where the returned list should start from. \n"]
}
[@@ocaml.doc ""]

type nonrec max_results_integer = int [@@ocaml.doc ""]

type nonrec list_invoice_units_request = {
  filters : filters option;
      [@ocaml.doc
        " An optional input to the list API. If multiple filters are specified, the returned list \
         will be a configuration that match all of the provided filters. Supported filter types \
         are [InvoiceReceivers], [Names], and [Accounts]. \n"]
  next_token : next_token_string option;
      [@ocaml.doc "The next token used to indicate where the returned list should start from. \n"]
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of invoice units that can be returned. \n"]
  as_of : as_of_timestamp option;
      [@ocaml.doc
        " The state of an invoice unit at a specified time. You can see legacy invoice units that \
         are currently deleted if the [AsOf] time is set to before it was deleted. If an [AsOf] is \
         not provided, the default value is the current time. \n"]
}
[@@ocaml.doc ""]

type nonrec list_invoice_summaries_response = {
  invoice_summaries : invoice_summaries;
      [@ocaml.doc "List of key (summary level) invoice details without line item details.\n"]
  next_token : next_token_string option;
      [@ocaml.doc
        "The token to use to retrieve the next set of results, or null if there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_invoice_summaries_request = {
  selector : invoice_summaries_selector;
      [@ocaml.doc
        "The option to retrieve details for a specific invoice by providing its unique ID. \
         Alternatively, access information for all invoices linked to the account by providing an \
         account ID.\n"]
  filter : invoice_summaries_filter option;
      [@ocaml.doc "Filters you can use to customize your invoice summary.\n"]
  next_token : next_token_string option;
      [@ocaml.doc
        "The token for the next set of results. (You received this token from a previous call.)\n"]
  max_results : invoice_summaries_max_results option;
      [@ocaml.doc "The maximum number of invoice summaries a paginated response can contain.\n"]
}
[@@ocaml.doc ""]
