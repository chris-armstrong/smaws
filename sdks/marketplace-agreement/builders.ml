open Types

let make_validation_exception_field ~name:(name_ : bounded_string)
    ~message:(message_ : bounded_string) () =
  ({ name = name_; message = message_ } : validation_exception_field)

let make_update_purchase_orders_output () = (() : unit)

let make_purchase_order ?charge_revision:(charge_revision_ : charge_revision option)
    ?agreement_id:(agreement_id_ : resource_id option)
    ?purchase_order_reference:(purchase_order_reference_ : purchase_order_reference option)
    ~charge_id:(charge_id_ : resource_id) () =
  ({
     charge_id = charge_id_;
     charge_revision = charge_revision_;
     agreement_id = agreement_id_;
     purchase_order_reference = purchase_order_reference_;
   }
    : purchase_order)

let make_update_purchase_orders_input ~purchase_orders:(purchase_orders_ : purchase_orders) () =
  ({ purchase_orders = purchase_orders_ } : update_purchase_orders_input)

let make_send_agreement_payment_request_output
    ?payment_request_id:(payment_request_id_ : payment_request_id option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?status:(status_ : payment_request_status option) ?name:(name_ : payment_request_name option)
    ?description:(description_ : payment_request_description option)
    ?charge_amount:(charge_amount_ : positive_amount_upto8_decimals option)
    ?currency_code:(currency_code_ : currency_code option)
    ?created_at:(created_at_ : timestamp option) () =
  ({
     payment_request_id = payment_request_id_;
     agreement_id = agreement_id_;
     status = status_;
     name = name_;
     description = description_;
     charge_amount = charge_amount_;
     currency_code = currency_code_;
     created_at = created_at_;
   }
    : send_agreement_payment_request_output)

let make_send_agreement_payment_request_input ?client_token:(client_token_ : client_token option)
    ?description:(description_ : payment_request_description option)
    ~agreement_id:(agreement_id_ : agreement_id) ~term_id:(term_id_ : term_id)
    ~name:(name_ : payment_request_name)
    ~charge_amount:(charge_amount_ : positive_amount_upto8_decimals) () =
  ({
     client_token = client_token_;
     agreement_id = agreement_id_;
     term_id = term_id_;
     name = name_;
     charge_amount = charge_amount_;
     description = description_;
   }
    : send_agreement_payment_request_input)

let make_send_agreement_cancellation_request_output
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id option)
    ?status:(status_ : agreement_cancellation_request_status option)
    ?reason_code:(reason_code_ : agreement_cancellation_request_reason_code option)
    ?description:(description_ : agreement_cancellation_request_description option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option) () =
  ({
     agreement_id = agreement_id_;
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
     status = status_;
     reason_code = reason_code_;
     description = description_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : send_agreement_cancellation_request_output)

let make_send_agreement_cancellation_request_input
    ?client_token:(client_token_ : client_token option)
    ?description:(description_ : agreement_cancellation_request_description option)
    ~agreement_id:(agreement_id_ : agreement_id)
    ~reason_code:(reason_code_ : agreement_cancellation_request_reason_code) () =
  ({
     agreement_id = agreement_id_;
     reason_code = reason_code_;
     client_token = client_token_;
     description = description_;
   }
    : send_agreement_cancellation_request_input)

let make_entitlement ?license_arn:(license_arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ license_arn = license_arn_ } : entitlement)

let make_resource ?id:(id_ : resource_id option) ?type_:(type__ : agreement_resource_type option) ()
    =
  ({ id = id_; type_ = type__ } : resource)

let make_proposal_summary ?resources:(resources_ : resources option)
    ?offer_id:(offer_id_ : offer_id option) ?offer_set_id:(offer_set_id_ : offer_set_id option) () =
  ({ resources = resources_; offer_id = offer_id_; offer_set_id = offer_set_id_ }
    : proposal_summary)

let make_proposer ?account_id:(account_id_ : aws_account_id option) () =
  ({ account_id = account_id_ } : proposer)

let make_acceptor ?account_id:(account_id_ : aws_account_id option) () =
  ({ account_id = account_id_ } : acceptor)

let make_agreement_view_summary ?agreement_id:(agreement_id_ : resource_id option)
    ?acceptance_time:(acceptance_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?agreement_type:(agreement_type_ : agreement_type option)
    ?acceptor:(acceptor_ : acceptor option) ?proposer:(proposer_ : proposer option)
    ?proposal_summary:(proposal_summary_ : proposal_summary option)
    ?status:(status_ : agreement_status option)
    ?entitlements:(entitlements_ : entitlement_list option) () =
  ({
     agreement_id = agreement_id_;
     acceptance_time = acceptance_time_;
     start_time = start_time_;
     end_time = end_time_;
     agreement_type = agreement_type_;
     acceptor = acceptor_;
     proposer = proposer_;
     proposal_summary = proposal_summary_;
     status = status_;
     entitlements = entitlements_;
   }
    : agreement_view_summary)

let make_search_agreements_output
    ?agreement_view_summaries:(agreement_view_summaries_ : agreement_view_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ agreement_view_summaries = agreement_view_summaries_; next_token = next_token_ }
    : search_agreements_output)

