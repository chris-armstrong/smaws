open Smaws_Lib.Json.SerializeHelpers
open Types

let version_to_yojson = long_to_yojson
let urn_to_yojson = string_to_yojson
let urns_to_yojson tree = list_to_yojson urn_to_yojson tree

let upload_status_to_yojson (x : upload_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let upload_id_to_yojson = string_to_yojson

let upload_entity_definitions_response_to_yojson (x : upload_entity_definitions_response) =
  assoc_to_yojson [ ("uploadId", Some (upload_id_to_yojson x.upload_id)) ]

let definition_language_to_yojson (x : definition_language) =
  match x with GRAPHQL -> `String "GRAPHQL"

let definition_text_to_yojson = string_to_yojson

let definition_document_to_yojson (x : definition_document) =
  assoc_to_yojson
    [
      ("text", Some (definition_text_to_yojson x.text));
      ("language", Some (definition_language_to_yojson x.language));
    ]

let sync_with_public_namespace_to_yojson = bool_to_yojson
let deprecate_existing_entities_to_yojson = bool_to_yojson

let upload_entity_definitions_request_to_yojson (x : upload_entity_definitions_request) =
  assoc_to_yojson
    [
      ( "deprecateExistingEntities",
        option_to_yojson deprecate_existing_entities_to_yojson x.deprecate_existing_entities );
      ( "syncWithPublicNamespace",
        option_to_yojson sync_with_public_namespace_to_yojson x.sync_with_public_namespace );
      ("document", option_to_yojson definition_document_to_yojson x.document);
    ]

let error_message_to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let internal_failure_exception_to_yojson (x : internal_failure_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let arn_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let system_template_summary_to_yojson (x : system_template_summary) =
  assoc_to_yojson
    [
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("revisionNumber", option_to_yojson version_to_yojson x.revision_number);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson urn_to_yojson x.id);
    ]

let update_system_template_response_to_yojson (x : update_system_template_response) =
  assoc_to_yojson [ ("summary", option_to_yojson system_template_summary_to_yojson x.summary) ]

let update_system_template_request_to_yojson (x : update_system_template_request) =
  assoc_to_yojson
    [
      ( "compatibleNamespaceVersion",
        option_to_yojson version_to_yojson x.compatible_namespace_version );
      ("definition", Some (definition_document_to_yojson x.definition));
      ("id", Some (urn_to_yojson x.id));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let flow_template_summary_to_yojson (x : flow_template_summary) =
  assoc_to_yojson
    [
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("revisionNumber", option_to_yojson version_to_yojson x.revision_number);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson urn_to_yojson x.id);
    ]

let update_flow_template_response_to_yojson (x : update_flow_template_response) =
  assoc_to_yojson [ ("summary", option_to_yojson flow_template_summary_to_yojson x.summary) ]

let update_flow_template_request_to_yojson (x : update_flow_template_request) =
  assoc_to_yojson
    [
      ( "compatibleNamespaceVersion",
        option_to_yojson version_to_yojson x.compatible_namespace_version );
      ("definition", Some (definition_document_to_yojson x.definition));
      ("id", Some (urn_to_yojson x.id));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let resource_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let system_instance_deployment_status_to_yojson (x : system_instance_deployment_status) =
  match x with
  | DELETED_IN_TARGET -> `String "DELETED_IN_TARGET"
  | PENDING_DELETE -> `String "PENDING_DELETE"
  | FAILED -> `String "FAILED"
  | UNDEPLOY_IN_PROGRESS -> `String "UNDEPLOY_IN_PROGRESS"
  | DEPLOYED_IN_TARGET -> `String "DEPLOYED_IN_TARGET"
  | DEPLOY_IN_PROGRESS -> `String "DEPLOY_IN_PROGRESS"
  | BOOTSTRAP -> `String "BOOTSTRAP"
  | NOT_DEPLOYED -> `String "NOT_DEPLOYED"

let deployment_target_to_yojson (x : deployment_target) =
  match x with CLOUD -> `String "CLOUD" | GREENGRASS -> `String "GREENGRASS"

let group_name_to_yojson = string_to_yojson
let greengrass_group_id_to_yojson = string_to_yojson
let greengrass_group_version_id_to_yojson = string_to_yojson

let system_instance_summary_to_yojson (x : system_instance_summary) =
  assoc_to_yojson
    [
      ( "greengrassGroupVersionId",
        option_to_yojson greengrass_group_version_id_to_yojson x.greengrass_group_version_id );
      ("greengrassGroupId", option_to_yojson greengrass_group_id_to_yojson x.greengrass_group_id);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("greengrassGroupName", option_to_yojson group_name_to_yojson x.greengrass_group_name);
      ("target", option_to_yojson deployment_target_to_yojson x.target);
      ("status", option_to_yojson system_instance_deployment_status_to_yojson x.status);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson urn_to_yojson x.id);
    ]

let undeploy_system_instance_response_to_yojson (x : undeploy_system_instance_response) =
  assoc_to_yojson [ ("summary", option_to_yojson system_instance_summary_to_yojson x.summary) ]

let undeploy_system_instance_request_to_yojson (x : undeploy_system_instance_request) =
  assoc_to_yojson [ ("id", option_to_yojson urn_to_yojson x.id) ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let thing_arn_to_yojson = string_to_yojson
let thing_name_to_yojson = string_to_yojson

let thing_to_yojson (x : thing) =
  assoc_to_yojson
    [
      ("thingName", option_to_yojson thing_name_to_yojson x.thing_name);
      ("thingArn", option_to_yojson thing_arn_to_yojson x.thing_arn);
    ]

let things_to_yojson tree = list_to_yojson thing_to_yojson tree
let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("value", Some (tag_value_to_yojson x.value)); ("key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (tag_list_to_yojson x.tags));
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let system_template_summaries_to_yojson tree = list_to_yojson system_template_summary_to_yojson tree

let system_template_filter_name_to_yojson (x : system_template_filter_name) =
  match x with FLOW_TEMPLATE_ID -> `String "FLOW_TEMPLATE_ID"

let system_template_filter_value_to_yojson = string_to_yojson

let system_template_filter_values_to_yojson tree =
  list_to_yojson system_template_filter_value_to_yojson tree

let system_template_filter_to_yojson (x : system_template_filter) =
  assoc_to_yojson
    [
      ("value", Some (system_template_filter_values_to_yojson x.value));
      ("name", Some (system_template_filter_name_to_yojson x.name));
    ]

let system_template_filters_to_yojson tree = list_to_yojson system_template_filter_to_yojson tree

let system_template_description_to_yojson (x : system_template_description) =
  assoc_to_yojson
    [
      ("validatedNamespaceVersion", option_to_yojson version_to_yojson x.validated_namespace_version);
      ("definition", option_to_yojson definition_document_to_yojson x.definition);
      ("summary", option_to_yojson system_template_summary_to_yojson x.summary);
    ]

let system_instance_summaries_to_yojson tree = list_to_yojson system_instance_summary_to_yojson tree

let system_instance_filter_name_to_yojson (x : system_instance_filter_name) =
  match x with
  | GREENGRASS_GROUP_NAME -> `String "GREENGRASS_GROUP_NAME"
  | STATUS -> `String "STATUS"
  | SYSTEM_TEMPLATE_ID -> `String "SYSTEM_TEMPLATE_ID"

let system_instance_filter_value_to_yojson = string_to_yojson

let system_instance_filter_values_to_yojson tree =
  list_to_yojson system_instance_filter_value_to_yojson tree

let system_instance_filter_to_yojson (x : system_instance_filter) =
  assoc_to_yojson
    [
      ("value", option_to_yojson system_instance_filter_values_to_yojson x.value);
      ("name", option_to_yojson system_instance_filter_name_to_yojson x.name);
    ]

let system_instance_filters_to_yojson tree = list_to_yojson system_instance_filter_to_yojson tree
let s3_bucket_name_to_yojson = string_to_yojson
let enabled_to_yojson = bool_to_yojson
let role_arn_to_yojson = string_to_yojson

let metrics_configuration_to_yojson (x : metrics_configuration) =
  assoc_to_yojson
    [
      ("metricRuleRoleArn", option_to_yojson role_arn_to_yojson x.metric_rule_role_arn);
      ("cloudMetricEnabled", option_to_yojson enabled_to_yojson x.cloud_metric_enabled);
    ]

let dependency_revision_to_yojson (x : dependency_revision) =
  assoc_to_yojson
    [
      ("revisionNumber", option_to_yojson version_to_yojson x.revision_number);
      ("id", option_to_yojson urn_to_yojson x.id);
    ]

let dependency_revisions_to_yojson tree = list_to_yojson dependency_revision_to_yojson tree

let system_instance_description_to_yojson (x : system_instance_description) =
  assoc_to_yojson
    [
      ("flowActionsRoleArn", option_to_yojson role_arn_to_yojson x.flow_actions_role_arn);
      ( "validatedDependencyRevisions",
        option_to_yojson dependency_revisions_to_yojson x.validated_dependency_revisions );
      ("validatedNamespaceVersion", option_to_yojson version_to_yojson x.validated_namespace_version);
      ( "metricsConfiguration",
        option_to_yojson metrics_configuration_to_yojson x.metrics_configuration );
      ("s3BucketName", option_to_yojson s3_bucket_name_to_yojson x.s3_bucket_name);
      ("definition", option_to_yojson definition_document_to_yojson x.definition);
      ("summary", option_to_yojson system_instance_summary_to_yojson x.summary);
    ]

let string__to_yojson = string_to_yojson
let string_list_to_yojson tree = list_to_yojson string__to_yojson tree
let next_token_to_yojson = string_to_yojson

let search_things_response_to_yojson (x : search_things_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("things", option_to_yojson things_to_yojson x.things);
    ]

let max_results_to_yojson = int_to_yojson

let search_things_request_to_yojson (x : search_things_request) =
  assoc_to_yojson
    [
      ("namespaceVersion", option_to_yojson version_to_yojson x.namespace_version);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("entityId", Some (urn_to_yojson x.entity_id));
    ]

let search_system_templates_response_to_yojson (x : search_system_templates_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("summaries", option_to_yojson system_template_summaries_to_yojson x.summaries);
    ]

let search_system_templates_request_to_yojson (x : search_system_templates_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("filters", option_to_yojson system_template_filters_to_yojson x.filters);
    ]

let search_system_instances_response_to_yojson (x : search_system_instances_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("summaries", option_to_yojson system_instance_summaries_to_yojson x.summaries);
    ]

let search_system_instances_request_to_yojson (x : search_system_instances_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("filters", option_to_yojson system_instance_filters_to_yojson x.filters);
    ]

let flow_template_summaries_to_yojson tree = list_to_yojson flow_template_summary_to_yojson tree

let search_flow_templates_response_to_yojson (x : search_flow_templates_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("summaries", option_to_yojson flow_template_summaries_to_yojson x.summaries);
    ]

let flow_template_filter_name_to_yojson (x : flow_template_filter_name) =
  match x with DEVICE_MODEL_ID -> `String "DEVICE_MODEL_ID"

let flow_template_filter_value_to_yojson = string_to_yojson

let flow_template_filter_values_to_yojson tree =
  list_to_yojson flow_template_filter_value_to_yojson tree

let flow_template_filter_to_yojson (x : flow_template_filter) =
  assoc_to_yojson
    [
      ("value", Some (flow_template_filter_values_to_yojson x.value));
      ("name", Some (flow_template_filter_name_to_yojson x.name));
    ]

let flow_template_filters_to_yojson tree = list_to_yojson flow_template_filter_to_yojson tree

let search_flow_templates_request_to_yojson (x : search_flow_templates_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("filters", option_to_yojson flow_template_filters_to_yojson x.filters);
    ]

let flow_execution_id_to_yojson = string_to_yojson

let flow_execution_status_to_yojson (x : flow_execution_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | ABORTED -> `String "ABORTED"
  | RUNNING -> `String "RUNNING"

let flow_execution_summary_to_yojson (x : flow_execution_summary) =
  assoc_to_yojson
    [
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("flowTemplateId", option_to_yojson urn_to_yojson x.flow_template_id);
      ("systemInstanceId", option_to_yojson urn_to_yojson x.system_instance_id);
      ("status", option_to_yojson flow_execution_status_to_yojson x.status);
      ("flowExecutionId", option_to_yojson flow_execution_id_to_yojson x.flow_execution_id);
    ]

let flow_execution_summaries_to_yojson tree = list_to_yojson flow_execution_summary_to_yojson tree

let search_flow_executions_response_to_yojson (x : search_flow_executions_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("summaries", option_to_yojson flow_execution_summaries_to_yojson x.summaries);
    ]

let search_flow_executions_request_to_yojson (x : search_flow_executions_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("flowExecutionId", option_to_yojson flow_execution_id_to_yojson x.flow_execution_id);
      ("systemInstanceId", Some (urn_to_yojson x.system_instance_id));
    ]

let entity_type_to_yojson (x : entity_type) =
  match x with
  | ENUM -> `String "ENUM"
  | MAPPING -> `String "MAPPING"
  | PROPERTY -> `String "PROPERTY"
  | EVENT -> `String "EVENT"
  | ACTION -> `String "ACTION"
  | STATE -> `String "STATE"
  | CAPABILITY -> `String "CAPABILITY"
  | DEVICE_MODEL -> `String "DEVICE_MODEL"
  | SERVICE -> `String "SERVICE"
  | DEVICE -> `String "DEVICE"

let entity_description_to_yojson (x : entity_description) =
  assoc_to_yojson
    [
      ("definition", option_to_yojson definition_document_to_yojson x.definition);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("type", option_to_yojson entity_type_to_yojson x.type_);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson urn_to_yojson x.id);
    ]

let entity_descriptions_to_yojson tree = list_to_yojson entity_description_to_yojson tree

let search_entities_response_to_yojson (x : search_entities_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("descriptions", option_to_yojson entity_descriptions_to_yojson x.descriptions);
    ]

let entity_types_to_yojson tree = list_to_yojson entity_type_to_yojson tree

let entity_filter_name_to_yojson (x : entity_filter_name) =
  match x with
  | REFERENCED_ENTITY_ID -> `String "REFERENCED_ENTITY_ID"
  | SEMANTIC_TYPE_PATH -> `String "SEMANTIC_TYPE_PATH"
  | NAMESPACE -> `String "NAMESPACE"
  | NAME -> `String "NAME"

let entity_filter_value_to_yojson = string_to_yojson
let entity_filter_values_to_yojson tree = list_to_yojson entity_filter_value_to_yojson tree

let entity_filter_to_yojson (x : entity_filter) =
  assoc_to_yojson
    [
      ("value", option_to_yojson entity_filter_values_to_yojson x.value);
      ("name", option_to_yojson entity_filter_name_to_yojson x.name);
    ]

let entity_filters_to_yojson tree = list_to_yojson entity_filter_to_yojson tree

let search_entities_request_to_yojson (x : search_entities_request) =
  assoc_to_yojson
    [
      ("namespaceVersion", option_to_yojson version_to_yojson x.namespace_version);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("filters", option_to_yojson entity_filters_to_yojson x.filters);
      ("entityTypes", Some (entity_types_to_yojson x.entity_types));
    ]

let namespace_name_to_yojson = string_to_yojson

let namespace_deletion_status_error_codes_to_yojson (x : namespace_deletion_status_error_codes) =
  match x with VALIDATION_FAILED -> `String "VALIDATION_FAILED"

let namespace_deletion_status_to_yojson (x : namespace_deletion_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let flow_execution_message_id_to_yojson = string_to_yojson

let flow_execution_event_type_to_yojson (x : flow_execution_event_type) =
  match x with
  | ACKNOWLEDGE_TASK_MESSAGE -> `String "ACKNOWLEDGE_TASK_MESSAGE"
  | THING_ACTION_TASK_SUCCEEDED -> `String "THING_ACTION_TASK_SUCCEEDED"
  | THING_ACTION_TASK_FAILED -> `String "THING_ACTION_TASK_FAILED"
  | THING_ACTION_TASK -> `String "THING_ACTION_TASK"
  | SCHEDULE_NEXT_READY_STEPS_TASK -> `String "SCHEDULE_NEXT_READY_STEPS_TASK"
  | START_FLOW_EXECUTION_TASK -> `String "START_FLOW_EXECUTION_TASK"
  | ACTIVITY_SUCCEEDED -> `String "ACTIVITY_SUCCEEDED"
  | ACTIVITY_FAILED -> `String "ACTIVITY_FAILED"
  | ACTIVITY_STARTED -> `String "ACTIVITY_STARTED"
  | ACTIVITY_SCHEDULED -> `String "ACTIVITY_SCHEDULED"
  | STEP_SUCCEEDED -> `String "STEP_SUCCEEDED"
  | STEP_FAILED -> `String "STEP_FAILED"
  | STEP_STARTED -> `String "STEP_STARTED"
  | EXECUTION_SUCCEEDED -> `String "EXECUTION_SUCCEEDED"
  | EXECUTION_ABORTED -> `String "EXECUTION_ABORTED"
  | EXECUTION_FAILED -> `String "EXECUTION_FAILED"
  | EXECUTION_STARTED -> `String "EXECUTION_STARTED"

let flow_execution_message_payload_to_yojson = string_to_yojson

let flow_execution_message_to_yojson (x : flow_execution_message) =
  assoc_to_yojson
    [
      ("payload", option_to_yojson flow_execution_message_payload_to_yojson x.payload);
      ("timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("eventType", option_to_yojson flow_execution_event_type_to_yojson x.event_type);
      ("messageId", option_to_yojson flow_execution_message_id_to_yojson x.message_id);
    ]

let flow_execution_messages_to_yojson tree = list_to_yojson flow_execution_message_to_yojson tree

let list_flow_execution_messages_response_to_yojson (x : list_flow_execution_messages_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("messages", option_to_yojson flow_execution_messages_to_yojson x.messages);
    ]

let list_flow_execution_messages_request_to_yojson (x : list_flow_execution_messages_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("flowExecutionId", Some (flow_execution_id_to_yojson x.flow_execution_id));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let get_upload_status_response_to_yojson (x : get_upload_status_response) =
  assoc_to_yojson
    [
      ("createdDate", Some (timestamp_to_yojson x.created_date));
      ("failureReason", option_to_yojson string_list_to_yojson x.failure_reason);
      ("namespaceVersion", option_to_yojson version_to_yojson x.namespace_version);
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ("namespaceArn", option_to_yojson arn_to_yojson x.namespace_arn);
      ("uploadStatus", Some (upload_status_to_yojson x.upload_status));
      ("uploadId", Some (upload_id_to_yojson x.upload_id));
    ]

let get_upload_status_request_to_yojson (x : get_upload_status_request) =
  assoc_to_yojson [ ("uploadId", Some (upload_id_to_yojson x.upload_id)) ]

let get_system_template_revisions_response_to_yojson (x : get_system_template_revisions_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("summaries", option_to_yojson system_template_summaries_to_yojson x.summaries);
    ]

let get_system_template_revisions_request_to_yojson (x : get_system_template_revisions_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("id", Some (urn_to_yojson x.id));
    ]

let get_system_template_response_to_yojson (x : get_system_template_response) =
  assoc_to_yojson
    [ ("description", option_to_yojson system_template_description_to_yojson x.description) ]

let get_system_template_request_to_yojson (x : get_system_template_request) =
  assoc_to_yojson
    [
      ("revisionNumber", option_to_yojson version_to_yojson x.revision_number);
      ("id", Some (urn_to_yojson x.id));
    ]

let get_system_instance_response_to_yojson (x : get_system_instance_response) =
  assoc_to_yojson
    [ ("description", option_to_yojson system_instance_description_to_yojson x.description) ]

let get_system_instance_request_to_yojson (x : get_system_instance_request) =
  assoc_to_yojson [ ("id", Some (urn_to_yojson x.id)) ]

let get_namespace_deletion_status_response_to_yojson (x : get_namespace_deletion_status_response) =
  assoc_to_yojson
    [
      ("errorMessage", option_to_yojson string__to_yojson x.error_message);
      ("errorCode", option_to_yojson namespace_deletion_status_error_codes_to_yojson x.error_code);
      ("status", option_to_yojson namespace_deletion_status_to_yojson x.status);
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ("namespaceArn", option_to_yojson arn_to_yojson x.namespace_arn);
    ]

let get_namespace_deletion_status_request_to_yojson = unit_to_yojson

let get_flow_template_revisions_response_to_yojson (x : get_flow_template_revisions_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("summaries", option_to_yojson flow_template_summaries_to_yojson x.summaries);
    ]

let get_flow_template_revisions_request_to_yojson (x : get_flow_template_revisions_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("id", Some (urn_to_yojson x.id));
    ]

let flow_template_description_to_yojson (x : flow_template_description) =
  assoc_to_yojson
    [
      ("validatedNamespaceVersion", option_to_yojson version_to_yojson x.validated_namespace_version);
      ("definition", option_to_yojson definition_document_to_yojson x.definition);
      ("summary", option_to_yojson flow_template_summary_to_yojson x.summary);
    ]

let get_flow_template_response_to_yojson (x : get_flow_template_response) =
  assoc_to_yojson
    [ ("description", option_to_yojson flow_template_description_to_yojson x.description) ]

let get_flow_template_request_to_yojson (x : get_flow_template_request) =
  assoc_to_yojson
    [
      ("revisionNumber", option_to_yojson version_to_yojson x.revision_number);
      ("id", Some (urn_to_yojson x.id));
    ]

let get_entities_response_to_yojson (x : get_entities_response) =
  assoc_to_yojson
    [ ("descriptions", option_to_yojson entity_descriptions_to_yojson x.descriptions) ]

let get_entities_request_to_yojson (x : get_entities_request) =
  assoc_to_yojson
    [
      ("namespaceVersion", option_to_yojson version_to_yojson x.namespace_version);
      ("ids", Some (urns_to_yojson x.ids));
    ]

let dissociate_entity_from_thing_response_to_yojson = unit_to_yojson

let dissociate_entity_from_thing_request_to_yojson (x : dissociate_entity_from_thing_request) =
  assoc_to_yojson
    [
      ("entityType", Some (entity_type_to_yojson x.entity_type));
      ("thingName", Some (thing_name_to_yojson x.thing_name));
    ]

let describe_namespace_response_to_yojson (x : describe_namespace_response) =
  assoc_to_yojson
    [
      ("namespaceVersion", option_to_yojson version_to_yojson x.namespace_version);
      ("trackingNamespaceVersion", option_to_yojson version_to_yojson x.tracking_namespace_version);
      ("trackingNamespaceName", option_to_yojson namespace_name_to_yojson x.tracking_namespace_name);
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ("namespaceArn", option_to_yojson arn_to_yojson x.namespace_arn);
    ]

let describe_namespace_request_to_yojson (x : describe_namespace_request) =
  assoc_to_yojson [ ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name) ]

let deprecate_system_template_response_to_yojson = unit_to_yojson

let deprecate_system_template_request_to_yojson (x : deprecate_system_template_request) =
  assoc_to_yojson [ ("id", Some (urn_to_yojson x.id)) ]

let deprecate_flow_template_response_to_yojson = unit_to_yojson

let deprecate_flow_template_request_to_yojson (x : deprecate_flow_template_request) =
  assoc_to_yojson [ ("id", Some (urn_to_yojson x.id)) ]

let greengrass_deployment_id_to_yojson = string_to_yojson

let deploy_system_instance_response_to_yojson (x : deploy_system_instance_response) =
  assoc_to_yojson
    [
      ( "greengrassDeploymentId",
        option_to_yojson greengrass_deployment_id_to_yojson x.greengrass_deployment_id );
      ("summary", Some (system_instance_summary_to_yojson x.summary));
    ]

let deploy_system_instance_request_to_yojson (x : deploy_system_instance_request) =
  assoc_to_yojson [ ("id", option_to_yojson urn_to_yojson x.id) ]

let delete_system_template_response_to_yojson = unit_to_yojson

let delete_system_template_request_to_yojson (x : delete_system_template_request) =
  assoc_to_yojson [ ("id", Some (urn_to_yojson x.id)) ]

let delete_system_instance_response_to_yojson = unit_to_yojson

let delete_system_instance_request_to_yojson (x : delete_system_instance_request) =
  assoc_to_yojson [ ("id", option_to_yojson urn_to_yojson x.id) ]

let delete_namespace_response_to_yojson (x : delete_namespace_response) =
  assoc_to_yojson
    [
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ("namespaceArn", option_to_yojson arn_to_yojson x.namespace_arn);
    ]

let delete_namespace_request_to_yojson = unit_to_yojson
let delete_flow_template_response_to_yojson = unit_to_yojson

let delete_flow_template_request_to_yojson (x : delete_flow_template_request) =
  assoc_to_yojson [ ("id", Some (urn_to_yojson x.id)) ]

let create_system_template_response_to_yojson (x : create_system_template_response) =
  assoc_to_yojson [ ("summary", option_to_yojson system_template_summary_to_yojson x.summary) ]

let create_system_template_request_to_yojson (x : create_system_template_request) =
  assoc_to_yojson
    [
      ( "compatibleNamespaceVersion",
        option_to_yojson version_to_yojson x.compatible_namespace_version );
      ("definition", Some (definition_document_to_yojson x.definition));
    ]

let create_system_instance_response_to_yojson (x : create_system_instance_response) =
  assoc_to_yojson [ ("summary", option_to_yojson system_instance_summary_to_yojson x.summary) ]

let create_system_instance_request_to_yojson (x : create_system_instance_request) =
  assoc_to_yojson
    [
      ("flowActionsRoleArn", option_to_yojson role_arn_to_yojson x.flow_actions_role_arn);
      ( "metricsConfiguration",
        option_to_yojson metrics_configuration_to_yojson x.metrics_configuration );
      ("s3BucketName", option_to_yojson s3_bucket_name_to_yojson x.s3_bucket_name);
      ("greengrassGroupName", option_to_yojson group_name_to_yojson x.greengrass_group_name);
      ("target", Some (deployment_target_to_yojson x.target));
      ("definition", Some (definition_document_to_yojson x.definition));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_flow_template_response_to_yojson (x : create_flow_template_response) =
  assoc_to_yojson [ ("summary", option_to_yojson flow_template_summary_to_yojson x.summary) ]

let create_flow_template_request_to_yojson (x : create_flow_template_request) =
  assoc_to_yojson
    [
      ( "compatibleNamespaceVersion",
        option_to_yojson version_to_yojson x.compatible_namespace_version );
      ("definition", Some (definition_document_to_yojson x.definition));
    ]

let associate_entity_to_thing_response_to_yojson = unit_to_yojson

let associate_entity_to_thing_request_to_yojson (x : associate_entity_to_thing_request) =
  assoc_to_yojson
    [
      ("namespaceVersion", option_to_yojson version_to_yojson x.namespace_version);
      ("entityId", Some (urn_to_yojson x.entity_id));
      ("thingName", Some (thing_name_to_yojson x.thing_name));
    ]
