open Types

val make_variable_payment_term_configuration :
  ?expiration_duration:iso8601_duration ->
  payment_request_approval_strategy:payment_request_approval_strategy ->
  unit ->
  variable_payment_term_configuration

val make_variable_payment_term :
  ?configuration:variable_payment_term_configuration ->
  ?max_total_charge_amount:bounded_string ->
  ?currency_code:currency_code ->
  ?id:term_id ->
  ?type_:unversioned_term_type ->
  unit ->
  variable_payment_term

val make_validity_term :
  ?agreement_end_date:timestamp ->
  ?agreement_start_date:timestamp ->
  ?agreement_duration:bounded_string ->
  ?id:term_id ->
  ?type_:unversioned_term_type ->
  unit ->
  validity_term

val make_validation_exception_field :
  message:bounded_string -> name:bounded_string -> unit -> validation_exception_field

val make_rate_card_item :
  ?price:bounded_string -> ?dimension_key:bounded_string -> unit -> rate_card_item

val make_usage_based_rate_card_item :
  ?rate_card:rate_card_list -> unit -> usage_based_rate_card_item

val make_usage_based_pricing_term :
  ?rate_cards:usage_based_rate_card_list ->
  ?currency_code:currency_code ->
  ?id:term_id ->
  ?type_:unversioned_term_type ->
  unit ->
  usage_based_pricing_term

val make_update_purchase_orders_output : unit -> unit

val make_purchase_order :
  ?purchase_order_reference:purchase_order_reference ->
  ?agreement_id:resource_id ->
  ?charge_revision:charge_revision ->
  charge_id:resource_id ->
  unit ->
  purchase_order

val make_update_purchase_orders_input :
  purchase_orders:purchase_orders -> unit -> update_purchase_orders_input

val make_tax_configuration : ?tax_estimation:tax_estimation -> unit -> tax_configuration

val make_tax_breakdown_item :
  ?type_:bounded_string ->
  ?rate:bounded_string ->
  ?amount:bounded_string ->
  unit ->
  tax_breakdown_item

val make_support_term :
  ?refund_policy:bounded_string ->
  ?id:term_id ->
  ?type_:unversioned_term_type ->
  unit ->
  support_term

val make_sort : ?sort_order:sort_order -> ?sort_by:sort_by -> unit -> sort

val make_send_agreement_payment_request_output :
  ?created_at:timestamp ->
  ?currency_code:currency_code ->
  ?charge_amount:positive_amount_upto8_decimals ->
  ?description:payment_request_description ->
  ?name:payment_request_name ->
  ?status:payment_request_status ->
  ?agreement_id:agreement_id ->
  ?payment_request_id:payment_request_id ->
  unit ->
  send_agreement_payment_request_output

val make_send_agreement_payment_request_input :
  ?description:payment_request_description ->
  ?client_token:client_token ->
  charge_amount:positive_amount_upto8_decimals ->
  name:payment_request_name ->
  term_id:term_id ->
  agreement_id:agreement_id ->
  unit ->
  send_agreement_payment_request_input

val make_send_agreement_cancellation_request_output :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?description:agreement_cancellation_request_description ->
  ?reason_code:agreement_cancellation_request_reason_code ->
  ?status:agreement_cancellation_request_status ->
  ?agreement_cancellation_request_id:agreement_cancellation_request_id ->
  ?agreement_id:agreement_id ->
  unit ->
  send_agreement_cancellation_request_output

val make_send_agreement_cancellation_request_input :
  ?description:agreement_cancellation_request_description ->
  ?client_token:client_token ->
  reason_code:agreement_cancellation_request_reason_code ->
  agreement_id:agreement_id ->
  unit ->
  send_agreement_cancellation_request_input

val make_selector : ?value:bounded_string -> ?type_:bounded_string -> unit -> selector
val make_acceptor : ?account_id:aws_account_id -> unit -> acceptor
val make_proposer : ?account_id:aws_account_id -> unit -> proposer
val make_resource : ?type_:agreement_resource_type -> ?id:resource_id -> unit -> resource

