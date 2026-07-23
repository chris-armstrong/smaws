open Smaws_Lib.Json.DeserializeHelpers
open Types

let arn_of_yojson = string_of_yojson
let error_message_of_yojson = string_of_yojson

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_not_found_exception)

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_request_exception)

let internal_failure_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : internal_failure_exception)

let associate_entity_to_thing_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let version_of_yojson = long_of_yojson
let urn_of_yojson = string_of_yojson
let thing_name_of_yojson = string_of_yojson

let associate_entity_to_thing_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     thing_name = value_for_key thing_name_of_yojson "thingName" _list path;
     entity_id = value_for_key urn_of_yojson "entityId" _list path;
     namespace_version =
       option_of_yojson (value_for_key version_of_yojson "namespaceVersion") _list path;
   }
    : associate_entity_to_thing_request)

let resource_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_already_exists_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let flow_template_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key urn_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     revision_number =
       option_of_yojson (value_for_key version_of_yojson "revisionNumber") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
   }
    : flow_template_summary)

let create_flow_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary = option_of_yojson (value_for_key flow_template_summary_of_yojson "summary") _list path;
   }
    : create_flow_template_response)

let definition_text_of_yojson = string_of_yojson

let definition_language_of_yojson (tree : t) path =
  ((match tree with
    | `String "GRAPHQL" -> GRAPHQL
    | `String value -> raise (deserialize_unknown_enum_value_error path "DefinitionLanguage" value)
    | _ -> raise (deserialize_wrong_type_error path "DefinitionLanguage")
     : definition_language)
    : definition_language)

let definition_document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language = value_for_key definition_language_of_yojson "language" _list path;
     text = value_for_key definition_text_of_yojson "text" _list path;
   }
    : definition_document)

let create_flow_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     definition = value_for_key definition_document_of_yojson "definition" _list path;
     compatible_namespace_version =
       option_of_yojson (value_for_key version_of_yojson "compatibleNamespaceVersion") _list path;
   }
    : create_flow_template_request)

let greengrass_group_version_id_of_yojson = string_of_yojson
let greengrass_group_id_of_yojson = string_of_yojson
let group_name_of_yojson = string_of_yojson

let deployment_target_of_yojson (tree : t) path =
  ((match tree with
    | `String "GREENGRASS" -> GREENGRASS
    | `String "CLOUD" -> CLOUD
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeploymentTarget" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentTarget")
     : deployment_target)
    : deployment_target)

