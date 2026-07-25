open Types

let make_activate_pipeline_output () = (() : unit)

let make_parameter_value ~id:(id_ : field_name_string)
    ~string_value:(string_value_ : field_string_value) () =
  ({ id = id_; string_value = string_value_ } : parameter_value)

let make_activate_pipeline_input ?parameter_values:(parameter_values_ : parameter_value_list option)
    ?start_timestamp:(start_timestamp_ : timestamp option) ~pipeline_id:(pipeline_id_ : id) () =
  ({
     pipeline_id = pipeline_id_;
     parameter_values = parameter_values_;
     start_timestamp = start_timestamp_;
   }
    : activate_pipeline_input)

let make_add_tags_output () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_add_tags_input ~pipeline_id:(pipeline_id_ : id) ~tags:(tags_ : tag_list) () =
  ({ pipeline_id = pipeline_id_; tags = tags_ } : add_tags_input)

let make_create_pipeline_output ~pipeline_id:(pipeline_id_ : id) () =
  ({ pipeline_id = pipeline_id_ } : create_pipeline_output)

let make_create_pipeline_input ?description:(description_ : string_ option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : id) ~unique_id:(unique_id_ : id) () =
  ({ name = name_; unique_id = unique_id_; description = description_; tags = tags_ }
    : create_pipeline_input)

let make_validation_warning ?id:(id_ : id option) ?warnings:(warnings_ : validation_messages option)
    () =
  ({ id = id_; warnings = warnings_ } : validation_warning)

let make_validation_error ?id:(id_ : id option) ?errors:(errors_ : validation_messages option) () =
  ({ id = id_; errors = errors_ } : validation_error)

let make_validate_pipeline_definition_output
    ?validation_errors:(validation_errors_ : validation_errors option)
    ?validation_warnings:(validation_warnings_ : validation_warnings option)
    ~errored:(errored_ : boolean_) () =
  ({
     validation_errors = validation_errors_;
     validation_warnings = validation_warnings_;
     errored = errored_;
   }
    : validate_pipeline_definition_output)

let make_parameter_attribute ~key:(key_ : attribute_name_string)
    ~string_value:(string_value_ : attribute_value_string) () =
  ({ key = key_; string_value = string_value_ } : parameter_attribute)

let make_parameter_object ~id:(id_ : field_name_string)
    ~attributes:(attributes_ : parameter_attribute_list) () =
  ({ id = id_; attributes = attributes_ } : parameter_object)

let make_field ?string_value:(string_value_ : field_string_value option)
    ?ref_value:(ref_value_ : field_name_string option) ~key:(key_ : field_name_string) () =
  ({ key = key_; string_value = string_value_; ref_value = ref_value_ } : field)

let make_pipeline_object ~id:(id_ : id) ~name:(name_ : id) ~fields:(fields_ : field_list) () =
  ({ id = id_; name = name_; fields = fields_ } : pipeline_object)

let make_validate_pipeline_definition_input
    ?parameter_objects:(parameter_objects_ : parameter_object_list option)
    ?parameter_values:(parameter_values_ : parameter_value_list option)
    ~pipeline_id:(pipeline_id_ : id) ~pipeline_objects:(pipeline_objects_ : pipeline_object_list) ()
    =
  ({
     pipeline_id = pipeline_id_;
     pipeline_objects = pipeline_objects_;
     parameter_objects = parameter_objects_;
     parameter_values = parameter_values_;
   }
    : validate_pipeline_definition_input)

let make_set_task_status_output () = (() : unit)

let make_set_task_status_input ?error_id:(error_id_ : string_ option)
    ?error_message:(error_message_ : error_message option)
    ?error_stack_trace:(error_stack_trace_ : string_ option) ~task_id:(task_id_ : task_id)
    ~task_status:(task_status_ : task_status) () =
  ({
     task_id = task_id_;
     task_status = task_status_;
     error_id = error_id_;
     error_message = error_message_;
     error_stack_trace = error_stack_trace_;
   }
    : set_task_status_input)

let make_set_status_input ~pipeline_id:(pipeline_id_ : id) ~object_ids:(object_ids_ : id_list)
    ~status:(status_ : string_) () =
  ({ pipeline_id = pipeline_id_; object_ids = object_ids_; status = status_ } : set_status_input)

