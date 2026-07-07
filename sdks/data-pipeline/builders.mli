open Types

val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_pipeline_id_name : ?name:id -> ?id:id -> unit -> pipeline_id_name

val make_field :
  ?ref_value:field_name_string ->
  ?string_value:field_string_value ->
  key:field_name_string ->
  unit ->
  field

val make_validation_warning : ?warnings:validation_messages -> ?id:id -> unit -> validation_warning
val make_validation_error : ?errors:validation_messages -> ?id:id -> unit -> validation_error

val make_validate_pipeline_definition_output :
  ?validation_warnings:validation_warnings ->
  ?validation_errors:validation_errors ->
  errored:boolean_ ->
  unit ->
  validate_pipeline_definition_output

val make_pipeline_object : fields:field_list -> name:id -> id:id -> unit -> pipeline_object

val make_parameter_attribute :
  string_value:attribute_value_string -> key:attribute_name_string -> unit -> parameter_attribute

val make_parameter_object :
  attributes:parameter_attribute_list -> id:field_name_string -> unit -> parameter_object

val make_parameter_value :
  string_value:field_string_value -> id:field_name_string -> unit -> parameter_value

val make_validate_pipeline_definition_input :
  ?parameter_values:parameter_value_list ->
  ?parameter_objects:parameter_object_list ->
  pipeline_objects:pipeline_object_list ->
  pipeline_id:id ->
  unit ->
  validate_pipeline_definition_input

val make_task_object :
  ?objects:pipeline_object_map ->
  ?attempt_id:id ->
  ?pipeline_id:id ->
  ?task_id:task_id ->
  unit ->
  task_object

val make_set_task_status_output : unit -> unit

val make_set_task_status_input :
  ?error_stack_trace:string_ ->
  ?error_message:error_message ->
  ?error_id:string_ ->
  task_status:task_status ->
  task_id:task_id ->
  unit ->
  set_task_status_input

val make_set_status_input :
  status:string_ -> object_ids:id_list -> pipeline_id:id -> unit -> set_status_input

val make_operator : ?values:string_list -> ?type_:operator_type -> unit -> operator
val make_selector : ?operator:operator -> ?field_name:string_ -> unit -> selector

val make_report_task_runner_heartbeat_output :
  terminate:boolean_ -> unit -> report_task_runner_heartbeat_output

val make_report_task_runner_heartbeat_input :
  ?hostname:id ->
  ?worker_group:string_ ->
  taskrunner_id:id ->
  unit ->
  report_task_runner_heartbeat_input

val make_report_task_progress_output : canceled:boolean_ -> unit -> report_task_progress_output

val make_report_task_progress_input :
  ?fields:field_list -> task_id:task_id -> unit -> report_task_progress_input

val make_remove_tags_output : unit -> unit
val make_remove_tags_input : tag_keys:string_list -> pipeline_id:id -> unit -> remove_tags_input

val make_query_objects_output :
  ?has_more_results:boolean_ -> ?marker:string_ -> ?ids:id_list -> unit -> query_objects_output

val make_query : ?selectors:selector_list -> unit -> query

val make_query_objects_input :
  ?limit:int_ ->
  ?marker:string_ ->
  ?query:query ->
  sphere:string_ ->
  pipeline_id:id ->
  unit ->
  query_objects_input

val make_put_pipeline_definition_output :
  ?validation_warnings:validation_warnings ->
  ?validation_errors:validation_errors ->
  errored:boolean_ ->
  unit ->
  put_pipeline_definition_output

val make_put_pipeline_definition_input :
  ?parameter_values:parameter_value_list ->
  ?parameter_objects:parameter_object_list ->
  pipeline_objects:pipeline_object_list ->
  pipeline_id:id ->
  unit ->
  put_pipeline_definition_input

val make_poll_for_task_output : ?task_object:task_object -> unit -> poll_for_task_output
val make_instance_identity : ?signature:string_ -> ?document:string_ -> unit -> instance_identity

val make_poll_for_task_input :
  ?instance_identity:instance_identity ->
  ?hostname:id ->
  worker_group:string_ ->
  unit ->
  poll_for_task_input

val make_pipeline_description :
  ?tags:tag_list ->
  ?description:string_ ->
  fields:field_list ->
  name:id ->
  pipeline_id:id ->
  unit ->
  pipeline_description

val make_list_pipelines_output :
  ?has_more_results:boolean_ ->
  ?marker:string_ ->
  pipeline_id_list:pipeline_list ->
  unit ->
  list_pipelines_output

val make_list_pipelines_input : ?marker:string_ -> unit -> list_pipelines_input

val make_get_pipeline_definition_output :
  ?parameter_values:parameter_value_list ->
  ?parameter_objects:parameter_object_list ->
  ?pipeline_objects:pipeline_object_list ->
  unit ->
  get_pipeline_definition_output

val make_get_pipeline_definition_input :
  ?version:string_ -> pipeline_id:id -> unit -> get_pipeline_definition_input

val make_evaluate_expression_output :
  evaluated_expression:long_string -> unit -> evaluate_expression_output

val make_evaluate_expression_input :
  expression:long_string -> object_id:id -> pipeline_id:id -> unit -> evaluate_expression_input

val make_describe_pipelines_output :
  pipeline_description_list:pipeline_description_list -> unit -> describe_pipelines_output

val make_describe_pipelines_input : pipeline_ids:id_list -> unit -> describe_pipelines_input

val make_describe_objects_output :
  ?has_more_results:boolean_ ->
  ?marker:string_ ->
  pipeline_objects:pipeline_object_list ->
  unit ->
  describe_objects_output

val make_describe_objects_input :
  ?marker:string_ ->
  ?evaluate_expressions:boolean_ ->
  object_ids:id_list ->
  pipeline_id:id ->
  unit ->
  describe_objects_input

val make_delete_pipeline_input : pipeline_id:id -> unit -> delete_pipeline_input
val make_deactivate_pipeline_output : unit -> unit

val make_deactivate_pipeline_input :
  ?cancel_active:cancel_active -> pipeline_id:id -> unit -> deactivate_pipeline_input

val make_create_pipeline_output : pipeline_id:id -> unit -> create_pipeline_output

val make_create_pipeline_input :
  ?tags:tag_list -> ?description:string_ -> unique_id:id -> name:id -> unit -> create_pipeline_input

val make_add_tags_output : unit -> unit
val make_add_tags_input : tags:tag_list -> pipeline_id:id -> unit -> add_tags_input
val make_activate_pipeline_output : unit -> unit

val make_activate_pipeline_input :
  ?start_timestamp:timestamp ->
  ?parameter_values:parameter_value_list ->
  pipeline_id:id ->
  unit ->
  activate_pipeline_input