let system_instance_deployment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOT_DEPLOYED" -> NOT_DEPLOYED
    | `String "BOOTSTRAP" -> BOOTSTRAP
    | `String "DEPLOY_IN_PROGRESS" -> DEPLOY_IN_PROGRESS
    | `String "DEPLOYED_IN_TARGET" -> DEPLOYED_IN_TARGET
    | `String "UNDEPLOY_IN_PROGRESS" -> UNDEPLOY_IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "PENDING_DELETE" -> PENDING_DELETE
    | `String "DELETED_IN_TARGET" -> DELETED_IN_TARGET
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SystemInstanceDeploymentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SystemInstanceDeploymentStatus")
     : system_instance_deployment_status)
    : system_instance_deployment_status)

let system_instance_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key urn_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     status =
       option_of_yojson
         (value_for_key system_instance_deployment_status_of_yojson "status")
         _list path;
     target = option_of_yojson (value_for_key deployment_target_of_yojson "target") _list path;
     greengrass_group_name =
       option_of_yojson (value_for_key group_name_of_yojson "greengrassGroupName") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
     greengrass_group_id =
       option_of_yojson (value_for_key greengrass_group_id_of_yojson "greengrassGroupId") _list path;
     greengrass_group_version_id =
       option_of_yojson
         (value_for_key greengrass_group_version_id_of_yojson "greengrassGroupVersionId")
         _list path;
   }
    : system_instance_summary)

let create_system_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary =
       option_of_yojson (value_for_key system_instance_summary_of_yojson "summary") _list path;
   }
    : create_system_instance_response)

let role_arn_of_yojson = string_of_yojson
let enabled_of_yojson = bool_of_yojson

let metrics_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_metric_enabled =
       option_of_yojson (value_for_key enabled_of_yojson "cloudMetricEnabled") _list path;
     metric_rule_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "metricRuleRoleArn") _list path;
   }
    : metrics_configuration)

let s3_bucket_name_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "key" _list path;
     value = value_for_key tag_value_of_yojson "value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let create_system_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     definition = value_for_key definition_document_of_yojson "definition" _list path;
     target = value_for_key deployment_target_of_yojson "target" _list path;
     greengrass_group_name =
       option_of_yojson (value_for_key group_name_of_yojson "greengrassGroupName") _list path;
     s3_bucket_name =
       option_of_yojson (value_for_key s3_bucket_name_of_yojson "s3BucketName") _list path;
     metrics_configuration =
       option_of_yojson
         (value_for_key metrics_configuration_of_yojson "metricsConfiguration")
         _list path;
     flow_actions_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "flowActionsRoleArn") _list path;
   }
    : create_system_instance_request)

let system_template_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key urn_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     revision_number =
       option_of_yojson (value_for_key version_of_yojson "revisionNumber") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
   }
    : system_template_summary)

let create_system_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary =
       option_of_yojson (value_for_key system_template_summary_of_yojson "summary") _list path;
   }
    : create_system_template_response)

let create_system_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     definition = value_for_key definition_document_of_yojson "definition" _list path;
     compatible_namespace_version =
       option_of_yojson (value_for_key version_of_yojson "compatibleNamespaceVersion") _list path;
   }
    : create_system_template_request)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_in_use_exception)

let delete_flow_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_flow_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key urn_of_yojson "id" _list path } : delete_flow_template_request)

let namespace_name_of_yojson = string_of_yojson

let delete_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace_arn = option_of_yojson (value_for_key arn_of_yojson "namespaceArn") _list path;
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
   }
    : delete_namespace_response)

let delete_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_system_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_system_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = option_of_yojson (value_for_key urn_of_yojson "id") _list path }
    : delete_system_instance_request)

let delete_system_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_system_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key urn_of_yojson "id" _list path } : delete_system_template_request)

let dependency_revision_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key urn_of_yojson "id") _list path;
     revision_number =
       option_of_yojson (value_for_key version_of_yojson "revisionNumber") _list path;
   }
    : dependency_revision)

let dependency_revisions_of_yojson tree path =
  list_of_yojson dependency_revision_of_yojson tree path

let greengrass_deployment_id_of_yojson = string_of_yojson

let deploy_system_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary = value_for_key system_instance_summary_of_yojson "summary" _list path;
     greengrass_deployment_id =
       option_of_yojson
         (value_for_key greengrass_deployment_id_of_yojson "greengrassDeploymentId")
         _list path;
   }
    : deploy_system_instance_response)

let deploy_system_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = option_of_yojson (value_for_key urn_of_yojson "id") _list path }
    : deploy_system_instance_request)

let deprecate_existing_entities_of_yojson = bool_of_yojson

let deprecate_flow_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let deprecate_flow_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key urn_of_yojson "id" _list path } : deprecate_flow_template_request)

let deprecate_system_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let deprecate_system_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key urn_of_yojson "id" _list path } : deprecate_system_template_request)

let describe_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace_arn = option_of_yojson (value_for_key arn_of_yojson "namespaceArn") _list path;
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
     tracking_namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "trackingNamespaceName") _list path;
     tracking_namespace_version =
       option_of_yojson (value_for_key version_of_yojson "trackingNamespaceVersion") _list path;
     namespace_version =
       option_of_yojson (value_for_key version_of_yojson "namespaceVersion") _list path;
   }
    : describe_namespace_response)

let describe_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
   }
    : describe_namespace_request)

let dissociate_entity_from_thing_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let entity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEVICE" -> DEVICE
    | `String "SERVICE" -> SERVICE
    | `String "DEVICE_MODEL" -> DEVICE_MODEL
    | `String "CAPABILITY" -> CAPABILITY
    | `String "STATE" -> STATE
    | `String "ACTION" -> ACTION
    | `String "EVENT" -> EVENT
    | `String "PROPERTY" -> PROPERTY
    | `String "MAPPING" -> MAPPING
    | `String "ENUM" -> ENUM
    | `String value -> raise (deserialize_unknown_enum_value_error path "EntityType" value)
    | _ -> raise (deserialize_wrong_type_error path "EntityType")
     : entity_type)
    : entity_type)

let dissociate_entity_from_thing_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     thing_name = value_for_key thing_name_of_yojson "thingName" _list path;
     entity_type = value_for_key entity_type_of_yojson "entityType" _list path;
   }
    : dissociate_entity_from_thing_request)

let entity_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key urn_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     type_ = option_of_yojson (value_for_key entity_type_of_yojson "type") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     definition =
       option_of_yojson (value_for_key definition_document_of_yojson "definition") _list path;
   }
    : entity_description)

let entity_descriptions_of_yojson tree path = list_of_yojson entity_description_of_yojson tree path
let entity_filter_value_of_yojson = string_of_yojson

let entity_filter_values_of_yojson tree path =
  list_of_yojson entity_filter_value_of_yojson tree path

let entity_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "NAME" -> NAME
    | `String "NAMESPACE" -> NAMESPACE
    | `String "SEMANTIC_TYPE_PATH" -> SEMANTIC_TYPE_PATH
    | `String "REFERENCED_ENTITY_ID" -> REFERENCED_ENTITY_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "EntityFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "EntityFilterName")
     : entity_filter_name)
    : entity_filter_name)

