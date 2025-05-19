open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec untag_resource_response = unit
type nonrec service_type =
  | DOCDB 
  | RDS [@@ocaml.doc ""]
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_ar_n: string ;
  service_type: service_type }[@@ocaml.doc ""]
type nonrec not_authorized_exception = {
  message: string option }[@@ocaml.doc
                            "The user is not authorized to perform this request.\n"]
type nonrec invalid_argument_exception = {
  message: string option }[@@ocaml.doc
                            "One of the arguments provided is invalid for this request.\n"]
type nonrec internal_service_error = {
  message: string option }[@@ocaml.doc
                            "The request failed due to an unknown error.\n"]
type nonrec text_format =
  | MARKDOWN 
  | PLAIN_TEXT [@@ocaml.doc ""]
type nonrec tag_resource_response = unit
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc
                 "Metadata assigned to an Amazon RDS resource consisting of a key-value pair.\n"]
type nonrec tag_resource_request =
  {
  tags: tag list ;
  resource_ar_n: string ;
  service_type: service_type }[@@ocaml.doc ""]
type nonrec severity =
  | HIGH 
  | MEDIUM 
  | LOW [@@ocaml.doc ""]
type nonrec response_resource_metric =
  {
  unit_: string option ;
  description: string option ;
  metric: string option }[@@ocaml.doc
                           "An object that contains the full name, description, and unit of a metric. \n"]
type nonrec dimension_map = (string * string) list[@@ocaml.doc ""]
type nonrec response_resource_metric_key =
  {
  dimensions: dimension_map option ;
  metric: string }[@@ocaml.doc
                    "An object describing a Performance Insights metric and one or more dimensions for that metric.\n"]
type nonrec response_partition_key = {
  dimensions: dimension_map }[@@ocaml.doc
                               "If [PartitionBy] was specified in a [DescribeDimensionKeys] request, the dimensions are returned in an array. Each element in the array specifies one dimension. \n"]
type nonrec recommendation =
  {
  recommendation_description: string option ;
  recommendation_id: string option }[@@ocaml.doc
                                      "The list of recommendations for the insight.\n"]
type nonrec period_alignment =
  | START_TIME 
  | END_TIME [@@ocaml.doc ""]
type nonrec list_tags_for_resource_response = {
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  resource_ar_n: string ;
  service_type: service_type }[@@ocaml.doc ""]
type nonrec analysis_status =
  | FAILED 
  | SUCCEEDED 
  | RUNNING [@@ocaml.doc ""]
type nonrec analysis_report_summary =
  {
  tags: tag list option ;
  status: analysis_status option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  create_time: CoreTypes.Timestamp.t option ;
  analysis_report_id: string option }[@@ocaml.doc
                                       "Retrieves the details of the performance analysis report.\n"]
type nonrec list_performance_analysis_reports_response =
  {
  next_token: string option ;
  analysis_reports: analysis_report_summary list option }[@@ocaml.doc ""]
type nonrec list_performance_analysis_reports_request =
  {
  list_tags: bool option ;
  max_results: int option ;
  next_token: string option ;
  identifier: string ;
  service_type: service_type }[@@ocaml.doc ""]
type nonrec list_available_resource_metrics_response =
  {
  next_token: string option ;
  metrics: response_resource_metric list option }[@@ocaml.doc ""]
type nonrec list_available_resource_metrics_request =
  {
  max_results: int option ;
  next_token: string option ;
  metric_types: string list ;
  identifier: string ;
  service_type: service_type }[@@ocaml.doc ""]
type nonrec dimension_detail = {
  identifier: string option }[@@ocaml.doc
                               "The information about a dimension.\n"]
type nonrec dimension_group_detail =
  {
  dimensions: dimension_detail list option ;
  group: string option }[@@ocaml.doc
                          "Information about dimensions within a dimension group.\n"]
type nonrec metric_dimension_groups =
  {
  groups: dimension_group_detail list option ;
  metric: string option }[@@ocaml.doc
                           "The available dimension information for a metric type.\n"]
type nonrec list_available_resource_dimensions_response =
  {
  next_token: string option ;
  metric_dimensions: metric_dimension_groups list option }[@@ocaml.doc ""]
