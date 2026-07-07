open Smaws_Lib.Json.SerializeHelpers
open Types

let validation_message_to_yojson = string_to_yojson
let validation_messages_to_yojson tree = list_to_yojson validation_message_to_yojson tree
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let task_id_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("value", Some (tag_value_to_yojson x.value)); ("key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let string__to_yojson = string_to_yojson
let string_list_to_yojson tree = list_to_yojson string__to_yojson tree
let id_to_yojson = string_to_yojson

let pipeline_id_name_to_yojson (x : pipeline_id_name) =
  assoc_to_yojson
    [ ("name", option_to_yojson id_to_yojson x.name); ("id", option_to_yojson id_to_yojson x.id) ]

let pipeline_list_to_yojson tree = list_to_yojson pipeline_id_name_to_yojson tree
let long_string_to_yojson = string_to_yojson
let int__to_yojson = int_to_yojson
let id_list_to_yojson tree = list_to_yojson id_to_yojson tree
let field_string_value_to_yojson = string_to_yojson
let field_name_string_to_yojson = string_to_yojson

let field_to_yojson (x : field) =
  assoc_to_yojson
    [
      ("refValue", option_to_yojson field_name_string_to_yojson x.ref_value);
      ("stringValue", option_to_yojson field_string_value_to_yojson x.string_value);
      ("key", Some (field_name_string_to_yojson x.key));
    ]

let field_list_to_yojson tree = list_to_yojson field_to_yojson tree
let error_message_to_yojson = string_to_yojson
let cancel_active_to_yojson = bool_to_yojson
let boolean__to_yojson = bool_to_yojson
let attribute_value_string_to_yojson = string_to_yojson
let attribute_name_string_to_yojson = string_to_yojson

let validation_warning_to_yojson (x : validation_warning) =
  assoc_to_yojson
    [
      ("warnings", option_to_yojson validation_messages_to_yojson x.warnings);
      ("id", option_to_yojson id_to_yojson x.id);
    ]

let validation_warnings_to_yojson tree = list_to_yojson validation_warning_to_yojson tree

let validation_error_to_yojson (x : validation_error) =
  assoc_to_yojson
    [
      ("errors", option_to_yojson validation_messages_to_yojson x.errors);
      ("id", option_to_yojson id_to_yojson x.id);
    ]

let validation_errors_to_yojson tree = list_to_yojson validation_error_to_yojson tree

let validate_pipeline_definition_output_to_yojson (x : validate_pipeline_definition_output) =
  assoc_to_yojson
    [
      ("errored", Some (boolean__to_yojson x.errored));
      ("validationWarnings", option_to_yojson validation_warnings_to_yojson x.validation_warnings);
      ("validationErrors", option_to_yojson validation_errors_to_yojson x.validation_errors);
    ]

let pipeline_object_to_yojson (x : pipeline_object) =
  assoc_to_yojson
    [
      ("fields", Some (field_list_to_yojson x.fields));
      ("name", Some (id_to_yojson x.name));
      ("id", Some (id_to_yojson x.id));
    ]

let pipeline_object_list_to_yojson tree = list_to_yojson pipeline_object_to_yojson tree

let parameter_attribute_to_yojson (x : parameter_attribute) =
  assoc_to_yojson
    [
      ("stringValue", Some (attribute_value_string_to_yojson x.string_value));
      ("key", Some (attribute_name_string_to_yojson x.key));
    ]

let parameter_attribute_list_to_yojson tree = list_to_yojson parameter_attribute_to_yojson tree

let parameter_object_to_yojson (x : parameter_object) =
  assoc_to_yojson
    [
      ("attributes", Some (parameter_attribute_list_to_yojson x.attributes));
      ("id", Some (field_name_string_to_yojson x.id));
    ]

let parameter_object_list_to_yojson tree = list_to_yojson parameter_object_to_yojson tree

let parameter_value_to_yojson (x : parameter_value) =
  assoc_to_yojson
    [
      ("stringValue", Some (field_string_value_to_yojson x.string_value));
      ("id", Some (field_name_string_to_yojson x.id));
    ]

let parameter_value_list_to_yojson tree = list_to_yojson parameter_value_to_yojson tree

let validate_pipeline_definition_input_to_yojson (x : validate_pipeline_definition_input) =
  assoc_to_yojson
    [
      ("parameterValues", option_to_yojson parameter_value_list_to_yojson x.parameter_values);
      ("parameterObjects", option_to_yojson parameter_object_list_to_yojson x.parameter_objects);
      ("pipelineObjects", Some (pipeline_object_list_to_yojson x.pipeline_objects));
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
    ]

let pipeline_not_found_exception_to_yojson (x : pipeline_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let pipeline_deleted_exception_to_yojson (x : pipeline_deleted_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let internal_service_error_to_yojson (x : internal_service_error) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let task_status_to_yojson (x : task_status) =
  match x with
  | FALSE -> `String "FALSE"
  | FAILED -> `String "FAILED"
  | FINISHED -> `String "FINISHED"

let pipeline_object_map_to_yojson tree = map_to_yojson id_to_yojson pipeline_object_to_yojson tree

let task_object_to_yojson (x : task_object) =
  assoc_to_yojson
    [
      ("objects", option_to_yojson pipeline_object_map_to_yojson x.objects);
      ("attemptId", option_to_yojson id_to_yojson x.attempt_id);
      ("pipelineId", option_to_yojson id_to_yojson x.pipeline_id);
      ("taskId", option_to_yojson task_id_to_yojson x.task_id);
    ]

let task_not_found_exception_to_yojson (x : task_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let set_task_status_output_to_yojson = unit_to_yojson

let set_task_status_input_to_yojson (x : set_task_status_input) =
  assoc_to_yojson
    [
      ("errorStackTrace", option_to_yojson string__to_yojson x.error_stack_trace);
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("errorId", option_to_yojson string__to_yojson x.error_id);
      ("taskStatus", Some (task_status_to_yojson x.task_status));
      ("taskId", Some (task_id_to_yojson x.task_id));
    ]

let set_status_input_to_yojson (x : set_status_input) =
  assoc_to_yojson
    [
      ("status", Some (string__to_yojson x.status));
      ("objectIds", Some (id_list_to_yojson x.object_ids));
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
    ]

let operator_type_to_yojson (x : operator_type) =
  match x with
  | Between -> `String "BETWEEN"
  | GreaterThanOrEqual -> `String "GE"
  | LessThanOrEqual -> `String "LE"
  | ReferenceEqual -> `String "REF_EQ"
  | Equal -> `String "EQ"

let operator_to_yojson (x : operator) =
  assoc_to_yojson
    [
      ("values", option_to_yojson string_list_to_yojson x.values);
      ("type", option_to_yojson operator_type_to_yojson x.type_);
    ]

let selector_to_yojson (x : selector) =
  assoc_to_yojson
    [
      ("operator", option_to_yojson operator_to_yojson x.operator);
      ("fieldName", option_to_yojson string__to_yojson x.field_name);
    ]

let selector_list_to_yojson tree = list_to_yojson selector_to_yojson tree

let report_task_runner_heartbeat_output_to_yojson (x : report_task_runner_heartbeat_output) =
  assoc_to_yojson [ ("terminate", Some (boolean__to_yojson x.terminate)) ]

let report_task_runner_heartbeat_input_to_yojson (x : report_task_runner_heartbeat_input) =
  assoc_to_yojson
    [
      ("hostname", option_to_yojson id_to_yojson x.hostname);
      ("workerGroup", option_to_yojson string__to_yojson x.worker_group);
      ("taskrunnerId", Some (id_to_yojson x.taskrunner_id));
    ]

let report_task_progress_output_to_yojson (x : report_task_progress_output) =
  assoc_to_yojson [ ("canceled", Some (boolean__to_yojson x.canceled)) ]

let report_task_progress_input_to_yojson (x : report_task_progress_input) =
  assoc_to_yojson
    [
      ("fields", option_to_yojson field_list_to_yojson x.fields);
      ("taskId", Some (task_id_to_yojson x.task_id));
    ]

let remove_tags_output_to_yojson = unit_to_yojson

let remove_tags_input_to_yojson (x : remove_tags_input) =
  assoc_to_yojson
    [
      ("tagKeys", Some (string_list_to_yojson x.tag_keys));
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
    ]

let query_objects_output_to_yojson (x : query_objects_output) =
  assoc_to_yojson
    [
      ("hasMoreResults", option_to_yojson boolean__to_yojson x.has_more_results);
      ("marker", option_to_yojson string__to_yojson x.marker);
      ("ids", option_to_yojson id_list_to_yojson x.ids);
    ]

let query_to_yojson (x : query) =
  assoc_to_yojson [ ("selectors", option_to_yojson selector_list_to_yojson x.selectors) ]

let query_objects_input_to_yojson (x : query_objects_input) =
  assoc_to_yojson
    [
      ("limit", option_to_yojson int__to_yojson x.limit);
      ("marker", option_to_yojson string__to_yojson x.marker);
      ("sphere", Some (string__to_yojson x.sphere));
      ("query", option_to_yojson query_to_yojson x.query);
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
    ]

let put_pipeline_definition_output_to_yojson (x : put_pipeline_definition_output) =
  assoc_to_yojson
    [
      ("errored", Some (boolean__to_yojson x.errored));
      ("validationWarnings", option_to_yojson validation_warnings_to_yojson x.validation_warnings);
      ("validationErrors", option_to_yojson validation_errors_to_yojson x.validation_errors);
    ]

let put_pipeline_definition_input_to_yojson (x : put_pipeline_definition_input) =
  assoc_to_yojson
    [
      ("parameterValues", option_to_yojson parameter_value_list_to_yojson x.parameter_values);
      ("parameterObjects", option_to_yojson parameter_object_list_to_yojson x.parameter_objects);
      ("pipelineObjects", Some (pipeline_object_list_to_yojson x.pipeline_objects));
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
    ]

let poll_for_task_output_to_yojson (x : poll_for_task_output) =
  assoc_to_yojson [ ("taskObject", option_to_yojson task_object_to_yojson x.task_object) ]

let instance_identity_to_yojson (x : instance_identity) =
  assoc_to_yojson
    [
      ("signature", option_to_yojson string__to_yojson x.signature);
      ("document", option_to_yojson string__to_yojson x.document);
    ]

let poll_for_task_input_to_yojson (x : poll_for_task_input) =
  assoc_to_yojson
    [
      ("instanceIdentity", option_to_yojson instance_identity_to_yojson x.instance_identity);
      ("hostname", option_to_yojson id_to_yojson x.hostname);
      ("workerGroup", Some (string__to_yojson x.worker_group));
    ]

let pipeline_description_to_yojson (x : pipeline_description) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("description", option_to_yojson string__to_yojson x.description);
      ("fields", Some (field_list_to_yojson x.fields));
      ("name", Some (id_to_yojson x.name));
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
    ]

let pipeline_description_list_to_yojson tree = list_to_yojson pipeline_description_to_yojson tree

let list_pipelines_output_to_yojson (x : list_pipelines_output) =
  assoc_to_yojson
    [
      ("hasMoreResults", option_to_yojson boolean__to_yojson x.has_more_results);
      ("marker", option_to_yojson string__to_yojson x.marker);
      ("pipelineIdList", Some (pipeline_list_to_yojson x.pipeline_id_list));
    ]

let list_pipelines_input_to_yojson (x : list_pipelines_input) =
  assoc_to_yojson [ ("marker", option_to_yojson string__to_yojson x.marker) ]

let get_pipeline_definition_output_to_yojson (x : get_pipeline_definition_output) =
  assoc_to_yojson
    [
      ("parameterValues", option_to_yojson parameter_value_list_to_yojson x.parameter_values);
      ("parameterObjects", option_to_yojson parameter_object_list_to_yojson x.parameter_objects);
      ("pipelineObjects", option_to_yojson pipeline_object_list_to_yojson x.pipeline_objects);
    ]

let get_pipeline_definition_input_to_yojson (x : get_pipeline_definition_input) =
  assoc_to_yojson
    [
      ("version", option_to_yojson string__to_yojson x.version);
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
    ]

let evaluate_expression_output_to_yojson (x : evaluate_expression_output) =
  assoc_to_yojson [ ("evaluatedExpression", Some (long_string_to_yojson x.evaluated_expression)) ]

let evaluate_expression_input_to_yojson (x : evaluate_expression_input) =
  assoc_to_yojson
    [
      ("expression", Some (long_string_to_yojson x.expression));
      ("objectId", Some (id_to_yojson x.object_id));
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
    ]

let describe_pipelines_output_to_yojson (x : describe_pipelines_output) =
  assoc_to_yojson
    [
      ( "pipelineDescriptionList",
        Some (pipeline_description_list_to_yojson x.pipeline_description_list) );
    ]

let describe_pipelines_input_to_yojson (x : describe_pipelines_input) =
  assoc_to_yojson [ ("pipelineIds", Some (id_list_to_yojson x.pipeline_ids)) ]

let describe_objects_output_to_yojson (x : describe_objects_output) =
  assoc_to_yojson
    [
      ("hasMoreResults", option_to_yojson boolean__to_yojson x.has_more_results);
      ("marker", option_to_yojson string__to_yojson x.marker);
      ("pipelineObjects", Some (pipeline_object_list_to_yojson x.pipeline_objects));
    ]

let describe_objects_input_to_yojson (x : describe_objects_input) =
  assoc_to_yojson
    [
      ("marker", option_to_yojson string__to_yojson x.marker);
      ("evaluateExpressions", option_to_yojson boolean__to_yojson x.evaluate_expressions);
      ("objectIds", Some (id_list_to_yojson x.object_ids));
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
    ]

let delete_pipeline_input_to_yojson (x : delete_pipeline_input) =
  assoc_to_yojson [ ("pipelineId", Some (id_to_yojson x.pipeline_id)) ]

let deactivate_pipeline_output_to_yojson = unit_to_yojson

let deactivate_pipeline_input_to_yojson (x : deactivate_pipeline_input) =
  assoc_to_yojson
    [
      ("cancelActive", option_to_yojson cancel_active_to_yojson x.cancel_active);
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
    ]

let create_pipeline_output_to_yojson (x : create_pipeline_output) =
  assoc_to_yojson [ ("pipelineId", Some (id_to_yojson x.pipeline_id)) ]

let create_pipeline_input_to_yojson (x : create_pipeline_input) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("description", option_to_yojson string__to_yojson x.description);
      ("uniqueId", Some (id_to_yojson x.unique_id));
      ("name", Some (id_to_yojson x.name));
    ]

let add_tags_output_to_yojson = unit_to_yojson

let add_tags_input_to_yojson (x : add_tags_input) =
  assoc_to_yojson
    [
      ("tags", Some (tag_list_to_yojson x.tags)); ("pipelineId", Some (id_to_yojson x.pipeline_id));
    ]

let activate_pipeline_output_to_yojson = unit_to_yojson

let activate_pipeline_input_to_yojson (x : activate_pipeline_input) =
  assoc_to_yojson
    [
      ("startTimestamp", option_to_yojson timestamp_to_yojson x.start_timestamp);
      ("parameterValues", option_to_yojson parameter_value_list_to_yojson x.parameter_values);
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
    ]
