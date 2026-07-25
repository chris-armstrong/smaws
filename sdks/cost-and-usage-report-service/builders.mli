open Types

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  report_name:report_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_tag_resource_request :
  report_name:report_name -> tags:tag_list -> unit -> tag_resource_request

val make_put_report_definition_response : unit -> unit

val make_report_status :
  ?last_delivery:last_delivery -> ?last_status:last_status -> unit -> report_status

val make_report_definition :
  ?additional_artifacts:additional_artifact_list ->
  ?refresh_closed_reports:refresh_closed_reports ->
  ?report_versioning:report_versioning ->
  ?billing_view_arn:billing_view_arn ->
  ?report_status:report_status ->
  report_name:report_name ->
  time_unit:time_unit ->
  format:report_format ->
  compression:compression_format ->
  additional_schema_elements:schema_element_list ->
  s3_bucket:s3_bucket ->
  s3_prefix:s3_prefix ->
  s3_region:aws_region ->
  unit ->
  report_definition

val make_put_report_definition_request :
  ?tags:tag_list -> report_definition:report_definition -> unit -> put_report_definition_request

val make_modify_report_definition_response : unit -> unit

val make_modify_report_definition_request :
  report_name:report_name ->
  report_definition:report_definition ->
  unit ->
  modify_report_definition_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  report_name:report_name -> unit -> list_tags_for_resource_request

val make_describe_report_definitions_response :
  ?report_definitions:report_definition_list ->
  ?next_token:generic_string ->
  unit ->
  describe_report_definitions_response

val make_describe_report_definitions_request :
  ?max_results:max_results ->
  ?next_token:generic_string ->
  unit ->
  describe_report_definitions_request

val make_delete_report_definition_response :
  ?response_message:delete_response_message -> unit -> delete_report_definition_response

val make_delete_report_definition_request :
  report_name:report_name -> unit -> delete_report_definition_request
