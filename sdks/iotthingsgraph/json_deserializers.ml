open Smaws_Lib.Json.DeserializeHelpers
open Types

let version_of_yojson = long_of_yojson
let urn_of_yojson = string_of_yojson
let urns_of_yojson tree path = list_of_yojson urn_of_yojson tree path

let upload_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "UploadStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "UploadStatus")
     : upload_status)
    : upload_status)

let upload_id_of_yojson = string_of_yojson

let upload_entity_definitions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ upload_id = value_for_key upload_id_of_yojson "uploadId" _list path }
    : upload_entity_definitions_response)

let definition_language_of_yojson (tree : t) path =
  ((match tree with
    | `String "GRAPHQL" -> GRAPHQL
    | `String value -> raise (deserialize_unknown_enum_value_error path "DefinitionLanguage" value)
    | _ -> raise (deserialize_wrong_type_error path "DefinitionLanguage")
     : definition_language)
    : definition_language)

let definition_text_of_yojson = string_of_yojson

let definition_document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = value_for_key definition_text_of_yojson "text" _list path;
     language = value_for_key definition_language_of_yojson "language" _list path;
   }
    : definition_document)

let sync_with_public_namespace_of_yojson = bool_of_yojson
let deprecate_existing_entities_of_yojson = bool_of_yojson

let upload_entity_definitions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deprecate_existing_entities =
       option_of_yojson
         (value_for_key deprecate_existing_entities_of_yojson "deprecateExistingEntities")
         _list path;
     sync_with_public_namespace =
       option_of_yojson
         (value_for_key sync_with_public_namespace_of_yojson "syncWithPublicNamespace")
         _list path;
     document = option_of_yojson (value_for_key definition_document_of_yojson "document") _list path;
   }
    : upload_entity_definitions_request)

let error_message_of_yojson = string_of_yojson

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : throttling_exception)

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_request_exception)

let internal_failure_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : internal_failure_exception)

let arn_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let system_template_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     revision_number =
       option_of_yojson (value_for_key version_of_yojson "revisionNumber") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     id = option_of_yojson (value_for_key urn_of_yojson "id") _list path;
   }
    : system_template_summary)

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
     compatible_namespace_version =
       option_of_yojson (value_for_key version_of_yojson "compatibleNamespaceVersion") _list path;
     definition = value_for_key definition_document_of_yojson "definition" _list path;
     id = value_for_key urn_of_yojson "id" _list path;
   }
    : update_system_template_request)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_not_found_exception)

let flow_template_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     revision_number =
       option_of_yojson (value_for_key version_of_yojson "revisionNumber") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     id = option_of_yojson (value_for_key urn_of_yojson "id") _list path;
   }
    : flow_template_summary)

let update_flow_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary = option_of_yojson (value_for_key flow_template_summary_of_yojson "summary") _list path;
   }
    : update_flow_template_response)

let update_flow_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compatible_namespace_version =
       option_of_yojson (value_for_key version_of_yojson "compatibleNamespaceVersion") _list path;
     definition = value_for_key definition_document_of_yojson "definition" _list path;
     id = value_for_key urn_of_yojson "id" _list path;
   }
    : update_flow_template_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_arn_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
   }
    : untag_resource_request)

let resource_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_already_exists_exception)

