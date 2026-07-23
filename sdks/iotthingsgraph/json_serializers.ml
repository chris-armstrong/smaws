open Smaws_Lib.Json.SerializeHelpers
open Types

let arn_to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let internal_failure_exception_to_yojson (x : internal_failure_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let associate_entity_to_thing_response_to_yojson = unit_to_yojson
let version_to_yojson = long_to_yojson
let urn_to_yojson = string_to_yojson
let thing_name_to_yojson = string_to_yojson

let associate_entity_to_thing_request_to_yojson (x : associate_entity_to_thing_request) =
  assoc_to_yojson
    [
      ("thingName", Some (thing_name_to_yojson x.thing_name));
      ("entityId", Some (urn_to_yojson x.entity_id));
      ("namespaceVersion", option_to_yojson version_to_yojson x.namespace_version);
    ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let flow_template_summary_to_yojson (x : flow_template_summary) =
  assoc_to_yojson
    [
      ("id", option_to_yojson urn_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("revisionNumber", option_to_yojson version_to_yojson x.revision_number);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
    ]

let create_flow_template_response_to_yojson (x : create_flow_template_response) =
  assoc_to_yojson [ ("summary", option_to_yojson flow_template_summary_to_yojson x.summary) ]

let definition_text_to_yojson = string_to_yojson

let definition_language_to_yojson (x : definition_language) =
  match x with GRAPHQL -> `String "GRAPHQL"

let definition_document_to_yojson (x : definition_document) =
  assoc_to_yojson
    [
      ("language", Some (definition_language_to_yojson x.language));
      ("text", Some (definition_text_to_yojson x.text));
    ]

let create_flow_template_request_to_yojson (x : create_flow_template_request) =
  assoc_to_yojson
    [
      ("definition", Some (definition_document_to_yojson x.definition));
      ( "compatibleNamespaceVersion",
        option_to_yojson version_to_yojson x.compatible_namespace_version );
    ]

let greengrass_group_version_id_to_yojson = string_to_yojson
let greengrass_group_id_to_yojson = string_to_yojson
let group_name_to_yojson = string_to_yojson

let deployment_target_to_yojson (x : deployment_target) =
  match x with GREENGRASS -> `String "GREENGRASS" | CLOUD -> `String "CLOUD"

let system_instance_deployment_status_to_yojson (x : system_instance_deployment_status) =
  match x with
  | NOT_DEPLOYED -> `String "NOT_DEPLOYED"
  | BOOTSTRAP -> `String "BOOTSTRAP"
  | DEPLOY_IN_PROGRESS -> `String "DEPLOY_IN_PROGRESS"
  | DEPLOYED_IN_TARGET -> `String "DEPLOYED_IN_TARGET"
  | UNDEPLOY_IN_PROGRESS -> `String "UNDEPLOY_IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | PENDING_DELETE -> `String "PENDING_DELETE"
  | DELETED_IN_TARGET -> `String "DELETED_IN_TARGET"

let system_instance_summary_to_yojson (x : system_instance_summary) =
  assoc_to_yojson
    [
      ("id", option_to_yojson urn_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("status", option_to_yojson system_instance_deployment_status_to_yojson x.status);
      ("target", option_to_yojson deployment_target_to_yojson x.target);
      ("greengrassGroupName", option_to_yojson group_name_to_yojson x.greengrass_group_name);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("greengrassGroupId", option_to_yojson greengrass_group_id_to_yojson x.greengrass_group_id);
      ( "greengrassGroupVersionId",
        option_to_yojson greengrass_group_version_id_to_yojson x.greengrass_group_version_id );
    ]

let create_system_instance_response_to_yojson (x : create_system_instance_response) =
  assoc_to_yojson [ ("summary", option_to_yojson system_instance_summary_to_yojson x.summary) ]

let role_arn_to_yojson = string_to_yojson
let enabled_to_yojson = bool_to_yojson

let metrics_configuration_to_yojson (x : metrics_configuration) =
  assoc_to_yojson
    [
      ("cloudMetricEnabled", option_to_yojson enabled_to_yojson x.cloud_metric_enabled);
      ("metricRuleRoleArn", option_to_yojson role_arn_to_yojson x.metric_rule_role_arn);
    ]

let s3_bucket_name_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("key", Some (tag_key_to_yojson x.key)); ("value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let create_system_instance_request_to_yojson (x : create_system_instance_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("definition", Some (definition_document_to_yojson x.definition));
      ("target", Some (deployment_target_to_yojson x.target));
      ("greengrassGroupName", option_to_yojson group_name_to_yojson x.greengrass_group_name);
      ("s3BucketName", option_to_yojson s3_bucket_name_to_yojson x.s3_bucket_name);
      ( "metricsConfiguration",
        option_to_yojson metrics_configuration_to_yojson x.metrics_configuration );
      ("flowActionsRoleArn", option_to_yojson role_arn_to_yojson x.flow_actions_role_arn);
    ]

let system_template_summary_to_yojson (x : system_template_summary) =
  assoc_to_yojson
    [
      ("id", option_to_yojson urn_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("revisionNumber", option_to_yojson version_to_yojson x.revision_number);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
    ]

let create_system_template_response_to_yojson (x : create_system_template_response) =
  assoc_to_yojson [ ("summary", option_to_yojson system_template_summary_to_yojson x.summary) ]

let create_system_template_request_to_yojson (x : create_system_template_request) =
  assoc_to_yojson
    [
      ("definition", Some (definition_document_to_yojson x.definition));
      ( "compatibleNamespaceVersion",
        option_to_yojson version_to_yojson x.compatible_namespace_version );
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let delete_flow_template_response_to_yojson = unit_to_yojson

let delete_flow_template_request_to_yojson (x : delete_flow_template_request) =
  assoc_to_yojson [ ("id", Some (urn_to_yojson x.id)) ]

let namespace_name_to_yojson = string_to_yojson

let delete_namespace_response_to_yojson (x : delete_namespace_response) =
  assoc_to_yojson
    [
      ("namespaceArn", option_to_yojson arn_to_yojson x.namespace_arn);
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
    ]

let delete_namespace_request_to_yojson = unit_to_yojson
let delete_system_instance_response_to_yojson = unit_to_yojson

let delete_system_instance_request_to_yojson (x : delete_system_instance_request) =
  assoc_to_yojson [ ("id", option_to_yojson urn_to_yojson x.id) ]

let delete_system_template_response_to_yojson = unit_to_yojson

let delete_system_template_request_to_yojson (x : delete_system_template_request) =
  assoc_to_yojson [ ("id", Some (urn_to_yojson x.id)) ]

let dependency_revision_to_yojson (x : dependency_revision) =
  assoc_to_yojson
    [
      ("id", option_to_yojson urn_to_yojson x.id);
      ("revisionNumber", option_to_yojson version_to_yojson x.revision_number);
    ]

let dependency_revisions_to_yojson tree = list_to_yojson dependency_revision_to_yojson tree
let greengrass_deployment_id_to_yojson = string_to_yojson

let deploy_system_instance_response_to_yojson (x : deploy_system_instance_response) =
  assoc_to_yojson
    [
      ("summary", Some (system_instance_summary_to_yojson x.summary));
      ( "greengrassDeploymentId",
        option_to_yojson greengrass_deployment_id_to_yojson x.greengrass_deployment_id );
    ]

let deploy_system_instance_request_to_yojson (x : deploy_system_instance_request) =
  assoc_to_yojson [ ("id", option_to_yojson urn_to_yojson x.id) ]

let deprecate_existing_entities_to_yojson = bool_to_yojson
let deprecate_flow_template_response_to_yojson = unit_to_yojson

let deprecate_flow_template_request_to_yojson (x : deprecate_flow_template_request) =
  assoc_to_yojson [ ("id", Some (urn_to_yojson x.id)) ]

let deprecate_system_template_response_to_yojson = unit_to_yojson

let deprecate_system_template_request_to_yojson (x : deprecate_system_template_request) =
  assoc_to_yojson [ ("id", Some (urn_to_yojson x.id)) ]

let describe_namespace_response_to_yojson (x : describe_namespace_response) =
  assoc_to_yojson
    [
      ("namespaceArn", option_to_yojson arn_to_yojson x.namespace_arn);
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ("trackingNamespaceName", option_to_yojson namespace_name_to_yojson x.tracking_namespace_name);
      ("trackingNamespaceVersion", option_to_yojson version_to_yojson x.tracking_namespace_version);
      ("namespaceVersion", option_to_yojson version_to_yojson x.namespace_version);
    ]

let describe_namespace_request_to_yojson (x : describe_namespace_request) =
  assoc_to_yojson [ ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name) ]

let dissociate_entity_from_thing_response_to_yojson = unit_to_yojson

let entity_type_to_yojson (x : entity_type) =
  match x with
  | DEVICE -> `String "DEVICE"
  | SERVICE -> `String "SERVICE"
  | DEVICE_MODEL -> `String "DEVICE_MODEL"
  | CAPABILITY -> `String "CAPABILITY"
  | STATE -> `String "STATE"
  | ACTION -> `String "ACTION"
  | EVENT -> `String "EVENT"
  | PROPERTY -> `String "PROPERTY"
  | MAPPING -> `String "MAPPING"
  | ENUM -> `String "ENUM"

let dissociate_entity_from_thing_request_to_yojson (x : dissociate_entity_from_thing_request) =
  assoc_to_yojson
    [
      ("thingName", Some (thing_name_to_yojson x.thing_name));
      ("entityType", Some (entity_type_to_yojson x.entity_type));
    ]

let entity_description_to_yojson (x : entity_description) =
  assoc_to_yojson
    [
      ("id", option_to_yojson urn_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("type", option_to_yojson entity_type_to_yojson x.type_);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("definition", option_to_yojson definition_document_to_yojson x.definition);
    ]

let entity_descriptions_to_yojson tree = list_to_yojson entity_description_to_yojson tree
let entity_filter_value_to_yojson = string_to_yojson
let entity_filter_values_to_yojson tree = list_to_yojson entity_filter_value_to_yojson tree

let entity_filter_name_to_yojson (x : entity_filter_name) =
  match x with
  | NAME -> `String "NAME"
  | NAMESPACE -> `String "NAMESPACE"
  | SEMANTIC_TYPE_PATH -> `String "SEMANTIC_TYPE_PATH"
  | REFERENCED_ENTITY_ID -> `String "REFERENCED_ENTITY_ID"

let entity_filter_to_yojson (x : entity_filter) =
  assoc_to_yojson
    [
      ("name", option_to_yojson entity_filter_name_to_yojson x.name);
      ("value", option_to_yojson entity_filter_values_to_yojson x.value);
    ]

let entity_filters_to_yojson tree = list_to_yojson entity_filter_to_yojson tree
let entity_types_to_yojson tree = list_to_yojson entity_type_to_yojson tree

let flow_execution_event_type_to_yojson (x : flow_execution_event_type) =
  match x with
  | EXECUTION_STARTED -> `String "EXECUTION_STARTED"
  | EXECUTION_FAILED -> `String "EXECUTION_FAILED"
  | EXECUTION_ABORTED -> `String "EXECUTION_ABORTED"
  | EXECUTION_SUCCEEDED -> `String "EXECUTION_SUCCEEDED"
  | STEP_STARTED -> `String "STEP_STARTED"
  | STEP_FAILED -> `String "STEP_FAILED"
  | STEP_SUCCEEDED -> `String "STEP_SUCCEEDED"
  | ACTIVITY_SCHEDULED -> `String "ACTIVITY_SCHEDULED"
  | ACTIVITY_STARTED -> `String "ACTIVITY_STARTED"
  | ACTIVITY_FAILED -> `String "ACTIVITY_FAILED"
  | ACTIVITY_SUCCEEDED -> `String "ACTIVITY_SUCCEEDED"
  | START_FLOW_EXECUTION_TASK -> `String "START_FLOW_EXECUTION_TASK"
  | SCHEDULE_NEXT_READY_STEPS_TASK -> `String "SCHEDULE_NEXT_READY_STEPS_TASK"
  | THING_ACTION_TASK -> `String "THING_ACTION_TASK"
  | THING_ACTION_TASK_FAILED -> `String "THING_ACTION_TASK_FAILED"
  | THING_ACTION_TASK_SUCCEEDED -> `String "THING_ACTION_TASK_SUCCEEDED"
  | ACKNOWLEDGE_TASK_MESSAGE -> `String "ACKNOWLEDGE_TASK_MESSAGE"

let flow_execution_id_to_yojson = string_to_yojson
let flow_execution_message_payload_to_yojson = string_to_yojson
let flow_execution_message_id_to_yojson = string_to_yojson

let flow_execution_message_to_yojson (x : flow_execution_message) =
  assoc_to_yojson
    [
      ("messageId", option_to_yojson flow_execution_message_id_to_yojson x.message_id);
      ("eventType", option_to_yojson flow_execution_event_type_to_yojson x.event_type);
      ("timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("payload", option_to_yojson flow_execution_message_payload_to_yojson x.payload);
    ]

let flow_execution_messages_to_yojson tree = list_to_yojson flow_execution_message_to_yojson tree

let flow_execution_status_to_yojson (x : flow_execution_status) =
  match x with
  | RUNNING -> `String "RUNNING"
  | ABORTED -> `String "ABORTED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"

let flow_execution_summary_to_yojson (x : flow_execution_summary) =
  assoc_to_yojson
    [
      ("flowExecutionId", option_to_yojson flow_execution_id_to_yojson x.flow_execution_id);
      ("status", option_to_yojson flow_execution_status_to_yojson x.status);
      ("systemInstanceId", option_to_yojson urn_to_yojson x.system_instance_id);
      ("flowTemplateId", option_to_yojson urn_to_yojson x.flow_template_id);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let flow_execution_summaries_to_yojson tree = list_to_yojson flow_execution_summary_to_yojson tree

let flow_template_description_to_yojson (x : flow_template_description) =
  assoc_to_yojson
    [
      ("summary", option_to_yojson flow_template_summary_to_yojson x.summary);
      ("definition", option_to_yojson definition_document_to_yojson x.definition);
      ("validatedNamespaceVersion", option_to_yojson version_to_yojson x.validated_namespace_version);
    ]

let flow_template_filter_value_to_yojson = string_to_yojson

let flow_template_filter_values_to_yojson tree =
  list_to_yojson flow_template_filter_value_to_yojson tree

let flow_template_filter_name_to_yojson (x : flow_template_filter_name) =
  match x with DEVICE_MODEL_ID -> `String "DEVICE_MODEL_ID"

let flow_template_filter_to_yojson (x : flow_template_filter) =
  assoc_to_yojson
    [
      ("name", Some (flow_template_filter_name_to_yojson x.name));
      ("value", Some (flow_template_filter_values_to_yojson x.value));
    ]

let flow_template_filters_to_yojson tree = list_to_yojson flow_template_filter_to_yojson tree
let flow_template_summaries_to_yojson tree = list_to_yojson flow_template_summary_to_yojson tree

let get_entities_response_to_yojson (x : get_entities_response) =
  assoc_to_yojson
    [ ("descriptions", option_to_yojson entity_descriptions_to_yojson x.descriptions) ]

let urns_to_yojson tree = list_to_yojson urn_to_yojson tree

let get_entities_request_to_yojson (x : get_entities_request) =
  assoc_to_yojson
    [
      ("ids", Some (urns_to_yojson x.ids));
      ("namespaceVersion", option_to_yojson version_to_yojson x.namespace_version);
    ]

let get_flow_template_response_to_yojson (x : get_flow_template_response) =
  assoc_to_yojson
    [ ("description", option_to_yojson flow_template_description_to_yojson x.description) ]

let get_flow_template_request_to_yojson (x : get_flow_template_request) =
  assoc_to_yojson
    [
      ("id", Some (urn_to_yojson x.id));
      ("revisionNumber", option_to_yojson version_to_yojson x.revision_number);
    ]

let next_token_to_yojson = string_to_yojson

let get_flow_template_revisions_response_to_yojson (x : get_flow_template_revisions_response) =
  assoc_to_yojson
    [
      ("summaries", option_to_yojson flow_template_summaries_to_yojson x.summaries);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let get_flow_template_revisions_request_to_yojson (x : get_flow_template_revisions_request) =
  assoc_to_yojson
    [
      ("id", Some (urn_to_yojson x.id));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let string__to_yojson = string_to_yojson

let namespace_deletion_status_error_codes_to_yojson (x : namespace_deletion_status_error_codes) =
  match x with VALIDATION_FAILED -> `String "VALIDATION_FAILED"

let namespace_deletion_status_to_yojson (x : namespace_deletion_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"

let get_namespace_deletion_status_response_to_yojson (x : get_namespace_deletion_status_response) =
  assoc_to_yojson
    [
      ("namespaceArn", option_to_yojson arn_to_yojson x.namespace_arn);
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ("status", option_to_yojson namespace_deletion_status_to_yojson x.status);
      ("errorCode", option_to_yojson namespace_deletion_status_error_codes_to_yojson x.error_code);
      ("errorMessage", option_to_yojson string__to_yojson x.error_message);
    ]

let get_namespace_deletion_status_request_to_yojson = unit_to_yojson

let system_instance_description_to_yojson (x : system_instance_description) =
  assoc_to_yojson
    [
      ("summary", option_to_yojson system_instance_summary_to_yojson x.summary);
      ("definition", option_to_yojson definition_document_to_yojson x.definition);
      ("s3BucketName", option_to_yojson s3_bucket_name_to_yojson x.s3_bucket_name);
      ( "metricsConfiguration",
        option_to_yojson metrics_configuration_to_yojson x.metrics_configuration );
      ("validatedNamespaceVersion", option_to_yojson version_to_yojson x.validated_namespace_version);
      ( "validatedDependencyRevisions",
        option_to_yojson dependency_revisions_to_yojson x.validated_dependency_revisions );
      ("flowActionsRoleArn", option_to_yojson role_arn_to_yojson x.flow_actions_role_arn);
    ]

let get_system_instance_response_to_yojson (x : get_system_instance_response) =
  assoc_to_yojson
    [ ("description", option_to_yojson system_instance_description_to_yojson x.description) ]

let get_system_instance_request_to_yojson (x : get_system_instance_request) =
  assoc_to_yojson [ ("id", Some (urn_to_yojson x.id)) ]

let system_template_description_to_yojson (x : system_template_description) =
  assoc_to_yojson
    [
      ("summary", option_to_yojson system_template_summary_to_yojson x.summary);
      ("definition", option_to_yojson definition_document_to_yojson x.definition);
      ("validatedNamespaceVersion", option_to_yojson version_to_yojson x.validated_namespace_version);
    ]

let get_system_template_response_to_yojson (x : get_system_template_response) =
  assoc_to_yojson
    [ ("description", option_to_yojson system_template_description_to_yojson x.description) ]

let get_system_template_request_to_yojson (x : get_system_template_request) =
  assoc_to_yojson
    [
      ("id", Some (urn_to_yojson x.id));
      ("revisionNumber", option_to_yojson version_to_yojson x.revision_number);
    ]

let system_template_summaries_to_yojson tree = list_to_yojson system_template_summary_to_yojson tree

let get_system_template_revisions_response_to_yojson (x : get_system_template_revisions_response) =
  assoc_to_yojson
    [
      ("summaries", option_to_yojson system_template_summaries_to_yojson x.summaries);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_system_template_revisions_request_to_yojson (x : get_system_template_revisions_request) =
  assoc_to_yojson
    [
      ("id", Some (urn_to_yojson x.id));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let upload_status_to_yojson (x : upload_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"

let upload_id_to_yojson = string_to_yojson

let get_upload_status_response_to_yojson (x : get_upload_status_response) =
  assoc_to_yojson
    [
      ("uploadId", Some (upload_id_to_yojson x.upload_id));
      ("uploadStatus", Some (upload_status_to_yojson x.upload_status));
      ("namespaceArn", option_to_yojson arn_to_yojson x.namespace_arn);
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ("namespaceVersion", option_to_yojson version_to_yojson x.namespace_version);
      ("failureReason", option_to_yojson string_list_to_yojson x.failure_reason);
      ("createdDate", Some (timestamp_to_yojson x.created_date));
    ]

let get_upload_status_request_to_yojson (x : get_upload_status_request) =
  assoc_to_yojson [ ("uploadId", Some (upload_id_to_yojson x.upload_id)) ]

let upload_entity_definitions_response_to_yojson (x : upload_entity_definitions_response) =
  assoc_to_yojson [ ("uploadId", Some (upload_id_to_yojson x.upload_id)) ]

let sync_with_public_namespace_to_yojson = bool_to_yojson

let upload_entity_definitions_request_to_yojson (x : upload_entity_definitions_request) =
  assoc_to_yojson
    [
      ("document", option_to_yojson definition_document_to_yojson x.document);
      ( "syncWithPublicNamespace",
        option_to_yojson sync_with_public_namespace_to_yojson x.sync_with_public_namespace );
      ( "deprecateExistingEntities",
        option_to_yojson deprecate_existing_entities_to_yojson x.deprecate_existing_entities );
    ]

let update_system_template_response_to_yojson (x : update_system_template_response) =
  assoc_to_yojson [ ("summary", option_to_yojson system_template_summary_to_yojson x.summary) ]

let update_system_template_request_to_yojson (x : update_system_template_request) =
  assoc_to_yojson
    [
      ("id", Some (urn_to_yojson x.id));
      ("definition", Some (definition_document_to_yojson x.definition));
      ( "compatibleNamespaceVersion",
        option_to_yojson version_to_yojson x.compatible_namespace_version );
    ]

let update_flow_template_response_to_yojson (x : update_flow_template_response) =
  assoc_to_yojson [ ("summary", option_to_yojson flow_template_summary_to_yojson x.summary) ]

let update_flow_template_request_to_yojson (x : update_flow_template_request) =
  assoc_to_yojson
    [
      ("id", Some (urn_to_yojson x.id));
      ("definition", Some (definition_document_to_yojson x.definition));
      ( "compatibleNamespaceVersion",
        option_to_yojson version_to_yojson x.compatible_namespace_version );
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let resource_arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let undeploy_system_instance_response_to_yojson (x : undeploy_system_instance_response) =
  assoc_to_yojson [ ("summary", option_to_yojson system_instance_summary_to_yojson x.summary) ]

let undeploy_system_instance_request_to_yojson (x : undeploy_system_instance_request) =
  assoc_to_yojson [ ("id", option_to_yojson urn_to_yojson x.id) ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("tags", Some (tag_list_to_yojson x.tags));
    ]

let thing_arn_to_yojson = string_to_yojson

let thing_to_yojson (x : thing) =
  assoc_to_yojson
    [
      ("thingArn", option_to_yojson thing_arn_to_yojson x.thing_arn);
      ("thingName", option_to_yojson thing_name_to_yojson x.thing_name);
    ]

let things_to_yojson tree = list_to_yojson thing_to_yojson tree

let search_things_response_to_yojson (x : search_things_response) =
  assoc_to_yojson
    [
      ("things", option_to_yojson things_to_yojson x.things);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let search_things_request_to_yojson (x : search_things_request) =
  assoc_to_yojson
    [
      ("entityId", Some (urn_to_yojson x.entity_id));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("namespaceVersion", option_to_yojson version_to_yojson x.namespace_version);
    ]

let search_system_templates_response_to_yojson (x : search_system_templates_response) =
  assoc_to_yojson
    [
      ("summaries", option_to_yojson system_template_summaries_to_yojson x.summaries);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let system_template_filter_value_to_yojson = string_to_yojson

let system_template_filter_values_to_yojson tree =
  list_to_yojson system_template_filter_value_to_yojson tree

let system_template_filter_name_to_yojson (x : system_template_filter_name) =
  match x with FLOW_TEMPLATE_ID -> `String "FLOW_TEMPLATE_ID"

let system_template_filter_to_yojson (x : system_template_filter) =
  assoc_to_yojson
    [
      ("name", Some (system_template_filter_name_to_yojson x.name));
      ("value", Some (system_template_filter_values_to_yojson x.value));
    ]

let system_template_filters_to_yojson tree = list_to_yojson system_template_filter_to_yojson tree

let search_system_templates_request_to_yojson (x : search_system_templates_request) =
  assoc_to_yojson
    [
      ("filters", option_to_yojson system_template_filters_to_yojson x.filters);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let system_instance_summaries_to_yojson tree = list_to_yojson system_instance_summary_to_yojson tree

let search_system_instances_response_to_yojson (x : search_system_instances_response) =
  assoc_to_yojson
    [
      ("summaries", option_to_yojson system_instance_summaries_to_yojson x.summaries);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let system_instance_filter_value_to_yojson = string_to_yojson

let system_instance_filter_values_to_yojson tree =
  list_to_yojson system_instance_filter_value_to_yojson tree

let system_instance_filter_name_to_yojson (x : system_instance_filter_name) =
  match x with
  | SYSTEM_TEMPLATE_ID -> `String "SYSTEM_TEMPLATE_ID"
  | STATUS -> `String "STATUS"
  | GREENGRASS_GROUP_NAME -> `String "GREENGRASS_GROUP_NAME"

let system_instance_filter_to_yojson (x : system_instance_filter) =
  assoc_to_yojson
    [
      ("name", option_to_yojson system_instance_filter_name_to_yojson x.name);
      ("value", option_to_yojson system_instance_filter_values_to_yojson x.value);
    ]

let system_instance_filters_to_yojson tree = list_to_yojson system_instance_filter_to_yojson tree

let search_system_instances_request_to_yojson (x : search_system_instances_request) =
  assoc_to_yojson
    [
      ("filters", option_to_yojson system_instance_filters_to_yojson x.filters);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let search_flow_templates_response_to_yojson (x : search_flow_templates_response) =
  assoc_to_yojson
    [
      ("summaries", option_to_yojson flow_template_summaries_to_yojson x.summaries);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let search_flow_templates_request_to_yojson (x : search_flow_templates_request) =
  assoc_to_yojson
    [
      ("filters", option_to_yojson flow_template_filters_to_yojson x.filters);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let search_flow_executions_response_to_yojson (x : search_flow_executions_response) =
  assoc_to_yojson
    [
      ("summaries", option_to_yojson flow_execution_summaries_to_yojson x.summaries);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let search_flow_executions_request_to_yojson (x : search_flow_executions_request) =
  assoc_to_yojson
    [
      ("systemInstanceId", Some (urn_to_yojson x.system_instance_id));
      ("flowExecutionId", option_to_yojson flow_execution_id_to_yojson x.flow_execution_id);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let search_entities_response_to_yojson (x : search_entities_response) =
  assoc_to_yojson
    [
      ("descriptions", option_to_yojson entity_descriptions_to_yojson x.descriptions);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let search_entities_request_to_yojson (x : search_entities_request) =
  assoc_to_yojson
    [
      ("entityTypes", Some (entity_types_to_yojson x.entity_types));
      ("filters", option_to_yojson entity_filters_to_yojson x.filters);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("namespaceVersion", option_to_yojson version_to_yojson x.namespace_version);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_flow_execution_messages_response_to_yojson (x : list_flow_execution_messages_response) =
  assoc_to_yojson
    [
      ("messages", option_to_yojson flow_execution_messages_to_yojson x.messages);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_flow_execution_messages_request_to_yojson (x : list_flow_execution_messages_request) =
  assoc_to_yojson
    [
      ("flowExecutionId", Some (flow_execution_id_to_yojson x.flow_execution_id));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]
