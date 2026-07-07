open Types

let make_update_subscriber_response () = (() : unit)

let make_notification ?notification_state:(notification_state_ : notification_state option)
    ?threshold_type:(threshold_type_ : threshold_type option)
    ~threshold:(threshold_ : notification_threshold)
    ~comparison_operator:(comparison_operator_ : comparison_operator)
    ~notification_type:(notification_type_ : notification_type) () =
  ({
     notification_state = notification_state_;
     threshold_type = threshold_type_;
     threshold = threshold_;
     comparison_operator = comparison_operator_;
     notification_type = notification_type_;
   }
    : notification)

let make_subscriber ~address:(address_ : subscriber_address)
    ~subscription_type:(subscription_type_ : subscription_type) () =
  ({ address = address_; subscription_type = subscription_type_ } : subscriber)

let make_update_subscriber_request ~new_subscriber:(new_subscriber_ : subscriber)
    ~old_subscriber:(old_subscriber_ : subscriber) ~notification:(notification_ : notification)
    ~budget_name:(budget_name_ : budget_name) ~account_id:(account_id_ : account_id) () =
  ({
     new_subscriber = new_subscriber_;
     old_subscriber = old_subscriber_;
     notification = notification_;
     budget_name = budget_name_;
     account_id = account_id_;
   }
    : update_subscriber_request)

let make_update_notification_response () = (() : unit)

let make_update_notification_request ~new_notification:(new_notification_ : notification)
    ~old_notification:(old_notification_ : notification) ~budget_name:(budget_name_ : budget_name)
    ~account_id:(account_id_ : account_id) () =
  ({
     new_notification = new_notification_;
     old_notification = old_notification_;
     budget_name = budget_name_;
     account_id = account_id_;
   }
    : update_notification_request)

let make_update_budget_response () = (() : unit)

let make_spend ~unit_:(unit__ : unit_value) ~amount:(amount_ : numeric_value) () =
  ({ unit_ = unit__; amount = amount_ } : spend)

let make_cost_types ?use_amortized:(use_amortized_ : nullable_boolean option)
    ?include_discount:(include_discount_ : nullable_boolean option)
    ?include_support:(include_support_ : nullable_boolean option)
    ?include_other_subscription:(include_other_subscription_ : nullable_boolean option)
    ?include_recurring:(include_recurring_ : nullable_boolean option)
    ?include_upfront:(include_upfront_ : nullable_boolean option)
    ?include_credit:(include_credit_ : nullable_boolean option)
    ?include_refund:(include_refund_ : nullable_boolean option)
    ?use_blended:(use_blended_ : nullable_boolean option)
    ?include_subscription:(include_subscription_ : nullable_boolean option)
    ?include_tax:(include_tax_ : nullable_boolean option) () =
  ({
     use_amortized = use_amortized_;
     include_discount = include_discount_;
     include_support = include_support_;
     include_other_subscription = include_other_subscription_;
     include_recurring = include_recurring_;
     include_upfront = include_upfront_;
     include_credit = include_credit_;
     include_refund = include_refund_;
     use_blended = use_blended_;
     include_subscription = include_subscription_;
     include_tax = include_tax_;
   }
    : cost_types)

let make_time_period ?end_:(end__ : generic_timestamp option)
    ?start:(start_ : generic_timestamp option) () =
  ({ end_ = end__; start = start_ } : time_period)

let make_calculated_spend ?forecasted_spend:(forecasted_spend_ : spend option)
    ~actual_spend:(actual_spend_ : spend) () =
  ({ forecasted_spend = forecasted_spend_; actual_spend = actual_spend_ } : calculated_spend)

let make_historical_options
    ?look_back_available_periods:(look_back_available_periods_ : adjustment_period option)
    ~budget_adjustment_period:(budget_adjustment_period_ : adjustment_period) () =
  ({
     look_back_available_periods = look_back_available_periods_;
     budget_adjustment_period = budget_adjustment_period_;
   }
    : historical_options)