let make_report_task_runner_heartbeat_output ~terminate:(terminate_ : boolean_) () =
  ({ terminate = terminate_ } : report_task_runner_heartbeat_output)

let make_report_task_runner_heartbeat_input ?worker_group:(worker_group_ : string_ option)
    ?hostname:(hostname_ : id option) ~taskrunner_id:(taskrunner_id_ : id) () =
  ({ taskrunner_id = taskrunner_id_; worker_group = worker_group_; hostname = hostname_ }
    : report_task_runner_heartbeat_input)

let make_report_task_progress_output ~canceled:(canceled_ : boolean_) () =
  ({ canceled = canceled_ } : report_task_progress_output)

let make_report_task_progress_input ?fields:(fields_ : field_list option)
    ~task_id:(task_id_ : task_id) () =
  ({ task_id = task_id_; fields = fields_ } : report_task_progress_input)

let make_remove_tags_output () = (() : unit)

let make_remove_tags_input ~pipeline_id:(pipeline_id_ : id) ~tag_keys:(tag_keys_ : string_list) () =
  ({ pipeline_id = pipeline_id_; tag_keys = tag_keys_ } : remove_tags_input)

let make_query_objects_output ?ids:(ids_ : id_list option) ?marker:(marker_ : string_ option)
    ?has_more_results:(has_more_results_ : boolean_ option) () =
  ({ ids = ids_; marker = marker_; has_more_results = has_more_results_ } : query_objects_output)

let make_operator ?type_:(type__ : operator_type option) ?values:(values_ : string_list option) () =
  ({ type_ = type__; values = values_ } : operator)

let make_selector ?field_name:(field_name_ : string_ option) ?operator:(operator_ : operator option)
    () =
  ({ field_name = field_name_; operator = operator_ } : selector)

let make_query ?selectors:(selectors_ : selector_list option) () =
  ({ selectors = selectors_ } : query)

let make_query_objects_input ?query:(query_ : query option) ?marker:(marker_ : string_ option)
    ?limit:(limit_ : int_ option) ~pipeline_id:(pipeline_id_ : id) ~sphere:(sphere_ : string_) () =
  ({
     pipeline_id = pipeline_id_;
     query = query_;
     sphere = sphere_;
     marker = marker_;
     limit = limit_;
   }
    : query_objects_input)

let make_put_pipeline_definition_output
    ?validation_errors:(validation_errors_ : validation_errors option)
    ?validation_warnings:(validation_warnings_ : validation_warnings option)
    ~errored:(errored_ : boolean_) () =
  ({
     validation_errors = validation_errors_;
     validation_warnings = validation_warnings_;
     errored = errored_;
   }
    : put_pipeline_definition_output)

let make_put_pipeline_definition_input
    ?parameter_objects:(parameter_objects_ : parameter_object_list option)
    ?parameter_values:(parameter_values_ : parameter_value_list option)
    ~pipeline_id:(pipeline_id_ : id) ~pipeline_objects:(pipeline_objects_ : pipeline_object_list) ()
    =
  ({
     pipeline_id = pipeline_id_;
     pipeline_objects = pipeline_objects_;
     parameter_objects = parameter_objects_;
     parameter_values = parameter_values_;
   }
    : put_pipeline_definition_input)

let make_task_object ?task_id:(task_id_ : task_id option) ?pipeline_id:(pipeline_id_ : id option)
    ?attempt_id:(attempt_id_ : id option) ?objects:(objects_ : pipeline_object_map option) () =
  ({ task_id = task_id_; pipeline_id = pipeline_id_; attempt_id = attempt_id_; objects = objects_ }
    : task_object)

let make_poll_for_task_output ?task_object:(task_object_ : task_object option) () =
  ({ task_object = task_object_ } : poll_for_task_output)

let make_instance_identity ?document:(document_ : string_ option)
    ?signature:(signature_ : string_ option) () =
  ({ document = document_; signature = signature_ } : instance_identity)

