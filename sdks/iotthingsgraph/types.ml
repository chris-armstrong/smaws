type nonrec version = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec urn = string [@@ocaml.doc ""]

type nonrec urns = urn list [@@ocaml.doc ""]

type nonrec upload_status =
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec upload_id = string [@@ocaml.doc ""]

type nonrec upload_entity_definitions_response = {
  upload_id : upload_id;
      [@ocaml.doc
        "The ID that specifies the upload action. You can use this to track the status of the \
         upload.\n"]
}
[@@ocaml.doc ""]

type nonrec definition_language = GRAPHQL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec definition_text = string [@@ocaml.doc ""]

type nonrec definition_document = {
  text : definition_text; [@ocaml.doc "The GraphQL text that defines the entity.\n"]
  language : definition_language;
      [@ocaml.doc "The language used to define the entity. [GRAPHQL] is the only valid value.\n"]
}
[@@ocaml.doc "A document that defines an entity. \n"]

type nonrec sync_with_public_namespace = bool [@@ocaml.doc ""]

type nonrec deprecate_existing_entities = bool [@@ocaml.doc ""]

type nonrec upload_entity_definitions_request = {
  deprecate_existing_entities : deprecate_existing_entities option;
      [@ocaml.doc
        "A Boolean that specifies whether to deprecate all entities in the latest version before \
         uploading the new [DefinitionDocument]. If set to [true], the upload will create a new \
         namespace version.\n"]
  sync_with_public_namespace : sync_with_public_namespace option;
      [@ocaml.doc
        "A Boolean that specifies whether to synchronize with the latest version of the public \
         namespace. If set to [true], the upload will create a new namespace version.\n"]
  document : definition_document option;
      [@ocaml.doc "The [DefinitionDocument] that defines the updated entities.\n"]
}
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec throttling_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "\n"]

type nonrec invalid_request_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "\n"]

type nonrec internal_failure_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "\n"]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec system_template_summary = {
  created_at : timestamp option; [@ocaml.doc "The date when the system was created.\n"]
  revision_number : version option; [@ocaml.doc "The revision number of the system.\n"]
  arn : arn option; [@ocaml.doc "The ARN of the system.\n"]
  id : urn option; [@ocaml.doc "The ID of the system.\n"]
}
[@@ocaml.doc "An object that contains information about a system.\n"]

type nonrec update_system_template_response = {
  summary : system_template_summary option;
      [@ocaml.doc "An object containing summary information about the updated system.\n"]
}
[@@ocaml.doc ""]