let make_auto_adjust_data ?last_auto_adjust_time:(last_auto_adjust_time_ : generic_timestamp option)
    ?historical_options:(historical_options_ : historical_options option)
    ~auto_adjust_type:(auto_adjust_type_ : auto_adjust_type) () =
  ({
     last_auto_adjust_time = last_auto_adjust_time_;
     historical_options = historical_options_;
     auto_adjust_type = auto_adjust_type_;
   }
    : auto_adjust_data)

let make_expression_dimension_values ?match_options:(match_options_ : match_options option)
    ~values:(values_ : values) ~key:(key_ : dimension) () =
  ({ match_options = match_options_; values = values_; key = key_ } : expression_dimension_values)

let make_tag_values ?match_options:(match_options_ : match_options option)
    ?values:(values_ : values option) ?key:(key_ : tag_key option) () =
  ({ match_options = match_options_; values = values_; key = key_ } : tag_values)

let make_cost_category_values ?match_options:(match_options_ : match_options option)
    ?values:(values_ : values option) ?key:(key_ : cost_category_name option) () =
  ({ match_options = match_options_; values = values_; key = key_ } : cost_category_values)

let make_expression ?cost_categories:(cost_categories_ : cost_category_values option)
    ?tags:(tags_ : tag_values option) ?dimensions:(dimensions_ : expression_dimension_values option)
    ?not:(not_ : expression option) ?and_:(and__ : expressions option)
    ?\#or:(or_ : expressions option) () =
  ({
     cost_categories = cost_categories_;
     tags = tags_;
     dimensions = dimensions_;
     not = not_;
     and_ = and__;
     \#or = or_;
   }
    : expression)

let make_health_status ?last_updated_time:(last_updated_time_ : generic_timestamp option)
    ?status_reason:(status_reason_ : health_status_reason option)
    ?status:(status_ : health_status_value option) () =
  ({ last_updated_time = last_updated_time_; status_reason = status_reason_; status = status_ }
    : health_status)

