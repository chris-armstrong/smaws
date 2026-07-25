open Types

let make_update_subscriber_response () = (() : unit)

let make_subscriber ~subscription_type:(subscription_type_ : subscription_type)
    ~address:(address_ : subscriber_address) () =
  ({ subscription_type = subscription_type_; address = address_ } : subscriber)

let make_notification ?threshold_type:(threshold_type_ : threshold_type option)
    ?notification_state:(notification_state_ : notification_state option)
    ~notification_type:(notification_type_ : notification_type)
    ~comparison_operator:(comparison_operator_ : comparison_operator)
    ~threshold:(threshold_ : notification_threshold) () =
  ({
     notification_type = notification_type_;
     comparison_operator = comparison_operator_;
     threshold = threshold_;
     threshold_type = threshold_type_;
     notification_state = notification_state_;
   }
    : notification)

let make_update_subscriber_request ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~notification:(notification_ : notification)
    ~old_subscriber:(old_subscriber_ : subscriber) ~new_subscriber:(new_subscriber_ : subscriber) ()
    =
  ({
     account_id = account_id_;
     budget_name = budget_name_;
     notification = notification_;
     old_subscriber = old_subscriber_;
     new_subscriber = new_subscriber_;
   }
    : update_subscriber_request)

let make_update_notification_response () = (() : unit)

let make_update_notification_request ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~old_notification:(old_notification_ : notification)
    ~new_notification:(new_notification_ : notification) () =
  ({
     account_id = account_id_;
     budget_name = budget_name_;
     old_notification = old_notification_;
     new_notification = new_notification_;
   }
    : update_notification_request)

let make_ssm_action_definition ~action_sub_type:(action_sub_type_ : action_sub_type)
    ~region:(region_ : region) ~instance_ids:(instance_ids_ : instance_ids) () =
  ({ action_sub_type = action_sub_type_; region = region_; instance_ids = instance_ids_ }
    : ssm_action_definition)

let make_scp_action_definition ~policy_id:(policy_id_ : policy_id)
    ~target_ids:(target_ids_ : target_ids) () =
  ({ policy_id = policy_id_; target_ids = target_ids_ } : scp_action_definition)

let make_iam_action_definition ?roles:(roles_ : roles option) ?groups:(groups_ : groups option)
    ?users:(users_ : users option) ~policy_arn:(policy_arn_ : policy_arn) () =
  ({ policy_arn = policy_arn_; roles = roles_; groups = groups_; users = users_ }
    : iam_action_definition)

let make_definition ?iam_action_definition:(iam_action_definition_ : iam_action_definition option)
    ?scp_action_definition:(scp_action_definition_ : scp_action_definition option)
    ?ssm_action_definition:(ssm_action_definition_ : ssm_action_definition option) () =
  ({
     iam_action_definition = iam_action_definition_;
     scp_action_definition = scp_action_definition_;
     ssm_action_definition = ssm_action_definition_;
   }
    : definition)

let make_action_threshold ~action_threshold_value:(action_threshold_value_ : notification_threshold)
    ~action_threshold_type:(action_threshold_type_ : threshold_type) () =
  ({
     action_threshold_value = action_threshold_value_;
     action_threshold_type = action_threshold_type_;
   }
    : action_threshold)

let make_action ~action_id:(action_id_ : action_id) ~budget_name:(budget_name_ : budget_name)
    ~notification_type:(notification_type_ : notification_type)
    ~action_type:(action_type_ : action_type)
    ~action_threshold:(action_threshold_ : action_threshold) ~definition:(definition_ : definition)
    ~execution_role_arn:(execution_role_arn_ : role_arn)
    ~approval_model:(approval_model_ : approval_model) ~status:(status_ : action_status)
    ~subscribers:(subscribers_ : subscribers) () =
  ({
     action_id = action_id_;
     budget_name = budget_name_;
     notification_type = notification_type_;
     action_type = action_type_;
     action_threshold = action_threshold_;
     definition = definition_;
     execution_role_arn = execution_role_arn_;
     approval_model = approval_model_;
     status = status_;
     subscribers = subscribers_;
   }
    : action)

let make_update_budget_action_response ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~old_action:(old_action_ : action)
    ~new_action:(new_action_ : action) () =
  ({
     account_id = account_id_;
     budget_name = budget_name_;
     old_action = old_action_;
     new_action = new_action_;
   }
    : update_budget_action_response)

