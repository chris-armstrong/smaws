type nonrec validation_exception_reason =
  | OTHER [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | UNKNOWN_OPERATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception_field = {
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Provides a message explaining why the field failed validation.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Provides the name of the field that failed validation.\n"]
}
[@@ocaml.doc "Provides specific details about why a particular field failed validation.\n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception = {
  field_list : validation_exception_field_list option;
      [@ocaml.doc "Lists each problematic field and why it failed validation.\n"]
  reason : validation_exception_reason;
      [@ocaml.doc "Provides a single, overarching explanation for the validation failure.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The input fails to satisfy the constraints specified by an Amazon Web Services service.\n"]

type nonrec throttling_exception = { message : Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""] }
[@@ocaml.doc "The request was denied due to request throttling.\n"]

type nonrec severity = CRITICAL [@ocaml.doc ""] | WARNING [@ocaml.doc ""] | INFO [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec filter_name =
  | TYPE [@ocaml.doc ""]
  | SEVERITY [@ocaml.doc ""]
  | FEATURE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec match_option = NOT_EQUALS [@ocaml.doc ""] | EQUALS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_values = filter_value list [@@ocaml.doc ""]

type nonrec action_filter = {
  values : filter_values; [@ocaml.doc "One or more values to match against the specified key.\n"]
  match_option : match_option;
      [@ocaml.doc
        "Specifies how to apply the filter. Use [EQUALS] to include matching results or \
         [NOT_EQUALS] to exclude matching results.\n"]
  key : filter_name;
      [@ocaml.doc
        "The category to filter on. Valid values are [FEATURE] for feature type, [SEVERITY] for \
         severity level, and [TYPE] for recommendation type.\n"]
}
[@@ocaml.doc "Describes a filter that returns a more specific list of recommended actions.\n"]

type nonrec action_filter_list = action_filter list [@@ocaml.doc ""]

type nonrec request_filter = {
  actions : action_filter_list option;
      [@ocaml.doc
        "A list of action filters that define criteria for filtering results. Each filter \
         specifies a key, match option, and corresponding values to filter on.\n"]
}
[@@ocaml.doc
  "Enables filtering of results based on specified action criteria. You can define multiple action \
   filters to refine results using combinations of feature type, severity level, and \
   recommendation type.\n"]

type nonrec action_type =
  | UPDATE_TAX_REGISTRATION_NUMBER [@ocaml.doc ""]
  | UPDATE_TAX_EXEMPTION_CERTIFICATE [@ocaml.doc ""]
  | UPDATE_INVALID_PAYMENT_METHOD [@ocaml.doc ""]
  | UPDATE_EXPIRED_PAYMENT_METHOD [@ocaml.doc ""]
  | REVIEW_SAVINGS_OPPORTUNITY_RECOMMENDATIONS [@ocaml.doc ""]
  | REVIEW_FREETIER_DAYS_REMAINING [@ocaml.doc ""]
  | REVIEW_FREETIER_CREDITS_REMAINING [@ocaml.doc ""]
  | REVIEW_FREETIER_USAGE_ALERTS [@ocaml.doc ""]
  | REVIEW_EXPIRING_SP [@ocaml.doc ""]
  | REVIEW_EXPIRING_RI [@ocaml.doc ""]
  | REVIEW_BUDGETS_EXCEEDED [@ocaml.doc ""]
  | REVIEW_BUDGET_ALERTS [@ocaml.doc ""]
  | REVIEW_ANOMALIES [@ocaml.doc ""]
  | PAYMENTS_PAST_DUE [@ocaml.doc ""]
  | PAYMENTS_DUE [@ocaml.doc ""]
  | MIGRATE_TO_GRANULAR_PERMISSIONS [@ocaml.doc ""]
  | ENABLE_COST_OPTIMIZATION_HUB [@ocaml.doc ""]
  | CREATE_BUDGET [@ocaml.doc ""]
  | CREATE_ANOMALY_MONITOR [@ocaml.doc ""]
  | ADD_ALTERNATE_BILLING_CONTACT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec feature =
  | TAX_SETTINGS [@ocaml.doc ""]
  | SAVINGS_PLANS [@ocaml.doc ""]
  | RESERVATIONS [@ocaml.doc ""]
  | PAYMENTS [@ocaml.doc ""]
  | IAM [@ocaml.doc ""]
  | FREE_TIER [@ocaml.doc ""]
  | COST_OPTIMIZATION_HUB [@ocaml.doc ""]
  | COST_ANOMALY_DETECTION [@ocaml.doc ""]
  | BUDGETS [@ocaml.doc ""]
  | ACCOUNT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec context = (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_) list
[@@ocaml.doc ""]

type nonrec next_step = string [@@ocaml.doc ""]

type nonrec next_steps = next_step list [@@ocaml.doc ""]

type nonrec recommended_action = {
  last_updated_time_stamp : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The time when the recommended action status was last updated.\n"]
  next_steps : next_steps option;
      [@ocaml.doc "The possible next steps to execute the recommended action.\n"]
  context : context option; [@ocaml.doc "Context that applies to the recommended action.\n"]
  feature : feature option; [@ocaml.doc "The feature associated with the recommended action.\n"]
  severity : severity option; [@ocaml.doc "The severity associated with the recommended action.\n"]
  account_id : account_id option; [@ocaml.doc "The account that the recommended action is for.\n"]
  type_ : action_type option;
      [@ocaml.doc "The type of action you can take by adopting the recommended action.\n"]
  id : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The ID for the recommended action.\n"]
}
[@@ocaml.doc "Describes a specific recommended action.\n"]

type nonrec recommended_actions = recommended_action list [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_recommended_actions_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The pagination token that indicates the next set of results that you want to retrieve.\n"]
  recommended_actions : recommended_actions;
      [@ocaml.doc "The list of recommended actions that satisfy the filter criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec list_recommended_actions_request = {
  next_token : next_token option;
      [@ocaml.doc
        "The pagination token that indicates the next set of results that you want to retrieve.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  filter : request_filter option;
      [@ocaml.doc "The criteria that you want all returned recommended actions to match.\n"]
}
[@@ocaml.doc ""]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "An unexpected error occurred during the processing of your request.\n"]

type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "You do not have sufficient access to perform this action.\n"]
