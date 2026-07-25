open Types

let make_validation_exception_field ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ name = name_; message = message_ } : validation_exception_field)

let make_recommended_action ?id:(id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?type_:(type__ : action_type option) ?account_id:(account_id_ : account_id option)
    ?severity:(severity_ : severity option) ?feature:(feature_ : feature option)
    ?context:(context_ : context option) ?next_steps:(next_steps_ : next_steps option)
    ?last_updated_time_stamp:(last_updated_time_stamp_ : Smaws_Lib.Smithy_api.Types.string_ option)
    () =
  ({
     id = id_;
     type_ = type__;
     account_id = account_id_;
     severity = severity_;
     feature = feature_;
     context = context_;
     next_steps = next_steps_;
     last_updated_time_stamp = last_updated_time_stamp_;
   }
    : recommended_action)

let make_list_recommended_actions_response ?next_token:(next_token_ : next_token option)
    ~recommended_actions:(recommended_actions_ : recommended_actions) () =
  ({ recommended_actions = recommended_actions_; next_token = next_token_ }
    : list_recommended_actions_response)

let make_action_filter ~key:(key_ : filter_name) ~match_option:(match_option_ : match_option)
    ~values:(values_ : filter_values) () =
  ({ key = key_; match_option = match_option_; values = values_ } : action_filter)

let make_request_filter ?actions:(actions_ : action_filter_list option) () =
  ({ actions = actions_ } : request_filter)

let make_list_recommended_actions_request ?filter:(filter_ : request_filter option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filter = filter_; max_results = max_results_; next_token = next_token_ }
    : list_recommended_actions_request)