let system_instance_deployment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETED_IN_TARGET" -> DELETED_IN_TARGET
    | `String "PENDING_DELETE" -> PENDING_DELETE
    | `String "FAILED" -> FAILED
    | `String "UNDEPLOY_IN_PROGRESS" -> UNDEPLOY_IN_PROGRESS
    | `String "DEPLOYED_IN_TARGET" -> DEPLOYED_IN_TARGET
    | `String "DEPLOY_IN_PROGRESS" -> DEPLOY_IN_PROGRESS
    | `String "BOOTSTRAP" -> BOOTSTRAP
    | `String "NOT_DEPLOYED" -> NOT_DEPLOYED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SystemInstanceDeploymentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SystemInstanceDeploymentStatus")
     : system_instance_deployment_status)
    : system_instance_deployment_status)

let deployment_target_of_yojson (tree : t) path =
  ((match tree with
    | `String "CLOUD" -> CLOUD
    | `String "GREENGRASS" -> GREENGRASS
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeploymentTarget" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentTarget")
     : deployment_target)
    : deployment_target)

let group_name_of_yojson = string_of_yojson
let greengrass_group_id_of_yojson = string_of_yojson
let greengrass_group_version_id_of_yojson = string_of_yojson

let system_instance_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     greengrass_group_version_id =
       option_of_yojson
         (value_for_key greengrass_group_version_id_of_yojson "greengrassGroupVersionId")
         _list path;
     greengrass_group_id =
       option_of_yojson (value_for_key greengrass_group_id_of_yojson "greengrassGroupId") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     greengrass_group_name =
       option_of_yojson (value_for_key group_name_of_yojson "greengrassGroupName") _list path;
     target = option_of_yojson (value_for_key deployment_target_of_yojson "target") _list path;
     status =
       option_of_yojson
         (value_for_key system_instance_deployment_status_of_yojson "status")
         _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     id = option_of_yojson (value_for_key urn_of_yojson "id") _list path;
   }
    : system_instance_summary)

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

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_in_use_exception)

let thing_arn_of_yojson = string_of_yojson
let thing_name_of_yojson = string_of_yojson

let thing_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     thing_name = option_of_yojson (value_for_key thing_name_of_yojson "thingName") _list path;
     thing_arn = option_of_yojson (value_for_key thing_arn_of_yojson "thingArn") _list path;
   }
    : thing)

let things_of_yojson tree path = list_of_yojson thing_of_yojson tree path
let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "value" _list path;
     key = value_for_key tag_key_of_yojson "key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "tags" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
   }
    : tag_resource_request)

let system_template_summaries_of_yojson tree path =
  list_of_yojson system_template_summary_of_yojson tree path

let system_template_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "FLOW_TEMPLATE_ID" -> FLOW_TEMPLATE_ID
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SystemTemplateFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "SystemTemplateFilterName")
     : system_template_filter_name)
    : system_template_filter_name)

let system_template_filter_value_of_yojson = string_of_yojson

let system_template_filter_values_of_yojson tree path =
  list_of_yojson system_template_filter_value_of_yojson tree path

let system_template_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key system_template_filter_values_of_yojson "value" _list path;
     name = value_for_key system_template_filter_name_of_yojson "name" _list path;
   }
    : system_template_filter)

let system_template_filters_of_yojson tree path =
  list_of_yojson system_template_filter_of_yojson tree path

let system_template_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     validated_namespace_version =
       option_of_yojson (value_for_key version_of_yojson "validatedNamespaceVersion") _list path;
     definition =
       option_of_yojson (value_for_key definition_document_of_yojson "definition") _list path;
     summary =
       option_of_yojson (value_for_key system_template_summary_of_yojson "summary") _list path;
   }
    : system_template_description)

let system_instance_summaries_of_yojson tree path =
  list_of_yojson system_instance_summary_of_yojson tree path

let system_instance_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "GREENGRASS_GROUP_NAME" -> GREENGRASS_GROUP_NAME
    | `String "STATUS" -> STATUS
    | `String "SYSTEM_TEMPLATE_ID" -> SYSTEM_TEMPLATE_ID
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SystemInstanceFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "SystemInstanceFilterName")
     : system_instance_filter_name)
    : system_instance_filter_name)

let system_instance_filter_value_of_yojson = string_of_yojson

let system_instance_filter_values_of_yojson tree path =
  list_of_yojson system_instance_filter_value_of_yojson tree path

let system_instance_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       option_of_yojson (value_for_key system_instance_filter_values_of_yojson "value") _list path;
     name = option_of_yojson (value_for_key system_instance_filter_name_of_yojson "name") _list path;
   }
    : system_instance_filter)

let system_instance_filters_of_yojson tree path =
  list_of_yojson system_instance_filter_of_yojson tree path

let s3_bucket_name_of_yojson = string_of_yojson
let enabled_of_yojson = bool_of_yojson
let role_arn_of_yojson = string_of_yojson

let metrics_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_rule_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "metricRuleRoleArn") _list path;
     cloud_metric_enabled =
       option_of_yojson (value_for_key enabled_of_yojson "cloudMetricEnabled") _list path;
   }
    : metrics_configuration)

let dependency_revision_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision_number =
       option_of_yojson (value_for_key version_of_yojson "revisionNumber") _list path;
     id = option_of_yojson (value_for_key urn_of_yojson "id") _list path;
   }
    : dependency_revision)

let dependency_revisions_of_yojson tree path =
  list_of_yojson dependency_revision_of_yojson tree path

let system_instance_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flow_actions_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "flowActionsRoleArn") _list path;
     validated_dependency_revisions =
       option_of_yojson
         (value_for_key dependency_revisions_of_yojson "validatedDependencyRevisions")
         _list path;
     validated_namespace_version =
       option_of_yojson (value_for_key version_of_yojson "validatedNamespaceVersion") _list path;
     metrics_configuration =
       option_of_yojson
         (value_for_key metrics_configuration_of_yojson "metricsConfiguration")
         _list path;
     s3_bucket_name =
       option_of_yojson (value_for_key s3_bucket_name_of_yojson "s3BucketName") _list path;
     definition =
       option_of_yojson (value_for_key definition_document_of_yojson "definition") _list path;
     summary =
       option_of_yojson (value_for_key system_instance_summary_of_yojson "summary") _list path;
   }
    : system_instance_description)

let string__of_yojson = string_of_yojson
let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path
let next_token_of_yojson = string_of_yojson

let search_things_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     things = option_of_yojson (value_for_key things_of_yojson "things") _list path;
   }
    : search_things_response)

let max_results_of_yojson = int_of_yojson

let search_things_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace_version =
       option_of_yojson (value_for_key version_of_yojson "namespaceVersion") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     entity_id = value_for_key urn_of_yojson "entityId" _list path;
   }
    : search_things_request)

let search_system_templates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     summaries =
       option_of_yojson (value_for_key system_template_summaries_of_yojson "summaries") _list path;
   }
    : search_system_templates_response)

let search_system_templates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     filters =
       option_of_yojson (value_for_key system_template_filters_of_yojson "filters") _list path;
   }
    : search_system_templates_request)

let search_system_instances_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     summaries =
       option_of_yojson (value_for_key system_instance_summaries_of_yojson "summaries") _list path;
   }
    : search_system_instances_response)

let search_system_instances_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     filters =
       option_of_yojson (value_for_key system_instance_filters_of_yojson "filters") _list path;
   }
    : search_system_instances_request)

let flow_template_summaries_of_yojson tree path =
  list_of_yojson flow_template_summary_of_yojson tree path

let search_flow_templates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     summaries =
       option_of_yojson (value_for_key flow_template_summaries_of_yojson "summaries") _list path;
   }
    : search_flow_templates_response)

let flow_template_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEVICE_MODEL_ID" -> DEVICE_MODEL_ID
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FlowTemplateFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "FlowTemplateFilterName")
     : flow_template_filter_name)
    : flow_template_filter_name)

let flow_template_filter_value_of_yojson = string_of_yojson

let flow_template_filter_values_of_yojson tree path =
  list_of_yojson flow_template_filter_value_of_yojson tree path

let flow_template_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key flow_template_filter_values_of_yojson "value" _list path;
     name = value_for_key flow_template_filter_name_of_yojson "name" _list path;
   }
    : flow_template_filter)

let flow_template_filters_of_yojson tree path =
  list_of_yojson flow_template_filter_of_yojson tree path

let search_flow_templates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     filters = option_of_yojson (value_for_key flow_template_filters_of_yojson "filters") _list path;
   }
    : search_flow_templates_request)

let flow_execution_id_of_yojson = string_of_yojson

let flow_execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "ABORTED" -> ABORTED
    | `String "RUNNING" -> RUNNING
    | `String value -> raise (deserialize_unknown_enum_value_error path "FlowExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "FlowExecutionStatus")
     : flow_execution_status)
    : flow_execution_status)

let flow_execution_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     flow_template_id = option_of_yojson (value_for_key urn_of_yojson "flowTemplateId") _list path;
     system_instance_id =
       option_of_yojson (value_for_key urn_of_yojson "systemInstanceId") _list path;
     status = option_of_yojson (value_for_key flow_execution_status_of_yojson "status") _list path;
     flow_execution_id =
       option_of_yojson (value_for_key flow_execution_id_of_yojson "flowExecutionId") _list path;
   }
    : flow_execution_summary)

let flow_execution_summaries_of_yojson tree path =
  list_of_yojson flow_execution_summary_of_yojson tree path

let search_flow_executions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     summaries =
       option_of_yojson (value_for_key flow_execution_summaries_of_yojson "summaries") _list path;
   }
    : search_flow_executions_response)

let search_flow_executions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     flow_execution_id =
       option_of_yojson (value_for_key flow_execution_id_of_yojson "flowExecutionId") _list path;
     system_instance_id = value_for_key urn_of_yojson "systemInstanceId" _list path;
   }
    : search_flow_executions_request)

let entity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENUM" -> ENUM
    | `String "MAPPING" -> MAPPING
    | `String "PROPERTY" -> PROPERTY
    | `String "EVENT" -> EVENT
    | `String "ACTION" -> ACTION
    | `String "STATE" -> STATE
    | `String "CAPABILITY" -> CAPABILITY
    | `String "DEVICE_MODEL" -> DEVICE_MODEL
    | `String "SERVICE" -> SERVICE
    | `String "DEVICE" -> DEVICE
    | `String value -> raise (deserialize_unknown_enum_value_error path "EntityType" value)
    | _ -> raise (deserialize_wrong_type_error path "EntityType")
     : entity_type)
    : entity_type)

let entity_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     definition =
       option_of_yojson (value_for_key definition_document_of_yojson "definition") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     type_ = option_of_yojson (value_for_key entity_type_of_yojson "type") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     id = option_of_yojson (value_for_key urn_of_yojson "id") _list path;
   }
    : entity_description)

let entity_descriptions_of_yojson tree path = list_of_yojson entity_description_of_yojson tree path

let search_entities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     descriptions =
       option_of_yojson (value_for_key entity_descriptions_of_yojson "descriptions") _list path;
   }
    : search_entities_response)

let entity_types_of_yojson tree path = list_of_yojson entity_type_of_yojson tree path

let entity_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "REFERENCED_ENTITY_ID" -> REFERENCED_ENTITY_ID
    | `String "SEMANTIC_TYPE_PATH" -> SEMANTIC_TYPE_PATH
    | `String "NAMESPACE" -> NAMESPACE
    | `String "NAME" -> NAME
    | `String value -> raise (deserialize_unknown_enum_value_error path "EntityFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "EntityFilterName")
     : entity_filter_name)
    : entity_filter_name)

let entity_filter_value_of_yojson = string_of_yojson

let entity_filter_values_of_yojson tree path =
  list_of_yojson entity_filter_value_of_yojson tree path

let entity_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key entity_filter_values_of_yojson "value") _list path;
     name = option_of_yojson (value_for_key entity_filter_name_of_yojson "name") _list path;
   }
    : entity_filter)

let entity_filters_of_yojson tree path = list_of_yojson entity_filter_of_yojson tree path

let search_entities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace_version =
       option_of_yojson (value_for_key version_of_yojson "namespaceVersion") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     filters = option_of_yojson (value_for_key entity_filters_of_yojson "filters") _list path;
     entity_types = value_for_key entity_types_of_yojson "entityTypes" _list path;
   }
    : search_entities_request)

let namespace_name_of_yojson = string_of_yojson

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
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NamespaceDeletionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "NamespaceDeletionStatus")
     : namespace_deletion_status)
    : namespace_deletion_status)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_tags_for_resource_request)

let flow_execution_message_id_of_yojson = string_of_yojson

let flow_execution_event_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACKNOWLEDGE_TASK_MESSAGE" -> ACKNOWLEDGE_TASK_MESSAGE
    | `String "THING_ACTION_TASK_SUCCEEDED" -> THING_ACTION_TASK_SUCCEEDED
    | `String "THING_ACTION_TASK_FAILED" -> THING_ACTION_TASK_FAILED
    | `String "THING_ACTION_TASK" -> THING_ACTION_TASK
    | `String "SCHEDULE_NEXT_READY_STEPS_TASK" -> SCHEDULE_NEXT_READY_STEPS_TASK
    | `String "START_FLOW_EXECUTION_TASK" -> START_FLOW_EXECUTION_TASK
    | `String "ACTIVITY_SUCCEEDED" -> ACTIVITY_SUCCEEDED
    | `String "ACTIVITY_FAILED" -> ACTIVITY_FAILED
    | `String "ACTIVITY_STARTED" -> ACTIVITY_STARTED
    | `String "ACTIVITY_SCHEDULED" -> ACTIVITY_SCHEDULED
    | `String "STEP_SUCCEEDED" -> STEP_SUCCEEDED
    | `String "STEP_FAILED" -> STEP_FAILED
    | `String "STEP_STARTED" -> STEP_STARTED
    | `String "EXECUTION_SUCCEEDED" -> EXECUTION_SUCCEEDED
    | `String "EXECUTION_ABORTED" -> EXECUTION_ABORTED
    | `String "EXECUTION_FAILED" -> EXECUTION_FAILED
    | `String "EXECUTION_STARTED" -> EXECUTION_STARTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FlowExecutionEventType" value)
    | _ -> raise (deserialize_wrong_type_error path "FlowExecutionEventType")
     : flow_execution_event_type)
    : flow_execution_event_type)

let flow_execution_message_payload_of_yojson = string_of_yojson

let flow_execution_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payload =
       option_of_yojson
         (value_for_key flow_execution_message_payload_of_yojson "payload")
         _list path;
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "timestamp") _list path;
     event_type =
       option_of_yojson (value_for_key flow_execution_event_type_of_yojson "eventType") _list path;
     message_id =
       option_of_yojson (value_for_key flow_execution_message_id_of_yojson "messageId") _list path;
   }
    : flow_execution_message)

let flow_execution_messages_of_yojson tree path =
  list_of_yojson flow_execution_message_of_yojson tree path

let list_flow_execution_messages_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     messages =
       option_of_yojson (value_for_key flow_execution_messages_of_yojson "messages") _list path;
   }
    : list_flow_execution_messages_response)

let list_flow_execution_messages_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     flow_execution_id = value_for_key flow_execution_id_of_yojson "flowExecutionId" _list path;
   }
    : list_flow_execution_messages_request)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let get_upload_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_date = value_for_key timestamp_of_yojson "createdDate" _list path;
     failure_reason =
       option_of_yojson (value_for_key string_list_of_yojson "failureReason") _list path;
     namespace_version =
       option_of_yojson (value_for_key version_of_yojson "namespaceVersion") _list path;
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
     namespace_arn = option_of_yojson (value_for_key arn_of_yojson "namespaceArn") _list path;
     upload_status = value_for_key upload_status_of_yojson "uploadStatus" _list path;
     upload_id = value_for_key upload_id_of_yojson "uploadId" _list path;
   }
    : get_upload_status_response)

let get_upload_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ upload_id = value_for_key upload_id_of_yojson "uploadId" _list path }
    : get_upload_status_request)

let get_system_template_revisions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     summaries =
       option_of_yojson (value_for_key system_template_summaries_of_yojson "summaries") _list path;
   }
    : get_system_template_revisions_response)

let get_system_template_revisions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     id = value_for_key urn_of_yojson "id" _list path;
   }
    : get_system_template_revisions_request)

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
     revision_number =
       option_of_yojson (value_for_key version_of_yojson "revisionNumber") _list path;
     id = value_for_key urn_of_yojson "id" _list path;
   }
    : get_system_template_request)

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

let get_namespace_deletion_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message = option_of_yojson (value_for_key string__of_yojson "errorMessage") _list path;
     error_code =
       option_of_yojson
         (value_for_key namespace_deletion_status_error_codes_of_yojson "errorCode")
         _list path;
     status =
       option_of_yojson (value_for_key namespace_deletion_status_of_yojson "status") _list path;
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
     namespace_arn = option_of_yojson (value_for_key arn_of_yojson "namespaceArn") _list path;
   }
    : get_namespace_deletion_status_response)

let get_namespace_deletion_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_flow_template_revisions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     summaries =
       option_of_yojson (value_for_key flow_template_summaries_of_yojson "summaries") _list path;
   }
    : get_flow_template_revisions_response)

let get_flow_template_revisions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     id = value_for_key urn_of_yojson "id" _list path;
   }
    : get_flow_template_revisions_request)

let flow_template_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     validated_namespace_version =
       option_of_yojson (value_for_key version_of_yojson "validatedNamespaceVersion") _list path;
     definition =
       option_of_yojson (value_for_key definition_document_of_yojson "definition") _list path;
     summary = option_of_yojson (value_for_key flow_template_summary_of_yojson "summary") _list path;
   }
    : flow_template_description)

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
     revision_number =
       option_of_yojson (value_for_key version_of_yojson "revisionNumber") _list path;
     id = value_for_key urn_of_yojson "id" _list path;
   }
    : get_flow_template_request)

let get_entities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     descriptions =
       option_of_yojson (value_for_key entity_descriptions_of_yojson "descriptions") _list path;
   }
    : get_entities_response)

let get_entities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace_version =
       option_of_yojson (value_for_key version_of_yojson "namespaceVersion") _list path;
     ids = value_for_key urns_of_yojson "ids" _list path;
   }
    : get_entities_request)

let dissociate_entity_from_thing_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let dissociate_entity_from_thing_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_type = value_for_key entity_type_of_yojson "entityType" _list path;
     thing_name = value_for_key thing_name_of_yojson "thingName" _list path;
   }
    : dissociate_entity_from_thing_request)

let describe_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace_version =
       option_of_yojson (value_for_key version_of_yojson "namespaceVersion") _list path;
     tracking_namespace_version =
       option_of_yojson (value_for_key version_of_yojson "trackingNamespaceVersion") _list path;
     tracking_namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "trackingNamespaceName") _list path;
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
     namespace_arn = option_of_yojson (value_for_key arn_of_yojson "namespaceArn") _list path;
   }
    : describe_namespace_response)

let describe_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
   }
    : describe_namespace_request)

let deprecate_system_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let deprecate_system_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key urn_of_yojson "id" _list path } : deprecate_system_template_request)

let deprecate_flow_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let deprecate_flow_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key urn_of_yojson "id" _list path } : deprecate_flow_template_request)

let greengrass_deployment_id_of_yojson = string_of_yojson

let deploy_system_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     greengrass_deployment_id =
       option_of_yojson
         (value_for_key greengrass_deployment_id_of_yojson "greengrassDeploymentId")
         _list path;
     summary = value_for_key system_instance_summary_of_yojson "summary" _list path;
   }
    : deploy_system_instance_response)

let deploy_system_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = option_of_yojson (value_for_key urn_of_yojson "id") _list path }
    : deploy_system_instance_request)

let delete_system_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_system_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key urn_of_yojson "id" _list path } : delete_system_template_request)

let delete_system_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_system_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = option_of_yojson (value_for_key urn_of_yojson "id") _list path }
    : delete_system_instance_request)

let delete_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
     namespace_arn = option_of_yojson (value_for_key arn_of_yojson "namespaceArn") _list path;
   }
    : delete_namespace_response)

let delete_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_flow_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_flow_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key urn_of_yojson "id" _list path } : delete_flow_template_request)

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
     compatible_namespace_version =
       option_of_yojson (value_for_key version_of_yojson "compatibleNamespaceVersion") _list path;
     definition = value_for_key definition_document_of_yojson "definition" _list path;
   }
    : create_system_template_request)

let create_system_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary =
       option_of_yojson (value_for_key system_instance_summary_of_yojson "summary") _list path;
   }
    : create_system_instance_response)

let create_system_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flow_actions_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "flowActionsRoleArn") _list path;
     metrics_configuration =
       option_of_yojson
         (value_for_key metrics_configuration_of_yojson "metricsConfiguration")
         _list path;
     s3_bucket_name =
       option_of_yojson (value_for_key s3_bucket_name_of_yojson "s3BucketName") _list path;
     greengrass_group_name =
       option_of_yojson (value_for_key group_name_of_yojson "greengrassGroupName") _list path;
     target = value_for_key deployment_target_of_yojson "target" _list path;
     definition = value_for_key definition_document_of_yojson "definition" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_system_instance_request)

let create_flow_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary = option_of_yojson (value_for_key flow_template_summary_of_yojson "summary") _list path;
   }
    : create_flow_template_response)

let create_flow_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compatible_namespace_version =
       option_of_yojson (value_for_key version_of_yojson "compatibleNamespaceVersion") _list path;
     definition = value_for_key definition_document_of_yojson "definition" _list path;
   }
    : create_flow_template_request)

let associate_entity_to_thing_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_entity_to_thing_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace_version =
       option_of_yojson (value_for_key version_of_yojson "namespaceVersion") _list path;
     entity_id = value_for_key urn_of_yojson "entityId" _list path;
     thing_name = value_for_key thing_name_of_yojson "thingName" _list path;
   }
    : associate_entity_to_thing_request)
