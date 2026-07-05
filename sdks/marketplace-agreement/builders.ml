open Types

let make_variable_payment_term_configuration
    ?expiration_duration:(expiration_duration_ : iso8601_duration option)
    ~payment_request_approval_strategy:
      (payment_request_approval_strategy_ : payment_request_approval_strategy) () =
  ({
     expiration_duration = expiration_duration_;
     payment_request_approval_strategy = payment_request_approval_strategy_;
   }
    : variable_payment_term_configuration)

let make_variable_payment_term
    ?configuration:(configuration_ : variable_payment_term_configuration option)
    ?max_total_charge_amount:(max_total_charge_amount_ : bounded_string option)
    ?currency_code:(currency_code_ : currency_code option) ?id:(id_ : term_id option)
    ?type_:(type__ : unversioned_term_type option) () =
  ({
     configuration = configuration_;
     max_total_charge_amount = max_total_charge_amount_;
     currency_code = currency_code_;
     id = id_;
     type_ = type__;
   }
    : variable_payment_term)

let make_validity_term ?agreement_end_date:(agreement_end_date_ : timestamp option)
    ?agreement_start_date:(agreement_start_date_ : timestamp option)
    ?agreement_duration:(agreement_duration_ : bounded_string option) ?id:(id_ : term_id option)
    ?type_:(type__ : unversioned_term_type option) () =
  ({
     agreement_end_date = agreement_end_date_;
     agreement_start_date = agreement_start_date_;
     agreement_duration = agreement_duration_;
     id = id_;
     type_ = type__;
   }
    : validity_term)

let make_validation_exception_field ~message:(message_ : bounded_string)
    ~name:(name_ : bounded_string) () =
  ({ message = message_; name = name_ } : validation_exception_field)

let make_rate_card_item ?price:(price_ : bounded_string option)
    ?dimension_key:(dimension_key_ : bounded_string option) () =
  ({ price = price_; dimension_key = dimension_key_ } : rate_card_item)

let make_usage_based_rate_card_item ?rate_card:(rate_card_ : rate_card_list option) () =
  ({ rate_card = rate_card_ } : usage_based_rate_card_item)

let make_usage_based_pricing_term ?rate_cards:(rate_cards_ : usage_based_rate_card_list option)
    ?currency_code:(currency_code_ : currency_code option) ?id:(id_ : term_id option)
    ?type_:(type__ : unversioned_term_type option) () =
  ({ rate_cards = rate_cards_; currency_code = currency_code_; id = id_; type_ = type__ }
    : usage_based_pricing_term)

let make_update_purchase_orders_output () = (() : unit)

let make_purchase_order
    ?purchase_order_reference:(purchase_order_reference_ : purchase_order_reference option)
    ?agreement_id:(agreement_id_ : resource_id option)
    ?charge_revision:(charge_revision_ : charge_revision option)
    ~charge_id:(charge_id_ : resource_id) () =
  ({
     purchase_order_reference = purchase_order_reference_;
     agreement_id = agreement_id_;
     charge_revision = charge_revision_;
     charge_id = charge_id_;
   }
    : purchase_order)

let make_update_purchase_orders_input ~purchase_orders:(purchase_orders_ : purchase_orders) () =
  ({ purchase_orders = purchase_orders_ } : update_purchase_orders_input)

let make_tax_configuration ?tax_estimation:(tax_estimation_ : tax_estimation option) () =
  ({ tax_estimation = tax_estimation_ } : tax_configuration)

let make_tax_breakdown_item ?type_:(type__ : bounded_string option)
    ?rate:(rate_ : bounded_string option) ?amount:(amount_ : bounded_string option) () =
  ({ type_ = type__; rate = rate_; amount = amount_ } : tax_breakdown_item)

let make_support_term ?refund_policy:(refund_policy_ : bounded_string option)
    ?id:(id_ : term_id option) ?type_:(type__ : unversioned_term_type option) () =
  ({ refund_policy = refund_policy_; id = id_; type_ = type__ } : support_term)

let make_sort ?sort_order:(sort_order_ : sort_order option) ?sort_by:(sort_by_ : sort_by option) ()
    =
  ({ sort_order = sort_order_; sort_by = sort_by_ } : sort)

let make_send_agreement_payment_request_output ?created_at:(created_at_ : timestamp option)
    ?currency_code:(currency_code_ : currency_code option)
    ?charge_amount:(charge_amount_ : positive_amount_upto8_decimals option)
    ?description:(description_ : payment_request_description option)
    ?name:(name_ : payment_request_name option) ?status:(status_ : payment_request_status option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?payment_request_id:(payment_request_id_ : payment_request_id option) () =
  ({
     created_at = created_at_;
     currency_code = currency_code_;
     charge_amount = charge_amount_;
     description = description_;
     name = name_;
     status = status_;
     agreement_id = agreement_id_;
     payment_request_id = payment_request_id_;
   }
    : send_agreement_payment_request_output)

let make_send_agreement_payment_request_input
    ?description:(description_ : payment_request_description option)
    ?client_token:(client_token_ : client_token option)
    ~charge_amount:(charge_amount_ : positive_amount_upto8_decimals)
    ~name:(name_ : payment_request_name) ~term_id:(term_id_ : term_id)
    ~agreement_id:(agreement_id_ : agreement_id) () =
  ({
     description = description_;
     charge_amount = charge_amount_;
     name = name_;
     term_id = term_id_;
     agreement_id = agreement_id_;
     client_token = client_token_;
   }
    : send_agreement_payment_request_input)

let make_send_agreement_cancellation_request_output ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?description:(description_ : agreement_cancellation_request_description option)
    ?reason_code:(reason_code_ : agreement_cancellation_request_reason_code option)
    ?status:(status_ : agreement_cancellation_request_status option)
    ?agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id option)
    ?agreement_id:(agreement_id_ : agreement_id option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     description = description_;
     reason_code = reason_code_;
     status = status_;
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
     agreement_id = agreement_id_;
   }
    : send_agreement_cancellation_request_output)

