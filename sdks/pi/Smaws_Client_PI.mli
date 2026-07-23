(** PI client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_performance_insights_metric :
  ?metric:descriptive_string ->
  ?display_name:descriptive_string ->
  ?dimensions:descriptive_map ->
  ?filter:descriptive_map ->
  ?value:double ->
  unit ->
  performance_insights_metric

val make_data : ?performance_insights_metric:performance_insights_metric -> unit -> data

val make_recommendation :
  ?recommendation_id:string_ ->
  ?recommendation_description:markdown_string ->
  ?recommendation_details:markdown_string ->
  unit ->
  recommendation

val make_insight :
  ?insight_type:string_ ->
  ?context:context_type ->
  ?start_time:iso_timestamp ->
  ?end_time:iso_timestamp ->
  ?severity:severity ->
  ?supporting_insights:insight_list ->
  ?description:markdown_string ->
  ?recommendations:recommendation_list ->
  ?insight_data:data_list ->
  ?baseline_data:data_list ->
  insight_id:string_ ->
  unit ->
  insight

val make_analysis_report :
  ?identifier:identifier_string ->
  ?service_type:service_type ->
  ?create_time:iso_timestamp ->
  ?start_time:iso_timestamp ->
  ?end_time:iso_timestamp ->
  ?status:analysis_status ->
  ?insights:insight_list ->
  analysis_report_id:analysis_report_id ->
  unit ->
  analysis_report

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_analysis_report_summary :
  ?analysis_report_id:string_ ->
  ?create_time:iso_timestamp ->
  ?start_time:iso_timestamp ->
  ?end_time:iso_timestamp ->
  ?status:analysis_status ->
  ?tags:tag_list ->
  unit ->
  analysis_report_summary

val make_create_performance_analysis_report_response :
  ?analysis_report_id:analysis_report_id -> unit -> create_performance_analysis_report_response

val make_create_performance_analysis_report_request :
  ?end_time:iso_timestamp ->
  ?tags:tag_list ->
  service_type:service_type ->
  identifier:identifier_string ->
  start_time:iso_timestamp ->
  unit ->
  create_performance_analysis_report_request

val make_data_point : timestamp:iso_timestamp -> value:double -> unit -> data_point
val make_delete_performance_analysis_report_response : unit -> unit

val make_delete_performance_analysis_report_request :
  service_type:service_type ->
  identifier:identifier_string ->
  analysis_report_id:analysis_report_id ->
  unit ->
  delete_performance_analysis_report_request

val make_dimension_key_description :
  ?dimensions:dimension_map ->
  ?total:double ->
  ?additional_metrics:additional_metrics_map ->
  ?partitions:metric_values_list ->
  unit ->
  dimension_key_description

val make_response_partition_key : dimensions:dimension_map -> unit -> response_partition_key

val make_describe_dimension_keys_response :
  ?aligned_start_time:iso_timestamp ->
  ?aligned_end_time:iso_timestamp ->
  ?partition_keys:response_partition_key_list ->
  ?keys:dimension_key_description_list ->
  ?next_token:next_token ->
  unit ->
  describe_dimension_keys_response

val make_dimension_group :
  ?dimensions:sanitized_string_list ->
  ?limit:limit ->
  group:sanitized_string ->
  unit ->
  dimension_group

val make_describe_dimension_keys_request :
  ?period_in_seconds:integer ->
  ?additional_metrics:additional_metrics_list ->
  ?partition_by:dimension_group ->
  ?filter:metric_query_filter_map ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  service_type:service_type ->
  identifier:identifier_string ->
  start_time:iso_timestamp ->
  end_time:iso_timestamp ->
  metric:request_string ->
  group_by:dimension_group ->
  unit ->
  describe_dimension_keys_request

val make_dimension_detail : ?identifier:string_ -> unit -> dimension_detail

val make_dimension_group_detail :
  ?group:string_ -> ?dimensions:dimension_detail_list -> unit -> dimension_group_detail

val make_dimension_key_detail :
  ?value:string_ -> ?dimension:string_ -> ?status:detail_status -> unit -> dimension_key_detail

val make_feature_metadata : ?status:feature_status -> unit -> feature_metadata

val make_get_dimension_key_details_response :
  ?dimensions:dimension_key_detail_list -> unit -> get_dimension_key_details_response

val make_get_dimension_key_details_request :
  ?requested_dimensions:requested_dimension_list ->
  service_type:service_type ->
  identifier:identifier_string ->
  group:request_string ->
  group_identifier:request_string ->
  unit ->
  get_dimension_key_details_request

val make_get_performance_analysis_report_response :
  ?analysis_report:analysis_report -> unit -> get_performance_analysis_report_response

val make_get_performance_analysis_report_request :
  ?text_format:text_format ->
  ?accept_language:accept_language ->
  service_type:service_type ->
  identifier:identifier_string ->
  analysis_report_id:analysis_report_id ->
  unit ->
  get_performance_analysis_report_request

val make_get_resource_metadata_response :
  ?identifier:string_ -> ?features:feature_metadata_map -> unit -> get_resource_metadata_response

val make_get_resource_metadata_request :
  service_type:service_type -> identifier:identifier_string -> unit -> get_resource_metadata_request

val make_response_resource_metric_key :
  ?dimensions:dimension_map -> metric:string_ -> unit -> response_resource_metric_key

val make_metric_key_data_points :
  ?key:response_resource_metric_key ->
  ?data_points:data_points_list ->
  unit ->
  metric_key_data_points

val make_get_resource_metrics_response :
  ?aligned_start_time:iso_timestamp ->
  ?aligned_end_time:iso_timestamp ->
  ?identifier:string_ ->
  ?metric_list:metric_key_data_points_list ->
  ?next_token:next_token ->
  unit ->
  get_resource_metrics_response

val make_metric_query :
  ?group_by:dimension_group ->
  ?filter:metric_query_filter_map ->
  metric:sanitized_string ->
  unit ->
  metric_query

val make_get_resource_metrics_request :
  ?period_in_seconds:integer ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?period_alignment:period_alignment ->
  service_type:service_type ->
  identifier:identifier_string ->
  metric_queries:metric_query_list ->
  start_time:iso_timestamp ->
  end_time:iso_timestamp ->
  unit ->
  get_resource_metrics_request

val make_metric_dimension_groups :
  ?metric:string_ -> ?groups:dimension_group_detail_list -> unit -> metric_dimension_groups

val make_list_available_resource_dimensions_response :
  ?metric_dimensions:metric_dimensions_list ->
  ?next_token:next_token ->
  unit ->
  list_available_resource_dimensions_response

val make_list_available_resource_dimensions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?authorized_actions:authorized_actions_list ->
  service_type:service_type ->
  identifier:identifier_string ->
  metrics:dimensions_metric_list ->
  unit ->
  list_available_resource_dimensions_request

val make_response_resource_metric :
  ?metric:string_ -> ?description:description -> ?unit_:string_ -> unit -> response_resource_metric

val make_list_available_resource_metrics_response :
  ?metrics:response_resource_metric_list ->
  ?next_token:next_token ->
  unit ->
  list_available_resource_metrics_response

val make_list_available_resource_metrics_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  service_type:service_type ->
  identifier:identifier_string ->
  metric_types:metric_type_list ->
  unit ->
  list_available_resource_metrics_request

val make_list_performance_analysis_report_recommendations_response :
  ?recommendations:recommendation_list ->
  ?next_token:next_token ->
  unit ->
  list_performance_analysis_report_recommendations_response

val make_list_performance_analysis_report_recommendations_request :
  ?recommendation_ids:recommendation_id_list ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  service_type:service_type ->
  identifier:identifier_string ->
  analysis_report_id:analysis_report_id ->
  unit ->
  list_performance_analysis_report_recommendations_request

val make_list_performance_analysis_reports_response :
  ?analysis_reports:analysis_report_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_performance_analysis_reports_response

val make_list_performance_analysis_reports_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?list_tags:boolean_ ->
  service_type:service_type ->
  identifier:identifier_string ->
  unit ->
  list_performance_analysis_reports_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  service_type:service_type ->
  resource_ar_n:amazon_resource_name ->
  unit ->
  list_tags_for_resource_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  service_type:service_type ->
  resource_ar_n:amazon_resource_name ->
  tag_keys:tag_key_list ->
  unit ->
  untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  service_type:service_type ->
  resource_ar_n:amazon_resource_name ->
  tags:tag_list ->
  unit ->
  tag_resource_request
(** {1:operations Operations} *)

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidArgumentException of invalid_argument_exception
    | `NotAuthorizedException of not_authorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds metadata tags to the Amazon RDS Performance Insights resource.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidArgumentException of invalid_argument_exception
    | `NotAuthorizedException of not_authorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the metadata tags from the Amazon RDS Performance Insights resource.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidArgumentException of invalid_argument_exception
    | `NotAuthorizedException of not_authorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves all the metadata tags associated with Amazon RDS Performance Insights resource.\n"]

module ListPerformanceAnalysisReports : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidArgumentException of invalid_argument_exception
    | `NotAuthorizedException of not_authorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_performance_analysis_reports_request ->
    ( list_performance_analysis_reports_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_performance_analysis_reports_request ->
    ( list_performance_analysis_reports_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the analysis reports created for the DB instance. The reports are sorted based on the \
   start time of each report.\n"]

module ListPerformanceAnalysisReportRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidArgumentException of invalid_argument_exception
    | `NotAuthorizedException of not_authorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_performance_analysis_report_recommendations_request ->
    ( list_performance_analysis_report_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_performance_analysis_report_recommendations_request ->
    ( list_performance_analysis_report_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves recommendations for a performance analysis report.\n"]

module ListAvailableResourceMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidArgumentException of invalid_argument_exception
    | `NotAuthorizedException of not_authorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_available_resource_metrics_request ->
    ( list_available_resource_metrics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_available_resource_metrics_request ->
    ( list_available_resource_metrics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieve metrics of the specified types that can be queried for a specified DB instance. \n"]

module ListAvailableResourceDimensions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidArgumentException of invalid_argument_exception
    | `NotAuthorizedException of not_authorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_available_resource_dimensions_request ->
    ( list_available_resource_dimensions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_available_resource_dimensions_request ->
    ( list_available_resource_dimensions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieve the dimensions that can be queried for each specified metric type on a specified DB \
   instance.\n"]

module GetResourceMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidArgumentException of invalid_argument_exception
    | `NotAuthorizedException of not_authorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_metrics_request ->
    ( get_resource_metrics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_metrics_request ->
    ( get_resource_metrics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieve Performance Insights metrics for a set of data sources over a time period. You can \
   provide specific dimension groups and dimensions, and provide filtering criteria for each \
   group. You must specify an aggregate function for each metric.\n\n\
  \  Each response element returns a maximum of 500 bytes. For larger elements, such as SQL \
   statements, only the first 500 bytes are returned.\n\
  \  \n\
  \   "]

module GetResourceMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidArgumentException of invalid_argument_exception
    | `NotAuthorizedException of not_authorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_metadata_request ->
    ( get_resource_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_metadata_request ->
    ( get_resource_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieve the metadata for different features. For example, the metadata might indicate that a \
   feature is turned on or off on a specific DB instance. \n"]

module GetPerformanceAnalysisReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidArgumentException of invalid_argument_exception
    | `NotAuthorizedException of not_authorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_performance_analysis_report_request ->
    ( get_performance_analysis_report_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_performance_analysis_report_request ->
    ( get_performance_analysis_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the report including the report ID, status, time details, and the insights with \
   recommendations. The report status can be [RUNNING], [SUCCEEDED], or [FAILED]. The insights \
   include the [description] and [recommendation] fields. \n"]

module GetDimensionKeyDetails : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidArgumentException of invalid_argument_exception
    | `NotAuthorizedException of not_authorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_dimension_key_details_request ->
    ( get_dimension_key_details_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_dimension_key_details_request ->
    ( get_dimension_key_details_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Get the attributes of the specified dimension group for a DB instance or data source. For \
   example, if you specify a SQL ID, [GetDimensionKeyDetails] retrieves the full text of the \
   dimension [db.sql.statement] associated with this ID. This operation is useful because \
   [GetResourceMetrics] and [DescribeDimensionKeys] don't support retrieval of large SQL statement \
   text, lock snapshots, and execution plans.\n"]

module DescribeDimensionKeys : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidArgumentException of invalid_argument_exception
    | `NotAuthorizedException of not_authorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_dimension_keys_request ->
    ( describe_dimension_keys_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_dimension_keys_request ->
    ( describe_dimension_keys_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For a specific time period, retrieve the top [N] dimension keys for a metric. \n\n\
  \  Each response element returns a maximum of 500 bytes. For larger elements, such as SQL \
   statements, only the first 500 bytes are returned.\n\
  \  \n\
  \   "]

module DeletePerformanceAnalysisReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidArgumentException of invalid_argument_exception
    | `NotAuthorizedException of not_authorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_performance_analysis_report_request ->
    ( delete_performance_analysis_report_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_performance_analysis_report_request ->
    ( delete_performance_analysis_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a performance analysis report.\n"]

(** {1:Serialization and Deserialization} *)
module CreatePerformanceAnalysisReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidArgumentException of invalid_argument_exception
    | `NotAuthorizedException of not_authorized_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_performance_analysis_report_request ->
    ( create_performance_analysis_report_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_performance_analysis_report_request ->
    ( create_performance_analysis_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidArgumentException of invalid_argument_exception
      | `NotAuthorizedException of not_authorized_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new performance analysis report for a specific time period for the DB instance.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
