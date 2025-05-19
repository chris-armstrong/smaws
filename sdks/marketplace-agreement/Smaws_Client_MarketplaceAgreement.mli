(** 
    Marketplace Agreement client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec validity_term =
  {
  agreement_end_date: CoreTypes.Timestamp.t option ;
  agreement_start_date: CoreTypes.Timestamp.t option ;
  agreement_duration: string option ;
  type_: string option }[@@ocaml.doc
                          "Defines the conditions that will keep an agreement created from this offer valid. \n"]
type nonrec validation_exception_reason =
  | OTHER 
  | UNSUPPORTED_FILTERS 
  | INVALID_MAX_RESULTS 
  | INVALID_NEXT_TOKEN 
  | INVALID_SORT_ORDER 
  | INVALID_SORT_BY 
  | INVALID_FILTER_VALUES 
  | INVALID_FILTER_NAME 
  | INVALID_CATALOG 
  | MISSING_AGREEMENT_ID 
  | INVALID_AGREEMENT_ID [@@ocaml.doc ""]
type nonrec validation_exception_field = {
  message: string ;
  name: string }[@@ocaml.doc
                  "The input fails to satisfy the constraints specified by the service.\n"]
type nonrec validation_exception =
  {
  fields: validation_exception_field list option ;
  reason: validation_exception_reason option ;
  message: string option ;
  request_id: string option }[@@ocaml.doc
                               "The input fails to satisfy the constraints specified by the service.\n"]
type nonrec rate_card_item =
  {
  price: string option ;
  dimension_key: string option }[@@ocaml.doc
                                  "Defines the per unit rates for each individual product dimension.\n"]
type nonrec usage_based_rate_card_item =
  {
  rate_card: rate_card_item list option }[@@ocaml.doc
                                           "Within the pay-as-you-go model defined under [UsageBasedPricingTerm], the [UsageBasedRateCardItem] defines an individual rate for a product dimension.\n"]
type nonrec usage_based_pricing_term =
  {
  rate_cards: usage_based_rate_card_item list option ;
  currency_code: string option ;
  type_: string option }[@@ocaml.doc
                          "Defines a usage-based pricing model (typically, pay-as-you-go pricing), where the customers are charged based on product usage.\n"]
type nonrec throttling_exception =
  {
  message: string option ;
  request_id: string option }[@@ocaml.doc
                               "Request was denied due to request throttling.\n"]
type nonrec support_term =
  {
  refund_policy: string option ;
  type_: string option }[@@ocaml.doc
                          "Defines the customer support available for the acceptors when they purchase the software.\n"]
type nonrec sort_order =
  | DESCENDING 
  | ASCENDING [@@ocaml.doc ""]
type nonrec sort = {
  sort_order: sort_order option ;
  sort_by: string option }[@@ocaml.doc
                            "An object that contains the [SortBy] and [SortOrder] attributes.\n"]
type nonrec selector = {
  value: string option ;
  type_: string option }[@@ocaml.doc
                          "Differentiates between the mutually exclusive rate cards in the same pricing term to be selected by the buyer.\n"]
type nonrec acceptor = {
  account_id: string option }[@@ocaml.doc
                               "The details of the party accepting the agreement terms. This is commonly the buyer for [PurchaseAgreement].\n"]
type nonrec proposer = {
  account_id: string option }[@@ocaml.doc
                               "Details of the party proposing the agreement terms,. This is commonly the seller for [PurchaseAgreement]. \n"]
type nonrec resource = {
  type_: string option ;
  id: string option }[@@ocaml.doc
                       "The list of resources involved in the agreement.\n"]
type nonrec proposal_summary =
  {
  offer_id: string option ;
  resources: resource list option }[@@ocaml.doc
                                     "A summary of the proposal received from the proposer.\n"]
type nonrec agreement_status =
  | TERMINATED 
  | SUPERSEDED 
  | ROLLED_BACK 
  | REPLACED 
  | RENEWED 
  | EXPIRED 
  | CANCELLED 
  | ARCHIVED 
  | ACTIVE [@@ocaml.doc ""]
type nonrec agreement_view_summary =
  {
  status: agreement_status option ;
  proposal_summary: proposal_summary option ;
  proposer: proposer option ;
  acceptor: acceptor option ;
  agreement_type: string option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  acceptance_time: CoreTypes.Timestamp.t option ;
  agreement_id: string option }[@@ocaml.doc
                                 "A summary of the agreement, including top-level attributes (for example, the agreement ID, version, proposer, and acceptor).\n"]
type nonrec search_agreements_output =
  {
  next_token: string option ;
  agreement_view_summaries: agreement_view_summary list option }[@@ocaml.doc
                                                                  ""]
type nonrec filter = {
  values: string list option ;
  name: string option }[@@ocaml.doc
                         "The filter name and value pair that is used to return a more specific list of results. Filters can be used to match a set of resources by various criteria, such as [offerId] or [productId].\n"]
type nonrec search_agreements_input =
  {
  next_token: string option ;
  max_results: int option ;
  sort: sort option ;
  filters: filter list option ;
  catalog: string option }[@@ocaml.doc ""]
type nonrec internal_server_exception =
  {
  message: string option ;
  request_id: string option }[@@ocaml.doc
                               "Unexpected error during processing of request.\n"]
type nonrec access_denied_exception =
  {
  message: string option ;
  request_id: string option }[@@ocaml.doc
                               "User does not have sufficient access to perform this action.\n"]
type nonrec schedule_item =
  {
  charge_amount: string option ;
  charge_date: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                               "An individual installment of the payment that includes the date and amount of the charge.\n"]
type nonrec resource_type =
  | AGREEMENT [@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  resource_type: resource_type option ;
  resource_id: string option ;
  message: string option ;
  request_id: string option }[@@ocaml.doc
                               "Request references a resource which does not exist.\n"]
type nonrec renewal_term_configuration = {
  enable_auto_renew: bool }[@@ocaml.doc
                             "Additional parameters specified by the acceptor while accepting the term.\n"]
type nonrec renewal_term =
  {
  configuration: renewal_term_configuration option ;
  type_: string option }[@@ocaml.doc
                          "Defines that on graceful expiration of the agreement (when the agreement ends on its pre-defined end date), a new agreement will be created using the accepted terms on the existing agreement. In other words, the agreement will be renewed. The presence of [RenewalTerm] in the offer document means that auto-renewal is allowed. Buyers will have the option to accept or decline auto-renewal at the offer acceptance/agreement creation. Buyers can also change this flag from [True] to [False] or [False] to [True] at anytime during the agreement's lifecycle.\n"]
type nonrec recurring_payment_term =
  {
  price: string option ;
  billing_period: string option ;
  currency_code: string option ;
  type_: string option }[@@ocaml.doc
                          "Defines a pricing model where customers are charged a fixed recurring price at the end of each billing period.\n"]
type nonrec payment_schedule_term =
  {
  schedule: schedule_item list option ;
  currency_code: string option ;
  type_: string option }[@@ocaml.doc
                          "Defines an installment-based pricing model where customers are charged a fixed price on different dates during the agreement validity period. This is used most commonly for flexible payment schedule pricing.\n"]
type nonrec document_item =
  {
  version: string option ;
  url: string option ;
  type_: string option }[@@ocaml.doc
                          "Includes the list of references to legal resources proposed by the proposer to the acceptor. Each [DocumentItem] refers to an individual reference.\n"]
type nonrec legal_term =
  {
  documents: document_item list option ;
  type_: string option }[@@ocaml.doc
                          "Defines the list of text agreements proposed to the acceptors. An example is the end user license agreement (EULA).\n"]
type nonrec grant_item =
  {
  max_quantity: int option ;
  dimension_key: string option }[@@ocaml.doc
                                  "Entitlements granted to the acceptor of fixed upfront as part of agreement execution.\n"]
type nonrec constraints =
  {
  quantity_configuration: string option ;
  multiple_dimension_selection: string option }[@@ocaml.doc
                                                 "Defines limits on how the term can be configured by acceptors. \n"]
type nonrec configurable_upfront_rate_card_item =
  {
  rate_card: rate_card_item list option ;
  constraints: constraints option ;
  selector: selector option }[@@ocaml.doc
                               "Within the prepaid payment model defined under [ConfigurableUpfrontPricingTerm], the [RateCardItem] defines all the various rate cards (including pricing and dimensions) that have been proposed.\n"]
type nonrec dimension = {
  dimension_value: int ;
  dimension_key: string }[@@ocaml.doc
                           "Defines the dimensions that the acceptor has purchased from the overall set of dimensions presented in the rate card.\n"]
type nonrec configurable_upfront_pricing_term_configuration =
  {
  dimensions: dimension list ;
  selector_value: string }[@@ocaml.doc
                            "Defines a prepaid payment model that allows buyers to configure the entitlements they want to purchase and the duration.\n"]
type nonrec configurable_upfront_pricing_term =
  {
  configuration: configurable_upfront_pricing_term_configuration option ;
  rate_cards: configurable_upfront_rate_card_item list option ;
  currency_code: string option ;
  type_: string option }[@@ocaml.doc
                          "Defines a prepaid payment model that allows buyers to configure the entitlements they want to purchase and the duration.\n"]
type nonrec byol_pricing_term = {
  type_: string option }[@@ocaml.doc
                          "Enables you and your customers to move your existing agreements to AWS Marketplace. The customer won't be charged for product usage in AWS Marketplace because they already paid for the product outside of AWS Marketplace.\n"]
type nonrec free_trial_pricing_term =
  {
  grants: grant_item list option ;
  duration: string option ;
  type_: string option }[@@ocaml.doc
                          "Defines a short-term free pricing model where the buyers aren\226\128\153t charged anything within a specified limit.\n"]
type nonrec fixed_upfront_pricing_term =
  {
  grants: grant_item list option ;
  price: string option ;
  duration: string option ;
  currency_code: string option ;
  type_: string option }[@@ocaml.doc
                          "Defines a prepaid pricing model where the customers are charged a fixed upfront amount.\n"]
type nonrec accepted_term =
  | FixedUpfrontPricingTerm of fixed_upfront_pricing_term 
  | FreeTrialPricingTerm of free_trial_pricing_term 
  | PaymentScheduleTerm of payment_schedule_term 
  | ValidityTerm of validity_term 
  | RecurringPaymentTerm of recurring_payment_term 
  | ByolPricingTerm of byol_pricing_term 
  | ConfigurableUpfrontPricingTerm of configurable_upfront_pricing_term 
  | UsageBasedPricingTerm of usage_based_pricing_term 
  | RenewalTerm of renewal_term 
  | SupportTerm of support_term 
  | LegalTerm of legal_term [@@ocaml.doc
                              "A subset of terms proposed by the proposer, which have been accepted by the acceptor as part of agreement creation.\n"]
type nonrec get_agreement_terms_output =
  {
  next_token: string option ;
  accepted_terms: accepted_term list option }[@@ocaml.doc ""]
type nonrec get_agreement_terms_input =
  {
  next_token: string option ;
  max_results: int option ;
  agreement_id: string }[@@ocaml.doc ""]
type nonrec estimated_charges =
  {
  agreement_value: string option ;
  currency_code: string option }[@@ocaml.doc
                                  "Estimated cost of the agreement.\n"]
type nonrec describe_agreement_output =
  {
  status: agreement_status option ;
  proposal_summary: proposal_summary option ;
  estimated_charges: estimated_charges option ;
  agreement_type: string option ;
  acceptance_time: CoreTypes.Timestamp.t option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  proposer: proposer option ;
  acceptor: acceptor option ;
  agreement_id: string option }[@@ocaml.doc ""]
type nonrec describe_agreement_input = {
  agreement_id: string }[@@ocaml.doc ""](** {1:builders Builders} *)

val make_validity_term :
  ?agreement_end_date:CoreTypes.Timestamp.t ->
    ?agreement_start_date:CoreTypes.Timestamp.t ->
      ?agreement_duration:string -> ?type_:string -> unit -> validity_term
val make_validation_exception_field :
  message:string -> name:string -> unit -> validation_exception_field
val make_rate_card_item :
  ?price:string -> ?dimension_key:string -> unit -> rate_card_item
val make_usage_based_rate_card_item :
  ?rate_card:rate_card_item list -> unit -> usage_based_rate_card_item
val make_usage_based_pricing_term :
  ?rate_cards:usage_based_rate_card_item list ->
    ?currency_code:string ->
      ?type_:string -> unit -> usage_based_pricing_term
val make_support_term :
  ?refund_policy:string -> ?type_:string -> unit -> support_term
val make_sort : ?sort_order:sort_order -> ?sort_by:string -> unit -> sort
val make_selector : ?value:string -> ?type_:string -> unit -> selector
val make_acceptor : ?account_id:string -> unit -> acceptor
val make_proposer : ?account_id:string -> unit -> proposer
val make_resource : ?type_:string -> ?id:string -> unit -> resource
val make_proposal_summary :
  ?offer_id:string -> ?resources:resource list -> unit -> proposal_summary
val make_agreement_view_summary :
  ?status:agreement_status ->
    ?proposal_summary:proposal_summary ->
      ?proposer:proposer ->
        ?acceptor:acceptor ->
          ?agreement_type:string ->
            ?end_time:CoreTypes.Timestamp.t ->
              ?start_time:CoreTypes.Timestamp.t ->
                ?acceptance_time:CoreTypes.Timestamp.t ->
                  ?agreement_id:string -> unit -> agreement_view_summary
val make_search_agreements_output :
  ?next_token:string ->
    ?agreement_view_summaries:agreement_view_summary list ->
      unit -> search_agreements_output
val make_filter : ?values:string list -> ?name:string -> unit -> filter
val make_search_agreements_input :
  ?next_token:string ->
    ?max_results:int ->
      ?sort:sort ->
        ?filters:filter list ->
          ?catalog:string -> unit -> search_agreements_input
val make_schedule_item :
  ?charge_amount:string ->
    ?charge_date:CoreTypes.Timestamp.t -> unit -> schedule_item
val make_renewal_term_configuration :
  enable_auto_renew:bool -> unit -> renewal_term_configuration
val make_renewal_term :
  ?configuration:renewal_term_configuration ->
    ?type_:string -> unit -> renewal_term
val make_recurring_payment_term :
  ?price:string ->
    ?billing_period:string ->
      ?currency_code:string ->
        ?type_:string -> unit -> recurring_payment_term
val make_payment_schedule_term :
  ?schedule:schedule_item list ->
    ?currency_code:string -> ?type_:string -> unit -> payment_schedule_term
val make_document_item :
  ?version:string -> ?url:string -> ?type_:string -> unit -> document_item
val make_legal_term :
  ?documents:document_item list -> ?type_:string -> unit -> legal_term
val make_grant_item :
  ?max_quantity:int -> ?dimension_key:string -> unit -> grant_item
val make_constraints :
  ?quantity_configuration:string ->
    ?multiple_dimension_selection:string -> unit -> constraints
val make_configurable_upfront_rate_card_item :
  ?rate_card:rate_card_item list ->
    ?constraints:constraints ->
      ?selector:selector -> unit -> configurable_upfront_rate_card_item
val make_dimension :
  dimension_value:int -> dimension_key:string -> unit -> dimension
val make_configurable_upfront_pricing_term_configuration :
  dimensions:dimension list ->
    selector_value:string ->
      unit -> configurable_upfront_pricing_term_configuration
val make_configurable_upfront_pricing_term :
  ?configuration:configurable_upfront_pricing_term_configuration ->
    ?rate_cards:configurable_upfront_rate_card_item list ->
      ?currency_code:string ->
        ?type_:string -> unit -> configurable_upfront_pricing_term
val make_byol_pricing_term : ?type_:string -> unit -> byol_pricing_term
val make_free_trial_pricing_term :
  ?grants:grant_item list ->
    ?duration:string -> ?type_:string -> unit -> free_trial_pricing_term
val make_fixed_upfront_pricing_term :
  ?grants:grant_item list ->
    ?price:string ->
      ?duration:string ->
        ?currency_code:string ->
          ?type_:string -> unit -> fixed_upfront_pricing_term
val make_get_agreement_terms_output :
  ?next_token:string ->
    ?accepted_terms:accepted_term list -> unit -> get_agreement_terms_output
val make_get_agreement_terms_input :
  ?next_token:string ->
    ?max_results:int ->
      agreement_id:string -> unit -> get_agreement_terms_input
val make_estimated_charges :
  ?agreement_value:string ->
    ?currency_code:string -> unit -> estimated_charges
val make_describe_agreement_output :
  ?status:agreement_status ->
    ?proposal_summary:proposal_summary ->
      ?estimated_charges:estimated_charges ->
        ?agreement_type:string ->
          ?acceptance_time:CoreTypes.Timestamp.t ->
            ?end_time:CoreTypes.Timestamp.t ->
              ?start_time:CoreTypes.Timestamp.t ->
                ?proposer:proposer ->
                  ?acceptor:acceptor ->
                    ?agreement_id:string -> unit -> describe_agreement_output
val make_describe_agreement_input :
  agreement_id:string -> unit -> describe_agreement_input(** {1:operations Operations} *)

module DescribeAgreement : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_agreement_input ->
        (describe_agreement_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Provides details about an agreement, such as the proposer, acceptor, start date, and end date.
 *)

  
end

module GetAgreementTerms : sig
  val request :
    Smaws_Lib.Context.t ->
      get_agreement_terms_input ->
        (get_agreement_terms_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Obtains details about the terms in an agreement that you participated in as proposer or acceptor.

 The details include:
 
  {ul
        {-   [TermType] – The type of term, such as [LegalTerm], [RenewalTerm], or [ConfigurableUpfrontPricingTerm].
            
             }
        {-   [TermID] – The ID of the particular term, which is common between offer and agreement.
            
             }
        {-   [TermPayload] – The key information contained in the term, such as the EULA for [LegalTerm] or pricing and dimensions for various pricing terms, such as [ConfigurableUpfrontPricingTerm] or [UsageBasedPricingTerm].
            
             }
        }
   {ul
         {-   [Configuration] – The buyer/acceptor's selection at the time of agreement creation, such as the number of units purchased for a dimension or setting the [EnableAutoRenew] flag.
             
              }
         }
   *)

  
end

module SearchAgreements : sig
  val request :
    Smaws_Lib.Context.t ->
      search_agreements_input ->
        (search_agreements_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Searches across all agreements that a proposer or an acceptor has in AWS Marketplace. The search returns a list of agreements with basic agreement information.

 The following filter combinations are supported:
 
  {ul
        {-   [PartyType] as [Proposer] + [AgreementType] + [ResourceIdentifier] 
            
             }
        {-   [PartyType] as [Proposer] + [AgreementType] + [OfferId] 
            
             }
        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] 
            
             }
        {-   [PartyType] as [Proposer] + [AgreementType] + [Status] 
            
             }
        {-   [PartyType] as [Proposer] + [AgreementType] + [ResourceIdentifier] + [Status] 
            
             }
        {-   [PartyType] as [Proposer] + [AgreementType] + [OfferId] + [Status] 
            
             }
        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [Status] 
            
             }
        {-   [PartyType] as [Proposer] + [AgreementType] + [ResourceType] + [Status] 
            
             }
        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [ResourceType] + [Status] 
            
             }
        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [OfferId] 
            
             }
        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [OfferId] + [Status] 
            
             }
        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [ResourceIdentifier] 
            
             }
        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [ResourceIdentifier] + [Status] 
            
             }
        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [ResourceType] 
            
             }
        }
   *)

  
end