let make_send_agreement_cancellation_request_input
    ?description:(description_ : agreement_cancellation_request_description option)
    ?client_token:(client_token_ : client_token option)
    ~reason_code:(reason_code_ : agreement_cancellation_request_reason_code)
    ~agreement_id:(agreement_id_ : agreement_id) () =
  ({
     description = description_;
     client_token = client_token_;
     reason_code = reason_code_;
     agreement_id = agreement_id_;
   }
    : send_agreement_cancellation_request_input)

let make_selector ?value:(value_ : bounded_string option) ?type_:(type__ : bounded_string option) ()
    =
  ({ value = value_; type_ = type__ } : selector)

let make_acceptor ?account_id:(account_id_ : aws_account_id option) () =
  ({ account_id = account_id_ } : acceptor)

let make_proposer ?account_id:(account_id_ : aws_account_id option) () =
  ({ account_id = account_id_ } : proposer)

let make_resource ?type_:(type__ : agreement_resource_type option) ?id:(id_ : resource_id option) ()
    =
  ({ type_ = type__; id = id_ } : resource)

let make_proposal_summary ?offer_set_id:(offer_set_id_ : offer_set_id option)
    ?offer_id:(offer_id_ : offer_id option) ?resources:(resources_ : resources option) () =
  ({ offer_set_id = offer_set_id_; offer_id = offer_id_; resources = resources_ }
    : proposal_summary)

let make_entitlement ?license_arn:(license_arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ license_arn = license_arn_ } : entitlement)

let make_agreement_view_summary ?entitlements:(entitlements_ : entitlement_list option)
    ?status:(status_ : agreement_status option)
    ?proposal_summary:(proposal_summary_ : proposal_summary option)
    ?proposer:(proposer_ : proposer option) ?acceptor:(acceptor_ : acceptor option)
    ?agreement_type:(agreement_type_ : agreement_type option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?acceptance_time:(acceptance_time_ : timestamp option)
    ?agreement_id:(agreement_id_ : resource_id option) () =
  ({
     entitlements = entitlements_;
     status = status_;
     proposal_summary = proposal_summary_;
     proposer = proposer_;
     acceptor = acceptor_;
     agreement_type = agreement_type_;
     end_time = end_time_;
     start_time = start_time_;
     acceptance_time = acceptance_time_;
     agreement_id = agreement_id_;
   }
    : agreement_view_summary)

let make_search_agreements_output ?next_token:(next_token_ : next_token option)
    ?agreement_view_summaries:(agreement_view_summaries_ : agreement_view_summary_list option) () =
  ({ next_token = next_token_; agreement_view_summaries = agreement_view_summaries_ }
    : search_agreements_output)

let make_filter ?values:(values_ : filter_value_list option) ?name:(name_ : filter_name option) () =
  ({ values = values_; name = name_ } : filter)

let make_search_agreements_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?sort:(sort_ : sort option)
    ?filters:(filters_ : filter_list option) ?catalog:(catalog_ : catalog option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort = sort_;
     filters = filters_;
     catalog = catalog_;
   }
    : search_agreements_input)

let make_schedule_item ?charge_amount:(charge_amount_ : bounded_string option)
    ?charge_date:(charge_date_ : timestamp option) () =
  ({ charge_amount = charge_amount_; charge_date = charge_date_ } : schedule_item)

let make_dimension ~dimension_value:(dimension_value_ : zero_value_integer)
    ~dimension_key:(dimension_key_ : bounded_string) () =
  ({ dimension_value = dimension_value_; dimension_key = dimension_key_ } : dimension)

let make_configurable_upfront_pricing_term_configuration ~dimensions:(dimensions_ : dimension_list)
    ~selector_value:(selector_value_ : bounded_string) () =
  ({ dimensions = dimensions_; selector_value = selector_value_ }
    : configurable_upfront_pricing_term_configuration)

let make_renewal_term_configuration ~enable_auto_renew:(enable_auto_renew_ : boolean_) () =
  ({ enable_auto_renew = enable_auto_renew_ } : renewal_term_configuration)

let make_requested_term ?configuration:(configuration_ : requested_term_configuration option)
    ~id:(id_ : term_id) () =
  ({ configuration = configuration_; id = id_ } : requested_term)

let make_renewal_term ?configuration:(configuration_ : renewal_term_configuration option)
    ?id:(id_ : term_id option) ?type_:(type__ : unversioned_term_type option) () =
  ({ configuration = configuration_; id = id_; type_ = type__ } : renewal_term)

