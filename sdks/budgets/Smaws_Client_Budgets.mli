(** Budgets client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_update_subscriber_response : unit -> unit

val make_notification :
  ?notification_state:notification_state ->
  ?threshold_type:threshold_type ->
  threshold:notification_threshold ->
  comparison_operator:comparison_operator ->
  notification_type:notification_type ->
  unit ->
  notification

val make_subscriber :
  address:subscriber_address -> subscription_type:subscription_type -> unit -> subscriber

val make_update_subscriber_request :
  new_subscriber:subscriber ->
  old_subscriber:subscriber ->
  notification:notification ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  update_subscriber_request

val make_update_notification_response : unit -> unit

val make_update_notification_request :
  new_notification:notification ->
  old_notification:notification ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  update_notification_request

val make_update_budget_response : unit -> unit
val make_spend : unit_:unit_value -> amount:numeric_value -> unit -> spend

val make_cost_types :
  ?use_amortized:nullable_boolean ->
  ?include_discount:nullable_boolean ->
  ?include_support:nullable_boolean ->
  ?include_other_subscription:nullable_boolean ->
  ?include_recurring:nullable_boolean ->
  ?include_upfront:nullable_boolean ->
  ?include_credit:nullable_boolean ->
  ?include_refund:nullable_boolean ->
  ?use_blended:nullable_boolean ->
  ?include_subscription:nullable_boolean ->
  ?include_tax:nullable_boolean ->
  unit ->
  cost_types

val make_time_period : ?end_:generic_timestamp -> ?start:generic_timestamp -> unit -> time_period

val make_calculated_spend :
  ?forecasted_spend:spend -> actual_spend:spend -> unit -> calculated_spend

val make_historical_options :
  ?look_back_available_periods:adjustment_period ->
  budget_adjustment_period:adjustment_period ->
  unit ->
  historical_options

val make_auto_adjust_data :
  ?last_auto_adjust_time:generic_timestamp ->
  ?historical_options:historical_options ->
  auto_adjust_type:auto_adjust_type ->
  unit ->
  auto_adjust_data

val make_expression_dimension_values :
  ?match_options:match_options ->
  values:values ->
  key:dimension ->
  unit ->
  expression_dimension_values

val make_tag_values :
  ?match_options:match_options -> ?values:values -> ?key:tag_key -> unit -> tag_values

val make_cost_category_values :
  ?match_options:match_options ->
  ?values:values ->
  ?key:cost_category_name ->
  unit ->
  cost_category_values

val make_expression :
  ?cost_categories:cost_category_values ->
  ?tags:tag_values ->
  ?dimensions:expression_dimension_values ->
  ?not:expression ->
  ?and_:expressions ->
  ?\#or:expressions ->
  unit ->
  expression

val make_health_status :
  ?last_updated_time:generic_timestamp ->
  ?status_reason:health_status_reason ->
  ?status:health_status_value ->
  unit ->
  health_status

val make_budget :
  ?health_status:health_status ->
  ?billing_view_arn:billing_view_arn ->
  ?metrics:metrics ->
  ?filter_expression:expression ->
  ?auto_adjust_data:auto_adjust_data ->
  ?last_updated_time:generic_timestamp ->
  ?calculated_spend:calculated_spend ->
  ?time_period:time_period ->
  ?cost_types:cost_types ->
  ?cost_filters:cost_filters ->
  ?planned_budget_limits:planned_budget_limits ->
  ?budget_limit:spend ->
  budget_type:budget_type ->
  time_unit:time_unit ->
  budget_name:budget_name ->
  unit ->
  budget

val make_update_budget_request :
  new_budget:budget -> account_id:account_id -> unit -> update_budget_request

val make_action_threshold :
  action_threshold_type:threshold_type ->
  action_threshold_value:notification_threshold ->
  unit ->
  action_threshold

val make_iam_action_definition :
  ?users:users ->
  ?groups:groups ->
  ?roles:roles ->
  policy_arn:policy_arn ->
  unit ->
  iam_action_definition

val make_scp_action_definition :
  target_ids:target_ids -> policy_id:policy_id -> unit -> scp_action_definition

val make_ssm_action_definition :
  instance_ids:instance_ids ->
  region:region ->
  action_sub_type:action_sub_type ->
  unit ->
  ssm_action_definition

val make_definition :
  ?ssm_action_definition:ssm_action_definition ->
  ?scp_action_definition:scp_action_definition ->
  ?iam_action_definition:iam_action_definition ->
  unit ->
  definition

val make_action :
  subscribers:subscribers ->
  status:action_status ->
  approval_model:approval_model ->
  execution_role_arn:role_arn ->
  definition:definition ->
  action_threshold:action_threshold ->
  action_type:action_type ->
  notification_type:notification_type ->
  budget_name:budget_name ->
  action_id:action_id ->
  unit ->
  action

val make_update_budget_action_response :
  new_action:action ->
  old_action:action ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  update_budget_action_response

val make_update_budget_action_request :
  ?subscribers:subscribers ->
  ?approval_model:approval_model ->
  ?execution_role_arn:role_arn ->
  ?definition:definition ->
  ?action_threshold:action_threshold ->
  ?notification_type:notification_type ->
  action_id:action_id ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  update_budget_action_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_tag_keys:resource_tag_key_list ->
  resource_ar_n:amazon_resource_name ->
  unit ->
  untag_resource_request

val make_tag_resource_response : unit -> unit
val make_resource_tag : value:resource_tag_value -> key:resource_tag_key -> unit -> resource_tag

val make_tag_resource_request :
  resource_tags:resource_tag_list ->
  resource_ar_n:amazon_resource_name ->
  unit ->
  tag_resource_request

val make_notification_with_subscribers :
  subscribers:subscribers -> notification:notification -> unit -> notification_with_subscribers

val make_list_tags_for_resource_response :
  ?resource_tags:resource_tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_execute_budget_action_response :
  execution_type:execution_type ->
  action_id:action_id ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  execute_budget_action_response

val make_execute_budget_action_request :
  execution_type:execution_type ->
  action_id:action_id ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  execute_budget_action_request

val make_describe_subscribers_for_notification_response :
  ?next_token:generic_string ->
  ?subscribers:subscribers ->
  unit ->
  describe_subscribers_for_notification_response

val make_describe_subscribers_for_notification_request :
  ?next_token:generic_string ->
  ?max_results:max_results ->
  notification:notification ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  describe_subscribers_for_notification_request

val make_describe_notifications_for_budget_response :
  ?next_token:generic_string ->
  ?notifications:notifications ->
  unit ->
  describe_notifications_for_budget_response

val make_describe_notifications_for_budget_request :
  ?next_token:generic_string ->
  ?max_results:max_results ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  describe_notifications_for_budget_request

val make_describe_budgets_response :
  ?next_token:generic_string -> ?budgets:budgets -> unit -> describe_budgets_response

val make_describe_budgets_request :
  ?show_filter_expression:nullable_boolean ->
  ?next_token:generic_string ->
  ?max_results:max_results_describe_budgets ->
  account_id:account_id ->
  unit ->
  describe_budgets_request

val make_describe_budget_response : ?budget:budget -> unit -> describe_budget_response

val make_describe_budget_request :
  ?show_filter_expression:nullable_boolean ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  describe_budget_request

val make_budgeted_and_actual_amounts :
  ?time_period:time_period ->
  ?actual_amount:spend ->
  ?budgeted_amount:spend ->
  unit ->
  budgeted_and_actual_amounts

val make_budget_performance_history :
  ?metrics:metrics ->
  ?filter_expression:expression ->
  ?budgeted_and_actual_amounts_list:budgeted_and_actual_amounts_list ->
  ?billing_view_arn:billing_view_arn ->
  ?time_unit:time_unit ->
  ?cost_types:cost_types ->
  ?cost_filters:cost_filters ->
  ?budget_type:budget_type ->
  ?budget_name:budget_name ->
  unit ->
  budget_performance_history

val make_describe_budget_performance_history_response :
  ?next_token:generic_string ->
  ?budget_performance_history:budget_performance_history ->
  unit ->
  describe_budget_performance_history_response

val make_describe_budget_performance_history_request :
  ?next_token:generic_string ->
  ?max_results:max_results ->
  ?time_period:time_period ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  describe_budget_performance_history_request

val make_budget_notifications_for_account :
  ?budget_name:budget_name ->
  ?notifications:notifications ->
  unit ->
  budget_notifications_for_account

val make_describe_budget_notifications_for_account_response :
  ?next_token:generic_string ->
  ?budget_notifications_for_account:budget_notifications_for_account_list ->
  unit ->
  describe_budget_notifications_for_account_response

val make_describe_budget_notifications_for_account_request :
  ?next_token:generic_string ->
  ?max_results:max_results_budget_notifications ->
  account_id:account_id ->
  unit ->
  describe_budget_notifications_for_account_request

val make_describe_budget_actions_for_budget_response :
  ?next_token:generic_string ->
  actions:actions ->
  unit ->
  describe_budget_actions_for_budget_response

val make_describe_budget_actions_for_budget_request :
  ?next_token:generic_string ->
  ?max_results:max_results ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  describe_budget_actions_for_budget_request

val make_describe_budget_actions_for_account_response :
  ?next_token:generic_string ->
  actions:actions ->
  unit ->
  describe_budget_actions_for_account_response

val make_describe_budget_actions_for_account_request :
  ?next_token:generic_string ->
  ?max_results:max_results ->
  account_id:account_id ->
  unit ->
  describe_budget_actions_for_account_request

val make_describe_budget_action_response :
  action:action ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  describe_budget_action_response

val make_describe_budget_action_request :
  action_id:action_id ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  describe_budget_action_request

val make_action_history_details :
  action:action -> message:generic_string -> unit -> action_history_details

val make_action_history :
  action_history_details:action_history_details ->
  event_type:event_type ->
  status:action_status ->
  timestamp:generic_timestamp ->
  unit ->
  action_history

val make_describe_budget_action_histories_response :
  ?next_token:generic_string ->
  action_histories:action_histories ->
  unit ->
  describe_budget_action_histories_response

val make_describe_budget_action_histories_request :
  ?next_token:generic_string ->
  ?max_results:max_results ->
  ?time_period:time_period ->
  action_id:action_id ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  describe_budget_action_histories_request

val make_delete_subscriber_response : unit -> unit

val make_delete_subscriber_request :
  subscriber:subscriber ->
  notification:notification ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  delete_subscriber_request

val make_delete_notification_response : unit -> unit

val make_delete_notification_request :
  notification:notification ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  delete_notification_request

val make_delete_budget_response : unit -> unit

val make_delete_budget_request :
  budget_name:budget_name -> account_id:account_id -> unit -> delete_budget_request

val make_delete_budget_action_response :
  action:action ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  delete_budget_action_response

val make_delete_budget_action_request :
  action_id:action_id ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  delete_budget_action_request

val make_create_subscriber_response : unit -> unit

val make_create_subscriber_request :
  subscriber:subscriber ->
  notification:notification ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  create_subscriber_request

val make_create_notification_response : unit -> unit

val make_create_notification_request :
  subscribers:subscribers ->
  notification:notification ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  create_notification_request

val make_create_budget_response : unit -> unit

val make_create_budget_request :
  ?resource_tags:resource_tag_list ->
  ?notifications_with_subscribers:notification_with_subscribers_list ->
  budget:budget ->
  account_id:account_id ->
  unit ->
  create_budget_request

val make_create_budget_action_response :
  action_id:action_id ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  create_budget_action_response

val make_create_budget_action_request :
  ?resource_tags:resource_tag_list ->
  subscribers:subscribers ->
  approval_model:approval_model ->
  execution_role_arn:role_arn ->
  definition:definition ->
  action_threshold:action_threshold ->
  action_type:action_type ->
  notification_type:notification_type ->
  budget_name:budget_name ->
  account_id:account_id ->
  unit ->
  create_budget_action_request
(** {1:operations Operations} *)

module CreateBudget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `CreationLimitExceededException of creation_limit_exceeded_exception
    | `DuplicateRecordException of duplicate_record_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_budget_request ->
    ( create_budget_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `CreationLimitExceededException of creation_limit_exceeded_exception
      | `DuplicateRecordException of duplicate_record_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_budget_request ->
    ( create_budget_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `CreationLimitExceededException of creation_limit_exceeded_exception
      | `DuplicateRecordException of duplicate_record_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a budget and, if included, notifications and subscribers. \n\n\
  \  Only one of [BudgetLimit] or [PlannedBudgetLimits] can be present in the syntax at one time. \
   Use the syntax that matches your use case. The Request Syntax section shows the [BudgetLimit] \
   syntax. For [PlannedBudgetLimits], see the \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_CreateBudget.html#API_CreateBudget_Examples}Examples} \
   section.\n\
  \  \n\
  \   Similarly, only one set of filter and metric selections can be present in the syntax at one \
   time. Either [FilterExpression] and [Metrics] or [CostFilters] and [CostTypes], not both or a \
   different combination. We recommend using [FilterExpression] and [Metrics] as they provide more \
   flexible and powerful filtering capabilities. The Request Syntax section shows the \
   [FilterExpression]/[Metrics] syntax.\n\
  \   \n\
  \    "]

module CreateBudgetAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `CreationLimitExceededException of creation_limit_exceeded_exception
    | `DuplicateRecordException of duplicate_record_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_budget_action_request ->
    ( create_budget_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `CreationLimitExceededException of creation_limit_exceeded_exception
      | `DuplicateRecordException of duplicate_record_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_budget_action_request ->
    ( create_budget_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `CreationLimitExceededException of creation_limit_exceeded_exception
      | `DuplicateRecordException of duplicate_record_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Creates a budget action. \n"]

module CreateNotification : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `CreationLimitExceededException of creation_limit_exceeded_exception
    | `DuplicateRecordException of duplicate_record_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_notification_request ->
    ( create_notification_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `CreationLimitExceededException of creation_limit_exceeded_exception
      | `DuplicateRecordException of duplicate_record_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_notification_request ->
    ( create_notification_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `CreationLimitExceededException of creation_limit_exceeded_exception
      | `DuplicateRecordException of duplicate_record_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a notification. You must create the budget before you create the associated notification.\n"]

module CreateSubscriber : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `CreationLimitExceededException of creation_limit_exceeded_exception
    | `DuplicateRecordException of duplicate_record_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_subscriber_request ->
    ( create_subscriber_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `CreationLimitExceededException of creation_limit_exceeded_exception
      | `DuplicateRecordException of duplicate_record_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_subscriber_request ->
    ( create_subscriber_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `CreationLimitExceededException of creation_limit_exceeded_exception
      | `DuplicateRecordException of duplicate_record_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a subscriber. You must create the associated budget and notification before you create \
   the subscriber.\n"]

module DeleteBudget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_budget_request ->
    ( delete_budget_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_budget_request ->
    ( delete_budget_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a budget. You can delete your budget at any time.\n\n\
  \  Deleting a budget also deletes the notifications and subscribers that are associated with \
   that budget.\n\
  \  \n\
  \   "]

module DeleteBudgetAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ResourceLockedException of resource_locked_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_budget_action_request ->
    ( delete_budget_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ResourceLockedException of resource_locked_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_budget_action_request ->
    ( delete_budget_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ResourceLockedException of resource_locked_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Deletes a budget action. \n"]

module DeleteNotification : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_notification_request ->
    ( delete_notification_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_notification_request ->
    ( delete_notification_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a notification.\n\n\
  \  Deleting a notification also deletes the subscribers that are associated with the notification.\n\
  \  \n\
  \   "]

module DeleteSubscriber : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_subscriber_request ->
    ( delete_subscriber_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_subscriber_request ->
    ( delete_subscriber_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a subscriber.\n\n\
  \  Deleting the last subscriber to a notification also deletes the notification.\n\
  \  \n\
  \   "]

module DescribeBudget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_budget_request ->
    ( describe_budget_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_budget_request ->
    ( describe_budget_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a budget.\n\n\
  \  The Request Syntax section shows the [BudgetLimit] syntax. For [PlannedBudgetLimits], see the \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_DescribeBudget.html#API_DescribeBudget_Examples}Examples} \
   section.\n\
  \  \n\
  \   "]

module DescribeBudgetAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_budget_action_request ->
    ( describe_budget_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_budget_action_request ->
    ( describe_budget_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Describes a budget action detail. \n"]

module DescribeBudgetActionHistories : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_budget_action_histories_request ->
    ( describe_budget_action_histories_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_budget_action_histories_request ->
    ( describe_budget_action_histories_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Describes a budget action history detail. \n"]

module DescribeBudgetActionsForAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_budget_actions_for_account_request ->
    ( describe_budget_actions_for_account_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_budget_actions_for_account_request ->
    ( describe_budget_actions_for_account_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Describes all of the budget actions for an account. \n"]

module DescribeBudgetActionsForBudget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_budget_actions_for_budget_request ->
    ( describe_budget_actions_for_budget_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_budget_actions_for_budget_request ->
    ( describe_budget_actions_for_budget_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Describes all of the budget actions for a budget. \n"]

module DescribeBudgetNotificationsForAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ExpiredNextTokenException of expired_next_token_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_budget_notifications_for_account_request ->
    ( describe_budget_notifications_for_account_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_budget_notifications_for_account_request ->
    ( describe_budget_notifications_for_account_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists the budget names and notifications that are associated with an account. \n"]

module DescribeBudgetPerformanceHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `ExpiredNextTokenException of expired_next_token_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_budget_performance_history_request ->
    ( describe_budget_performance_history_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_budget_performance_history_request ->
    ( describe_budget_performance_history_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the history for [DAILY], [MONTHLY], and [QUARTERLY] budgets. Budget history isn't \
   available for [ANNUAL] budgets.\n"]

module DescribeBudgets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ExpiredNextTokenException of expired_next_token_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_budgets_request ->
    ( describe_budgets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_budgets_request ->
    ( describe_budgets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the budgets that are associated with an account.\n\n\
  \  The Request Syntax section shows the [BudgetLimit] syntax. For [PlannedBudgetLimits], see the \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_DescribeBudgets.html#API_DescribeBudgets_Examples}Examples} \
   section.\n\
  \  \n\
  \   "]

module DescribeNotificationsForBudget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ExpiredNextTokenException of expired_next_token_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_notifications_for_budget_request ->
    ( describe_notifications_for_budget_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_notifications_for_budget_request ->
    ( describe_notifications_for_budget_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the notifications that are associated with a budget.\n"]

module DescribeSubscribersForNotification : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ExpiredNextTokenException of expired_next_token_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_subscribers_for_notification_request ->
    ( describe_subscribers_for_notification_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_subscribers_for_notification_request ->
    ( describe_subscribers_for_notification_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the subscribers that are associated with a notification.\n"]

module ExecuteBudgetAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ResourceLockedException of resource_locked_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    execute_budget_action_request ->
    ( execute_budget_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ResourceLockedException of resource_locked_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    execute_budget_action_request ->
    ( execute_budget_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ResourceLockedException of resource_locked_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Executes a budget action. \n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists tags associated with a budget or budget action resource.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates tags for a budget or budget action resource.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes tags associated with a budget or budget action resource.\n"]

module UpdateBudget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_budget_request ->
    ( update_budget_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_budget_request ->
    ( update_budget_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a budget. You can change every part of a budget except for the [budgetName] and the \
   [calculatedSpend]. When you modify a budget, the [calculatedSpend] drops to zero until Amazon \
   Web Services has new usage data to use for forecasting.\n\n\
  \  Only one of [BudgetLimit] or [PlannedBudgetLimits] can be present in the syntax at one time. \
   Use the syntax that matches your case. The Request Syntax section shows the [BudgetLimit] \
   syntax. For [PlannedBudgetLimits], see the \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_UpdateBudget.html#API_UpdateBudget_Examples}Examples} \
   section.\n\
  \  \n\
  \   Similarly, only one set of filter and metric selections can be present in the syntax at one \
   time. Either [FilterExpression] and [Metrics] or [CostFilters] and [CostTypes], not both or a \
   different combination. We recommend using [FilterExpression] and [Metrics] as they provide more \
   flexible and powerful filtering capabilities. The Request Syntax section shows the \
   [FilterExpression]/[Metrics] syntax.\n\
  \   \n\
  \    "]

module UpdateBudgetAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ResourceLockedException of resource_locked_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_budget_action_request ->
    ( update_budget_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ResourceLockedException of resource_locked_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_budget_action_request ->
    ( update_budget_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ResourceLockedException of resource_locked_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Updates a budget action. \n"]

module UpdateNotification : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DuplicateRecordException of duplicate_record_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_notification_request ->
    ( update_notification_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DuplicateRecordException of duplicate_record_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_notification_request ->
    ( update_notification_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DuplicateRecordException of duplicate_record_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a notification.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateSubscriber : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DuplicateRecordException of duplicate_record_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_subscriber_request ->
    ( update_subscriber_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DuplicateRecordException of duplicate_record_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_subscriber_request ->
    ( update_subscriber_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DuplicateRecordException of duplicate_record_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a subscriber.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