val make_proposal_summary :
  ?offer_set_id:offer_set_id ->
  ?offer_id:offer_id ->
  ?resources:resources ->
  unit ->
  proposal_summary

val make_entitlement : ?license_arn:Smaws_Lib.Smithy_api.Types.string_ -> unit -> entitlement

val make_agreement_view_summary :
  ?entitlements:entitlement_list ->
  ?status:agreement_status ->
  ?proposal_summary:proposal_summary ->
  ?proposer:proposer ->
  ?acceptor:acceptor ->
  ?agreement_type:agreement_type ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?acceptance_time:timestamp ->
  ?agreement_id:resource_id ->
  unit ->
  agreement_view_summary

val make_search_agreements_output :
  ?next_token:next_token ->
  ?agreement_view_summaries:agreement_view_summary_list ->
  unit ->
  search_agreements_output

val make_filter : ?values:filter_value_list -> ?name:filter_name -> unit -> filter

val make_search_agreements_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?sort:sort ->
  ?filters:filter_list ->
  ?catalog:catalog ->
  unit ->
  search_agreements_input

val make_schedule_item :
  ?charge_amount:bounded_string -> ?charge_date:timestamp -> unit -> schedule_item

val make_dimension :
  dimension_value:zero_value_integer -> dimension_key:bounded_string -> unit -> dimension

val make_configurable_upfront_pricing_term_configuration :
  dimensions:dimension_list ->
  selector_value:bounded_string ->
  unit ->
  configurable_upfront_pricing_term_configuration

val make_renewal_term_configuration :
  enable_auto_renew:boolean_ -> unit -> renewal_term_configuration

val make_requested_term :
  ?configuration:requested_term_configuration -> id:term_id -> unit -> requested_term

val make_renewal_term :
  ?configuration:renewal_term_configuration ->
  ?id:term_id ->
  ?type_:unversioned_term_type ->
  unit ->
  renewal_term

val make_reject_agreement_payment_request_output :
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?currency_code:currency_code ->
  ?charge_amount:positive_amount_upto8_decimals ->
  ?description:payment_request_description ->
  ?name:payment_request_name ->
  ?status_message:payment_request_status_message ->
  ?status:payment_request_status ->
  ?agreement_id:agreement_id ->
  ?payment_request_id:payment_request_id ->
  unit ->
  reject_agreement_payment_request_output

val make_reject_agreement_payment_request_input :
  ?rejection_reason:payment_request_rejection_reason ->
  agreement_id:agreement_id ->
  payment_request_id:payment_request_id ->
  unit ->
  reject_agreement_payment_request_input

val make_reject_agreement_cancellation_request_output :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?description:agreement_cancellation_request_description ->
  ?reason_code:agreement_cancellation_request_reason_code ->
  ?status_message:agreement_cancellation_request_status_message ->
  ?status:agreement_cancellation_request_status ->
  ?agreement_cancellation_request_id:agreement_cancellation_request_id ->
  ?agreement_id:agreement_id ->
  unit ->
  reject_agreement_cancellation_request_output

val make_reject_agreement_cancellation_request_input :
  rejection_reason:agreement_cancellation_request_rejection_reason ->
  agreement_cancellation_request_id:agreement_cancellation_request_id ->
  agreement_id:agreement_id ->
  unit ->
  reject_agreement_cancellation_request_input

val make_recurring_payment_term :
  ?price:bounded_string ->
  ?billing_period:bounded_string ->
  ?currency_code:currency_code ->
  ?id:term_id ->
  ?type_:unversioned_term_type ->
  unit ->
  recurring_payment_term

val make_pricing_currency_amount :
  ?currency_code:currency_code ->
  ?max_adjustment_amount:bounded_string ->
  ?amount:bounded_string ->
  unit ->
  pricing_currency_amount

val make_payment_schedule_term :
  ?schedule:schedule_list ->
  ?currency_code:currency_code ->
  ?id:term_id ->
  ?type_:unversioned_term_type ->
  unit ->
  payment_schedule_term

