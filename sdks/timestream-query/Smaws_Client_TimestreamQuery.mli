(** Timestream Query client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_update_scheduled_query_request :
  state:scheduled_query_state ->
  scheduled_query_arn:amazon_resource_name ->
  unit ->
  update_scheduled_query_request

val make_sns_configuration : topic_arn:amazon_resource_name -> unit -> sns_configuration

val make_account_settings_notification_configuration :
  ?sns_configuration:sns_configuration ->
  role_arn:amazon_resource_name ->
  unit ->
  account_settings_notification_configuration

val make_last_update :
  ?status_message:string_ ->
  ?status:last_update_status ->
  ?target_query_tc_u:query_tc_u ->
  unit ->
  last_update

val make_provisioned_capacity_response :
  ?last_update:last_update ->
  ?notification_configuration:account_settings_notification_configuration ->
  ?active_query_tc_u:query_tc_u ->
  unit ->
  provisioned_capacity_response

val make_query_compute_response :
  ?provisioned_capacity:provisioned_capacity_response ->
  ?compute_mode:compute_mode ->
  unit ->
  query_compute_response

val make_update_account_settings_response :
  ?query_compute:query_compute_response ->
  ?query_pricing_model:query_pricing_model ->
  ?max_query_tc_u:max_query_capacity ->
  unit ->
  update_account_settings_response

val make_provisioned_capacity_request :
  ?notification_configuration:account_settings_notification_configuration ->
  target_query_tc_u:query_tc_u ->
  unit ->
  provisioned_capacity_request

val make_query_compute_request :
  ?provisioned_capacity:provisioned_capacity_request ->
  ?compute_mode:compute_mode ->
  unit ->
  query_compute_request

val make_update_account_settings_request :
  ?query_compute:query_compute_request ->
  ?query_pricing_model:query_pricing_model ->
  ?max_query_tc_u:max_query_capacity ->
  unit ->
  update_account_settings_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_request

val make_column_info : ?name:string_ -> type_:type_ -> unit -> column_info

val make_type_ :
  ?row_column_info:column_info_list ->
  ?time_series_measure_value_column_info:column_info ->
  ?array_column_info:column_info ->
  ?scalar_type:scalar_type ->
  unit ->
  type_

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_request

val make_datum :
  ?null_value:nullable_boolean ->
  ?row_value:row ->
  ?array_value:datum_list ->
  ?time_series_value:time_series_data_point_list ->
  ?scalar_value:scalar_value ->
  unit ->
  datum

val make_row : data:datum_list -> unit -> row
val make_time_series_data_point : value:datum -> time:timestamp -> unit -> time_series_data_point

val make_query_status :
  ?cumulative_bytes_metered:long ->
  ?cumulative_bytes_scanned:long ->
  ?progress_percentage:double ->
  unit ->
  query_status

val make_query_spatial_coverage_max :
  ?partition_key:partition_key_list ->
  ?table_arn:amazon_resource_name ->
  ?value:double ->
  unit ->
  query_spatial_coverage_max

val make_query_spatial_coverage : ?max:query_spatial_coverage_max -> unit -> query_spatial_coverage

val make_query_temporal_range_max :
  ?table_arn:amazon_resource_name -> ?value:long -> unit -> query_temporal_range_max

val make_query_temporal_range : ?max:query_temporal_range_max -> unit -> query_temporal_range

val make_query_insights_response :
  ?unload_written_bytes:long ->
  ?unload_written_rows:long ->
  ?unload_partition_count:long ->
  ?output_bytes:long ->
  ?output_rows:long ->
  ?query_table_count:long ->
  ?query_temporal_range:query_temporal_range ->
  ?query_spatial_coverage:query_spatial_coverage ->
  unit ->
  query_insights_response

val make_query_response :
  ?query_insights_response:query_insights_response ->
  ?query_status:query_status ->
  ?next_token:pagination_token ->
  column_info:column_info_list ->
  rows:row_list ->
  query_id:query_id ->
  unit ->
  query_response

val make_query_insights : mode:query_insights_mode -> unit -> query_insights

val make_query_request :
  ?query_insights:query_insights ->
  ?max_rows:max_query_results ->
  ?next_token:pagination_token ->
  ?client_token:client_request_token ->
  query_string:query_string ->
  unit ->
  query_request

val make_select_column :
  ?aliased:nullable_boolean ->
  ?table_name:resource_name ->
  ?database_name:resource_name ->
  ?type_:type_ ->
  ?name:string_ ->
  unit ->
  select_column

val make_parameter_mapping : type_:type_ -> name:string_ -> unit -> parameter_mapping

val make_prepare_query_response :
  parameters:parameter_mapping_list ->
  columns:select_column_list ->
  query_string:query_string ->
  unit ->
  prepare_query_response

val make_prepare_query_request :
  ?validate_only:nullable_boolean -> query_string:query_string -> unit -> prepare_query_request

val make_list_tags_for_resource_response :
  ?next_token:next_tags_for_resource_results_token ->
  tags:tag_list ->
  unit ->
  list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?next_token:next_tags_for_resource_results_token ->
  ?max_results:max_tags_for_resource_result ->
  resource_ar_n:amazon_resource_name ->
  unit ->
  list_tags_for_resource_request

val make_s3_configuration :
  ?encryption_option:s3_encryption_option ->
  ?object_key_prefix:s3_object_key_prefix ->
  bucket_name:s3_bucket_name ->
  unit ->
  s3_configuration

val make_error_report_configuration :
  s3_configuration:s3_configuration -> unit -> error_report_configuration

val make_timestream_destination :
  ?table_name:resource_name -> ?database_name:resource_name -> unit -> timestream_destination

val make_target_destination :
  ?timestream_destination:timestream_destination -> unit -> target_destination

val make_scheduled_query :
  ?last_run_status:scheduled_query_run_status ->
  ?target_destination:target_destination ->
  ?error_report_configuration:error_report_configuration ->
  ?next_invocation_time:time ->
  ?previous_invocation_time:time ->
  ?creation_time:time ->
  state:scheduled_query_state ->
  name:scheduled_query_name ->
  arn:amazon_resource_name ->
  unit ->
  scheduled_query

val make_list_scheduled_queries_response :
  ?next_token:next_scheduled_queries_results_token ->
  scheduled_queries:scheduled_query_list ->
  unit ->
  list_scheduled_queries_response

val make_list_scheduled_queries_request :
  ?next_token:next_scheduled_queries_results_token ->
  ?max_results:max_scheduled_queries_results ->
  unit ->
  list_scheduled_queries_request

val make_scheduled_query_insights :
  mode:scheduled_query_insights_mode -> unit -> scheduled_query_insights

val make_execute_scheduled_query_request :
  ?query_insights:scheduled_query_insights ->
  ?client_token:client_token ->
  invocation_time:time ->
  scheduled_query_arn:amazon_resource_name ->
  unit ->
  execute_scheduled_query_request

val make_schedule_configuration :
  schedule_expression:schedule_expression -> unit -> schedule_configuration

val make_notification_configuration :
  sns_configuration:sns_configuration -> unit -> notification_configuration

val make_dimension_mapping :
  dimension_value_type:dimension_value_type -> name:schema_name -> unit -> dimension_mapping

val make_multi_measure_attribute_mapping :
  ?target_multi_measure_attribute_name:schema_name ->
  measure_value_type:scalar_measure_value_type ->
  source_column:schema_name ->
  unit ->
  multi_measure_attribute_mapping

val make_multi_measure_mappings :
  ?target_multi_measure_name:schema_name ->
  multi_measure_attribute_mappings:multi_measure_attribute_mapping_list ->
  unit ->
  multi_measure_mappings

val make_mixed_measure_mapping :
  ?multi_measure_attribute_mappings:multi_measure_attribute_mapping_list ->
  ?target_measure_name:schema_name ->
  ?source_column:schema_name ->
  ?measure_name:schema_name ->
  measure_value_type:measure_value_type ->
  unit ->
  mixed_measure_mapping

val make_timestream_configuration :
  ?measure_name_column:schema_name ->
  ?mixed_measure_mappings:mixed_measure_mapping_list ->
  ?multi_measure_mappings:multi_measure_mappings ->
  dimension_mappings:dimension_mapping_list ->
  time_column:schema_name ->
  table_name:resource_name ->
  database_name:resource_name ->
  unit ->
  timestream_configuration

val make_target_configuration :
  timestream_configuration:timestream_configuration -> unit -> target_configuration

val make_execution_stats :
  ?query_result_rows:long ->
  ?records_ingested:long ->
  ?cumulative_bytes_scanned:long ->
  ?bytes_metered:long ->
  ?data_writes:long ->
  ?execution_time_in_millis:long ->
  unit ->
  execution_stats

val make_scheduled_query_insights_response :
  ?output_bytes:long ->
  ?output_rows:long ->
  ?query_table_count:long ->
  ?query_temporal_range:query_temporal_range ->
  ?query_spatial_coverage:query_spatial_coverage ->
  unit ->
  scheduled_query_insights_response

val make_s3_report_location :
  ?object_key:s3_object_key -> ?bucket_name:s3_bucket_name -> unit -> s3_report_location

val make_error_report_location :
  ?s3_report_location:s3_report_location -> unit -> error_report_location

val make_scheduled_query_run_summary :
  ?failure_reason:error_message ->
  ?error_report_location:error_report_location ->
  ?query_insights_response:scheduled_query_insights_response ->
  ?execution_stats:execution_stats ->
  ?run_status:scheduled_query_run_status ->
  ?trigger_time:time ->
  ?invocation_time:time ->
  unit ->
  scheduled_query_run_summary

val make_scheduled_query_description :
  ?recently_failed_runs:scheduled_query_run_summary_list ->
  ?last_run_summary:scheduled_query_run_summary ->
  ?error_report_configuration:error_report_configuration ->
  ?kms_key_id:string_value2048 ->
  ?scheduled_query_execution_role_arn:amazon_resource_name ->
  ?target_configuration:target_configuration ->
  ?next_invocation_time:time ->
  ?previous_invocation_time:time ->
  ?creation_time:time ->
  notification_configuration:notification_configuration ->
  schedule_configuration:schedule_configuration ->
  state:scheduled_query_state ->
  query_string:query_string ->
  name:scheduled_query_name ->
  arn:amazon_resource_name ->
  unit ->
  scheduled_query_description

val make_describe_scheduled_query_response :
  scheduled_query:scheduled_query_description -> unit -> describe_scheduled_query_response

val make_describe_scheduled_query_request :
  scheduled_query_arn:amazon_resource_name -> unit -> describe_scheduled_query_request

val make_endpoint : cache_period_in_minutes:long -> address:string_ -> unit -> endpoint
val make_describe_endpoints_response : endpoints:endpoints -> unit -> describe_endpoints_response
val make_describe_endpoints_request : unit -> unit

val make_describe_account_settings_response :
  ?query_compute:query_compute_response ->
  ?query_pricing_model:query_pricing_model ->
  ?max_query_tc_u:max_query_capacity ->
  unit ->
  describe_account_settings_response

val make_describe_account_settings_request : unit -> unit

val make_delete_scheduled_query_request :
  scheduled_query_arn:amazon_resource_name -> unit -> delete_scheduled_query_request

val make_create_scheduled_query_response :
  arn:amazon_resource_name -> unit -> create_scheduled_query_response

val make_create_scheduled_query_request :
  ?kms_key_id:string_value2048 ->
  ?tags:tag_list ->
  ?client_token:client_token ->
  ?target_configuration:target_configuration ->
  error_report_configuration:error_report_configuration ->
  scheduled_query_execution_role_arn:amazon_resource_name ->
  notification_configuration:notification_configuration ->
  schedule_configuration:schedule_configuration ->
  query_string:query_string ->
  name:scheduled_query_name ->
  unit ->
  create_scheduled_query_request

val make_cancel_query_response : ?cancellation_message:string_ -> unit -> cancel_query_response

val make_cancel_query_request : query_id:query_id -> unit -> cancel_query_request
(** {1:operations Operations} *)

module CancelQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_query_request ->
    ( cancel_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_query_request ->
    ( cancel_query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Cancels a query that has been issued. Cancellation is provided only if the query has not \
   completed running before the cancellation request was issued. Because cancellation is an \
   idempotent operation, subsequent cancellation requests will return a [CancellationMessage], \
   indicating that the query has already been canceled. See \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.cancel-query.html}code \
   sample} for details. \n"]

module CreateScheduledQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_scheduled_query_request ->
    ( create_scheduled_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_scheduled_query_request ->
    ( create_scheduled_query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Create a scheduled query that will be run on your behalf at the configured schedule. \
   Timestream assumes the execution role provided as part of the [ScheduledQueryExecutionRoleArn] \
   parameter to run the query. You can use the [NotificationConfiguration] parameter to configure \
   notification for your scheduled query operations.\n"]

module DeleteScheduledQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_query_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_query_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a given scheduled query. This is an irreversible operation. \n"]

module DescribeAccountSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_settings_request ->
    ( describe_account_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_settings_request ->
    ( describe_account_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the settings for your account that include the query pricing model and the configured \
   maximum TCUs the service can use for your query workload.\n\n\
  \ You're charged only for the duration of compute units used for your workloads.\n\
  \ "]

module DescribeEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoints_request ->
    ( describe_endpoints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoints_request ->
    ( describe_endpoints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "DescribeEndpoints returns a list of available endpoints to make Timestream API calls against. \
   This API is available through both Write and Query.\n\n\
  \ Because the Timestream SDKs are designed to transparently work with the service\226\128\153s \
   architecture, including the management and mapping of the service endpoints, {i it is not \
   recommended that you use this API unless}:\n\
  \ \n\
  \  {ul\n\
  \        {-  You are using \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/VPCEndpoints}VPC endpoints \
   (Amazon Web Services PrivateLink) with Timestream } \n\
  \            \n\
  \             }\n\
  \        {-  Your application uses a programming language that does not yet have SDK support\n\
  \            \n\
  \             }\n\
  \        {-  You require better control over the client-side implementation\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For detailed information on how and when to use and implement DescribeEndpoints, see \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/Using.API.html#Using-API.endpoint-discovery}The \
   Endpoint Discovery Pattern}.\n\
  \   "]

module DescribeScheduledQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_scheduled_query_request ->
    ( describe_scheduled_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_scheduled_query_request ->
    ( describe_scheduled_query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides detailed information about a scheduled query.\n"]

module ExecuteScheduledQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    execute_scheduled_query_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    execute_scheduled_query_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " You can use this API to run a scheduled query manually. \n\n\
  \ If you enabled [QueryInsights], this API also returns insights and metrics related to the \
   query that you executed as part of an Amazon SNS notification. [QueryInsights] helps with \
   performance tuning of your query. For more information about [QueryInsights], see \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/using-query-insights.html}Using \
   query insights to optimize queries in Amazon Timestream}.\n\
  \ "]

module ListScheduledQueries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_scheduled_queries_request ->
    ( list_scheduled_queries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_scheduled_queries_request ->
    ( list_scheduled_queries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of all scheduled queries in the caller's Amazon account and Region. \
   [ListScheduledQueries] is eventually consistent. \n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List all tags on a Timestream query resource.\n"]

module PrepareQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    prepare_query_request ->
    ( prepare_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    prepare_query_request ->
    ( prepare_query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "A synchronous operation that allows you to submit a query with parameters to be stored by \
   Timestream for later running. Timestream only supports using this operation with [ValidateOnly] \
   set to [true]. \n"]

module Query : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `QueryExecutionException of query_execution_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    query_request ->
    ( query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `QueryExecutionException of query_execution_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    query_request ->
    ( query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `QueryExecutionException of query_execution_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " [Query] is a synchronous operation that enables you to run a query against your Amazon \
   Timestream data.\n\n\
  \ If you enabled [QueryInsights], this API also returns insights and metrics related to the \
   query that you executed. [QueryInsights] helps with performance tuning of your query. For more \
   information about [QueryInsights], see \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/using-query-insights.html}Using \
   query insights to optimize queries in Amazon Timestream}.\n\
  \ \n\
  \   The maximum number of [Query] API requests you're allowed to make with [QueryInsights] \
   enabled is 1 query per second (QPS). If you exceed this query rate, it might result in \
   throttling.\n\
  \   \n\
  \      [Query] will time out after 60 seconds. You must update the default timeout in the SDK to \
   support a timeout of 60 seconds. See the \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.run-query.html}code \
   sample} for details. \n\
  \     \n\
  \      Your query request will fail in the following cases:\n\
  \      \n\
  \       {ul\n\
  \             {-   If you submit a [Query] request with the same client token outside of the \
   5-minute idempotency window. \n\
  \                 \n\
  \                  }\n\
  \             {-   If you submit a [Query] request with the same client token, but change other \
   parameters, within the 5-minute idempotency window. \n\
  \                 \n\
  \                  }\n\
  \             {-   If the size of the row (including the query metadata) exceeds 1 MB, then the \
   query will fail with the following error message: \n\
  \                 \n\
  \                   [Query aborted as max page response size has been exceeded by the output\n\
  \                        result row] \n\
  \                  \n\
  \                   }\n\
  \             {-   If the IAM principal of the query initiator and the result reader are not the \
   same and/or the query initiator and the result reader do not have the same query string in the \
   query requests, the query will fail with an [Invalid\n\
  \                        pagination token] error. \n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \  "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associate a set of tags with a Timestream resource. You can then activate these user-defined \
   tags so that they appear on the Billing and Cost Management console for cost allocation \
   tracking. \n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes the association of tags from a Timestream query resource.\n"]

module UpdateAccountSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_account_settings_request ->
    ( update_account_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_account_settings_request ->
    ( update_account_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Transitions your account to use TCUs for query pricing and modifies the maximum query compute \
   units that you've configured. If you reduce the value of [MaxQueryTCU] to a desired \
   configuration, the new value can take up to 24 hours to be effective.\n\n\
  \  After you've transitioned your account to use TCUs for query pricing, you can't transition to \
   using bytes scanned for query pricing.\n\
  \  \n\
  \   "]

(** {1:Serialization and Deserialization} *)
module UpdateScheduledQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_scheduled_query_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_scheduled_query_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update a scheduled query.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
