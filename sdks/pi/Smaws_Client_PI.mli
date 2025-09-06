(** 
    PI client library built on EIO.
    
*)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_untag_resource_response : unit -> unit
val make_untag_resource_request :
  tag_keys:tag_key_list ->
    resource_ar_n:amazon_resource_name ->
      service_type:service_type -> unit -> untag_resource_request
val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_request :
  tags:tag_list ->
    resource_ar_n:amazon_resource_name ->
      service_type:service_type -> unit -> tag_resource_request
val make_response_resource_metric :
  ?unit_:string_ ->
    ?description:description ->
      ?metric:string_ -> unit -> response_resource_metric
val make_response_resource_metric_key :
  ?dimensions:dimension_map ->
    metric:string_ -> unit -> response_resource_metric_key
val make_response_partition_key :
  dimensions:dimension_map -> unit -> response_partition_key
val make_recommendation :
  ?recommendation_description:markdown_string ->
    ?recommendation_id:string_ -> unit -> recommendation
val make_list_tags_for_resource_response :
  ?tags:tag_list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name ->
    service_type:service_type -> unit -> list_tags_for_resource_request
val make_analysis_report_summary :
  ?tags:tag_list ->
    ?status:analysis_status ->
      ?end_time:iso_timestamp ->
        ?start_time:iso_timestamp ->
          ?create_time:iso_timestamp ->
            ?analysis_report_id:string_ -> unit -> analysis_report_summary
val make_list_performance_analysis_reports_response :
  ?next_token:next_token ->
    ?analysis_reports:analysis_report_summary_list ->
      unit -> list_performance_analysis_reports_response
val make_list_performance_analysis_reports_request :
  ?list_tags:boolean_ ->
    ?max_results:max_results ->
      ?next_token:next_token ->
        identifier:identifier_string ->
          service_type:service_type ->
            unit -> list_performance_analysis_reports_request
val make_list_available_resource_metrics_response :
  ?next_token:next_token ->
    ?metrics:response_resource_metric_list ->
      unit -> list_available_resource_metrics_response
val make_list_available_resource_metrics_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      metric_types:metric_type_list ->
        identifier:identifier_string ->
          service_type:service_type ->
            unit -> list_available_resource_metrics_request
val make_dimension_detail : ?identifier:string_ -> unit -> dimension_detail
val make_dimension_group_detail :
  ?dimensions:dimension_detail_list ->
    ?group:string_ -> unit -> dimension_group_detail
val make_metric_dimension_groups :
  ?groups:dimension_group_detail_list ->
    ?metric:string_ -> unit -> metric_dimension_groups
val make_list_available_resource_dimensions_response :
  ?next_token:next_token ->
    ?metric_dimensions:metric_dimensions_list ->
      unit -> list_available_resource_dimensions_response
val make_list_available_resource_dimensions_request :
  ?authorized_actions:authorized_actions_list ->
    ?next_token:next_token ->
      ?max_results:max_results ->
        metrics:dimensions_metric_list ->
          identifier:identifier_string ->
            service_type:service_type ->
              unit -> list_available_resource_dimensions_request
val make_data_point :
  value:double -> timestamp:iso_timestamp -> unit -> data_point
val make_metric_key_data_points :
  ?data_points:data_points_list ->
    ?key:response_resource_metric_key -> unit -> metric_key_data_points
val make_get_resource_metrics_response :
  ?next_token:next_token ->
    ?metric_list:metric_key_data_points_list ->
      ?identifier:string_ ->
        ?aligned_end_time:iso_timestamp ->
          ?aligned_start_time:iso_timestamp ->
            unit -> get_resource_metrics_response
val make_dimension_group :
  ?limit:limit ->
    ?dimensions:sanitized_string_list ->
      group:sanitized_string -> unit -> dimension_group
val make_metric_query :
  ?filter:metric_query_filter_map ->
    ?group_by:dimension_group ->
      metric:sanitized_string -> unit -> metric_query
val make_get_resource_metrics_request :
  ?period_alignment:period_alignment ->
    ?next_token:next_token ->
      ?max_results:max_results ->
        ?period_in_seconds:integer ->
          end_time:iso_timestamp ->
            start_time:iso_timestamp ->
              metric_queries:metric_query_list ->
                identifier:identifier_string ->
                  service_type:service_type ->
                    unit -> get_resource_metrics_request
val make_feature_metadata :
  ?status:feature_status -> unit -> feature_metadata
val make_get_resource_metadata_response :
  ?features:feature_metadata_map ->
    ?identifier:string_ -> unit -> get_resource_metadata_response