let entity_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key entity_filter_name_of_yojson "name") _list path;
     value = option_of_yojson (value_for_key entity_filter_values_of_yojson "value") _list path;
   }
    : entity_filter)

let entity_filters_of_yojson tree path = list_of_yojson entity_filter_of_yojson tree path
let entity_types_of_yojson tree path = list_of_yojson entity_type_of_yojson tree path

let flow_execution_event_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXECUTION_STARTED" -> EXECUTION_STARTED
    | `String "EXECUTION_FAILED" -> EXECUTION_FAILED
    | `String "EXECUTION_ABORTED" -> EXECUTION_ABORTED
    | `String "EXECUTION_SUCCEEDED" -> EXECUTION_SUCCEEDED
    | `String "STEP_STARTED" -> STEP_STARTED
    | `String "STEP_FAILED" -> STEP_FAILED
    | `String "STEP_SUCCEEDED" -> STEP_SUCCEEDED
    | `String "ACTIVITY_SCHEDULED" -> ACTIVITY_SCHEDULED
    | `String "ACTIVITY_STARTED" -> ACTIVITY_STARTED
    | `String "ACTIVITY_FAILED" -> ACTIVITY_FAILED
    | `String "ACTIVITY_SUCCEEDED" -> ACTIVITY_SUCCEEDED
    | `String "START_FLOW_EXECUTION_TASK" -> START_FLOW_EXECUTION_TASK
    | `String "SCHEDULE_NEXT_READY_STEPS_TASK" -> SCHEDULE_NEXT_READY_STEPS_TASK
    | `String "THING_ACTION_TASK" -> THING_ACTION_TASK
    | `String "THING_ACTION_TASK_FAILED" -> THING_ACTION_TASK_FAILED
    | `String "THING_ACTION_TASK_SUCCEEDED" -> THING_ACTION_TASK_SUCCEEDED
    | `String "ACKNOWLEDGE_TASK_MESSAGE" -> ACKNOWLEDGE_TASK_MESSAGE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FlowExecutionEventType" value)
    | _ -> raise (deserialize_wrong_type_error path "FlowExecutionEventType")
     : flow_execution_event_type)
    : flow_execution_event_type)

let flow_execution_id_of_yojson = string_of_yojson
let flow_execution_message_payload_of_yojson = string_of_yojson
let flow_execution_message_id_of_yojson = string_of_yojson

let flow_execution_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message_id =
       option_of_yojson (value_for_key flow_execution_message_id_of_yojson "messageId") _list path;
     event_type =
       option_of_yojson (value_for_key flow_execution_event_type_of_yojson "eventType") _list path;
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "timestamp") _list path;
     payload =
       option_of_yojson
         (value_for_key flow_execution_message_payload_of_yojson "payload")
         _list path;
   }
    : flow_execution_message)

let flow_execution_messages_of_yojson tree path =
  list_of_yojson flow_execution_message_of_yojson tree path

