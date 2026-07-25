open Types

val make_update_subscriber_response : unit -> unit

val make_subscriber :
  subscription_type:subscription_type -> address:subscriber_address -> unit -> subscriber

val make_notification :
  ?threshold_type:threshold_type ->
  ?notification_state:notification_state ->
  notification_type:notification_type ->
  comparison_operator:comparison_operator ->
  threshold:notification_threshold ->
  unit ->
  notification

val make_update_subscriber_request :
  account_id:account_id ->
  budget_name:budget_name ->
  notification:notification ->
  old_subscriber:subscriber ->
  new_subscriber:subscriber ->
  unit ->
  update_subscriber_request

val make_update_notification_response : unit -> unit

val make_update_notification_request :
  account_id:account_id ->
  budget_name:budget_name ->
  old_notification:notification ->
  new_notification:notification ->
  unit ->
  update_notification_request

val make_ssm_action_definition :
  action_sub_type:action_sub_type ->
  region:region ->
  instance_ids:instance_ids ->
  unit ->
  ssm_action_definition

val make_scp_action_definition :
  policy_id:policy_id -> target_ids:target_ids -> unit -> scp_action_definition

val make_iam_action_definition :
  ?roles:roles ->
  ?groups:groups ->
  ?users:users ->
  policy_arn:policy_arn ->
  unit ->
  iam_action_definition

val make_definition :
  ?iam_action_definition:iam_action_definition ->
  ?scp_action_definition:scp_action_definition ->
  ?ssm_action_definition:ssm_action_definition ->
  unit ->
  definition

val make_action_threshold :
  action_threshold_value:notification_threshold ->
  action_threshold_type:threshold_type ->
  unit ->
  action_threshold

val make_action :
  action_id:action_id ->
  budget_name:budget_name ->
  notification_type:notification_type ->
  action_type:action_type ->
  action_threshold:action_threshold ->
  definition:definition ->
  execution_role_arn:role_arn ->
  approval_model:approval_model ->
  status:action_status ->
  subscribers:subscribers ->
  unit ->
  action

val make_update_budget_action_response :
  account_id:account_id ->
  budget_name:budget_name ->
  old_action:action ->
  new_action:action ->
  unit ->
  update_budget_action_response

val make_update_budget_action_request :
  ?notification_type:notification_type ->
  ?action_threshold:action_threshold ->
  ?definition:definition ->
  ?execution_role_arn:role_arn ->
  ?approval_model:approval_model ->
  ?subscribers:subscribers ->
  account_id:account_id ->
  budget_name:budget_name ->
  action_id:action_id ->
  unit ->
  update_budget_action_request

val make_update_budget_response : unit -> unit

val make_health_status :
  ?status:health_status_value ->
  ?status_reason:health_status_reason ->
  ?last_updated_time:generic_timestamp ->
  unit ->
  health_status

val make_cost_category_values :
  ?key:cost_category_name ->
  ?values:values ->
  ?match_options:match_options ->
  unit ->
  cost_category_values

val make_tag_values :
  ?key:tag_key -> ?values:values -> ?match_options:match_options -> unit -> tag_values

val make_expression_dimension_values :
  ?match_options:match_options ->
  key:dimension ->
  values:values ->
  unit ->
  expression_dimension_values

val make_expression :
  ?\#or:expressions ->
  ?and_:expressions ->
  ?not:expression ->
  ?dimensions:expression_dimension_values ->
  ?tags:tag_values ->
  ?cost_categories:cost_category_values ->
  unit ->
  expression

val make_historical_options :
  ?look_back_available_periods:adjustment_period ->
  budget_adjustment_period:adjustment_period ->
  unit ->
  historical_options

val make_auto_adjust_data :
  ?historical_options:historical_options ->
  ?last_auto_adjust_time:generic_timestamp ->
  auto_adjust_type:auto_adjust_type ->
  unit ->
  auto_adjust_data

val make_spend : amount:numeric_value -> unit_:unit_value -> unit -> spend

val make_calculated_spend :
  ?forecasted_spend:spend -> actual_spend:spend -> unit -> calculated_spend

val make_time_period : ?start:generic_timestamp -> ?end_:generic_timestamp -> unit -> time_period

val make_cost_types :
  ?include_tax:nullable_boolean ->
  ?include_subscription:nullable_boolean ->
  ?use_blended:nullable_boolean ->
  ?include_refund:nullable_boolean ->
  ?include_credit:nullable_boolean ->
  ?include_upfront:nullable_boolean ->
  ?include_recurring:nullable_boolean ->
  ?include_other_subscription:nullable_boolean ->
  ?include_support:nullable_boolean ->
  ?include_discount:nullable_boolean ->
  ?use_amortized:nullable_boolean ->
  unit ->
  cost_types

