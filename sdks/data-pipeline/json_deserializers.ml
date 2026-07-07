open Smaws_Lib.Json.DeserializeHelpers
open Types

let validation_message_of_yojson = string_of_yojson
let validation_messages_of_yojson tree path = list_of_yojson validation_message_of_yojson tree path
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let task_id_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "value" _list path;
     key = value_for_key tag_key_of_yojson "key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let string__of_yojson = string_of_yojson
let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path
let id_of_yojson = string_of_yojson

let pipeline_id_name_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key id_of_yojson "name") _list path;
     id = option_of_yojson (value_for_key id_of_yojson "id") _list path;
   }
    : pipeline_id_name)

let pipeline_list_of_yojson tree path = list_of_yojson pipeline_id_name_of_yojson tree path
let long_string_of_yojson = string_of_yojson
let int__of_yojson = int_of_yojson
let id_list_of_yojson tree path = list_of_yojson id_of_yojson tree path
let field_string_value_of_yojson = string_of_yojson
let field_name_string_of_yojson = string_of_yojson

let field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ref_value = option_of_yojson (value_for_key field_name_string_of_yojson "refValue") _list path;
     string_value =
       option_of_yojson (value_for_key field_string_value_of_yojson "stringValue") _list path;
     key = value_for_key field_name_string_of_yojson "key" _list path;
   }
    : field)

let field_list_of_yojson tree path = list_of_yojson field_of_yojson tree path
let error_message_of_yojson = string_of_yojson
let cancel_active_of_yojson = bool_of_yojson
let boolean__of_yojson = bool_of_yojson
let attribute_value_string_of_yojson = string_of_yojson
let attribute_name_string_of_yojson = string_of_yojson

let validation_warning_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     warnings = option_of_yojson (value_for_key validation_messages_of_yojson "warnings") _list path;
     id = option_of_yojson (value_for_key id_of_yojson "id") _list path;
   }
    : validation_warning)

let validation_warnings_of_yojson tree path = list_of_yojson validation_warning_of_yojson tree path

let validation_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors = option_of_yojson (value_for_key validation_messages_of_yojson "errors") _list path;
     id = option_of_yojson (value_for_key id_of_yojson "id") _list path;
   }
    : validation_error)

let validation_errors_of_yojson tree path = list_of_yojson validation_error_of_yojson tree path

let validate_pipeline_definition_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errored = value_for_key boolean__of_yojson "errored" _list path;
     validation_warnings =
       option_of_yojson
         (value_for_key validation_warnings_of_yojson "validationWarnings")
         _list path;
     validation_errors =
       option_of_yojson (value_for_key validation_errors_of_yojson "validationErrors") _list path;
   }
    : validate_pipeline_definition_output)

let pipeline_object_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fields = value_for_key field_list_of_yojson "fields" _list path;
     name = value_for_key id_of_yojson "name" _list path;
     id = value_for_key id_of_yojson "id" _list path;
   }
    : pipeline_object)

let pipeline_object_list_of_yojson tree path = list_of_yojson pipeline_object_of_yojson tree path

let parameter_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     string_value = value_for_key attribute_value_string_of_yojson "stringValue" _list path;
     key = value_for_key attribute_name_string_of_yojson "key" _list path;
   }
    : parameter_attribute)

let parameter_attribute_list_of_yojson tree path =
  list_of_yojson parameter_attribute_of_yojson tree path

let parameter_object_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes = value_for_key parameter_attribute_list_of_yojson "attributes" _list path;
     id = value_for_key field_name_string_of_yojson "id" _list path;
   }
    : parameter_object)

let parameter_object_list_of_yojson tree path = list_of_yojson parameter_object_of_yojson tree path

let parameter_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     string_value = value_for_key field_string_value_of_yojson "stringValue" _list path;
     id = value_for_key field_name_string_of_yojson "id" _list path;
   }
    : parameter_value)

let parameter_value_list_of_yojson tree path = list_of_yojson parameter_value_of_yojson tree path

let validate_pipeline_definition_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_values =
       option_of_yojson (value_for_key parameter_value_list_of_yojson "parameterValues") _list path;
     parameter_objects =
       option_of_yojson
         (value_for_key parameter_object_list_of_yojson "parameterObjects")
         _list path;
     pipeline_objects = value_for_key pipeline_object_list_of_yojson "pipelineObjects" _list path;
     pipeline_id = value_for_key id_of_yojson "pipelineId" _list path;
   }
    : validate_pipeline_definition_input)

let pipeline_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : pipeline_not_found_exception)

let pipeline_deleted_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : pipeline_deleted_exception)

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_request_exception)

let internal_service_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : internal_service_error)

let task_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FALSE" -> FALSE
    | `String "FAILED" -> FAILED
    | `String "FINISHED" -> FINISHED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaskStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskStatus")
     : task_status)
    : task_status)

