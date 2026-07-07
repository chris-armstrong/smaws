open Types

let make_upgrade_account_plan_response
    ~account_plan_status:(account_plan_status_ : account_plan_status)
    ~account_plan_type:(account_plan_type_ : account_plan_type)
    ~account_id:(account_id_ : account_id) () =
  ({
     account_plan_status = account_plan_status_;
     account_plan_type = account_plan_type_;
     account_id = account_id_;
   }
    : upgrade_account_plan_response)

let make_upgrade_account_plan_request ~account_plan_type:(account_plan_type_ : account_plan_type) ()
    =
  ({ account_plan_type = account_plan_type_ } : upgrade_account_plan_request)

let make_monetary_amount ~unit_:(unit__ : currency_code) ~amount:(amount_ : generic_double) () =
  ({ unit_ = unit__; amount = amount_ } : monetary_amount)

let make_activity_summary ~status:(status_ : activity_status) ~reward:(reward_ : activity_reward)
    ~title:(title_ : generic_string) ~activity_id:(activity_id_ : activity_id) () =
  ({ status = status_; reward = reward_; title = title_; activity_id = activity_id_ }
    : activity_summary)

let make_list_account_activities_response ?next_token:(next_token_ : next_page_token option)
    ~activities:(activities_ : activities) () =
  ({ next_token = next_token_; activities = activities_ } : list_account_activities_response)

let make_list_account_activities_request ?language_code:(language_code_ : language_code option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option)
    ?filter_activity_statuses:(filter_activity_statuses_ : filter_activity_statuses option) () =
  ({
     language_code = language_code_;
     max_results = max_results_;
     next_token = next_token_;
     filter_activity_statuses = filter_activity_statuses_;
   }
    : list_account_activities_request)

let make_free_tier_usage ?free_tier_type:(free_tier_type_ : generic_string option)
    ?description:(description_ : generic_string option) ?unit_:(unit__ : generic_string option)
    ?limit:(limit_ : generic_double option)
    ?forecasted_usage_amount:(forecasted_usage_amount_ : generic_double option)
    ?actual_usage_amount:(actual_usage_amount_ : generic_double option)
    ?region:(region_ : generic_string option) ?usage_type:(usage_type_ : generic_string option)
    ?operation:(operation_ : generic_string option) ?service:(service_ : generic_string option) () =
  ({
     free_tier_type = free_tier_type_;
     description = description_;
     unit_ = unit__;
     limit = limit_;
     forecasted_usage_amount = forecasted_usage_amount_;
     actual_usage_amount = actual_usage_amount_;
     region = region_;
     usage_type = usage_type_;
     operation = operation_;
     service = service_;
   }
    : free_tier_usage)

let make_get_free_tier_usage_response ?next_token:(next_token_ : next_page_token option)
    ~free_tier_usages:(free_tier_usages_ : free_tier_usages) () =
  ({ next_token = next_token_; free_tier_usages = free_tier_usages_ }
    : get_free_tier_usage_response)

let make_dimension_values ~match_options:(match_options_ : match_options) ~values:(values_ : values)
    ~key:(key_ : dimension) () =
  ({ match_options = match_options_; values = values_; key = key_ } : dimension_values)

let make_expression ?dimensions:(dimensions_ : dimension_values option)
    ?not:(not_ : expression option) ?and_:(and__ : expressions option)
    ?\#or:(or_ : expressions option) () =
  ({ dimensions = dimensions_; not = not_; and_ = and__; \#or = or_ } : expression)

let make_get_free_tier_usage_request ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option) ?filter:(filter_ : expression option) () =
  ({ next_token = next_token_; max_results = max_results_; filter = filter_ }
    : get_free_tier_usage_request)

let make_get_account_plan_state_response
    ?account_plan_expiration_date:
      (account_plan_expiration_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?account_plan_remaining_credits:(account_plan_remaining_credits_ : monetary_amount option)
    ~account_plan_status:(account_plan_status_ : account_plan_status)
    ~account_plan_type:(account_plan_type_ : account_plan_type)
    ~account_id:(account_id_ : account_id) () =
  ({
     account_plan_expiration_date = account_plan_expiration_date_;
     account_plan_remaining_credits = account_plan_remaining_credits_;
     account_plan_status = account_plan_status_;
     account_plan_type = account_plan_type_;
     account_id = account_id_;
   }
    : get_account_plan_state_response)

let make_get_account_plan_state_request () = (() : unit)

let make_get_account_activity_response
    ?completed_at:(completed_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?started_at:(started_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?estimated_time_to_complete_in_minutes:
      (estimated_time_to_complete_in_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~reward:(reward_ : activity_reward) ~instructions_url:(instructions_url_ : generic_string)
    ~status:(status_ : activity_status) ~description:(description_ : generic_string)
    ~title:(title_ : generic_string) ~activity_id:(activity_id_ : activity_id) () =
  ({
     completed_at = completed_at_;
     started_at = started_at_;
     expires_at = expires_at_;
     estimated_time_to_complete_in_minutes = estimated_time_to_complete_in_minutes_;
     reward = reward_;
     instructions_url = instructions_url_;
     status = status_;
     description = description_;
     title = title_;
     activity_id = activity_id_;
   }
    : get_account_activity_response)

let make_get_account_activity_request ?language_code:(language_code_ : language_code option)
    ~activity_id:(activity_id_ : activity_id) () =
  ({ language_code = language_code_; activity_id = activity_id_ } : get_account_activity_request)
