open Smaws_Lib
open Types
let make_untag_resource_response () = (() : unit)
let make_untag_resource_request ~tag_keys:(tag_keys_ : string list) 
  ~resource_ar_n:(resource_ar_n_ : string) 
  ~service_type:(service_type_ : service_type)  () =
  ({
     tag_keys = tag_keys_;
     resource_ar_n = resource_ar_n_;
     service_type = service_type_
   } : untag_resource_request)
let make_tag_resource_response () = (() : unit)
let make_tag ~value:(value_ : string)  ~key:(key_ : string)  () =
  ({ value = value_; key = key_ } : tag)
let make_tag_resource_request ~tags:(tags_ : tag list) 
  ~resource_ar_n:(resource_ar_n_ : string) 
  ~service_type:(service_type_ : service_type)  () =
  ({
     tags = tags_;
     resource_ar_n = resource_ar_n_;
     service_type = service_type_
   } : tag_resource_request)
let make_response_resource_metric ?unit_:(unit__ : string option) 
  ?description:(description_ : string option) 
  ?metric:(metric_ : string option)  () =
  ({ unit_ = unit__; description = description_; metric = metric_ } : 
  response_resource_metric)
let make_response_resource_metric_key
  ?dimensions:(dimensions_ : dimension_map option) 
  ~metric:(metric_ : string)  () =
  ({ dimensions = dimensions_; metric = metric_ } : response_resource_metric_key)
let make_response_partition_key ~dimensions:(dimensions_ : dimension_map)  ()
  = ({ dimensions = dimensions_ } : response_partition_key)
let make_recommendation
  ?recommendation_description:(recommendation_description_ : string option) 
  ?recommendation_id:(recommendation_id_ : string option)  () =
  ({
     recommendation_description = recommendation_description_;
     recommendation_id = recommendation_id_
   } : recommendation)
let make_list_tags_for_resource_response ?tags:(tags_ : tag list option)  ()
  = ({ tags = tags_ } : list_tags_for_resource_response)
let make_list_tags_for_resource_request
  ~resource_ar_n:(resource_ar_n_ : string) 
  ~service_type:(service_type_ : service_type)  () =
  ({ resource_ar_n = resource_ar_n_; service_type = service_type_ } : 
  list_tags_for_resource_request)
let make_analysis_report_summary ?tags:(tags_ : tag list option) 
  ?status:(status_ : analysis_status option) 
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option) 
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option) 
  ?create_time:(create_time_ : CoreTypes.Timestamp.t option) 
  ?analysis_report_id:(analysis_report_id_ : string option)  () =
  ({
     tags = tags_;
     status = status_;
     end_time = end_time_;
     start_time = start_time_;
     create_time = create_time_;
     analysis_report_id = analysis_report_id_
   } : analysis_report_summary)
let make_list_performance_analysis_reports_response
  ?next_token:(next_token_ : string option) 
  ?analysis_reports:(analysis_reports_ : analysis_report_summary list option)
   () =
  ({ next_token = next_token_; analysis_reports = analysis_reports_ } : 
  list_performance_analysis_reports_response)
let make_list_performance_analysis_reports_request
  ?list_tags:(list_tags_ : bool option) 
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ~identifier:(identifier_ : string) 
  ~service_type:(service_type_ : service_type)  () =
  ({
     list_tags = list_tags_;
     max_results = max_results_;
     next_token = next_token_;
     identifier = identifier_;
     service_type = service_type_
   } : list_performance_analysis_reports_request)
let make_list_available_resource_metrics_response
  ?next_token:(next_token_ : string option) 
  ?metrics:(metrics_ : response_resource_metric list option)  () =
  ({ next_token = next_token_; metrics = metrics_ } : list_available_resource_metrics_response)
let make_list_available_resource_metrics_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ~metric_types:(metric_types_ : string list) 
  ~identifier:(identifier_ : string) 
  ~service_type:(service_type_ : service_type)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     metric_types = metric_types_;
     identifier = identifier_;
     service_type = service_type_
   } : list_available_resource_metrics_request)
let make_dimension_detail ?identifier:(identifier_ : string option)  () =
  ({ identifier = identifier_ } : dimension_detail)
let make_dimension_group_detail
  ?dimensions:(dimensions_ : dimension_detail list option) 
  ?group:(group_ : string option)  () =
  ({ dimensions = dimensions_; group = group_ } : dimension_group_detail)
let make_metric_dimension_groups
  ?groups:(groups_ : dimension_group_detail list option) 
  ?metric:(metric_ : string option)  () =
  ({ groups = groups_; metric = metric_ } : metric_dimension_groups)
let make_list_available_resource_dimensions_response
  ?next_token:(next_token_ : string option) 
  ?metric_dimensions:(metric_dimensions_ :
                       metric_dimension_groups list option)
   () =
  ({ next_token = next_token_; metric_dimensions = metric_dimensions_ } : 
  list_available_resource_dimensions_response)