val make_get_resource_metadata_request :
  identifier:identifier_string ->
    service_type:service_type -> unit -> get_resource_metadata_request
val make_performance_insights_metric :
  ?value:double ->
    ?filter:descriptive_map ->
      ?dimensions:descriptive_map ->
        ?display_name:descriptive_string ->
          ?metric:descriptive_string -> unit -> performance_insights_metric
val make_data :
  ?performance_insights_metric:performance_insights_metric -> unit -> data
val make_insight :
  ?baseline_data:data_list ->
    ?insight_data:data_list ->
      ?recommendations:recommendation_list ->
        ?description:markdown_string ->
          ?supporting_insights:insight_list ->
            ?severity:severity ->
              ?end_time:iso_timestamp ->
                ?start_time:iso_timestamp ->
                  ?context:context_type ->
                    ?insight_type:string_ ->
                      insight_id:string_ -> unit -> insight
val make_analysis_report :
  ?insights:insight_list ->
    ?status:analysis_status ->
      ?end_time:iso_timestamp ->
        ?start_time:iso_timestamp ->
          ?create_time:iso_timestamp ->
            ?service_type:service_type ->
              ?identifier:identifier_string ->
                analysis_report_id:analysis_report_id ->
                  unit -> analysis_report
val make_get_performance_analysis_report_response :
  ?analysis_report:analysis_report ->
    unit -> get_performance_analysis_report_response
val make_get_performance_analysis_report_request :
  ?accept_language:accept_language ->
    ?text_format:text_format ->
      analysis_report_id:analysis_report_id ->
        identifier:identifier_string ->
          service_type:service_type ->
            unit -> get_performance_analysis_report_request
val make_dimension_key_detail :
  ?status:detail_status ->
    ?dimension:string_ -> ?value:string_ -> unit -> dimension_key_detail
val make_get_dimension_key_details_response :
  ?dimensions:dimension_key_detail_list ->
    unit -> get_dimension_key_details_response
val make_get_dimension_key_details_request :
  ?requested_dimensions:requested_dimension_list ->
    group_identifier:request_string ->
      group:request_string ->
        identifier:identifier_string ->
          service_type:service_type ->
            unit -> get_dimension_key_details_request
val make_dimension_key_description :
  ?partitions:metric_values_list ->
    ?additional_metrics:additional_metrics_map ->
      ?total:double ->
        ?dimensions:dimension_map -> unit -> dimension_key_description
val make_describe_dimension_keys_response :
  ?next_token:next_token ->
    ?keys:dimension_key_description_list ->
      ?partition_keys:response_partition_key_list ->
        ?aligned_end_time:iso_timestamp ->
          ?aligned_start_time:iso_timestamp ->
            unit -> describe_dimension_keys_response
val make_describe_dimension_keys_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?filter:metric_query_filter_map ->
        ?partition_by:dimension_group ->
          ?additional_metrics:additional_metrics_list ->
            ?period_in_seconds:integer ->
              group_by:dimension_group ->
                metric:request_string ->
                  end_time:iso_timestamp ->
                    start_time:iso_timestamp ->
                      identifier:identifier_string ->
                        service_type:service_type ->
                          unit -> describe_dimension_keys_request
val make_delete_performance_analysis_report_response : unit -> unit
val make_delete_performance_analysis_report_request :
  analysis_report_id:analysis_report_id ->
    identifier:identifier_string ->
      service_type:service_type ->
        unit -> delete_performance_analysis_report_request
val make_create_performance_analysis_report_response :
  ?analysis_report_id:analysis_report_id ->
    unit -> create_performance_analysis_report_response
val make_create_performance_analysis_report_request :
  ?tags:tag_list ->
    end_time:iso_timestamp ->
      start_time:iso_timestamp ->
        identifier:identifier_string ->
          service_type:service_type ->
            unit -> create_performance_analysis_report_request
(** {1:operations Operations} *)

module CreatePerformanceAnalysisReport :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_performance_analysis_report_request ->
        (create_performance_analysis_report_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceError of internal_service_error 
          | `InvalidArgumentException of invalid_argument_exception 
          | `NotAuthorizedException of not_authorized_exception ]) result
end[@@ocaml.doc
     "Creates a new performance analysis report for a specific time period for the DB instance.\n"]
module DeletePerformanceAnalysisReport :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_performance_analysis_report_request ->
        (delete_performance_analysis_report_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceError of internal_service_error 
          | `InvalidArgumentException of invalid_argument_exception 
          | `NotAuthorizedException of not_authorized_exception ]) result