type nonrec fine_grained_action =
  | GET_RESOURCE_METRICS 
  | GET_DIMENSION_KEY_DETAILS 
  | DESCRIBE_DIMENSION_KEYS [@@ocaml.doc ""]
type nonrec list_available_resource_dimensions_request =
  {
  authorized_actions: fine_grained_action list option ;
  next_token: string option ;
  max_results: int option ;
  metrics: string list ;
  identifier: string ;
  service_type: service_type }[@@ocaml.doc ""]
type nonrec data_point = {
  value: float ;
  timestamp_: CoreTypes.Timestamp.t }[@@ocaml.doc
                                       "A timestamp, and a single numerical value, which together represent a measurement at a particular point in time.\n"]
type nonrec metric_key_data_points =
  {
  data_points: data_point list option ;
  key: response_resource_metric_key option }[@@ocaml.doc
                                              "A time-ordered series of data points, corresponding to a dimension of a Performance Insights metric.\n"]
type nonrec get_resource_metrics_response =
  {
  next_token: string option ;
  metric_list: metric_key_data_points list option ;
  identifier: string option ;
  aligned_end_time: CoreTypes.Timestamp.t option ;
  aligned_start_time: CoreTypes.Timestamp.t option }[@@ocaml.doc ""]
type nonrec dimension_group =
  {
  limit: int option ;
  dimensions: string list option ;
  group: string }[@@ocaml.doc
                   "A logical grouping of Performance Insights metrics for a related subject area. For example, the [db.sql] dimension group consists of the following dimensions:\n\n {ul\n       {-   [db.sql.id] - The hash of a running SQL statement, generated by Performance Insights.\n           \n            }\n       {-   [db.sql.db_id] - Either the SQL ID generated by the database engine, or a value generated by Performance Insights that begins with [pi-].\n           \n            }\n       {-   [db.sql.statement] - The full text of the SQL statement that is running, for example, [SELECT * FROM\n                        employees].\n           \n            }\n       {-   [db.sql_tokenized.id] - The hash of the SQL digest generated by Performance Insights.\n           \n            }\n       }\n    Each response element returns a maximum of 500 bytes. For larger elements, such as SQL statements, only the first 500 bytes are returned.\n    \n     "]
type nonrec metric_query_filter_map = (string * string) list[@@ocaml.doc ""]
type nonrec metric_query =
  {
  filter: metric_query_filter_map option ;
  group_by: dimension_group option ;
  metric: string }[@@ocaml.doc
                    "A single query to be processed. You must provide the metric to query and append an aggregate function to the metric. For example, to find the average for the metric [db.load] you must use [db.load.avg]. Valid values for aggregate functions include [.avg], [.min], [.max], and [.sum]. If no other parameters are specified, Performance Insights returns all data points for the specified metric. Optionally, you can request that the data points be aggregated by dimension group ([GroupBy]), and return only those data points that match your criteria ([Filter]).\n"]
type nonrec get_resource_metrics_request =
  {
  period_alignment: period_alignment option ;
  next_token: string option ;
  max_results: int option ;
  period_in_seconds: int option ;
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  metric_queries: metric_query list ;
  identifier: string ;
  service_type: service_type }[@@ocaml.doc ""]
type nonrec feature_status =
  | UNKNOWN 
  | DISABLED_PENDING_REBOOT 
  | ENABLED_PENDING_REBOOT 
  | UNSUPPORTED 
  | DISABLED 
  | ENABLED [@@ocaml.doc ""]
type nonrec feature_metadata = {
  status: feature_status option }[@@ocaml.doc
                                   "The metadata for a feature. For example, the metadata might indicate that a feature is turned on or off on a specific DB instance.\n"]
type nonrec feature_metadata_map = (string * feature_metadata) list[@@ocaml.doc
                                                                    ""]
type nonrec get_resource_metadata_response =
  {
  features: feature_metadata_map option ;
  identifier: string option }[@@ocaml.doc ""]
type nonrec get_resource_metadata_request =
  {
  identifier: string ;
  service_type: service_type }[@@ocaml.doc ""]
