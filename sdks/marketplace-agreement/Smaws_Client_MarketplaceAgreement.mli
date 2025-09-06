(** Marketplace Agreement client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_validity_term :
  ?agreement_end_date:timestamp ->
  ?agreement_start_date:timestamp ->
  ?agreement_duration:bounded_string ->
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
  ?type_:unversioned_term_type ->
  unit ->
  usage_based_pricing_term

val make_support_term :
  ?refund_policy:bounded_string -> ?type_:unversioned_term_type -> unit -> support_term

val make_sort : ?sort_order:sort_order -> ?sort_by:sort_by -> unit -> sort
val make_selector : ?value:bounded_string -> ?type_:bounded_string -> unit -> selector
val make_acceptor : ?account_id:aws_account_id -> unit -> acceptor
val make_proposer : ?account_id:aws_account_id -> unit -> proposer
val make_resource : ?type_:agreement_resource_type -> ?id:resource_id -> unit -> resource
val make_proposal_summary : ?offer_id:offer_id -> ?resources:resources -> unit -> proposal_summary

val make_agreement_view_summary :
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

val make_renewal_term_configuration :
  enable_auto_renew:boolean_ -> unit -> renewal_term_configuration

val make_renewal_term :
  ?configuration:renewal_term_configuration -> ?type_:unversioned_term_type -> unit -> renewal_term

val make_recurring_payment_term :
  ?price:bounded_string ->
  ?billing_period:bounded_string ->
  ?currency_code:currency_code ->
  ?type_:unversioned_term_type ->
  unit ->
  recurring_payment_term

val make_payment_schedule_term :
  ?schedule:schedule_list ->
  ?currency_code:currency_code ->
  ?type_:unversioned_term_type ->
  unit ->
  payment_schedule_term

val make_document_item :
  ?version:bounded_string -> ?url:bounded_string -> ?type_:bounded_string -> unit -> document_item

val make_legal_term : ?documents:document_list -> ?type_:unversioned_term_type -> unit -> legal_term

val make_grant_item :
  ?max_quantity:positive_integer_with_default_value_one ->
  ?dimension_key:bounded_string ->
  unit ->
  grant_item

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

val make_dimension :
  dimension_value:zero_value_integer -> dimension_key:bounded_string -> unit -> dimension

val make_configurable_upfront_pricing_term_configuration :
  dimensions:dimension_list ->
  selector_value:bounded_string ->
  unit ->
  configurable_upfront_pricing_term_configuration

val make_configurable_upfront_pricing_term :
  ?configuration:configurable_upfront_pricing_term_configuration ->
  ?rate_cards:configurable_upfront_rate_card_list ->
  ?currency_code:currency_code ->
  ?type_:unversioned_term_type ->
  unit ->
  configurable_upfront_pricing_term

val make_byol_pricing_term : ?type_:unversioned_term_type -> unit -> byol_pricing_term

val make_free_trial_pricing_term :
  ?grants:grant_list ->
  ?duration:bounded_string ->
  ?type_:unversioned_term_type ->
  unit ->
  free_trial_pricing_term

val make_fixed_upfront_pricing_term :
  ?grants:grant_list ->
  ?price:bounded_string ->
  ?duration:bounded_string ->
  ?currency_code:currency_code ->
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
(** {1:operations Operations} *)

module DescribeAgreement : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_agreement_input ->
    ( describe_agreement_output,
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

module GetAgreementTerms : sig
  val request :
    Smaws_Lib.Context.t ->
    get_agreement_terms_input ->
    ( get_agreement_terms_output,
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

(** {1:Serialization and Deserialization} *)
module SearchAgreements : sig
  val request :
    Smaws_Lib.Context.t ->
    search_agreements_input ->
    ( search_agreements_output,
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
  \ The following filter combinations are supported:\n\
  \ \n\
  \  {ul\n\
  \        {-   [PartyType] as [Proposer] + [AgreementType] + [ResourceIdentifier] \n\
  \            \n\
  \             }\n\
  \        {-   [PartyType] as [Proposer] + [AgreementType] + [OfferId] \n\
  \            \n\
  \             }\n\
  \        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] \n\
  \            \n\
  \             }\n\
  \        {-   [PartyType] as [Proposer] + [AgreementType] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [PartyType] as [Proposer] + [AgreementType] + [ResourceIdentifier] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [PartyType] as [Proposer] + [AgreementType] + [OfferId] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [PartyType] as [Proposer] + [AgreementType] + [ResourceType] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [ResourceType] \
   + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [OfferId] \n\
  \            \n\
  \             }\n\
  \        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [OfferId] + \
   [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + \
   [ResourceIdentifier] \n\
  \            \n\
  \             }\n\
  \        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + \
   [ResourceIdentifier] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [ResourceType] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