let make_reject_agreement_payment_request_output
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?currency_code:(currency_code_ : currency_code option)
    ?charge_amount:(charge_amount_ : positive_amount_upto8_decimals option)
    ?description:(description_ : payment_request_description option)
    ?name:(name_ : payment_request_name option)
    ?status_message:(status_message_ : payment_request_status_message option)
    ?status:(status_ : payment_request_status option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?payment_request_id:(payment_request_id_ : payment_request_id option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     currency_code = currency_code_;
     charge_amount = charge_amount_;
     description = description_;
     name = name_;
     status_message = status_message_;
     status = status_;
     agreement_id = agreement_id_;
     payment_request_id = payment_request_id_;
   }
    : reject_agreement_payment_request_output)

let make_reject_agreement_payment_request_input
    ?rejection_reason:(rejection_reason_ : payment_request_rejection_reason option)
    ~agreement_id:(agreement_id_ : agreement_id)
    ~payment_request_id:(payment_request_id_ : payment_request_id) () =
  ({
     rejection_reason = rejection_reason_;
     agreement_id = agreement_id_;
     payment_request_id = payment_request_id_;
   }
    : reject_agreement_payment_request_input)

let make_reject_agreement_cancellation_request_output ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?description:(description_ : agreement_cancellation_request_description option)
    ?reason_code:(reason_code_ : agreement_cancellation_request_reason_code option)
    ?status_message:(status_message_ : agreement_cancellation_request_status_message option)
    ?status:(status_ : agreement_cancellation_request_status option)
    ?agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id option)
    ?agreement_id:(agreement_id_ : agreement_id option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     description = description_;
     reason_code = reason_code_;
     status_message = status_message_;
     status = status_;
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
     agreement_id = agreement_id_;
   }
    : reject_agreement_cancellation_request_output)

let make_reject_agreement_cancellation_request_input
    ~rejection_reason:(rejection_reason_ : agreement_cancellation_request_rejection_reason)
    ~agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id)
    ~agreement_id:(agreement_id_ : agreement_id) () =
  ({
     rejection_reason = rejection_reason_;
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
     agreement_id = agreement_id_;
   }
    : reject_agreement_cancellation_request_input)

let make_recurring_payment_term ?price:(price_ : bounded_string option)
    ?billing_period:(billing_period_ : bounded_string option)
    ?currency_code:(currency_code_ : currency_code option) ?id:(id_ : term_id option)
    ?type_:(type__ : unversioned_term_type option) () =
  ({
     price = price_;
     billing_period = billing_period_;
     currency_code = currency_code_;
     id = id_;
     type_ = type__;
   }
    : recurring_payment_term)

let make_pricing_currency_amount ?currency_code:(currency_code_ : currency_code option)
    ?max_adjustment_amount:(max_adjustment_amount_ : bounded_string option)
    ?amount:(amount_ : bounded_string option) () =
  ({
     currency_code = currency_code_;
     max_adjustment_amount = max_adjustment_amount_;
     amount = amount_;
   }
    : pricing_currency_amount)

let make_payment_schedule_term ?schedule:(schedule_ : schedule_list option)
    ?currency_code:(currency_code_ : currency_code option) ?id:(id_ : term_id option)
    ?type_:(type__ : unversioned_term_type option) () =
  ({ schedule = schedule_; currency_code = currency_code_; id = id_; type_ = type__ }
    : payment_schedule_term)

let make_payment_request_summary
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?currency_code:(currency_code_ : currency_code option)
    ?charge_amount:(charge_amount_ : positive_amount_upto8_decimals option)
    ?charge_id:(charge_id_ : charge_id option) ?name:(name_ : payment_request_name option)
    ?status:(status_ : payment_request_status option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?payment_request_id:(payment_request_id_ : payment_request_id option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     currency_code = currency_code_;
     charge_amount = charge_amount_;
     charge_id = charge_id_;
     name = name_;
     status = status_;
     agreement_id = agreement_id_;
     payment_request_id = payment_request_id_;
   }
    : payment_request_summary)

let make_billing_adjustment_summary ~catalog:(catalog_ : catalog)
    ~agreement_type:(agreement_type_ : agreement_type) ~updated_at:(updated_at_ : timestamp)
    ~created_at:(created_at_ : timestamp) ~agreement_id:(agreement_id_ : agreement_id)
    ~status:(status_ : billing_adjustment_status) ~currency_code:(currency_code_ : currency_code)
    ~adjustment_amount:(adjustment_amount_ : positive_amount_upto8_decimals)
    ~original_invoice_id:(original_invoice_id_ : invoice_id)
    ~billing_adjustment_request_id:(billing_adjustment_request_id_ : billing_adjustment_request_id)
    () =
  ({
     catalog = catalog_;
     agreement_type = agreement_type_;
     updated_at = updated_at_;
     created_at = created_at_;
     agreement_id = agreement_id_;
     status = status_;
     currency_code = currency_code_;
     adjustment_amount = adjustment_amount_;
     original_invoice_id = original_invoice_id_;
     billing_adjustment_request_id = billing_adjustment_request_id_;
   }
    : billing_adjustment_summary)

