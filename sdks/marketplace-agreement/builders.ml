open Smaws_Lib
open Types
let make_validity_term
  ?agreement_end_date:(agreement_end_date_ : CoreTypes.Timestamp.t option) 
  ?agreement_start_date:(agreement_start_date_ :
                          CoreTypes.Timestamp.t option)
   ?agreement_duration:(agreement_duration_ : string option) 
  ?type_:(type__ : string option)  () =
  ({
     agreement_end_date = agreement_end_date_;
     agreement_start_date = agreement_start_date_;
     agreement_duration = agreement_duration_;
     type_ = type__
   } : validity_term)
let make_validation_exception_field ~message:(message_ : string) 
  ~name:(name_ : string)  () =
  ({ message = message_; name = name_ } : validation_exception_field)
let make_rate_card_item ?price:(price_ : string option) 
  ?dimension_key:(dimension_key_ : string option)  () =
  ({ price = price_; dimension_key = dimension_key_ } : rate_card_item)
let make_usage_based_rate_card_item
  ?rate_card:(rate_card_ : rate_card_item list option)  () =
  ({ rate_card = rate_card_ } : usage_based_rate_card_item)
let make_usage_based_pricing_term
  ?rate_cards:(rate_cards_ : usage_based_rate_card_item list option) 
  ?currency_code:(currency_code_ : string option) 
  ?type_:(type__ : string option)  () =
  ({ rate_cards = rate_cards_; currency_code = currency_code_; type_ = type__
   } : usage_based_pricing_term)
let make_support_term ?refund_policy:(refund_policy_ : string option) 
  ?type_:(type__ : string option)  () =
  ({ refund_policy = refund_policy_; type_ = type__ } : support_term)
let make_sort ?sort_order:(sort_order_ : sort_order option) 
  ?sort_by:(sort_by_ : string option)  () =
  ({ sort_order = sort_order_; sort_by = sort_by_ } : sort)
let make_selector ?value:(value_ : string option) 
  ?type_:(type__ : string option)  () =
  ({ value = value_; type_ = type__ } : selector)
let make_acceptor ?account_id:(account_id_ : string option)  () =
  ({ account_id = account_id_ } : acceptor)
let make_proposer ?account_id:(account_id_ : string option)  () =
  ({ account_id = account_id_ } : proposer)
let make_resource ?type_:(type__ : string option)  ?id:(id_ : string option) 
  () = ({ type_ = type__; id = id_ } : resource)
let make_proposal_summary ?offer_id:(offer_id_ : string option) 
  ?resources:(resources_ : resource list option)  () =
  ({ offer_id = offer_id_; resources = resources_ } : proposal_summary)
let make_agreement_view_summary ?status:(status_ : agreement_status option) 
  ?proposal_summary:(proposal_summary_ : proposal_summary option) 
  ?proposer:(proposer_ : proposer option) 
  ?acceptor:(acceptor_ : acceptor option) 
  ?agreement_type:(agreement_type_ : string option) 
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option) 
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option) 
  ?acceptance_time:(acceptance_time_ : CoreTypes.Timestamp.t option) 
  ?agreement_id:(agreement_id_ : string option)  () =
  ({
     status = status_;
     proposal_summary = proposal_summary_;
     proposer = proposer_;
     acceptor = acceptor_;
     agreement_type = agreement_type_;
     end_time = end_time_;
     start_time = start_time_;
     acceptance_time = acceptance_time_;
     agreement_id = agreement_id_
   } : agreement_view_summary)
let make_search_agreements_output ?next_token:(next_token_ : string option) 
  ?agreement_view_summaries:(agreement_view_summaries_ :
                              agreement_view_summary list option)
   () =
  ({
     next_token = next_token_;
     agreement_view_summaries = agreement_view_summaries_
   } : search_agreements_output)
let make_filter ?values:(values_ : string list option) 
  ?name:(name_ : string option)  () =
  ({ values = values_; name = name_ } : filter)
let make_search_agreements_input ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option)  ?sort:(sort_ : sort option) 
  ?filters:(filters_ : filter list option) 
  ?catalog:(catalog_ : string option)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort = sort_;
     filters = filters_;
     catalog = catalog_
   } : search_agreements_input)
let make_schedule_item ?charge_amount:(charge_amount_ : string option) 
  ?charge_date:(charge_date_ : CoreTypes.Timestamp.t option)  () =
  ({ charge_amount = charge_amount_; charge_date = charge_date_ } : schedule_item)
let make_renewal_term_configuration
  ~enable_auto_renew:(enable_auto_renew_ : bool)  () =
  ({ enable_auto_renew = enable_auto_renew_ } : renewal_term_configuration)
let make_renewal_term
  ?configuration:(configuration_ : renewal_term_configuration option) 
  ?type_:(type__ : string option)  () =
  ({ configuration = configuration_; type_ = type__ } : renewal_term)
let make_recurring_payment_term ?price:(price_ : string option) 
  ?billing_period:(billing_period_ : string option) 
  ?currency_code:(currency_code_ : string option) 
  ?type_:(type__ : string option)  () =
  ({
     price = price_;
     billing_period = billing_period_;
     currency_code = currency_code_;
     type_ = type__
   } : recurring_payment_term)
