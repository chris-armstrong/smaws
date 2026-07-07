open Types

val make_table_member : ?schema:string_ -> ?type_:string_ -> ?name:string_ -> unit -> table_member

val make_sub_statement_data :
  ?has_result_set:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?redshift_query_id:long ->
  ?result_size:long ->
  ?result_rows:long ->
  ?query_string:statement_string ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:statement_status_string ->
  ?error:string_ ->
  ?duration:long ->
  id:uui_d ->
  unit ->
  sub_statement_data

val make_sql_parameter : value:parameter_value -> name:parameter_name -> unit -> sql_parameter

val make_statement_data :
  ?session_id:uui_d ->
  ?result_format:result_format_string ->
  ?is_batch_statement:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?query_parameters:sql_parameters_list ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?statement_name:statement_name_string ->
  ?status:status_string ->
  ?secret_arn:secret_arn ->
  ?query_strings:statement_string_list ->
  ?query_string:statement_string ->
  id:uui_d ->
  unit ->
  statement_data

val make_list_tables_response :
  ?next_token:string_ -> ?tables:table_list -> unit -> list_tables_response

val make_list_tables_request :
  ?workgroup_name:workgroup_name_string ->
  ?max_results:page_size ->
  ?next_token:string_ ->
  ?table_pattern:string_ ->
  ?schema_pattern:string_ ->
  ?connected_database:string_ ->
  ?db_user:string_ ->
  ?secret_arn:secret_arn ->
  ?cluster_identifier:cluster_identifier_string ->
  database:string_ ->
  unit ->
  list_tables_request

val make_list_statements_response :
  ?next_token:string_ -> statements:statement_list -> unit -> list_statements_response

val make_list_statements_request :
  ?workgroup_name:workgroup_name_string ->
  ?cluster_identifier:cluster_identifier_string ->
  ?database:string_ ->
  ?role_level:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?status:status_string ->
  ?statement_name:statement_name_string ->
  ?max_results:list_statements_limit ->
  ?next_token:string_ ->
  unit ->
  list_statements_request

val make_list_schemas_response :
  ?next_token:string_ -> ?schemas:schema_list -> unit -> list_schemas_response

val make_list_schemas_request :
  ?workgroup_name:workgroup_name_string ->
  ?max_results:page_size ->
  ?next_token:string_ ->
  ?schema_pattern:string_ ->
  ?connected_database:string_ ->
  ?db_user:string_ ->
  ?secret_arn:secret_arn ->
  ?cluster_identifier:cluster_identifier_string ->
  database:string_ ->
  unit ->
  list_schemas_request

val make_list_databases_response :
  ?next_token:string_ -> ?databases:database_list -> unit -> list_databases_response

val make_list_databases_request :
  ?workgroup_name:workgroup_name_string ->
  ?max_results:page_size ->
  ?next_token:string_ ->
  ?db_user:string_ ->
  ?secret_arn:secret_arn ->
  ?cluster_identifier:cluster_identifier_string ->
  database:string_ ->
  unit ->
  list_databases_request

val make_column_metadata :
  ?column_default:string_ ->
  ?length:integer ->
  ?type_name:string_ ->
  ?table_name:string_ ->
  ?schema_name:string_ ->
  ?scale:integer ->
  ?precision:integer ->
  ?nullable:integer ->
  ?name:string_ ->
  ?label:string_ ->
  ?is_signed:bool_ ->
  ?is_currency:bool_ ->
  ?is_case_sensitive:bool_ ->
  unit ->
  column_metadata

val make_get_statement_result_v2_response :
  ?next_token:string_ ->
  ?result_format:result_format_string ->
  ?total_num_rows:long ->
  ?column_metadata:column_metadata_list ->
  records:formatted_sql_records ->
  unit ->
  get_statement_result_v2_response

val make_get_statement_result_v2_request :
  ?next_token:string_ -> id:uui_d -> unit -> get_statement_result_v2_request