val make_payment_request_summary :
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?currency_code:currency_code ->
  ?charge_amount:positive_amount_upto8_decimals ->
  ?charge_id:charge_id ->
  ?name:payment_request_name ->
  ?status:payment_request_status ->
  ?agreement_id:agreement_id ->
  ?payment_request_id:payment_request_id ->
  unit ->
  payment_request_summary

val make_billing_adjustment_summary :
  catalog:catalog ->
  agreement_type:agreement_type ->
  updated_at:timestamp ->
  created_at:timestamp ->
  agreement_id:agreement_id ->
  status:billing_adjustment_status ->
  currency_code:currency_code ->
  adjustment_amount:positive_amount_upto8_decimals ->
  original_invoice_id:invoice_id ->
  billing_adjustment_request_id:billing_adjustment_request_id ->
  unit ->
  billing_adjustment_summary

val make_list_billing_adjustment_requests_output :
  ?next_token:next_token ->
  items:billing_adjustment_summary_list ->
  unit ->
  list_billing_adjustment_requests_output

val make_list_billing_adjustment_requests_input :
  ?next_token:next_token ->
  ?agreement_type:agreement_type ->
  ?catalog:catalog ->
  ?max_results:max_results ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  ?status:billing_adjustment_status ->
  ?agreement_id:agreement_id ->
  unit ->
  list_billing_adjustment_requests_input

val make_list_agreement_payment_requests_output :
  ?next_token:next_token ->
  items:payment_request_summary_list ->
  unit ->
  list_agreement_payment_requests_output

val make_list_agreement_payment_requests_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?status:payment_request_status ->
  ?agreement_id:agreement_id ->
  ?catalog:catalog ->
  ?agreement_type:agreement_type ->
  party_type:party_type ->
  unit ->
  list_agreement_payment_requests_input

val make_invoice_billing_period :
  year:Smaws_Lib.Smithy_api.Types.integer ->
  month:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  invoice_billing_period

val make_invoicing_entity :
  ?branch_name:bounded_string -> ?legal_name:bounded_string -> unit -> invoicing_entity

val make_agreement_invoice_line_item_group_summary :
  ?invoicing_entity:invoicing_entity ->
  ?invoice_type:invoice_type ->
  ?issued_time:timestamp ->
  ?invoice_billing_period:invoice_billing_period ->
  ?pricing_currency_amount:pricing_currency_amount ->
  ?invoice_id:resource_id ->
  ?agreement_id:resource_id ->
  unit ->
  agreement_invoice_line_item_group_summary

val make_list_agreement_invoice_line_items_output :
  ?next_token:next_token ->
  ?agreement_invoice_line_item_group_summaries:agreement_invoice_line_item_group_summaries ->
  unit ->
  list_agreement_invoice_line_items_output

val make_list_agreement_invoice_line_items_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?after_issued_time:timestamp ->
  ?before_issued_time:timestamp ->
  ?invoice_billing_period:invoice_billing_period ->
  ?invoice_type:invoice_type ->
  ?invoice_id:resource_id ->
  group_by:line_item_group_by ->
  agreement_id:resource_id ->
  unit ->
  list_agreement_invoice_line_items_input

val make_charge :
  ?time:timestamp ->
  ?amount:bounded_string ->
  ?currency_code:currency_code ->
  ?purchase_order_reference:purchase_order_reference ->
  ?agreement_type:agreement_type ->
  ?agreement_id:resource_id ->
  ?revision:charge_revision ->
  ?id:resource_id ->
  unit ->
  charge

val make_list_agreement_charges_output :
  ?next_token:next_token -> ?items:charges -> unit -> list_agreement_charges_output

val make_list_agreement_charges_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?agreement_type:agreement_type ->
  ?agreement_id:resource_id ->
  ?catalog:catalog ->
  unit ->
  list_agreement_charges_input

