open Types

let make_performance_insights_metric ?metric:(metric_ : descriptive_string option)
    ?display_name:(display_name_ : descriptive_string option)
    ?dimensions:(dimensions_ : descriptive_map option) ?filter:(filter_ : descriptive_map option)
    ?value:(value_ : double option) () =
  ({
     metric = metric_;
     display_name = display_name_;
     dimensions = dimensions_;
     filter = filter_;
     value = value_;
   }
    : performance_insights_metric)

let make_data
    ?performance_insights_metric:(performance_insights_metric_ : performance_insights_metric option)
    () =
  ({ performance_insights_metric = performance_insights_metric_ } : data)

let make_recommendation ?recommendation_id:(recommendation_id_ : string_ option)
    ?recommendation_description:(recommendation_description_ : markdown_string option)
    ?recommendation_details:(recommendation_details_ : markdown_string option) () =
  ({
     recommendation_id = recommendation_id_;
     recommendation_description = recommendation_description_;
     recommendation_details = recommendation_details_;
   }
    : recommendation)

let make_insight ?insight_type:(insight_type_ : string_ option)
    ?context:(context_ : context_type option) ?start_time:(start_time_ : iso_timestamp option)
    ?end_time:(end_time_ : iso_timestamp option) ?severity:(severity_ : severity option)
    ?supporting_insights:(supporting_insights_ : insight_list option)
    ?description:(description_ : markdown_string option)
    ?recommendations:(recommendations_ : recommendation_list option)
    ?insight_data:(insight_data_ : data_list option)
    ?baseline_data:(baseline_data_ : data_list option) ~insight_id:(insight_id_ : string_) () =
  ({
     insight_id = insight_id_;
     insight_type = insight_type_;
     context = context_;
     start_time = start_time_;
     end_time = end_time_;
     severity = severity_;
     supporting_insights = supporting_insights_;
     description = description_;
     recommendations = recommendations_;
     insight_data = insight_data_;
     baseline_data = baseline_data_;
   }
    : insight)

let make_analysis_report ?identifier:(identifier_ : identifier_string option)
    ?service_type:(service_type_ : service_type option)
    ?create_time:(create_time_ : iso_timestamp option)
    ?start_time:(start_time_ : iso_timestamp option) ?end_time:(end_time_ : iso_timestamp option)
    ?status:(status_ : analysis_status option) ?insights:(insights_ : insight_list option)
    ~analysis_report_id:(analysis_report_id_ : analysis_report_id) () =
  ({
     analysis_report_id = analysis_report_id_;
     identifier = identifier_;
     service_type = service_type_;
     create_time = create_time_;
     start_time = start_time_;
     end_time = end_time_;
     status = status_;
     insights = insights_;
   }
    : analysis_report)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_analysis_report_summary ?analysis_report_id:(analysis_report_id_ : string_ option)
    ?create_time:(create_time_ : iso_timestamp option)
    ?start_time:(start_time_ : iso_timestamp option) ?end_time:(end_time_ : iso_timestamp option)
    ?status:(status_ : analysis_status option) ?tags:(tags_ : tag_list option) () =
  ({
     analysis_report_id = analysis_report_id_;
     create_time = create_time_;
     start_time = start_time_;
     end_time = end_time_;
     status = status_;
     tags = tags_;
   }
    : analysis_report_summary)

let make_create_performance_analysis_report_response
    ?analysis_report_id:(analysis_report_id_ : analysis_report_id option) () =
  ({ analysis_report_id = analysis_report_id_ } : create_performance_analysis_report_response)

let make_create_performance_analysis_report_request ?end_time:(end_time_ : iso_timestamp option)
    ?tags:(tags_ : tag_list option) ~service_type:(service_type_ : service_type)
    ~identifier:(identifier_ : identifier_string) ~start_time:(start_time_ : iso_timestamp) () =
  ({
     service_type = service_type_;
     identifier = identifier_;
     start_time = start_time_;
     end_time = end_time_;
     tags = tags_;
   }
    : create_performance_analysis_report_request)

let make_data_point ~timestamp:(timestamp_ : iso_timestamp) ~value:(value_ : double) () =
  ({ timestamp = timestamp_; value = value_ } : data_point)

let make_delete_performance_analysis_report_response () = (() : unit)

let make_delete_performance_analysis_report_request ~service_type:(service_type_ : service_type)
    ~identifier:(identifier_ : identifier_string)
    ~analysis_report_id:(analysis_report_id_ : analysis_report_id) () =
  ({
     service_type = service_type_;
     identifier = identifier_;
     analysis_report_id = analysis_report_id_;
   }
    : delete_performance_analysis_report_request)

let make_dimension_key_description ?dimensions:(dimensions_ : dimension_map option)
    ?total:(total_ : double option)
    ?additional_metrics:(additional_metrics_ : additional_metrics_map option)
    ?partitions:(partitions_ : metric_values_list option) () =
  ({
     dimensions = dimensions_;
     total = total_;
     additional_metrics = additional_metrics_;
     partitions = partitions_;
   }
    : dimension_key_description)

