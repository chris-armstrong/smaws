open Types

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_pipeline_id_name ?name:(name_ : id option) ?id:(id_ : id option) () =
  ({ name = name_; id = id_ } : pipeline_id_name)

let make_field ?ref_value:(ref_value_ : field_name_string option)
    ?string_value:(string_value_ : field_string_value option) ~key:(key_ : field_name_string) () =
  ({ ref_value = ref_value_; string_value = string_value_; key = key_ } : field)

let make_validation_warning ?warnings:(warnings_ : validation_messages option) ?id:(id_ : id option)
    () =
  ({ warnings = warnings_; id = id_ } : validation_warning)

let make_validation_error ?errors:(errors_ : validation_messages option) ?id:(id_ : id option) () =
  ({ errors = errors_; id = id_ } : validation_error)

let make_validate_pipeline_definition_output
    ?validation_warnings:(validation_warnings_ : validation_warnings option)
    ?validation_errors:(validation_errors_ : validation_errors option)
    ~errored:(errored_ : boolean_) () =
  ({
     errored = errored_;
     validation_warnings = validation_warnings_;
     validation_errors = validation_errors_;
   }
    : validate_pipeline_definition_output)

let make_pipeline_object ~fields:(fields_ : field_list) ~name:(name_ : id) ~id:(id_ : id) () =
  ({ fields = fields_; name = name_; id = id_ } : pipeline_object)

let make_parameter_attribute ~string_value:(string_value_ : attribute_value_string)
    ~key:(key_ : attribute_name_string) () =
  ({ string_value = string_value_; key = key_ } : parameter_attribute)

let make_parameter_object ~attributes:(attributes_ : parameter_attribute_list)
    ~id:(id_ : field_name_string) () =
  ({ attributes = attributes_; id = id_ } : parameter_object)

let make_parameter_value ~string_value:(string_value_ : field_string_value)
    ~id:(id_ : field_name_string) () =
  ({ string_value = string_value_; id = id_ } : parameter_value)

let make_validate_pipeline_definition_input
    ?parameter_values:(parameter_values_ : parameter_value_list option)
    ?parameter_objects:(parameter_objects_ : parameter_object_list option)
    ~pipeline_objects:(pipeline_objects_ : pipeline_object_list) ~pipeline_id:(pipeline_id_ : id) ()
    =
  ({
     parameter_values = parameter_values_;
     parameter_objects = parameter_objects_;
     pipeline_objects = pipeline_objects_;
     pipeline_id = pipeline_id_;
   }
    : validate_pipeline_definition_input)

let make_task_object ?objects:(objects_ : pipeline_object_map option)
    ?attempt_id:(attempt_id_ : id option) ?pipeline_id:(pipeline_id_ : id option)
    ?task_id:(task_id_ : task_id option) () =
  ({ objects = objects_; attempt_id = attempt_id_; pipeline_id = pipeline_id_; task_id = task_id_ }
    : task_object)

let make_set_task_status_output () = (() : unit)

let make_set_task_status_input ?error_stack_trace:(error_stack_trace_ : string_ option)
    ?error_message:(error_message_ : error_message option) ?error_id:(error_id_ : string_ option)
    ~task_status:(task_status_ : task_status) ~task_id:(task_id_ : task_id) () =
  ({
     error_stack_trace = error_stack_trace_;
     error_message = error_message_;
     error_id = error_id_;
     task_status = task_status_;
     task_id = task_id_;
   }
    : set_task_status_input)

let make_set_status_input ~status:(status_ : string_) ~object_ids:(object_ids_ : id_list)
    ~pipeline_id:(pipeline_id_ : id) () =
  ({ status = status_; object_ids = object_ids_; pipeline_id = pipeline_id_ } : set_status_input)

let make_operator ?values:(values_ : string_list option) ?type_:(type__ : operator_type option) () =
  ({ values = values_; type_ = type__ } : operator)

let make_selector ?operator:(operator_ : operator option) ?field_name:(field_name_ : string_ option)
    () =
  ({ operator = operator_; field_name = field_name_ } : selector)

let make_report_task_runner_heartbeat_output ~terminate:(terminate_ : boolean_) () =
  ({ terminate = terminate_ } : report_task_runner_heartbeat_output)