let flow_execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "RUNNING" -> RUNNING
    | `String "ABORTED" -> ABORTED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "FlowExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "FlowExecutionStatus")
     : flow_execution_status)
    : flow_execution_status)

let flow_execution_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flow_execution_id =
       option_of_yojson (value_for_key flow_execution_id_of_yojson "flowExecutionId") _list path;
     status = option_of_yojson (value_for_key flow_execution_status_of_yojson "status") _list path;
     system_instance_id =
       option_of_yojson (value_for_key urn_of_yojson "systemInstanceId") _list path;
     flow_template_id = option_of_yojson (value_for_key urn_of_yojson "flowTemplateId") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
   }
    : flow_execution_summary)

let flow_execution_summaries_of_yojson tree path =
  list_of_yojson flow_execution_summary_of_yojson tree path

let flow_template_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary = option_of_yojson (value_for_key flow_template_summary_of_yojson "summary") _list path;
     definition =
       option_of_yojson (value_for_key definition_document_of_yojson "definition") _list path;
     validated_namespace_version =
       option_of_yojson (value_for_key version_of_yojson "validatedNamespaceVersion") _list path;
   }
    : flow_template_description)

let flow_template_filter_value_of_yojson = string_of_yojson

let flow_template_filter_values_of_yojson tree path =
  list_of_yojson flow_template_filter_value_of_yojson tree path

let flow_template_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEVICE_MODEL_ID" -> DEVICE_MODEL_ID
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FlowTemplateFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "FlowTemplateFilterName")
     : flow_template_filter_name)
    : flow_template_filter_name)

let flow_template_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key flow_template_filter_name_of_yojson "name" _list path;
     value = value_for_key flow_template_filter_values_of_yojson "value" _list path;
   }
    : flow_template_filter)

let flow_template_filters_of_yojson tree path =
  list_of_yojson flow_template_filter_of_yojson tree path

let flow_template_summaries_of_yojson tree path =
  list_of_yojson flow_template_summary_of_yojson tree path

let get_entities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     descriptions =
       option_of_yojson (value_for_key entity_descriptions_of_yojson "descriptions") _list path;
   }
    : get_entities_response)

let urns_of_yojson tree path = list_of_yojson urn_of_yojson tree path

let get_entities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ids = value_for_key urns_of_yojson "ids" _list path;
     namespace_version =
       option_of_yojson (value_for_key version_of_yojson "namespaceVersion") _list path;
   }
    : get_entities_request)

let get_flow_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key flow_template_description_of_yojson "description") _list path;
   }
    : get_flow_template_response)

let get_flow_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key urn_of_yojson "id" _list path;
     revision_number =
       option_of_yojson (value_for_key version_of_yojson "revisionNumber") _list path;
   }
    : get_flow_template_request)

let next_token_of_yojson = string_of_yojson

let get_flow_template_revisions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summaries =
       option_of_yojson (value_for_key flow_template_summaries_of_yojson "summaries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_flow_template_revisions_response)

let max_results_of_yojson = int_of_yojson

let get_flow_template_revisions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key urn_of_yojson "id" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : get_flow_template_revisions_request)

let string__of_yojson = string_of_yojson

let namespace_deletion_status_error_codes_of_yojson (tree : t) path =
  ((match tree with
    | `String "VALIDATION_FAILED" -> VALIDATION_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NamespaceDeletionStatusErrorCodes" value)
    | _ -> raise (deserialize_wrong_type_error path "NamespaceDeletionStatusErrorCodes")
     : namespace_deletion_status_error_codes)
    : namespace_deletion_status_error_codes)

let namespace_deletion_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NamespaceDeletionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "NamespaceDeletionStatus")
     : namespace_deletion_status)
    : namespace_deletion_status)

let get_namespace_deletion_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace_arn = option_of_yojson (value_for_key arn_of_yojson "namespaceArn") _list path;
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
     status =
       option_of_yojson (value_for_key namespace_deletion_status_of_yojson "status") _list path;
     error_code =
       option_of_yojson
         (value_for_key namespace_deletion_status_error_codes_of_yojson "errorCode")
         _list path;
     error_message = option_of_yojson (value_for_key string__of_yojson "errorMessage") _list path;
   }
    : get_namespace_deletion_status_response)

let get_namespace_deletion_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let system_instance_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary =
       option_of_yojson (value_for_key system_instance_summary_of_yojson "summary") _list path;
     definition =
       option_of_yojson (value_for_key definition_document_of_yojson "definition") _list path;
     s3_bucket_name =
       option_of_yojson (value_for_key s3_bucket_name_of_yojson "s3BucketName") _list path;
     metrics_configuration =
       option_of_yojson
         (value_for_key metrics_configuration_of_yojson "metricsConfiguration")
         _list path;
     validated_namespace_version =
       option_of_yojson (value_for_key version_of_yojson "validatedNamespaceVersion") _list path;
     validated_dependency_revisions =
       option_of_yojson
         (value_for_key dependency_revisions_of_yojson "validatedDependencyRevisions")
         _list path;
     flow_actions_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "flowActionsRoleArn") _list path;
   }
    : system_instance_description)