val make_agreement_cancellation_request_summary :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?catalog:catalog ->
  ?agreement_type:agreement_type ->
  ?reason_code:agreement_cancellation_request_reason_code ->
  ?status:agreement_cancellation_request_status ->
  ?agreement_id:agreement_id ->
  ?agreement_cancellation_request_id:agreement_cancellation_request_id ->
  unit ->
  agreement_cancellation_request_summary

val make_list_agreement_cancellation_requests_output :
  ?items:agreement_cancellation_request_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_agreement_cancellation_requests_output

val make_list_agreement_cancellation_requests_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?catalog:catalog ->
  ?agreement_type:agreement_type ->
  ?status:agreement_cancellation_request_status ->
  ?agreement_id:agreement_id ->
  party_type:party_type ->
  unit ->
  list_agreement_cancellation_requests_input

val make_document_item :
  ?version:bounded_string -> ?url:bounded_string -> ?type_:bounded_string -> unit -> document_item

val make_legal_term :
  ?documents:document_list -> ?id:term_id -> ?type_:unversioned_term_type -> unit -> legal_term

val make_itemized_charge :
  ?incremental_charge_amount:bounded_string ->
  ?charge_reference:resource_id ->
  ?old_quantity:Smaws_Lib.Smithy_api.Types.integer ->
  ?new_quantity:Smaws_Lib.Smithy_api.Types.integer ->
  ?dimension_key:bounded_string ->
  unit ->
  itemized_charge

val make_grant_item :
  ?max_quantity:positive_integer_with_default_value_one ->
  ?dimension_key:bounded_string ->
  unit ->
  grant_item

val make_get_billing_adjustment_request_output :
  ?status_message:billing_adjustment_status_message ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  updated_at:timestamp ->
  created_at:timestamp ->
  status:billing_adjustment_status ->
  currency_code:currency_code ->
  adjustment_amount:positive_amount_upto8_decimals ->
  original_invoice_id:invoice_id ->
  adjustment_reason_code:billing_adjustment_reason_code ->
  agreement_id:agreement_id ->
  billing_adjustment_request_id:billing_adjustment_request_id ->
  unit ->
  get_billing_adjustment_request_output

val make_get_billing_adjustment_request_input :
  billing_adjustment_request_id:billing_adjustment_request_id ->
  agreement_id:agreement_id ->
  unit ->
  get_billing_adjustment_request_input

val make_constraints :
  ?quantity_configuration:bounded_string ->
  ?multiple_dimension_selection:bounded_string ->
  unit ->
  constraints

val make_configurable_upfront_rate_card_item :
  ?rate_card:rate_card_list ->
  ?constraints:constraints ->
  ?selector:selector ->
  unit ->
  configurable_upfront_rate_card_item

val make_configurable_upfront_pricing_term :
  ?configuration:configurable_upfront_pricing_term_configuration ->
  ?rate_cards:configurable_upfront_rate_card_list ->
  ?currency_code:currency_code ->
  ?id:term_id ->
  ?type_:unversioned_term_type ->
  unit ->
  configurable_upfront_pricing_term

val make_byol_pricing_term :
  ?id:term_id -> ?type_:unversioned_term_type -> unit -> byol_pricing_term

val make_free_trial_pricing_term :
  ?grants:grant_list ->
  ?duration:bounded_string ->
  ?id:term_id ->
  ?type_:unversioned_term_type ->
  unit ->
  free_trial_pricing_term

val make_fixed_upfront_pricing_term :
  ?grants:grant_list ->
  ?price:bounded_string ->
  ?duration:bounded_string ->
  ?currency_code:currency_code ->
  ?id:term_id ->
  ?type_:unversioned_term_type ->
  unit ->
  fixed_upfront_pricing_term

val make_get_agreement_terms_output :
  ?next_token:next_token -> ?accepted_terms:accepted_term_list -> unit -> get_agreement_terms_output

val make_get_agreement_terms_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  agreement_id:resource_id ->
  unit ->
  get_agreement_terms_input