let make_budget ?health_status:(health_status_ : health_status option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?metrics:(metrics_ : metrics option) ?filter_expression:(filter_expression_ : expression option)
    ?auto_adjust_data:(auto_adjust_data_ : auto_adjust_data option)
    ?last_updated_time:(last_updated_time_ : generic_timestamp option)
    ?calculated_spend:(calculated_spend_ : calculated_spend option)
    ?time_period:(time_period_ : time_period option) ?cost_types:(cost_types_ : cost_types option)
    ?cost_filters:(cost_filters_ : cost_filters option)
    ?planned_budget_limits:(planned_budget_limits_ : planned_budget_limits option)
    ?budget_limit:(budget_limit_ : spend option) ~budget_type:(budget_type_ : budget_type)
    ~time_unit:(time_unit_ : time_unit) ~budget_name:(budget_name_ : budget_name) () =
  ({
     health_status = health_status_;
     billing_view_arn = billing_view_arn_;
     metrics = metrics_;
     filter_expression = filter_expression_;
     auto_adjust_data = auto_adjust_data_;
     last_updated_time = last_updated_time_;
     budget_type = budget_type_;
     calculated_spend = calculated_spend_;
     time_period = time_period_;
     time_unit = time_unit_;
     cost_types = cost_types_;
     cost_filters = cost_filters_;
     planned_budget_limits = planned_budget_limits_;
     budget_limit = budget_limit_;
     budget_name = budget_name_;
   }
    : budget)

let make_update_budget_request ~new_budget:(new_budget_ : budget)
    ~account_id:(account_id_ : account_id) () =
  ({ new_budget = new_budget_; account_id = account_id_ } : update_budget_request)

let make_action_threshold ~action_threshold_type:(action_threshold_type_ : threshold_type)
    ~action_threshold_value:(action_threshold_value_ : notification_threshold) () =
  ({
     action_threshold_type = action_threshold_type_;
     action_threshold_value = action_threshold_value_;
   }
    : action_threshold)

let make_iam_action_definition ?users:(users_ : users option) ?groups:(groups_ : groups option)
    ?roles:(roles_ : roles option) ~policy_arn:(policy_arn_ : policy_arn) () =
  ({ users = users_; groups = groups_; roles = roles_; policy_arn = policy_arn_ }
    : iam_action_definition)

let make_scp_action_definition ~target_ids:(target_ids_ : target_ids)
    ~policy_id:(policy_id_ : policy_id) () =
  ({ target_ids = target_ids_; policy_id = policy_id_ } : scp_action_definition)

let make_ssm_action_definition ~instance_ids:(instance_ids_ : instance_ids)
    ~region:(region_ : region) ~action_sub_type:(action_sub_type_ : action_sub_type) () =
  ({ instance_ids = instance_ids_; region = region_; action_sub_type = action_sub_type_ }
    : ssm_action_definition)

let make_definition ?ssm_action_definition:(ssm_action_definition_ : ssm_action_definition option)
    ?scp_action_definition:(scp_action_definition_ : scp_action_definition option)
    ?iam_action_definition:(iam_action_definition_ : iam_action_definition option) () =
  ({
     ssm_action_definition = ssm_action_definition_;
     scp_action_definition = scp_action_definition_;
     iam_action_definition = iam_action_definition_;
   }
    : definition)

let make_action ~subscribers:(subscribers_ : subscribers) ~status:(status_ : action_status)
    ~approval_model:(approval_model_ : approval_model)
    ~execution_role_arn:(execution_role_arn_ : role_arn) ~definition:(definition_ : definition)
    ~action_threshold:(action_threshold_ : action_threshold)
    ~action_type:(action_type_ : action_type)
    ~notification_type:(notification_type_ : notification_type)
    ~budget_name:(budget_name_ : budget_name) ~action_id:(action_id_ : action_id) () =
  ({
     subscribers = subscribers_;
     status = status_;
     approval_model = approval_model_;
     execution_role_arn = execution_role_arn_;
     definition = definition_;
     action_threshold = action_threshold_;
     action_type = action_type_;
     notification_type = notification_type_;
     budget_name = budget_name_;
     action_id = action_id_;
   }
    : action)

let make_update_budget_action_response ~new_action:(new_action_ : action)
    ~old_action:(old_action_ : action) ~budget_name:(budget_name_ : budget_name)
    ~account_id:(account_id_ : account_id) () =
  ({
     new_action = new_action_;
     old_action = old_action_;
     budget_name = budget_name_;
     account_id = account_id_;
   }
    : update_budget_action_response)

let make_update_budget_action_request ?subscribers:(subscribers_ : subscribers option)
    ?approval_model:(approval_model_ : approval_model option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?definition:(definition_ : definition option)
    ?action_threshold:(action_threshold_ : action_threshold option)
    ?notification_type:(notification_type_ : notification_type option)
    ~action_id:(action_id_ : action_id) ~budget_name:(budget_name_ : budget_name)
    ~account_id:(account_id_ : account_id) () =
  ({
     subscribers = subscribers_;
     approval_model = approval_model_;
     execution_role_arn = execution_role_arn_;
     definition = definition_;
     action_threshold = action_threshold_;
     notification_type = notification_type_;
     action_id = action_id_;
     budget_name = budget_name_;
     account_id = account_id_;
   }
    : update_budget_action_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_tag_keys:(resource_tag_keys_ : resource_tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_tag_keys = resource_tag_keys_; resource_ar_n = resource_ar_n_ }
    : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_resource_tag ~value:(value_ : resource_tag_value) ~key:(key_ : resource_tag_key) () =
  ({ value = value_; key = key_ } : resource_tag)

let make_tag_resource_request ~resource_tags:(resource_tags_ : resource_tag_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_tags = resource_tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_notification_with_subscribers ~subscribers:(subscribers_ : subscribers)
    ~notification:(notification_ : notification) () =
  ({ subscribers = subscribers_; notification = notification_ } : notification_with_subscribers)

let make_list_tags_for_resource_response ?resource_tags:(resource_tags_ : resource_tag_list option)
    () =
  ({ resource_tags = resource_tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_execute_budget_action_response ~execution_type:(execution_type_ : execution_type)
    ~action_id:(action_id_ : action_id) ~budget_name:(budget_name_ : budget_name)
    ~account_id:(account_id_ : account_id) () =
  ({
     execution_type = execution_type_;
     action_id = action_id_;
     budget_name = budget_name_;
     account_id = account_id_;
   }
    : execute_budget_action_response)

let make_execute_budget_action_request ~execution_type:(execution_type_ : execution_type)
    ~action_id:(action_id_ : action_id) ~budget_name:(budget_name_ : budget_name)
    ~account_id:(account_id_ : account_id) () =
  ({
     execution_type = execution_type_;
     action_id = action_id_;
     budget_name = budget_name_;
     account_id = account_id_;
   }
    : execute_budget_action_request)

let make_describe_subscribers_for_notification_response
    ?next_token:(next_token_ : generic_string option)
    ?subscribers:(subscribers_ : subscribers option) () =
  ({ next_token = next_token_; subscribers = subscribers_ }
    : describe_subscribers_for_notification_response)

let make_describe_subscribers_for_notification_request
    ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results option) ~notification:(notification_ : notification)
    ~budget_name:(budget_name_ : budget_name) ~account_id:(account_id_ : account_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     notification = notification_;
     budget_name = budget_name_;
     account_id = account_id_;
   }
    : describe_subscribers_for_notification_request)

let make_describe_notifications_for_budget_response
    ?next_token:(next_token_ : generic_string option)
    ?notifications:(notifications_ : notifications option) () =
  ({ next_token = next_token_; notifications = notifications_ }
    : describe_notifications_for_budget_response)

let make_describe_notifications_for_budget_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results option) ~budget_name:(budget_name_ : budget_name)
    ~account_id:(account_id_ : account_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     budget_name = budget_name_;
     account_id = account_id_;
   }
    : describe_notifications_for_budget_request)

let make_describe_budgets_response ?next_token:(next_token_ : generic_string option)
    ?budgets:(budgets_ : budgets option) () =
  ({ next_token = next_token_; budgets = budgets_ } : describe_budgets_response)

let make_describe_budgets_request
    ?show_filter_expression:(show_filter_expression_ : nullable_boolean option)
    ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results_describe_budgets option)
    ~account_id:(account_id_ : account_id) () =
  ({
     show_filter_expression = show_filter_expression_;
     next_token = next_token_;
     max_results = max_results_;
     account_id = account_id_;
   }
    : describe_budgets_request)

let make_describe_budget_response ?budget:(budget_ : budget option) () =
  ({ budget = budget_ } : describe_budget_response)

let make_describe_budget_request
    ?show_filter_expression:(show_filter_expression_ : nullable_boolean option)
    ~budget_name:(budget_name_ : budget_name) ~account_id:(account_id_ : account_id) () =
  ({
     show_filter_expression = show_filter_expression_;
     budget_name = budget_name_;
     account_id = account_id_;
   }
    : describe_budget_request)

let make_budgeted_and_actual_amounts ?time_period:(time_period_ : time_period option)
    ?actual_amount:(actual_amount_ : spend option)
    ?budgeted_amount:(budgeted_amount_ : spend option) () =
  ({
     time_period = time_period_;
     actual_amount = actual_amount_;
     budgeted_amount = budgeted_amount_;
   }
    : budgeted_and_actual_amounts)

let make_budget_performance_history ?metrics:(metrics_ : metrics option)
    ?filter_expression:(filter_expression_ : expression option)
    ?budgeted_and_actual_amounts_list:
      (budgeted_and_actual_amounts_list_ : budgeted_and_actual_amounts_list option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?time_unit:(time_unit_ : time_unit option) ?cost_types:(cost_types_ : cost_types option)
    ?cost_filters:(cost_filters_ : cost_filters option)
    ?budget_type:(budget_type_ : budget_type option)
    ?budget_name:(budget_name_ : budget_name option) () =
  ({
     metrics = metrics_;
     filter_expression = filter_expression_;
     budgeted_and_actual_amounts_list = budgeted_and_actual_amounts_list_;
     billing_view_arn = billing_view_arn_;
     time_unit = time_unit_;
     cost_types = cost_types_;
     cost_filters = cost_filters_;
     budget_type = budget_type_;
     budget_name = budget_name_;
   }
    : budget_performance_history)

let make_describe_budget_performance_history_response
    ?next_token:(next_token_ : generic_string option)
    ?budget_performance_history:(budget_performance_history_ : budget_performance_history option) ()
    =
  ({ next_token = next_token_; budget_performance_history = budget_performance_history_ }
    : describe_budget_performance_history_response)

let make_describe_budget_performance_history_request
    ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results option)
    ?time_period:(time_period_ : time_period option) ~budget_name:(budget_name_ : budget_name)
    ~account_id:(account_id_ : account_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     time_period = time_period_;
     budget_name = budget_name_;
     account_id = account_id_;
   }
    : describe_budget_performance_history_request)

