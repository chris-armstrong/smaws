open Types

let make_validation_exception_field ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ message = message_; name = name_ } : validation_exception_field)

let make_action_filter ~values:(values_ : filter_values)
    ~match_option:(match_option_ : match_option) ~key:(key_ : filter_name) () =
  ({ values = values_; match_option = match_option_; key = key_ } : action_filter)

let make_request_filter ?actions:(actions_ : action_filter_list option) () =
  ({ actions = actions_ } : request_filter)

let make_recommended_action
    ?last_updated_time_stamp:(last_updated_time_stamp_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?next_steps:(next_steps_ : next_steps option) ?context:(context_ : context option)
    ?feature:(feature_ : feature option) ?severity:(severity_ : severity option)
    ?account_id:(account_id_ : account_id option) ?type_:(type__ : action_type option)
    ?id:(id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     last_updated_time_stamp = last_updated_time_stamp_;
     next_steps = next_steps_;
     context = context_;
     feature = feature_;
     severity = severity_;
     account_id = account_id_;
     type_ = type__;
     id = id_;
   }
    : recommended_action)

let make_list_recommended_actions_response ?next_token:(next_token_ : next_token option)
    ~recommended_actions:(recommended_actions_ : recommended_actions) () =
  ({ next_token = next_token_; recommended_actions = recommended_actions_ }
    : list_recommended_actions_response)

let make_list_recommended_actions_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filter:(filter_ : request_filter option) () =
  ({ next_token = next_token_; max_results = max_results_; filter = filter_ }
    : list_recommended_actions_request)