val make_get_agreement_payment_request_output :
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?currency_code:currency_code ->
  ?charge_amount:positive_amount_upto8_decimals ->
  ?charge_id:charge_id ->
  ?description:payment_request_description ->
  ?name:payment_request_name ->
  ?status_message:payment_request_status_message ->
  ?status:payment_request_status ->
  ?agreement_id:agreement_id ->
  ?payment_request_id:payment_request_id ->
  unit ->
  get_agreement_payment_request_output

val make_get_agreement_payment_request_input :
  agreement_id:agreement_id ->
  payment_request_id:payment_request_id ->
  unit ->
  get_agreement_payment_request_input

val make_agreement_entitlement :
  ?license_arn:aws_arn ->
  ?status_reason_code:agreement_entitlement_status_reason_code ->
  ?status:agreement_entitlement_status ->
  ?registration_token:registration_token ->
  ?type_:entitlement_type ->
  ?resource:resource ->
  unit ->
  agreement_entitlement

val make_get_agreement_entitlements_output :
  ?next_token:next_token ->
  ?agreement_entitlements:agreement_entitlement_list ->
  unit ->
  get_agreement_entitlements_output

val make_get_agreement_entitlements_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  agreement_id:resource_id ->
  unit ->
  get_agreement_entitlements_input

val make_get_agreement_cancellation_request_output :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?status_message:agreement_cancellation_request_status_message ->
  ?status:agreement_cancellation_request_status ->
  ?description:agreement_cancellation_request_description ->
  ?reason_code:agreement_cancellation_request_reason_code ->
  ?agreement_id:agreement_id ->
  ?agreement_cancellation_request_id:agreement_cancellation_request_id ->
  unit ->
  get_agreement_cancellation_request_output

val make_get_agreement_cancellation_request_input :
  agreement_id:agreement_id ->
  agreement_cancellation_request_id:agreement_cancellation_request_id ->
  unit ->
  get_agreement_cancellation_request_input

val make_estimated_taxes :
  ?total_amount:bounded_string -> ?breakdown:tax_breakdown -> unit -> estimated_taxes

val make_expected_charge :
  ?estimated_taxes:estimated_taxes ->
  ?timing:timing ->
  ?amount_after_tax:bounded_string ->
  ?amount:bounded_string ->
  ?time:timestamp ->
  ?id:resource_id ->
  unit ->
  expected_charge

val make_estimated_charges :
  ?agreement_value:bounded_string -> ?currency_code:currency_code -> unit -> estimated_charges

val make_describe_agreement_output :
  ?status:agreement_status ->
  ?proposal_summary:proposal_summary ->
  ?estimated_charges:estimated_charges ->
  ?agreement_type:agreement_type ->
  ?acceptance_time:timestamp ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?proposer:proposer ->
  ?acceptor:acceptor ->
  ?agreement_id:resource_id ->
  unit ->
  describe_agreement_output

val make_describe_agreement_input : agreement_id:resource_id -> unit -> describe_agreement_input

val make_charge_summary :
  ?invoicing_entity:invoicing_entity ->
  ?itemized_charges:itemized_charge_list ->
  ?estimated_taxes:estimated_taxes ->
  ?expected_charges:expected_charge_list ->
  ?new_agreement_value_after_tax:bounded_string ->
  ?new_agreement_value:bounded_string ->
  ?currency_code:currency_code ->
  unit ->
  charge_summary

val make_create_agreement_request_output :
  ?charge_summary:charge_summary ->
  ?agreement_request_id:agreement_request_id ->
  unit ->
  create_agreement_request_output

val make_create_agreement_request_input :
  ?tax_configuration:tax_configuration ->
  ?agreement_proposal_identifier:agreement_proposal_id ->
  ?source_agreement_identifier:resource_id ->
  ?client_token:client_token ->
  requested_terms:requested_term_list ->
  intent:intent ->
  unit ->
  create_agreement_request_input

val make_cancel_agreement_payment_request_output :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?currency_code:currency_code ->
  ?charge_amount:positive_amount_upto8_decimals ->
  ?description:payment_request_description ->
  ?name:payment_request_name ->
  ?status:payment_request_status ->
  ?agreement_id:agreement_id ->
  ?payment_request_id:payment_request_id ->
  unit ->
  cancel_agreement_payment_request_output

