open Types

val make_validation_exception_field :
  message:generic_string -> name:generic_string -> unit -> validation_exception_field

val make_update_export_response : ?export_arn:arn -> unit -> update_export_response

val make_data_query :
  ?table_configurations:table_configurations ->
  query_statement:query_statement ->
  unit ->
  data_query

val make_s3_output_configurations :
  overwrite:overwrite_option ->
  compression:compression_option ->
  format:format_option ->
  output_type:s3_output_type ->
  unit ->
  s3_output_configurations

val make_s3_destination :
  ?s3_bucket_owner:account_id ->
  s3_output_configurations:s3_output_configurations ->
  s3_region:generic_string ->
  s3_prefix:generic_string ->
  s3_bucket:generic_string ->
  unit ->
  s3_destination

val make_destination_configurations :
  s3_destination:s3_destination -> unit -> destination_configurations

val make_refresh_cadence : frequency:frequency_option -> unit -> refresh_cadence

val make_export_ :
  ?description:generic_string ->
  ?export_arn:arn ->
  refresh_cadence:refresh_cadence ->
  destination_configurations:destination_configurations ->
  data_query:data_query ->
  name:export_name ->
  unit ->
  export_

val make_update_export_request : export_:export_ -> export_arn:arn -> unit -> update_export_request
val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_tag_keys:resource_tag_key_list -> resource_arn:arn -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_resource_tag : value:resource_tag_value -> key:resource_tag_key -> unit -> resource_tag

val make_tag_resource_request :
  resource_tags:resource_tag_list -> resource_arn:arn -> unit -> tag_resource_request

val make_table_property_description :
  ?description:generic_string ->
  ?default_value:generic_string ->
  ?valid_values:generic_string_list ->
  ?name:generic_string ->
  unit ->
  table_property_description

val make_table :
  ?table_properties:table_property_description_list ->
  ?description:generic_string ->
  ?table_name:table_name ->
  unit ->
  table

val make_list_tags_for_resource_response :
  ?next_token:next_page_token ->
  ?resource_tags:resource_tag_list ->
  unit ->
  list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  resource_arn:arn ->
  unit ->
  list_tags_for_resource_request

val make_list_tables_response :
  ?next_token:next_page_token -> ?tables:table_list -> unit -> list_tables_response

val make_list_tables_request :
  ?max_results:max_results -> ?next_token:next_page_token -> unit -> list_tables_request

val make_export_status :
  ?last_refreshed_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status_reason:execution_status_reason ->
  ?status_code:export_status_code ->
  unit ->
  export_status

val make_export_reference :
  export_status:export_status ->
  export_name:export_name ->
  export_arn:arn ->
  unit ->
  export_reference

val make_list_exports_response :
  ?next_token:next_page_token -> ?exports:export_reference_list -> unit -> list_exports_response

val make_list_exports_request :
  ?next_token:next_page_token -> ?max_results:max_results -> unit -> list_exports_request

val make_execution_status :
  ?last_updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?completed_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status_reason:execution_status_reason ->
  ?status_code:execution_status_code ->
  unit ->
  execution_status

val make_execution_reference :
  execution_status:execution_status -> execution_id:generic_string -> unit -> execution_reference

val make_list_executions_response :
  ?next_token:next_page_token ->
  ?executions:execution_reference_list ->
  unit ->
  list_executions_response

val make_list_executions_request :
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  export_arn:arn ->
  unit ->
  list_executions_request

val make_column :
  ?description:generic_string -> ?type_:generic_string -> ?name:generic_string -> unit -> column

val make_get_table_response :
  ?schema:column_list ->
  ?table_properties:table_properties ->
  ?description:generic_string ->
  ?table_name:table_name ->
  unit ->
  get_table_response

val make_get_table_request :
  ?table_properties:table_properties -> table_name:table_name -> unit -> get_table_request

val make_get_export_response :
  ?export_status:export_status -> ?export_:export_ -> unit -> get_export_response

val make_get_export_request : export_arn:arn -> unit -> get_export_request

val make_get_execution_response :
  ?execution_status:execution_status ->
  ?export_:export_ ->
  ?execution_id:generic_string ->
  unit ->
  get_execution_response

val make_get_execution_request :
  execution_id:generic_string -> export_arn:arn -> unit -> get_execution_request

val make_delete_export_response : ?export_arn:arn -> unit -> delete_export_response
val make_delete_export_request : export_arn:arn -> unit -> delete_export_request
val make_create_export_response : ?export_arn:arn -> unit -> create_export_response

val make_create_export_request :
  ?resource_tags:resource_tag_list -> export_:export_ -> unit -> create_export_request