let make_list_billing_adjustment_requests_output ?next_token:(next_token_ : next_token option)
    ~items:(items_ : billing_adjustment_summary_list) () =
  ({ items = items_; next_token = next_token_ } : list_billing_adjustment_requests_output)

let make_list_billing_adjustment_requests_input ?next_token:(next_token_ : next_token option)
    ?agreement_type:(agreement_type_ : agreement_type option) ?catalog:(catalog_ : catalog option)
    ?max_results:(max_results_ : max_results option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option)
    ?status:(status_ : billing_adjustment_status option)
    ?agreement_id:(agreement_id_ : agreement_id option) () =
  ({
     next_token = next_token_;
     agreement_type = agreement_type_;
     catalog = catalog_;
     max_results = max_results_;
     created_before = created_before_;
     created_after = created_after_;
     status = status_;
     agreement_id = agreement_id_;
   }
    : list_billing_adjustment_requests_input)

let make_list_agreement_payment_requests_output ?next_token:(next_token_ : next_token option)
    ~items:(items_ : payment_request_summary_list) () =
  ({ items = items_; next_token = next_token_ } : list_agreement_payment_requests_output)

let make_list_agreement_payment_requests_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?status:(status_ : payment_request_status option)
    ?agreement_id:(agreement_id_ : agreement_id option) ?catalog:(catalog_ : catalog option)
    ?agreement_type:(agreement_type_ : agreement_type option) ~party_type:(party_type_ : party_type)
    () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     status = status_;
     agreement_id = agreement_id_;
     catalog = catalog_;
     agreement_type = agreement_type_;
     party_type = party_type_;
   }
    : list_agreement_payment_requests_input)

let make_invoice_billing_period ~year:(year_ : Smaws_Lib.Smithy_api.Types.integer)
    ~month:(month_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({ year = year_; month = month_ } : invoice_billing_period)

let make_invoicing_entity ?branch_name:(branch_name_ : bounded_string option)
    ?legal_name:(legal_name_ : bounded_string option) () =
  ({ branch_name = branch_name_; legal_name = legal_name_ } : invoicing_entity)

let make_agreement_invoice_line_item_group_summary
    ?invoicing_entity:(invoicing_entity_ : invoicing_entity option)
    ?invoice_type:(invoice_type_ : invoice_type option)
    ?issued_time:(issued_time_ : timestamp option)
    ?invoice_billing_period:(invoice_billing_period_ : invoice_billing_period option)
    ?pricing_currency_amount:(pricing_currency_amount_ : pricing_currency_amount option)
    ?invoice_id:(invoice_id_ : resource_id option)
    ?agreement_id:(agreement_id_ : resource_id option) () =
  ({
     invoicing_entity = invoicing_entity_;
     invoice_type = invoice_type_;
     issued_time = issued_time_;
     invoice_billing_period = invoice_billing_period_;
     pricing_currency_amount = pricing_currency_amount_;
     invoice_id = invoice_id_;
     agreement_id = agreement_id_;
   }
    : agreement_invoice_line_item_group_summary)

let make_list_agreement_invoice_line_items_output ?next_token:(next_token_ : next_token option)
    ?agreement_invoice_line_item_group_summaries:
      (agreement_invoice_line_item_group_summaries_ :
         agreement_invoice_line_item_group_summaries option) () =
  ({
     next_token = next_token_;
     agreement_invoice_line_item_group_summaries = agreement_invoice_line_item_group_summaries_;
   }
    : list_agreement_invoice_line_items_output)

let make_list_agreement_invoice_line_items_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?after_issued_time:(after_issued_time_ : timestamp option)
    ?before_issued_time:(before_issued_time_ : timestamp option)
    ?invoice_billing_period:(invoice_billing_period_ : invoice_billing_period option)
    ?invoice_type:(invoice_type_ : invoice_type option)
    ?invoice_id:(invoice_id_ : resource_id option) ~group_by:(group_by_ : line_item_group_by)
    ~agreement_id:(agreement_id_ : resource_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     after_issued_time = after_issued_time_;
     before_issued_time = before_issued_time_;
     invoice_billing_period = invoice_billing_period_;
     invoice_type = invoice_type_;
     invoice_id = invoice_id_;
     group_by = group_by_;
     agreement_id = agreement_id_;
   }
    : list_agreement_invoice_line_items_input)

let make_charge ?time:(time_ : timestamp option) ?amount:(amount_ : bounded_string option)
    ?currency_code:(currency_code_ : currency_code option)
    ?purchase_order_reference:(purchase_order_reference_ : purchase_order_reference option)
    ?agreement_type:(agreement_type_ : agreement_type option)
    ?agreement_id:(agreement_id_ : resource_id option)
    ?revision:(revision_ : charge_revision option) ?id:(id_ : resource_id option) () =
  ({
     time = time_;
     amount = amount_;
     currency_code = currency_code_;
     purchase_order_reference = purchase_order_reference_;
     agreement_type = agreement_type_;
     agreement_id = agreement_id_;
     revision = revision_;
     id = id_;
   }
    : charge)

let make_list_agreement_charges_output ?next_token:(next_token_ : next_token option)
    ?items:(items_ : charges option) () =
  ({ next_token = next_token_; items = items_ } : list_agreement_charges_output)