val make_cancel_agreement_payment_request_input :
  agreement_id:agreement_id ->
  payment_request_id:payment_request_id ->
  unit ->
  cancel_agreement_payment_request_input

val make_cancel_agreement_output : unit -> unit
val make_cancel_agreement_input : agreement_id:resource_id -> unit -> cancel_agreement_input

val make_cancel_agreement_cancellation_request_output :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?status_message:agreement_cancellation_request_status_message ->
  ?status:agreement_cancellation_request_status ->
  ?description:agreement_cancellation_request_description ->
  ?reason_code:agreement_cancellation_request_reason_code ->
  ?agreement_id:agreement_id ->
  ?agreement_cancellation_request_id:agreement_cancellation_request_id ->
  unit ->
  cancel_agreement_cancellation_request_output

val make_cancel_agreement_cancellation_request_input :
  cancellation_reason:agreement_cancellation_request_cancellation_reason ->
  agreement_cancellation_request_id:agreement_cancellation_request_id ->
  agreement_id:agreement_id ->
  unit ->
  cancel_agreement_cancellation_request_input

val make_batch_create_billing_adjustment_item :
  client_token:client_token ->
  billing_adjustment_request_id:billing_adjustment_request_id ->
  unit ->
  batch_create_billing_adjustment_item

val make_batch_create_billing_adjustment_error :
  client_token:client_token ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  code:billing_adjustment_error_code ->
  unit ->
  batch_create_billing_adjustment_error

val make_batch_create_billing_adjustment_request_output :
  errors:batch_create_billing_adjustment_error_list ->
  items:batch_create_billing_adjustment_item_list ->
  unit ->
  batch_create_billing_adjustment_request_output

val make_batch_create_billing_adjustment_request_entry :
  ?description:billing_adjustment_description ->
  client_token:client_token ->
  adjustment_reason_code:billing_adjustment_reason_code ->
  currency_code:currency_code ->
  adjustment_amount:positive_amount_upto8_decimals ->
  original_invoice_id:invoice_id ->
  agreement_id:agreement_id ->
  unit ->
  batch_create_billing_adjustment_request_entry

val make_batch_create_billing_adjustment_request_input :
  billing_adjustment_request_entries:batch_create_billing_adjustment_request_entry_list ->
  unit ->
  batch_create_billing_adjustment_request_input

val make_accept_agreement_request_output :
  ?agreement_id:resource_id -> unit -> accept_agreement_request_output

val make_accept_agreement_request_input :
  ?purchase_orders:purchase_orders ->
  agreement_request_id:agreement_request_id ->
  unit ->
  accept_agreement_request_input

val make_accept_agreement_payment_request_output :
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?currency_code:currency_code ->
  ?charge_amount:positive_amount_upto8_decimals ->
  ?description:payment_request_description ->
  ?name:payment_request_name ->
  ?status:payment_request_status ->
  ?agreement_id:agreement_id ->
  ?payment_request_id:payment_request_id ->
  unit ->
  accept_agreement_payment_request_output

val make_accept_agreement_payment_request_input :
  ?purchase_order_reference:purchase_order_reference ->
  agreement_id:agreement_id ->
  payment_request_id:payment_request_id ->
  unit ->
  accept_agreement_payment_request_input

val make_accept_agreement_cancellation_request_output :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?description:agreement_cancellation_request_description ->
  ?reason_code:agreement_cancellation_request_reason_code ->
  ?status:agreement_cancellation_request_status ->
  ?agreement_cancellation_request_id:agreement_cancellation_request_id ->
  ?agreement_id:agreement_id ->
  unit ->
  accept_agreement_cancellation_request_output

val make_accept_agreement_cancellation_request_input :
  agreement_cancellation_request_id:agreement_cancellation_request_id ->
  agreement_id:agreement_id ->
  unit ->
  accept_agreement_cancellation_request_input