end[@@ocaml.doc "Deletes a performance analysis report.\n"]
module DescribeDimensionKeys :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_dimension_keys_request ->
        (describe_dimension_keys_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceError of internal_service_error 
          | `InvalidArgumentException of invalid_argument_exception 
          | `NotAuthorizedException of not_authorized_exception ]) result
end[@@ocaml.doc
     "For a specific time period, retrieve the top [N] dimension keys for a metric. \n\n  Each response element returns a maximum of 500 bytes. For larger elements, such as SQL statements, only the first 500 bytes are returned.\n  \n   "]
module GetDimensionKeyDetails :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_dimension_key_details_request ->
        (get_dimension_key_details_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceError of internal_service_error 
          | `InvalidArgumentException of invalid_argument_exception 
          | `NotAuthorizedException of not_authorized_exception ]) result
end[@@ocaml.doc
     "Get the attributes of the specified dimension group for a DB instance or data source. For example, if you specify a SQL ID, [GetDimensionKeyDetails] retrieves the full text of the dimension [db.sql.statement] associated with this ID. This operation is useful because [GetResourceMetrics] and [DescribeDimensionKeys] don't support retrieval of large SQL statement text, lock snapshots, and execution plans.\n"]
module GetPerformanceAnalysisReport :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_performance_analysis_report_request ->
        (get_performance_analysis_report_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceError of internal_service_error 
          | `InvalidArgumentException of invalid_argument_exception 
          | `NotAuthorizedException of not_authorized_exception ]) result
end[@@ocaml.doc
     "Retrieves the report including the report ID, status, time details, and the insights with recommendations. The report status can be [RUNNING], [SUCCEEDED], or [FAILED]. The insights include the [description] and [recommendation] fields. \n"]
module GetResourceMetadata :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_metadata_request ->
        (get_resource_metadata_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceError of internal_service_error 
          | `InvalidArgumentException of invalid_argument_exception 
          | `NotAuthorizedException of not_authorized_exception ]) result
end[@@ocaml.doc
     "Retrieve the metadata for different features. For example, the metadata might indicate that a feature is turned on or off on a specific DB instance. \n"]
module GetResourceMetrics :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_metrics_request ->
        (get_resource_metrics_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceError of internal_service_error 
          | `InvalidArgumentException of invalid_argument_exception 
          | `NotAuthorizedException of not_authorized_exception ]) result
end[@@ocaml.doc
     "Retrieve Performance Insights metrics for a set of data sources over a time period. You can provide specific dimension groups and dimensions, and provide filtering criteria for each group. You must specify an aggregate function for each metric.\n\n  Each response element returns a maximum of 500 bytes. For larger elements, such as SQL statements, only the first 500 bytes are returned.\n  \n   "]
module ListAvailableResourceDimensions :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_available_resource_dimensions_request ->
        (list_available_resource_dimensions_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceError of internal_service_error 
          | `InvalidArgumentException of invalid_argument_exception 
          | `NotAuthorizedException of not_authorized_exception ]) result
end[@@ocaml.doc
     "Retrieve the dimensions that can be queried for each specified metric type on a specified DB instance.\n"]
module ListAvailableResourceMetrics :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_available_resource_metrics_request ->
        (list_available_resource_metrics_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceError of internal_service_error 
          | `InvalidArgumentException of invalid_argument_exception 
          | `NotAuthorizedException of not_authorized_exception ]) result
end[@@ocaml.doc
     "Retrieve metrics of the specified types that can be queried for a specified DB instance. \n"]
module ListPerformanceAnalysisReports :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_performance_analysis_reports_request ->
        (list_performance_analysis_reports_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceError of internal_service_error 
          | `InvalidArgumentException of invalid_argument_exception 
          | `NotAuthorizedException of not_authorized_exception ]) result
end[@@ocaml.doc
     "Lists all the analysis reports created for the DB instance. The reports are sorted based on the start time of each report.\n"]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceError of internal_service_error 
          | `InvalidArgumentException of invalid_argument_exception 
          | `NotAuthorizedException of not_authorized_exception ]) result
end[@@ocaml.doc
     "Retrieves all the metadata tags associated with Amazon RDS Performance Insights resource.\n"]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceError of internal_service_error 
          | `InvalidArgumentException of invalid_argument_exception 
          | `NotAuthorizedException of not_authorized_exception ]) result
end[@@ocaml.doc
     "Adds metadata tags to the Amazon RDS Performance Insights resource.\n"]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceError of internal_service_error 
          | `InvalidArgumentException of invalid_argument_exception 
          | `NotAuthorizedException of not_authorized_exception ]) result
end[@@ocaml.doc
     "Deletes the metadata tags from the Amazon RDS Performance Insights resource.\n"](** {1:Serialization and Deserialization} *)

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