let make_response_partition_key ~dimensions:(dimensions_ : dimension_map) () =
  ({ dimensions = dimensions_ } : response_partition_key)

let make_describe_dimension_keys_response
    ?aligned_start_time:(aligned_start_time_ : iso_timestamp option)
    ?aligned_end_time:(aligned_end_time_ : iso_timestamp option)
    ?partition_keys:(partition_keys_ : response_partition_key_list option)
    ?keys:(keys_ : dimension_key_description_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     aligned_start_time = aligned_start_time_;
     aligned_end_time = aligned_end_time_;
     partition_keys = partition_keys_;
     keys = keys_;
     next_token = next_token_;
   }
    : describe_dimension_keys_response)

let make_dimension_group ?dimensions:(dimensions_ : sanitized_string_list option)
    ?limit:(limit_ : limit option) ~group:(group_ : sanitized_string) () =
  ({ group = group_; dimensions = dimensions_; limit = limit_ } : dimension_group)

let make_describe_dimension_keys_request ?period_in_seconds:(period_in_seconds_ : integer option)
    ?additional_metrics:(additional_metrics_ : additional_metrics_list option)
    ?partition_by:(partition_by_ : dimension_group option)
    ?filter:(filter_ : metric_query_filter_map option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~service_type:(service_type_ : service_type) ~identifier:(identifier_ : identifier_string)
    ~start_time:(start_time_ : iso_timestamp) ~end_time:(end_time_ : iso_timestamp)
    ~metric:(metric_ : request_string) ~group_by:(group_by_ : dimension_group) () =
  ({
     service_type = service_type_;
     identifier = identifier_;
     start_time = start_time_;
     end_time = end_time_;
     metric = metric_;
     period_in_seconds = period_in_seconds_;
     group_by = group_by_;
     additional_metrics = additional_metrics_;
     partition_by = partition_by_;
     filter = filter_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_dimension_keys_request)

let make_dimension_detail ?identifier:(identifier_ : string_ option) () =
  ({ identifier = identifier_ } : dimension_detail)

let make_dimension_group_detail ?group:(group_ : string_ option)
    ?dimensions:(dimensions_ : dimension_detail_list option) () =
  ({ group = group_; dimensions = dimensions_ } : dimension_group_detail)

let make_dimension_key_detail ?value:(value_ : string_ option)
    ?dimension:(dimension_ : string_ option) ?status:(status_ : detail_status option) () =
  ({ value = value_; dimension = dimension_; status = status_ } : dimension_key_detail)

let make_feature_metadata ?status:(status_ : feature_status option) () =
  ({ status = status_ } : feature_metadata)

let make_get_dimension_key_details_response
    ?dimensions:(dimensions_ : dimension_key_detail_list option) () =
  ({ dimensions = dimensions_ } : get_dimension_key_details_response)

let make_get_dimension_key_details_request
    ?requested_dimensions:(requested_dimensions_ : requested_dimension_list option)
    ~service_type:(service_type_ : service_type) ~identifier:(identifier_ : identifier_string)
    ~group:(group_ : request_string) ~group_identifier:(group_identifier_ : request_string) () =
  ({
     service_type = service_type_;
     identifier = identifier_;
     group = group_;
     group_identifier = group_identifier_;
     requested_dimensions = requested_dimensions_;
   }
    : get_dimension_key_details_request)

let make_get_performance_analysis_report_response
    ?analysis_report:(analysis_report_ : analysis_report option) () =
  ({ analysis_report = analysis_report_ } : get_performance_analysis_report_response)

let make_get_performance_analysis_report_request ?text_format:(text_format_ : text_format option)
    ?accept_language:(accept_language_ : accept_language option)
    ~service_type:(service_type_ : service_type) ~identifier:(identifier_ : identifier_string)
    ~analysis_report_id:(analysis_report_id_ : analysis_report_id) () =
  ({
     service_type = service_type_;
     identifier = identifier_;
     analysis_report_id = analysis_report_id_;
     text_format = text_format_;
     accept_language = accept_language_;
   }
    : get_performance_analysis_report_request)

let make_get_resource_metadata_response ?identifier:(identifier_ : string_ option)
    ?features:(features_ : feature_metadata_map option) () =
  ({ identifier = identifier_; features = features_ } : get_resource_metadata_response)

let make_get_resource_metadata_request ~service_type:(service_type_ : service_type)
    ~identifier:(identifier_ : identifier_string) () =
  ({ service_type = service_type_; identifier = identifier_ } : get_resource_metadata_request)

let make_response_resource_metric_key ?dimensions:(dimensions_ : dimension_map option)
    ~metric:(metric_ : string_) () =
  ({ metric = metric_; dimensions = dimensions_ } : response_resource_metric_key)

let make_metric_key_data_points ?key:(key_ : response_resource_metric_key option)
    ?data_points:(data_points_ : data_points_list option) () =
  ({ key = key_; data_points = data_points_ } : metric_key_data_points)

let make_get_resource_metrics_response
    ?aligned_start_time:(aligned_start_time_ : iso_timestamp option)
    ?aligned_end_time:(aligned_end_time_ : iso_timestamp option)
    ?identifier:(identifier_ : string_ option)
    ?metric_list:(metric_list_ : metric_key_data_points_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     aligned_start_time = aligned_start_time_;
     aligned_end_time = aligned_end_time_;
     identifier = identifier_;
     metric_list = metric_list_;
     next_token = next_token_;
   }
    : get_resource_metrics_response)

let make_metric_query ?group_by:(group_by_ : dimension_group option)
    ?filter:(filter_ : metric_query_filter_map option) ~metric:(metric_ : sanitized_string) () =
  ({ metric = metric_; group_by = group_by_; filter = filter_ } : metric_query)

let make_get_resource_metrics_request ?period_in_seconds:(period_in_seconds_ : integer option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?period_alignment:(period_alignment_ : period_alignment option)
    ~service_type:(service_type_ : service_type) ~identifier:(identifier_ : identifier_string)
    ~metric_queries:(metric_queries_ : metric_query_list) ~start_time:(start_time_ : iso_timestamp)
    ~end_time:(end_time_ : iso_timestamp) () =
  ({
     service_type = service_type_;
     identifier = identifier_;
     metric_queries = metric_queries_;
     start_time = start_time_;
     end_time = end_time_;
     period_in_seconds = period_in_seconds_;
     max_results = max_results_;
     next_token = next_token_;
     period_alignment = period_alignment_;
   }
    : get_resource_metrics_request)

let make_metric_dimension_groups ?metric:(metric_ : string_ option)
    ?groups:(groups_ : dimension_group_detail_list option) () =
  ({ metric = metric_; groups = groups_ } : metric_dimension_groups)

let make_list_available_resource_dimensions_response
    ?metric_dimensions:(metric_dimensions_ : metric_dimensions_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ metric_dimensions = metric_dimensions_; next_token = next_token_ }
    : list_available_resource_dimensions_response)

let make_list_available_resource_dimensions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?authorized_actions:(authorized_actions_ : authorized_actions_list option)
    ~service_type:(service_type_ : service_type) ~identifier:(identifier_ : identifier_string)
    ~metrics:(metrics_ : dimensions_metric_list) () =
  ({
     service_type = service_type_;
     identifier = identifier_;
     metrics = metrics_;
     max_results = max_results_;
     next_token = next_token_;
     authorized_actions = authorized_actions_;
   }
    : list_available_resource_dimensions_request)

let make_response_resource_metric ?metric:(metric_ : string_ option)
    ?description:(description_ : description option) ?unit_:(unit__ : string_ option) () =
  ({ metric = metric_; description = description_; unit_ = unit__ } : response_resource_metric)

let make_list_available_resource_metrics_response
    ?metrics:(metrics_ : response_resource_metric_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ metrics = metrics_; next_token = next_token_ } : list_available_resource_metrics_response)