val make_budget :
  ?budget_limit:spend ->
  ?planned_budget_limits:planned_budget_limits ->
  ?cost_filters:cost_filters ->
  ?cost_types:cost_types ->
  ?time_period:time_period ->
  ?calculated_spend:calculated_spend ->
  ?last_updated_time:generic_timestamp ->
  ?auto_adjust_data:auto_adjust_data ->
  ?filter_expression:expression ->
  ?metrics:metrics ->
  ?billing_view_arn:billing_view_arn ->
  ?health_status:health_status ->
  budget_name:budget_name ->
  time_unit:time_unit ->
  budget_type:budget_type ->
  unit ->
  budget

val make_update_budget_request :
  account_id:account_id -> new_budget:budget -> unit -> update_budget_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name ->
  resource_tag_keys:resource_tag_key_list ->
  unit ->
  untag_resource_request

val make_tag_resource_response : unit -> unit
val make_resource_tag : key:resource_tag_key -> value:resource_tag_value -> unit -> resource_tag

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name ->
  resource_tags:resource_tag_list ->
  unit ->
  tag_resource_request

val make_list_tags_for_resource_response :
  ?resource_tags:resource_tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_execute_budget_action_response :
  account_id:account_id ->
  budget_name:budget_name ->
  action_id:action_id ->
  execution_type:execution_type ->
  unit ->
  execute_budget_action_response

val make_execute_budget_action_request :
  account_id:account_id ->
  budget_name:budget_name ->
  action_id:action_id ->
  execution_type:execution_type ->
  unit ->
  execute_budget_action_request

val make_describe_subscribers_for_notification_response :
  ?subscribers:subscribers ->
  ?next_token:generic_string ->
  unit ->
  describe_subscribers_for_notification_response

val make_describe_subscribers_for_notification_request :
  ?max_results:max_results ->
  ?next_token:generic_string ->
  account_id:account_id ->
  budget_name:budget_name ->
  notification:notification ->
  unit ->
  describe_subscribers_for_notification_request

val make_describe_notifications_for_budget_response :
  ?notifications:notifications ->
  ?next_token:generic_string ->
  unit ->
  describe_notifications_for_budget_response

val make_describe_notifications_for_budget_request :
  ?max_results:max_results ->
  ?next_token:generic_string ->
  account_id:account_id ->
  budget_name:budget_name ->
  unit ->
  describe_notifications_for_budget_request

val make_describe_budgets_response :
  ?budgets:budgets -> ?next_token:generic_string -> unit -> describe_budgets_response

val make_describe_budgets_request :
  ?max_results:max_results_describe_budgets ->
  ?next_token:generic_string ->
  ?show_filter_expression:nullable_boolean ->
  account_id:account_id ->
  unit ->
  describe_budgets_request

val make_budgeted_and_actual_amounts :
  ?budgeted_amount:spend ->
  ?actual_amount:spend ->
  ?time_period:time_period ->
  unit ->
  budgeted_and_actual_amounts

val make_budget_performance_history :
  ?budget_name:budget_name ->
  ?budget_type:budget_type ->
  ?cost_filters:cost_filters ->
  ?cost_types:cost_types ->
  ?time_unit:time_unit ->
  ?billing_view_arn:billing_view_arn ->
  ?budgeted_and_actual_amounts_list:budgeted_and_actual_amounts_list ->
  ?filter_expression:expression ->
  ?metrics:metrics ->
  unit ->
  budget_performance_history

val make_describe_budget_performance_history_response :
  ?budget_performance_history:budget_performance_history ->
  ?next_token:generic_string ->
  unit ->
  describe_budget_performance_history_response

val make_describe_budget_performance_history_request :
  ?time_period:time_period ->
  ?max_results:max_results ->
  ?next_token:generic_string ->
  account_id:account_id ->
  budget_name:budget_name ->
  unit ->
  describe_budget_performance_history_request

val make_budget_notifications_for_account :
  ?notifications:notifications ->
  ?budget_name:budget_name ->
  unit ->
  budget_notifications_for_account

val make_describe_budget_notifications_for_account_response :
  ?budget_notifications_for_account:budget_notifications_for_account_list ->
  ?next_token:generic_string ->
  unit ->
  describe_budget_notifications_for_account_response