let make_list_agreement_charges_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?agreement_type:(agreement_type_ : agreement_type option)
    ?agreement_id:(agreement_id_ : resource_id option) ?catalog:(catalog_ : catalog option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     agreement_type = agreement_type_;
     agreement_id = agreement_id_;
     catalog = catalog_;
   }
    : list_agreement_charges_input)

let make_agreement_cancellation_request_summary ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option) ?catalog:(catalog_ : catalog option)
    ?agreement_type:(agreement_type_ : agreement_type option)
    ?reason_code:(reason_code_ : agreement_cancellation_request_reason_code option)
    ?status:(status_ : agreement_cancellation_request_status option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     catalog = catalog_;
     agreement_type = agreement_type_;
     reason_code = reason_code_;
     status = status_;
     agreement_id = agreement_id_;
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
   }
    : agreement_cancellation_request_summary)

let make_list_agreement_cancellation_requests_output
    ?items:(items_ : agreement_cancellation_request_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ items = items_; next_token = next_token_ } : list_agreement_cancellation_requests_output)

let make_list_agreement_cancellation_requests_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?catalog:(catalog_ : catalog option)
    ?agreement_type:(agreement_type_ : agreement_type option)
    ?status:(status_ : agreement_cancellation_request_status option)
    ?agreement_id:(agreement_id_ : agreement_id option) ~party_type:(party_type_ : party_type) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     catalog = catalog_;
     agreement_type = agreement_type_;
     status = status_;
     agreement_id = agreement_id_;
     party_type = party_type_;
   }
    : list_agreement_cancellation_requests_input)

let make_document_item ?version:(version_ : bounded_string option)
    ?url:(url_ : bounded_string option) ?type_:(type__ : bounded_string option) () =
  ({ version = version_; url = url_; type_ = type__ } : document_item)

let make_legal_term ?documents:(documents_ : document_list option) ?id:(id_ : term_id option)
    ?type_:(type__ : unversioned_term_type option) () =
  ({ documents = documents_; id = id_; type_ = type__ } : legal_term)