let make_sort ?sort_by:(sort_by_ : sort_by option) ?sort_order:(sort_order_ : sort_order option) ()
    =
  ({ sort_by = sort_by_; sort_order = sort_order_ } : sort)

let make_filter ?name:(name_ : filter_name option) ?values:(values_ : filter_value_list option) () =
  ({ name = name_; values = values_ } : filter)

let make_search_agreements_input ?catalog:(catalog_ : catalog option)
    ?filters:(filters_ : filter_list option) ?sort:(sort_ : sort option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     catalog = catalog_;
     filters = filters_;
     sort = sort_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : search_agreements_input)

let make_reject_agreement_payment_request_output
    ?payment_request_id:(payment_request_id_ : payment_request_id option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?status:(status_ : payment_request_status option)
    ?status_message:(status_message_ : payment_request_status_message option)
    ?name:(name_ : payment_request_name option)
    ?description:(description_ : payment_request_description option)
    ?charge_amount:(charge_amount_ : positive_amount_upto8_decimals option)
    ?currency_code:(currency_code_ : currency_code option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     payment_request_id = payment_request_id_;
     agreement_id = agreement_id_;
     status = status_;
     status_message = status_message_;
     name = name_;
     description = description_;
     charge_amount = charge_amount_;
     currency_code = currency_code_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : reject_agreement_payment_request_output)

let make_reject_agreement_payment_request_input
    ?rejection_reason:(rejection_reason_ : payment_request_rejection_reason option)
    ~payment_request_id:(payment_request_id_ : payment_request_id)
    ~agreement_id:(agreement_id_ : agreement_id) () =
  ({
     payment_request_id = payment_request_id_;
     agreement_id = agreement_id_;
     rejection_reason = rejection_reason_;
   }
    : reject_agreement_payment_request_input)

let make_reject_agreement_cancellation_request_output
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id option)
    ?status:(status_ : agreement_cancellation_request_status option)
    ?status_message:(status_message_ : agreement_cancellation_request_status_message option)
    ?reason_code:(reason_code_ : agreement_cancellation_request_reason_code option)
    ?description:(description_ : agreement_cancellation_request_description option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option) () =
  ({
     agreement_id = agreement_id_;
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
     status = status_;
     status_message = status_message_;
     reason_code = reason_code_;
     description = description_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : reject_agreement_cancellation_request_output)

let make_reject_agreement_cancellation_request_input ~agreement_id:(agreement_id_ : agreement_id)
    ~agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id)
    ~rejection_reason:(rejection_reason_ : agreement_cancellation_request_rejection_reason) () =
  ({
     agreement_id = agreement_id_;
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
     rejection_reason = rejection_reason_;
   }
    : reject_agreement_cancellation_request_input)

let make_billing_adjustment_summary
    ~billing_adjustment_request_id:(billing_adjustment_request_id_ : billing_adjustment_request_id)
    ~original_invoice_id:(original_invoice_id_ : invoice_id)
    ~adjustment_amount:(adjustment_amount_ : positive_amount_upto8_decimals)
    ~currency_code:(currency_code_ : currency_code) ~status:(status_ : billing_adjustment_status)
    ~agreement_id:(agreement_id_ : agreement_id) ~created_at:(created_at_ : timestamp)
    ~updated_at:(updated_at_ : timestamp) ~agreement_type:(agreement_type_ : agreement_type)
    ~catalog:(catalog_ : catalog) () =
  ({
     billing_adjustment_request_id = billing_adjustment_request_id_;
     original_invoice_id = original_invoice_id_;
     adjustment_amount = adjustment_amount_;
     currency_code = currency_code_;
     status = status_;
     agreement_id = agreement_id_;
     created_at = created_at_;
     updated_at = updated_at_;
     agreement_type = agreement_type_;
     catalog = catalog_;
   }
    : billing_adjustment_summary)

let make_list_billing_adjustment_requests_output ?next_token:(next_token_ : next_token option)
    ~items:(items_ : billing_adjustment_summary_list) () =
  ({ next_token = next_token_; items = items_ } : list_billing_adjustment_requests_output)

let make_list_billing_adjustment_requests_input ?agreement_id:(agreement_id_ : agreement_id option)
    ?status:(status_ : billing_adjustment_status option)
    ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?max_results:(max_results_ : max_results option) ?catalog:(catalog_ : catalog option)
    ?agreement_type:(agreement_type_ : agreement_type option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     agreement_id = agreement_id_;
     status = status_;
     created_after = created_after_;
     created_before = created_before_;
     max_results = max_results_;
     catalog = catalog_;
     agreement_type = agreement_type_;
     next_token = next_token_;
   }
    : list_billing_adjustment_requests_input)

