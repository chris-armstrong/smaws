type nonrec validation_exception_field = {
  name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Provides the name of the field that failed validation.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Provides a message explaining why the field failed validation.\n"]
}
[@@ocaml.doc "Provides specific details about why a particular field failed validation.\n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | UNKNOWN_OPERATION [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
  reason : validation_exception_reason;
      [@ocaml.doc "Provides a single, overarching explanation for the validation failure.\n"]
  field_list : validation_exception_field_list option;
      [@ocaml.doc "Lists each problematic field and why it failed validation.\n"]
}
[@@ocaml.doc
  "The input fails to satisfy the constraints specified by an Amazon Web Services service.\n"]

type nonrec throttling_exception = { message : Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""] }
[@@ocaml.doc "The request was denied due to request throttling.\n"]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "An unexpected error occurred during the processing of your request.\n"]

type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "You do not have sufficient access to perform this action.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec next_step = string [@@ocaml.doc ""]

type nonrec next_steps = next_step list [@@ocaml.doc ""]

type nonrec context = (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_) list
[@@ocaml.doc ""]

type nonrec feature =
  | ACCOUNT [@ocaml.doc ""]
  | BUDGETS [@ocaml.doc ""]
  | COST_ANOMALY_DETECTION [@ocaml.doc ""]
  | COST_OPTIMIZATION_HUB [@ocaml.doc ""]
  | FREE_TIER [@ocaml.doc ""]
  | IAM [@ocaml.doc ""]
  | PAYMENTS [@ocaml.doc ""]
  | RESERVATIONS [@ocaml.doc ""]
  | SAVINGS_PLANS [@ocaml.doc ""]
  | TAX_SETTINGS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec severity = INFO [@ocaml.doc ""] | WARNING [@ocaml.doc ""] | CRITICAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec action_type =
  | ADD_ALTERNATE_BILLING_CONTACT [@ocaml.doc ""]
  | CREATE_ANOMALY_MONITOR [@ocaml.doc ""]
  | CREATE_BUDGET [@ocaml.doc ""]
  | ENABLE_COST_OPTIMIZATION_HUB [@ocaml.doc ""]
  | MIGRATE_TO_GRANULAR_PERMISSIONS [@ocaml.doc ""]
  | PAYMENTS_DUE [@ocaml.doc ""]
  | PAYMENTS_PAST_DUE [@ocaml.doc ""]
  | REVIEW_ANOMALIES [@ocaml.doc ""]
  | REVIEW_BUDGET_ALERTS [@ocaml.doc ""]
  | REVIEW_BUDGETS_EXCEEDED [@ocaml.doc ""]
  | REVIEW_EXPIRING_RI [@ocaml.doc ""]
  | REVIEW_EXPIRING_SP [@ocaml.doc ""]
  | REVIEW_FREETIER_USAGE_ALERTS [@ocaml.doc ""]
  | REVIEW_FREETIER_CREDITS_REMAINING [@ocaml.doc ""]
  | REVIEW_FREETIER_DAYS_REMAINING [@ocaml.doc ""]
  | REVIEW_SAVINGS_OPPORTUNITY_RECOMMENDATIONS [@ocaml.doc ""]
  | UPDATE_EXPIRED_PAYMENT_METHOD [@ocaml.doc ""]
  | UPDATE_INVALID_PAYMENT_METHOD [@ocaml.doc ""]
  | UPDATE_TAX_EXEMPTION_CERTIFICATE [@ocaml.doc ""]
  | UPDATE_TAX_REGISTRATION_NUMBER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec recommended_action = {
  id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The ID for the recommended action.\n"]
  type_ : action_type option;
      [@ocaml.doc "The type of action you can take by adopting the recommended action.\n"]
  account_id : account_id option; [@ocaml.doc "The account that the recommended action is for.\n"]
  severity : severity option; [@ocaml.doc "The severity associated with the recommended action.\n"]
  feature : feature option; [@ocaml.doc "The feature associated with the recommended action.\n"]
  context : context option; [@ocaml.doc "Context that applies to the recommended action.\n"]
  next_steps : next_steps option;
      [@ocaml.doc "The possible next steps to execute the recommended action.\n"]
  last_updated_time_stamp : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The time when the recommended action status was last updated.\n"]
}
[@@ocaml.doc "Describes a specific recommended action.\n"]

type nonrec recommended_actions = recommended_action list [@@ocaml.doc ""]

type nonrec list_recommended_actions_response = {
  recommended_actions : recommended_actions;
      [@ocaml.doc "The list of recommended actions that satisfy the filter criteria.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The pagination token that indicates the next set of results that you want to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_values = filter_value list [@@ocaml.doc ""]

type nonrec match_option = EQUALS [@ocaml.doc ""] | NOT_EQUALS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec filter_name =
  | FEATURE [@ocaml.doc ""]
  | SEVERITY [@ocaml.doc ""]
  | TYPE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec action_filter = {
  key : filter_name;
      [@ocaml.doc
        "The category to filter on. Valid values are [FEATURE] for feature type, [SEVERITY] for \
         severity level, and [TYPE] for recommendation type.\n"]
  match_option : match_option;
      [@ocaml.doc
        "Specifies how to apply the filter. Use [EQUALS] to include matching results or \
         [NOT_EQUALS] to exclude matching results.\n"]
  values : filter_values; [@ocaml.doc "One or more values to match against the specified key.\n"]
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

type nonrec list_recommended_actions_request = {
  filter : request_filter option;
      [@ocaml.doc "The criteria that you want all returned recommended actions to match.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The pagination token that indicates the next set of results that you want to retrieve.\n"]
}
[@@ocaml.doc ""]