type nonrec context_type =
  | CONTEXTUAL 
  | CAUSAL [@@ocaml.doc ""]
type nonrec descriptive_map = (string * string) list[@@ocaml.doc ""]
type nonrec performance_insights_metric =
  {
  value: float option ;
  dimensions: descriptive_map option ;
  display_name: string option ;
  metric: string option }[@@ocaml.doc
                           "This data type helps to determine Performance Insights metric to render for the insight.\n"]
type nonrec data =
  {
  performance_insights_metric: performance_insights_metric option }[@@ocaml.doc
                                                                    "List of data objects which provide details about source metrics. This field can be used to determine the PI metric to render for the insight. This data type also includes static values for the metrics for the Insight that were calculated and included in text and annotations on the DB load chart.\n"]
type insight =
  {
  baseline_data: data list option ;
  insight_data: data list option ;
  recommendations: recommendation list option ;
  description: string option ;
  supporting_insights: insight list option ;
  severity: severity option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  context: context_type option ;
  insight_type: string option ;
  insight_id: string }[@@ocaml.doc
                        "Retrieves the list of performance issues which are identified.\n"]
type nonrec analysis_report =
  {
  insights: insight list option ;
  status: analysis_status option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  create_time: CoreTypes.Timestamp.t option ;
  service_type: service_type option ;
  identifier: string option ;
  analysis_report_id: string }[@@ocaml.doc
                                "Retrieves the summary of the performance analysis report created for a time period.\n"]
type nonrec get_performance_analysis_report_response =
  {
  analysis_report: analysis_report option }[@@ocaml.doc ""]
type nonrec accept_language =
  | EN_US [@@ocaml.doc ""]
type nonrec get_performance_analysis_report_request =
  {
  accept_language: accept_language option ;
  text_format: text_format option ;
  analysis_report_id: string ;
  identifier: string ;
  service_type: service_type }[@@ocaml.doc ""]
type nonrec detail_status =
  | UNAVAILABLE 
  | PROCESSING 
  | AVAILABLE [@@ocaml.doc ""]
type nonrec dimension_key_detail =
  {
  status: detail_status option ;
  dimension: string option ;
  value: string option }[@@ocaml.doc
                          "An object that describes the details for a specified dimension.\n"]
type nonrec get_dimension_key_details_response =
  {
  dimensions: dimension_key_detail list option }[@@ocaml.doc ""]
type nonrec get_dimension_key_details_request =
  {
  requested_dimensions: string list option ;
  group_identifier: string ;
  group: string ;
  identifier: string ;
  service_type: service_type }[@@ocaml.doc ""]
type nonrec additional_metrics_map = (string * float) list[@@ocaml.doc ""]
type nonrec dimension_key_description =
  {
  partitions: float list option ;
  additional_metrics: additional_metrics_map option ;
  total: float option ;
  dimensions: dimension_map option }[@@ocaml.doc
                                      "An object that includes the requested dimension key values and aggregated metric values within a dimension group.\n"]
type nonrec describe_dimension_keys_response =
  {
  next_token: string option ;
  keys: dimension_key_description list option ;
  partition_keys: response_partition_key list option ;
  aligned_end_time: CoreTypes.Timestamp.t option ;
  aligned_start_time: CoreTypes.Timestamp.t option }[@@ocaml.doc ""]
type nonrec describe_dimension_keys_request =
  {
  next_token: string option ;
  max_results: int option ;
  filter: metric_query_filter_map option ;
  partition_by: dimension_group option ;
  additional_metrics: string list option ;
  group_by: dimension_group ;
  period_in_seconds: int option ;
  metric: string ;
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  identifier: string ;
  service_type: service_type }[@@ocaml.doc ""]
type nonrec delete_performance_analysis_report_response = unit
type nonrec delete_performance_analysis_report_request =
  {
  analysis_report_id: string ;
  identifier: string ;
  service_type: service_type }[@@ocaml.doc ""]
type nonrec create_performance_analysis_report_response =
  {
  analysis_report_id: string option }[@@ocaml.doc ""]
type nonrec create_performance_analysis_report_request =
  {
  tags: tag list option ;
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  identifier: string ;
  service_type: service_type }[@@ocaml.doc ""]