let make_update_budget_action_request
    ?notification_type:(notification_type_ : notification_type option)
    ?action_threshold:(action_threshold_ : action_threshold option)
    ?definition:(definition_ : definition option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?approval_model:(approval_model_ : approval_model option)
    ?subscribers:(subscribers_ : subscribers option) ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~action_id:(action_id_ : action_id) () =
  ({
     account_id = account_id_;
     budget_name = budget_name_;
     action_id = action_id_;
     notification_type = notification_type_;
     action_threshold = action_threshold_;
     definition = definition_;
     execution_role_arn = execution_role_arn_;
     approval_model = approval_model_;
     subscribers = subscribers_;
   }
    : update_budget_action_request)

let make_update_budget_response () = (() : unit)

let make_health_status ?status:(status_ : health_status_value option)
    ?status_reason:(status_reason_ : health_status_reason option)
    ?last_updated_time:(last_updated_time_ : generic_timestamp option) () =
  ({ status = status_; status_reason = status_reason_; last_updated_time = last_updated_time_ }
    : health_status)

let make_cost_category_values ?key:(key_ : cost_category_name option)
    ?values:(values_ : values option) ?match_options:(match_options_ : match_options option) () =
  ({ key = key_; values = values_; match_options = match_options_ } : cost_category_values)

let make_tag_values ?key:(key_ : tag_key option) ?values:(values_ : values option)
    ?match_options:(match_options_ : match_options option) () =
  ({ key = key_; values = values_; match_options = match_options_ } : tag_values)

let make_expression_dimension_values ?match_options:(match_options_ : match_options option)
    ~key:(key_ : dimension) ~values:(values_ : values) () =
  ({ key = key_; values = values_; match_options = match_options_ } : expression_dimension_values)

let make_expression ?\#or:(or_ : expressions option) ?and_:(and__ : expressions option)
    ?not:(not_ : expression option) ?dimensions:(dimensions_ : expression_dimension_values option)
    ?tags:(tags_ : tag_values option)
    ?cost_categories:(cost_categories_ : cost_category_values option) () =
  ({
     \#or = or_;
     and_ = and__;
     not = not_;
     dimensions = dimensions_;
     tags = tags_;
     cost_categories = cost_categories_;
   }
    : expression)

let make_historical_options
    ?look_back_available_periods:(look_back_available_periods_ : adjustment_period option)
    ~budget_adjustment_period:(budget_adjustment_period_ : adjustment_period) () =
  ({
     budget_adjustment_period = budget_adjustment_period_;
     look_back_available_periods = look_back_available_periods_;
   }
    : historical_options)

let make_auto_adjust_data ?historical_options:(historical_options_ : historical_options option)
    ?last_auto_adjust_time:(last_auto_adjust_time_ : generic_timestamp option)
    ~auto_adjust_type:(auto_adjust_type_ : auto_adjust_type) () =
  ({
     auto_adjust_type = auto_adjust_type_;
     historical_options = historical_options_;
     last_auto_adjust_time = last_auto_adjust_time_;
   }
    : auto_adjust_data)

let make_spend ~amount:(amount_ : numeric_value) ~unit_:(unit__ : unit_value) () =
  ({ amount = amount_; unit_ = unit__ } : spend)

let make_calculated_spend ?forecasted_spend:(forecasted_spend_ : spend option)
    ~actual_spend:(actual_spend_ : spend) () =
  ({ actual_spend = actual_spend_; forecasted_spend = forecasted_spend_ } : calculated_spend)

let make_time_period ?start:(start_ : generic_timestamp option)
    ?end_:(end__ : generic_timestamp option) () =
  ({ start = start_; end_ = end__ } : time_period)

let make_cost_types ?include_tax:(include_tax_ : nullable_boolean option)
    ?include_subscription:(include_subscription_ : nullable_boolean option)
    ?use_blended:(use_blended_ : nullable_boolean option)
    ?include_refund:(include_refund_ : nullable_boolean option)
    ?include_credit:(include_credit_ : nullable_boolean option)
    ?include_upfront:(include_upfront_ : nullable_boolean option)
    ?include_recurring:(include_recurring_ : nullable_boolean option)
    ?include_other_subscription:(include_other_subscription_ : nullable_boolean option)
    ?include_support:(include_support_ : nullable_boolean option)
    ?include_discount:(include_discount_ : nullable_boolean option)
    ?use_amortized:(use_amortized_ : nullable_boolean option) () =
  ({
     include_tax = include_tax_;
     include_subscription = include_subscription_;
     use_blended = use_blended_;
     include_refund = include_refund_;
     include_credit = include_credit_;
     include_upfront = include_upfront_;
     include_recurring = include_recurring_;
     include_other_subscription = include_other_subscription_;
     include_support = include_support_;
     include_discount = include_discount_;
     use_amortized = use_amortized_;
   }
    : cost_types)

let make_budget ?budget_limit:(budget_limit_ : spend option)
    ?planned_budget_limits:(planned_budget_limits_ : planned_budget_limits option)
    ?cost_filters:(cost_filters_ : cost_filters option)
    ?cost_types:(cost_types_ : cost_types option) ?time_period:(time_period_ : time_period option)
    ?calculated_spend:(calculated_spend_ : calculated_spend option)
    ?last_updated_time:(last_updated_time_ : generic_timestamp option)
    ?auto_adjust_data:(auto_adjust_data_ : auto_adjust_data option)
    ?filter_expression:(filter_expression_ : expression option) ?metrics:(metrics_ : metrics option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?health_status:(health_status_ : health_status option) ~budget_name:(budget_name_ : budget_name)
    ~time_unit:(time_unit_ : time_unit) ~budget_type:(budget_type_ : budget_type) () =
  ({
     budget_name = budget_name_;
     budget_limit = budget_limit_;
     planned_budget_limits = planned_budget_limits_;
     cost_filters = cost_filters_;
     cost_types = cost_types_;
     time_unit = time_unit_;
     time_period = time_period_;
     calculated_spend = calculated_spend_;
     budget_type = budget_type_;
     last_updated_time = last_updated_time_;
     auto_adjust_data = auto_adjust_data_;
     filter_expression = filter_expression_;
     metrics = metrics_;
     billing_view_arn = billing_view_arn_;
     health_status = health_status_;
   }
    : budget)

let make_update_budget_request ~account_id:(account_id_ : account_id)
    ~new_budget:(new_budget_ : budget) () =
  ({ account_id = account_id_; new_budget = new_budget_ } : update_budget_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~resource_tag_keys:(resource_tag_keys_ : resource_tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; resource_tag_keys = resource_tag_keys_ }
    : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_resource_tag ~key:(key_ : resource_tag_key) ~value:(value_ : resource_tag_value) () =
  ({ key = key_; value = value_ } : resource_tag)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~resource_tags:(resource_tags_ : resource_tag_list) () =
  ({ resource_ar_n = resource_ar_n_; resource_tags = resource_tags_ } : tag_resource_request)

let make_list_tags_for_resource_response ?resource_tags:(resource_tags_ : resource_tag_list option)
    () =
  ({ resource_tags = resource_tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_execute_budget_action_response ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~action_id:(action_id_ : action_id)
    ~execution_type:(execution_type_ : execution_type) () =
  ({
     account_id = account_id_;
     budget_name = budget_name_;
     action_id = action_id_;
     execution_type = execution_type_;
   }
    : execute_budget_action_response)

let make_execute_budget_action_request ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~action_id:(action_id_ : action_id)
    ~execution_type:(execution_type_ : execution_type) () =
  ({
     account_id = account_id_;
     budget_name = budget_name_;
     action_id = action_id_;
     execution_type = execution_type_;
   }
    : execute_budget_action_request)

let make_describe_subscribers_for_notification_response
    ?subscribers:(subscribers_ : subscribers option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ subscribers = subscribers_; next_token = next_token_ }
    : describe_subscribers_for_notification_response)

let make_describe_subscribers_for_notification_request
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : generic_string option) ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~notification:(notification_ : notification) () =
  ({
     account_id = account_id_;
     budget_name = budget_name_;
     notification = notification_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_subscribers_for_notification_request)

let make_describe_notifications_for_budget_response
    ?notifications:(notifications_ : notifications option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ notifications = notifications_; next_token = next_token_ }
    : describe_notifications_for_budget_response)

let make_describe_notifications_for_budget_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : generic_string option) ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) () =
  ({
     account_id = account_id_;
     budget_name = budget_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_notifications_for_budget_request)

let make_describe_budgets_response ?budgets:(budgets_ : budgets option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ budgets = budgets_; next_token = next_token_ } : describe_budgets_response)

let make_describe_budgets_request ?max_results:(max_results_ : max_results_describe_budgets option)
    ?next_token:(next_token_ : generic_string option)
    ?show_filter_expression:(show_filter_expression_ : nullable_boolean option)
    ~account_id:(account_id_ : account_id) () =
  ({
     account_id = account_id_;
     max_results = max_results_;
     next_token = next_token_;
     show_filter_expression = show_filter_expression_;
   }
    : describe_budgets_request)

let make_budgeted_and_actual_amounts ?budgeted_amount:(budgeted_amount_ : spend option)
    ?actual_amount:(actual_amount_ : spend option) ?time_period:(time_period_ : time_period option)
    () =
  ({
     budgeted_amount = budgeted_amount_;
     actual_amount = actual_amount_;
     time_period = time_period_;
   }
    : budgeted_and_actual_amounts)

let make_budget_performance_history ?budget_name:(budget_name_ : budget_name option)
    ?budget_type:(budget_type_ : budget_type option)
    ?cost_filters:(cost_filters_ : cost_filters option)
    ?cost_types:(cost_types_ : cost_types option) ?time_unit:(time_unit_ : time_unit option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?budgeted_and_actual_amounts_list:
      (budgeted_and_actual_amounts_list_ : budgeted_and_actual_amounts_list option)
    ?filter_expression:(filter_expression_ : expression option) ?metrics:(metrics_ : metrics option)
    () =
  ({
     budget_name = budget_name_;
     budget_type = budget_type_;
     cost_filters = cost_filters_;
     cost_types = cost_types_;
     time_unit = time_unit_;
     billing_view_arn = billing_view_arn_;
     budgeted_and_actual_amounts_list = budgeted_and_actual_amounts_list_;
     filter_expression = filter_expression_;
     metrics = metrics_;
   }
    : budget_performance_history)

let make_describe_budget_performance_history_response
    ?budget_performance_history:(budget_performance_history_ : budget_performance_history option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ budget_performance_history = budget_performance_history_; next_token = next_token_ }
    : describe_budget_performance_history_response)

let make_describe_budget_performance_history_request
    ?time_period:(time_period_ : time_period option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : generic_string option) ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) () =
  ({
     account_id = account_id_;
     budget_name = budget_name_;
     time_period = time_period_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_budget_performance_history_request)

let make_budget_notifications_for_account ?notifications:(notifications_ : notifications option)
    ?budget_name:(budget_name_ : budget_name option) () =
  ({ notifications = notifications_; budget_name = budget_name_ }
    : budget_notifications_for_account)

let make_describe_budget_notifications_for_account_response
    ?budget_notifications_for_account:
      (budget_notifications_for_account_ : budget_notifications_for_account_list option)
    ?next_token:(next_token_ : generic_string option) () =
  ({
     budget_notifications_for_account = budget_notifications_for_account_;
     next_token = next_token_;
   }
    : describe_budget_notifications_for_account_response)

let make_describe_budget_notifications_for_account_request
    ?max_results:(max_results_ : max_results_budget_notifications option)
    ?next_token:(next_token_ : generic_string option) ~account_id:(account_id_ : account_id) () =
  ({ account_id = account_id_; max_results = max_results_; next_token = next_token_ }
    : describe_budget_notifications_for_account_request)

let make_describe_budget_actions_for_budget_response
    ?next_token:(next_token_ : generic_string option) ~actions:(actions_ : actions) () =
  ({ actions = actions_; next_token = next_token_ } : describe_budget_actions_for_budget_response)

let make_describe_budget_actions_for_budget_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : generic_string option) ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) () =
  ({
     account_id = account_id_;
     budget_name = budget_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_budget_actions_for_budget_request)

let make_describe_budget_actions_for_account_response
    ?next_token:(next_token_ : generic_string option) ~actions:(actions_ : actions) () =
  ({ actions = actions_; next_token = next_token_ } : describe_budget_actions_for_account_response)

let make_describe_budget_actions_for_account_request
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : generic_string option) ~account_id:(account_id_ : account_id) () =
  ({ account_id = account_id_; max_results = max_results_; next_token = next_token_ }
    : describe_budget_actions_for_account_request)