let make_payment_schedule_term
  ?schedule:(schedule_ : schedule_item list option) 
  ?currency_code:(currency_code_ : string option) 
  ?type_:(type__ : string option)  () =
  ({ schedule = schedule_; currency_code = currency_code_; type_ = type__ } : 
  payment_schedule_term)
let make_document_item ?version:(version_ : string option) 
  ?url:(url_ : string option)  ?type_:(type__ : string option)  () =
  ({ version = version_; url = url_; type_ = type__ } : document_item)
let make_legal_term ?documents:(documents_ : document_item list option) 
  ?type_:(type__ : string option)  () =
  ({ documents = documents_; type_ = type__ } : legal_term)
let make_grant_item ?max_quantity:(max_quantity_ : int option) 
  ?dimension_key:(dimension_key_ : string option)  () =
  ({ max_quantity = max_quantity_; dimension_key = dimension_key_ } : 
  grant_item)
let make_constraints
  ?quantity_configuration:(quantity_configuration_ : string option) 
  ?multiple_dimension_selection:(multiple_dimension_selection_ :
                                  string option)
   () =
  ({
     quantity_configuration = quantity_configuration_;
     multiple_dimension_selection = multiple_dimension_selection_
   } : constraints)
let make_configurable_upfront_rate_card_item
  ?rate_card:(rate_card_ : rate_card_item list option) 
  ?constraints:(constraints_ : constraints option) 
  ?selector:(selector_ : selector option)  () =
  ({ rate_card = rate_card_; constraints = constraints_; selector = selector_
   } : configurable_upfront_rate_card_item)
let make_dimension ~dimension_value:(dimension_value_ : int) 
  ~dimension_key:(dimension_key_ : string)  () =
  ({ dimension_value = dimension_value_; dimension_key = dimension_key_ } : 
  dimension)
let make_configurable_upfront_pricing_term_configuration
  ~dimensions:(dimensions_ : dimension list) 
  ~selector_value:(selector_value_ : string)  () =
  ({ dimensions = dimensions_; selector_value = selector_value_ } : configurable_upfront_pricing_term_configuration)
let make_configurable_upfront_pricing_term
  ?configuration:(configuration_ :
                   configurable_upfront_pricing_term_configuration option)
   ?rate_cards:(rate_cards_ :
                 configurable_upfront_rate_card_item list option)
   ?currency_code:(currency_code_ : string option) 
  ?type_:(type__ : string option)  () =
  ({
     configuration = configuration_;
     rate_cards = rate_cards_;
     currency_code = currency_code_;
     type_ = type__
   } : configurable_upfront_pricing_term)
let make_byol_pricing_term ?type_:(type__ : string option)  () =
  ({ type_ = type__ } : byol_pricing_term)
let make_free_trial_pricing_term ?grants:(grants_ : grant_item list option) 
  ?duration:(duration_ : string option)  ?type_:(type__ : string option)  ()
  =
  ({ grants = grants_; duration = duration_; type_ = type__ } : free_trial_pricing_term)
let make_fixed_upfront_pricing_term
  ?grants:(grants_ : grant_item list option)  ?price:(price_ : string option)
   ?duration:(duration_ : string option) 
  ?currency_code:(currency_code_ : string option) 
  ?type_:(type__ : string option)  () =
  ({
     grants = grants_;
     price = price_;
     duration = duration_;
     currency_code = currency_code_;
     type_ = type__
   } : fixed_upfront_pricing_term)
let make_get_agreement_terms_output ?next_token:(next_token_ : string option)
   ?accepted_terms:(accepted_terms_ : accepted_term list option)  () =
  ({ next_token = next_token_; accepted_terms = accepted_terms_ } : get_agreement_terms_output)
let make_get_agreement_terms_input ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ~agreement_id:(agreement_id_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     agreement_id = agreement_id_
   } : get_agreement_terms_input)
let make_estimated_charges
  ?agreement_value:(agreement_value_ : string option) 
  ?currency_code:(currency_code_ : string option)  () =
  ({ agreement_value = agreement_value_; currency_code = currency_code_ } : 
  estimated_charges)
let make_describe_agreement_output
  ?status:(status_ : agreement_status option) 
  ?proposal_summary:(proposal_summary_ : proposal_summary option) 
  ?estimated_charges:(estimated_charges_ : estimated_charges option) 
  ?agreement_type:(agreement_type_ : string option) 
  ?acceptance_time:(acceptance_time_ : CoreTypes.Timestamp.t option) 
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option) 
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option) 
  ?proposer:(proposer_ : proposer option) 
  ?acceptor:(acceptor_ : acceptor option) 
  ?agreement_id:(agreement_id_ : string option)  () =
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
     agreement_id = agreement_id_
   } : describe_agreement_output)
let make_describe_agreement_input ~agreement_id:(agreement_id_ : string)  ()
  = ({ agreement_id = agreement_id_ } : describe_agreement_input)