let make_itemized_charge
    ?incremental_charge_amount:(incremental_charge_amount_ : bounded_string option)
    ?charge_reference:(charge_reference_ : resource_id option)
    ?old_quantity:(old_quantity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?new_quantity:(new_quantity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?dimension_key:(dimension_key_ : bounded_string option) () =
  ({
     incremental_charge_amount = incremental_charge_amount_;
     charge_reference = charge_reference_;
     old_quantity = old_quantity_;
     new_quantity = new_quantity_;
     dimension_key = dimension_key_;
   }
    : itemized_charge)

let make_grant_item ?max_quantity:(max_quantity_ : positive_integer_with_default_value_one option)
    ?dimension_key:(dimension_key_ : bounded_string option) () =
  ({ max_quantity = max_quantity_; dimension_key = dimension_key_ } : grant_item)

let make_get_billing_adjustment_request_output
    ?status_message:(status_message_ : billing_adjustment_status_message option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~updated_at:(updated_at_ : timestamp) ~created_at:(created_at_ : timestamp)
    ~status:(status_ : billing_adjustment_status) ~currency_code:(currency_code_ : currency_code)
    ~adjustment_amount:(adjustment_amount_ : positive_amount_upto8_decimals)
    ~original_invoice_id:(original_invoice_id_ : invoice_id)
    ~adjustment_reason_code:(adjustment_reason_code_ : billing_adjustment_reason_code)
    ~agreement_id:(agreement_id_ : agreement_id)
    ~billing_adjustment_request_id:(billing_adjustment_request_id_ : billing_adjustment_request_id)
    () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     status_message = status_message_;
     status = status_;
     currency_code = currency_code_;
     adjustment_amount = adjustment_amount_;
     original_invoice_id = original_invoice_id_;
     description = description_;
     adjustment_reason_code = adjustment_reason_code_;
     agreement_id = agreement_id_;
     billing_adjustment_request_id = billing_adjustment_request_id_;
   }
    : get_billing_adjustment_request_output)

let make_get_billing_adjustment_request_input
    ~billing_adjustment_request_id:(billing_adjustment_request_id_ : billing_adjustment_request_id)
    ~agreement_id:(agreement_id_ : agreement_id) () =
  ({ billing_adjustment_request_id = billing_adjustment_request_id_; agreement_id = agreement_id_ }
    : get_billing_adjustment_request_input)

let make_constraints ?quantity_configuration:(quantity_configuration_ : bounded_string option)
    ?multiple_dimension_selection:(multiple_dimension_selection_ : bounded_string option) () =
  ({
     quantity_configuration = quantity_configuration_;
     multiple_dimension_selection = multiple_dimension_selection_;
   }
    : constraints)

let make_configurable_upfront_rate_card_item ?rate_card:(rate_card_ : rate_card_list option)
    ?constraints:(constraints_ : constraints option) ?selector:(selector_ : selector option) () =
  ({ rate_card = rate_card_; constraints = constraints_; selector = selector_ }
    : configurable_upfront_rate_card_item)

let make_configurable_upfront_pricing_term
    ?configuration:(configuration_ : configurable_upfront_pricing_term_configuration option)
    ?rate_cards:(rate_cards_ : configurable_upfront_rate_card_list option)
    ?currency_code:(currency_code_ : currency_code option) ?id:(id_ : term_id option)
    ?type_:(type__ : unversioned_term_type option) () =
  ({
     configuration = configuration_;
     rate_cards = rate_cards_;
     currency_code = currency_code_;
     id = id_;
     type_ = type__;
   }
    : configurable_upfront_pricing_term)

let make_byol_pricing_term ?id:(id_ : term_id option) ?type_:(type__ : unversioned_term_type option)
    () =
  ({ id = id_; type_ = type__ } : byol_pricing_term)

let make_free_trial_pricing_term ?grants:(grants_ : grant_list option)
    ?duration:(duration_ : bounded_string option) ?id:(id_ : term_id option)
    ?type_:(type__ : unversioned_term_type option) () =
  ({ grants = grants_; duration = duration_; id = id_; type_ = type__ } : free_trial_pricing_term)

let make_fixed_upfront_pricing_term ?grants:(grants_ : grant_list option)
    ?price:(price_ : bounded_string option) ?duration:(duration_ : bounded_string option)
    ?currency_code:(currency_code_ : currency_code option) ?id:(id_ : term_id option)
    ?type_:(type__ : unversioned_term_type option) () =
  ({
     grants = grants_;
     price = price_;
     duration = duration_;
     currency_code = currency_code_;
     id = id_;
     type_ = type__;
   }
    : fixed_upfront_pricing_term)

let make_get_agreement_terms_output ?next_token:(next_token_ : next_token option)
    ?accepted_terms:(accepted_terms_ : accepted_term_list option) () =
  ({ next_token = next_token_; accepted_terms = accepted_terms_ } : get_agreement_terms_output)

let make_get_agreement_terms_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~agreement_id:(agreement_id_ : resource_id) ()
    =
  ({ next_token = next_token_; max_results = max_results_; agreement_id = agreement_id_ }
    : get_agreement_terms_input)

let make_get_agreement_payment_request_output
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?currency_code:(currency_code_ : currency_code option)
    ?charge_amount:(charge_amount_ : positive_amount_upto8_decimals option)
    ?charge_id:(charge_id_ : charge_id option)
    ?description:(description_ : payment_request_description option)
    ?name:(name_ : payment_request_name option)
    ?status_message:(status_message_ : payment_request_status_message option)
    ?status:(status_ : payment_request_status option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?payment_request_id:(payment_request_id_ : payment_request_id option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     currency_code = currency_code_;
     charge_amount = charge_amount_;
     charge_id = charge_id_;
     description = description_;
     name = name_;
     status_message = status_message_;
     status = status_;
     agreement_id = agreement_id_;
     payment_request_id = payment_request_id_;
   }
    : get_agreement_payment_request_output)

let make_get_agreement_payment_request_input ~agreement_id:(agreement_id_ : agreement_id)
    ~payment_request_id:(payment_request_id_ : payment_request_id) () =
  ({ agreement_id = agreement_id_; payment_request_id = payment_request_id_ }
    : get_agreement_payment_request_input)

let make_agreement_entitlement ?license_arn:(license_arn_ : aws_arn option)
    ?status_reason_code:(status_reason_code_ : agreement_entitlement_status_reason_code option)
    ?status:(status_ : agreement_entitlement_status option)
    ?registration_token:(registration_token_ : registration_token option)
    ?type_:(type__ : entitlement_type option) ?resource:(resource_ : resource option) () =
  ({
     license_arn = license_arn_;
     status_reason_code = status_reason_code_;
     status = status_;
     registration_token = registration_token_;
     type_ = type__;
     resource = resource_;
   }
    : agreement_entitlement)

let make_get_agreement_entitlements_output ?next_token:(next_token_ : next_token option)
    ?agreement_entitlements:(agreement_entitlements_ : agreement_entitlement_list option) () =
  ({ next_token = next_token_; agreement_entitlements = agreement_entitlements_ }
    : get_agreement_entitlements_output)

let make_get_agreement_entitlements_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~agreement_id:(agreement_id_ : resource_id) ()
    =
  ({ next_token = next_token_; max_results = max_results_; agreement_id = agreement_id_ }
    : get_agreement_entitlements_input)

let make_get_agreement_cancellation_request_output ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?status_message:(status_message_ : agreement_cancellation_request_status_message option)
    ?status:(status_ : agreement_cancellation_request_status option)
    ?description:(description_ : agreement_cancellation_request_description option)
    ?reason_code:(reason_code_ : agreement_cancellation_request_reason_code option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     status_message = status_message_;
     status = status_;
     description = description_;
     reason_code = reason_code_;
     agreement_id = agreement_id_;
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
   }
    : get_agreement_cancellation_request_output)

let make_get_agreement_cancellation_request_input ~agreement_id:(agreement_id_ : agreement_id)
    ~agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id) () =
  ({
     agreement_id = agreement_id_;
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
   }
    : get_agreement_cancellation_request_input)

let make_estimated_taxes ?total_amount:(total_amount_ : bounded_string option)
    ?breakdown:(breakdown_ : tax_breakdown option) () =
  ({ total_amount = total_amount_; breakdown = breakdown_ } : estimated_taxes)