let make_list_available_resource_dimensions_request
  ?authorized_actions:(authorized_actions_ : fine_grained_action list option)
   ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option)  ~metrics:(metrics_ : string list)
   ~identifier:(identifier_ : string) 
  ~service_type:(service_type_ : service_type)  () =
  ({
     authorized_actions = authorized_actions_;
     next_token = next_token_;
     max_results = max_results_;
     metrics = metrics_;
     identifier = identifier_;
     service_type = service_type_
   } : list_available_resource_dimensions_request)
let make_data_point ~value:(value_ : float) 
  ~timestamp_:(timestamp__ : CoreTypes.Timestamp.t)  () =
  ({ value = value_; timestamp_ = timestamp__ } : data_point)
let make_metric_key_data_points
  ?data_points:(data_points_ : data_point list option) 
  ?key:(key_ : response_resource_metric_key option)  () =
  ({ data_points = data_points_; key = key_ } : metric_key_data_points)
let make_get_resource_metrics_response
  ?next_token:(next_token_ : string option) 
  ?metric_list:(metric_list_ : metric_key_data_points list option) 
  ?identifier:(identifier_ : string option) 
  ?aligned_end_time:(aligned_end_time_ : CoreTypes.Timestamp.t option) 
  ?aligned_start_time:(aligned_start_time_ : CoreTypes.Timestamp.t option) 
  () =
  ({
     next_token = next_token_;
     metric_list = metric_list_;
     identifier = identifier_;
     aligned_end_time = aligned_end_time_;
     aligned_start_time = aligned_start_time_
   } : get_resource_metrics_response)
let make_dimension_group ?limit:(limit_ : int option) 
  ?dimensions:(dimensions_ : string list option)  ~group:(group_ : string) 
  () =
  ({ limit = limit_; dimensions = dimensions_; group = group_ } : dimension_group)
let make_metric_query ?filter:(filter_ : metric_query_filter_map option) 
  ?group_by:(group_by_ : dimension_group option)  ~metric:(metric_ : string) 
  () =
  ({ filter = filter_; group_by = group_by_; metric = metric_ } : metric_query)
let make_get_resource_metrics_request
  ?period_alignment:(period_alignment_ : period_alignment option) 
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?period_in_seconds:(period_in_seconds_ : int option) 
  ~end_time:(end_time_ : CoreTypes.Timestamp.t) 
  ~start_time:(start_time_ : CoreTypes.Timestamp.t) 
  ~metric_queries:(metric_queries_ : metric_query list) 
  ~identifier:(identifier_ : string) 
  ~service_type:(service_type_ : service_type)  () =
  ({
     period_alignment = period_alignment_;
     next_token = next_token_;
     max_results = max_results_;
     period_in_seconds = period_in_seconds_;
     end_time = end_time_;
     start_time = start_time_;
     metric_queries = metric_queries_;
     identifier = identifier_;
     service_type = service_type_
   } : get_resource_metrics_request)
let make_feature_metadata ?status:(status_ : feature_status option)  () =
  ({ status = status_ } : feature_metadata)
let make_get_resource_metadata_response
  ?features:(features_ : feature_metadata_map option) 
  ?identifier:(identifier_ : string option)  () =
  ({ features = features_; identifier = identifier_ } : get_resource_metadata_response)
let make_get_resource_metadata_request ~identifier:(identifier_ : string) 
  ~service_type:(service_type_ : service_type)  () =
  ({ identifier = identifier_; service_type = service_type_ } : get_resource_metadata_request)
let make_performance_insights_metric ?value:(value_ : float option) 
  ?dimensions:(dimensions_ : descriptive_map option) 
  ?display_name:(display_name_ : string option) 
  ?metric:(metric_ : string option)  () =
  ({
     value = value_;
     dimensions = dimensions_;
     display_name = display_name_;
     metric = metric_
   } : performance_insights_metric)
let make_data
  ?performance_insights_metric:(performance_insights_metric_ :
                                 performance_insights_metric option)
   () =
  ({ performance_insights_metric = performance_insights_metric_ } : data)
let make_insight ?baseline_data:(baseline_data_ : data list option) 
  ?insight_data:(insight_data_ : data list option) 
  ?recommendations:(recommendations_ : recommendation list option) 
  ?description:(description_ : string option) 
  ?supporting_insights:(supporting_insights_ : insight list option) 
  ?severity:(severity_ : severity option) 
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option) 
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option) 
  ?context:(context_ : context_type option) 
  ?insight_type:(insight_type_ : string option) 
  ~insight_id:(insight_id_ : string)  () =
  ({
     baseline_data = baseline_data_;
     insight_data = insight_data_;
     recommendations = recommendations_;
     description = description_;
     supporting_insights = supporting_insights_;
     severity = severity_;
     end_time = end_time_;
     start_time = start_time_;
     context = context_;
     insight_type = insight_type_;
     insight_id = insight_id_
   } : insight)
let make_analysis_report ?insights:(insights_ : insight list option) 
  ?status:(status_ : analysis_status option) 
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option) 
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option) 
  ?create_time:(create_time_ : CoreTypes.Timestamp.t option) 
  ?service_type:(service_type_ : service_type option) 
  ?identifier:(identifier_ : string option) 
  ~analysis_report_id:(analysis_report_id_ : string)  () =
  ({
     insights = insights_;
     status = status_;
     end_time = end_time_;
     start_time = start_time_;
     create_time = create_time_;
     service_type = service_type_;
     identifier = identifier_;
     analysis_report_id = analysis_report_id_
   } : analysis_report)