let make_report_task_runner_heartbeat_input ?hostname:(hostname_ : id option)
    ?worker_group:(worker_group_ : string_ option) ~taskrunner_id:(taskrunner_id_ : id) () =
  ({ hostname = hostname_; worker_group = worker_group_; taskrunner_id = taskrunner_id_ }
    : report_task_runner_heartbeat_input)

let make_report_task_progress_output ~canceled:(canceled_ : boolean_) () =
  ({ canceled = canceled_ } : report_task_progress_output)

let make_report_task_progress_input ?fields:(fields_ : field_list option)
    ~task_id:(task_id_ : task_id) () =
  ({ fields = fields_; task_id = task_id_ } : report_task_progress_input)

let make_remove_tags_output () = (() : unit)

let make_remove_tags_input ~tag_keys:(tag_keys_ : string_list) ~pipeline_id:(pipeline_id_ : id) () =
  ({ tag_keys = tag_keys_; pipeline_id = pipeline_id_ } : remove_tags_input)

let make_query_objects_output ?has_more_results:(has_more_results_ : boolean_ option)
    ?marker:(marker_ : string_ option) ?ids:(ids_ : id_list option) () =
  ({ has_more_results = has_more_results_; marker = marker_; ids = ids_ } : query_objects_output)

let make_query ?selectors:(selectors_ : selector_list option) () =
  ({ selectors = selectors_ } : query)

let make_query_objects_input ?limit:(limit_ : int_ option) ?marker:(marker_ : string_ option)
    ?query:(query_ : query option) ~sphere:(sphere_ : string_) ~pipeline_id:(pipeline_id_ : id) () =
  ({
     limit = limit_;
     marker = marker_;
     sphere = sphere_;
     query = query_;
     pipeline_id = pipeline_id_;
   }
    : query_objects_input)

let make_put_pipeline_definition_output
    ?validation_warnings:(validation_warnings_ : validation_warnings option)
    ?validation_errors:(validation_errors_ : validation_errors option)
    ~errored:(errored_ : boolean_) () =
  ({
     errored = errored_;
     validation_warnings = validation_warnings_;
     validation_errors = validation_errors_;
   }
    : put_pipeline_definition_output)

let make_put_pipeline_definition_input
    ?parameter_values:(parameter_values_ : parameter_value_list option)
    ?parameter_objects:(parameter_objects_ : parameter_object_list option)
    ~pipeline_objects:(pipeline_objects_ : pipeline_object_list) ~pipeline_id:(pipeline_id_ : id) ()
    =
  ({
     parameter_values = parameter_values_;
     parameter_objects = parameter_objects_;
     pipeline_objects = pipeline_objects_;
     pipeline_id = pipeline_id_;
   }
    : put_pipeline_definition_input)

let make_poll_for_task_output ?task_object:(task_object_ : task_object option) () =
  ({ task_object = task_object_ } : poll_for_task_output)

let make_instance_identity ?signature:(signature_ : string_ option)
    ?document:(document_ : string_ option) () =
  ({ signature = signature_; document = document_ } : instance_identity)

let make_poll_for_task_input ?instance_identity:(instance_identity_ : instance_identity option)
    ?hostname:(hostname_ : id option) ~worker_group:(worker_group_ : string_) () =
  ({ instance_identity = instance_identity_; hostname = hostname_; worker_group = worker_group_ }
    : poll_for_task_input)

let make_pipeline_description ?tags:(tags_ : tag_list option)
    ?description:(description_ : string_ option) ~fields:(fields_ : field_list) ~name:(name_ : id)
    ~pipeline_id:(pipeline_id_ : id) () =
  ({
     tags = tags_;
     description = description_;
     fields = fields_;
     name = name_;
     pipeline_id = pipeline_id_;
   }
    : pipeline_description)

let make_list_pipelines_output ?has_more_results:(has_more_results_ : boolean_ option)
    ?marker:(marker_ : string_ option) ~pipeline_id_list:(pipeline_id_list_ : pipeline_list) () =
  ({ has_more_results = has_more_results_; marker = marker_; pipeline_id_list = pipeline_id_list_ }
    : list_pipelines_output)