let make_budget_notifications_for_account ?budget_name:(budget_name_ : budget_name option)
    ?notifications:(notifications_ : notifications option) () =
  ({ budget_name = budget_name_; notifications = notifications_ }
    : budget_notifications_for_account)

let make_describe_budget_notifications_for_account_response
    ?next_token:(next_token_ : generic_string option)
    ?budget_notifications_for_account:
      (budget_notifications_for_account_ : budget_notifications_for_account_list option) () =
  ({
     next_token = next_token_;
     budget_notifications_for_account = budget_notifications_for_account_;
   }
    : describe_budget_notifications_for_account_response)

let make_describe_budget_notifications_for_account_request
    ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results_budget_notifications option)
    ~account_id:(account_id_ : account_id) () =
  ({ next_token = next_token_; max_results = max_results_; account_id = account_id_ }
    : describe_budget_notifications_for_account_request)

let make_describe_budget_actions_for_budget_response
    ?next_token:(next_token_ : generic_string option) ~actions:(actions_ : actions) () =
  ({ next_token = next_token_; actions = actions_ } : describe_budget_actions_for_budget_response)

let make_describe_budget_actions_for_budget_request
    ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results option) ~budget_name:(budget_name_ : budget_name)
    ~account_id:(account_id_ : account_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     budget_name = budget_name_;
     account_id = account_id_;
   }
    : describe_budget_actions_for_budget_request)