type nonrec update_system_template_request = {
  compatible_namespace_version : version option;
      [@ocaml.doc
        "The version of the user's namespace. Defaults to the latest version of the user's \
         namespace.\n\n\
        \ If no value is specified, the latest version is used by default.\n\
        \ "]
  definition : definition_document;
      [@ocaml.doc "The [DefinitionDocument] that contains the updated system definition.\n"]
  id : urn;
      [@ocaml.doc
        "The ID of the system to be updated.\n\n\
        \ The ID should be in the following format.\n\
        \ \n\
        \   [urn:tdm:REGION/ACCOUNT ID/default:system:SYSTEMNAME] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "\n"]

type nonrec flow_template_summary = {
  created_at : timestamp option; [@ocaml.doc "The date when the workflow was created.\n"]
  revision_number : version option; [@ocaml.doc "The revision number of the workflow.\n"]
  arn : arn option; [@ocaml.doc "The ARN of the workflow.\n"]
  id : urn option; [@ocaml.doc "The ID of the workflow.\n"]
}
[@@ocaml.doc "An object that contains summary information about a workflow.\n"]

type nonrec update_flow_template_response = {
  summary : flow_template_summary option;
      [@ocaml.doc "An object containing summary information about the updated workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec update_flow_template_request = {
  compatible_namespace_version : version option;
      [@ocaml.doc
        "The version of the user's namespace.\n\n\
        \ If no value is specified, the latest version is used by default. Use the \
         [GetFlowTemplateRevisions] if you want to find earlier revisions of the flow to update.\n\
        \ "]
  definition : definition_document;
      [@ocaml.doc "The [DefinitionDocument] that contains the updated workflow definition.\n"]
  id : urn;
      [@ocaml.doc
        "The ID of the workflow to be updated.\n\n\
        \ The ID should be in the following format.\n\
        \ \n\
        \   [urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list;
      [@ocaml.doc
        "A list of tag key names to remove from the resource. You don't specify the value. Both \
         the key and its associated value are removed. \n\n\
        \ This parameter to the API requires a JSON text string argument. For information on how \
         to format a JSON parameter for the various command line tool environments, see \
         {{:https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters.html#cli-using-param-json}Using \
         JSON for Parameters} in the {i AWS CLI User Guide}. \n\
        \ "]
  resource_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource whose tags are to be removed.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_already_exists_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "\n"]

type nonrec system_instance_deployment_status =
  | DELETED_IN_TARGET [@ocaml.doc ""]
  | PENDING_DELETE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | UNDEPLOY_IN_PROGRESS [@ocaml.doc ""]
  | DEPLOYED_IN_TARGET [@ocaml.doc ""]
  | DEPLOY_IN_PROGRESS [@ocaml.doc ""]
  | BOOTSTRAP [@ocaml.doc ""]
  | NOT_DEPLOYED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_target = CLOUD [@ocaml.doc ""] | GREENGRASS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec group_name = string [@@ocaml.doc ""]

type nonrec greengrass_group_id = string [@@ocaml.doc ""]

type nonrec greengrass_group_version_id = string [@@ocaml.doc ""]

type nonrec system_instance_summary = {
  greengrass_group_version_id : greengrass_group_version_id option;
      [@ocaml.doc "The version of the Greengrass group where the system instance is deployed.\n"]
  greengrass_group_id : greengrass_group_id option;
      [@ocaml.doc "The ID of the Greengrass group where the system instance is deployed.\n"]
  updated_at : timestamp option;
      [@ocaml.doc " The date and time when the system instance was last updated.\n"]
  created_at : timestamp option; [@ocaml.doc "The date when the system instance was created.\n"]
  greengrass_group_name : group_name option;
      [@ocaml.doc "The ID of the Greengrass group where the system instance is deployed.\n"]
  target : deployment_target option; [@ocaml.doc "The target of the system instance.\n"]
  status : system_instance_deployment_status option;
      [@ocaml.doc "The status of the system instance.\n"]
  arn : arn option; [@ocaml.doc "The ARN of the system instance.\n"]
  id : urn option; [@ocaml.doc "The ID of the system instance.\n"]
}
[@@ocaml.doc "An object that contains summary information about a system instance.\n"]

type nonrec undeploy_system_instance_response = {
  summary : system_instance_summary option;
      [@ocaml.doc
        "An object that contains summary information about the system instance that was removed \
         from its target.\n"]
}
[@@ocaml.doc ""]

type nonrec undeploy_system_instance_request = {
  id : urn option; [@ocaml.doc "The ID of the system instance to remove from its target.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_in_use_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "\n"]

type nonrec thing_arn = string [@@ocaml.doc ""]

type nonrec thing_name = string [@@ocaml.doc ""]

type nonrec thing = {
  thing_name : thing_name option; [@ocaml.doc "The name of the thing.\n"]
  thing_arn : thing_arn option; [@ocaml.doc "The ARN of the thing.\n"]
}
[@@ocaml.doc "An AWS IoT thing.\n"]

type nonrec things = thing list [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value;
      [@ocaml.doc
        "The optional value of the tag. The string value can be from 1 to 256 Unicode characters \
         in length.\n"]
  key : tag_key;
      [@ocaml.doc
        "The required name of the tag. The string value can be from 1 to 128 Unicode characters in \
         length.\n"]
}
[@@ocaml.doc
  "Metadata assigned to an AWS IoT Things Graph resource consisting of a key-value pair.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list; [@ocaml.doc "A list of tags to add to the resource.>\n"]
  resource_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource whose tags are returned.\n"]
}
[@@ocaml.doc ""]

type nonrec system_template_summaries = system_template_summary list [@@ocaml.doc ""]

type nonrec system_template_filter_name = FLOW_TEMPLATE_ID [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec system_template_filter_value = string [@@ocaml.doc ""]

type nonrec system_template_filter_values = system_template_filter_value list [@@ocaml.doc ""]

type nonrec system_template_filter = {
  value : system_template_filter_values;
      [@ocaml.doc
        "An array of string values for the search filter field. Multiple values function as AND \
         criteria in the search.\n"]
  name : system_template_filter_name; [@ocaml.doc "The name of the system search filter field.\n"]
}
[@@ocaml.doc "An object that filters a system search.\n"]

type nonrec system_template_filters = system_template_filter list [@@ocaml.doc ""]

type nonrec system_template_description = {
  validated_namespace_version : version option;
      [@ocaml.doc
        "The namespace version against which the system was validated. Use this value in your \
         system instance.\n"]
  definition : definition_document option; [@ocaml.doc "The definition document of a system.\n"]
  summary : system_template_summary option;
      [@ocaml.doc "An object that contains summary information about a system.\n"]
}
[@@ocaml.doc "An object that contains a system's definition document and summary information.\n"]

type nonrec system_instance_summaries = system_instance_summary list [@@ocaml.doc ""]

type nonrec system_instance_filter_name =
  | GREENGRASS_GROUP_NAME [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
  | SYSTEM_TEMPLATE_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec system_instance_filter_value = string [@@ocaml.doc ""]

type nonrec system_instance_filter_values = system_instance_filter_value list [@@ocaml.doc ""]

type nonrec system_instance_filter = {
  value : system_instance_filter_values option;
      [@ocaml.doc
        "An array of string values for the search filter field. Multiple values function as AND \
         criteria in the search. \n"]
  name : system_instance_filter_name option; [@ocaml.doc "The name of the search filter field.\n"]
}
[@@ocaml.doc
  "An object that filters a system instance search. Multiple filters function as OR criteria in \
   the search. For example a search that includes a GREENGRASS_GROUP_NAME and a STATUS filter \
   searches for system instances in the specified Greengrass group that have the specified status.\n"]

type nonrec system_instance_filters = system_instance_filter list [@@ocaml.doc ""]

type nonrec s3_bucket_name = string [@@ocaml.doc ""]

type nonrec enabled = bool [@@ocaml.doc ""]

type nonrec role_arn = string [@@ocaml.doc ""]

type nonrec metrics_configuration = {
  metric_rule_role_arn : role_arn option;
      [@ocaml.doc "The ARN of the role that is used to collect cloud metrics.\n"]
  cloud_metric_enabled : enabled option;
      [@ocaml.doc "A Boolean that specifies whether cloud metrics are collected.\n"]
}
[@@ocaml.doc
  "An object that specifies whether cloud metrics are collected in a deployment and, if so, what \
   role is used to collect metrics.\n"]

type nonrec dependency_revision = {
  revision_number : version option; [@ocaml.doc "The revision number of the workflow or system.\n"]
  id : urn option; [@ocaml.doc "The ID of the workflow or system.\n"]
}
[@@ocaml.doc
  "An object that contains the ID and revision number of a workflow or system that is part of a \
   deployment.\n"]

type nonrec dependency_revisions = dependency_revision list [@@ocaml.doc ""]

type nonrec system_instance_description = {
  flow_actions_role_arn : role_arn option;
      [@ocaml.doc
        "The AWS Identity and Access Management (IAM) role that AWS IoT Things Graph assumes \
         during flow execution in a cloud deployment. This role must have read and write \
         permissionss to AWS Lambda and AWS IoT and to any other AWS services that the flow uses.\n"]
  validated_dependency_revisions : dependency_revisions option;
      [@ocaml.doc
        "A list of objects that contain all of the IDs and revision numbers of workflows and \
         systems that are used in a system instance.\n"]
  validated_namespace_version : version option;
      [@ocaml.doc
        "The version of the user's namespace against which the system instance was validated.\n"]
  metrics_configuration : metrics_configuration option; [@ocaml.doc ""]
  s3_bucket_name : s3_bucket_name option;
      [@ocaml.doc
        "The Amazon Simple Storage Service bucket where information about a system instance is \
         stored.\n"]
  definition : definition_document option; [@ocaml.doc ""]
  summary : system_instance_summary option;
      [@ocaml.doc "An object that contains summary information about a system instance.\n"]
}
[@@ocaml.doc "An object that contains a system instance definition and summary information.\n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec string_list = string_ list [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec search_things_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The string to specify as [nextToken] when you request the next page of results.\n"]
  things : things option; [@ocaml.doc "An array of things in the result set.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec search_things_request = {
  namespace_version : version option;
      [@ocaml.doc
        "The version of the user's namespace. Defaults to the latest version of the user's \
         namespace.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The string that specifies the next page of results. Use this when you're paginating \
         results.\n"]
  entity_id : urn;
      [@ocaml.doc
        "The ID of the entity to which the things are associated.\n\n\
        \ The IDs should be in the following format.\n\
        \ \n\
        \   [urn:tdm:REGION/ACCOUNT ID/default:device:DEVICENAME] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec search_system_templates_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The string to specify as [nextToken] when you request the next page of results.\n"]
  summaries : system_template_summaries option;
      [@ocaml.doc
        "An array of objects that contain summary information about each system deployment in the \
         result set.\n"]
}
[@@ocaml.doc ""]

type nonrec search_system_templates_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The string that specifies the next page of results. Use this when you're paginating \
         results.\n"]
  filters : system_template_filters option;
      [@ocaml.doc
        "An array of filters that limit the result set. The only valid filter is [FLOW_TEMPLATE_ID].\n"]
}
[@@ocaml.doc ""]

type nonrec search_system_instances_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The string to specify as [nextToken] when you request the next page of results. \n"]
  summaries : system_instance_summaries option;
      [@ocaml.doc
        "An array of objects that contain summary data abour the system instances in the result set.\n"]
}
[@@ocaml.doc ""]

type nonrec search_system_instances_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The string that specifies the next page of results. Use this when you're paginating \
         results.\n"]
  filters : system_instance_filters option;
      [@ocaml.doc
        "Optional filter to apply to the search. Valid filters are [SYSTEM_TEMPLATE_ID], [STATUS], \
         and [GREENGRASS_GROUP_NAME].\n\n\
        \ Multiple filters function as OR criteria in the query. Multiple values passed inside the \
         filter function as AND criteria.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec flow_template_summaries = flow_template_summary list [@@ocaml.doc ""]

type nonrec search_flow_templates_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The string to specify as [nextToken] when you request the next page of results.\n"]
  summaries : flow_template_summaries option;
      [@ocaml.doc
        "An array of objects that contain summary information about each workflow in the result set.\n"]
}
[@@ocaml.doc ""]

type nonrec flow_template_filter_name = DEVICE_MODEL_ID [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec flow_template_filter_value = string [@@ocaml.doc ""]

type nonrec flow_template_filter_values = flow_template_filter_value list [@@ocaml.doc ""]

type nonrec flow_template_filter = {
  value : flow_template_filter_values;
      [@ocaml.doc
        "An array of string values for the search filter field. Multiple values function as AND \
         criteria in the search.\n"]
  name : flow_template_filter_name; [@ocaml.doc "The name of the search filter field.\n"]
}
[@@ocaml.doc "An object that filters a workflow search.\n"]

type nonrec flow_template_filters = flow_template_filter list [@@ocaml.doc ""]

type nonrec search_flow_templates_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The string that specifies the next page of results. Use this when you're paginating \
         results.\n"]
  filters : flow_template_filters option;
      [@ocaml.doc
        "An array of objects that limit the result set. The only valid filter is [DEVICE_MODEL_ID].\n"]
}
[@@ocaml.doc ""]

type nonrec flow_execution_id = string [@@ocaml.doc ""]

type nonrec flow_execution_status =
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | ABORTED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec flow_execution_summary = {
  updated_at : timestamp option;
      [@ocaml.doc "The date and time when the flow execution summary was last updated.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The date and time when the flow execution summary was created.\n"]
  flow_template_id : urn option; [@ocaml.doc "The ID of the flow.\n"]
  system_instance_id : urn option;
      [@ocaml.doc "The ID of the system instance that contains the flow.\n"]
  status : flow_execution_status option; [@ocaml.doc "The current status of the flow execution.\n"]
  flow_execution_id : flow_execution_id option; [@ocaml.doc "The ID of the flow execution.\n"]
}
[@@ocaml.doc "An object that contains summary information about a flow execution.\n"]

type nonrec flow_execution_summaries = flow_execution_summary list [@@ocaml.doc ""]

type nonrec search_flow_executions_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The string to specify as [nextToken] when you request the next page of results.\n"]
  summaries : flow_execution_summaries option;
      [@ocaml.doc
        "An array of objects that contain summary information about each workflow execution in the \
         result set.\n"]
}
[@@ocaml.doc ""]

type nonrec search_flow_executions_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The string that specifies the next page of results. Use this when you're paginating \
         results.\n"]
  end_time : timestamp option;
      [@ocaml.doc "The date and time of the latest flow execution to return.\n"]
  start_time : timestamp option;
      [@ocaml.doc "The date and time of the earliest flow execution to return.\n"]
  flow_execution_id : flow_execution_id option; [@ocaml.doc "The ID of a flow execution.\n"]
  system_instance_id : urn; [@ocaml.doc "The ID of the system instance that contains the flow.\n"]
}
[@@ocaml.doc ""]

type nonrec entity_type =
  | ENUM [@ocaml.doc ""]
  | MAPPING [@ocaml.doc ""]
  | PROPERTY [@ocaml.doc ""]
  | EVENT [@ocaml.doc ""]
  | ACTION [@ocaml.doc ""]
  | STATE [@ocaml.doc ""]
  | CAPABILITY [@ocaml.doc ""]
  | DEVICE_MODEL [@ocaml.doc ""]
  | SERVICE [@ocaml.doc ""]
  | DEVICE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec entity_description = {
  definition : definition_document option; [@ocaml.doc "The definition document of the entity.\n"]
  created_at : timestamp option; [@ocaml.doc "The time at which the entity was created.\n"]
  type_ : entity_type option; [@ocaml.doc "The entity type.\n"]
  arn : arn option; [@ocaml.doc "The entity ARN.\n"]
  id : urn option; [@ocaml.doc "The entity ID.\n"]
}
[@@ocaml.doc "Describes the properties of an entity.\n"]

type nonrec entity_descriptions = entity_description list [@@ocaml.doc ""]

type nonrec search_entities_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The string to specify as [nextToken] when you request the next page of results.\n"]
  descriptions : entity_descriptions option;
      [@ocaml.doc "An array of descriptions for each entity returned in the search result.\n"]
}
[@@ocaml.doc ""]

type nonrec entity_types = entity_type list [@@ocaml.doc ""]

type nonrec entity_filter_name =
  | REFERENCED_ENTITY_ID [@ocaml.doc ""]
  | SEMANTIC_TYPE_PATH [@ocaml.doc ""]
  | NAMESPACE [@ocaml.doc ""]
  | NAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec entity_filter_value = string [@@ocaml.doc ""]

type nonrec entity_filter_values = entity_filter_value list [@@ocaml.doc ""]

type nonrec entity_filter = {
  value : entity_filter_values option;
      [@ocaml.doc
        "An array of string values for the search filter field. Multiple values function as AND \
         criteria in the search.\n"]
  name : entity_filter_name option;
      [@ocaml.doc
        "The name of the entity search filter field. [REFERENCED_ENTITY_ID] filters on entities \
         that are used by the entity in the result set. For example, you can filter on the ID of a \
         property that is used in a state.\n"]
}
[@@ocaml.doc
  "An object that filters an entity search. Multiple filters function as OR criteria in the \
   search. For example a search that includes a [NAMESPACE] and a [REFERENCED_ENTITY_ID] filter \
   searches for entities in the specified namespace that use the entity specified by the value of \
   [REFERENCED_ENTITY_ID].\n"]

type nonrec entity_filters = entity_filter list [@@ocaml.doc ""]

type nonrec search_entities_request = {
  namespace_version : version option;
      [@ocaml.doc
        "The version of the user's namespace. Defaults to the latest version of the user's \
         namespace.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The string that specifies the next page of results. Use this when you're paginating \
         results.\n"]
  filters : entity_filters option;
      [@ocaml.doc
        "Optional filter to apply to the search. Valid filters are [NAME] [NAMESPACE], \
         [SEMANTIC_TYPE_PATH] and [REFERENCED_ENTITY_ID]. [REFERENCED_ENTITY_ID] filters on \
         entities that are used by the entity in the result set. For example, you can filter on \
         the ID of a property that is used in a state.\n\n\
        \ Multiple filters function as OR criteria in the query. Multiple values passed inside the \
         filter function as AND criteria.\n\
        \ "]
  entity_types : entity_types; [@ocaml.doc "The entity types for which to search.\n"]
}
[@@ocaml.doc ""]

type nonrec namespace_name = string [@@ocaml.doc ""]

type nonrec namespace_deletion_status_error_codes = VALIDATION_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec namespace_deletion_status =
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  next_token : next_token option;
      [@ocaml.doc "The token that specifies the next page of results to return.\n"]
  tags : tag_list option;
      [@ocaml.doc "List of tags returned by the [ListTagsForResource] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  next_token : next_token option;
      [@ocaml.doc "The token that specifies the next page of results to return.\n"]
  resource_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource whose tags are to be returned.\n"]
  max_results : max_results option; [@ocaml.doc "The maximum number of tags to return.\n"]
}
[@@ocaml.doc ""]

type nonrec flow_execution_message_id = string [@@ocaml.doc ""]

type nonrec flow_execution_event_type =
  | ACKNOWLEDGE_TASK_MESSAGE [@ocaml.doc ""]
  | THING_ACTION_TASK_SUCCEEDED [@ocaml.doc ""]
  | THING_ACTION_TASK_FAILED [@ocaml.doc ""]
  | THING_ACTION_TASK [@ocaml.doc ""]
  | SCHEDULE_NEXT_READY_STEPS_TASK [@ocaml.doc ""]
  | START_FLOW_EXECUTION_TASK [@ocaml.doc ""]
  | ACTIVITY_SUCCEEDED [@ocaml.doc ""]
  | ACTIVITY_FAILED [@ocaml.doc ""]
  | ACTIVITY_STARTED [@ocaml.doc ""]
  | ACTIVITY_SCHEDULED [@ocaml.doc ""]
  | STEP_SUCCEEDED [@ocaml.doc ""]
  | STEP_FAILED [@ocaml.doc ""]
  | STEP_STARTED [@ocaml.doc ""]
  | EXECUTION_SUCCEEDED [@ocaml.doc ""]
  | EXECUTION_ABORTED [@ocaml.doc ""]
  | EXECUTION_FAILED [@ocaml.doc ""]
  | EXECUTION_STARTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec flow_execution_message_payload = string [@@ocaml.doc ""]

type nonrec flow_execution_message = {
  payload : flow_execution_message_payload option;
      [@ocaml.doc "A string containing information about the flow event.\n"]
  timestamp : timestamp option;
      [@ocaml.doc "The date and time when the message was last updated.\n"]
  event_type : flow_execution_event_type option; [@ocaml.doc "The type of flow event .\n"]
  message_id : flow_execution_message_id option;
      [@ocaml.doc "The unique identifier of the message.\n"]
}
[@@ocaml.doc "An object that contains information about a flow event.\n"]

type nonrec flow_execution_messages = flow_execution_message list [@@ocaml.doc ""]

type nonrec list_flow_execution_messages_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The string to specify as [nextToken] when you request the next page of results. \n"]
  messages : flow_execution_messages option;
      [@ocaml.doc
        "A list of objects that contain information about events in the specified flow execution.\n"]
}
[@@ocaml.doc ""]

type nonrec list_flow_execution_messages_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The string that specifies the next page of results. Use this when you're paginating \
         results.\n"]
  flow_execution_id : flow_execution_id; [@ocaml.doc "The ID of the flow execution.\n"]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "\n"]

type nonrec get_upload_status_response = {
  created_date : timestamp; [@ocaml.doc "The date at which the upload was created.\n"]
  failure_reason : string_list option; [@ocaml.doc "The reason for an upload failure.\n"]
  namespace_version : version option;
      [@ocaml.doc
        "The version of the user's namespace. Defaults to the latest version of the user's \
         namespace.\n"]
  namespace_name : namespace_name option; [@ocaml.doc "The name of the upload's namespace.\n"]
  namespace_arn : arn option; [@ocaml.doc "The ARN of the upload.\n"]
  upload_status : upload_status;
      [@ocaml.doc
        "The status of the upload. The initial status is [IN_PROGRESS]. The response show all \
         validation failures if the upload fails.\n"]
  upload_id : upload_id; [@ocaml.doc "The ID of the upload.\n"]
}
[@@ocaml.doc ""]

type nonrec get_upload_status_request = {
  upload_id : upload_id;
      [@ocaml.doc
        "The ID of the upload. This value is returned by the [UploadEntityDefinitions] action.\n"]
}
[@@ocaml.doc ""]

type nonrec get_system_template_revisions_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The string to specify as [nextToken] when you request the next page of results. \n"]
  summaries : system_template_summaries option;
      [@ocaml.doc
        "An array of objects that contain summary data about the system template revisions.\n"]
}
[@@ocaml.doc ""]

