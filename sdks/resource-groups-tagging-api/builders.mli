open Types
val make_failure_info :
  ?error_message:error_message ->
    ?error_code:error_code ->
      ?status_code:status_code -> unit -> failure_info
val make_untag_resources_output :
  ?failed_resources_map:failed_resources_map ->
    unit -> untag_resources_output
val make_untag_resources_input :
  tag_keys:tag_key_list_for_untag ->
    resource_arn_list:resource_arn_list_for_tag_untag ->
      unit -> untag_resources_input
val make_tag_resources_output :
  ?failed_resources_map:failed_resources_map -> unit -> tag_resources_output
val make_tag_resources_input :
  tags:tag_map ->
    resource_arn_list:resource_arn_list_for_tag_untag ->
      unit -> tag_resources_input
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_filter :
  ?values:tag_value_list -> ?key:tag_key -> unit -> tag_filter
val make_summary :
  ?non_compliant_resources:non_compliant_resources ->
    ?resource_type:amazon_resource_type ->
      ?region:region ->
        ?target_id_type:target_id_type ->
          ?target_id:target_id ->
            ?last_updated:last_updated -> unit -> summary
val make_start_report_creation_output : unit -> unit
val make_start_report_creation_input :
  s3_bucket:s3_bucket -> unit -> start_report_creation_input
val make_compliance_details :
  ?compliance_status:compliance_status ->
    ?keys_with_noncompliant_values:tag_key_list ->
      ?noncompliant_keys:tag_key_list -> unit -> compliance_details
val make_resource_tag_mapping :
  ?compliance_details:compliance_details ->
    ?tags:tag_list ->
      ?resource_ar_n:resource_ar_n -> unit -> resource_tag_mapping
val make_get_tag_values_output :
  ?tag_values:tag_values_output_list ->
    ?pagination_token:pagination_token -> unit -> get_tag_values_output
val make_get_tag_values_input :
  ?pagination_token:pagination_token ->
    key:tag_key -> unit -> get_tag_values_input
val make_get_tag_keys_output :
  ?tag_keys:tag_key_list ->
    ?pagination_token:pagination_token -> unit -> get_tag_keys_output
val make_get_tag_keys_input :
  ?pagination_token:pagination_token -> unit -> get_tag_keys_input
val make_get_resources_output :
  ?resource_tag_mapping_list:resource_tag_mapping_list ->
    ?pagination_token:pagination_token -> unit -> get_resources_output
val make_get_resources_input :
  ?resource_arn_list:resource_arn_list_for_get ->
    ?exclude_compliant_resources:exclude_compliant_resources ->
      ?include_compliance_details:include_compliance_details ->
        ?resource_type_filters:resource_type_filter_list ->
          ?tags_per_page:tags_per_page ->
            ?resources_per_page:resources_per_page ->
              ?tag_filters:tag_filter_list ->
                ?pagination_token:pagination_token ->
                  unit -> get_resources_input
val make_get_compliance_summary_output :
  ?pagination_token:pagination_token ->
    ?summary_list:summary_list -> unit -> get_compliance_summary_output
val make_get_compliance_summary_input :
  ?pagination_token:pagination_token ->
    ?max_results:max_results_get_compliance_summary ->
      ?group_by:group_by ->
        ?tag_key_filters:tag_key_filter_list ->
          ?resource_type_filters:resource_type_filter_list ->
            ?region_filters:region_filter_list ->
              ?target_id_filters:target_id_filter_list ->
                unit -> get_compliance_summary_input
val make_describe_report_creation_output :
  ?error_message:error_message ->
    ?start_date:start_date ->
      ?s3_location:s3_location ->
        ?status:status -> unit -> describe_report_creation_output
val make_describe_report_creation_input : unit -> unit