let make_payment_request_summary
    ?payment_request_id:(payment_request_id_ : payment_request_id option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?status:(status_ : payment_request_status option) ?name:(name_ : payment_request_name option)
    ?charge_id:(charge_id_ : charge_id option)
    ?charge_amount:(charge_amount_ : positive_amount_upto8_decimals option)
    ?currency_code:(currency_code_ : currency_code option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     payment_request_id = payment_request_id_;
     agreement_id = agreement_id_;
     status = status_;
     name = name_;
     charge_id = charge_id_;
     charge_amount = charge_amount_;
     currency_code = currency_code_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : payment_request_summary)

let make_list_agreement_payment_requests_output ?next_token:(next_token_ : next_token option)
    ~items:(items_ : payment_request_summary_list) () =
  ({ next_token = next_token_; items = items_ } : list_agreement_payment_requests_output)

let make_list_agreement_payment_requests_input
    ?agreement_type:(agreement_type_ : agreement_type option) ?catalog:(catalog_ : catalog option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?status:(status_ : payment_request_status option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~party_type:(party_type_ : party_type) () =
  ({
     party_type = party_type_;
     agreement_type = agreement_type_;
     catalog = catalog_;
     agreement_id = agreement_id_;
     status = status_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_agreement_payment_requests_input)

let make_invoicing_entity ?legal_name:(legal_name_ : bounded_string option)
    ?branch_name:(branch_name_ : bounded_string option) () =
  ({ legal_name = legal_name_; branch_name = branch_name_ } : invoicing_entity)

let make_invoice_billing_period ~month:(month_ : Smaws_Lib.Smithy_api.Types.integer)
    ~year:(year_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({ month = month_; year = year_ } : invoice_billing_period)

let make_pricing_currency_amount ?amount:(amount_ : bounded_string option)
    ?max_adjustment_amount:(max_adjustment_amount_ : bounded_string option)
    ?currency_code:(currency_code_ : currency_code option) () =
  ({
     amount = amount_;
     max_adjustment_amount = max_adjustment_amount_;
     currency_code = currency_code_;
   }
    : pricing_currency_amount)

let make_agreement_invoice_line_item_group_summary
    ?agreement_id:(agreement_id_ : resource_id option)
    ?invoice_id:(invoice_id_ : resource_id option)
    ?pricing_currency_amount:(pricing_currency_amount_ : pricing_currency_amount option)
    ?invoice_billing_period:(invoice_billing_period_ : invoice_billing_period option)
    ?issued_time:(issued_time_ : timestamp option)
    ?invoice_type:(invoice_type_ : invoice_type option)
    ?invoicing_entity:(invoicing_entity_ : invoicing_entity option) () =
  ({
     agreement_id = agreement_id_;
     invoice_id = invoice_id_;
     pricing_currency_amount = pricing_currency_amount_;
     invoice_billing_period = invoice_billing_period_;
     issued_time = issued_time_;
     invoice_type = invoice_type_;
     invoicing_entity = invoicing_entity_;
   }
    : agreement_invoice_line_item_group_summary)

let make_list_agreement_invoice_line_items_output
    ?agreement_invoice_line_item_group_summaries:
      (agreement_invoice_line_item_group_summaries_ :
         agreement_invoice_line_item_group_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     agreement_invoice_line_item_group_summaries = agreement_invoice_line_item_group_summaries_;
     next_token = next_token_;
   }
    : list_agreement_invoice_line_items_output)

let make_list_agreement_invoice_line_items_input ?invoice_id:(invoice_id_ : resource_id option)
    ?invoice_type:(invoice_type_ : invoice_type option)
    ?invoice_billing_period:(invoice_billing_period_ : invoice_billing_period option)
    ?before_issued_time:(before_issued_time_ : timestamp option)
    ?after_issued_time:(after_issued_time_ : timestamp option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~agreement_id:(agreement_id_ : resource_id) ~group_by:(group_by_ : line_item_group_by) () =
  ({
     agreement_id = agreement_id_;
     group_by = group_by_;
     invoice_id = invoice_id_;
     invoice_type = invoice_type_;
     invoice_billing_period = invoice_billing_period_;
     before_issued_time = before_issued_time_;
     after_issued_time = after_issued_time_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_agreement_invoice_line_items_input)

let make_charge ?id:(id_ : resource_id option) ?revision:(revision_ : charge_revision option)
    ?agreement_id:(agreement_id_ : resource_id option)
    ?agreement_type:(agreement_type_ : agreement_type option)
    ?purchase_order_reference:(purchase_order_reference_ : purchase_order_reference option)
    ?currency_code:(currency_code_ : currency_code option) ?amount:(amount_ : bounded_string option)
    ?time:(time_ : timestamp option) () =
  ({
     id = id_;
     revision = revision_;
     agreement_id = agreement_id_;
     agreement_type = agreement_type_;
     purchase_order_reference = purchase_order_reference_;
     currency_code = currency_code_;
     amount = amount_;
     time = time_;
   }
    : charge)

let make_list_agreement_charges_output ?items:(items_ : charges option)
    ?next_token:(next_token_ : next_token option) () =
  ({ items = items_; next_token = next_token_ } : list_agreement_charges_output)

let make_list_agreement_charges_input ?catalog:(catalog_ : catalog option)
    ?agreement_id:(agreement_id_ : resource_id option)
    ?agreement_type:(agreement_type_ : agreement_type option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     catalog = catalog_;
     agreement_id = agreement_id_;
     agreement_type = agreement_type_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_agreement_charges_input)

let make_agreement_cancellation_request_summary
    ?agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?status:(status_ : agreement_cancellation_request_status option)
    ?reason_code:(reason_code_ : agreement_cancellation_request_reason_code option)
    ?agreement_type:(agreement_type_ : agreement_type option) ?catalog:(catalog_ : catalog option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option) () =
  ({
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
     agreement_id = agreement_id_;
     status = status_;
     reason_code = reason_code_;
     agreement_type = agreement_type_;
     catalog = catalog_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : agreement_cancellation_request_summary)

let make_list_agreement_cancellation_requests_output ?next_token:(next_token_ : next_token option)
    ?items:(items_ : agreement_cancellation_request_summary_list option) () =
  ({ next_token = next_token_; items = items_ } : list_agreement_cancellation_requests_output)

let make_list_agreement_cancellation_requests_input
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?status:(status_ : agreement_cancellation_request_status option)
    ?agreement_type:(agreement_type_ : agreement_type option) ?catalog:(catalog_ : catalog option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~party_type:(party_type_ : party_type) () =
  ({
     party_type = party_type_;
     agreement_id = agreement_id_;
     status = status_;
     agreement_type = agreement_type_;
     catalog = catalog_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_agreement_cancellation_requests_input)

let make_get_billing_adjustment_request_output
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status_message:(status_message_ : billing_adjustment_status_message option)
    ~billing_adjustment_request_id:(billing_adjustment_request_id_ : billing_adjustment_request_id)
    ~agreement_id:(agreement_id_ : agreement_id)
    ~adjustment_reason_code:(adjustment_reason_code_ : billing_adjustment_reason_code)
    ~original_invoice_id:(original_invoice_id_ : invoice_id)
    ~adjustment_amount:(adjustment_amount_ : positive_amount_upto8_decimals)
    ~currency_code:(currency_code_ : currency_code) ~status:(status_ : billing_adjustment_status)
    ~created_at:(created_at_ : timestamp) ~updated_at:(updated_at_ : timestamp) () =
  ({
     billing_adjustment_request_id = billing_adjustment_request_id_;
     agreement_id = agreement_id_;
     adjustment_reason_code = adjustment_reason_code_;
     description = description_;
     original_invoice_id = original_invoice_id_;
     adjustment_amount = adjustment_amount_;
     currency_code = currency_code_;
     status = status_;
     status_message = status_message_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : get_billing_adjustment_request_output)

let make_get_billing_adjustment_request_input ~agreement_id:(agreement_id_ : agreement_id)
    ~billing_adjustment_request_id:(billing_adjustment_request_id_ : billing_adjustment_request_id)
    () =
  ({ agreement_id = agreement_id_; billing_adjustment_request_id = billing_adjustment_request_id_ }
    : get_billing_adjustment_request_input)

let make_variable_payment_term_configuration
    ?expiration_duration:(expiration_duration_ : iso8601_duration option)
    ~payment_request_approval_strategy:
      (payment_request_approval_strategy_ : payment_request_approval_strategy) () =
  ({
     payment_request_approval_strategy = payment_request_approval_strategy_;
     expiration_duration = expiration_duration_;
   }
    : variable_payment_term_configuration)

let make_variable_payment_term ?type_:(type__ : unversioned_term_type option)
    ?id:(id_ : term_id option) ?currency_code:(currency_code_ : currency_code option)
    ?max_total_charge_amount:(max_total_charge_amount_ : bounded_string option)
    ?configuration:(configuration_ : variable_payment_term_configuration option) () =
  ({
     type_ = type__;
     id = id_;
     currency_code = currency_code_;
     max_total_charge_amount = max_total_charge_amount_;
     configuration = configuration_;
   }
    : variable_payment_term)

let make_grant_item ?dimension_key:(dimension_key_ : bounded_string option)
    ?max_quantity:(max_quantity_ : positive_integer_with_default_value_one option) () =
  ({ dimension_key = dimension_key_; max_quantity = max_quantity_ } : grant_item)

let make_fixed_upfront_pricing_term ?type_:(type__ : unversioned_term_type option)
    ?id:(id_ : term_id option) ?currency_code:(currency_code_ : currency_code option)
    ?duration:(duration_ : bounded_string option) ?price:(price_ : bounded_string option)
    ?grants:(grants_ : grant_list option) () =
  ({
     type_ = type__;
     id = id_;
     currency_code = currency_code_;
     duration = duration_;
     price = price_;
     grants = grants_;
   }
    : fixed_upfront_pricing_term)

let make_free_trial_pricing_term ?type_:(type__ : unversioned_term_type option)
    ?id:(id_ : term_id option) ?duration:(duration_ : bounded_string option)
    ?grants:(grants_ : grant_list option) () =
  ({ type_ = type__; id = id_; duration = duration_; grants = grants_ } : free_trial_pricing_term)

let make_schedule_item ?charge_date:(charge_date_ : timestamp option)
    ?charge_amount:(charge_amount_ : bounded_string option) () =
  ({ charge_date = charge_date_; charge_amount = charge_amount_ } : schedule_item)

let make_payment_schedule_term ?type_:(type__ : unversioned_term_type option)
    ?id:(id_ : term_id option) ?currency_code:(currency_code_ : currency_code option)
    ?schedule:(schedule_ : schedule_list option) () =
  ({ type_ = type__; id = id_; currency_code = currency_code_; schedule = schedule_ }
    : payment_schedule_term)

let make_validity_term ?type_:(type__ : unversioned_term_type option) ?id:(id_ : term_id option)
    ?agreement_duration:(agreement_duration_ : bounded_string option)
    ?agreement_start_date:(agreement_start_date_ : timestamp option)
    ?agreement_end_date:(agreement_end_date_ : timestamp option) () =
  ({
     type_ = type__;
     id = id_;
     agreement_duration = agreement_duration_;
     agreement_start_date = agreement_start_date_;
     agreement_end_date = agreement_end_date_;
   }
    : validity_term)

let make_recurring_payment_term ?type_:(type__ : unversioned_term_type option)
    ?id:(id_ : term_id option) ?currency_code:(currency_code_ : currency_code option)
    ?billing_period:(billing_period_ : bounded_string option)
    ?price:(price_ : bounded_string option) () =
  ({
     type_ = type__;
     id = id_;
     currency_code = currency_code_;
     billing_period = billing_period_;
     price = price_;
   }
    : recurring_payment_term)

let make_byol_pricing_term ?type_:(type__ : unversioned_term_type option) ?id:(id_ : term_id option)
    () =
  ({ type_ = type__; id = id_ } : byol_pricing_term)

let make_dimension ~dimension_key:(dimension_key_ : bounded_string)
    ~dimension_value:(dimension_value_ : zero_value_integer) () =
  ({ dimension_key = dimension_key_; dimension_value = dimension_value_ } : dimension)

let make_configurable_upfront_pricing_term_configuration
    ~selector_value:(selector_value_ : bounded_string) ~dimensions:(dimensions_ : dimension_list) ()
    =
  ({ selector_value = selector_value_; dimensions = dimensions_ }
    : configurable_upfront_pricing_term_configuration)

let make_rate_card_item ?dimension_key:(dimension_key_ : bounded_string option)
    ?price:(price_ : bounded_string option) () =
  ({ dimension_key = dimension_key_; price = price_ } : rate_card_item)

let make_constraints
    ?multiple_dimension_selection:(multiple_dimension_selection_ : bounded_string option)
    ?quantity_configuration:(quantity_configuration_ : bounded_string option) () =
  ({
     multiple_dimension_selection = multiple_dimension_selection_;
     quantity_configuration = quantity_configuration_;
   }
    : constraints)

let make_selector ?type_:(type__ : bounded_string option) ?value:(value_ : bounded_string option) ()
    =
  ({ type_ = type__; value = value_ } : selector)

let make_configurable_upfront_rate_card_item ?selector:(selector_ : selector option)
    ?constraints:(constraints_ : constraints option) ?rate_card:(rate_card_ : rate_card_list option)
    () =
  ({ selector = selector_; constraints = constraints_; rate_card = rate_card_ }
    : configurable_upfront_rate_card_item)

let make_configurable_upfront_pricing_term ?type_:(type__ : unversioned_term_type option)
    ?id:(id_ : term_id option) ?currency_code:(currency_code_ : currency_code option)
    ?rate_cards:(rate_cards_ : configurable_upfront_rate_card_list option)
    ?configuration:(configuration_ : configurable_upfront_pricing_term_configuration option) () =
  ({
     type_ = type__;
     id = id_;
     currency_code = currency_code_;
     rate_cards = rate_cards_;
     configuration = configuration_;
   }
    : configurable_upfront_pricing_term)

let make_usage_based_rate_card_item ?rate_card:(rate_card_ : rate_card_list option) () =
  ({ rate_card = rate_card_ } : usage_based_rate_card_item)

let make_usage_based_pricing_term ?type_:(type__ : unversioned_term_type option)
    ?id:(id_ : term_id option) ?currency_code:(currency_code_ : currency_code option)
    ?rate_cards:(rate_cards_ : usage_based_rate_card_list option) () =
  ({ type_ = type__; id = id_; currency_code = currency_code_; rate_cards = rate_cards_ }
    : usage_based_pricing_term)

let make_renewal_term_configuration ~enable_auto_renew:(enable_auto_renew_ : boolean_) () =
  ({ enable_auto_renew = enable_auto_renew_ } : renewal_term_configuration)

let make_renewal_term ?type_:(type__ : unversioned_term_type option) ?id:(id_ : term_id option)
    ?configuration:(configuration_ : renewal_term_configuration option) () =
  ({ type_ = type__; id = id_; configuration = configuration_ } : renewal_term)

let make_support_term ?type_:(type__ : unversioned_term_type option) ?id:(id_ : term_id option)
    ?refund_policy:(refund_policy_ : bounded_string option) () =
  ({ type_ = type__; id = id_; refund_policy = refund_policy_ } : support_term)

let make_document_item ?type_:(type__ : bounded_string option) ?url:(url_ : bounded_string option)
    ?version:(version_ : bounded_string option) () =
  ({ type_ = type__; url = url_; version = version_ } : document_item)

let make_legal_term ?type_:(type__ : unversioned_term_type option) ?id:(id_ : term_id option)
    ?documents:(documents_ : document_list option) () =
  ({ type_ = type__; id = id_; documents = documents_ } : legal_term)

let make_get_agreement_terms_output ?accepted_terms:(accepted_terms_ : accepted_term_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ accepted_terms = accepted_terms_; next_token = next_token_ } : get_agreement_terms_output)

let make_get_agreement_terms_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~agreement_id:(agreement_id_ : resource_id) () =
  ({ agreement_id = agreement_id_; max_results = max_results_; next_token = next_token_ }
    : get_agreement_terms_input)

let make_get_agreement_payment_request_output
    ?payment_request_id:(payment_request_id_ : payment_request_id option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?status:(status_ : payment_request_status option)
    ?status_message:(status_message_ : payment_request_status_message option)
    ?name:(name_ : payment_request_name option)
    ?description:(description_ : payment_request_description option)
    ?charge_id:(charge_id_ : charge_id option)
    ?charge_amount:(charge_amount_ : positive_amount_upto8_decimals option)
    ?currency_code:(currency_code_ : currency_code option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     payment_request_id = payment_request_id_;
     agreement_id = agreement_id_;
     status = status_;
     status_message = status_message_;
     name = name_;
     description = description_;
     charge_id = charge_id_;
     charge_amount = charge_amount_;
     currency_code = currency_code_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : get_agreement_payment_request_output)

let make_get_agreement_payment_request_input
    ~payment_request_id:(payment_request_id_ : payment_request_id)
    ~agreement_id:(agreement_id_ : agreement_id) () =
  ({ payment_request_id = payment_request_id_; agreement_id = agreement_id_ }
    : get_agreement_payment_request_input)

let make_agreement_entitlement ?resource:(resource_ : resource option)
    ?type_:(type__ : entitlement_type option)
    ?registration_token:(registration_token_ : registration_token option)
    ?status:(status_ : agreement_entitlement_status option)
    ?status_reason_code:(status_reason_code_ : agreement_entitlement_status_reason_code option)
    ?license_arn:(license_arn_ : aws_arn option) () =
  ({
     resource = resource_;
     type_ = type__;
     registration_token = registration_token_;
     status = status_;
     status_reason_code = status_reason_code_;
     license_arn = license_arn_;
   }
    : agreement_entitlement)

let make_get_agreement_entitlements_output
    ?agreement_entitlements:(agreement_entitlements_ : agreement_entitlement_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ agreement_entitlements = agreement_entitlements_; next_token = next_token_ }
    : get_agreement_entitlements_output)

let make_get_agreement_entitlements_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~agreement_id:(agreement_id_ : resource_id) () =
  ({ agreement_id = agreement_id_; max_results = max_results_; next_token = next_token_ }
    : get_agreement_entitlements_input)

let make_get_agreement_cancellation_request_output
    ?agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?reason_code:(reason_code_ : agreement_cancellation_request_reason_code option)
    ?description:(description_ : agreement_cancellation_request_description option)
    ?status:(status_ : agreement_cancellation_request_status option)
    ?status_message:(status_message_ : agreement_cancellation_request_status_message option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option) () =
  ({
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
     agreement_id = agreement_id_;
     reason_code = reason_code_;
     description = description_;
     status = status_;
     status_message = status_message_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : get_agreement_cancellation_request_output)

let make_get_agreement_cancellation_request_input
    ~agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id)
    ~agreement_id:(agreement_id_ : agreement_id) () =
  ({
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
     agreement_id = agreement_id_;
   }
    : get_agreement_cancellation_request_input)

let make_estimated_charges ?currency_code:(currency_code_ : currency_code option)
    ?agreement_value:(agreement_value_ : bounded_string option) () =
  ({ currency_code = currency_code_; agreement_value = agreement_value_ } : estimated_charges)

let make_describe_agreement_output ?agreement_id:(agreement_id_ : resource_id option)
    ?acceptor:(acceptor_ : acceptor option) ?proposer:(proposer_ : proposer option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?acceptance_time:(acceptance_time_ : timestamp option)
    ?agreement_type:(agreement_type_ : agreement_type option)
    ?estimated_charges:(estimated_charges_ : estimated_charges option)
    ?proposal_summary:(proposal_summary_ : proposal_summary option)
    ?status:(status_ : agreement_status option) () =
  ({
     agreement_id = agreement_id_;
     acceptor = acceptor_;
     proposer = proposer_;
     start_time = start_time_;
     end_time = end_time_;
     acceptance_time = acceptance_time_;
     agreement_type = agreement_type_;
     estimated_charges = estimated_charges_;
     proposal_summary = proposal_summary_;
     status = status_;
   }
    : describe_agreement_output)

let make_describe_agreement_input ~agreement_id:(agreement_id_ : resource_id) () =
  ({ agreement_id = agreement_id_ } : describe_agreement_input)

let make_itemized_charge ?dimension_key:(dimension_key_ : bounded_string option)
    ?new_quantity:(new_quantity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?old_quantity:(old_quantity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?charge_reference:(charge_reference_ : resource_id option)
    ?incremental_charge_amount:(incremental_charge_amount_ : bounded_string option) () =
  ({
     dimension_key = dimension_key_;
     new_quantity = new_quantity_;
     old_quantity = old_quantity_;
     charge_reference = charge_reference_;
     incremental_charge_amount = incremental_charge_amount_;
   }
    : itemized_charge)

let make_tax_breakdown_item ?amount:(amount_ : bounded_string option)
    ?rate:(rate_ : bounded_string option) ?type_:(type__ : bounded_string option) () =
  ({ amount = amount_; rate = rate_; type_ = type__ } : tax_breakdown_item)

let make_estimated_taxes ?breakdown:(breakdown_ : tax_breakdown option)
    ?total_amount:(total_amount_ : bounded_string option) () =
  ({ breakdown = breakdown_; total_amount = total_amount_ } : estimated_taxes)

let make_expected_charge ?id:(id_ : resource_id option) ?time:(time_ : timestamp option)
    ?amount:(amount_ : bounded_string option)
    ?amount_after_tax:(amount_after_tax_ : bounded_string option) ?timing:(timing_ : timing option)
    ?estimated_taxes:(estimated_taxes_ : estimated_taxes option) () =
  ({
     id = id_;
     time = time_;
     amount = amount_;
     amount_after_tax = amount_after_tax_;
     timing = timing_;
     estimated_taxes = estimated_taxes_;
   }
    : expected_charge)

let make_charge_summary ?currency_code:(currency_code_ : currency_code option)
    ?new_agreement_value:(new_agreement_value_ : bounded_string option)
    ?new_agreement_value_after_tax:(new_agreement_value_after_tax_ : bounded_string option)
    ?expected_charges:(expected_charges_ : expected_charge_list option)
    ?estimated_taxes:(estimated_taxes_ : estimated_taxes option)
    ?itemized_charges:(itemized_charges_ : itemized_charge_list option)
    ?invoicing_entity:(invoicing_entity_ : invoicing_entity option) () =
  ({
     currency_code = currency_code_;
     new_agreement_value = new_agreement_value_;
     new_agreement_value_after_tax = new_agreement_value_after_tax_;
     expected_charges = expected_charges_;
     estimated_taxes = estimated_taxes_;
     itemized_charges = itemized_charges_;
     invoicing_entity = invoicing_entity_;
   }
    : charge_summary)

let make_create_agreement_request_output
    ?agreement_request_id:(agreement_request_id_ : agreement_request_id option)
    ?charge_summary:(charge_summary_ : charge_summary option) () =
  ({ agreement_request_id = agreement_request_id_; charge_summary = charge_summary_ }
    : create_agreement_request_output)

let make_tax_configuration ?tax_estimation:(tax_estimation_ : tax_estimation option) () =
  ({ tax_estimation = tax_estimation_ } : tax_configuration)

let make_requested_term ?configuration:(configuration_ : requested_term_configuration option)
    ~id:(id_ : term_id) () =
  ({ id = id_; configuration = configuration_ } : requested_term)

let make_create_agreement_request_input ?client_token:(client_token_ : client_token option)
    ?source_agreement_identifier:(source_agreement_identifier_ : resource_id option)
    ?agreement_proposal_identifier:(agreement_proposal_identifier_ : agreement_proposal_id option)
    ?tax_configuration:(tax_configuration_ : tax_configuration option) ~intent:(intent_ : intent)
    ~requested_terms:(requested_terms_ : requested_term_list) () =
  ({
     client_token = client_token_;
     intent = intent_;
     requested_terms = requested_terms_;
     source_agreement_identifier = source_agreement_identifier_;
     agreement_proposal_identifier = agreement_proposal_identifier_;
     tax_configuration = tax_configuration_;
   }
    : create_agreement_request_input)

let make_cancel_agreement_payment_request_output
    ?payment_request_id:(payment_request_id_ : payment_request_id option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?status:(status_ : payment_request_status option) ?name:(name_ : payment_request_name option)
    ?description:(description_ : payment_request_description option)
    ?charge_amount:(charge_amount_ : positive_amount_upto8_decimals option)
    ?currency_code:(currency_code_ : currency_code option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option) () =
  ({
     payment_request_id = payment_request_id_;
     agreement_id = agreement_id_;
     status = status_;
     name = name_;
     description = description_;
     charge_amount = charge_amount_;
     currency_code = currency_code_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : cancel_agreement_payment_request_output)

let make_cancel_agreement_payment_request_input
    ~payment_request_id:(payment_request_id_ : payment_request_id)
    ~agreement_id:(agreement_id_ : agreement_id) () =
  ({ payment_request_id = payment_request_id_; agreement_id = agreement_id_ }
    : cancel_agreement_payment_request_input)

let make_cancel_agreement_cancellation_request_output
    ?agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?reason_code:(reason_code_ : agreement_cancellation_request_reason_code option)
    ?description:(description_ : agreement_cancellation_request_description option)
    ?status:(status_ : agreement_cancellation_request_status option)
    ?status_message:(status_message_ : agreement_cancellation_request_status_message option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option) () =
  ({
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
     agreement_id = agreement_id_;
     reason_code = reason_code_;
     description = description_;
     status = status_;
     status_message = status_message_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : cancel_agreement_cancellation_request_output)

let make_cancel_agreement_cancellation_request_input ~agreement_id:(agreement_id_ : agreement_id)
    ~agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id)
    ~cancellation_reason:(cancellation_reason_ : agreement_cancellation_request_cancellation_reason)
    () =
  ({
     agreement_id = agreement_id_;
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
     cancellation_reason = cancellation_reason_;
   }
    : cancel_agreement_cancellation_request_input)

let make_cancel_agreement_output () = (() : unit)

let make_cancel_agreement_input ~agreement_id:(agreement_id_ : resource_id) () =
  ({ agreement_id = agreement_id_ } : cancel_agreement_input)

let make_batch_create_billing_adjustment_error ~code:(code_ : billing_adjustment_error_code)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~client_token:(client_token_ : client_token) () =
  ({ code = code_; message = message_; client_token = client_token_ }
    : batch_create_billing_adjustment_error)

let make_batch_create_billing_adjustment_item
    ~billing_adjustment_request_id:(billing_adjustment_request_id_ : billing_adjustment_request_id)
    ~client_token:(client_token_ : client_token) () =
  ({ billing_adjustment_request_id = billing_adjustment_request_id_; client_token = client_token_ }
    : batch_create_billing_adjustment_item)

let make_batch_create_billing_adjustment_request_output
    ~items:(items_ : batch_create_billing_adjustment_item_list)
    ~errors:(errors_ : batch_create_billing_adjustment_error_list) () =
  ({ items = items_; errors = errors_ } : batch_create_billing_adjustment_request_output)

let make_batch_create_billing_adjustment_request_entry
    ?description:(description_ : billing_adjustment_description option)
    ~agreement_id:(agreement_id_ : agreement_id)
    ~original_invoice_id:(original_invoice_id_ : invoice_id)
    ~adjustment_amount:(adjustment_amount_ : positive_amount_upto8_decimals)
    ~currency_code:(currency_code_ : currency_code)
    ~adjustment_reason_code:(adjustment_reason_code_ : billing_adjustment_reason_code)
    ~client_token:(client_token_ : client_token) () =
  ({
     agreement_id = agreement_id_;
     original_invoice_id = original_invoice_id_;
     adjustment_amount = adjustment_amount_;
     currency_code = currency_code_;
     adjustment_reason_code = adjustment_reason_code_;
     description = description_;
     client_token = client_token_;
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
  ({ agreement_request_id = agreement_request_id_; purchase_orders = purchase_orders_ }
    : accept_agreement_request_input)

let make_accept_agreement_payment_request_output
    ?payment_request_id:(payment_request_id_ : payment_request_id option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?status:(status_ : payment_request_status option) ?name:(name_ : payment_request_name option)
    ?description:(description_ : payment_request_description option)
    ?charge_amount:(charge_amount_ : positive_amount_upto8_decimals option)
    ?currency_code:(currency_code_ : currency_code option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     payment_request_id = payment_request_id_;
     agreement_id = agreement_id_;
     status = status_;
     name = name_;
     description = description_;
     charge_amount = charge_amount_;
     currency_code = currency_code_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : accept_agreement_payment_request_output)

let make_accept_agreement_payment_request_input
    ?purchase_order_reference:(purchase_order_reference_ : purchase_order_reference option)
    ~payment_request_id:(payment_request_id_ : payment_request_id)
    ~agreement_id:(agreement_id_ : agreement_id) () =
  ({
     payment_request_id = payment_request_id_;
     agreement_id = agreement_id_;
     purchase_order_reference = purchase_order_reference_;
   }
    : accept_agreement_payment_request_input)

let make_accept_agreement_cancellation_request_output
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id option)
    ?status:(status_ : agreement_cancellation_request_status option)
    ?reason_code:(reason_code_ : agreement_cancellation_request_reason_code option)
    ?description:(description_ : agreement_cancellation_request_description option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option) () =
  ({
     agreement_id = agreement_id_;
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
     status = status_;
     reason_code = reason_code_;
     description = description_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : accept_agreement_cancellation_request_output)

let make_accept_agreement_cancellation_request_input ~agreement_id:(agreement_id_ : agreement_id)
    ~agreement_cancellation_request_id:
      (agreement_cancellation_request_id_ : agreement_cancellation_request_id) () =
  ({
     agreement_id = agreement_id_;
     agreement_cancellation_request_id = agreement_cancellation_request_id_;
   }
    : accept_agreement_cancellation_request_input)