let make_list_pipelines_input ?marker:(marker_ : string_ option) () =
  ({ marker = marker_ } : list_pipelines_input)

let make_get_pipeline_definition_output
    ?parameter_values:(parameter_values_ : parameter_value_list option)
    ?parameter_objects:(parameter_objects_ : parameter_object_list option)
    ?pipeline_objects:(pipeline_objects_ : pipeline_object_list option) () =
  ({
     parameter_values = parameter_values_;
     parameter_objects = parameter_objects_;
     pipeline_objects = pipeline_objects_;
   }
    : get_pipeline_definition_output)

let make_get_pipeline_definition_input ?version:(version_ : string_ option)
    ~pipeline_id:(pipeline_id_ : id) () =
  ({ version = version_; pipeline_id = pipeline_id_ } : get_pipeline_definition_input)

let make_evaluate_expression_output ~evaluated_expression:(evaluated_expression_ : long_string) () =
  ({ evaluated_expression = evaluated_expression_ } : evaluate_expression_output)

let make_evaluate_expression_input ~expression:(expression_ : long_string)
    ~object_id:(object_id_ : id) ~pipeline_id:(pipeline_id_ : id) () =
  ({ expression = expression_; object_id = object_id_; pipeline_id = pipeline_id_ }
    : evaluate_expression_input)

let make_describe_pipelines_output
    ~pipeline_description_list:(pipeline_description_list_ : pipeline_description_list) () =
  ({ pipeline_description_list = pipeline_description_list_ } : describe_pipelines_output)

let make_describe_pipelines_input ~pipeline_ids:(pipeline_ids_ : id_list) () =
  ({ pipeline_ids = pipeline_ids_ } : describe_pipelines_input)

let make_describe_objects_output ?has_more_results:(has_more_results_ : boolean_ option)
    ?marker:(marker_ : string_ option) ~pipeline_objects:(pipeline_objects_ : pipeline_object_list)
    () =
  ({ has_more_results = has_more_results_; marker = marker_; pipeline_objects = pipeline_objects_ }
    : describe_objects_output)

let make_describe_objects_input ?marker:(marker_ : string_ option)
    ?evaluate_expressions:(evaluate_expressions_ : boolean_ option)
    ~object_ids:(object_ids_ : id_list) ~pipeline_id:(pipeline_id_ : id) () =
  ({
     marker = marker_;
     evaluate_expressions = evaluate_expressions_;
     object_ids = object_ids_;
     pipeline_id = pipeline_id_;
   }
    : describe_objects_input)

let make_delete_pipeline_input ~pipeline_id:(pipeline_id_ : id) () =
  ({ pipeline_id = pipeline_id_ } : delete_pipeline_input)

let make_deactivate_pipeline_output () = (() : unit)

let make_deactivate_pipeline_input ?cancel_active:(cancel_active_ : cancel_active option)
    ~pipeline_id:(pipeline_id_ : id) () =
  ({ cancel_active = cancel_active_; pipeline_id = pipeline_id_ } : deactivate_pipeline_input)

let make_create_pipeline_output ~pipeline_id:(pipeline_id_ : id) () =
  ({ pipeline_id = pipeline_id_ } : create_pipeline_output)

let make_create_pipeline_input ?tags:(tags_ : tag_list option)
    ?description:(description_ : string_ option) ~unique_id:(unique_id_ : id) ~name:(name_ : id) ()
    =
  ({ tags = tags_; description = description_; unique_id = unique_id_; name = name_ }
    : create_pipeline_input)

let make_add_tags_output () = (() : unit)

let make_add_tags_input ~tags:(tags_ : tag_list) ~pipeline_id:(pipeline_id_ : id) () =
  ({ tags = tags_; pipeline_id = pipeline_id_ } : add_tags_input)

let make_activate_pipeline_output () = (() : unit)

let make_activate_pipeline_input ?start_timestamp:(start_timestamp_ : timestamp option)
    ?parameter_values:(parameter_values_ : parameter_value_list option)
    ~pipeline_id:(pipeline_id_ : id) () =
  ({
     start_timestamp = start_timestamp_;
     parameter_values = parameter_values_;
     pipeline_id = pipeline_id_;
   }
    : activate_pipeline_input)