let get_system_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson
         (value_for_key system_instance_description_of_yojson "description")
         _list path;
   }
    : get_system_instance_response)

let get_system_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key urn_of_yojson "id" _list path } : get_system_instance_request)

let system_template_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary =
       option_of_yojson (value_for_key system_template_summary_of_yojson "summary") _list path;
     definition =
       option_of_yojson (value_for_key definition_document_of_yojson "definition") _list path;
     validated_namespace_version =
       option_of_yojson (value_for_key version_of_yojson "validatedNamespaceVersion") _list path;
   }
    : system_template_description)

let get_system_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson
         (value_for_key system_template_description_of_yojson "description")
         _list path;
   }
    : get_system_template_response)

let get_system_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key urn_of_yojson "id" _list path;
     revision_number =
       option_of_yojson (value_for_key version_of_yojson "revisionNumber") _list path;
   }
    : get_system_template_request)

let system_template_summaries_of_yojson tree path =
  list_of_yojson system_template_summary_of_yojson tree path

let get_system_template_revisions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summaries =
       option_of_yojson (value_for_key system_template_summaries_of_yojson "summaries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_system_template_revisions_response)

let get_system_template_revisions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key urn_of_yojson "id" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : get_system_template_revisions_request)

let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let upload_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "UploadStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "UploadStatus")
     : upload_status)
    : upload_status)

let upload_id_of_yojson = string_of_yojson

let get_upload_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     upload_id = value_for_key upload_id_of_yojson "uploadId" _list path;
     upload_status = value_for_key upload_status_of_yojson "uploadStatus" _list path;
     namespace_arn = option_of_yojson (value_for_key arn_of_yojson "namespaceArn") _list path;
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
     namespace_version =
       option_of_yojson (value_for_key version_of_yojson "namespaceVersion") _list path;
     failure_reason =
       option_of_yojson (value_for_key string_list_of_yojson "failureReason") _list path;
     created_date = value_for_key timestamp_of_yojson "createdDate" _list path;
   }
    : get_upload_status_response)

let get_upload_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ upload_id = value_for_key upload_id_of_yojson "uploadId" _list path }
    : get_upload_status_request)

let upload_entity_definitions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ upload_id = value_for_key upload_id_of_yojson "uploadId" _list path }
    : upload_entity_definitions_response)

let sync_with_public_namespace_of_yojson = bool_of_yojson

let upload_entity_definitions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document = option_of_yojson (value_for_key definition_document_of_yojson "document") _list path;
     sync_with_public_namespace =
       option_of_yojson
         (value_for_key sync_with_public_namespace_of_yojson "syncWithPublicNamespace")
         _list path;
     deprecate_existing_entities =
       option_of_yojson
         (value_for_key deprecate_existing_entities_of_yojson "deprecateExistingEntities")
         _list path;
   }
    : upload_entity_definitions_request)

let update_system_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary =
       option_of_yojson (value_for_key system_template_summary_of_yojson "summary") _list path;
   }
    : update_system_template_response)

let update_system_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key urn_of_yojson "id" _list path;
     definition = value_for_key definition_document_of_yojson "definition" _list path;
     compatible_namespace_version =
       option_of_yojson (value_for_key version_of_yojson "compatibleNamespaceVersion") _list path;
   }
    : update_system_template_request)

let update_flow_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary = option_of_yojson (value_for_key flow_template_summary_of_yojson "summary") _list path;
   }
    : update_flow_template_response)

let update_flow_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key urn_of_yojson "id" _list path;
     definition = value_for_key definition_document_of_yojson "definition" _list path;
     compatible_namespace_version =
       option_of_yojson (value_for_key version_of_yojson "compatibleNamespaceVersion") _list path;
   }
    : update_flow_template_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let resource_arn_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
   }
    : untag_resource_request)

let undeploy_system_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary =
       option_of_yojson (value_for_key system_instance_summary_of_yojson "summary") _list path;
   }
    : undeploy_system_instance_response)

let undeploy_system_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = option_of_yojson (value_for_key urn_of_yojson "id") _list path }
    : undeploy_system_instance_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "tags" _list path;
   }
    : tag_resource_request)