let make_poll_for_task_input ?hostname:(hostname_ : id option)
    ?instance_identity:(instance_identity_ : instance_identity option)
    ~worker_group:(worker_group_ : string_) () =
  ({ worker_group = worker_group_; hostname = hostname_; instance_identity = instance_identity_ }
    : poll_for_task_input)

let make_pipeline_id_name ?id:(id_ : id option) ?name:(name_ : id option) () =
  ({ id = id_; name = name_ } : pipeline_id_name)

let make_list_pipelines_output ?marker:(marker_ : string_ option)
    ?has_more_results:(has_more_results_ : boolean_ option)
    ~pipeline_id_list:(pipeline_id_list_ : pipeline_list) () =
  ({ pipeline_id_list = pipeline_id_list_; marker = marker_; has_more_results = has_more_results_ }
    : list_pipelines_output)

let make_list_pipelines_input ?marker:(marker_ : string_ option) () =
  ({ marker = marker_ } : list_pipelines_input)

let make_get_pipeline_definition_output
    ?pipeline_objects:(pipeline_objects_ : pipeline_object_list option)
    ?parameter_objects:(parameter_objects_ : parameter_object_list option)
    ?parameter_values:(parameter_values_ : parameter_value_list option) () =
  ({
     pipeline_objects = pipeline_objects_;
     parameter_objects = parameter_objects_;
     parameter_values = parameter_values_;
   }
    : get_pipeline_definition_output)

let make_get_pipeline_definition_input ?version:(version_ : string_ option)
    ~pipeline_id:(pipeline_id_ : id) () =
  ({ pipeline_id = pipeline_id_; version = version_ } : get_pipeline_definition_input)

let make_evaluate_expression_output ~evaluated_expression:(evaluated_expression_ : long_string) () =
  ({ evaluated_expression = evaluated_expression_ } : evaluate_expression_output)

let make_evaluate_expression_input ~pipeline_id:(pipeline_id_ : id) ~object_id:(object_id_ : id)
    ~expression:(expression_ : long_string) () =
  ({ pipeline_id = pipeline_id_; object_id = object_id_; expression = expression_ }
    : evaluate_expression_input)

let make_pipeline_description ?description:(description_ : string_ option)
    ?tags:(tags_ : tag_list option) ~pipeline_id:(pipeline_id_ : id) ~name:(name_ : id)
    ~fields:(fields_ : field_list) () =
  ({
     pipeline_id = pipeline_id_;
     name = name_;
     fields = fields_;
     description = description_;
     tags = tags_;
   }
    : pipeline_description)

let make_describe_pipelines_output
    ~pipeline_description_list:(pipeline_description_list_ : pipeline_description_list) () =
  ({ pipeline_description_list = pipeline_description_list_ } : describe_pipelines_output)

let make_describe_pipelines_input ~pipeline_ids:(pipeline_ids_ : id_list) () =
  ({ pipeline_ids = pipeline_ids_ } : describe_pipelines_input)

let make_describe_objects_output ?marker:(marker_ : string_ option)
    ?has_more_results:(has_more_results_ : boolean_ option)
    ~pipeline_objects:(pipeline_objects_ : pipeline_object_list) () =
  ({ pipeline_objects = pipeline_objects_; marker = marker_; has_more_results = has_more_results_ }
    : describe_objects_output)

let make_describe_objects_input ?evaluate_expressions:(evaluate_expressions_ : boolean_ option)
    ?marker:(marker_ : string_ option) ~pipeline_id:(pipeline_id_ : id)
    ~object_ids:(object_ids_ : id_list) () =
  ({
     pipeline_id = pipeline_id_;
     object_ids = object_ids_;
     evaluate_expressions = evaluate_expressions_;
     marker = marker_;
   }
    : describe_objects_input)

let make_delete_pipeline_input ~pipeline_id:(pipeline_id_ : id) () =
  ({ pipeline_id = pipeline_id_ } : delete_pipeline_input)

let make_deactivate_pipeline_output () = (() : unit)

let make_deactivate_pipeline_input ?cancel_active:(cancel_active_ : cancel_active option)
    ~pipeline_id:(pipeline_id_ : id) () =
  ({ pipeline_id = pipeline_id_; cancel_active = cancel_active_ } : deactivate_pipeline_input)
