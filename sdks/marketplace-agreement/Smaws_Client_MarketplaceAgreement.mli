(** Marketplace Agreement client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module AcceptAgreementCancellationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_agreement_cancellation_request_input ->
    ( accept_agreement_cancellation_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_agreement_cancellation_request_input ->
    ( accept_agreement_cancellation_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Allows buyers (acceptors) to accept a cancellation request that is in [PENDING_APPROVAL] \
   status. Once accepted, the cancellation request transitions to [APPROVED] status and the \
   agreement cancellation will be processed.\n\n\
  \  Only cancellation requests in [PENDING_APPROVAL] status can be accepted. A \
   [ConflictException] is thrown if the cancellation request is in any other status.\n\
  \  \n\
  \   "]

module AcceptAgreementPaymentRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_agreement_payment_request_input ->
    ( accept_agreement_payment_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_agreement_payment_request_input ->
    ( accept_agreement_payment_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Allows buyers (acceptors) to accept a payment request that is in [PENDING_APPROVAL] status. \
   Once accepted, the payment request transitions to [APPROVED] status and the charge will be \
   processed. Buyers can optionally provide a purchase order reference for their internal \
   tracking.\n\n\
  \  Only payment requests in [PENDING_APPROVAL] status can be accepted. A [ConflictException] is \
   thrown if the payment request is in any other status.\n\
  \  \n\
  \   "]

module AcceptAgreementRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_agreement_request_input ->
    ( accept_agreement_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_agreement_request_input ->
    ( accept_agreement_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Accepts an agreement request to finalize the agreement. The acceptor can optionally provide \
   purchase orders to associate with the agreement charges.\n"]

module BatchCreateBillingAdjustmentRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_create_billing_adjustment_request_input ->
    ( batch_create_billing_adjustment_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_create_billing_adjustment_request_input ->
    ( batch_create_billing_adjustment_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Allows sellers (proposers) to submit billing adjustment requests for one or more invoices \
   within an agreement. Each entry in the batch specifies an invoice and the adjustment amount. \
   The operation returns successfully created adjustment request IDs and any errors for entries \
   that failed to process.\n\n\
  \  Each entry requires a unique [clientToken] for idempotency.\n\
  \  \n\
  \   "]

module CancelAgreement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_agreement_input ->
    ( cancel_agreement_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_agreement_input ->
    ( cancel_agreement_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Allows an acceptor to cancel an active agreement. Not all agreements are eligible for \
   cancellation. Use the error response to determine why a cancellation request was rejected.\n"]

module CancelAgreementCancellationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_agreement_cancellation_request_input ->
    ( cancel_agreement_cancellation_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_agreement_cancellation_request_input ->
    ( cancel_agreement_cancellation_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Allows sellers (proposers) to withdraw an existing agreement cancellation request that is in a \
   pending state. Once cancelled, the cancellation request transitions to [CANCELLED] status and \
   can no longer be approved or rejected by the buyer.\n\n\
  \  Only cancellation requests in [PENDING_APPROVAL] status can be cancelled. A \
   [ConflictException] is thrown if the cancellation request is in any other status.\n\
  \  \n\
  \   "]

module CancelAgreementPaymentRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_agreement_payment_request_input ->
    ( cancel_agreement_payment_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_agreement_payment_request_input ->
    ( cancel_agreement_payment_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Allows sellers (proposers) to cancel a payment request that is in [PENDING_APPROVAL] status. \
   Once cancelled, the payment request transitions to [CANCELLED] status and can no longer be \
   accepted or rejected by the buyer.\n\n\
  \  Only payment requests in [PENDING_APPROVAL] status can be cancelled. A [ConflictException] is \
   thrown if the payment request is in any other status.\n\
  \  \n\
  \   "]

module CreateAgreementRequest : sig
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
    create_agreement_request_input ->
    ( create_agreement_request_output,
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
    create_agreement_request_input ->
    ( create_agreement_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Creates an agreement request that acts as a quote for the terms you want to accept. The \
   agreement request captures the requested terms, calculates charges, and returns a summary. Use \
   [AcceptAgreementRequest] with the returned [agreementRequestId] to finalize the agreement.\n"]

module DescribeAgreement : sig
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
    describe_agreement_input ->
    ( describe_agreement_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_agreement_input ->
    ( describe_agreement_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Provides details about an agreement, such as the proposer, acceptor, start date, and end date.\n"]

module GetAgreementCancellationRequest : sig
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
    get_agreement_cancellation_request_input ->
    ( get_agreement_cancellation_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_agreement_cancellation_request_input ->
    ( get_agreement_cancellation_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about a specific agreement cancellation request. Both sellers \
   (proposers) and buyers (acceptors) can use this operation to view cancellation requests \
   associated with their agreements.\n"]

module GetAgreementEntitlements : sig
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
    get_agreement_entitlements_input ->
    ( get_agreement_entitlements_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_agreement_entitlements_input ->
    ( get_agreement_entitlements_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Obtains details about the entitlements of an agreement.\n"]

module GetAgreementPaymentRequest : sig
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
    get_agreement_payment_request_input ->
    ( get_agreement_payment_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_agreement_payment_request_input ->
    ( get_agreement_payment_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about a specific payment request. Both sellers (proposers) and \
   buyers (acceptors) can use this operation to view payment requests associated with their \
   agreements. The response includes the current status, charge details, timestamps, and the \
   charge ID if the request has been approved.\n\n\
  \  The calling identity must be either the acceptor or proposer of the payment request. A \
   [ResourceNotFoundException] is returned if the payment request does not exist.\n\
  \  \n\
  \   "]

module GetAgreementTerms : sig
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
    get_agreement_terms_input ->
    ( get_agreement_terms_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_agreement_terms_input ->
    ( get_agreement_terms_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Obtains details about the terms in an agreement that you participated in as proposer or \
   acceptor.\n\n\
  \ The details include:\n\
  \ \n\
  \  {ul\n\
  \        {-   [TermType] \226\128\147 The type of term, such as [LegalTerm], [RenewalTerm], or \
   [ConfigurableUpfrontPricingTerm].\n\
  \            \n\
  \             }\n\
  \        {-   [TermID] \226\128\147 The ID of the particular term, which is common between offer \
   and agreement.\n\
  \            \n\
  \             }\n\
  \        {-   [TermPayload] \226\128\147 The key information contained in the term, such as the \
   EULA for [LegalTerm] or pricing and dimensions for various pricing terms, such as \
   [ConfigurableUpfrontPricingTerm] or [UsageBasedPricingTerm].\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   {ul\n\
  \         {-   [Configuration] \226\128\147 The buyer/acceptor's selection at the time of \
   agreement creation, such as the number of units purchased for a dimension or setting the \
   [EnableAutoRenew] flag.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module GetBillingAdjustmentRequest : sig
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
    get_billing_adjustment_request_input ->
    ( get_billing_adjustment_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_billing_adjustment_request_input ->
    ( get_billing_adjustment_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about a specific billing adjustment request. Sellers (proposers) \
   can use this operation to view the status and details of a billing adjustment request they \
   submitted.\n"]

module ListAgreementCancellationRequests : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_agreement_cancellation_requests_input ->
    ( list_agreement_cancellation_requests_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_agreement_cancellation_requests_input ->
    ( list_agreement_cancellation_requests_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Lists agreement cancellation requests available to you as a seller or buyer. Both sellers \
   (proposers) and buyers (acceptors) can use this operation to find cancellation requests by \
   specifying their party type and applying optional filters.\n\n\
  \   [PartyType] is a required parameter. A [ValidationException] is returned if [PartyType] is \
   not provided.\n\
  \  \n\
  \   "]

module ListAgreementCharges : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_agreement_charges_input ->
    ( list_agreement_charges_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_agreement_charges_input ->
    ( list_agreement_charges_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Allows acceptors to view charges and purchase orders that are associated with an agreement. The \
   response includes details about all charges regardless of whether a purchase order is linked to \
   each charge.\n"]

module ListAgreementInvoiceLineItems : sig
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
    list_agreement_invoice_line_items_input ->
    ( list_agreement_invoice_line_items_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_agreement_invoice_line_items_input ->
    ( list_agreement_invoice_line_items_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Allows sellers (proposers) to retrieve aggregated billing data from AWS Marketplace agreements \
   using flexible grouping. Supports invoice-level aggregation with filtering by billing period, \
   invoice type, and issued date.\n\n\
  \  The [groupBy] parameter is required and supports only [INVOICE_ID] as a value. The \
   [agreementId] parameter is required.\n\
  \  \n\
  \   "]

module ListAgreementPaymentRequests : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_agreement_payment_requests_input ->
    ( list_agreement_payment_requests_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_agreement_payment_requests_input ->
    ( list_agreement_payment_requests_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Lists payment requests available to you as a seller or buyer. Both sellers (proposers) and \
   buyers (acceptors) can use this operation to find payment requests by specifying their party \
   type and applying optional parameters.\n\n\
  \   [PartyType] is a required parameter. A [ValidationException] is returned if [PartyType] is \
   not provided. Pagination is supported through [maxResults] (1-50, default 50) and [nextToken] \
   parameters.\n\
  \  \n\
  \   "]

module ListBillingAdjustmentRequests : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_billing_adjustment_requests_input ->
    ( list_billing_adjustment_requests_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_billing_adjustment_requests_input ->
    ( list_billing_adjustment_requests_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Lists billing adjustment requests for a specific agreement. Sellers (proposers) can use this \
   operation to view all billing adjustment requests associated with an agreement.\n"]

module RejectAgreementCancellationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_agreement_cancellation_request_input ->
    ( reject_agreement_cancellation_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_agreement_cancellation_request_input ->
    ( reject_agreement_cancellation_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Allows buyers (acceptors) to reject a cancellation request that is in [PENDING_APPROVAL] \
   status. Once rejected, the cancellation request transitions to [REJECTED] status and the \
   agreement remains active. Buyers must provide a reason for the rejection.\n\n\
  \  Only cancellation requests in [PENDING_APPROVAL] status can be rejected. A \
   [ConflictException] is thrown if the cancellation request is in any other status.\n\
  \  \n\
  \   "]

module RejectAgreementPaymentRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_agreement_payment_request_input ->
    ( reject_agreement_payment_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_agreement_payment_request_input ->
    ( reject_agreement_payment_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Allows buyers (acceptors) to reject a payment request that is in [PENDING_APPROVAL] status. \
   Once rejected, the payment request transitions to [REJECTED] status and cannot be accepted. \
   Buyers can optionally provide a reason for the rejection.\n\n\
  \  Only payment requests in [PENDING_APPROVAL] status can be rejected. A [ConflictException] is \
   thrown if the payment request is in any other status.\n\
  \  \n\
  \   "]

module SearchAgreements : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_agreements_input ->
    ( search_agreements_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_agreements_input ->
    ( search_agreements_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Searches across all agreements that a proposer or an acceptor has in AWS Marketplace. The \
   search returns a list of agreements with basic agreement information.\n\n\
  \ The following filter combinations are supported when the [PartyType] is [Proposer]:\n\
  \ \n\
  \  {ul\n\
  \        {-   [AgreementType] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [ResourceType] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [ResourceType] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [ResourceType] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [ResourceType] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [ResourceIdentifier] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [ResourceIdentifier] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [ResourceIdentifier] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [ResourceIdentifier] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [OfferId] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [OfferId] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [OfferId] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [OfferId] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [ResourceIdentifier] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [ResourceIdentifier] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [ResourceIdentifier] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [ResourceIdentifier] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [ResourceType] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [ResourceType] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [ResourceType] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [ResourceType] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [OfferId] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [OfferId] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [OfferId] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [OfferId] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [OfferSetId] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [OfferSetId] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [OfferSetId] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [OfferSetId] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \     To filter by [EndTime], you can use [BeforeEndTime] and/or [AfterEndTime]. Only [EndTime] \
   is supported for sorting.\n\
  \    \n\
  \      The following filter combinations are supported when the [PartyType] is [Acceptor]:\n\
  \      \n\
  \       {ul\n\
  \             {-   [AgreementType] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [Status] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [Status] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [ResourceIdentifier] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [ResourceIdentifier] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [ResourceIdentifier] + [Status] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [ResourceIdentifier] + [Status] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [ResourceType] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [ResourceType] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [OfferId] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [OfferId] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [OfferId] + [Status] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [OfferId] + [Status] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [OfferSetId] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [OfferSetId] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [OfferSetId] + [Status] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [OfferSetId] + [Status] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \  "]

module SendAgreementCancellationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_agreement_cancellation_request_input ->
    ( send_agreement_cancellation_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_agreement_cancellation_request_input ->
    ( send_agreement_cancellation_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Allows sellers (proposers) to submit a cancellation request for an active agreement. The \
   cancellation request is created in [PENDING_APPROVAL] status, at which point the buyer can \
   review it.\n"]

module SendAgreementPaymentRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_agreement_payment_request_input ->
    ( send_agreement_payment_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_agreement_payment_request_input ->
    ( send_agreement_payment_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Allows sellers (proposers) to submit a payment request to buyers (acceptors) for a specific \
   charge amount for an agreement that includes a [VariablePaymentTerm]. The payment request is \
   created in [PENDING_APPROVAL] status, at which point the buyer can accept or reject it.\n\n\
  \  The agreement must be active and have a [VariablePaymentTerm] to support payment requests. \
   The [chargeAmount] must not exceed the remaining available balance under the \
   [VariablePaymentTerm] [maxTotalChargeAmount].\n\
  \  \n\
  \   "]

(** {1:Serialization and Deserialization} *)
module UpdatePurchaseOrders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_purchase_orders_input ->
    ( update_purchase_orders_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_purchase_orders_input ->
    ( update_purchase_orders_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Allows acceptors to associate purchase orders with agreement charges after an agreement is \
   created.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