let pipeline_object_map_of_yojson tree path =
  map_of_yojson id_of_yojson pipeline_object_of_yojson tree path

let task_object_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     objects = option_of_yojson (value_for_key pipeline_object_map_of_yojson "objects") _list path;
     attempt_id = option_of_yojson (value_for_key id_of_yojson "attemptId") _list path;
     pipeline_id = option_of_yojson (value_for_key id_of_yojson "pipelineId") _list path;
     task_id = option_of_yojson (value_for_key task_id_of_yojson "taskId") _list path;
   }
    : task_object)

let task_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : task_not_found_exception)

let set_task_status_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let set_task_status_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_stack_trace =
       option_of_yojson (value_for_key string__of_yojson "errorStackTrace") _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
     error_id = option_of_yojson (value_for_key string__of_yojson "errorId") _list path;
     task_status = value_for_key task_status_of_yojson "taskStatus" _list path;
     task_id = value_for_key task_id_of_yojson "taskId" _list path;
   }
    : set_task_status_input)

let set_status_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key string__of_yojson "status" _list path;
     object_ids = value_for_key id_list_of_yojson "objectIds" _list path;
     pipeline_id = value_for_key id_of_yojson "pipelineId" _list path;
   }
    : set_status_input)

let operator_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BETWEEN" -> Between
    | `String "GE" -> GreaterThanOrEqual
    | `String "LE" -> LessThanOrEqual
    | `String "REF_EQ" -> ReferenceEqual
    | `String "EQ" -> Equal
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperatorType" value)
    | _ -> raise (deserialize_wrong_type_error path "OperatorType")
     : operator_type)
    : operator_type)

let operator_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = option_of_yojson (value_for_key string_list_of_yojson "values") _list path;
     type_ = option_of_yojson (value_for_key operator_type_of_yojson "type") _list path;
   }
    : operator)

let selector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operator = option_of_yojson (value_for_key operator_of_yojson "operator") _list path;
     field_name = option_of_yojson (value_for_key string__of_yojson "fieldName") _list path;
   }
    : selector)

let selector_list_of_yojson tree path = list_of_yojson selector_of_yojson tree path

let report_task_runner_heartbeat_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ terminate = value_for_key boolean__of_yojson "terminate" _list path }
    : report_task_runner_heartbeat_output)

let report_task_runner_heartbeat_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hostname = option_of_yojson (value_for_key id_of_yojson "hostname") _list path;
     worker_group = option_of_yojson (value_for_key string__of_yojson "workerGroup") _list path;
     taskrunner_id = value_for_key id_of_yojson "taskrunnerId" _list path;
   }
    : report_task_runner_heartbeat_input)

let report_task_progress_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ canceled = value_for_key boolean__of_yojson "canceled" _list path }
    : report_task_progress_output)

let report_task_progress_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fields = option_of_yojson (value_for_key field_list_of_yojson "fields") _list path;
     task_id = value_for_key task_id_of_yojson "taskId" _list path;
   }
    : report_task_progress_input)

let remove_tags_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let remove_tags_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key string_list_of_yojson "tagKeys" _list path;
     pipeline_id = value_for_key id_of_yojson "pipelineId" _list path;
   }
    : remove_tags_input)

let query_objects_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     has_more_results =
       option_of_yojson (value_for_key boolean__of_yojson "hasMoreResults") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "marker") _list path;
     ids = option_of_yojson (value_for_key id_list_of_yojson "ids") _list path;
   }
    : query_objects_output)

let query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ selectors = option_of_yojson (value_for_key selector_list_of_yojson "selectors") _list path }
    : query)

let query_objects_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key int__of_yojson "limit") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "marker") _list path;
     sphere = value_for_key string__of_yojson "sphere" _list path;
     query = option_of_yojson (value_for_key query_of_yojson "query") _list path;
     pipeline_id = value_for_key id_of_yojson "pipelineId" _list path;
   }
    : query_objects_input)

let put_pipeline_definition_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errored = value_for_key boolean__of_yojson "errored" _list path;
     validation_warnings =
       option_of_yojson
         (value_for_key validation_warnings_of_yojson "validationWarnings")
         _list path;
     validation_errors =
       option_of_yojson (value_for_key validation_errors_of_yojson "validationErrors") _list path;
   }
    : put_pipeline_definition_output)

let put_pipeline_definition_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_values =
       option_of_yojson (value_for_key parameter_value_list_of_yojson "parameterValues") _list path;
     parameter_objects =
       option_of_yojson
         (value_for_key parameter_object_list_of_yojson "parameterObjects")
         _list path;
     pipeline_objects = value_for_key pipeline_object_list_of_yojson "pipelineObjects" _list path;
     pipeline_id = value_for_key id_of_yojson "pipelineId" _list path;
   }
    : put_pipeline_definition_input)