type nonrec get_system_template_revisions_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The string that specifies the next page of results. Use this when you're paginating \
         results.\n"]
  id : urn;
      [@ocaml.doc
        "The ID of the system template.\n\n\
        \ The ID should be in the following format.\n\
        \ \n\
        \   [urn:tdm:REGION/ACCOUNT ID/default:system:SYSTEMNAME] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_system_template_response = {
  description : system_template_description option;
      [@ocaml.doc "An object that contains summary data about the system.\n"]
}
[@@ocaml.doc ""]

type nonrec get_system_template_request = {
  revision_number : version option;
      [@ocaml.doc "The number that specifies the revision of the system to get.\n"]
  id : urn;
      [@ocaml.doc
        "The ID of the system to get. This ID must be in the user's namespace.\n\n\
        \ The ID should be in the following format.\n\
        \ \n\
        \   [urn:tdm:REGION/ACCOUNT ID/default:system:SYSTEMNAME] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_system_instance_response = {
  description : system_instance_description option;
      [@ocaml.doc "An object that describes the system instance.\n"]
}
[@@ocaml.doc ""]

type nonrec get_system_instance_request = {
  id : urn;
      [@ocaml.doc
        "The ID of the system deployment instance. This value is returned by \
         [CreateSystemInstance].\n\n\
        \ The ID should be in the following format.\n\
        \ \n\
        \   [urn:tdm:REGION/ACCOUNT ID/default:deployment:DEPLOYMENTNAME] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_namespace_deletion_status_response = {
  error_message : string_ option;
      [@ocaml.doc "An error code returned by the namespace deletion task.\n"]
  error_code : namespace_deletion_status_error_codes option;
      [@ocaml.doc "An error code returned by the namespace deletion task.\n"]
  status : namespace_deletion_status option; [@ocaml.doc "The status of the deletion request.\n"]
  namespace_name : namespace_name option;
      [@ocaml.doc "The name of the namespace that is being deleted.\n"]
  namespace_arn : arn option; [@ocaml.doc "The ARN of the namespace that is being deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec get_namespace_deletion_status_request = unit [@@ocaml.doc ""]

type nonrec get_flow_template_revisions_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The string to specify as [nextToken] when you request the next page of results.\n"]
  summaries : flow_template_summaries option;
      [@ocaml.doc "An array of objects that provide summary data about each revision.\n"]
}
[@@ocaml.doc ""]

type nonrec get_flow_template_revisions_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The string that specifies the next page of results. Use this when you're paginating \
         results.\n"]
  id : urn;
      [@ocaml.doc
        "The ID of the workflow.\n\n\
        \ The ID should be in the following format.\n\
        \ \n\
        \   [urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec flow_template_description = {
  validated_namespace_version : version option;
      [@ocaml.doc
        "The version of the user's namespace against which the workflow was validated. Use this \
         value in your system instance.\n"]
  definition : definition_document option; [@ocaml.doc "A workflow's definition document.\n"]
  summary : flow_template_summary option;
      [@ocaml.doc "An object that contains summary information about a workflow.\n"]
}
[@@ocaml.doc "An object that contains a workflow's definition and summary information.\n"]

type nonrec get_flow_template_response = {
  description : flow_template_description option;
      [@ocaml.doc "The object that describes the specified workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec get_flow_template_request = {
  revision_number : version option;
      [@ocaml.doc "The number of the workflow revision to retrieve.\n"]
  id : urn;
      [@ocaml.doc
        "The ID of the workflow.\n\n\
        \ The ID should be in the following format.\n\
        \ \n\
        \   [urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_entities_response = {
  descriptions : entity_descriptions option;
      [@ocaml.doc "An array of descriptions for the specified entities.\n"]
}
[@@ocaml.doc ""]

type nonrec get_entities_request = {
  namespace_version : version option;
      [@ocaml.doc
        "The version of the user's namespace. Defaults to the latest version of the user's \
         namespace.\n"]
  ids : urns;
      [@ocaml.doc
        "An array of entity IDs.\n\n\
        \ The IDs should be in the following format.\n\
        \ \n\
        \   [urn:tdm:REGION/ACCOUNT ID/default:device:DEVICENAME] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec dissociate_entity_from_thing_response = unit [@@ocaml.doc ""]

type nonrec dissociate_entity_from_thing_request = {
  entity_type : entity_type; [@ocaml.doc "The entity type from which to disassociate the thing.\n"]
  thing_name : thing_name; [@ocaml.doc "The name of the thing to disassociate.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_namespace_response = {
  namespace_version : version option;
      [@ocaml.doc "The version of the user's namespace to describe.\n"]
  tracking_namespace_version : version option;
      [@ocaml.doc "The version of the public namespace that the latest version is tracking.\n"]
  tracking_namespace_name : namespace_name option;
      [@ocaml.doc
        "The name of the public namespace that the latest namespace version is tracking.\n"]
  namespace_name : namespace_name option; [@ocaml.doc "The name of the namespace.\n"]
  namespace_arn : arn option; [@ocaml.doc "The ARN of the namespace.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_namespace_request = {
  namespace_name : namespace_name option;
      [@ocaml.doc
        "The name of the user's namespace. Set this to [aws] to get the public namespace.\n"]
}
[@@ocaml.doc ""]

type nonrec deprecate_system_template_response = unit [@@ocaml.doc ""]

type nonrec deprecate_system_template_request = {
  id : urn;
      [@ocaml.doc
        "The ID of the system to delete.\n\n\
        \ The ID should be in the following format.\n\
        \ \n\
        \   [urn:tdm:REGION/ACCOUNT ID/default:system:SYSTEMNAME] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec deprecate_flow_template_response = unit [@@ocaml.doc ""]

type nonrec deprecate_flow_template_request = {
  id : urn;
      [@ocaml.doc
        "The ID of the workflow to be deleted.\n\n\
        \ The ID should be in the following format.\n\
        \ \n\
        \   [urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec greengrass_deployment_id = string [@@ocaml.doc ""]

type nonrec deploy_system_instance_response = {
  greengrass_deployment_id : greengrass_deployment_id option;
      [@ocaml.doc "The ID of the Greengrass deployment used to deploy the system instance.\n"]
  summary : system_instance_summary;
      [@ocaml.doc
        "An object that contains summary information about a system instance that was deployed. \n"]
}
[@@ocaml.doc ""]

type nonrec deploy_system_instance_request = {
  id : urn option;
      [@ocaml.doc
        "The ID of the system instance. This value is returned by the [CreateSystemInstance] \
         action.\n\n\
        \ The ID should be in the following format.\n\
        \ \n\
        \   [urn:tdm:REGION/ACCOUNT ID/default:deployment:DEPLOYMENTNAME] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_system_template_response = unit [@@ocaml.doc ""]

type nonrec delete_system_template_request = {
  id : urn;
      [@ocaml.doc
        "The ID of the system to be deleted.\n\n\
        \ The ID should be in the following format.\n\
        \ \n\
        \   [urn:tdm:REGION/ACCOUNT ID/default:system:SYSTEMNAME] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_system_instance_response = unit [@@ocaml.doc ""]

type nonrec delete_system_instance_request = {
  id : urn option; [@ocaml.doc "The ID of the system instance to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_namespace_response = {
  namespace_name : namespace_name option; [@ocaml.doc "The name of the namespace to be deleted.\n"]
  namespace_arn : arn option; [@ocaml.doc "The ARN of the namespace to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_namespace_request = unit [@@ocaml.doc ""]

type nonrec delete_flow_template_response = unit [@@ocaml.doc ""]

type nonrec delete_flow_template_request = {
  id : urn;
      [@ocaml.doc
        "The ID of the workflow to be deleted.\n\n\
        \ The ID should be in the following format.\n\
        \ \n\
        \   [urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_system_template_response = {
  summary : system_template_summary option;
      [@ocaml.doc "The summary object that describes the created system.\n"]
}
[@@ocaml.doc ""]

type nonrec create_system_template_request = {
  compatible_namespace_version : version option;
      [@ocaml.doc
        "The namespace version in which the system is to be created.\n\n\
        \ If no value is specified, the latest version is used by default.\n\
        \ "]
  definition : definition_document;
      [@ocaml.doc "The [DefinitionDocument] used to create the system.\n"]
}
[@@ocaml.doc ""]

type nonrec create_system_instance_response = {
  summary : system_instance_summary option;
      [@ocaml.doc "The summary object that describes the new system instance.\n"]
}
[@@ocaml.doc ""]

type nonrec create_system_instance_request = {
  flow_actions_role_arn : role_arn option;
      [@ocaml.doc
        "The ARN of the IAM role that AWS IoT Things Graph will assume when it executes the flow. \
         This role must have read and write access to AWS Lambda and AWS IoT and any other AWS \
         services that the flow uses when it executes. This value is required if the value of the \
         [target] parameter is [CLOUD].\n"]
  metrics_configuration : metrics_configuration option; [@ocaml.doc ""]
  s3_bucket_name : s3_bucket_name option;
      [@ocaml.doc
        "The name of the Amazon Simple Storage Service bucket that will be used to store and \
         deploy the system instance's resource file. This value is required if the value of the \
         [target] parameter is [GREENGRASS].\n"]
  greengrass_group_name : group_name option;
      [@ocaml.doc
        "The name of the Greengrass group where the system instance will be deployed. This value \
         is required if the value of the [target] parameter is [GREENGRASS].\n"]
  target : deployment_target;
      [@ocaml.doc "The target type of the deployment. Valid values are [GREENGRASS] and [CLOUD].\n"]
  definition : definition_document; [@ocaml.doc ""]
  tags : tag_list option;
      [@ocaml.doc
        "Metadata, consisting of key-value pairs, that can be used to categorize your system \
         instances.\n"]
}
[@@ocaml.doc ""]

type nonrec create_flow_template_response = {
  summary : flow_template_summary option;
      [@ocaml.doc "The summary object that describes the created workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec create_flow_template_request = {
  compatible_namespace_version : version option;
      [@ocaml.doc
        "The namespace version in which the workflow is to be created.\n\n\
        \ If no value is specified, the latest version is used by default.\n\
        \ "]
  definition : definition_document; [@ocaml.doc "The workflow [DefinitionDocument].\n"]
}
[@@ocaml.doc ""]

type nonrec associate_entity_to_thing_response = unit [@@ocaml.doc ""]

type nonrec associate_entity_to_thing_request = {
  namespace_version : version option;
      [@ocaml.doc
        "The version of the user's namespace. Defaults to the latest version of the user's \
         namespace.\n"]
  entity_id : urn;
      [@ocaml.doc
        "The ID of the device to be associated with the thing.\n\n\
        \ The ID should be in the following format.\n\
        \ \n\
        \   [urn:tdm:REGION/ACCOUNT ID/default:device:DEVICENAME] \n\
        \  "]
  thing_name : thing_name;
      [@ocaml.doc "The name of the thing to which the entity is to be associated.\n"]
}
[@@ocaml.doc ""]