let make_describe_budget_actions_for_account_response
    ?next_token:(next_token_ : generic_string option) ~actions:(actions_ : actions) () =
  ({ next_token = next_token_; actions = actions_ } : describe_budget_actions_for_account_response)

let make_describe_budget_actions_for_account_request
    ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results option) ~account_id:(account_id_ : account_id) () =
  ({ next_token = next_token_; max_results = max_results_; account_id = account_id_ }
    : describe_budget_actions_for_account_request)

let make_describe_budget_action_response ~action:(action_ : action)
    ~budget_name:(budget_name_ : budget_name) ~account_id:(account_id_ : account_id) () =
  ({ action = action_; budget_name = budget_name_; account_id = account_id_ }
    : describe_budget_action_response)

let make_describe_budget_action_request ~action_id:(action_id_ : action_id)
    ~budget_name:(budget_name_ : budget_name) ~account_id:(account_id_ : account_id) () =
  ({ action_id = action_id_; budget_name = budget_name_; account_id = account_id_ }
    : describe_budget_action_request)

let make_action_history_details ~action:(action_ : action) ~message:(message_ : generic_string) () =
  ({ action = action_; message = message_ } : action_history_details)

let make_action_history ~action_history_details:(action_history_details_ : action_history_details)
    ~event_type:(event_type_ : event_type) ~status:(status_ : action_status)
    ~timestamp:(timestamp_ : generic_timestamp) () =
  ({
     action_history_details = action_history_details_;
     event_type = event_type_;
     status = status_;
     timestamp = timestamp_;
   }
    : action_history)

let make_describe_budget_action_histories_response ?next_token:(next_token_ : generic_string option)
    ~action_histories:(action_histories_ : action_histories) () =
  ({ next_token = next_token_; action_histories = action_histories_ }
    : describe_budget_action_histories_response)

let make_describe_budget_action_histories_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results option)
    ?time_period:(time_period_ : time_period option) ~action_id:(action_id_ : action_id)
    ~budget_name:(budget_name_ : budget_name) ~account_id:(account_id_ : account_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     time_period = time_period_;
     action_id = action_id_;
     budget_name = budget_name_;
     account_id = account_id_;
   }
    : describe_budget_action_histories_request)

let make_delete_subscriber_response () = (() : unit)