val make_describe_budget_notifications_for_account_request :
  ?max_results:max_results_budget_notifications ->
  ?next_token:generic_string ->
  account_id:account_id ->
  unit ->
  describe_budget_notifications_for_account_request

val make_describe_budget_actions_for_budget_response :
  ?next_token:generic_string ->
  actions:actions ->
  unit ->
  describe_budget_actions_for_budget_response

val make_describe_budget_actions_for_budget_request :
  ?max_results:max_results ->
  ?next_token:generic_string ->
  account_id:account_id ->
  budget_name:budget_name ->
  unit ->
  describe_budget_actions_for_budget_request

val make_describe_budget_actions_for_account_response :
  ?next_token:generic_string ->
  actions:actions ->
  unit ->
  describe_budget_actions_for_account_response

val make_describe_budget_actions_for_account_request :
  ?max_results:max_results ->
  ?next_token:generic_string ->
  account_id:account_id ->
  unit ->
  describe_budget_actions_for_account_request

val make_action_history_details :
  message:generic_string -> action:action -> unit -> action_history_details

val make_action_history :
  timestamp:generic_timestamp ->
  status:action_status ->
  event_type:event_type ->
  action_history_details:action_history_details ->
  unit ->
  action_history

val make_describe_budget_action_histories_response :
  ?next_token:generic_string ->
  action_histories:action_histories ->
  unit ->
  describe_budget_action_histories_response

val make_describe_budget_action_histories_request :
  ?time_period:time_period ->
  ?max_results:max_results ->
  ?next_token:generic_string ->
  account_id:account_id ->
  budget_name:budget_name ->
  action_id:action_id ->
  unit ->
  describe_budget_action_histories_request

val make_describe_budget_action_response :
  account_id:account_id ->
  budget_name:budget_name ->
  action:action ->
  unit ->
  describe_budget_action_response

val make_describe_budget_action_request :
  account_id:account_id ->
  budget_name:budget_name ->
  action_id:action_id ->
  unit ->
  describe_budget_action_request

val make_describe_budget_response : ?budget:budget -> unit -> describe_budget_response

val make_describe_budget_request :
  ?show_filter_expression:nullable_boolean ->
  account_id:account_id ->
  budget_name:budget_name ->
  unit ->
  describe_budget_request

val make_delete_subscriber_response : unit -> unit

val make_delete_subscriber_request :
  account_id:account_id ->
  budget_name:budget_name ->
  notification:notification ->
  subscriber:subscriber ->
  unit ->
  delete_subscriber_request

val make_delete_notification_response : unit -> unit

val make_delete_notification_request :
  account_id:account_id ->
  budget_name:budget_name ->
  notification:notification ->
  unit ->
  delete_notification_request

val make_delete_budget_action_response :
  account_id:account_id ->
  budget_name:budget_name ->
  action:action ->
  unit ->
  delete_budget_action_response

val make_delete_budget_action_request :
  account_id:account_id ->
  budget_name:budget_name ->
  action_id:action_id ->
  unit ->
  delete_budget_action_request

val make_delete_budget_response : unit -> unit

val make_delete_budget_request :
  account_id:account_id -> budget_name:budget_name -> unit -> delete_budget_request

val make_create_subscriber_response : unit -> unit

val make_create_subscriber_request :
  account_id:account_id ->
  budget_name:budget_name ->
  notification:notification ->
  subscriber:subscriber ->
  unit ->
  create_subscriber_request

val make_create_notification_response : unit -> unit

val make_create_notification_request :
  account_id:account_id ->
  budget_name:budget_name ->
  notification:notification ->
  subscribers:subscribers ->
  unit ->
  create_notification_request

val make_create_budget_action_response :
  account_id:account_id ->
  budget_name:budget_name ->
  action_id:action_id ->
  unit ->
  create_budget_action_response

val make_create_budget_action_request :
  ?resource_tags:resource_tag_list ->
  account_id:account_id ->
  budget_name:budget_name ->
  notification_type:notification_type ->
  action_type:action_type ->
  action_threshold:action_threshold ->
  definition:definition ->
  execution_role_arn:role_arn ->
  approval_model:approval_model ->
  subscribers:subscribers ->
  unit ->
  create_budget_action_request

val make_create_budget_response : unit -> unit

val make_notification_with_subscribers :
  notification:notification -> subscribers:subscribers -> unit -> notification_with_subscribers

val make_create_budget_request :
  ?notifications_with_subscribers:notification_with_subscribers_list ->
  ?resource_tags:resource_tag_list ->
  account_id:account_id ->
  budget:budget ->
  unit ->
  create_budget_request