let make_expected_charge ?estimated_taxes:(estimated_taxes_ : estimated_taxes option)
    ?timing:(timing_ : timing option) ?amount_after_tax:(amount_after_tax_ : bounded_string option)
    ?amount:(amount_ : bounded_string option) ?time:(time_ : timestamp option)
    ?id:(id_ : resource_id option) () =
  ({
     estimated_taxes = estimated_taxes_;
     timing = timing_;
     amount_after_tax = amount_after_tax_;
     amount = amount_;
     time = time_;
     id = id_;
   }
    : expected_charge)

let make_estimated_charges ?agreement_value:(agreement_value_ : bounded_string option)
    ?currency_code:(currency_code_ : currency_code option) () =
  ({ agreement_value = agreement_value_; currency_code = currency_code_ } : estimated_charges)

let make_describe_agreement_output ?status:(status_ : agreement_status option)
    ?proposal_summary:(proposal_summary_ : proposal_summary option)
    ?estimated_charges:(estimated_charges_ : estimated_charges option)
    ?agreement_type:(agreement_type_ : agreement_type option)
    ?acceptance_time:(acceptance_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option) ?proposer:(proposer_ : proposer option)
    ?acceptor:(acceptor_ : acceptor option) ?agreement_id:(agreement_id_ : resource_id option) () =
  ({
     status = status_;
     proposal_summary = proposal_summary_;
     estimated_charges = estimated_charges_;
     agreement_type = agreement_type_;
     acceptance_time = acceptance_time_;
     end_time = end_time_;
     start_time = start_time_;
     proposer = proposer_;
     acceptor = acceptor_;
     agreement_id = agreement_id_;
   }
    : describe_agreement_output)

let make_describe_agreement_input ~agreement_id:(agreement_id_ : resource_id) () =
  ({ agreement_id = agreement_id_ } : describe_agreement_input)

let make_charge_summary ?invoicing_entity:(invoicing_entity_ : invoicing_entity option)
    ?itemized_charges:(itemized_charges_ : itemized_charge_list option)
    ?estimated_taxes:(estimated_taxes_ : estimated_taxes option)
    ?expected_charges:(expected_charges_ : expected_charge_list option)
    ?new_agreement_value_after_tax:(new_agreement_value_after_tax_ : bounded_string option)
    ?new_agreement_value:(new_agreement_value_ : bounded_string option)
    ?currency_code:(currency_code_ : currency_code option) () =
  ({
     invoicing_entity = invoicing_entity_;
     itemized_charges = itemized_charges_;
     estimated_taxes = estimated_taxes_;
     expected_charges = expected_charges_;
     new_agreement_value_after_tax = new_agreement_value_after_tax_;
     new_agreement_value = new_agreement_value_;
     currency_code = currency_code_;
   }
    : charge_summary)

let make_create_agreement_request_output ?charge_summary:(charge_summary_ : charge_summary option)
    ?agreement_request_id:(agreement_request_id_ : agreement_request_id option) () =
  ({ charge_summary = charge_summary_; agreement_request_id = agreement_request_id_ }
    : create_agreement_request_output)

let make_create_agreement_request_input
    ?tax_configuration:(tax_configuration_ : tax_configuration option)
    ?agreement_proposal_identifier:(agreement_proposal_identifier_ : agreement_proposal_id option)
    ?source_agreement_identifier:(source_agreement_identifier_ : resource_id option)
    ?client_token:(client_token_ : client_token option)
    ~requested_terms:(requested_terms_ : requested_term_list) ~intent:(intent_ : intent) () =
  ({
     tax_configuration = tax_configuration_;
     agreement_proposal_identifier = agreement_proposal_identifier_;
     source_agreement_identifier = source_agreement_identifier_;
     requested_terms = requested_terms_;
     intent = intent_;
     client_token = client_token_;
   }
    : create_agreement_request_input)

let make_cancel_agreement_payment_request_output ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?currency_code:(currency_code_ : currency_code option)
    ?charge_amount:(charge_amount_ : positive_amount_upto8_decimals option)
    ?description:(description_ : payment_request_description option)
    ?name:(name_ : payment_request_name option) ?status:(status_ : payment_request_status option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?payment_request_id:(payment_request_id_ : payment_request_id option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     currency_code = currency_code_;
     charge_amount = charge_amount_;
     description = description_;
     name = name_;
     status = status_;
     agreement_id = agreement_id_;
     payment_request_id = payment_request_id_;
   }
    : cancel_agreement_payment_request_output)

let make_cancel_agreement_payment_request_input ~agreement_id:(agreement_id_ : agreement_id)
    ~payment_request_id:(payment_request_id_ : payment_request_id) () =
  ({ agreement_id = agreement_id_; payment_request_id = payment_request_id_ }
    : cancel_agreement_payment_request_input)

let make_cancel_agreement_output () = (() : unit)

let make_cancel_agreement_input ~agreement_id:(agreement_id_ : resource_id) () =
  ({ agreement_id = agreement_id_ } : cancel_agreement_input)