let make_delete_subscriber_request ~subscriber:(subscriber_ : subscriber)
    ~notification:(notification_ : notification) ~budget_name:(budget_name_ : budget_name)
    ~account_id:(account_id_ : account_id) () =
  ({
     subscriber = subscriber_;
     notification = notification_;
     budget_name = budget_name_;
     account_id = account_id_;
   }
    : delete_subscriber_request)

let make_delete_notification_response () = (() : unit)

let make_delete_notification_request ~notification:(notification_ : notification)
    ~budget_name:(budget_name_ : budget_name) ~account_id:(account_id_ : account_id) () =
  ({ notification = notification_; budget_name = budget_name_; account_id = account_id_ }
    : delete_notification_request)

let make_delete_budget_response () = (() : unit)

let make_delete_budget_request ~budget_name:(budget_name_ : budget_name)
    ~account_id:(account_id_ : account_id) () =
  ({ budget_name = budget_name_; account_id = account_id_ } : delete_budget_request)

let make_delete_budget_action_response ~action:(action_ : action)
    ~budget_name:(budget_name_ : budget_name) ~account_id:(account_id_ : account_id) () =
  ({ action = action_; budget_name = budget_name_; account_id = account_id_ }
    : delete_budget_action_response)

let make_delete_budget_action_request ~action_id:(action_id_ : action_id)
    ~budget_name:(budget_name_ : budget_name) ~account_id:(account_id_ : account_id) () =
  ({ action_id = action_id_; budget_name = budget_name_; account_id = account_id_ }
    : delete_budget_action_request)

let make_create_subscriber_response () = (() : unit)

let make_create_subscriber_request ~subscriber:(subscriber_ : subscriber)
    ~notification:(notification_ : notification) ~budget_name:(budget_name_ : budget_name)
    ~account_id:(account_id_ : account_id) () =
  ({
     subscriber = subscriber_;
     notification = notification_;
     budget_name = budget_name_;
     account_id = account_id_;
   }
    : create_subscriber_request)

let make_create_notification_response () = (() : unit)

let make_create_notification_request ~subscribers:(subscribers_ : subscribers)
    ~notification:(notification_ : notification) ~budget_name:(budget_name_ : budget_name)
    ~account_id:(account_id_ : account_id) () =
  ({
     subscribers = subscribers_;
     notification = notification_;
     budget_name = budget_name_;
     account_id = account_id_;
   }
    : create_notification_request)

let make_create_budget_response () = (() : unit)

let make_create_budget_request ?resource_tags:(resource_tags_ : resource_tag_list option)
    ?notifications_with_subscribers:
      (notifications_with_subscribers_ : notification_with_subscribers_list option)
    ~budget:(budget_ : budget) ~account_id:(account_id_ : account_id) () =
  ({
     resource_tags = resource_tags_;
     notifications_with_subscribers = notifications_with_subscribers_;
     budget = budget_;
     account_id = account_id_;
   }
    : create_budget_request)

let make_create_budget_action_response ~action_id:(action_id_ : action_id)
    ~budget_name:(budget_name_ : budget_name) ~account_id:(account_id_ : account_id) () =
  ({ action_id = action_id_; budget_name = budget_name_; account_id = account_id_ }
    : create_budget_action_response)

let make_create_budget_action_request ?resource_tags:(resource_tags_ : resource_tag_list option)
    ~subscribers:(subscribers_ : subscribers) ~approval_model:(approval_model_ : approval_model)
    ~execution_role_arn:(execution_role_arn_ : role_arn) ~definition:(definition_ : definition)
    ~action_threshold:(action_threshold_ : action_threshold)
    ~action_type:(action_type_ : action_type)
    ~notification_type:(notification_type_ : notification_type)
    ~budget_name:(budget_name_ : budget_name) ~account_id:(account_id_ : account_id) () =
  ({
     resource_tags = resource_tags_;
     subscribers = subscribers_;
     approval_model = approval_model_;
     execution_role_arn = execution_role_arn_;
     definition = definition_;
     action_threshold = action_threshold_;
     action_type = action_type_;
     notification_type = notification_type_;
     budget_name = budget_name_;
     account_id = account_id_;
   }
    : create_budget_action_request)