let make_get_performance_analysis_report_response
  ?analysis_report:(analysis_report_ : analysis_report option)  () =
  ({ analysis_report = analysis_report_ } : get_performance_analysis_report_response)
let make_get_performance_analysis_report_request
  ?accept_language:(accept_language_ : accept_language option) 
  ?text_format:(text_format_ : text_format option) 
  ~analysis_report_id:(analysis_report_id_ : string) 
  ~identifier:(identifier_ : string) 
  ~service_type:(service_type_ : service_type)  () =
  ({
     accept_language = accept_language_;
     text_format = text_format_;
     analysis_report_id = analysis_report_id_;
     identifier = identifier_;
     service_type = service_type_
   } : get_performance_analysis_report_request)
let make_dimension_key_detail ?status:(status_ : detail_status option) 
  ?dimension:(dimension_ : string option)  ?value:(value_ : string option) 
  () =
  ({ status = status_; dimension = dimension_; value = value_ } : dimension_key_detail)
let make_get_dimension_key_details_response
  ?dimensions:(dimensions_ : dimension_key_detail list option)  () =
  ({ dimensions = dimensions_ } : get_dimension_key_details_response)
let make_get_dimension_key_details_request
  ?requested_dimensions:(requested_dimensions_ : string list option) 
  ~group_identifier:(group_identifier_ : string)  ~group:(group_ : string) 
  ~identifier:(identifier_ : string) 
  ~service_type:(service_type_ : service_type)  () =
  ({
     requested_dimensions = requested_dimensions_;
     group_identifier = group_identifier_;
     group = group_;
     identifier = identifier_;
     service_type = service_type_
   } : get_dimension_key_details_request)
let make_dimension_key_description
  ?partitions:(partitions_ : float list option) 
  ?additional_metrics:(additional_metrics_ : additional_metrics_map option) 
  ?total:(total_ : float option) 
  ?dimensions:(dimensions_ : dimension_map option)  () =
  ({
     partitions = partitions_;
     additional_metrics = additional_metrics_;
     total = total_;
     dimensions = dimensions_
   } : dimension_key_description)
let make_describe_dimension_keys_response
  ?next_token:(next_token_ : string option) 
  ?keys:(keys_ : dimension_key_description list option) 
  ?partition_keys:(partition_keys_ : response_partition_key list option) 
  ?aligned_end_time:(aligned_end_time_ : CoreTypes.Timestamp.t option) 
  ?aligned_start_time:(aligned_start_time_ : CoreTypes.Timestamp.t option) 
  () =
  ({
     next_token = next_token_;
     keys = keys_;
     partition_keys = partition_keys_;
     aligned_end_time = aligned_end_time_;
     aligned_start_time = aligned_start_time_
   } : describe_dimension_keys_response)
let make_describe_dimension_keys_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filter:(filter_ : metric_query_filter_map option) 
  ?partition_by:(partition_by_ : dimension_group option) 
  ?additional_metrics:(additional_metrics_ : string list option) 
  ?period_in_seconds:(period_in_seconds_ : int option) 
  ~group_by:(group_by_ : dimension_group)  ~metric:(metric_ : string) 
  ~end_time:(end_time_ : CoreTypes.Timestamp.t) 
  ~start_time:(start_time_ : CoreTypes.Timestamp.t) 
  ~identifier:(identifier_ : string) 
  ~service_type:(service_type_ : service_type)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filter = filter_;
     partition_by = partition_by_;
     additional_metrics = additional_metrics_;
     group_by = group_by_;
     period_in_seconds = period_in_seconds_;
     metric = metric_;
     end_time = end_time_;
     start_time = start_time_;
     identifier = identifier_;
     service_type = service_type_
   } : describe_dimension_keys_request)
let make_delete_performance_analysis_report_response () = (() : unit)
let make_delete_performance_analysis_report_request
  ~analysis_report_id:(analysis_report_id_ : string) 
  ~identifier:(identifier_ : string) 
  ~service_type:(service_type_ : service_type)  () =
  ({
     analysis_report_id = analysis_report_id_;
     identifier = identifier_;
     service_type = service_type_
   } : delete_performance_analysis_report_request)
let make_create_performance_analysis_report_response
  ?analysis_report_id:(analysis_report_id_ : string option)  () =
  ({ analysis_report_id = analysis_report_id_ } : create_performance_analysis_report_response)
let make_create_performance_analysis_report_request
  ?tags:(tags_ : tag list option) 
  ~end_time:(end_time_ : CoreTypes.Timestamp.t) 
  ~start_time:(start_time_ : CoreTypes.Timestamp.t) 
  ~identifier:(identifier_ : string) 
  ~service_type:(service_type_ : service_type)  () =
  ({
     tags = tags_;
     end_time = end_time_;
     start_time = start_time_;
     identifier = identifier_;
     service_type = service_type_
   } : create_performance_analysis_report_request)