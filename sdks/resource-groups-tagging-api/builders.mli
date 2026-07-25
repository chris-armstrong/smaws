open Types

val make_compliance_details :
  ?noncompliant_keys:tag_key_list ->
  ?keys_with_noncompliant_values:tag_key_list ->
  ?missing_tag_keys:tag_key_list ->
  ?compliance_status:compliance_status ->
  unit ->
  compliance_details

val make_describe_report_creation_output :
  ?status:status ->
  ?s3_location:s3_location ->
  ?start_date:start_date ->
  ?error_message:error_message ->
  unit ->
  describe_report_creation_output

val make_describe_report_creation_input : unit -> unit

val make_failure_info :
  ?status_code:status_code ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  unit ->
  failure_info

val make_summary :
  ?last_updated:last_updated ->
  ?target_id:target_id ->
  ?target_id_type:target_id_type ->
  ?region:region ->
  ?resource_type:amazon_resource_type ->
  ?non_compliant_resources:non_compliant_resources ->
  unit ->
  summary

val make_get_compliance_summary_output :
  ?summary_list:summary_list ->
  ?pagination_token:pagination_token ->
  unit ->
  get_compliance_summary_output

val make_get_compliance_summary_input :
  ?target_id_filters:target_id_filter_list ->
  ?region_filters:region_filter_list ->
  ?resource_type_filters:resource_type_filter_list ->
  ?tag_key_filters:tag_key_filter_list ->
  ?group_by:group_by ->
  ?max_results:max_results_get_compliance_summary ->
  ?pagination_token:pagination_token ->
  unit ->
  get_compliance_summary_input

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_resource_tag_mapping :
  ?resource_ar_n:resource_ar_n ->
  ?tags:tag_list ->
  ?compliance_details:compliance_details ->
  unit ->
  resource_tag_mapping

val make_get_resources_output :
  ?pagination_token:pagination_token ->
  ?resource_tag_mapping_list:resource_tag_mapping_list ->
  unit ->
  get_resources_output

val make_tag_filter : ?key:tag_key -> ?values:tag_value_list -> unit -> tag_filter

val make_get_resources_input :
  ?pagination_token:pagination_token ->
  ?tag_filters:tag_filter_list ->
  ?resources_per_page:resources_per_page ->
  ?tags_per_page:tags_per_page ->
  ?resource_type_filters:resource_type_filter_list ->
  ?include_compliance_details:include_compliance_details ->
  ?exclude_compliant_resources:exclude_compliant_resources ->
  ?resource_arn_list:resource_arn_list_for_get ->
  unit ->
  get_resources_input

val make_get_tag_keys_output :
  ?pagination_token:pagination_token -> ?tag_keys:tag_key_list -> unit -> get_tag_keys_output

val make_get_tag_keys_input : ?pagination_token:pagination_token -> unit -> get_tag_keys_input

val make_get_tag_values_output :
  ?pagination_token:pagination_token ->
  ?tag_values:tag_values_output_list ->
  unit ->
  get_tag_values_output

val make_get_tag_values_input :
  ?pagination_token:pagination_token -> key:tag_key -> unit -> get_tag_values_input

val make_required_tag :
  ?resource_type:resource_type ->
  ?cloud_formation_resource_types:cloud_formation_resource_types ->
  ?reporting_tag_keys:reporting_tag_keys ->
  unit ->
  required_tag

val make_list_required_tags_output :
  ?required_tags:required_tags_for_list_required_tags ->
  ?next_token:pagination_token ->
  unit ->
  list_required_tags_output

val make_list_required_tags_input :
  ?next_token:pagination_token ->
  ?max_results:max_results_for_list_required_tags ->
  unit ->
  list_required_tags_input

val make_untag_resources_output :
  ?failed_resources_map:failed_resources_map -> unit -> untag_resources_output

val make_untag_resources_input :
  resource_arn_list:resource_arn_list_for_tag_untag ->
  tag_keys:tag_key_list_for_untag ->
  unit ->
  untag_resources_input

val make_tag_resources_output :
  ?failed_resources_map:failed_resources_map -> unit -> tag_resources_output

val make_tag_resources_input :
  resource_arn_list:resource_arn_list_for_tag_untag -> tags:tag_map -> unit -> tag_resources_input

val make_start_report_creation_output : unit -> unit
val make_start_report_creation_input : s3_bucket:s3_bucket -> unit -> start_report_creation_input