let make_action_history_details ~message:(message_ : generic_string) ~action:(action_ : action) () =
  ({ message = message_; action = action_ } : action_history_details)

let make_action_history ~timestamp:(timestamp_ : generic_timestamp)
    ~status:(status_ : action_status) ~event_type:(event_type_ : event_type)
    ~action_history_details:(action_history_details_ : action_history_details) () =
  ({
     timestamp = timestamp_;
     status = status_;
     event_type = event_type_;
     action_history_details = action_history_details_;
   }
    : action_history)

let make_describe_budget_action_histories_response ?next_token:(next_token_ : generic_string option)
    ~action_histories:(action_histories_ : action_histories) () =
  ({ action_histories = action_histories_; next_token = next_token_ }
    : describe_budget_action_histories_response)

let make_describe_budget_action_histories_request ?time_period:(time_period_ : time_period option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : generic_string option) ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~action_id:(action_id_ : action_id) () =
  ({
     account_id = account_id_;
     budget_name = budget_name_;
     action_id = action_id_;
     time_period = time_period_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_budget_action_histories_request)

let make_describe_budget_action_response ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~action:(action_ : action) () =
  ({ account_id = account_id_; budget_name = budget_name_; action = action_ }
    : describe_budget_action_response)

let make_describe_budget_action_request ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~action_id:(action_id_ : action_id) () =
  ({ account_id = account_id_; budget_name = budget_name_; action_id = action_id_ }
    : describe_budget_action_request)

let make_describe_budget_response ?budget:(budget_ : budget option) () =
  ({ budget = budget_ } : describe_budget_response)

let make_describe_budget_request
    ?show_filter_expression:(show_filter_expression_ : nullable_boolean option)
    ~account_id:(account_id_ : account_id) ~budget_name:(budget_name_ : budget_name) () =
  ({
     account_id = account_id_;
     budget_name = budget_name_;
     show_filter_expression = show_filter_expression_;
   }
    : describe_budget_request)

let make_delete_subscriber_response () = (() : unit)

let make_delete_subscriber_request ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~notification:(notification_ : notification)
    ~subscriber:(subscriber_ : subscriber) () =
  ({
     account_id = account_id_;
     budget_name = budget_name_;
     notification = notification_;
     subscriber = subscriber_;
   }
    : delete_subscriber_request)

let make_delete_notification_response () = (() : unit)

let make_delete_notification_request ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~notification:(notification_ : notification) () =
  ({ account_id = account_id_; budget_name = budget_name_; notification = notification_ }
    : delete_notification_request)

let make_delete_budget_action_response ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~action:(action_ : action) () =
  ({ account_id = account_id_; budget_name = budget_name_; action = action_ }
    : delete_budget_action_response)

let make_delete_budget_action_request ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~action_id:(action_id_ : action_id) () =
  ({ account_id = account_id_; budget_name = budget_name_; action_id = action_id_ }
    : delete_budget_action_request)

let make_delete_budget_response () = (() : unit)

let make_delete_budget_request ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) () =
  ({ account_id = account_id_; budget_name = budget_name_ } : delete_budget_request)

