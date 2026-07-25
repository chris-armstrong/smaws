open Types

val make_activate_pipeline_output : unit -> unit

val make_parameter_value :
  id:field_name_string -> string_value:field_string_value -> unit -> parameter_value

val make_activate_pipeline_input :
  ?parameter_values:parameter_value_list ->
  ?start_timestamp:timestamp ->
  pipeline_id:id ->
  unit ->
  activate_pipeline_input

val make_add_tags_output : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag
val make_add_tags_input : pipeline_id:id -> tags:tag_list -> unit -> add_tags_input
val make_create_pipeline_output : pipeline_id:id -> unit -> create_pipeline_output

val make_create_pipeline_input :
  ?description:string_ -> ?tags:tag_list -> name:id -> unique_id:id -> unit -> create_pipeline_input

val make_validation_warning : ?id:id -> ?warnings:validation_messages -> unit -> validation_warning
val make_validation_error : ?id:id -> ?errors:validation_messages -> unit -> validation_error

val make_validate_pipeline_definition_output :
  ?validation_errors:validation_errors ->
  ?validation_warnings:validation_warnings ->
  errored:boolean_ ->
  unit ->
  validate_pipeline_definition_output

val make_parameter_attribute :
  key:attribute_name_string -> string_value:attribute_value_string -> unit -> parameter_attribute

val make_parameter_object :
  id:field_name_string -> attributes:parameter_attribute_list -> unit -> parameter_object

val make_field :
  ?string_value:field_string_value ->
  ?ref_value:field_name_string ->
  key:field_name_string ->
  unit ->
  field

val make_pipeline_object : id:id -> name:id -> fields:field_list -> unit -> pipeline_object

val make_validate_pipeline_definition_input :
  ?parameter_objects:parameter_object_list ->
  ?parameter_values:parameter_value_list ->
  pipeline_id:id ->
  pipeline_objects:pipeline_object_list ->
  unit ->
  validate_pipeline_definition_input

val make_set_task_status_output : unit -> unit

val make_set_task_status_input :
  ?error_id:string_ ->
  ?error_message:error_message ->
  ?error_stack_trace:string_ ->
  task_id:task_id ->
  task_status:task_status ->
  unit ->
  set_task_status_input

val make_set_status_input :
  pipeline_id:id -> object_ids:id_list -> status:string_ -> unit -> set_status_input

val make_report_task_runner_heartbeat_output :
  terminate:boolean_ -> unit -> report_task_runner_heartbeat_output

val make_report_task_runner_heartbeat_input :
  ?worker_group:string_ ->
  ?hostname:id ->
  taskrunner_id:id ->
  unit ->
  report_task_runner_heartbeat_input

val make_report_task_progress_output : canceled:boolean_ -> unit -> report_task_progress_output

val make_report_task_progress_input :
  ?fields:field_list -> task_id:task_id -> unit -> report_task_progress_input

val make_remove_tags_output : unit -> unit
val make_remove_tags_input : pipeline_id:id -> tag_keys:string_list -> unit -> remove_tags_input

val make_query_objects_output :
  ?ids:id_list -> ?marker:string_ -> ?has_more_results:boolean_ -> unit -> query_objects_output

val make_operator : ?type_:operator_type -> ?values:string_list -> unit -> operator
val make_selector : ?field_name:string_ -> ?operator:operator -> unit -> selector
val make_query : ?selectors:selector_list -> unit -> query

val make_query_objects_input :
  ?query:query ->
  ?marker:string_ ->
  ?limit:int_ ->
  pipeline_id:id ->
  sphere:string_ ->
  unit ->
  query_objects_input

val make_put_pipeline_definition_output :
  ?validation_errors:validation_errors ->
  ?validation_warnings:validation_warnings ->
  errored:boolean_ ->
  unit ->
  put_pipeline_definition_output

val make_put_pipeline_definition_input :
  ?parameter_objects:parameter_object_list ->
  ?parameter_values:parameter_value_list ->
  pipeline_id:id ->
  pipeline_objects:pipeline_object_list ->
  unit ->
  put_pipeline_definition_input

val make_task_object :
  ?task_id:task_id ->
  ?pipeline_id:id ->
  ?attempt_id:id ->
  ?objects:pipeline_object_map ->
  unit ->
  task_object

val make_poll_for_task_output : ?task_object:task_object -> unit -> poll_for_task_output
val make_instance_identity : ?document:string_ -> ?signature:string_ -> unit -> instance_identity

val make_poll_for_task_input :
  ?hostname:id ->
  ?instance_identity:instance_identity ->
  worker_group:string_ ->
  unit ->
  poll_for_task_input

val make_pipeline_id_name : ?id:id -> ?name:id -> unit -> pipeline_id_name

val make_list_pipelines_output :
  ?marker:string_ ->
  ?has_more_results:boolean_ ->
  pipeline_id_list:pipeline_list ->
  unit ->
  list_pipelines_output

val make_list_pipelines_input : ?marker:string_ -> unit -> list_pipelines_input

val make_get_pipeline_definition_output :
  ?pipeline_objects:pipeline_object_list ->
  ?parameter_objects:parameter_object_list ->
  ?parameter_values:parameter_value_list ->
  unit ->
  get_pipeline_definition_output

val make_get_pipeline_definition_input :
  ?version:string_ -> pipeline_id:id -> unit -> get_pipeline_definition_input

val make_evaluate_expression_output :
  evaluated_expression:long_string -> unit -> evaluate_expression_output

val make_evaluate_expression_input :
  pipeline_id:id -> object_id:id -> expression:long_string -> unit -> evaluate_expression_input

val make_pipeline_description :
  ?description:string_ ->
  ?tags:tag_list ->
  pipeline_id:id ->
  name:id ->
  fields:field_list ->
  unit ->
  pipeline_description

val make_describe_pipelines_output :
  pipeline_description_list:pipeline_description_list -> unit -> describe_pipelines_output

val make_describe_pipelines_input : pipeline_ids:id_list -> unit -> describe_pipelines_input

val make_describe_objects_output :
  ?marker:string_ ->
  ?has_more_results:boolean_ ->
  pipeline_objects:pipeline_object_list ->
  unit ->
  describe_objects_output

val make_describe_objects_input :
  ?evaluate_expressions:boolean_ ->
  ?marker:string_ ->
  pipeline_id:id ->
  object_ids:id_list ->
  unit ->
  describe_objects_input

val make_delete_pipeline_input : pipeline_id:id -> unit -> delete_pipeline_input
val make_deactivate_pipeline_output : unit -> unit

val make_deactivate_pipeline_input :
  ?cancel_active:cancel_active -> pipeline_id:id -> unit -> deactivate_pipeline_input
