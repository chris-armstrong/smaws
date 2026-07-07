open Types

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