let make_cancel_agreement_cancellation_request_output ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?status_message:(status_message_ : agreement_cancellation_request_status_message option)
    ?status:(status_ : agreement_cancellation_request_status option)
    ?description:(description_ : agreement_cancellation_request_description option)
    ?reason_code:(reason_code_ : agreement_cancellation_request_reason_code option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     status_message = status_message_;
     status = status_;
     description = description_;
     reason_code = reason_code_;
     agreement_id = agreement_id_;
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
   }
    : cancel_agreement_cancellation_request_output)

let make_cancel_agreement_cancellation_request_input
    ~cancellation_reason:(cancellation_reason_ : agreement_cancellation_request_cancellation_reason)
    ~agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id)
    ~agreement_id:(agreement_id_ : agreement_id) () =
  ({
     cancellation_reason = cancellation_reason_;
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
     agreement_id = agreement_id_;
   }
    : cancel_agreement_cancellation_request_input)

let make_batch_create_billing_adjustment_item ~client_token:(client_token_ : client_token)
    ~billing_adjustment_request_id:(billing_adjustment_request_id_ : billing_adjustment_request_id)
    () =
  ({ client_token = client_token_; billing_adjustment_request_id = billing_adjustment_request_id_ }
    : batch_create_billing_adjustment_item)

let make_batch_create_billing_adjustment_error ~client_token:(client_token_ : client_token)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~code:(code_ : billing_adjustment_error_code) () =
  ({ client_token = client_token_; message = message_; code = code_ }
    : batch_create_billing_adjustment_error)

let make_batch_create_billing_adjustment_request_output
    ~errors:(errors_ : batch_create_billing_adjustment_error_list)
    ~items:(items_ : batch_create_billing_adjustment_item_list) () =
  ({ errors = errors_; items = items_ } : batch_create_billing_adjustment_request_output)

let make_batch_create_billing_adjustment_request_entry
    ?description:(description_ : billing_adjustment_description option)
    ~client_token:(client_token_ : client_token)
    ~adjustment_reason_code:(adjustment_reason_code_ : billing_adjustment_reason_code)
    ~currency_code:(currency_code_ : currency_code)
    ~adjustment_amount:(adjustment_amount_ : positive_amount_upto8_decimals)
    ~original_invoice_id:(original_invoice_id_ : invoice_id)
    ~agreement_id:(agreement_id_ : agreement_id) () =
  ({
     client_token = client_token_;
     description = description_;
     adjustment_reason_code = adjustment_reason_code_;
     currency_code = currency_code_;
     adjustment_amount = adjustment_amount_;
     original_invoice_id = original_invoice_id_;
     agreement_id = agreement_id_;
   }
    : batch_create_billing_adjustment_request_entry)

let make_batch_create_billing_adjustment_request_input
    ~billing_adjustment_request_entries:
      (billing_adjustment_request_entries_ : batch_create_billing_adjustment_request_entry_list) ()
    =
  ({ billing_adjustment_request_entries = billing_adjustment_request_entries_ }
    : batch_create_billing_adjustment_request_input)

let make_accept_agreement_request_output ?agreement_id:(agreement_id_ : resource_id option) () =
  ({ agreement_id = agreement_id_ } : accept_agreement_request_output)

let make_accept_agreement_request_input ?purchase_orders:(purchase_orders_ : purchase_orders option)
    ~agreement_request_id:(agreement_request_id_ : agreement_request_id) () =
  ({ purchase_orders = purchase_orders_; agreement_request_id = agreement_request_id_ }
    : accept_agreement_request_input)

let make_accept_agreement_payment_request_output
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?currency_code:(currency_code_ : currency_code option)
    ?charge_amount:(charge_amount_ : positive_amount_upto8_decimals option)
    ?description:(description_ : payment_request_description option)
    ?name:(name_ : payment_request_name option) ?status:(status_ : payment_request_status option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?payment_request_id:(payment_request_id_ : payment_request_id option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     currency_code = currency_code_;
     charge_amount = charge_amount_;
     description = description_;
     name = name_;
     status = status_;
     agreement_id = agreement_id_;
     payment_request_id = payment_request_id_;
   }
    : accept_agreement_payment_request_output)

let make_accept_agreement_payment_request_input
    ?purchase_order_reference:(purchase_order_reference_ : purchase_order_reference option)
    ~agreement_id:(agreement_id_ : agreement_id)
    ~payment_request_id:(payment_request_id_ : payment_request_id) () =
  ({
     purchase_order_reference = purchase_order_reference_;
     agreement_id = agreement_id_;
     payment_request_id = payment_request_id_;
   }
    : accept_agreement_payment_request_input)

let make_accept_agreement_cancellation_request_output ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?description:(description_ : agreement_cancellation_request_description option)
    ?reason_code:(reason_code_ : agreement_cancellation_request_reason_code option)
    ?status:(status_ : agreement_cancellation_request_status option)
    ?agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id option)
    ?agreement_id:(agreement_id_ : agreement_id option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     description = description_;
     reason_code = reason_code_;
     status = status_;
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
     agreement_id = agreement_id_;
   }
    : accept_agreement_cancellation_request_output)

let make_accept_agreement_cancellation_request_input
    ~agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id)
    ~agreement_id:(agreement_id_ : agreement_id) () =
  ({
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
     agreement_id = agreement_id_;
   }
    : accept_agreement_cancellation_request_input)
