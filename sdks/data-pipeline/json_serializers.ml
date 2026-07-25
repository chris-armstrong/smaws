open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let pipeline_not_found_exception_to_yojson (x : pipeline_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let pipeline_deleted_exception_to_yojson (x : pipeline_deleted_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let internal_service_error_to_yojson (x : internal_service_error) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let activate_pipeline_output_to_yojson = unit_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let field_string_value_to_yojson = string_to_yojson
let field_name_string_to_yojson = string_to_yojson

let parameter_value_to_yojson (x : parameter_value) =
  assoc_to_yojson
    [
      ("id", Some (field_name_string_to_yojson x.id));
      ("stringValue", Some (field_string_value_to_yojson x.string_value));
    ]

let parameter_value_list_to_yojson tree = list_to_yojson parameter_value_to_yojson tree
let id_to_yojson = string_to_yojson

let activate_pipeline_input_to_yojson (x : activate_pipeline_input) =
  assoc_to_yojson
    [
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
      ("parameterValues", option_to_yojson parameter_value_list_to_yojson x.parameter_values);
      ("startTimestamp", option_to_yojson timestamp_to_yojson x.start_timestamp);
    ]

let add_tags_output_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("key", Some (tag_key_to_yojson x.key)); ("value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let add_tags_input_to_yojson (x : add_tags_input) =
  assoc_to_yojson
    [
      ("pipelineId", Some (id_to_yojson x.pipeline_id)); ("tags", Some (tag_list_to_yojson x.tags));
    ]

let create_pipeline_output_to_yojson (x : create_pipeline_output) =
  assoc_to_yojson [ ("pipelineId", Some (id_to_yojson x.pipeline_id)) ]

let string__to_yojson = string_to_yojson

let create_pipeline_input_to_yojson (x : create_pipeline_input) =
  assoc_to_yojson
    [
      ("name", Some (id_to_yojson x.name));
      ("uniqueId", Some (id_to_yojson x.unique_id));
      ("description", option_to_yojson string__to_yojson x.description);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let boolean__to_yojson = bool_to_yojson
let validation_message_to_yojson = string_to_yojson
let validation_messages_to_yojson tree = list_to_yojson validation_message_to_yojson tree

let validation_warning_to_yojson (x : validation_warning) =
  assoc_to_yojson
    [
      ("id", option_to_yojson id_to_yojson x.id);
      ("warnings", option_to_yojson validation_messages_to_yojson x.warnings);
    ]

let validation_warnings_to_yojson tree = list_to_yojson validation_warning_to_yojson tree

let validation_error_to_yojson (x : validation_error) =
  assoc_to_yojson
    [
      ("id", option_to_yojson id_to_yojson x.id);
      ("errors", option_to_yojson validation_messages_to_yojson x.errors);
    ]

let validation_errors_to_yojson tree = list_to_yojson validation_error_to_yojson tree

let validate_pipeline_definition_output_to_yojson (x : validate_pipeline_definition_output) =
  assoc_to_yojson
    [
      ("validationErrors", option_to_yojson validation_errors_to_yojson x.validation_errors);
      ("validationWarnings", option_to_yojson validation_warnings_to_yojson x.validation_warnings);
      ("errored", Some (boolean__to_yojson x.errored));
    ]

let attribute_value_string_to_yojson = string_to_yojson
let attribute_name_string_to_yojson = string_to_yojson

let parameter_attribute_to_yojson (x : parameter_attribute) =
  assoc_to_yojson
    [
      ("key", Some (attribute_name_string_to_yojson x.key));
      ("stringValue", Some (attribute_value_string_to_yojson x.string_value));
    ]

let parameter_attribute_list_to_yojson tree = list_to_yojson parameter_attribute_to_yojson tree

let parameter_object_to_yojson (x : parameter_object) =
  assoc_to_yojson
    [
      ("id", Some (field_name_string_to_yojson x.id));
      ("attributes", Some (parameter_attribute_list_to_yojson x.attributes));
    ]

let parameter_object_list_to_yojson tree = list_to_yojson parameter_object_to_yojson tree

let field_to_yojson (x : field) =
  assoc_to_yojson
    [
      ("key", Some (field_name_string_to_yojson x.key));
      ("stringValue", option_to_yojson field_string_value_to_yojson x.string_value);
      ("refValue", option_to_yojson field_name_string_to_yojson x.ref_value);
    ]

let field_list_to_yojson tree = list_to_yojson field_to_yojson tree

let pipeline_object_to_yojson (x : pipeline_object) =
  assoc_to_yojson
    [
      ("id", Some (id_to_yojson x.id));
      ("name", Some (id_to_yojson x.name));
      ("fields", Some (field_list_to_yojson x.fields));
    ]

let pipeline_object_list_to_yojson tree = list_to_yojson pipeline_object_to_yojson tree

let validate_pipeline_definition_input_to_yojson (x : validate_pipeline_definition_input) =
  assoc_to_yojson
    [
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
      ("pipelineObjects", Some (pipeline_object_list_to_yojson x.pipeline_objects));
      ("parameterObjects", option_to_yojson parameter_object_list_to_yojson x.parameter_objects);
      ("parameterValues", option_to_yojson parameter_value_list_to_yojson x.parameter_values);
    ]

let task_not_found_exception_to_yojson (x : task_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let set_task_status_output_to_yojson = unit_to_yojson

let task_status_to_yojson (x : task_status) =
  match x with
  | FINISHED -> `String "FINISHED"
  | FAILED -> `String "FAILED"
  | FALSE -> `String "FALSE"

let task_id_to_yojson = string_to_yojson

let set_task_status_input_to_yojson (x : set_task_status_input) =
  assoc_to_yojson
    [
      ("taskId", Some (task_id_to_yojson x.task_id));
      ("taskStatus", Some (task_status_to_yojson x.task_status));
      ("errorId", option_to_yojson string__to_yojson x.error_id);
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("errorStackTrace", option_to_yojson string__to_yojson x.error_stack_trace);
    ]

let id_list_to_yojson tree = list_to_yojson id_to_yojson tree

let set_status_input_to_yojson (x : set_status_input) =
  assoc_to_yojson
    [
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
      ("objectIds", Some (id_list_to_yojson x.object_ids));
      ("status", Some (string__to_yojson x.status));
    ]

let report_task_runner_heartbeat_output_to_yojson (x : report_task_runner_heartbeat_output) =
  assoc_to_yojson [ ("terminate", Some (boolean__to_yojson x.terminate)) ]

let report_task_runner_heartbeat_input_to_yojson (x : report_task_runner_heartbeat_input) =
  assoc_to_yojson
    [
      ("taskrunnerId", Some (id_to_yojson x.taskrunner_id));
      ("workerGroup", option_to_yojson string__to_yojson x.worker_group);
      ("hostname", option_to_yojson id_to_yojson x.hostname);
    ]

let report_task_progress_output_to_yojson (x : report_task_progress_output) =
  assoc_to_yojson [ ("canceled", Some (boolean__to_yojson x.canceled)) ]

let report_task_progress_input_to_yojson (x : report_task_progress_input) =
  assoc_to_yojson
    [
      ("taskId", Some (task_id_to_yojson x.task_id));
      ("fields", option_to_yojson field_list_to_yojson x.fields);
    ]

let remove_tags_output_to_yojson = unit_to_yojson
let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let remove_tags_input_to_yojson (x : remove_tags_input) =
  assoc_to_yojson
    [
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
      ("tagKeys", Some (string_list_to_yojson x.tag_keys));
    ]

let query_objects_output_to_yojson (x : query_objects_output) =
  assoc_to_yojson
    [
      ("ids", option_to_yojson id_list_to_yojson x.ids);
      ("marker", option_to_yojson string__to_yojson x.marker);
      ("hasMoreResults", option_to_yojson boolean__to_yojson x.has_more_results);
    ]

let int__to_yojson = int_to_yojson

let operator_type_to_yojson (x : operator_type) =
  match x with
  | Equal -> `String "EQ"
  | ReferenceEqual -> `String "REF_EQ"
  | LessThanOrEqual -> `String "LE"
  | GreaterThanOrEqual -> `String "GE"
  | Between -> `String "BETWEEN"

let operator_to_yojson (x : operator) =
  assoc_to_yojson
    [
      ("type", option_to_yojson operator_type_to_yojson x.type_);
      ("values", option_to_yojson string_list_to_yojson x.values);
    ]

let selector_to_yojson (x : selector) =
  assoc_to_yojson
    [
      ("fieldName", option_to_yojson string__to_yojson x.field_name);
      ("operator", option_to_yojson operator_to_yojson x.operator);
    ]

let selector_list_to_yojson tree = list_to_yojson selector_to_yojson tree

let query_to_yojson (x : query) =
  assoc_to_yojson [ ("selectors", option_to_yojson selector_list_to_yojson x.selectors) ]

let query_objects_input_to_yojson (x : query_objects_input) =
  assoc_to_yojson
    [
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
      ("query", option_to_yojson query_to_yojson x.query);
      ("sphere", Some (string__to_yojson x.sphere));
      ("marker", option_to_yojson string__to_yojson x.marker);
      ("limit", option_to_yojson int__to_yojson x.limit);
    ]

let put_pipeline_definition_output_to_yojson (x : put_pipeline_definition_output) =
  assoc_to_yojson
    [
      ("validationErrors", option_to_yojson validation_errors_to_yojson x.validation_errors);
      ("validationWarnings", option_to_yojson validation_warnings_to_yojson x.validation_warnings);
      ("errored", Some (boolean__to_yojson x.errored));
    ]

let put_pipeline_definition_input_to_yojson (x : put_pipeline_definition_input) =
  assoc_to_yojson
    [
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
      ("pipelineObjects", Some (pipeline_object_list_to_yojson x.pipeline_objects));
      ("parameterObjects", option_to_yojson parameter_object_list_to_yojson x.parameter_objects);
      ("parameterValues", option_to_yojson parameter_value_list_to_yojson x.parameter_values);
    ]

let pipeline_object_map_to_yojson tree = map_to_yojson id_to_yojson pipeline_object_to_yojson tree

let task_object_to_yojson (x : task_object) =
  assoc_to_yojson
    [
      ("taskId", option_to_yojson task_id_to_yojson x.task_id);
      ("pipelineId", option_to_yojson id_to_yojson x.pipeline_id);
      ("attemptId", option_to_yojson id_to_yojson x.attempt_id);
      ("objects", option_to_yojson pipeline_object_map_to_yojson x.objects);
    ]

let poll_for_task_output_to_yojson (x : poll_for_task_output) =
  assoc_to_yojson [ ("taskObject", option_to_yojson task_object_to_yojson x.task_object) ]

let instance_identity_to_yojson (x : instance_identity) =
  assoc_to_yojson
    [
      ("document", option_to_yojson string__to_yojson x.document);
      ("signature", option_to_yojson string__to_yojson x.signature);
    ]

let poll_for_task_input_to_yojson (x : poll_for_task_input) =
  assoc_to_yojson
    [
      ("workerGroup", Some (string__to_yojson x.worker_group));
      ("hostname", option_to_yojson id_to_yojson x.hostname);
      ("instanceIdentity", option_to_yojson instance_identity_to_yojson x.instance_identity);
    ]

let pipeline_id_name_to_yojson (x : pipeline_id_name) =
  assoc_to_yojson
    [ ("id", option_to_yojson id_to_yojson x.id); ("name", option_to_yojson id_to_yojson x.name) ]

let pipeline_list_to_yojson tree = list_to_yojson pipeline_id_name_to_yojson tree

let list_pipelines_output_to_yojson (x : list_pipelines_output) =
  assoc_to_yojson
    [
      ("pipelineIdList", Some (pipeline_list_to_yojson x.pipeline_id_list));
      ("marker", option_to_yojson string__to_yojson x.marker);
      ("hasMoreResults", option_to_yojson boolean__to_yojson x.has_more_results);
    ]

let list_pipelines_input_to_yojson (x : list_pipelines_input) =
  assoc_to_yojson [ ("marker", option_to_yojson string__to_yojson x.marker) ]

let get_pipeline_definition_output_to_yojson (x : get_pipeline_definition_output) =
  assoc_to_yojson
    [
      ("pipelineObjects", option_to_yojson pipeline_object_list_to_yojson x.pipeline_objects);
      ("parameterObjects", option_to_yojson parameter_object_list_to_yojson x.parameter_objects);
      ("parameterValues", option_to_yojson parameter_value_list_to_yojson x.parameter_values);
    ]

let get_pipeline_definition_input_to_yojson (x : get_pipeline_definition_input) =
  assoc_to_yojson
    [
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
      ("version", option_to_yojson string__to_yojson x.version);
    ]

let long_string_to_yojson = string_to_yojson

let evaluate_expression_output_to_yojson (x : evaluate_expression_output) =
  assoc_to_yojson [ ("evaluatedExpression", Some (long_string_to_yojson x.evaluated_expression)) ]

let evaluate_expression_input_to_yojson (x : evaluate_expression_input) =
  assoc_to_yojson
    [
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
      ("objectId", Some (id_to_yojson x.object_id));
      ("expression", Some (long_string_to_yojson x.expression));
    ]

let pipeline_description_to_yojson (x : pipeline_description) =
  assoc_to_yojson
    [
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
      ("name", Some (id_to_yojson x.name));
      ("fields", Some (field_list_to_yojson x.fields));
      ("description", option_to_yojson string__to_yojson x.description);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let pipeline_description_list_to_yojson tree = list_to_yojson pipeline_description_to_yojson tree

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
      ("pipelineObjects", Some (pipeline_object_list_to_yojson x.pipeline_objects));
      ("marker", option_to_yojson string__to_yojson x.marker);
      ("hasMoreResults", option_to_yojson boolean__to_yojson x.has_more_results);
    ]

let describe_objects_input_to_yojson (x : describe_objects_input) =
  assoc_to_yojson
    [
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
      ("objectIds", Some (id_list_to_yojson x.object_ids));
      ("evaluateExpressions", option_to_yojson boolean__to_yojson x.evaluate_expressions);
      ("marker", option_to_yojson string__to_yojson x.marker);
    ]

let delete_pipeline_input_to_yojson (x : delete_pipeline_input) =
  assoc_to_yojson [ ("pipelineId", Some (id_to_yojson x.pipeline_id)) ]

let deactivate_pipeline_output_to_yojson = unit_to_yojson
let cancel_active_to_yojson = bool_to_yojson

let deactivate_pipeline_input_to_yojson (x : deactivate_pipeline_input) =
  assoc_to_yojson
    [
      ("pipelineId", Some (id_to_yojson x.pipeline_id));
      ("cancelActive", option_to_yojson cancel_active_to_yojson x.cancel_active);
    ]