val make_get_statement_result_response :
  ?next_token:string_ ->
  ?total_num_rows:long ->
  ?column_metadata:column_metadata_list ->
  records:sql_records ->
  unit ->
  get_statement_result_response

val make_get_statement_result_request :
  ?next_token:string_ -> id:uui_d -> unit -> get_statement_result_request

val make_execute_statement_output :
  ?session_id:uui_d ->
  ?workgroup_name:workgroup_name_string ->
  ?secret_arn:secret_arn ->
  ?database:string_ ->
  ?db_groups:db_group_list ->
  ?db_user:string_ ->
  ?cluster_identifier:cluster_identifier_string ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?id:uui_d ->
  unit ->
  execute_statement_output

val make_execute_statement_input :
  ?session_id:uui_d ->
  ?session_keep_alive_seconds:session_alive_seconds ->
  ?result_format:result_format_string ->
  ?client_token:client_token ->
  ?workgroup_name:workgroup_name_string ->
  ?parameters:sql_parameters_list ->
  ?statement_name:statement_name_string ->
  ?with_event:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?database:string_ ->
  ?db_user:string_ ->
  ?secret_arn:secret_arn ->
  ?cluster_identifier:cluster_identifier_string ->
  sql:statement_string ->
  unit ->
  execute_statement_input

val make_describe_table_response :
  ?next_token:string_ ->
  ?column_list:column_list ->
  ?table_name:string_ ->
  unit ->
  describe_table_response

val make_describe_table_request :
  ?workgroup_name:workgroup_name_string ->
  ?max_results:page_size ->
  ?next_token:string_ ->
  ?table:string_ ->
  ?schema:string_ ->
  ?connected_database:string_ ->
  ?db_user:string_ ->
  ?secret_arn:secret_arn ->
  ?cluster_identifier:cluster_identifier_string ->
  database:string_ ->
  unit ->
  describe_table_request

val make_describe_statement_response :
  ?session_id:string_ ->
  ?result_format:result_format_string ->
  ?workgroup_name:workgroup_name_string ->
  ?sub_statements:sub_statement_list ->
  ?query_parameters:sql_parameters_list ->
  ?redshift_query_id:long ->
  ?result_size:long ->
  ?result_rows:long ->
  ?query_string:statement_string ->
  ?has_result_set:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?redshift_pid:long ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:status_string ->
  ?error:string_ ->
  ?duration:long ->
  ?cluster_identifier:string_ ->
  ?database:string_ ->
  ?db_user:string_ ->
  ?secret_arn:secret_arn ->
  id:uui_d ->
  unit ->
  describe_statement_response

val make_describe_statement_request : id:uui_d -> unit -> describe_statement_request

val make_cancel_statement_response :
  ?status:Smaws_Lib.Smithy_api.Types.boolean_ -> unit -> cancel_statement_response

val make_cancel_statement_request : id:uui_d -> unit -> cancel_statement_request

val make_batch_execute_statement_output :
  ?session_id:uui_d ->
  ?workgroup_name:workgroup_name_string ->
  ?secret_arn:secret_arn ->
  ?database:string_ ->
  ?db_groups:db_group_list ->
  ?db_user:string_ ->
  ?cluster_identifier:cluster_identifier_string ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?id:uui_d ->
  unit ->
  batch_execute_statement_output

val make_batch_execute_statement_input :
  ?session_id:uui_d ->
  ?session_keep_alive_seconds:session_alive_seconds ->
  ?result_format:result_format_string ->
  ?client_token:client_token ->
  ?workgroup_name:workgroup_name_string ->
  ?parameters:sql_parameters_list ->
  ?statement_name:statement_name_string ->
  ?with_event:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?database:string_ ->
  ?db_user:string_ ->
  ?secret_arn:secret_arn ->
  ?cluster_identifier:cluster_identifier_string ->
  sqls:sql_list ->
  unit ->
  batch_execute_statement_input