let thing_arn_of_yojson = string_of_yojson

let thing_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     thing_arn = option_of_yojson (value_for_key thing_arn_of_yojson "thingArn") _list path;
     thing_name = option_of_yojson (value_for_key thing_name_of_yojson "thingName") _list path;
   }
    : thing)

let things_of_yojson tree path = list_of_yojson thing_of_yojson tree path

let search_things_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     things = option_of_yojson (value_for_key things_of_yojson "things") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : search_things_response)

let search_things_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_id = value_for_key urn_of_yojson "entityId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     namespace_version =
       option_of_yojson (value_for_key version_of_yojson "namespaceVersion") _list path;
   }
    : search_things_request)

let search_system_templates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summaries =
       option_of_yojson (value_for_key system_template_summaries_of_yojson "summaries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : search_system_templates_response)

let system_template_filter_value_of_yojson = string_of_yojson

let system_template_filter_values_of_yojson tree path =
  list_of_yojson system_template_filter_value_of_yojson tree path

let system_template_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "FLOW_TEMPLATE_ID" -> FLOW_TEMPLATE_ID
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SystemTemplateFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "SystemTemplateFilterName")
     : system_template_filter_name)
    : system_template_filter_name)

let system_template_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key system_template_filter_name_of_yojson "name" _list path;
     value = value_for_key system_template_filter_values_of_yojson "value" _list path;
   }
    : system_template_filter)

let system_template_filters_of_yojson tree path =
  list_of_yojson system_template_filter_of_yojson tree path

let search_system_templates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson (value_for_key system_template_filters_of_yojson "filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : search_system_templates_request)

let system_instance_summaries_of_yojson tree path =
  list_of_yojson system_instance_summary_of_yojson tree path

let search_system_instances_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summaries =
       option_of_yojson (value_for_key system_instance_summaries_of_yojson "summaries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : search_system_instances_response)

let system_instance_filter_value_of_yojson = string_of_yojson

let system_instance_filter_values_of_yojson tree path =
  list_of_yojson system_instance_filter_value_of_yojson tree path

let system_instance_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "SYSTEM_TEMPLATE_ID" -> SYSTEM_TEMPLATE_ID
    | `String "STATUS" -> STATUS
    | `String "GREENGRASS_GROUP_NAME" -> GREENGRASS_GROUP_NAME
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SystemInstanceFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "SystemInstanceFilterName")
     : system_instance_filter_name)
    : system_instance_filter_name)

let system_instance_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key system_instance_filter_name_of_yojson "name") _list path;
     value =
       option_of_yojson (value_for_key system_instance_filter_values_of_yojson "value") _list path;
   }
    : system_instance_filter)

let system_instance_filters_of_yojson tree path =
  list_of_yojson system_instance_filter_of_yojson tree path

let search_system_instances_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson (value_for_key system_instance_filters_of_yojson "filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : search_system_instances_request)

let search_flow_templates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summaries =
       option_of_yojson (value_for_key flow_template_summaries_of_yojson "summaries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : search_flow_templates_response)

let search_flow_templates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key flow_template_filters_of_yojson "filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : search_flow_templates_request)

let search_flow_executions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summaries =
       option_of_yojson (value_for_key flow_execution_summaries_of_yojson "summaries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : search_flow_executions_response)

let search_flow_executions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     system_instance_id = value_for_key urn_of_yojson "systemInstanceId" _list path;
     flow_execution_id =
       option_of_yojson (value_for_key flow_execution_id_of_yojson "flowExecutionId") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : search_flow_executions_request)

let search_entities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     descriptions =
       option_of_yojson (value_for_key entity_descriptions_of_yojson "descriptions") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : search_entities_response)

let search_entities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_types = value_for_key entity_types_of_yojson "entityTypes" _list path;
     filters = option_of_yojson (value_for_key entity_filters_of_yojson "filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     namespace_version =
       option_of_yojson (value_for_key version_of_yojson "namespaceVersion") _list path;
   }
    : search_entities_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_tags_for_resource_request)

let list_flow_execution_messages_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     messages =
       option_of_yojson (value_for_key flow_execution_messages_of_yojson "messages") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_flow_execution_messages_response)

let list_flow_execution_messages_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flow_execution_id = value_for_key flow_execution_id_of_yojson "flowExecutionId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_flow_execution_messages_request)
