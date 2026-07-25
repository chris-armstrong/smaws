open Types

let make_upgrade_account_plan_response ~account_id:(account_id_ : account_id)
    ~account_plan_type:(account_plan_type_ : account_plan_type)
    ~account_plan_status:(account_plan_status_ : account_plan_status) () =
  ({
     account_id = account_id_;
     account_plan_type = account_plan_type_;
     account_plan_status = account_plan_status_;
   }
    : upgrade_account_plan_response)

let make_upgrade_account_plan_request ~account_plan_type:(account_plan_type_ : account_plan_type) ()
    =
  ({ account_plan_type = account_plan_type_ } : upgrade_account_plan_request)

let make_monetary_amount ~amount:(amount_ : generic_double) ~unit_:(unit__ : currency_code) () =
  ({ amount = amount_; unit_ = unit__ } : monetary_amount)

let make_activity_summary ~activity_id:(activity_id_ : activity_id) ~title:(title_ : generic_string)
    ~reward:(reward_ : activity_reward) ~status:(status_ : activity_status) () =
  ({ activity_id = activity_id_; title = title_; reward = reward_; status = status_ }
    : activity_summary)

let make_list_account_activities_response ?next_token:(next_token_ : next_page_token option)
    ~activities:(activities_ : activities) () =
  ({ activities = activities_; next_token = next_token_ } : list_account_activities_response)

let make_list_account_activities_request
    ?filter_activity_statuses:(filter_activity_statuses_ : filter_activity_statuses option)
    ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option)
    ?language_code:(language_code_ : language_code option) () =
  ({
     filter_activity_statuses = filter_activity_statuses_;
     next_token = next_token_;
     max_results = max_results_;
     language_code = language_code_;
   }
    : list_account_activities_request)

let make_free_tier_usage ?service:(service_ : generic_string option)
    ?operation:(operation_ : generic_string option)
    ?usage_type:(usage_type_ : generic_string option) ?region:(region_ : generic_string option)
    ?actual_usage_amount:(actual_usage_amount_ : generic_double option)
    ?forecasted_usage_amount:(forecasted_usage_amount_ : generic_double option)
    ?limit:(limit_ : generic_double option) ?unit_:(unit__ : generic_string option)
    ?description:(description_ : generic_string option)
    ?free_tier_type:(free_tier_type_ : generic_string option) () =
  ({
     service = service_;
     operation = operation_;
     usage_type = usage_type_;
     region = region_;
     actual_usage_amount = actual_usage_amount_;
     forecasted_usage_amount = forecasted_usage_amount_;
     limit = limit_;
     unit_ = unit__;
     description = description_;
     free_tier_type = free_tier_type_;
   }
    : free_tier_usage)

let make_get_free_tier_usage_response ?next_token:(next_token_ : next_page_token option)
    ~free_tier_usages:(free_tier_usages_ : free_tier_usages) () =
  ({ free_tier_usages = free_tier_usages_; next_token = next_token_ }
    : get_free_tier_usage_response)

let make_dimension_values ~key:(key_ : dimension) ~values:(values_ : values)
    ~match_options:(match_options_ : match_options) () =
  ({ key = key_; values = values_; match_options = match_options_ } : dimension_values)

let make_expression ?\#or:(or_ : expressions option) ?and_:(and__ : expressions option)
    ?not:(not_ : expression option) ?dimensions:(dimensions_ : dimension_values option) () =
  ({ \#or = or_; and_ = and__; not = not_; dimensions = dimensions_ } : expression)

let make_get_free_tier_usage_request ?filter:(filter_ : expression option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ filter = filter_; max_results = max_results_; next_token = next_token_ }
    : get_free_tier_usage_request)

let make_get_account_plan_state_response
    ?account_plan_remaining_credits:(account_plan_remaining_credits_ : monetary_amount option)
    ?account_plan_expiration_date:
      (account_plan_expiration_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~account_id:(account_id_ : account_id)
    ~account_plan_type:(account_plan_type_ : account_plan_type)
    ~account_plan_status:(account_plan_status_ : account_plan_status) () =
  ({
     account_id = account_id_;
     account_plan_type = account_plan_type_;
     account_plan_status = account_plan_status_;
     account_plan_remaining_credits = account_plan_remaining_credits_;
     account_plan_expiration_date = account_plan_expiration_date_;
   }
    : get_account_plan_state_response)

let make_get_account_plan_state_request () = (() : unit)

let make_get_account_activity_response
    ?estimated_time_to_complete_in_minutes:
      (estimated_time_to_complete_in_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?started_at:(started_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?completed_at:(completed_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~activity_id:(activity_id_ : activity_id) ~title:(title_ : generic_string)
    ~description:(description_ : generic_string) ~status:(status_ : activity_status)
    ~instructions_url:(instructions_url_ : generic_string) ~reward:(reward_ : activity_reward) () =
  ({
     activity_id = activity_id_;
     title = title_;
     description = description_;
     status = status_;
     instructions_url = instructions_url_;
     reward = reward_;
     estimated_time_to_complete_in_minutes = estimated_time_to_complete_in_minutes_;
     expires_at = expires_at_;
     started_at = started_at_;
     completed_at = completed_at_;
   }
    : get_account_activity_response)

let make_get_account_activity_request ?language_code:(language_code_ : language_code option)
    ~activity_id:(activity_id_ : activity_id) () =
  ({ activity_id = activity_id_; language_code = language_code_ } : get_account_activity_request)