let make_create_subscriber_response () = (() : unit)

let make_create_subscriber_request ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~notification:(notification_ : notification)
    ~subscriber:(subscriber_ : subscriber) () =
  ({
     account_id = account_id_;
     budget_name = budget_name_;
     notification = notification_;
     subscriber = subscriber_;
   }
    : create_subscriber_request)

let make_create_notification_response () = (() : unit)

let make_create_notification_request ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~notification:(notification_ : notification)
    ~subscribers:(subscribers_ : subscribers) () =
  ({
     account_id = account_id_;
     budget_name = budget_name_;
     notification = notification_;
     subscribers = subscribers_;
   }
    : create_notification_request)

let make_create_budget_action_response ~account_id:(account_id_ : account_id)
    ~budget_name:(budget_name_ : budget_name) ~action_id:(action_id_ : action_id) () =
  ({ account_id = account_id_; budget_name = budget_name_; action_id = action_id_ }
    : create_budget_action_response)

let make_create_budget_action_request ?resource_tags:(resource_tags_ : resource_tag_list option)
    ~account_id:(account_id_ : account_id) ~budget_name:(budget_name_ : budget_name)
    ~notification_type:(notification_type_ : notification_type)
    ~action_type:(action_type_ : action_type)
    ~action_threshold:(action_threshold_ : action_threshold) ~definition:(definition_ : definition)
    ~execution_role_arn:(execution_role_arn_ : role_arn)
    ~approval_model:(approval_model_ : approval_model) ~subscribers:(subscribers_ : subscribers) ()
    =
  ({
     account_id = account_id_;
     budget_name = budget_name_;
     notification_type = notification_type_;
     action_type = action_type_;
     action_threshold = action_threshold_;
     definition = definition_;
     execution_role_arn = execution_role_arn_;
     approval_model = approval_model_;
     subscribers = subscribers_;
     resource_tags = resource_tags_;
   }
    : create_budget_action_request)

let make_create_budget_response () = (() : unit)

let make_notification_with_subscribers ~notification:(notification_ : notification)
    ~subscribers:(subscribers_ : subscribers) () =
  ({ notification = notification_; subscribers = subscribers_ } : notification_with_subscribers)

let make_create_budget_request
    ?notifications_with_subscribers:
      (notifications_with_subscribers_ : notification_with_subscribers_list option)
    ?resource_tags:(resource_tags_ : resource_tag_list option)
    ~account_id:(account_id_ : account_id) ~budget:(budget_ : budget) () =
  ({
     account_id = account_id_;
     budget = budget_;
     notifications_with_subscribers = notifications_with_subscribers_;
     resource_tags = resource_tags_;
   }
    : create_budget_request)
