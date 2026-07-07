(** BCM Dashboards client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_date_time_value : value:generic_string -> type_:date_time_type -> unit -> date_time_value

val make_date_time_range :
  end_time:date_time_value -> start_time:date_time_value -> unit -> date_time_range

val make_group_definition :
  ?type_:group_definition_type -> key:Smaws_Lib.Smithy_api.Types.string_ -> unit -> group_definition

val make_dimension_values :
  ?match_options:match_options -> values:string_list -> key:dimension -> unit -> dimension_values

val make_tag_values :
  ?match_options:match_options ->
  ?values:string_list ->
  ?key:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  tag_values

val make_cost_category_values :
  ?match_options:match_options ->
  ?values:string_list ->
  ?key:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  cost_category_values

val make_expression :
  ?cost_categories:cost_category_values ->
  ?tags:tag_values ->
  ?dimensions:dimension_values ->
  ?not:expression ->
  ?and_:expressions ->
  ?\#or:expressions ->
  unit ->
  expression

val make_cost_and_usage_query :
  ?filter:expression ->
  ?group_by:group_definitions ->
  granularity:granularity ->
  time_range:date_time_range ->
  metrics:metric_names ->
  unit ->
  cost_and_usage_query

val make_savings_plans_coverage_query :
  ?filter:expression ->
  ?group_by:group_definitions ->
  ?granularity:granularity ->
  ?metrics:metric_names ->
  time_range:date_time_range ->
  unit ->
  savings_plans_coverage_query

val make_savings_plans_utilization_query :
  ?filter:expression ->
  ?granularity:granularity ->
  time_range:date_time_range ->
  unit ->
  savings_plans_utilization_query

val make_reservation_coverage_query :
  ?metrics:metric_names ->
  ?filter:expression ->
  ?granularity:granularity ->
  ?group_by:group_definitions ->
  time_range:date_time_range ->
  unit ->
  reservation_coverage_query

val make_reservation_utilization_query :
  ?filter:expression ->
  ?granularity:granularity ->
  ?group_by:group_definitions ->
  time_range:date_time_range ->
  unit ->
  reservation_utilization_query

val make_graph_display_config : visual_type:visual_type -> unit -> graph_display_config
val make_table_display_config_struct : unit -> unit

val make_widget_config :
  display_config:display_config -> query_parameters:query_parameters -> unit -> widget_config

val make_widget :
  ?horizontal_offset:Smaws_Lib.Smithy_api.Types.integer ->
  ?height:widget_height ->
  ?width:widget_width ->
  ?description:description ->
  ?id:widget_id ->
  configs:widget_config_list ->
  title:widget_title ->
  unit ->
  widget

val make_update_scheduled_report_response :
  arn:scheduled_report_arn -> unit -> update_scheduled_report_response

val make_schedule_period :
  ?end_time:generic_time_stamp -> ?start_time:generic_time_stamp -> unit -> schedule_period

val make_schedule_config :
  ?state:schedule_state ->
  ?schedule_period:schedule_period ->
  ?schedule_expression_time_zone:generic_string ->
  ?schedule_expression:generic_string ->
  unit ->
  schedule_config

val make_update_scheduled_report_request :
  ?clear_widget_date_range_override:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?clear_widget_ids:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?widget_date_range_override:date_time_range ->
  ?widget_ids:widget_id_list ->
  ?schedule_config:schedule_config ->
  ?scheduled_report_execution_role_arn:service_role_arn ->
  ?dashboard_arn:dashboard_arn ->
  ?description:description ->
  ?name:scheduled_report_name ->
  arn:scheduled_report_arn ->
  unit ->
  update_scheduled_report_request

val make_update_dashboard_response : arn:dashboard_arn -> unit -> update_dashboard_response

val make_update_dashboard_request :
  ?widgets:widget_list ->
  ?description:description ->
  name:dashboard_name ->
  arn:dashboard_arn ->
  unit ->
  update_dashboard_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_tag_keys:resource_tag_key_list ->
  resource_arn:resource_arn ->
  unit ->
  untag_resource_request

val make_tag_resource_response : unit -> unit
val make_resource_tag : value:resource_tag_value -> key:resource_tag_key -> unit -> resource_tag

val make_tag_resource_request :
  resource_tags:resource_tag_list -> resource_arn:resource_arn -> unit -> tag_resource_request

val make_health_status :
  ?status_reasons:status_reason_list ->
  ?last_refreshed_at:generic_time_stamp ->
  status_code:health_status_code ->
  unit ->
  health_status

val make_scheduled_report_summary :
  ?widget_ids:widget_id_list ->
  ?schedule_expression_time_zone:generic_string ->
  health_status:health_status ->
  state:schedule_state ->
  schedule_expression:generic_string ->
  dashboard_arn:dashboard_arn ->
  name:scheduled_report_name ->
  arn:scheduled_report_arn ->
  unit ->
  scheduled_report_summary

val make_scheduled_report_input :
  ?widget_date_range_override:date_time_range ->
  ?widget_ids:widget_id_list ->
  ?description:description ->
  schedule_config:schedule_config ->
  scheduled_report_execution_role_arn:service_role_arn ->
  dashboard_arn:dashboard_arn ->
  name:scheduled_report_name ->
  unit ->
  scheduled_report_input

val make_scheduled_report :
  ?health_status:health_status ->
  ?last_execution_at:generic_time_stamp ->
  ?updated_at:generic_time_stamp ->
  ?created_at:generic_time_stamp ->
  ?widget_date_range_override:date_time_range ->
  ?widget_ids:widget_id_list ->
  ?description:description ->
  ?arn:scheduled_report_arn ->
  schedule_config:schedule_config ->
  scheduled_report_execution_role_arn:service_role_arn ->
  dashboard_arn:dashboard_arn ->
  name:scheduled_report_name ->
  unit ->
  scheduled_report

val make_list_tags_for_resource_response :
  ?resource_tags:resource_tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_request

val make_list_scheduled_reports_response :
  ?next_token:next_page_token ->
  scheduled_reports:scheduled_report_summary_list ->
  unit ->
  list_scheduled_reports_response

val make_list_scheduled_reports_request :
  ?max_results:max_results -> ?next_token:next_page_token -> unit -> list_scheduled_reports_request

val make_dashboard_reference :
  ?description:description ->
  updated_at:generic_time_stamp ->
  created_at:generic_time_stamp ->
  type_:dashboard_type ->
  name:dashboard_name ->
  arn:dashboard_arn ->
  unit ->
  dashboard_reference

val make_list_dashboards_response :
  ?next_token:next_page_token ->
  dashboards:dashboard_reference_list ->
  unit ->
  list_dashboards_response

val make_list_dashboards_request :
  ?next_token:next_page_token -> ?max_results:max_results -> unit -> list_dashboards_request

val make_get_scheduled_report_response :
  scheduled_report:scheduled_report -> unit -> get_scheduled_report_response

val make_get_scheduled_report_request :
  arn:scheduled_report_arn -> unit -> get_scheduled_report_request

val make_get_resource_policy_response :
  policy_document:generic_string ->
  resource_arn:dashboard_arn ->
  unit ->
  get_resource_policy_response

val make_get_resource_policy_request :
  resource_arn:dashboard_arn -> unit -> get_resource_policy_request

val make_get_dashboard_response :
  ?description:description ->
  updated_at:generic_time_stamp ->
  created_at:generic_time_stamp ->
  widgets:widget_list ->
  type_:dashboard_type ->
  name:dashboard_name ->
  arn:dashboard_arn ->
  unit ->
  get_dashboard_response

val make_get_dashboard_request : arn:dashboard_arn -> unit -> get_dashboard_request

val make_execute_scheduled_report_response :
  ?execution_triggered:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?health_status:health_status ->
  unit ->
  execute_scheduled_report_response

val make_execute_scheduled_report_request :
  ?dry_run:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?client_token:client_token ->
  arn:scheduled_report_arn ->
  unit ->
  execute_scheduled_report_request

val make_delete_scheduled_report_response :
  arn:scheduled_report_arn -> unit -> delete_scheduled_report_response

val make_delete_scheduled_report_request :
  arn:scheduled_report_arn -> unit -> delete_scheduled_report_request

val make_delete_dashboard_response : arn:dashboard_arn -> unit -> delete_dashboard_response
val make_delete_dashboard_request : arn:dashboard_arn -> unit -> delete_dashboard_request

val make_create_scheduled_report_response :
  arn:scheduled_report_arn -> unit -> create_scheduled_report_response

val make_create_scheduled_report_request :
  ?client_token:client_token ->
  ?resource_tags:resource_tag_list ->
  scheduled_report:scheduled_report_input ->
  unit ->
  create_scheduled_report_request

val make_create_dashboard_response : arn:dashboard_arn -> unit -> create_dashboard_response

val make_create_dashboard_request :
  ?resource_tags:resource_tag_list ->
  ?description:description ->
  widgets:widget_list ->
  name:dashboard_name ->
  unit ->
  create_dashboard_request
(** {1:operations Operations} *)

module CreateDashboard : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_dashboard_request ->
    ( create_dashboard_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_dashboard_request ->
    ( create_dashboard_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new dashboard that can contain multiple widgets displaying cost and usage data. You \
   can add custom widgets or use predefined widgets, arranging them in your preferred layout.\n"]

module CreateScheduledReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_scheduled_report_request ->
    ( create_scheduled_report_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_scheduled_report_request ->
    ( create_scheduled_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new scheduled report for a dashboard. A scheduled report automatically generates and \
   delivers dashboard snapshots on a recurring schedule. Reports are delivered within 15 minutes \
   of the scheduled delivery time.\n"]

module DeleteDashboard : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_dashboard_request ->
    ( delete_dashboard_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_dashboard_request ->
    ( delete_dashboard_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified dashboard. This action cannot be undone.\n"]

module DeleteScheduledReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_report_request ->
    ( delete_scheduled_report_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_report_request ->
    ( delete_scheduled_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified scheduled report. This is an irreversible operation.\n"]

module ExecuteScheduledReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    execute_scheduled_report_request ->
    ( execute_scheduled_report_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    execute_scheduled_report_request ->
    ( execute_scheduled_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Triggers an immediate execution of a scheduled report, outside of its regular schedule. The \
   scheduled report must be in [ENABLED] state. Calling this operation on a [DISABLED] scheduled \
   report returns a [ValidationException].\n\n\
  \  If a [clientToken] is provided, the service uses it for idempotency. Requests with the same \
   client token will not trigger a new execution within the same minute.\n\
  \  \n\
  \   "]

module GetDashboard : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_dashboard_request ->
    ( get_dashboard_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_dashboard_request ->
    ( get_dashboard_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the configuration and metadata of a specified dashboard, including its widgets and \
   layout settings.\n"]

module GetResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the resource-based policy attached to a dashboard, showing sharing configurations and \
   permissions.\n"]

module GetScheduledReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_scheduled_report_request ->
    ( get_scheduled_report_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_scheduled_report_request ->
    ( get_scheduled_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the configuration and metadata of a specified scheduled report.\n"]

module ListDashboards : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_dashboards_request ->
    ( list_dashboards_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_dashboards_request ->
    ( list_dashboards_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of all dashboards in your account.\n"]

module ListScheduledReports : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_scheduled_reports_request ->
    ( list_scheduled_reports_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_scheduled_reports_request ->
    ( list_scheduled_reports_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of scheduled reports in your account.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of all tags associated with a specified dashboard resource.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds or updates tags for a specified dashboard resource.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes specified tags from a dashboard resource.\n"]

module UpdateDashboard : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_dashboard_request ->
    ( update_dashboard_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_dashboard_request ->
    ( update_dashboard_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing dashboard's properties, including its name, description, and widget \
   configurations.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateScheduledReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_scheduled_report_request ->
    ( update_scheduled_report_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_scheduled_report_request ->
    ( update_scheduled_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing scheduled report's properties, including its name, description, schedule \
   configuration, and widget settings. Only the parameters included in the request are updated; \
   all other properties remain unchanged.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
