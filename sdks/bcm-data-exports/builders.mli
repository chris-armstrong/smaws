open Types

val make_validation_exception_field :
  name:generic_string -> message:generic_string -> unit -> validation_exception_field

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:arn -> resource_tag_keys:resource_tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_resource_tag : key:resource_tag_key -> value:resource_tag_value -> unit -> resource_tag

val make_tag_resource_request :
  resource_arn:arn -> resource_tags:resource_tag_list -> unit -> tag_resource_request

val make_list_tags_for_resource_response :
  ?resource_tags:resource_tag_list ->
  ?next_token:next_page_token ->
  unit ->
  list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?max_results:max_results ->
  ?next_token:next_page_token ->
  resource_arn:arn ->
  unit ->
  list_tags_for_resource_request

val make_table_property_description :
  ?name:generic_string ->
  ?valid_values:generic_string_list ->
  ?default_value:generic_string ->
  ?description:generic_string ->
  unit ->
  table_property_description

val make_table :
  ?table_name:table_name ->
  ?description:generic_string ->
  ?table_properties:table_property_description_list ->
  unit ->
  table

val make_list_tables_response :
  ?tables:table_list -> ?next_token:next_page_token -> unit -> list_tables_response

val make_list_tables_request :
  ?next_token:next_page_token -> ?max_results:max_results -> unit -> list_tables_request

val make_execution_status :
  ?status_code:execution_status_code ->
  ?status_reason:execution_status_reason ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?completed_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  execution_status

val make_execution_reference :
  execution_id:generic_string -> execution_status:execution_status -> unit -> execution_reference

val make_list_executions_response :
  ?executions:execution_reference_list ->
  ?next_token:next_page_token ->
  unit ->
  list_executions_response

val make_list_executions_request :
  ?max_results:max_results ->
  ?next_token:next_page_token ->
  export_arn:arn ->
  unit ->
  list_executions_request

val make_column :
  ?name:generic_string -> ?type_:generic_string -> ?description:generic_string -> unit -> column

val make_get_table_response :
  ?table_name:table_name ->
  ?description:generic_string ->
  ?table_properties:table_properties ->
  ?schema:column_list ->
  unit ->
  get_table_response

val make_get_table_request :
  ?table_properties:table_properties -> table_name:table_name -> unit -> get_table_request

val make_refresh_cadence : frequency:frequency_option -> unit -> refresh_cadence

val make_s3_output_configurations :
  output_type:s3_output_type ->
  format:format_option ->
  compression:compression_option ->
  overwrite:overwrite_option ->
  unit ->
  s3_output_configurations

val make_s3_destination :
  ?s3_bucket_owner:account_id ->
  s3_bucket:generic_string ->
  s3_prefix:generic_string ->
  s3_region:generic_string ->
  s3_output_configurations:s3_output_configurations ->
  unit ->
  s3_destination

val make_destination_configurations :
  s3_destination:s3_destination -> unit -> destination_configurations

val make_data_query :
  ?table_configurations:table_configurations ->
  query_statement:query_statement ->
  unit ->
  data_query

val make_export_ :
  ?export_arn:arn ->
  ?description:generic_string ->
  name:export_name ->
  data_query:data_query ->
  destination_configurations:destination_configurations ->
  refresh_cadence:refresh_cadence ->
  unit ->
  export_

val make_get_execution_response :
  ?execution_id:generic_string ->
  ?export_:export_ ->
  ?execution_status:execution_status ->
  unit ->
  get_execution_response

val make_get_execution_request :
  export_arn:arn -> execution_id:generic_string -> unit -> get_execution_request

val make_create_export_response : ?export_arn:arn -> unit -> create_export_response

val make_create_export_request :
  ?resource_tags:resource_tag_list -> export_:export_ -> unit -> create_export_request

val make_delete_export_response : ?export_arn:arn -> unit -> delete_export_response
val make_delete_export_request : export_arn:arn -> unit -> delete_export_request

val make_export_status :
  ?status_code:export_status_code ->
  ?status_reason:execution_status_reason ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_refreshed_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  export_status

val make_export_reference :
  export_arn:arn ->
  export_name:export_name ->
  export_status:export_status ->
  unit ->
  export_reference

val make_get_export_response :
  ?export_:export_ -> ?export_status:export_status -> unit -> get_export_response

val make_get_export_request : export_arn:arn -> unit -> get_export_request

val make_list_exports_response :
  ?exports:export_reference_list -> ?next_token:next_page_token -> unit -> list_exports_response

val make_list_exports_request :
  ?max_results:max_results -> ?next_token:next_page_token -> unit -> list_exports_request

val make_update_export_response : ?export_arn:arn -> unit -> update_export_response
val make_update_export_request : export_arn:arn -> export_:export_ -> unit -> update_export_request
