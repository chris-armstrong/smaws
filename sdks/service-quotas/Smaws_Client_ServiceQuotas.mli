(** Service Quotas client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_associate_service_quota_template_response : unit -> unit
val make_associate_service_quota_template_request : unit -> unit
val make_create_support_case_response : unit -> unit
val make_create_support_case_request : request_id:request_id -> unit -> create_support_case_request
val make_delete_service_quota_increase_request_from_template_response : unit -> unit

val make_delete_service_quota_increase_request_from_template_request :
  service_code:service_code ->
  quota_code:quota_code ->
  aws_region:aws_region ->
  unit ->
  delete_service_quota_increase_request_from_template_request

val make_disassociate_service_quota_template_response : unit -> unit
val make_disassociate_service_quota_template_request : unit -> unit

val make_error_reason :
  ?error_code:error_code -> ?error_message:error_message -> unit -> error_reason

val make_quota_info : ?quota_code:quota_code -> ?quota_name:quota_name -> unit -> quota_info

val make_quota_context_info :
  ?context_scope:quota_context_scope ->
  ?context_scope_type:quota_context_scope_type ->
  ?context_id:quota_context_id ->
  unit ->
  quota_context_info

val make_quota_period :
  ?period_value:period_value -> ?period_unit:period_unit -> unit -> quota_period

val make_metric_info :
  ?metric_namespace:quota_metric_namespace ->
  ?metric_name:quota_metric_name ->
  ?metric_dimensions:metric_dimensions_map_definition ->
  ?metric_statistic_recommendation:statistic ->
  unit ->
  metric_info

val make_service_quota :
  ?service_code:service_code ->
  ?service_name:service_name ->
  ?quota_arn:quota_arn ->
  ?quota_code:quota_code ->
  ?quota_name:quota_name ->
  ?value:quota_value ->
  ?unit_:quota_unit ->
  ?adjustable:quota_adjustable ->
  ?global_quota:global_quota ->
  ?usage_metric:metric_info ->
  ?period:quota_period ->
  ?error_reason:error_reason ->
  ?quota_applied_at_level:applied_level_enum ->
  ?quota_context:quota_context_info ->
  ?description:quota_description ->
  unit ->
  service_quota

val make_get_aws_default_service_quota_response :
  ?quota:service_quota -> unit -> get_aws_default_service_quota_response

val make_get_aws_default_service_quota_request :
  service_code:service_code ->
  quota_code:quota_code ->
  unit ->
  get_aws_default_service_quota_request

val make_get_association_for_service_quota_template_response :
  ?service_quota_template_association_status:service_quota_template_association_status ->
  unit ->
  get_association_for_service_quota_template_response

val make_get_association_for_service_quota_template_request : unit -> unit

val make_get_auto_management_configuration_response :
  ?opt_in_level:opt_in_level ->
  ?opt_in_type:opt_in_type ->
  ?notification_arn:amazon_resource_name ->
  ?opt_in_status:opt_in_status ->
  ?exclusion_list:exclusion_quota_list ->
  unit ->
  get_auto_management_configuration_response

val make_get_auto_management_configuration_request : unit -> unit

val make_quota_utilization_info :
  ?quota_code:quota_code ->
  ?service_code:service_code ->
  ?quota_name:quota_name ->
  ?namespace:quota_metric_namespace ->
  ?utilization:utilization_pct ->
  ?default_value:default_value ->
  ?applied_value:applied_value ->
  ?service_name:service_name ->
  ?adjustable:quota_adjustable ->
  unit ->
  quota_utilization_info

val make_get_quota_utilization_report_response :
  ?report_id:report_id ->
  ?status:report_status ->
  ?generated_at:date_time ->
  ?total_count:total_count ->
  ?quotas:quota_utilization_info_list ->
  ?next_token:next_token ->
  ?error_code:report_error_code ->
  ?error_message:report_error_message ->
  unit ->
  get_quota_utilization_report_response

val make_get_quota_utilization_report_request :
  ?next_token:next_token ->
  ?max_results:max_results_utilization ->
  report_id:report_id ->
  unit ->
  get_quota_utilization_report_request

val make_requested_service_quota_change :
  ?id:request_id ->
  ?request_type:request_type ->
  ?case_id:customer_service_engagement_id ->
  ?service_code:service_code ->
  ?service_name:service_name ->
  ?quota_code:quota_code ->
  ?quota_name:quota_name ->
  ?desired_value:quota_value ->
  ?status:request_status ->
  ?created:date_time ->
  ?last_updated:date_time ->
  ?requester:requester ->
  ?quota_arn:quota_arn ->
  ?global_quota:global_quota ->
  ?unit_:quota_unit ->
  ?quota_requested_at_level:applied_level_enum ->
  ?quota_context:quota_context_info ->
  unit ->
  requested_service_quota_change

val make_get_requested_service_quota_change_response :
  ?requested_quota:requested_service_quota_change ->
  unit ->
  get_requested_service_quota_change_response

val make_get_requested_service_quota_change_request :
  request_id:request_id -> unit -> get_requested_service_quota_change_request

val make_get_service_quota_response : ?quota:service_quota -> unit -> get_service_quota_response

val make_get_service_quota_request :
  ?context_id:quota_context_id ->
  service_code:service_code ->
  quota_code:quota_code ->
  unit ->
  get_service_quota_request

val make_service_quota_increase_request_in_template :
  ?service_code:service_code ->
  ?service_name:service_name ->
  ?quota_code:quota_code ->
  ?quota_name:quota_name ->
  ?desired_value:quota_value ->
  ?aws_region:aws_region ->
  ?unit_:quota_unit ->
  ?global_quota:global_quota ->
  unit ->
  service_quota_increase_request_in_template

val make_get_service_quota_increase_request_from_template_response :
  ?service_quota_increase_request_in_template:service_quota_increase_request_in_template ->
  unit ->
  get_service_quota_increase_request_from_template_response

val make_get_service_quota_increase_request_from_template_request :
  service_code:service_code ->
  quota_code:quota_code ->
  aws_region:aws_region ->
  unit ->
  get_service_quota_increase_request_from_template_request

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_list_aws_default_service_quotas_response :
  ?next_token:next_token ->
  ?quotas:service_quota_list_definition ->
  unit ->
  list_aws_default_service_quotas_response

val make_list_aws_default_service_quotas_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  service_code:service_code ->
  unit ->
  list_aws_default_service_quotas_request

val make_list_requested_service_quota_change_history_response :
  ?next_token:next_token ->
  ?requested_quotas:requested_service_quota_change_history_list_definition ->
  unit ->
  list_requested_service_quota_change_history_response

val make_list_requested_service_quota_change_history_request :
  ?service_code:service_code ->
  ?status:request_status ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?quota_requested_at_level:applied_level_enum ->
  unit ->
  list_requested_service_quota_change_history_request

val make_list_requested_service_quota_change_history_by_quota_response :
  ?next_token:next_token ->
  ?requested_quotas:requested_service_quota_change_history_list_definition ->
  unit ->
  list_requested_service_quota_change_history_by_quota_response

val make_list_requested_service_quota_change_history_by_quota_request :
  ?status:request_status ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?quota_requested_at_level:applied_level_enum ->
  service_code:service_code ->
  quota_code:quota_code ->
  unit ->
  list_requested_service_quota_change_history_by_quota_request

val make_list_service_quota_increase_requests_in_template_response :
  ?service_quota_increase_request_in_template_list:service_quota_increase_request_in_template_list ->
  ?next_token:next_token ->
  unit ->
  list_service_quota_increase_requests_in_template_response

val make_list_service_quota_increase_requests_in_template_request :
  ?service_code:service_code ->
  ?aws_region:aws_region ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_service_quota_increase_requests_in_template_request

val make_list_service_quotas_response :
  ?next_token:next_token ->
  ?quotas:service_quota_list_definition ->
  unit ->
  list_service_quotas_response

val make_list_service_quotas_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?quota_code:quota_code ->
  ?quota_applied_at_level:applied_level_enum ->
  service_code:service_code ->
  unit ->
  list_service_quotas_request

val make_service_info :
  ?service_code:service_code -> ?service_name:service_name -> unit -> service_info

val make_list_services_response :
  ?next_token:next_token -> ?services:service_info_list_definition -> unit -> list_services_response

val make_list_services_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_services_request

val make_list_tags_for_resource_response :
  ?tags:output_tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_put_service_quota_increase_request_into_template_response :
  ?service_quota_increase_request_in_template:service_quota_increase_request_in_template ->
  unit ->
  put_service_quota_increase_request_into_template_response

val make_put_service_quota_increase_request_into_template_request :
  quota_code:quota_code ->
  service_code:service_code ->
  aws_region:aws_region ->
  desired_value:quota_value ->
  unit ->
  put_service_quota_increase_request_into_template_request

val make_request_service_quota_increase_response :
  ?requested_quota:requested_service_quota_change -> unit -> request_service_quota_increase_response

val make_request_service_quota_increase_request :
  ?context_id:quota_context_id ->
  ?support_case_allowed:support_case_allowed ->
  service_code:service_code ->
  quota_code:quota_code ->
  desired_value:quota_value ->
  unit ->
  request_service_quota_increase_request

val make_update_auto_management_response : unit -> unit

val make_update_auto_management_request :
  ?opt_in_type:opt_in_type ->
  ?notification_arn:amazon_resource_name ->
  ?exclusion_list:exclusion_list ->
  unit ->
  update_auto_management_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:input_tag_keys -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:input_tags -> unit -> tag_resource_request

val make_stop_auto_management_response : unit -> unit
val make_stop_auto_management_request : unit -> unit

val make_start_quota_utilization_report_response :
  ?report_id:report_id ->
  ?status:report_status ->
  ?message:report_message ->
  unit ->
  start_quota_utilization_report_response

val make_start_quota_utilization_report_request : unit -> unit
val make_start_auto_management_response : unit -> unit

val make_start_auto_management_request :
  ?notification_arn:amazon_resource_name ->
  ?exclusion_list:exclusion_list ->
  opt_in_level:opt_in_level ->
  opt_in_type:opt_in_type ->
  unit ->
  start_auto_management_request
(** {1:operations Operations} *)

module StartAutoManagement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_auto_management_request ->
    ( start_auto_management_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_auto_management_request ->
    ( start_auto_management_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts \
   {{:https://docs.aws.amazon.com/servicequotas/latest/userguide/automatic-management.html}Service \
   Quotas Automatic Management} for an Amazon Web Services account, including notification \
   preferences and excluded quotas configurations. Automatic Management monitors your Service \
   Quotas utilization and notifies you before you run out of your allocated quotas.\n"]

module StartQuotaUtilizationReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_quota_utilization_report_request ->
    ( start_quota_utilization_report_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_quota_utilization_report_request ->
    ( start_quota_utilization_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates the generation of a quota utilization report for your Amazon Web Services account. \
   This asynchronous operation analyzes your quota usage across all Amazon Web Services services \
   and returns a unique report identifier that you can use to retrieve the results.\n\n\
  \ The report generation process may take several seconds to complete, depending on the number of \
   quotas in your account. Use the [GetQuotaUtilizationReport] operation to check the status and \
   retrieve the results when the report is ready.\n\
  \ "]

module StopAutoManagement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_auto_management_request ->
    ( stop_auto_management_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_auto_management_request ->
    ( stop_auto_management_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops \
   {{:https://docs.aws.amazon.com/servicequotas/latest/userguide/automatic-management.html}Service \
   Quotas Automatic Management} for an Amazon Web Services account and removes all associated \
   configurations. Automatic Management monitors your Service Quotas utilization and notifies you \
   before you run out of your allocated quotas.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TagPolicyViolationException of tag_policy_violation_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TagPolicyViolationException of tag_policy_violation_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TagPolicyViolationException of tag_policy_violation_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds tags to the specified applied quota. You can include one or more tags to add to the quota.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes tags from the specified applied quota. You can specify one or more tags to remove.\n"]

module UpdateAutoManagement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_auto_management_request ->
    ( update_auto_management_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_auto_management_request ->
    ( update_auto_management_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates your \
   {{:https://docs.aws.amazon.com/servicequotas/latest/userguide/automatic-management.html}Service \
   Quotas Automatic Management} configuration, including notification preferences and excluded \
   quotas. Automatic Management monitors your Service Quotas utilization and notifies you before \
   you run out of your allocated quotas.\n"]

module RequestServiceQuotaIncrease : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DependencyAccessDeniedException of dependency_access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `QuotaExceededException of quota_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    request_service_quota_increase_request ->
    ( request_service_quota_increase_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `QuotaExceededException of quota_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    request_service_quota_increase_request ->
    ( request_service_quota_increase_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `QuotaExceededException of quota_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Submits a quota increase request for the specified quota at the account or resource level.\n"]

module PutServiceQuotaIncreaseRequestIntoTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
    | `DependencyAccessDeniedException of dependency_access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `NoAvailableOrganizationException of no_available_organization_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `QuotaExceededException of quota_exceeded_exception
    | `ServiceException of service_exception
    | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_service_quota_increase_request_into_template_request ->
    ( put_service_quota_increase_request_into_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `QuotaExceededException of quota_exceeded_exception
      | `ServiceException of service_exception
      | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_service_quota_increase_request_into_template_request ->
    ( put_service_quota_increase_request_into_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `QuotaExceededException of quota_exceeded_exception
      | `ServiceException of service_exception
      | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds a quota increase request to your quota request template.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of the tags assigned to the specified applied quota.\n"]

module ListServices : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_services_request ->
    ( list_services_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_services_request ->
    ( list_services_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the names and codes for the Amazon Web Services services integrated with Service Quotas.\n"]

module ListServiceQuotas : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_service_quotas_request ->
    ( list_service_quotas_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_service_quotas_request ->
    ( list_service_quotas_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the applied quota values for the specified Amazon Web Services service. For some quotas, \
   only the default values are available. If the applied quota value is not available for a quota, \
   the quota is not retrieved. Filter responses to return applied quota values at either the \
   account level, resource level, or all levels.\n"]

module ListServiceQuotaIncreaseRequestsInTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
    | `DependencyAccessDeniedException of dependency_access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `NoAvailableOrganizationException of no_available_organization_exception
    | `ServiceException of service_exception
    | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_service_quota_increase_requests_in_template_request ->
    ( list_service_quota_increase_requests_in_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `ServiceException of service_exception
      | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_service_quota_increase_requests_in_template_request ->
    ( list_service_quota_increase_requests_in_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `ServiceException of service_exception
      | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the quota increase requests in the specified quota request template.\n"]

module ListRequestedServiceQuotaChangeHistoryByQuota : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_requested_service_quota_change_history_by_quota_request ->
    ( list_requested_service_quota_change_history_by_quota_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_requested_service_quota_change_history_by_quota_request ->
    ( list_requested_service_quota_change_history_by_quota_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the quota increase requests for the specified quota. Filter responses to return quota \
   requests at either the account level, resource level, or all levels.\n"]

module ListRequestedServiceQuotaChangeHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_requested_service_quota_change_history_request ->
    ( list_requested_service_quota_change_history_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_requested_service_quota_change_history_request ->
    ( list_requested_service_quota_change_history_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the quota increase requests for the specified Amazon Web Services service. Filter \
   responses to return quota requests at either the account level, resource level, or all levels. \
   Responses include any open or closed requests within 90 days.\n"]

module ListAWSDefaultServiceQuotas : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_aws_default_service_quotas_request ->
    ( list_aws_default_service_quotas_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_aws_default_service_quotas_request ->
    ( list_aws_default_service_quotas_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the default values for the quotas for the specified Amazon Web Services service. A \
   default value does not reflect any quota increases.\n"]

module GetServiceQuotaIncreaseRequestFromTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
    | `DependencyAccessDeniedException of dependency_access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `NoAvailableOrganizationException of no_available_organization_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_service_quota_increase_request_from_template_request ->
    ( get_service_quota_increase_request_from_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_service_quota_increase_request_from_template_request ->
    ( get_service_quota_increase_request_from_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about the specified quota increase request in your quota request template.\n"]

module GetServiceQuota : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_service_quota_request ->
    ( get_service_quota_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_service_quota_request ->
    ( get_service_quota_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the applied quota value for the specified account-level or resource-level quota. For \
   some quotas, only the default values are available. If the applied quota value is not available \
   for a quota, the quota is not retrieved.\n"]

module GetRequestedServiceQuotaChange : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_requested_service_quota_change_request ->
    ( get_requested_service_quota_change_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_requested_service_quota_change_request ->
    ( get_requested_service_quota_change_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about the specified quota increase request.\n"]

module GetQuotaUtilizationReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_quota_utilization_report_request ->
    ( get_quota_utilization_report_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_quota_utilization_report_request ->
    ( get_quota_utilization_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the quota utilization report for your Amazon Web Services account. This operation \
   returns paginated results showing your quota usage across all Amazon Web Services services, \
   sorted by utilization percentage in descending order (highest utilization first).\n\n\
  \ You must first initiate a report using the [StartQuotaUtilizationReport] operation. The report \
   generation process is asynchronous and may take several seconds to complete. Poll this \
   operation periodically to check the status and retrieve results when the report is ready.\n\
  \ \n\
  \  Each report contains up to 1,000 quota records per page. Use the [NextToken] parameter to \
   retrieve additional pages of results. Reports are automatically deleted after 15 minutes.\n\
  \  "]

module GetAutoManagementConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_auto_management_configuration_request ->
    ( get_auto_management_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_auto_management_configuration_request ->
    ( get_auto_management_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about your \
   {{:https://docs.aws.amazon.com/servicequotas/latest/userguide/automatic-management.html}Service \
   Quotas Automatic Management} configuration. Automatic Management monitors your Service Quotas \
   utilization and notifies you before you run out of your allocated quotas.\n"]

module GetAssociationForServiceQuotaTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
    | `DependencyAccessDeniedException of dependency_access_denied_exception
    | `NoAvailableOrganizationException of no_available_organization_exception
    | `ServiceException of service_exception
    | `ServiceQuotaTemplateNotInUseException of service_quota_template_not_in_use_exception
    | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_association_for_service_quota_template_request ->
    ( get_association_for_service_quota_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `ServiceException of service_exception
      | `ServiceQuotaTemplateNotInUseException of service_quota_template_not_in_use_exception
      | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_association_for_service_quota_template_request ->
    ( get_association_for_service_quota_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `ServiceException of service_exception
      | `ServiceQuotaTemplateNotInUseException of service_quota_template_not_in_use_exception
      | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the status of the association for the quota request template.\n"]

module GetAWSDefaultServiceQuota : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_aws_default_service_quota_request ->
    ( get_aws_default_service_quota_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_aws_default_service_quota_request ->
    ( get_aws_default_service_quota_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the default value for the specified quota. The default value does not reflect any \
   quota increases.\n"]

module DisassociateServiceQuotaTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
    | `DependencyAccessDeniedException of dependency_access_denied_exception
    | `NoAvailableOrganizationException of no_available_organization_exception
    | `ServiceException of service_exception
    | `ServiceQuotaTemplateNotInUseException of service_quota_template_not_in_use_exception
    | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_service_quota_template_request ->
    ( disassociate_service_quota_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `ServiceException of service_exception
      | `ServiceQuotaTemplateNotInUseException of service_quota_template_not_in_use_exception
      | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_service_quota_template_request ->
    ( disassociate_service_quota_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `ServiceException of service_exception
      | `ServiceQuotaTemplateNotInUseException of service_quota_template_not_in_use_exception
      | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables your quota request template. After a template is disabled, the quota increase requests \
   in the template are not applied to new Amazon Web Services accounts in your organization. \
   Disabling a quota request template does not apply its quota increase requests.\n"]

module DeleteServiceQuotaIncreaseRequestFromTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
    | `DependencyAccessDeniedException of dependency_access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `NoAvailableOrganizationException of no_available_organization_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ServiceException of service_exception
    | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_service_quota_increase_request_from_template_request ->
    ( delete_service_quota_increase_request_from_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_service_quota_increase_request_from_template_request ->
    ( delete_service_quota_increase_request_from_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ServiceException of service_exception
      | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the quota increase request for the specified quota from your quota request template.\n"]

module CreateSupportCase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `DependencyAccessDeniedException of dependency_access_denied_exception
    | `IllegalArgumentException of illegal_argument_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `NoSuchResourceException of no_such_resource_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_support_case_request ->
    ( create_support_case_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_support_case_request ->
    ( create_support_case_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `IllegalArgumentException of illegal_argument_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `NoSuchResourceException of no_such_resource_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Support case for an existing quota increase request. This call only creates a Support \
   case if the request has a [Pending] status. \n"]

(** {1:Serialization and Deserialization} *)
module AssociateServiceQuotaTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
    | `DependencyAccessDeniedException of dependency_access_denied_exception
    | `NoAvailableOrganizationException of no_available_organization_exception
    | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
    | `ServiceException of service_exception
    | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_service_quota_template_request ->
    ( associate_service_quota_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `ServiceException of service_exception
      | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_service_quota_template_request ->
    ( associate_service_quota_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSServiceAccessNotEnabledException of aws_service_access_not_enabled_exception
      | `DependencyAccessDeniedException of dependency_access_denied_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `OrganizationNotInAllFeaturesModeException of
        organization_not_in_all_features_mode_exception
      | `ServiceException of service_exception
      | `TemplatesNotAvailableInRegionException of templates_not_available_in_region_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates your quota request template with your organization. When a new Amazon Web Services \
   account is created in your organization, the quota increase requests in the template are \
   automatically applied to the account. You can add a quota increase request for any adjustable \
   quota to your template.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