let poll_for_task_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_object = option_of_yojson (value_for_key task_object_of_yojson "taskObject") _list path }
    : poll_for_task_output)

let instance_identity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     signature = option_of_yojson (value_for_key string__of_yojson "signature") _list path;
     document = option_of_yojson (value_for_key string__of_yojson "document") _list path;
   }
    : instance_identity)

let poll_for_task_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_identity =
       option_of_yojson (value_for_key instance_identity_of_yojson "instanceIdentity") _list path;
     hostname = option_of_yojson (value_for_key id_of_yojson "hostname") _list path;
     worker_group = value_for_key string__of_yojson "workerGroup" _list path;
   }
    : poll_for_task_input)

let pipeline_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "description") _list path;
     fields = value_for_key field_list_of_yojson "fields" _list path;
     name = value_for_key id_of_yojson "name" _list path;
     pipeline_id = value_for_key id_of_yojson "pipelineId" _list path;
   }
    : pipeline_description)

let pipeline_description_list_of_yojson tree path =
  list_of_yojson pipeline_description_of_yojson tree path

let list_pipelines_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     has_more_results =
       option_of_yojson (value_for_key boolean__of_yojson "hasMoreResults") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "marker") _list path;
     pipeline_id_list = value_for_key pipeline_list_of_yojson "pipelineIdList" _list path;
   }
    : list_pipelines_output)

let list_pipelines_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ marker = option_of_yojson (value_for_key string__of_yojson "marker") _list path }
    : list_pipelines_input)

let get_pipeline_definition_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_values =
       option_of_yojson (value_for_key parameter_value_list_of_yojson "parameterValues") _list path;
     parameter_objects =
       option_of_yojson
         (value_for_key parameter_object_list_of_yojson "parameterObjects")
         _list path;
     pipeline_objects =
       option_of_yojson (value_for_key pipeline_object_list_of_yojson "pipelineObjects") _list path;
   }
    : get_pipeline_definition_output)

let get_pipeline_definition_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key string__of_yojson "version") _list path;
     pipeline_id = value_for_key id_of_yojson "pipelineId" _list path;
   }
    : get_pipeline_definition_input)

let evaluate_expression_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ evaluated_expression = value_for_key long_string_of_yojson "evaluatedExpression" _list path }
    : evaluate_expression_output)

let evaluate_expression_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expression = value_for_key long_string_of_yojson "expression" _list path;
     object_id = value_for_key id_of_yojson "objectId" _list path;
     pipeline_id = value_for_key id_of_yojson "pipelineId" _list path;
   }
    : evaluate_expression_input)

let describe_pipelines_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pipeline_description_list =
       value_for_key pipeline_description_list_of_yojson "pipelineDescriptionList" _list path;
   }
    : describe_pipelines_output)

let describe_pipelines_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pipeline_ids = value_for_key id_list_of_yojson "pipelineIds" _list path }
    : describe_pipelines_input)

let describe_objects_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     has_more_results =
       option_of_yojson (value_for_key boolean__of_yojson "hasMoreResults") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "marker") _list path;
     pipeline_objects = value_for_key pipeline_object_list_of_yojson "pipelineObjects" _list path;
   }
    : describe_objects_output)

let describe_objects_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "marker") _list path;
     evaluate_expressions =
       option_of_yojson (value_for_key boolean__of_yojson "evaluateExpressions") _list path;
     object_ids = value_for_key id_list_of_yojson "objectIds" _list path;
     pipeline_id = value_for_key id_of_yojson "pipelineId" _list path;
   }
    : describe_objects_input)

let delete_pipeline_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pipeline_id = value_for_key id_of_yojson "pipelineId" _list path } : delete_pipeline_input)

let deactivate_pipeline_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let deactivate_pipeline_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cancel_active =
       option_of_yojson (value_for_key cancel_active_of_yojson "cancelActive") _list path;
     pipeline_id = value_for_key id_of_yojson "pipelineId" _list path;
   }
    : deactivate_pipeline_input)

let create_pipeline_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pipeline_id = value_for_key id_of_yojson "pipelineId" _list path } : create_pipeline_output)

let create_pipeline_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "description") _list path;
     unique_id = value_for_key id_of_yojson "uniqueId" _list path;
     name = value_for_key id_of_yojson "name" _list path;
   }
    : create_pipeline_input)

let add_tags_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let add_tags_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "tags" _list path;
     pipeline_id = value_for_key id_of_yojson "pipelineId" _list path;
   }
    : add_tags_input)

let activate_pipeline_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let activate_pipeline_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "startTimestamp") _list path;
     parameter_values =
       option_of_yojson (value_for_key parameter_value_list_of_yojson "parameterValues") _list path;
     pipeline_id = value_for_key id_of_yojson "pipelineId" _list path;
   }
    : activate_pipeline_input)