let make_list_available_resource_metrics_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~service_type:(service_type_ : service_type)
    ~identifier:(identifier_ : identifier_string) ~metric_types:(metric_types_ : metric_type_list)
    () =
  ({
     service_type = service_type_;
     identifier = identifier_;
     metric_types = metric_types_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_available_resource_metrics_request)

let make_list_performance_analysis_report_recommendations_response
    ?recommendations:(recommendations_ : recommendation_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ recommendations = recommendations_; next_token = next_token_ }
    : list_performance_analysis_report_recommendations_response)

let make_list_performance_analysis_report_recommendations_request
    ?recommendation_ids:(recommendation_ids_ : recommendation_id_list option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~service_type:(service_type_ : service_type) ~identifier:(identifier_ : identifier_string)
    ~analysis_report_id:(analysis_report_id_ : analysis_report_id) () =
  ({
     service_type = service_type_;
     identifier = identifier_;
     analysis_report_id = analysis_report_id_;
     recommendation_ids = recommendation_ids_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_performance_analysis_report_recommendations_request)

let make_list_performance_analysis_reports_response
    ?analysis_reports:(analysis_reports_ : analysis_report_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ analysis_reports = analysis_reports_; next_token = next_token_ }
    : list_performance_analysis_reports_response)

let make_list_performance_analysis_reports_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?list_tags:(list_tags_ : boolean_ option)
    ~service_type:(service_type_ : service_type) ~identifier:(identifier_ : identifier_string) () =
  ({
     service_type = service_type_;
     identifier = identifier_;
     next_token = next_token_;
     max_results = max_results_;
     list_tags = list_tags_;
   }
    : list_performance_analysis_reports_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~service_type:(service_type_ : service_type)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ service_type = service_type_; resource_ar_n = resource_ar_n_ }
    : list_tags_for_resource_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~service_type:(service_type_ : service_type)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ service_type = service_type_; resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ }
    : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~service_type:(service_type_ : service_type)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) ~tags:(tags_ : tag_list) () =
  ({ service_type = service_type_; resource_ar_n = resource_ar_n_; tags = tags_ }
    : tag_resource_request)
